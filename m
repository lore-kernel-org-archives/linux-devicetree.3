Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443774;
	b=EGzJXuM3j/sNDp6EurcZDHQ03SisudC4rgzYW95t2Bec7wdTa/vvDRgCP5sH7XIgKOqQ
	 ua8BMy1gis1N67RB8hKBK/RXm1PyTGqxXbKN8d6dopje2GNk6j62tryENRSc8ipEQExan
	 DF2ePq45GkeGCnvGO9HJFiJwhstpIYW8xa52zo7K+X5Rc1YpYzxljqbnVY9u4r9g/aH+h
	 Cum73WD1BA76hJjXxjvdkYB29t7056B4NVRvPTeG2VNJcUCKsmgInnCqrRWVhNXGCVWeb
	 nCDJ3IGPpAAwg7xHXgIDaejY/5IjzG+1CQyC4rW9pSqIZ2/BVM5CI+FY1tiJdwf1ulA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443774;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=F/9Y7fMSbdg3G6aSWiKFCgr0juaEjq4xuSNizVlQMVs=;
	b=DS9oxfM3me4x6fhSxiPygZK6+aGRR4N2PSqQiJS7WxNiJHpiDr8ylsa2w1OqRUpdEdCD
	 9qD5xPFKxEP5IXG/wiMwPCxv548Ibbjo3kpCpuLmVmoJ4vYuYOBj7zJgVWUcY6jEv2Hul
	 q1B38sVTrGt0w99sLdy7jJQvQ3JC5hAcnbRQa8/nmNPBjdXbPaQMmgqWmgnbWDJ/hYH4p
	 4NCpMv+RB6bkWfpqJLa0wr+5hyY6L5lm3/Rs8c1F6aNTduPa4Ak1xc6tGHwLbd/0WuW+z
	 6MjgJGNzpXLhKWcAsdOVdbZ7mzpSD3fwvd093/IyDAS3ve84fdf6AnnMnWC85kLfulg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XFae+3NC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB61606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XFae+3NC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA3E1F000D0;
	Mon, 23 Nov 2026 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795443773;
	bh=F/9Y7fMSbdg3G6aSWiKFCgr0juaEjq4xuSNizVlQMVs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XFae+3NC0xFPRhOLBqw1t6Ttv0Fc0AVbBluBLmYAJu7yv5hiftXX2tsS0aIwga8mn
	 DBG80z+BRNEHj59lDrESc7fLoi3O373YMe41+7OEtGV+4ci7IIiiRcV/Iu488weSND
	 k6tww6dIK6vwfsxu5SJlApuUM7ukG8N2jvNgNO0iToauTFgg0v64KyYMBo6e/BFU86
	 1fnWY/ldiEbLnDO2UZL+m2WzKMuTHvG6bD/gSlA5HWR1DBWrtnt9j3pBML2CgZomjt
	 Iv+4lAg7xlezDWjsNEzaX5epWLPsDBAhnFCaRCNmtbxH6Vo8aqqANuT84EuaQYsM1a
	 EonwBqnMxnc5w==
Message-ID: <sashiko-outbox-229391@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: rzg3l-smarc-som: Enable
 SD/eMMC on SDHI0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Biju Das" <biju.das.au@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261123-sdhi_rzg3l-v2-2-bad3a6358849@bp.renesas.com>
References: <20261123-sdhi_rzg3l-v2-0-bad3a6358849@bp.renesas.com>
 <20261123-sdhi_rzg3l-v2-2-bad3a6358849@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 14:22:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] arm64: dts: renesas: non-generic node name vqmmc-sd0-pvdd for
  GPIO regulator
- [Low] arm64: dts: renesas: misplaced closing brace in #if
  RZ_BOOT_MODE3 around &sdhi1
--

commit ef8324be968fe270658aa5eec8f4516a9acb1022
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0

This commit adds pin control, regulator, and SDHI0 device tree nodes to
support either eMMC or an SD card on the RZ/G3L SMARC SoM depending on the
SW_SD0_DEV_SEL macro.

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/ar=
m64/boot/dts/renesas/r9a08g046l48-smarc.dts
> index e9b7b3280615c..3699712d8bf1d 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> @@ -9,6 +9,7 @@
> =20
>  /* Switch selection settings */
>  #define RZ_BOOT_MODE3		1
> +#define SW_SD0_DEV_SEL		0
>  #define SW_SD2_EN		0
>  #define SW_DPI_EN		0
>  #define SW_GPIO4		1

[Severity: Low]
In commit "arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and
SDHI1 pincontrol on SMARC EVK" earlier in this series, does closing &sdhi1
before #else break DT compilation when RZ_BOOT_MODE3 is set to 0?

arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts:
#if RZ_BOOT_MODE3
&sdhi1 {
	pinctrl-0 =3D <&sdhi1_pins>;
	pinctrl-1 =3D <&sdhi1_uhs_pins>;
	pinctrl-names =3D "default", "state_uhs";

	vmmc-supply =3D <&reg_3p3v>;
	vqmmc-supply =3D <&vqmmc_sd1_pvdd>;
};
#else
	status =3D "disabled";
#endif

When RZ_BOOT_MODE3 is 0, status =3D "disabled"; is emitted at top-level file
scope outside any node, causing a DTC syntax error instead of overriding
status =3D "okay"; from renesas-smarc2.dtsi.  &sdhi1 { ... }; should enclose
the #if RZ_BOOT_MODE3 / #else / #endif block.

> diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm6=
4/boot/dts/renesas/rzg3l-smarc-som.dtsi
> index 91b2d0d431045..e64a611aebecd 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi

[ ... ]

> @@ -78,6 +83,19 @@ reg_3p3v: regulator-3p3v {
>  		regulator-always-on;
>  	};
> =20
> +#if SW_SD0_DEV_SEL
> +	vqmmc_sd0_pvdd: vqmmc-sd0-pvdd {
> +		compatible =3D "regulator-gpio";
> +		regulator-name =3D "SD0_PVDD";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpios =3D <&pinctrl RZG3L_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
> +		gpios-states =3D <0>;
> +		states =3D <3300000 0>, <1800000 1>;
> +		regulator-ramp-delay =3D <1200>;
> +	};
> +#endif

[Severity: Low]
Should vqmmc_sd0_pvdd use the generic regulator-vqmmc-sd0-pvdd node name
instead of vqmmc-sd0-pvdd to match the Devicetree generic node naming rules
and vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd in r9a08g046l48-smarc.dts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-sdhi_rzg3l=
-v2-0-bad3a6358849@bp.renesas.com?part=3D2
