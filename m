Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225D94279EE
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688385; cv=none; b=iEF5gEHC83K1sOki0DJqPnr5AGseqHEKQK74CrxSznv2WMDL0H5ix6KEOkVCQJUQ3BK9dcqIXsirqVJeGuSEoZRzQxDTq82Ve2bB93ajWGISgrwP3Xzg32BlLXTZ3aqLPcGC45B5rWZ8YqJHrLrqf3jsKJS50xX9Evz3NLQJ9qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688385; c=relaxed/simple;
	bh=DR3XTdg4I7lwPyfsMjIcQHSN5LQxWRSvHGsZmoT0D50=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bsCbZs3dPHRMqT6iP65G09C45Gc992FAhO6xu+ixLWe7U+saWuTiUkP3gENbD0aNJTvlJe61axogtdiGeA0aDmVqYh8dCrF2EEOoc/TOX2DM3j3rMzulNeSkIrh7/VMpF0Z/4DfbFWw+xzZYHZa7uhBAh3mnRYqdXOaxON5AF5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRE+9WIJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRE+9WIJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E10E51F000E9;
	Fri, 10 Jul 2026 12:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783688382;
	bh=zDbjVr06gmB3HgeOEEoXAW9YfnUEcb3mFJtwG478FWA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TRE+9WIJp11XDZBdx0+1w+tT8KWLpG+1f4bC5jno7NG+9ALEa8aaHhafiPPimMlEd
	 LELZBro4IsLWmFeyYY/A7i+NbREXEUHIMnfOwotcekcIrHymTu/t84kfXQ8jTZyMK8
	 NzD7HA7Ps4YzjMhI4nEe+rf08sGQ66b7jFSOyJpVRrxgJZRm+ulTKE5WcmSxMgwvnn
	 JwYPaCcaBA2mKkT6e9J2AkiSbzgH/0fIL/fDYYXuYtwppynOakWb5yVGlGYykieDm2
	 XxA3JDvGEQq1h+J8aFFUiX6f9EUDiCsnTN7DxbWGgAZmo42syzjImU4X/W0jsVwUnJ
	 6mxd8GJ/szb3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: ti: var-som-am62: Add support for
 Variscite Symphony Board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <51bff35ed6a2111f70844c13fbf119b7e07a0265.1783687321.git.stefano.r@variscite.com>
References: <cover.1783687321.git.stefano.r@variscite.com>
 <51bff35ed6a2111f70844c13fbf119b7e07a0265.1783687321.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 12:59:41 +0000
Message-Id: <20260710125941.E10E51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The `cs-gpios` property for `main_spi2` incorrectly specifies `G=
PIO_ACTIVE_HIGH` for a general-purpose SPI bus.
- [Low] The `reg_sdhc1_vmmc` regulator node is missing the `pinctrl-names` =
property and uses the deprecated `gpio` property.
- [Low] The `pca9534` GPIO expander node is missing the `interrupt-controll=
er;` and `#interrupt-cells =3D <2>;` properties.
--

--- Patch [3]: [PATCH v2 3/3] arm64: dts: ti: var-som-am62: Add support for=
 Variscite Symphony Board ---
commit 39365377c2ed764159841e605bd1eff65b2d9ad1
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: ti: var-som-am62: Add support for Variscite Symphony Board

Add device tree support for the Variscite Symphony carrier board with
the VAR-SOM-AM62 system on module.

Link: https://www.variscite.it/product/single-board-computers/symphony-boar=
d/

> diff --git a/arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts b/arch/=
arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
> new file mode 100644
> index 0000000000000..1aa50fa8809d1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
[ ... ]
> +	reg_sdhc1_vmmc: regulator-sdhc1 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "+V3.3_SD";
> +		pinctrl-0 =3D <&pinctrl_sd1_vmmc>;
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-boot-on;
> +		enable-active-high;
> +		gpio =3D <&main_gpio0 30 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Does this node need a pinctrl-names property? When pinctrl-0 is provided,
the DT schema requires pinctrl-names.

Also, should this use the gpios property instead of the deprecated gpio
property?

> +		bootph-all;
> +	};
[ ... ]
> +	/* GPIO expander */
> +	pca9534: gpio@20 {
> +		compatible =3D "nxp,pca9534";
> +		reg =3D <0x20>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_pca9534>;
> +		#gpio-cells =3D <2>;
> +		gpio-controller;
> +		interrupt-parent =3D <&main_gpio1>;
> +		interrupts =3D <30 IRQ_TYPE_EDGE_FALLING>;

[Severity: Low]
Should this node include interrupt-controller; and #interrupt-cells =3D <2>;
properties?

Without these, device tree overlays cannot use this expander as an
interrupt parent. The OF core will refuse to parse interrupts for any exter=
nal
nodes that specify interrupt-parent =3D <&pca9534>.

[ ... ]
> +&main_spi2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_spi2>;
> +	ti,pindir-d0-out-d1-in;
> +	cs-gpios =3D <&main_gpio1 13 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Is GPIO_ACTIVE_HIGH correct for this general-purpose SPI bus chip select?

Standard SPI chip selects are almost universally active-low. By specifying
GPIO_ACTIVE_HIGH, the SPI core expects the physical chip select line to be
driven high to select the device, which could cause communication failures
for standard active-low devices attached to the bus.

> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783687321.gi=
t.stefano.r@variscite.com?part=3D3
