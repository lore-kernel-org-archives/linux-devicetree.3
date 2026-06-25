Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B983AE1B9
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 11:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782385631; cv=none; b=Bhj6x39k3GNrS5QMXJZPjRaX8lM0x3/ohnAbRv72UoX/RvTnkZCs2OVFs6thPdkTPv211cezKVT4h9+W37Yok3o9gQsostUx5vanqOA2rEfQn8+9jtuxPTSg03EnLzHCupl4NF2D0qpfIQwqhMVbNUKQpOUFRyUz+Cj2nh+RXDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782385631; c=relaxed/simple;
	bh=byelazlkrgsOYlLMxwmpuIgB49IwkYlumI5N10e1Hcs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IEIwwGuzR/7RfDEy1GKxvUeCAgVhILsCre/AQhDLP7TIQbnP4f6skMtbxWrIqz61tDkevqZ/vMvRpx4uwmCkyVgiu1oE2WgqdDwkOo9HXT7Cy/SiJztDvXUiLRy6h6DSYK3G89t0UV0oDybgOCFU6S5wFWjW/FM1Vy+3CHoSrDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESfX3HUA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESfX3HUA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 417AC1F000E9;
	Thu, 25 Jun 2026 11:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782385630;
	bh=j7pQGu5g7cKcEY5GEu5IFoYhR2lgVHv5tCcni008/hA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ESfX3HUA/0IKjLAkKln1Blz10tl59Ag7e5w1VAWkNd7P6/F42lB5CMALJV5XUxeWx
	 aHZ2z2jpEILHC799LlR6oClW3zYYXFIy/6kNaPD8dGqIOJYff6sXBgZAh8YMzHeK0D
	 2uhR5r1axLaEX3uhP2fUXyzw5wP+VyWnUPsaNp1w7ge4QMF6asVFcmQRh7kN8BL+5j
	 Ow9Agegs1oTTvf5t3pzpeIdu0okFLwzBHYa0j7jpy+VkCPCbcxzAAaC/lmGvna/NvO
	 UWJNm6TXhpRWwiSV67u0trqOcbDrqyEpA3uxI+I2Wn495GV+NgUYush6gve9lSQOnV
	 iNh2+anmBjRFg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 3/3] arm64: dts: mt8516/mt8167: Update pinctrl nodes
 for the new paris driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260625104742.113803-4-l.scorcia@gmail.com>
References: <20260625104742.113803-1-l.scorcia@gmail.com>
 <20260625104742.113803-4-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 11:07:08 +0000
Message-Id: <20260625110709.417AC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `gpio-ranges` property incorrectly specifies a count of 124,=
 which excludes the final pin (GPIO 124) from being mapped to the GPIO subs=
ystem, as the drivers define exactly 125 pins.
--

commit 36a8d0bd5d2cccdc70b499936029deb0499393de
Author: Luca Leonardo Scorcia <l.scorcia@gmail.com>

arm64: dts: mt8516/mt8167: Update pinctrl nodes for the new paris driver

This patch updates the MediaTek mt8516 and mt8167 SoC descriptions to
respect the constraints of the Paris pinctrl driver. It sets separate base
and eint registers and removes the deprecated syscfg_pctl syscon node.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8516.dtsi
> index b5e753759465d..63f36df4d1b48 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi

[ ... ]

> @@ -231,17 +231,13 @@ keypad: keypad@10002000 {
>  			status =3D "disabled";
>  		};
> =20
> -		syscfg_pctl: syscfg-pctl@10005000 {
> -			compatible =3D "syscon";
> -			reg =3D <0 0x10005000 0 0x1000>;
> -		};
> -
> -		pio: pinctrl@1000b000 {
> +		pio: pinctrl@10005000 {
>  			compatible =3D "mediatek,mt8516-pinctrl";
> -			reg =3D <0 0x1000b000 0 0x1000>;
> -			mediatek,pctl-regmap =3D <&syscfg_pctl>;
> +			reg =3D <0 0x10005000 0 0x1000>, <0 0x1000b000 0 0x1000>;
> +			reg-names =3D "base", "eint";
>  			gpio-controller;
>  			#gpio-cells =3D <2>;
> +			gpio-ranges =3D <&pio 0 0 124>;

[Severity: Medium]
Does this count parameter accidentally exclude the final pin (GPIO 124) from
being mapped to the GPIO subsystem?

Looking at the driver definitions for the MT8516 and MT8167 platforms, there
are exactly 125 pins defined. A count of 124 will prevent the mapping of the
final pin, causing any driver or application attempting to request GPIO 124=
 to
fail. Since mt8167.dtsi includes mt8516.dtsi, this affects both SoCs.

Should this count parameter be 125 instead?

>  			interrupt-controller;
>  			#interrupt-cells =3D <2>;
>  			interrupts =3D <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625104742.1138=
03-1-l.scorcia@gmail.com?part=3D3
