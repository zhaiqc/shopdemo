import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shop/root/detail/DetailPage.dart';
import 'package:shop/root/home/HomeViewModel.dart';
import 'package:shop/root/home/shopx_entity.dart';
import 'package:shop/utils/AlertView.dart';
import 'package:shop/utils/AppConfig.dart';
import 'package:shop/utils/provider/ViewModelProvider.dart';

import '../../utils/AppConfig.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2d_amap/flutter_2d_amap.dart';

import '../shop_list/ShopListPage.dart';
import 'model/banner_bean_entity.dart';
import 'model/category_bean_entity.dart';
import 'model/shop_detail_entity.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PoiSearch> _list = [];
  int _index = 0;
  ScrollController _controller = new ScrollController();
  AMap2DController _aMap2DController;
  HomeViewModel _viewModel;
  CategoryBeanEntity _entity;
  int shopPage =1;
  int limit =6;

  @override
  void initState() {
    _viewModel = ViewModelProvider.of(context);
    _viewModel.init(context);

    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConfig.build_appBar(context, () {}),
      body: CustomScrollView(
        slivers: [
          new SliverList(
            delegate: new SliverChildListDelegate([
              new Container(
                child: Container(
                  width: 0,
                  height: 0,
                  child: map(),
                ),
              ),
            ]),
          ),

          ///banner
          new SliverList(
            delegate: new SliverChildListDelegate([
              new Container(
                child: FutureBuilder(
                  future: _viewModel.getBanner(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {

                      return header(snapshot.data);
                    } else {



                      return Container();
                    }
                  },
                ),
              ),
            ]),
          ),

          ///分类
          new SliverPadding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
            sliver: FutureBuilder(
              future: _viewModel.getCategory(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  print(snapshot);
                  return SliverGrid(
                    delegate: new SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return _selectSortViewCell(snapshot.data, index);
                      },
                      childCount: snapshot.data.data.length,
                    ),
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 0.0,
                      crossAxisSpacing: AppConfig.logic_width(35.0),
                    ),
                  );
                } else {

                  return SliverGrid(
                    delegate: new SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Container();
                      },
                      childCount: 0,
                    ),
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 0.0,
                      crossAxisSpacing: AppConfig.logic_width(35.0),
                    ),
                  );
                }
              },
            ),
