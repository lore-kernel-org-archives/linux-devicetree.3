Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511973;
	b=gVdPIivyfuQj0Gi0mgD61YK09LCE2abrJRiq7PVGfiGBEaWUiG1E7LwhH9bl0gd/qSnb
	 9aW6N9p4uwQ84lvBs4R2T7jU68V61OYn92ohRgYLmf9AZKrKo6qyQQowEma41ikopGeFD
	 DoEc1hs9f6HxBH/OwMpKveaAshbuNzoInVOqJM6XmVq2IW7mRx7Mwxcs//CnEuftrFHBk
	 r9wc0Y6bfkglIWTjiWOvcBtVUnav7Tt1DI3B11DCod6/zRPNesIrogNycikcJkDwszNzw
	 Z5tJqyRU+K+Azsy61ZsstTIcsyaQ/5mq0xhUuRkeqhc5APuIOQd1OQ7LSS04wzJWUUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ME4Lm952VssEFecXKMuEh0Vy6xCAkVUAnYCqLJV83BU=;
	b=vlVN0NM55XjyZSYRy/ARpZSICGEC7v+6jIATp2LLeYNCksT3ZvMiiNWQWE2WU9BZQpc4
	 AYw6H2G5DC8NLtcq+v1dAjtsYH59ef02R7VzBk+nMYdiG0m7hGcjUkw5Z7XWlaUYGxEsM
	 vsrBNaEgWbVxgH0c0GdQs6+So0AayarD7MdFqLP8iRXP7q+qY6vs9pTPIHB2VddFHXK2T
	 u0krchK0Lp4i2l7NmVTpOZlFyh1ozai+/0jhJjzvd2fYfdXNoc6LqeFTlJVUKTP+gdOoO
	 rzPOiMslfnUbNKCXW5I6SoYb4FxGNVy06vkLGOInDxaUGbr1Fl3JB5zanLoOf733BSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NjPizhR6;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07081606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 19:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07081606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NjPizhR6
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36fe5944e9aso220216eec.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794511972; x=1795116772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ME4Lm952VssEFecXKMuEh0Vy6xCAkVUAnYCqLJV83BU=;
        b=NjPizhR6sJABSSKbD/L4Pk8DJZQWM2kKnAYlR84izVNYD5hlurFI9Iqirmwjv8fVad
         3e8/GKaWcNbJMzef+UDSOWd0y9BTTevHeZxc2CAHEzIlOOrU1bwUs/Rx///0onC9vmeC
         QINn/o4gYXYyXlCjMPDFfIUY/QJY6Ow10iUfGJkjBNpL+jONbCtxJYwzCD+5fnFOG8zO
         Bl2tC7I0MjhsTCyNRRIpnfIBiNvnlGM2NH6gzI9Npt9HB7sifOB3co3V872rXWQSncDU
         QbMgWv3SdQhDI0MwOP8wXfVvtsNP+D8D+kNBXVmvpl72yMGGTjVLMfrcSiQR5U+Zhx2V
         ohig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511972; x=1795116772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ME4Lm952VssEFecXKMuEh0Vy6xCAkVUAnYCqLJV83BU=;
        b=m/xuzgmWxt+k0gLbgiHPSHPbQp3iOeVFqetyzEaKq1UJMRNKlH9rDV5tY1NKkMS0aa
         BPi1lKIIWr7Qi/R0XTSUEszAETu0NZ5Y9A83n33x76isSCGm0CD3phqhKqSGqJNZwT4m
         yqM27+9RuhcEfErCnSz6+FLdXzYnzEbhD7b3JezFqiPCqQmmoLYC2X3igMxlcVHAa/yZ
         p4oTLvFyjiuSMGuXkan0eIn3NwawL53iqLApR2+kmOgW/3eqSRTyCqhsGuAE6AShXw3o
         cXvqsvfH3AA3lqsSqxrl2bZAD9Mr781hD3HKi3OjzZQA0mfdC7AYQh0ZJswGt9uXjfT5
         Pz8Q==
