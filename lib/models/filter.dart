enum OrderBy { DATE, PRICE }

//BiteFlags
const VENDOR_TYPE_PARTICULAR = 1 << 0; // 1 DESLOCADO DE 0 - 0001
const VENDOR_TYPE_PROFESSIONAL = 1 << 1; // 1 DESLOCADO DE 1 - 0010

// VENDOR_TYPE_PARTICULAR | VENDOR_TYPE_PROFESSIONAL 0011 - Ou logico

class Filter {
  Filter(
      {this.search,
      this.orderBy = OrderBy.DATE,
      this.minPrice,
      this.maxPrice,
      this.vendorType = VENDOR_TYPE_PARTICULAR | VENDOR_TYPE_PROFESSIONAL});

  String search;

  OrderBy orderBy;
  int minPrice;
  int maxPrice;
  int vendorType;
}
