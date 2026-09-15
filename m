Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C6148EC68
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480481; cv=none; b=lYgZsnUCPr0FsGTY5cwxdqN2TK5LtlbJfn8Ub1m3QTXHp0blNqU7h8W1mU82GYpJDn8PKQDPKTm3/aeGncC5TNM5XETz0BjyQ/UoM2D33VabXB2Ih+zxBGaq0bUHnegVEutY3Mk6F+M7yAUB2xq3Nry8rg6Q3gVniQ/DB+X38Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480481; c=relaxed/simple;
	bh=sH2QHLvE38JXbdk7d4NPNhTNSqhR2kswu+ZpD7dZrlo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MT9XvMtp+W8HM9Xyv+IdjscWSQ9aR0yXDXP5hHez/nTwzDeRorUicQ34a4O+p45G5GucAwN9fgD3QiYnstYplmJ1EbhZpIYSLalAw0B970jrG32IeDwuk9mDfQVqVyKheaJYKq6YZM1qzW6HazjJB+v5VeXBQ3iZX+FwSKR/V8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tt3O521+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tt3O521+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F145D1F000FF;
	Tue, 15 Sep 2026 13:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789480479;
	bh=uPN2xYJKdn4dBf1rSWoGMPwP6rFsUPuAkdkqr3W3Wvs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tt3O521+UCJUOB4fNSFxuEq2n7tuuFFwGyZdldBVsACD40YzWnzliebjdkILsOJsk
	 94qy1G6lhXE29B13K+W0c/bzFgZUdlbO01W9n4jY9YnZGFPHlorRq2OhfXsj+q3BSt
	 SqkoBtmoXMpWHm5hPNXyW1fs4TbiOJ+EGDXVpXXOhDAi4V9ogtuKlDrvha9KpzCMgx
	 dfwYLz4fcYzBZj2sBxYjzEmmRcnsrkunKwHqwIqYjFlhF/tf8TTAPMTQkkeKcej5je
	 Mc1yaEIY6UV2GxBcuyJQ7XiDeA3xROZT1qDwsuoeBXhhTPI8LnaBau4BhNKzEilsEM
	 TdkvOZENrr8yQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] arm: dts: altera: add Draeger M48 CPU Module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260915133805.3249587-4-petko.manolov@konsulko.com>
References: <20260915133805.3249587-1-petko.manolov@konsulko.com>
 <20260915133805.3249587-4-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 13:54:38 +0000
Message-Id: <20260915135438.F145D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] gpio: dwapb: out-of-bounds MMIO access due to insufficient reg siz=
e in gpio nodes
- [Low] dt-bindings: undocumented legacy property m25p,fast-read in QSPI fl=
ash node
--

commit e552871800bb6cae08fff136714f65febb16a836
Author: Petko Manolov <petko.manolov@konsulko.com>

arm: dts: altera: add Draeger M48 CPU Module

This commit adds the device tree for the Draeger M48 CPU Module, which is
built around the Altera SoCFPGA.

> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48=
.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> new file mode 100644
> index 0000000000000..838708acb31bd
> --- /dev/null
> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

[ ... ]

> +	soc {
> +		gpio3: gpio@ff202000 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "snps,dw-apb-gpio";
> +			reg =3D <0xff202000 0x20>;

[ ... ]

> +		gpio4: gpio@ff202020 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "snps,dw-apb-gpio";
> +			reg =3D <0xff202020 0x20>;

[Severity: High]
Can these reg sizes in gpio3 and gpio4 lead to a regression during device
probe?

The snps,dw-apb-gpio driver unconditionally maps the 32-byte region specifi=
ed
in the DT, but then accesses offset 0x50 (GPIO_EXT_PORTA). This leads to an
out-of-bounds MMIO read/write, potentially causing an external data abort
from the FPGA interconnect.

If the hardware is actually the altr,pio-1.0 controller, which fits in
32 bytes, the wrong compatible string was provided.

[ ... ]

> +	flash: flash@0 {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		compatible =3D "micron,n25q256a", "jedec,spi-nor";
> +		reg =3D <0>;
> +
> +		/* chip select */
> +		spi-max-frequency =3D <100000000>;
> +		m25p,fast-read;

[Severity: Low]
Does the flash node introduce a regression by using an undocumented legacy
property?

The m25p,fast-read property is deprecated in modern bindings
(jedec,spi-nor.yaml) and causes a dt-schema validation error. Modern device
trees should rely on SFDP auto-discovery or use standard SPI properties.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915133805.3249=
587-1-petko.manolov@konsulko.com?part=3D3