X-Gm-Message-State: APuU4Z+uBZmxZC/fL5iZMQHGN6Snhmfkxlnf3ZB7v970Oy/W4myMKmsm
	CSkxX+ZC1SD1utoEdLATaPIYTBAtbuR/S7N6UdeRSTIgeEyyegu+iLMY
X-Gm-Gg: AYBFou1BHTrdlJ3LDIkMZ2LOTzcsGrirbJ9h2Y0HqrXIJ4KNb0SEeEblhrGuS93CwOr
	fxYHk37oIt1dA3egXI7GheKZEHDcrhzEchI1gWUPV+ry1d3VaqNVKd+YAx5XxYL9srpw8HJ6Qun
	eKgnUFoyl9NAOZkPhbIwabCnJ9AEG0d71emzbbSkW2ybXePgEUi0lj3u1DUCNBFZ4uF4MsQdFXT
	wghgQ5fKqEfBze8KCwlTQldkuYUWO0uRFgEt55mSVPv2vSojN2TgVc04j+GkYcZgvQ9O8RI5O0W
	iWSI3Gbpn/6Ncab86NXL9+qU195HrYyEI8KnE7TMcAg0QENm0zFKEGLeeb8gHZs8cMgKaZSdUYP
	coG2WoWmZ1KFRuq7noj0DjW6eOg+9f4PQYb54YJ0UsKMm+hyfXyy1MzaiTJMe1Rktwp21FpCrNb
	4gQFLFAUxQwHZWRUi3cs1wD8lsaCZD+49kYmVIERXDYChOuvJZYreMlmCcrUHZzuaNjVpCtXg2T
	UzvH2gVfqdX055pRh/iFfGGwTgip2DrpWkJkzAzgOV/1CC7fQYHMDmcWqeeGZ4IxURp1n3t+ei7
	0NDe1BPQqODv/hB9f8rUcMDoPdqDZeWW/ZJlgcZA2r0k0wz1HQ==
X-Received: by 2002:a05:7300:828e:b0:356:7ddb:2e54 with SMTP id 5a478bee46e88-37966a5ce93mr121854eec.29.1794511971759;
        Thu, 12 Nov 2026 11:32:51 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm565379eec.14.2026.11.12.11.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:32:51 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v3 0/2] ARM: dts: zynq: Add ALINX AX7Z020B development board
Date: Fri, 13 Nov 2026 03:32:43 +0800
Message-ID: <20261112193245.250149-1-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree support for the ALINX AX7Z020B board, built around the
ALINX AC7Z020 system on module with a Zynq-7000 (XC7Z020-2CLG400I) SoC.

Changes in v3:
- Drop the vendor website Link: tags (Krzysztof Kozlowski).
- Drop the empty bootargs property (Krzysztof Kozlowski).
- Rename the USB PHY node from phy0 to phy, as there is only one USB PHY
  on the board (Krzysztof Kozlowski).
- Keep the explicit mdio node under gem0, as requested during the v1
  review and reviewed by Andrew Lunn in v2.  dtc W=1 flags the parent
  node's inherited #address-cells/#size-cells.  DT schema validation
  reports the same Zynq-7000 diagnostics as zynq-zybo-z7.  The MDIO
  layout was also verified on hardware.
- Sort I2C child nodes by address and reorder status/reg properties.
- Add Krzysztof's Acked-by to patch 1.

The "alinx" vendor prefix is already queued in linux-next as commit
1f06cd374a60 ("dt-bindings: vendor-prefixes: Add ALINX vendor prefix"),
so it is not part of this series.

Tested on hardware before the DTS style reordering: SD boot, UART
console, SD card, GbE (900+ Mbps and LED hardware offload), dual CAN,
I2C, QSPI and XADC.

Pufan Jin (2):
  dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
  ARM: dts: zynq: Add ALINX AX7Z020B development board

 .../bindings/soc/xilinx/xilinx.yaml           |   5 +
 arch/arm/boot/dts/xilinx/Makefile             |   1 +
 .../boot/dts/xilinx/zynq-alinx-ac7z020.dtsi   |  71 +++++++++
 .../boot/dts/xilinx/zynq-alinx-ax7z020b.dts   | 146 ++++++++++++++++++
 4 files changed, 223 insertions(+)
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts

