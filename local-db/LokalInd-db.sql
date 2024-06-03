PGDMP         -                |            lokalind-db    14.5    14.5 6    F           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            G           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            H           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            I           1262    16797    lokalind-db    DATABASE     m   CREATE DATABASE "lokalind-db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE "lokalind-db";
                postgres    false            �            1259    17136 	   Addresses    TABLE     ?  CREATE TABLE public."Addresses" (
    "AddressId" character varying(50) NOT NULL,
    "Province" character varying(30),
    "City" character varying(30),
    "SubDistrict" character varying(50),
    "Address" character varying(100),
    "PostalCode" character varying(10),
    "CreatedAt" date,
    "UpdatedAt" date
);
    DROP TABLE public."Addresses";
       public         heap    postgres    false            �            1259    17141    Brands    TABLE     �   CREATE TABLE public."Brands" (
    "BrandId" character varying(50) NOT NULL,
    "BrandName" character varying(50),
    "AddressId" character varying(50),
    "Logo" character varying(255),
    "CreatedAt" date,
    "UpdatedAt" date
);
    DROP TABLE public."Brands";
       public         heap    postgres    false            �            1259    17200    Cart    TABLE     �   CREATE TABLE public."Cart" (
    "CartId" character varying(50) NOT NULL,
    "ProductId" character varying(50),
    "CustomerId" character varying(50),
    "Count" integer,
    "CreatedAt" date,
    "UpdatedAt" date
);
    DROP TABLE public."Cart";
       public         heap    postgres    false            �            1259    17151    Category    TABLE     �   CREATE TABLE public."Category" (
    "CategoryId" character varying(50) NOT NULL,
    "CategoryName" character varying(50),
    "Description" text,
    "CreatedAt" date,
    "UpdatedAt" date
);
    DROP TABLE public."Category";
       public         heap    postgres    false            �            1259    17175 	   Customers    TABLE     b  CREATE TABLE public."Customers" (
    "CustomerId" character varying(50) NOT NULL,
    "Picture" character varying(100),
    "FullName" character varying(100),
    "AddressId" character varying(50),
    "Phone" character varying(20),
    "Email" character varying(100),
    "Password" character varying(50),
    "CreatedAt" date,
    "UpdatedAt" date
);
    DROP TABLE public."Customers";
       public         heap    postgres    false            �            1259    17255    OrderDetails    TABLE        CREATE TABLE public."OrderDetails" (
    "OrderDetailId" character varying(50) NOT NULL,
    "OrderId" character varying(50),
    "ProductId" character varying(50),
    "Price" integer,
    "Quantity" integer,
    "CreatedAt" date,
    "UpdatedAt" date
);
 "   DROP TABLE public."OrderDetails";
       public         heap    postgres    false            �            1259    17220    OrderStatus    TABLE     �   CREATE TABLE public."OrderStatus" (
    "OrderStatusId" character varying(50) NOT NULL,
    "StatusName" character varying(50),
    "CreatedAt" date,
    "UpdatedAt" date
);
 !   DROP TABLE public."OrderStatus";
       public         heap    postgres    false            �            1259    17230    Orders    TABLE     �  CREATE TABLE public."Orders" (
    "OrderId" character varying(50) NOT NULL,
    "CustomerId" character varying(50),
    "PaymentId" character varying(50),
    "OrderStatusId" character varying(50),
    "ShipperId" character varying(50),
    "OrderDate" date,
    "ShipDate" date,
    "ShipLimitDate" date,
    "Freight" double precision,
    "PaymenDate" date,
    "CreatedAt" date,
    "UpdatedAt" date
);
    DROP TABLE public."Orders";
       public         heap    postgres    false            �            1259    17215    Payments    TABLE     �   CREATE TABLE public."Payments" (
    "PaymentId" character varying(50) NOT NULL,
    "PaymentType" character varying(50),
    "idAllow" boolean
);
    DROP TABLE public."Payments";
       public         heap    postgres    false            �            1259    17158    Products    TABLE     �  CREATE TABLE public."Products" (
    "ProductId" character varying(50) NOT NULL,
    "BrandId" character varying(50),
    "ProductName" character varying(50),
    "ProductDescription" text,
    "CategoryId" character varying(50),
    "UnitPrice" double precision,
    "UnitSize" character varying(5),
    "UnitInStock" integer,
    "isAvalable" boolean,
    "Pictures" character varying[],
    "CreatedAt" date,
    "UpdatedAt" date
);
    DROP TABLE public."Products";
       public         heap    postgres    false            �            1259    17225    Shippers    TABLE     �   CREATE TABLE public."Shippers" (
    "ShipperId" character varying(50) NOT NULL,
    "CompanyName" character varying(50),
    "Phone" character varying(20)
);
    DROP TABLE public."Shippers";
       public         heap    postgres    false            �            1259    17185    Wishlist    TABLE     �   CREATE TABLE public."Wishlist" (
    "WishlistId" character varying(50) NOT NULL,
    "ProductId" character varying(50),
    "CustomerId" character varying(50),
    "CreatedAt" date,
    "UpdatedAt" date
);
    DROP TABLE public."Wishlist";
       public         heap    postgres    false            8          0    17136 	   Addresses 
   TABLE DATA           �   COPY public."Addresses" ("AddressId", "Province", "City", "SubDistrict", "Address", "PostalCode", "CreatedAt", "UpdatedAt") FROM stdin;
    public          postgres    false    209   �I       9          0    17141    Brands 
   TABLE DATA           i   COPY public."Brands" ("BrandId", "BrandName", "AddressId", "Logo", "CreatedAt", "UpdatedAt") FROM stdin;
    public          postgres    false    210   J       >          0    17200    Cart 
   TABLE DATA           h   COPY public."Cart" ("CartId", "ProductId", "CustomerId", "Count", "CreatedAt", "UpdatedAt") FROM stdin;
    public          postgres    false    215   -J       :          0    17151    Category 
   TABLE DATA           k   COPY public."Category" ("CategoryId", "CategoryName", "Description", "CreatedAt", "UpdatedAt") FROM stdin;
    public          postgres    false    211   JJ       <          0    17175 	   Customers 
   TABLE DATA           �   COPY public."Customers" ("CustomerId", "Picture", "FullName", "AddressId", "Phone", "Email", "Password", "CreatedAt", "UpdatedAt") FROM stdin;
    public          postgres    false    213   gJ       C          0    17255    OrderDetails 
   TABLE DATA           �   COPY public."OrderDetails" ("OrderDetailId", "OrderId", "ProductId", "Price", "Quantity", "CreatedAt", "UpdatedAt") FROM stdin;
    public          postgres    false    220   �J       @          0    17220    OrderStatus 
   TABLE DATA           `   COPY public."OrderStatus" ("OrderStatusId", "StatusName", "CreatedAt", "UpdatedAt") FROM stdin;
    public          postgres    false    217   �J       B          0    17230    Orders 
   TABLE DATA           �   COPY public."Orders" ("OrderId", "CustomerId", "PaymentId", "OrderStatusId", "ShipperId", "OrderDate", "ShipDate", "ShipLimitDate", "Freight", "PaymenDate", "CreatedAt", "UpdatedAt") FROM stdin;
    public          postgres    false    219   �J       ?          0    17215    Payments 
   TABLE DATA           K   COPY public."Payments" ("PaymentId", "PaymentType", "idAllow") FROM stdin;
    public          postgres    false    216   �J       ;          0    17158    Products 
   TABLE DATA           �   COPY public."Products" ("ProductId", "BrandId", "ProductName", "ProductDescription", "CategoryId", "UnitPrice", "UnitSize", "UnitInStock", "isAvalable", "Pictures", "CreatedAt", "UpdatedAt") FROM stdin;
    public          postgres    false    212   �J       A          0    17225    Shippers 
   TABLE DATA           I   COPY public."Shippers" ("ShipperId", "CompanyName", "Phone") FROM stdin;
    public          postgres    false    218   K       =          0    17185    Wishlist 
   TABLE DATA           g   COPY public."Wishlist" ("WishlistId", "ProductId", "CustomerId", "CreatedAt", "UpdatedAt") FROM stdin;
    public          postgres    false    214   2K       �           2606    17140    Addresses Addresses_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."Addresses"
    ADD CONSTRAINT "Addresses_pkey" PRIMARY KEY ("AddressId");
 F   ALTER TABLE ONLY public."Addresses" DROP CONSTRAINT "Addresses_pkey";
       public            postgres    false    209            �           2606    17145    Brands Brands_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Brands"
    ADD CONSTRAINT "Brands_pkey" PRIMARY KEY ("BrandId");
 @   ALTER TABLE ONLY public."Brands" DROP CONSTRAINT "Brands_pkey";
       public            postgres    false    210            �           2606    17204    Cart Cart_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Cart"
    ADD CONSTRAINT "Cart_pkey" PRIMARY KEY ("CartId");
 <   ALTER TABLE ONLY public."Cart" DROP CONSTRAINT "Cart_pkey";
       public            postgres    false    215            �           2606    17157    Category Category_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY ("CategoryId");
 D   ALTER TABLE ONLY public."Category" DROP CONSTRAINT "Category_pkey";
       public            postgres    false    211            �           2606    17179    Customers Customers_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."Customers"
    ADD CONSTRAINT "Customers_pkey" PRIMARY KEY ("CustomerId");
 F   ALTER TABLE ONLY public."Customers" DROP CONSTRAINT "Customers_pkey";
       public            postgres    false    213            �           2606    17259    OrderDetails OrderDetails_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public."OrderDetails"
    ADD CONSTRAINT "OrderDetails_pkey" PRIMARY KEY ("OrderDetailId");
 L   ALTER TABLE ONLY public."OrderDetails" DROP CONSTRAINT "OrderDetails_pkey";
       public            postgres    false    220            �           2606    17224    OrderStatus OrderStatus_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."OrderStatus"
    ADD CONSTRAINT "OrderStatus_pkey" PRIMARY KEY ("OrderStatusId");
 J   ALTER TABLE ONLY public."OrderStatus" DROP CONSTRAINT "OrderStatus_pkey";
       public            postgres    false    217            �           2606    17234    Orders Orders_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY ("OrderId");
 @   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_pkey";
       public            postgres    false    219            �           2606    17219    Payments Payments_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."Payments"
    ADD CONSTRAINT "Payments_pkey" PRIMARY KEY ("PaymentId");
 D   ALTER TABLE ONLY public."Payments" DROP CONSTRAINT "Payments_pkey";
       public            postgres    false    216            �           2606    17164    Products Products_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY ("ProductId");
 D   ALTER TABLE ONLY public."Products" DROP CONSTRAINT "Products_pkey";
       public            postgres    false    212            �           2606    17229    Shippers Shippers_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."Shippers"
    ADD CONSTRAINT "Shippers_pkey" PRIMARY KEY ("ShipperId");
 D   ALTER TABLE ONLY public."Shippers" DROP CONSTRAINT "Shippers_pkey";
       public            postgres    false    218            �           2606    17189    Wishlist Wishlist_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Wishlist"
    ADD CONSTRAINT "Wishlist_pkey" PRIMARY KEY ("WishlistId");
 D   ALTER TABLE ONLY public."Wishlist" DROP CONSTRAINT "Wishlist_pkey";
       public            postgres    false    214            �           2606    17146    Brands Brands_AddressId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Brands"
    ADD CONSTRAINT "Brands_AddressId_fkey" FOREIGN KEY ("AddressId") REFERENCES public."Addresses"("AddressId") ON UPDATE CASCADE;
 J   ALTER TABLE ONLY public."Brands" DROP CONSTRAINT "Brands_AddressId_fkey";
       public          postgres    false    3208    209    210            �           2606    17210    Cart Cart_CustomerId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Cart"
    ADD CONSTRAINT "Cart_CustomerId_fkey" FOREIGN KEY ("CustomerId") REFERENCES public."Customers"("CustomerId") ON UPDATE CASCADE;
 G   ALTER TABLE ONLY public."Cart" DROP CONSTRAINT "Cart_CustomerId_fkey";
       public          postgres    false    215    213    3216            �           2606    17205    Cart Cart_ProductId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Cart"
    ADD CONSTRAINT "Cart_ProductId_fkey" FOREIGN KEY ("ProductId") REFERENCES public."Products"("ProductId") ON UPDATE CASCADE;
 F   ALTER TABLE ONLY public."Cart" DROP CONSTRAINT "Cart_ProductId_fkey";
       public          postgres    false    3214    212    215            �           2606    17180 "   Customers Customers_AddressId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Customers"
    ADD CONSTRAINT "Customers_AddressId_fkey" FOREIGN KEY ("AddressId") REFERENCES public."Addresses"("AddressId");
 P   ALTER TABLE ONLY public."Customers" DROP CONSTRAINT "Customers_AddressId_fkey";
       public          postgres    false    209    213    3208            �           2606    17260 &   OrderDetails OrderDetails_OrderId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."OrderDetails"
    ADD CONSTRAINT "OrderDetails_OrderId_fkey" FOREIGN KEY ("OrderId") REFERENCES public."Orders"("OrderId") ON UPDATE CASCADE;
 T   ALTER TABLE ONLY public."OrderDetails" DROP CONSTRAINT "OrderDetails_OrderId_fkey";
       public          postgres    false    220    219    3228            �           2606    17265 (   OrderDetails OrderDetails_ProductId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."OrderDetails"
    ADD CONSTRAINT "OrderDetails_ProductId_fkey" FOREIGN KEY ("ProductId") REFERENCES public."Products"("ProductId") ON UPDATE CASCADE;
 V   ALTER TABLE ONLY public."OrderDetails" DROP CONSTRAINT "OrderDetails_ProductId_fkey";
       public          postgres    false    212    3214    220            �           2606    17235    Orders Orders_CustomerId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_CustomerId_fkey" FOREIGN KEY ("CustomerId") REFERENCES public."Customers"("CustomerId") ON UPDATE CASCADE;
 K   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_CustomerId_fkey";
       public          postgres    false    3216    213    219            �           2606    17245     Orders Orders_OrderStatusId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_OrderStatusId_fkey" FOREIGN KEY ("OrderStatusId") REFERENCES public."OrderStatus"("OrderStatusId") ON UPDATE CASCADE;
 N   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_OrderStatusId_fkey";
       public          postgres    false    3224    219    217            �           2606    17240    Orders Orders_PaymentId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_PaymentId_fkey" FOREIGN KEY ("PaymentId") REFERENCES public."Payments"("PaymentId") ON UPDATE CASCADE;
 J   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_PaymentId_fkey";
       public          postgres    false    216    219    3222            �           2606    17250    Orders Orders_ShipperId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_ShipperId_fkey" FOREIGN KEY ("ShipperId") REFERENCES public."Shippers"("ShipperId") ON UPDATE CASCADE;
 J   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_ShipperId_fkey";
       public          postgres    false    218    3226    219            �           2606    17165    Products Products_BrandId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_BrandId_fkey" FOREIGN KEY ("BrandId") REFERENCES public."Brands"("BrandId") ON UPDATE CASCADE;
 L   ALTER TABLE ONLY public."Products" DROP CONSTRAINT "Products_BrandId_fkey";
       public          postgres    false    212    210    3210            �           2606    17170 !   Products Products_CategoryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_CategoryId_fkey" FOREIGN KEY ("CategoryId") REFERENCES public."Category"("CategoryId") ON UPDATE CASCADE;
 O   ALTER TABLE ONLY public."Products" DROP CONSTRAINT "Products_CategoryId_fkey";
       public          postgres    false    212    3212    211            �           2606    17195 !   Wishlist Wishlist_CustomerId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Wishlist"
    ADD CONSTRAINT "Wishlist_CustomerId_fkey" FOREIGN KEY ("CustomerId") REFERENCES public."Customers"("CustomerId") ON UPDATE CASCADE;
 O   ALTER TABLE ONLY public."Wishlist" DROP CONSTRAINT "Wishlist_CustomerId_fkey";
       public          postgres    false    3216    214    213            �           2606    17190     Wishlist Wishlist_ProductId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Wishlist"
    ADD CONSTRAINT "Wishlist_ProductId_fkey" FOREIGN KEY ("ProductId") REFERENCES public."Products"("ProductId") ON UPDATE CASCADE;
 N   ALTER TABLE ONLY public."Wishlist" DROP CONSTRAINT "Wishlist_ProductId_fkey";
       public          postgres    false    3214    214    212            8      x������ � �      9      x������ � �      >      x������ � �      :      x������ � �      <      x������ � �      C      x������ � �      @      x������ � �      B      x������ � �      ?      x������ � �      ;      x������ � �      A      x������ � �      =      x������ � �     