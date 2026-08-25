Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2FE42123E
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 14:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787666775; cv=none; b=rX6SX+Xp1wf0gqvL5X1ytXEyJZRQ93VBQI/G22pSGbq9zx41FLIrWP9tH4dHeI2OC3I4Ku6EEAaMOr4iNytuR56c8sgC8QZCqJMOjbZROKIRKNS/OBYI9e7vOMQxXCZUNjv1hALlQ5/bzCT8hSNiTOWjm1rzSfhL3YiaZJx3bbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787666775; c=relaxed/simple;
	bh=xuYaAPJFRc6clvrx3a3tZNfhxFBXzptVcPIV2rGA4M4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tZ3+s5g0GHWRqQYtSfP7woqbdYTXy7moXS6X5dQGg+Tw3StCoChvZAb9RVOd4/do9t/sGw4vwiEXqRi/0Ti5woEAYH3QvNwO1/fbYzmM2ifjFms2hRmoDhlvbjljcZAAxNeSnPyBH701ZkJl+Qy/eGEUbHWd7bGOr+wJ3My3UCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=INK7wsmS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="INK7wsmS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3E31F000E9;
	Tue, 25 Aug 2026 14:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787666773;
	bh=3Xh00biYQQSZtqmXu0ZznauL4ni0qjpGkK+YLnQQiFk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=INK7wsmSVMUJekcXiPsr+E3LDVCjvtSdYYkNW/LUuQnC51oGJ8uybFoH3E9keK2jX
	 ce5uDV8foufSBKW5Kf7Vcd5Tdm4mxWz3AbzaOIvLNgXNBbkh+3i4brEM6ZvQetgIP9
	 n1X+byf13FLTLAW8iBBBTKJozTV0V2EQZEUOdr5DTfwFG8njFQCXnFNQLux6tTgt0e
	 +0ipmrGEGUx/lyI74RZl0Li5w56/aBQOi2Azetc/QrkIg0D+Cj163x7u87ya9mG6q0
	 GJgHZkfnRdT32OHiGrtfVLJiM7zQ081/cI+kOv4+WdEWb2fpqh4TK04EjnYZWD0SC3
	 c4JNiYr1R/V8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/1] ARM: dts: draeger: Add devicetree files for M48
 Intel/Altera SoCFPGA Cyclone
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260825135426.3967333-2-petko.manolov@konsulko.com>
References: <20260825135426.3967333-1-petko.manolov@konsulko.com>
 <20260825135426.3967333-2-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 14:06:12 +0000
Message-Id: <20260825140613.1E3E31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The `gpio3` and `gpio4` controllers are improperly placed under th=
e `soc` node instead of `base_fpga_region`.
- [Low] Invalid format for top-level `compatible` string (`draeger,M48/socf=
pga`).
- [Low] Node unit addresses contain a leading '0x'.
- [Low] Invalid and deprecated properties used in DW APB GPIO port nodes (`=
bank-name` and `snps,nr-gpios`).
- [Low] Undocumented `cdns,page-size` and `cdns,block-size` properties in t=
he QSPI flash node.
- [Low] Invalid SPI NOR flash node name and compatible string.
- [Low] Comment in the aliases node contains typos and references the wrong=
 GMAC node.
--

--- Patch [1]: [PATCH v1 1/1] ARM: dts: draeger: Add devicetree files for M=
48 Intel/Altera SoCFPGA Cyclone ---
commit e37d3a1ced17e7ebd85060af457e4c1448b9946c
Author: Petko Manolov <petko.manolov@konsulko.com>

ARM: dts: draeger: Add devicetree files for M48 Intel/Altera SoCFPGA Cyclone

This commit introduces device tree files for the Draeger M48 Cyclone V SoC.

> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48=
.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> new file mode 100644
> index 0000000000000..fd597f15c0d8d
> --- /dev/null
> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + *  (C) Copyright 2020 Draeger and Licensors, info@draeger.com
> + */
> +#include "socfpga_cyclone5.dtsi"
> +
> +/ {
> +	model =3D "Draeger M48 Cyclone V SoC";
> +	compatible =3D "draeger,M48/socfpga", "altr,socfpga-cyclone5", "altr,so=
cfpga";

[Severity: Low]
Does this compatible string format cause dtbs_check validation warnings?

The forward slash is typically invalid in compatible strings according to t=
he
DeviceTree specification, and the "draeger" vendor prefix appears to be
undocumented.

[ ... ]

> +	aliases {
> +	/* this allow the ethaddr uboot environmnet variable contents
> +	 * to be added to the gmac1 device tree blob.
> +	 */
> +		ethernet0 =3D &gmac0;

[Severity: Low]
Is this comment referencing the correct node?

It mentions "gmac1" but the alias maps to "gmac0". Additionally, is
"environmnet" a typo?

> +	};
> +
> +	soc {
> +		gpio3: gpio@0xff202000 {

[Severity: High]
Could placing this node under the soc bus lead to an AXI bus stall and syst=
em
crash?

The address for gpio3 maps to the Lightweight HPS-to-FPGA (LWHPS2FPGA) brid=
ge.
By placing it under the generic soc node, the platform bus will probe it at
boot. If the FPGA is unprogrammed and the bridge hasn't been released from
reset, or if it is dynamically reprogrammed later, won't the driver's initi=
al
I/O read crash the kernel?

Should these nodes be placed under a base_fpga_region node instead?

[Severity: Low]
Should the unit address in the node name omit the leading "0x" to avoid DTC
compiler warnings?

> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "snps,dw-apb-gpio";
> +			reg =3D <0xff202000 0x20>;
> +			status =3D "okay";
> +
> +			portd: gpio-controller@0 {
> +				compatible =3D "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				snps,nr-gpios =3D <2>;
> +				reg =3D <0>;
> +				bank-name =3D "SYNC_I";

[Severity: Low]
Are these properties compliant with the current schema?

The "bank-name" property appears to be undocumented, and "snps,nr-gpios" has
been deprecated in favor of "ngpios".

> +			};
> +		};
> +
> +		gpio4: gpio@0xff202020 {

[Severity: High]
As with gpio3, could placing this LWHPS2FPGA bridge device under the generic
soc bus cause an AXI bus stall if the FPGA is unprogrammed?

[Severity: Low]
Does this node name also need the "0x" prefix removed from its unit address?

> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "snps,dw-apb-gpio";
> +			reg =3D <0xff202020 0x20>;
> +			status =3D "okay";
> +
> +			porte: gpio-controller@0 {
> +				compatible =3D "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				snps,nr-gpios =3D <2>;
> +				reg =3D <0>;
> +				bank-name =3D "SYNC_O";

[Severity: Low]
Should this node also use "ngpios" instead of "snps,nr-gpios", and drop the
undocumented "bank-name" property?

[ ... ]

> +&qspi {
> +	status =3D "okay";
> +
> +	flash0: n25q00@0 {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		compatible =3D "n25q00";

[Severity: Low]
Does this compatible string need a vendor prefix like "micron,n25q00" and a
standard fallback like "jedec,spi-nor" to pass schema validation?

Additionally, should the node name use a generic name like "flash@0" instead
of "n25q00@0"?

> +		reg =3D <0>;
> +
> +		/* chip select */
> +		spi-max-frequency =3D <100000000>;
> +		m25p,fast-read;
> +		cdns,page-size =3D <256>;
> +		cdns,block-size =3D <16>;

[Severity: Low]
Are these cdns properties documented in the upstream bindings?

It looks like they might be ignored by the spi-cadence-quadspi driver and
cause schema validation errors.

> +		cdns,read-delay =3D <4>;
> +		cdns,tshsl-ns =3D <50>;
> +		cdns,tsd2d-ns =3D <50>;
> +		cdns,tchsh-ns =3D <4>;
> +		cdns,tslch-ns =3D <4>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825135426.3967=
333-2-petko.manolov@konsulko.com?part=3D1
