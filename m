Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1909E21D3F5
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099087; cv=none; b=Smn1c5t/HWQiBv6jwEW0AsHro0QcX2lWSF45h1MvQpdbowUpGVfFrrbuaF3SNXOY0KXFXsM3/Kb25YSRkRgAM/UoG4vG1JZMqeApdlr6iR5hhLXt56al6Hc/ZiXohjSL3nke1e7hmMJ7q3NAG+wXze77way7jJ/v/dwqZclLoII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099087; c=relaxed/simple;
	bh=wXp/pi0UemY6FL7MEwawj4eAwtF0F7HfcbCne0WxMBE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cESVJDhLIa3K13xlv7dE+HV3Jd5twIEGR5Jsmp5IDRhY/zemyk0TRHN5HWRqx1pE1xVq3KgWBCxurENXIsrM+/2LGl6PWi6RhwpPelIDniPwsZ3AoLxyWjp752P/KIl53Vb9mhldwJOQdGDgYZa2NEiRpmBul19SahgnIP1UvPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bHxGxDFj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bHxGxDFj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAEFDC2BCB7;
	Mon, 18 May 2026 10:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779099087;
	bh=wXp/pi0UemY6FL7MEwawj4eAwtF0F7HfcbCne0WxMBE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=bHxGxDFjsgC+fextruUVxsXTIj18IJ1WTB2lMNI4inURTDb/Gt4ouVflC12L0zF3n
	 /5YnK+bF2k/NyZR0wFNL2R6xb3Hh8HQkis08hyLl1H6uDotEorWuoEt+R0YDsdFdaY
	 E9runUn/NXnmFtiGVUjyd3d2G12tbcUKGGaM/gIurRjXvhkXRs9NWv9q2PYCmuWEja
	 987DgKwkKUkk6RQbzwc/i4sjJxNM0MIic+NQXT8lkTwgkYyLfy2fZcgHUAjm43vR/N
	 DLXo0DZT5m+Pz7vxSaxa95jR7HWBvS4iEGJJOAo6IbY4Ag9yim4GhBxXuHor4/JZpN
	 aKX59dSbNPUnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Fix clocks for HSPHYs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518-topic-hamoa_hsphy_clk-v1-1-d85203756505@oss.qualcomm.com>
References: <20260518-topic-hamoa_hsphy_clk-v1-1-d85203756505@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 10:11:26 +0000
Message-Id: <20260518101126.CAEFDC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch assigns the `TCSR_USB2_2_CLKREF_EN` clock to `usb_1_ss=
2_hsphy` (the tertiary controller's PHY). However, `usb_2_hsphy` (a separat=
e PHY at 0x088e0000) is already assigned this exact same clock reference. T=
his creates a hardware description conflict where two distinct PHYs share a=
 single toggle, contradicting the commit message's claim that the tertiary =
PHY has its "own toggle".
--

commit 91799d7f574ab3aadbfd7f8695e82875347063f5
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

arm64: dts: qcom: hamoa: Fix clocks for HSPHYs

This commit updates the clock references for the primary and tertiary HSPHYs
on hamoa. The primary PHY is wired directly to the XO clock, and the
tertiary PHY is updated to use TCSR_USB2_2_CLKREF_EN.

> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
[ ... ]
> @@ -3010,7 +3010,7 @@ usb_1_ss2_hsphy: phy@fde000 {
>  			reg =3D <0 0x00fde000 0 0x154>;
>  			#phy-cells =3D <0>;
> =20
> -			clocks =3D <&tcsr TCSR_USB2_1_CLKREF_EN>;
> +			clocks =3D <&tcsr TCSR_USB2_2_CLKREF_EN>;

The commit message notes the tertiary PHY has its "own toggle", but does
assigning TCSR_USB2_2_CLKREF_EN here result in two PHYs sharing a toggle?

It appears that usb_2_hsphy (located at 0x088e0000) is already assigned this
exact same clock reference. If both usb_1_ss2_hsphy and usb_2_hsphy share
TCSR_USB2_2_CLKREF_EN in the device tree, does usb_2_hsphy also need its
clock assignment updated to correctly model the hardware?

>  			clock-names =3D "ref";
> =20
>  			resets =3D <&gcc GCC_QUSB2PHY_TERT_BCR>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-topic-hamo=
a_hsphy_clk-v1-1-d85203756505@oss.qualcomm.com?part=3D1
