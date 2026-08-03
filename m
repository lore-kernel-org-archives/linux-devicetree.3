Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3C237883D
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 11:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785755421; cv=none; b=COL2vbY5QFT4orQiBOOWZOyEIa8SqGhdHS//f2jg9Kg/6QHznfDd+7AKB6QTusra/PP3RWawyMXG0kA/m1SOZC5d7ht2qwtTvkwxhfAG/o/Zm+8Y6CaktpjOzdXVngPAeM0OoLxZAg7nJlmKVLtocIWHhsZU/ALYsFZ+iFaCijI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785755421; c=relaxed/simple;
	bh=iI5vsq8IQqe0+75jae0/S61U4O7JyemJ24XwWtLF5Ek=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ceTh8C9WCXHA7UgwCrMlLetn3TXnIN0/cTPOzmj7L41RwLYJ+4EoGXjRgVARN3vYnpb+3YbhLzaXgTyib3NMbxofiMSfO/NqnyYfg7Xbsti5se78ujVeNwr4n7XYZyIKQ6JI3LM+ihF/9eqHP90hASSZTkzXXZWlm6t7Yy0UP3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFsJzNVJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFsJzNVJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028911F000E9;
	Mon,  3 Aug 2026 11:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785755419;
	bh=rYWVQDRG8R3ITFQWtpttuslpgh+LznS715OCPil7f+Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NFsJzNVJMrEip4JSeB+rTYGuHccIZUask0xJGC3hqdWcO7+sPWNU+QiDPBVZOWlBn
	 VlD/A0bOOKZY2SP/oyJZH8Cdab/zpEc5j79iD8jFulO/IYVPI3TiAhDrElQUjPlBN/
	 SihN1ChSUgrH/plmehJzHo+ejvYLR0fbtMuz90jvlkZfaX5gvMT9wFOBpTHbiBWc2F
	 AjKSHKT7tWJrTI9L0jgsmw7JvFyxYQwQOSCx8nYRCuSRelivRErSKVG29EYLsKIm/U
	 Sof2b03yIJ1JZ3inM6j2pdq5fkch88HMb/eRbM+suwPVGxK89MZa709Sh6M8kF47DA
	 8xdSv8aCjz4MQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] arm64: dts: rockchip: H28K: release RTL8211F reset
 before MDIO probing
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhyi <zyheihei_123@163.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803104646.26836-1-zyheihei_123@163.com>
References: <20260803104646.26836-1-zyheihei_123@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 11:10:18 +0000
Message-Id: <20260803111019.028911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Device Tree binding schema violation and dependency failure due =
to plural `snps,reset-gpios` property.
- [Medium] Introduction of deprecated MAC-level PHY reset properties instea=
d of using standard PHY or MDIO bus resets.
- [Medium] Pinctrl configuration mismatch caused by stranded `pinctrl-0` re=
ference in the PHY node.
--

--- Patch [1]: [RFC PATCH] arm64: dts: rockchip: H28K: release RTL8211F res=
et before MDIO probing ---
commit b9933a1b302b2f683cf8eb84eb27dfe653094785
Author: Zhyi <zyheihei_123@163.com>

arm64: dts: rockchip: H28K: release RTL8211F reset before MDIO probing

This commit attempts to fix a PHY probe deadlock on the HINLINK H28K board
by moving the reset GPIO configuration from the PHY node to the MAC node.
It uses the snps,reset-gpios properties on the MAC to release the reset
before the MDIO bus scan happens.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts b/arch/=
arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
> index 0ec50e9156eb1..9d7e33a92cfed 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
> @@ -191,6 +191,8 @@ &gmac1 {
>  		    <&rgmii_rx_bus2>,
>  		    <&rgmii_rgmii_clk>,
>  		    <&rgmii_rgmii_bus>;
> +	snps,reset-gpios =3D <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
> +	snps,reset-delays-us =3D <0 20000 100000>;

[Severity: Medium]
Will this fail device tree schema validation? The snps,dwmac.yaml schema
strictly defines the singular snps,reset-gpio property rather than the plur=
al
snps,reset-gpios used here. Furthermore, the schema has a strict dependency
where snps,reset-delays-us requires the singular snps,reset-gpio property
to be present, so this dependency check may fail.

[Severity: Medium]
Is this the preferred approach for handling early PHY resets? The patch mov=
es
the reset properties into the MAC node using the deprecated snps prefix.

The upstream-approved solutions for early PHY resets prior to MDIO probing
are typically to either declare the PHY ID explicitly in the PHY node
compatible string (e.g. compatible =3D "ethernet-phy-idXXXX.XXXX") so the M=
DIO
core skips the hardware read, or to use the standard reset-gpios inside the
parent mdio node.

>  	status =3D "okay";
>  };
> =20
> @@ -205,9 +207,6 @@ rgmii_phy: ethernet-phy@1 {
>  		reg =3D <0x1>;
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&gmac1_rstn_l>;
> -		reset-assert-us =3D <20000>;
> -		reset-deassert-us =3D <100000>;
> -		reset-gpios =3D <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
>  	};
>  };

[Severity: Medium]
Will this cause pinctrl settings for the reset line to be applied too late?

The consumer of the reset GPIO has moved to the MAC node (gmac1), which
will now request and toggle the GPIO during its probe. However, the pinctrl=
-0
reference for gmac1_rstn_l remains here in the PHY node.=20

Since the PHY is probed after the MAC, the pin's pinctrl settings might not
be applied before the MAC toggles the reset. When the PHY later probes and
applies the pinctrl, could it glitch the already-active reset pin?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803104646.2683=
6-1-zyheihei_123@163.com?part=3D1