//            sliver: SliverGrid(
//              delegate: new SliverChildBuilderDelegate((BuildContext context,int index){
//                return _selectSortViewCell(index);
//              },
//                childCount:3,
//              ),
//              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 3,
//                mainAxisSpacing: 0.0,
//                crossAxisSpacing: AppConfig.logic_width(35.0),
//              ),
//            ),
          ),

          ///商品
          FutureBuilder(
            future: _viewModel.getCategory(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if (snapshot.connectionState == ConnectionState.done) {
                  return  new SliverList(
                    delegate: new SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return shops(snapshot.data,index);
                      },
                      childCount: snapshot.data.data.length,
                    ),
                  );
                }else{


                  return  new SliverList(
                    delegate: new SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return shops( snapshot.data,index);
                      },
                      childCount: 0,
                    ),
                  );
                }

              }
          ),


          ///推荐
          SliverList(
            delegate: SliverChildListDelegate([
              new Container(
                height: AppConfig.logic_width(80.0),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                child: new Row(
                  children: <Widget>[
                    new Container(
//                  height: AppConfig.logic_width(30.0),
//                  width: AppConfig.logic_width(6.0),
//                    color: AppConfig.widgetColor,
                        ),
                    new Container(
                      padding: const EdgeInsets.only(left: 5.0),
                      alignment: Alignment.centerLeft,
                      child: new Text(
                        "种草",
                        style: AppConfig.normalTextStyle(
                            AppConfig.fontDarkColor, AppConfig.font_midSize),
                      ),
                    ),
                    new Expanded(child: new Container()),
                    new Container(
                      child: new GestureDetector(
                        onTap: () {
                          ///分类点击事件
                        },
                        child: new Row(
                          children: <Widget>[
                            new Text("更多",
                                style: AppConfig.normalTextStyle(
                                    AppConfig.fontDarkColor,
                                    AppConfig.font_smallSize)),
                            new Icon(
                              Icons.chevron_right,
                              size: AppConfig.font_bigSize,
//                          color: AppConfig.widgetColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: AppConfig.logic_width(300) * 7.5,
                child: StaggeredGridView.countBuilder(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) =>
                      new Container(
                          child: new Center(
                    child: Stack(
                      children: [
                        Container(
                          decoration: new BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
//                            image: Image.network(""),
                              image: NetworkImage(
                                "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxITEhUTEhIVFRUVGBUXFRcXFxUXFRUYFRcWFxcXFRUYHSggGBolGxUVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGBAQFy0dHx0rLS0rLS0rLS0vLS0tLS0tLS0tLS0tLSstLS0tKy0tLS0rLS0tKy0tLy0tLS0tLS0tLf/AABEIAQMAwgMBIgACEQEDEQH/xAAcAAACAwEBAQEAAAAAAAAAAAAAAQIDBAUGBwj/xAA/EAABAwIEAwUFBAgGAwAAAAABAAIRAyEEEjFBBVFhBiJxgZETMqGx8JLB0eEHI0JSYoKi8RQVM1NyspOjw//EABkBAQEBAQEBAAAAAAAAAAAAAAABAgMEBf/EACYRAQEAAgICAgIABwAAAAAAAAABAhEDIRIxBEETYQUiUXGRocH/2gAMAwEAAhEDEQA/APmmJwNWmzNVpvaSZuI1FpvIM8wruzWM/wAPWZiA3O6k4Oa3RrrEEEi41nSLL0naTG0K0OY+SQQ5pBAPmYC8nwtmRxe4wG2P8UiC0EHWCuUzlWPoPDuNNx1XEEhrGwKpbaXMY147/eGcMOV5m9hyXzrE0MsGHFrpyuIjPG456hJ9bI9xp90GQBM912zudlW+u52XM4nKIbN4EzA6SStrW6ljC21MljXtY2oBEmCCXB2xkAhXVOHObSD87RTe4Q3MM5ILmtJb6mRIgrns911rmIk8jNgptxOQ5iwOdlhua7WgyCcu+tuRTaaWcUvkIpNplrAx2QnvuYXAvcDo87+C58rTUxLiMpNrGBzAiT1WYooKSFJrUQNnTmgW8lo9jYHaLrKgv/xBIOYydiblVNNtfDxUW6pkICUBqbWzuAooAFMpmmYmDGkwYnlPNRzbbILQ/n4eChlXQ4lw9jWMq0amem85QHQKrXgAuD2Dbkd1nZWY1osS7fkPzQV0XbLblYxnebJIm+iy1LCQdelo8VS5xOpRA4ibBTYBDgRcxBO0aquCtXs6fspLhnJ0vIA+EH7lYqn2bf32/H8EKlCg6OKYGklxzESBy6RzVWHqCMrgY+R5hUvJd5fNPD5gZAXPx6WdPQYzCUH02kNbTge82xI2zSYK51Lg5c2WuB8jt4rNUdUico8egsLcgp4fH15hpLjygHTpHJc5jySdZLuKTSADgXCWkDnPOEqIbFzouqztNULC14a5sQBlaRPUOmy42JeC4kNyzsNPJdZu+4b/AEbjvpt9yqjZSuVJzY31Hp0W0tVJhyRQiNp4h+q9mGgGTLtyOXRYx4KKaAlMxNkkIAhNKU4QbMLWc6maPfeXub7NgJyh5IGbLu4ju+ajjeGVqTzTqsLHBxYZ0DhBIzaWDh6qrBYl1Koyqww9jg5piYIMix1UsVinVXufUeXPcS5xO5OpQQLQHEF1gT3m3BI0I0srKNMagyVBzAADzVcjkgb2RqpU6Ym+ikwnSJVb3cvz8EFjo2UGkciVXKlKCwln7rvUfghUyhBqZTMeO3h1VuHc0DvAgc5t+SeD4k9jpaJJGU2mxj8Au7jMNTqfrMPq67qdr87bGeVisX0rg4rEPZ3W1AWndtj4FZBsRIP3q3FupuINNpb+8DoDzH4KzAUy6QByvuArOojG4pLdj6TAYBvz5rFlWoAyI9Qh7iTJ1Oq0YjESxrB+z96zIAlCGq6uQSSGZAQIF/UTzQUoQhAJgKKnAiZvOnTnKBAIypK6oyHEEOBGx1QVxBuNNVEBSIKGvQRUgbJ6bJTKCx+JcRlsBvG/iVXTN+iTgpNpmJt6hBe1lM/tR4gqD6I2IPgoGmOYUCBzREvZFCMh6oRQwnYwt9drwwFpsJsBds3udY01XPYVc2vExIB94dFmqoP911Gu9kz+I/AKvidX2tT2jnUw50SGNyABoAByi1wNllr15IIJn5coVRVUfJUqDwDJmIIsYVZKFRfQqs9oHVGkskZg0wY6E7oxZYXu9k1waT3Q4guA2k7lUK2lViY3kGwNjrE7oK3sgxbyuhzyYkkwIE7AbDopVi2e6CB1181BBOGwLmbza07AKtNxlTosBIBMIIKbCRcK2rSYNHz4SVVI1BQL2dpVrqdpJupmo3JEd6Zmdo0j71Q+pKCM8ypNaDuoIhBPKR1SKQBSQCn7RQQgbmqQZuVNjIuUyM1ifBBIYgJKghJBbh6LnODGiSTACsxGFeww8REqRxL21faDuu1EdQtFfjNWpaoQR1a0keCI5xdp5q44buhwc02zOAIBbeIg6nTRVSMvUnSLDqDKrRTQhMlAkIQCgEITCBFCAE4QJWhwAG5UMqWVAw9RlCZQJSJGyikgcpucopoBEIRKBkqTX3UEIJ5UKCEGnFvBdI2VDloq4cBkkwdhum/GSxrC1tpvFzPM7qDKD9fehrZRHJDQqIpq1rgRB8vrmg0xsmxSmgLs4LBN9k94DakRAnvNBF5G35KjjAKUCOs/BSOX60VZPooJWCSKYnQgp5UBMJR4JFNqAnqkpF3JKUCQhCBJoQgEJJoBCEIHKSEILX3vqkwW0Sa8zqmx11BbScQCLx0UTSBuE3PtCGzGbadtvFEUAXV1R9ssCdzzU2Rmn4dFNjxvf5JRkbTJuBawnaSncS0Hxg2P4rU6uSC1o9BZRpYfmCm1ZoMaL0/6MuGMxHEaLKglrA+rGzjTEtB6ZiD5LiVqmzQAF2Ox+IOExlHETZjoeJHuPBa74EnyVlR9y452XwmNYademM0ENqtAFVnVr9/AyDuF+fu1HZ6vgK7qFYdWPHu1WTAe37xqD6n9K16gID2mQbgrh9quA0OJUBSqktdTcHMqNjOy4DgJ2cLQbaHYKXkw8vHfa+N1t8Q7Ldj8Rje82KdEGDVeDEjUMaLvI8gNyF6Hi/6PqLKTjh61Z9ZoJAcKeR+W5aA0AtJExc3hfTa2Hp0abaVNoYxjQ1jRoANP7qvhuGGvNa3N6NXW35zBTWzjVHJia7AIDa1ZoHICo4D4QsagSaEkDlBKEIBCEIBCAEIBCEIABWMEXIsoAqQJNkFgeClUb5FSpYcrTUokiLc+SiMJO/RTD58FJzeag5FWtrxp8grDjD+8fQLM0oyyQGgkkgAAEkk2AAFySdkRbUql24+Cy1HAGCR6r7J2K/RMwNbW4iC55uKAdDGcvaubdzugMDS6+hMwGGoMy0qFJjRs1jWj4BMrMJ5ZXUWd9R4D9E/ahuIoHB1HfrKQ/Vkn36Ys0+LfdPTKea9dh35ahnYGfELj8X4JRfUbWp0206rDLXtAa4EdRqNiDYgkFajjQ4e0NiAQ8ciI+vRfA+X8rjz5MeTj94/7e/h4MvGy/aOOqlz108GRE8hdcvB4d9QyAYO8W9Uccq4loyUMNVc0e88Ad7o1szHWF3/hl5PLLPLdn/V5+OWzCXT5DxTs7jq+IrVRhnNFSpUeMxY2A5xLZBdMwQuVxfgWJw0e2pFodo6Q5pPKRofFfWsPxrv5KrHMdycC13o6CuhjcGzEUyx7Q5rhBG35L6s5NueXxZJ7fBELvdq+zFTBvmC6i49x/L+F/Xrv8FwV0l28lll1QhCEQIQhAIQiEAhCEEpVrHGLQFBw6afFQyoLr80gFWJUg5ETkSouYdPgk2p0UCUUOaQvpn6C+HUamJrVahaatFrfYsOvfzB9UA6kABttM55hfNC+0enROjVcxwcxzmPbdrmktc082uFwfBUfrhzCs1fDzuF+dKXb7igGUY2rA5im4x/yc0krLiO0vEMQQw4qs4uIa0B+TM5xgA5I1JGqzyY4546pLY/QlVtIEtLw5w1a27hOk8tFw8dwRtZ4a1vsw6SXBzs5LWuLJHuxMWhdLstwCnhMMyiwAkXqP3qVD7zyd5PoABsunh6Y9q0RzPwK+Nz/ABZx82GOE1LZv/L18XPljLd9vH1eEYiL1iT4Kijw7FtNnSpcE7cUnVq+HxZDHUq1VlOroxzWVHNAef2XADU2MbHX17MY0AEAOadHNuD4EWXXh/h+eOe/Pr+zpyfKy1q4+3lsQ+sW5MRR9qz4t6tIu09QsWHqCjUyZy5jhmYT70XBDtswIIPOx3Xs8XxeixhfVc2m0aueQ1o83ar5D2w7W06uJaaAIpsEB2mcuIJcG8rAXvYr6XJj1v7cvj8n82r6r3+Jw9OrTc14D2OEOaRIIXx/th2Wfg35my6g49127T+488+R38V9E7N8cFQAE3XocRhqdVjmva1zXCC0gEEciFnDJ05uL6r88IXv+0v6OnNJfhDmH+0494dGPOvgfUrwVak5ji17S1zTBa4EEHqCusrx5Y3H2ihCIRkIJQmyJE6bxrHRBFNIpoLGm6lUZyUQrtlEVNU3gKLoATpwbT9clRWVAhTqA6HZRlFIJwmQRaI8kZSgQC7HZBw/x2FzRHt6OvPOI+MLkBqsI5EtNoI1BFwQdig/VWDfISLw1xcbBrXEnkBqfRed7A9oBjMOKkj2je5WaNqgAkxsHDvDxjZc/wDSrx1uGwb6eb9biGmkwTfK61R/gG2nmQtXGXtHxN2PL6j6n+497/tuLvvWqliqrZNOpUp/8HuZP2SFx2m69JgsOHsBXDO+Pb3cG+SXF5/G16j3TVe+o4aOe5z3eriSo06i6PGMAWjMNN1y6bZW5ZZtwzwywz8Xo+CY0tcD15r6Vw7iZc0eC+UcPoEZSXZWk+8+zfEDV2mwK7NLtFkloFxGV0y194NgJbvf4bLn+PLfT1znw8NZe31ShUa6xvzXlu2vCqWIo1JAFeiJY/dzdcruYOnxXlHdrsULtyN5b272s+HwV+C4rWqF3tSHBwIcRAcBe4I5RMLr+PL6cLz8fqy6eNw2KLA6GtOYR3mgkdRyKpcLqzE4c03uYTJaSJGhjQjoRfzUHuFrAQIOt+pn7uS08pIQhQCEk0EgYVzDIPRZ02k7boG4qIKbhFkkASmCkgIJB06+v4plsfiNEnMhWU7iOSCuEgrHtuoFEdLgHH8Tg6hqYapkcRldIDmuGozNcIMbHUX5lZeK8TrYmoateo6pUdALnRoNAALNGtgALlUi+gUiyNR4oqpq9D2axV8h0K4UDYLRQrinpd39Lfx+V+iznj5TTtw8n48tvYcVpUww+0cACNzc+A1K8o3EtZam0OP7zhpp7rZjYiTNjss1ao95lzi49T4/n8VZRpgaj63+E/BXDjmK83PeS/0TaC85nkknUk3NrmT0g/ylaRS2yib+pt/2H9Stga2JGviJt55Xj+cKVOm7Qa6fIA26imfNdpHmW4fCBwnnOniIP/tHounw/Dw6SHCQTJ87AeErFhm5i1u5gAAc9JJ6Pb9ldvBlpIkgdJ5jnOgkDyK6Yxm14XjJ/X1P+R+FljW7jjMuIqj+I+hgj4FYV577bgQhCihCEIBCSZKAQhCACIQAmiJTZDHXSBQEFuINgqEySUiEUw48ymXHmohSmUBKsptVRN1axUamNG0fXP0/pPNXNaIHXTTpAPnlHkVnadvh9enqtNEM1k/lf4xmPmFuIuojSI2jmfdj/wCfqVfQv3ZgGwnrAE9f9I+ShSGawsdPMm/9T/6VqDmHUgTobmJ5DoKjD/IVuMmKTbdeciM0XnoKh/8AGt+Erwbm/WRB3vPM1PsBc32km8EG8XFjJPwdUHkrg+LEW3mbka3/AJavqtRHP7Y4aKjarR3ag1/ibz5SMtlwF7Wuxtem6iQATdptZw/akbSSI5SvFOaQSCIIkEciLELlyTV21jegkmhc2ghCEAhCEAmCkhA8yENUpRC2SCabAilmSLlZn2I/FDmBEVKYbaVBAKKFdQKpUqblRrfr+Hy+tlNj4+tb/f8AJJjZ1+un1ySI/v8AXotI2HENtck7201v43efIIZcyd5kctZg+b/shZGj6+75D1WujA573+fqA77a1EaWNJBk2GuttXECfCoraWGA2LuZiBY38R3anqlSaB1I2teJn/o/7S1MBkST8BJER11a37a3IzUqNEiBBkxLjvcz4nMT6Lg9pMEadYuHuv7wPX9oHrN/Nejbidmy47SeWhAAESMt/wCMqvHsNZjqbuuU8nDQ6mBNvAlXLHcSXVeLQkmvM6hCEIBCEIBCEwgJhASJTaUFkWVehVr9glXFxtZEJxUMyAUiUAhCEUICEKjVSqwrjVkrCCrKb1pG2nH0BvYXPiStdGq0a6SPTX/qwD+Zc1pdqNAYzbAkbnYwgVRuMx66fntc/uqyo62HxZzAMBdBEAXmIi3Ug/aVrKjti1kaXlxgAiwm/dbrAlpXKp1qjrNk9Bcag+GoC20cA83dDRzu4i/oty7StX+IbF5drvAtYe7qIyb7K2jiWtNgG3MaEgdDc6WsROqhT4fTAklx01+Ftl18FTYPcZG02HiJ5eW66SVi2PH9oKRFXMZ7/eu0tnaROq5q+hcVw7K7MjwBuxwN2nTTrPp6jwmPwbqTyx2oggjQg6ELjyYau28ctqJQhC5NhJNCBIQmgEApIQTmStFZnd8FmaYKk+qTqiIJJpIoTSTQJNCAgYKk62qRbH3KdKlmudFpFZcSVZSA3UnNAVcSg30+JFogAAfWqs/zJ33rnNpStFHBuMfXotS1OnTw+NJO0b2vrtG67vt8rCXECB1JM/LwXnqOFyzO31br+S2uYXsjafjHxXXG1nJlq8WcXWJj4mNL+anxKkK1IOH+ozTeW7g/Mfmn/k8iZgRNoM3jmtNPhzaTv9Q6AnS25TVvVTc+nlw0IXcfwjDkk+1cJJMBpgTsELj+LJvzjz6EIWGghCEAhCEAhCEAhCEAhCEAhJNAStVP3YCyq6jWLVqI0UsGStVLh5+X0Fnw+PM38lrOJJE6XW54s3awYRjdb+H4q6tXa0R/eL2/Nc+viyOnh8Fz6tclW5a9GnQr43l9eaqw/E3Mm9jr1XPWuhRAu4hYlrWmh+Pqv0n7lXWpV9XA+N/oK5mNYLAfX1810uHYtrjB5X/Fbmr7rN6+nnfZuTXtPZs/d+DUlv8AF+2fP9PDIQheZ1CEIQCEIQCEIQCEIQCEIQJCaEEmKKEKhtW+me6OqELWKM1RypdohCguwrRI+t1PGGEIV+hnYF0uG++PD5xKEJj7K9TRpgtBjYfJCEL0uT//2Q==",
                              ),
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25.0),
                                bottomRight: Radius.circular(25.0)),
                          ),
                        ),
                        index != 2
                            ? Positioned(
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: new BoxDecoration(
                                        //背景
                                        color: Colors.white,
                                        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(25.0),
                                            bottomRight: Radius.circular(25.0)),
                                        //设置四周边框
//                              border: new Border.all(width: 1, color: Colors.red),
                                      ),
                                      height: AppConfig.logic_width(150),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: AppConfig.logic_width(100),
                                            width: AppConfig.logic_width(400),
                                            padding: EdgeInsets.all(5),
                                            child: Text(
                                              "悉尼5天带娃亲子游~一起看世界吧........",
                                              softWrap: true,
                                              maxLines: 3,
                                              style: TextStyle(
                                                  fontSize:
                                                      AppConfig.logic_fontSize(
                                                          25)),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                new ClipOval(
                                                  child: new Image.network(
                                                    "http://static.caibeike.com/i/83f0eeea35ed3d6e9638be0f73c2797b-IzI0dN-bMOMwOOkhp1@!c300",
                                                    width:
                                                        AppConfig.logic_width(
                                                            30),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "小小源码",
                                                    style: TextStyle(
                                                        fontSize: AppConfig
                                                            .logic_fontSize(
                                                                25)),
                                                  ),
                                                ),
//                                Expanded(child: Container()),
                                                Container(
                                                  width: AppConfig.logic_width(
                                                      150),
                                                ),

                                                Container(
                                                  child: Icon(
                                                    Icons.favorite_border,
                                                    size: AppConfig
                                                        .logic_fontSize(25),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: AppConfig
                                                          .logic_fontSize(18)),
                                                  child: Text(
                                                    "1060",
                                                    style: TextStyle(
                                                        fontSize: AppConfig
                                                            .logic_fontSize(
                                                                25)),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                bottom: 0.5)
                            : Container(),
                      ],
                    ),
                  )),
                  staggeredTileBuilder: (int index) =>
                      new StaggeredTile.count(2, index == 2 ? 2.5 : 3),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  Widget header(BannerBeanEntity banner) {
    return Container(
      height: AppConfig.logic_width(350.0),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            banner.data[index].image,
            fit: BoxFit.fill,
          );
        },
        itemCount: banner.data.length,
        pagination: new SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                color: Colors.white, activeColor: Colors.red)),
      ),
    );
  }

  Widget shops(CategoryBeanEntity entity,int index) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(top: 5.0),
            height: 7.0,
            color: Colors.black12,
          ),
          new Container(
            height: AppConfig.logic_width(80.0),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
            child: new Row(
              children: <Widget>[
                new Container(
//                  height: AppConfig.logic_width(30.0),
//                  width: AppConfig.logic_width(6.0),
//                    color: AppConfig.widgetColor,
                    ),
                new Container(
                  padding: const EdgeInsets.only(left: 5.0),
                  alignment: Alignment.centerLeft,
                  child: new Text(
                    entity.data[index].name,
                    style: AppConfig.normalTextStyle(
                        AppConfig.fontDarkColor, AppConfig.font_midSize),
                  ),
                ),
                new Expanded(child: new Container()),
                new Container(
                  child: new GestureDetector(
                    onTap: () {
                      ///分类点击事件
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (_) => new ShopListPage(entity.data[index].id)));
                    },
                    child: new Row(
                      children: <Widget>[
                        new Text("更多",
                            style: AppConfig.normalTextStyle(
                                AppConfig.fontDarkColor,
                                AppConfig.font_smallSize)),
                        new Icon(
                          Icons.chevron_right,
                          size: AppConfig.font_bigSize,
//                          color: AppConfig.widgetColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ), //最近更新标题
          AppConfig.lineView(),
        FutureBuilder(
            future: _viewModel.getShops(page: shopPage,category_id:  entity.data[index].id,limit: limit),
            builder:  (BuildContext context, AsyncSnapshot snapshot){
    if (snapshot.connectionState == ConnectionState.done) {
      return new Container(
        alignment: Alignment.center,
        height: AppConfig.logic_width(390.0) * 1,
        //* (new AllModel().homePageModel.videosList[index].length / 2).ceil(),
        child: new GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, //Grid按两列显示
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 2,
          ),
          itemBuilder: ((BuildContext context, int index) {
            return shopItem(snapshot.data.data[index]);
          }),
          itemCount: snapshot.data.data.length,
//                children: shopItem(new AllModel().homePageModel.videosList[index].length, index),
        ),
      );
    }else{
      return Container();
    }

        })  ,
        ],
      ),
    );
  }

  Widget shopItem(ShopxData data) {
    return Container(
        child: InkWell(
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 10, 0, 10),

//              color: Colors.red,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: AppConfig.logic_width(50),
                      decoration: new BoxDecoration(
                        //背景
                        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                        borderRadius: BorderRadius.all(
                            Radius.circular(25.0)),
                        //设置四周边框
//                              border: new Border.all(width: 1, color: Colors.red),
                      ),
                      child: Image.network(
                        
                        data.smallimages.split(",")[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                        textDirection: TextDirection.ltr,
                        children: [

                          Expanded(
                              child: Container(
                            child: Text(
                              data.title,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,

                                  fontSize: AppConfig.logic_width(30)),
                            ),
                            width: double.infinity,
                          )),
                          Expanded(
                              child: Container(
                            width: double.infinity,
                            child: Text(
                              data.priceTitle,
                              style: TextStyle(
                                  fontSize: AppConfig.logic_width(30)),
                            ),
                          )),
                          Expanded(
                              child: Container(
                                height: AppConfig.logic_width(50),
                                child:ListView.builder(
                                  itemCount:data.manystoretapsText.length ,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (contex,index){
                                  return Container(

                                    alignment: Alignment.center,
                                    child: Text("${data.manystoretapsText[index].name}",
                                      textAlign: TextAlign.right,

                                      style: TextStyle(
                                          color: Colors.red,

                                          fontSize:
                                          AppConfig.logic_fontSize(18),),
                                    ),
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      border: new Border.all(
                                          width: AppConfig.logic_width(2),
                                          color: Colors.red),
                                    ),
                                    margin: EdgeInsets.all(
                                        AppConfig.logic_width(10)),
                                    height: AppConfig.logic_width(40),
                                    width: AppConfig.logic_width(100),
                                  );
                                })
                              )),
                          Expanded(
                              child: Container(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Text(
                                        "￥${data.price}",
                                        style: TextStyle(
                                            fontSize: AppConfig.logic_width(30),
                                            color: Colors.red),
                                      ),
                                      Text(
                                        "￥${data.originalPrice}",
                                        style: TextStyle(
                                            fontSize: AppConfig.logic_width(25),
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                      Expanded(child: Container()),
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "马上抢",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  AppConfig.logic_fontSize(20)),
                                        ),
                                        decoration: new BoxDecoration(
                                          //背景
                                          color: Colors.red,
                                          //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25.0)),
                                          //设置四周边框
//                              border: new Border.all(width: 1, color: Colors.red),
                                        ),
                                        height: AppConfig.logic_height(50),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 10, 0),
                                        width: AppConfig.logic_width(90),
                                      )
                                    ],
                                  ))),
                        ],
                      ),
                    ),
                    flex: 2,
                  )
                ],
              ),
            ),
            flex: 5,
          ),
          Expanded(
            child: Card(
              color: Colors.grey[100],
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: new ClipOval(
                            child: new Image.network(
                              "http://static.caibeike.com/i/83f0eeea35ed3d6e9638be0f73c2797b-IzI0dN-bMOMwOOkhp1@!c300",
                              width: AppConfig.logic_width(50),
                            ),
                          ),
                        ),
                        new ClipOval(
                          child: new Image.network(
                            "http://static.caibeike.com/i/83f0eeea35ed3d6e9638be0f73c2797b-IzI0dN-bMOMwOOkhp1@!c300",
                            width: AppConfig.logic_width(50),
                          ),
                        ),
                        new ClipOval(
                          child: new Image.network(
                            "http://static.caibeike.com/i/83f0eeea35ed3d6e9638be0f73c2797b-IzI0dN-bMOMwOOkhp1@!c300",
                            width: AppConfig.logic_width(50),
                          ),
                        ),
                      ],
                    ),
                    flex: 3,
                  ),
                  Expanded(
                    child: Text("${data.recommend}位体验师推荐"),
                    flex: 4,
                  ),
                  Expanded(
                    child: Text(
                      "已有${data.shoplike}人种草",
                      style: TextStyle(color: Colors.grey),
                    ),
                    flex: 4,
                  )
                ],
              ),
            ),
            flex: 2,
          ),
        ],
      ),
      onTap: () {
        _viewModel.getShop(shoplist_id: data.id).then((value)=>show(value)
        )
       ;
//          showDialog(
//            context: context,
//            barrierDismissible: true,
//            builder: (BuildContext context)=>new AlertView(),
//          );
      },
    ));
  }

  void show(ShopDetailEntity entity){
    print(entity.data.originalPrice);
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => new AlertView(
        entity: entity,
        onTap: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (_) => new DetailPage(entity)));
        },
      ),
    );
  }

  //分类模块
  Widget _selectSortViewCell(CategoryBeanEntity entity, int index) {

    return new Container(
      alignment: Alignment.center,
      child: new Material(
        color: AppConfig.color_null,
        child: new InkWell(
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (_) => new ShopListPage(entity.data[index].id)));

            },
            child: new Column(
              children: <Widget>[
                new Expanded(child: new Container()),
                new Container(
                  alignment: Alignment.center,
                  child: new ClipRRect(
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(10.0)),
                    child: SizedBox(
                      child: Image.network(
                        entity.data[index].image,
                        height: AppConfig.logic_width(100),
                        width: AppConfig.logic_width(100),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  alignment: Alignment.center,
                  child: new Text(
                    entity.data[index].name,
                    style: AppConfig.normalTextStyle(
                        AppConfig.fontDarkColor, AppConfig.font_smallSize),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  ///定位
  Widget map() {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 9,
              child: AMap2DView(
                webKey: '4e479545913a3a180b3cffc267dad646',
                onPoiSearched: (result) {
                  if (result.isEmpty) {
                    print('无搜索结果返回');
                    return;
                  }

                  _controller.animateTo(0.0,
                      duration: Duration(milliseconds: 10), curve: Curves.ease);
                  setState(() {
                    _index = 0;
                    _list = result;
                  });
                  result.forEach((element) {
                    print(element.cityName);
                  });
                },
                onAMap2DViewCreated: (controller) {
                  _aMap2DController = controller;
                },
              ),
            ),
            Expanded(
              flex: 11,
              child: ListView.separated(
                  controller: _controller,
                  shrinkWrap: true,
                  itemCount: _list.length,
                  separatorBuilder: (_, index) {
                    return Divider(height: 0.6);
                  },
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _index = index;
                          if (_aMap2DController != null) {
                            _aMap2DController.move(
                                _list[index].latitude, _list[index].longitude);
                          }
                        });
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        height: 50.0,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                _list[index].provinceName +
                                    " " +
                                    _list[index].cityName +
                                    " " +
                                    _list[index].adName +
                                    " " +
                                    _list[index].title,
                              ),
                            ),
                            Opacity(
                                opacity: _index == index ? 1 : 0,
                                child: Icon(Icons.done, color: Colors.blue))
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