Range-diff against v2:
1:  f44b8dc6e6 ! 1:  ca50a01108 dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
    @@ Commit message
         Document the ALINX AX7Z020B development board, built around the ALINX
         AC7Z020 system on module.
     
    -    Link: https://www.alinx.com/
         Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
    +    Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
     
      ## Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml ##
     @@ Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml: properties:
2:  a985ee80d4 ! 2:  477061f136 ARM: dts: zynq: Add ALINX AX7Z020B development board
    @@ Commit message
         always accessible from the PS, so expose these channels via the
         driver's xlnx,channels property.
     
    -    Link: https://www.alinx.com/
         Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
     
      ## arch/arm/boot/dts/xilinx/Makefile ##
    @@ arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi (new)
     +
     +&qspi {
     +	bootph-all;
    -+	status = "okay";
     +	num-cs = <1>;
     +
    ++	status = "okay";
    ++
     +	flash@0 {
     +		compatible = "jedec,spi-nor";
     +		reg = <0>;
    @@ arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi (new)
     +			#size-cells = <1>;
     +
     +			partition@0 {
    -+				label = "boot";
     +				reg = <0x00000000 0x00500000>;
    ++				label = "boot";
     +			};
     +
     +			partition@500000 {
    -+				label = "bootenv";
     +				reg = <0x00500000 0x00020000>;
    ++				label = "bootenv";
     +			};
     +
     +			partition@520000 {
    -+				label = "image";
     +				reg = <0x00520000 0x00a80000>;
    ++				label = "image";
     +			};
     +
     +			partition@fa0000 {
    -+				label = "spare";
     +				reg = <0x00fa0000 0x01060000>;
    ++				label = "spare";
     +			};
     +		};
     +	};
    @@ arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts (new)
     +	};
     +
     +	chosen {
    -+		bootargs = "";
     +		stdout-path = "serial0:115200n8";
     +	};
     +
    -+	usb_phy0: phy0 {
    ++	usb_phy0: phy {
     +		compatible = "usb-nop-xceiv";
     +		#phy-cells = <0>;
     +		reset-gpios = <&gpio0 46 GPIO_ACTIVE_LOW>;
    @@ arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts (new)
     +};
     +
     +&gem0 {
    -+	status = "okay";
     +	phy-mode = "rgmii-id";
     +	phy-handle = <&ethernet_phy>;
     +
    ++	status = "okay";
    ++
     +	mdio {
     +		#address-cells = <1>;
     +		#size-cells = <0>;
    @@ arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts (new)
     +};
     +
     +&i2c0 {
    -+	status = "okay";
     +	clock-frequency = <100000>;
     +
    ++	status = "okay";
    ++
    ++	temperature-sensor@48 {
    ++		compatible = "national,lm75";
    ++		reg = <0x48>;
    ++	};
    ++
     +	eeprom@50 {
     +		compatible = "atmel,24c04";
     +		reg = <0x50>;
    @@ arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts (new)
     +		compatible = "dallas,ds1338";
     +		reg = <0x68>;
     +	};
    -+
    -+	temperature-sensor@48 {
    -+		compatible = "national,lm75";
    -+		reg = <0x48>;
    -+	};
     +};
     +
     +&sdhci0 {
     +	bootph-all;
    -+	status = "okay";
     +	disable-wp;
    ++
    ++	status = "okay";
     +};
     +
     +&uart0 {
    @@ arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts (new)
     +
     +&uart1 {
     +	bootph-all;
    ++
     +	status = "okay";
     +};
     +
     +&usb0 {
    -+	status = "okay";
     +	dr_mode = "host";
     +	usb-phy = <&usb_phy0>;
    ++
    ++	status = "okay";
     +};

-- 
2.56.0

