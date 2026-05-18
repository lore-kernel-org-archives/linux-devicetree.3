Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F009D282F19
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 02:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779070674; cv=none; b=urCiST6bcxsoPA2TV3MOPohwTpiSThcrAErhT3yklvOC2kbkIoi3cCgCNY0oXfziTH7L6Fw7co6wpHlW6I1QPeDuY9UoF1iWxzJn3kYD0P/MVn/HUxAz3woG1zTpxD5afrOAATUhyON78gSDIfb/h9RbqlIeJfk5hXWrqFneRw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779070674; c=relaxed/simple;
	bh=qm7jmGoRFh3DOpt5bSXR6dk8u5AhF8QuxxevxCTfYGA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y5uCOj94l2+2b7xnW1wcSkAvQpbYnx5wDzTsvRACVVtHwgher0lXLWMpCLxboLSPuYFHCDOtUerIqtWIQ9PBa7FwtY4reOGRf0ON2aOnHWq/Ueu+pf7nbk/pptHV3pDsPl0jAAKBK7ZvScmC3lzHU4QwUHeVflS6RBjr4Tc6TNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=ge1iBDQ6; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="ge1iBDQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779070670;
	bh=PiiHDF+nX4+QzwmcKPsuaf62O5ixDsbk+wGUlXGzkVQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ge1iBDQ6IshC+uFwYBYN09lGe9yZ80q6yvJlNL6cbZWZRF7ta/0Yd+PqmCXc6ArY/
	 lCTER7bV69sG41xzIsPJ+EJ4RSn5HwUft2rdlzgIFwVESJ/MZE2D07LZyFV41Z95BN
	 p44G2o3kx0vBTDUoMB3/m65JszEzJEQ6+CEMCPg11RlI01Q470HvoWx+ykgOmA4K3A
	 XDYsCQZ5SM2O5PBrpVP9MqipBie08SGpQq4L3Mb+9m7xjy3yW5nUzLOvWdnXt5DhPz
	 JykTCkzdKCiy6GC5VD+DyiQm/ZI9Wv+hNN9qXDGh5f6/Nuw6QR4kmdaJpCHavxrT6b
	 5kxMjD5/JC8LA==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7157A6037B;
	Mon, 18 May 2026 10:17:50 +0800 (AWST)
Message-ID: <9b81b5cf24afb2fd587c62ffd808366ac2fe5cd7.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>, joel@jms.id.au
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
Date: Mon, 18 May 2026 11:47:50 +0930
In-Reply-To: <20260514031622.1416922-3-prasanth.padarthi10@gmail.com>
References: <20260514031622.1416922-1-prasanth.padarthi10@gmail.com>
	 <20260514031622.1416922-3-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Prasanth,

On Thu, 2026-05-14 at 08:46 +0530, Prasanth Kumar Padarthi wrote:
> Add initial device tree support for the ASRock Rack B650D4U BMC.
> The B650D4U is a server motherboard utilizing the ASPEED AST2600
> SoC for management.
>=20
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts=C2=A0 | 71 +++++++++++=
++++++++
> =C2=A02 files changed, 72 insertions(+)
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d=
4u.dts
>=20
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed=
/Makefile
> index c4f064e4b..124d4f8f8 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> =C2=A0	aspeed-bmc-asrock-romed8hm3.dtb \
> =C2=A0	aspeed-bmc-asrock-spc621d8hm3.dtb \
> =C2=A0	aspeed-bmc-asrock-x570d4u.dtb \
> +	aspeed-bmc-asrock-b650d4u.dtb \
> =C2=A0	aspeed-bmc-asus-x4tf.dtb \
> =C2=A0	aspeed-bmc-bytedance-g220a.dtb \
> =C2=A0	aspeed-bmc-delta-ahe50dc.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arc=
h/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> new file mode 100644
> index 000000000..130b7f3e0
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +
> +/ {
> +	model =3D "ASRock Rack B650D4U BMC";
> +	compatible =3D "asrock,b650d4u-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial4 =3D &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial4:115200n8";
> +	};
> +
> +	memory@80000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x80000000 0x40000000>;
> +	};
> +};
> +
> +/* BMC Console UART */
> +&uart5 {
> +	status =3D "okay";
> +};
> +
> +/* SPI Flash Management */
> +&fmc {
> +	status =3D "okay";
> +	flash@0 {
> +		status =3D "okay";
> +		m25p,fast-read;
> +		label =3D "bmc";

Have you considered describing the flash layout here?

> +	};
> +};
> +
> +/* Dedicated Management LAN */
> +&mdio0 {
> +	status =3D "okay";
> +
> +	ethphy0: ethernet-phy@0 {
> +		compatible =3D "ethernet-phy-ieee802.3-c22";
> +		reg =3D <0>;
> +	};
> +};
> +
> +&mac0 {
> +	status =3D "okay";
> +	phy-mode =3D "rgmii-rxid";
> +	phy-handle =3D <&ethphy0>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
> +};
> +
> +/* I2C Bus for FRU/EEPROM Storage */
> +&i2c7 {
> +	status =3D "okay";
> +	eeprom@57 {
> +		compatible =3D "atmel,24c02";
> +		reg =3D <0x57>;
> +		pagesize =3D <16>;
> +	};
> +};
> +
> +/* System Watchdog */
> +&wdt1 {
> +	status =3D "okay";
> +	aspeed,reset-type =3D "soc";
> +};

My preference is that the nodes are ordered alphabetically by label
name. Can you please fix that? While it's also fine to order them e.g.
by unit address, alphabetical order is much easier for me to assess by
inspection.

Andrew
