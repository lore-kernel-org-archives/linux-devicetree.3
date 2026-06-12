Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7386C403EA2
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 16:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781283176; cv=none; b=TuH8Fe6HC2Q1YvWB7g2/W6lAAeBlvpf3cktLxIyfwGUl70vil+CII6Xs6xg3vMcPtuP+RfzZIlR7mqBVvQRxzLGlOrWcXWqJyE8aJ0lG4CEdPdBiRucTnCF4+g0tFGVaIh/gjE8FWttLADR/W4P4/sZJZEBQzZFUCMHhUi7BKxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781283176; c=relaxed/simple;
	bh=7M0rf/LnCbO8Dbr+xwqdGGb8HLBIj8L6KqGDkP00lxE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c2A2AdupYRGiDdz4i8ZT0FyvbihJIG1H4ws4NaAovR6LuCDbBZozqA+dKdYaYuNyUIUmXxNRLN69YZDdXOl4vJ0gbDAKKWunTqTdCRZC2s8VJwpNmsG6egUsSoCpjWUA62zQiYxUjuHRhIdv94ikL5uQYMFxqwJrmUPTsbbDqJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YP9rpwZq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YP9rpwZq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FA81F000E9;
	Fri, 12 Jun 2026 16:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781283175;
	bh=jd92iNnUzcnULIje9ZonErVKpniIoalENDOzdG7ggXc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YP9rpwZq0PVBmGvP+J38Y5D/7juD9n4CoFfK4rnzIxIox5OV4NgUVktptNl/iSiX2
	 jY90aWAJZ9k0xFwRvMqma3cUmJ5Kuk0rNagwJ1eEB/8GRH1DnknOWVVUzxfwhmyoN5
	 vGDjRM+hFBZsapg8Jwh5XU+ynVyGdM/a4xWavMj6qZ4RCXf4S6O7nEwfyYIGAcvd2s
	 e++AbHVoWuParohEoQ96HgIxqxDl5Tq3QrThXI+ujDr9xbXlb2NOtIUaFqjLI8wqT4
	 eSrf7e0dDTZKqQQLBCcMWUy22aJUw0ig0X0TZbQzA+X6QWAoUuFKXNV0PdzIFLLrJN
	 KKec/LrR8/s0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: fix eMMC reset polarity on
 PP-1516
Reply-To: sashiko-reviews@lists.linux.dev
To: "Quentin Schulz" <foss+kernel@0leil.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260612-pp1516-emmc-polarity-v1-1-4816c1c909f7@cherry.de>
References: <20260612-pp1516-emmc-polarity-v1-1-4816c1c909f7@cherry.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 16:52:54 +0000
Message-Id: <20260612165255.06FA81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix: identical incorrect eMMC reset polarity (GPIO_ACTI=
VE_HIGH) remains in multiple PX30 boards.
--

commit 764233a2abb692d41607851c93d3fed45fcab940
Author: Quentin Schulz <quentin.schulz@cherry.de>

arm64: dts: rockchip: fix eMMC reset polarity on PP-1516

This commit fixes the eMMC reset polarity for the px30-pp1516 board by
changing it to GPIO_ACTIVE_LOW to comply with the Jedec 5.1 specification.
The previous GPIO_ACTIVE_HIGH polarity caused eMMC devices with specific
RST_n_FUNCTION bitfield settings to be held in reset forever.

> diff --git a/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi b/arch/arm64/b=
oot/dts/rockchip/px30-pp1516.dtsi
> index 192791993f059..02200de695d31 100644
> --- a/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
> @@ -33,7 +33,7 @@ emmc_pwrseq: emmc-pwrseq {
>  		compatible =3D "mmc-pwrseq-emmc";
>  		pinctrl-0 =3D <&emmc_reset>;
>  		pinctrl-names =3D "default";
> -		reset-gpios =3D <&gpio1 RK_PB3 GPIO_ACTIVE_HIGH>;
> +		reset-gpios =3D <&gpio1 RK_PB3 GPIO_ACTIVE_LOW>;

[Severity: High]
This isn't a bug introduced by this patch, but does this same fix need to be
applied to other PX30 boards?

Looking at the tree, several other PX30 device trees still use the exact sa=
me
incorrect GPIO_ACTIVE_HIGH configuration for their emmc_pwrseq nodes:

arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
arch/arm64/boot/dts/rockchip/px30-evb.dts
arch/arm64/boot/dts/rockchip/px30-firefly-jd4-core.dtsi
arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi

Will these boards also fail to boot if used with eMMC devices where the
RST_n_FUNCTION[162] bitfield is set to 0x1, or do they guarantee different
hardware behavior?

>  	};
> =20
>  	gpio-leds {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-pp1516-emm=
c-polarity-v1-1-4816c1c909f7@cherry.de?part=3D1
