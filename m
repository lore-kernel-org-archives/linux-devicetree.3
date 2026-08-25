Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD653264E2
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 14:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787667402; cv=none; b=JdVmhsDCObP5FSyxsM/mgqYJdG5YWGdBWn9La7BLZFquQohoO9XL09XqxGXv/6Vi2S+rezSHAukFx3UYfJuisbv59yGLWciwPtQlOCZixBiXOJnPpOYWF+D66HcGnn7PjIceevAWHu4rHmctnvz3mvYVTc3k3qVMsIqOToDeeEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787667402; c=relaxed/simple;
	bh=YM7HG4ebuGeApdslott2nQeWRhmh8vivn0EcdhzEUKM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AtdzsvXvQs5GPWRDmxn2WAXJtYLrx+17SXAP8JzWO05+jvONvCPxvKO2lCzQnR2P9O11a7qgRmIrM/cUzYxa6688tJZdDJ4O7agdDgeMlj8FULhar+rFGC/3L90NgA9qAbPlaTdRmSyzkafUyRzc1dupyoZWU3jmDzngSezxxuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hznhadHs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hznhadHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6321F000E9;
	Tue, 25 Aug 2026 14:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787667401;
	bh=2kVAsgcydQCfeW2QOmvkqAgxxfT2QPU2WIGmSl4ZbxU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hznhadHszwlXtbo2yoakDLquKdQifwD80D7yF4AYKR1+yQYP+21FB6TkDtK1LFUPH
	 lGuiizIA8m2UTpsIrn7hiMLGGbO1QPgUiqyDnBqIthxlydQWkaJAk9XfYCH9qTADA8
	 M2+cIt3JSgB8qm9bEAc/SHREOToMssfaaffzdwjK2pafQJbBM7exNT/+/phdJQxcDB
	 MD896QagTbRswQ5+sVn2H8zhDdowMgvVm3l2zI2UvLU96UmS6wBzR+AU+bbZqC85pV
	 0ik8enhyGFmDHGtUFgsY9iP58E5I7ot5lajLEYC1aHB6ju8b/gwYbPreKWm0o7zcuK
	 qI+KFSk9o5osA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/1] ARM: dts: draeger: Add devicetree files for M48
 Intel/Altera SoCFPGA Cyclone
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260825140225.3968019-2-petko.manolov@konsulko.com>
References: <20260825140225.3968019-1-petko.manolov@konsulko.com>
 <20260825140225.3968019-2-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 14:16:40 +0000
Message-Id: <20260825141641.1F6321F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Low] Invalid and undocumented root compatible string.
- [Low] Leading `0x` in node unit-addresses.
- [Low] Undocumented transmit data skew properties (`txd*-skew-ps`) in GMAC=
 node.
- [Low] Invalid and incomplete compatible string for SPI NOR flash.
- [Low] Usage of undocumented and obsolete properties (`cdns,page-size`, `c=
dns,block-size`, `m25p,fast-read`) in the SPI NOR flash node.
- [Low] Undocumented `bank-name` property in dw-apb-gpio port nodes.
--

--- Patch [1]: [PATCH v1 1/1] ARM: dts: draeger: Add devicetree files for M=
48 Intel/Altera SoCFPGA Cyclone ---
commit e3e6bb83ed93fbcc4abe100ece757b6cae933f06
Author: Petko Manolov <petko.manolov@konsulko.com>

ARM: dts: draeger: Add devicetree files for M48 Intel/Altera SoCFPGA Cyclone

This commit adds the DeviceTree source for the Draeger M48 Cyclone V SoC.
It configures basic SoC nodes, including memory, GPIO controllers, gigabit=
=20
ethernet, i2c eeprom, and QSPI flash.

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
Is this root compatible string correct? The DeviceTree specification does n=
ot
allow slashes in compatible strings, so "draeger,M48/socfpga" will trigger
warnings. Additionally, does the "draeger" vendor prefix need to be added
to vendor-prefixes.yaml, and this board compatible to the altera bindings?

[ ... ]
> +	soc {
> +		gpio3: gpio@0xff202000 {

[Severity: Low]
Should this unit-address omit the leading 0x? The DeviceTree specification
requires unit-addresses to be formatted as bare hex strings without the
0x prefix (e.g., gpio@ff202000).

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
Is bank-name a valid property for these dw-apb-gpio port nodes? It does not
appear in the snps,dw-apb-gpio.yaml binding, which enforces
additionalProperties: false and will fail schema validation.

> +			};
> +		};
> +
> +		gpio4: gpio@0xff202020 {

[Severity: Low]
Similarly, should this node be named gpio@ff202020 to avoid the leading 0x
validation warnings?

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
Does this bank-name property also need to be removed or documented to pass
dtbs_check?

[ ... ]
> +&gmac0 {
> +	status =3D "okay";
> +	phy-mode =3D "rgmii-id";
> +	rxc-skew-ps =3D <1860>;
> +	rxd0-skew-ps =3D <0>;
> +	rxd1-skew-ps =3D <0>;
> +	rxd2-skew-ps =3D <0>;
> +	rxd3-skew-ps =3D <0>;
> +	rxdv-skew-ps =3D <0>;
> +	txc-skew-ps =3D <900>;
> +	txd0-skew-ps =3D <0>;
> +	txd1-skew-ps =3D <0>;
> +	txd2-skew-ps =3D <0>;
> +	txd3-skew-ps =3D <0>;

[Severity: Low]
Are these txd0 through txd3 skew properties supported by the stmmac schema?
While RX skews and txc-skew-ps are documented, the txd[0-3]-skew-ps propert=
ies
are missing from altr,socfpga-stmmac.yaml, which will cause validation to f=
ail
since unevaluatedProperties is set to false.

[ ... ]
> +&qspi {
> +	status =3D "okay";
> +
> +	flash0: n25q00@0 {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		compatible =3D "n25q00";

[Severity: Low]
Could this compatible string be incomplete? Standard OF-based driver matchi=
ng
and the mtd/jedec,spi-nor.yaml binding require a vendor prefix and the gene=
ric
fallback, such as "micron,n25q00", "jedec,spi-nor".

> +		reg =3D <0>;
> +
> +		/* chip select */
> +		spi-max-frequency =3D <100000000>;
> +		m25p,fast-read;
> +		cdns,page-size =3D <256>;
> +		cdns,block-size =3D <16>;

[Severity: Low]
Are these properties correct for modern Cadence QSPI bindings?
The cdns,page-size and cdns,block-size properties are undocumented, and
m25p,fast-read is an obsolete property not present in modern schemas. They
will trigger dtbs_check validation errors.

> +		cdns,read-delay =3D <4>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825140225.3968=
019-2-petko.manolov@konsulko.com?part=3D1
