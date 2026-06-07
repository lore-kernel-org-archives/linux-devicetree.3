Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105AB284682
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 16:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780848609; cv=none; b=ZBdieihl6yUzeAdD+Y/rYSeMvJS/Oz7tSgGTdoD+Yo/upy8S/Ir+L6kSB5PBFLt9Arjs0MbDAeZymvnTd2MosErBHiGXUcryBZXX+E4FemacHcJ80HFZ+N6wVC82XGHfJlvjrvPK9H8OxI0nfaDD7XDTMKN2MXSORwTaOefD15E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780848609; c=relaxed/simple;
	bh=F/IFj1ubnlzgBmnGfqm2Blx1H/2oU35LKIG2gWMMm+0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XEWFkMDZBLHAIdlwU/uh0aCsQ0EWy2FCRq8JaOE3GBMNvg/FeGqzuDPDGVvXWbiCXbcZUYR+5HjwCOwBxG0uBYeSWWyRfNzkDcuungW7CuMzTOM5ilESL3C0LhcVxtRQ15ZDTxcsuONVRpgQVA7zawswFa69aDXAEZ22iOdadnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKfC/AQt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKfC/AQt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB841F00893;
	Sun,  7 Jun 2026 16:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780848607;
	bh=1+3zj6raLQFMR3bXr1WnrSz3QKJSMNMpav22RZclzT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XKfC/AQtlcXfJ17YfOHmgv0owa2PkZCrktvKbES536FZEZIg3d4+EMTfEYC0HEgUn
	 QOr0eqN9VfyZDCKqupwk/90QQODjDgqV7Qvat7yq05co3BPGOvKHCuTnd5tCH3Uh9Y
	 YJ6S/8X/W6gkhGcgPYsxPeyqRBR6PgOkuS7+kUAGRiR6397rT/ZTDkq7Evzz0rPyiD
	 atToy27pDw2HqhM9nNqjcF/JduWBiTy2cKb3BAEMXTWJyiDZvNlbnW/7dRTvMFog7I
	 KqnpaKQ3QRLTIvPw3juUXKa8CxVb9oygDAlIK/4lbPnkWBqXm7JZp0fcTkGGNQ90k9
	 hKqXqZrqsLkrg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc8280xp-x13s: Use predefined
 MCLK pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260607160435.36546-2-mitltlatltl@gmail.com>
References: <20260607160435.36546-2-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 16:10:06 +0000
Message-Id: <20260607161007.6AB841F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Silent reduction of camera MCLK drive strength from 16 mA to 6 mA.
--

commit 68374459d8e6941a056f52b1b8fa71811fd7137a
Author: Pengyu Luo <mitltlatltl@gmail.com>

arm64: dts: qcom: sc8280xp-x13s: Use predefined MCLK pinctrl

This commit switches the ThinkPad X13s to use the predefined MCLK pinctrl
configuration from the sc8280xp SoC DTSI. It drops the local MCLK pin
definition from the camera pinctrl node.

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b=
/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index d84ca010ab9dc..1e256b16b3e6f 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -674,8 +674,9 @@ camera@10 {
>  		reg =3D <0x10>;
> =20
>  		reset-gpios =3D <&tlmm 15 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 =3D <&cam_rgb_default>, <&cam_mclk3_default>;
>  		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&cam_rgb_default>;
> =20
>  		leds =3D <&privacy_led>;
>  		led-names =3D "privacy";

[ ... ]

> @@ -1552,13 +1553,6 @@ cam_indicator_en: cam-indicator-en-state {
>  	};
> =20
>  	cam_rgb_default: cam-rgb-default-state {
> -		mclk-pins {
> -			pins =3D "gpio17";
> -			function =3D "cam_mclk";
> -			drive-strength =3D <16>;
> -			bias-disable;
> -		};
> -

[Severity: High]
Does this unintentionally reduce the camera MCLK drive strength?

The commit message notes this is dropping a duplicate MCLK pin definition, =
but
the generic cam_mclk3_default definition in sc8280xp.dtsi now used by the
camera node defaults to a lower drive strength of 6 mA:

arch/arm64/boot/dts/qcom/sc8280xp.dtsi:
	cam_mclk3_default: cam-mclk3-default-state {
		pins =3D "gpio17";
		function =3D "cam_mclk";
		drive-strength =3D <6>;
		bias-disable;
	};

Reducing the drive capability from 16 mA to 6 mA for a high-frequency master
clock signal routed over long traces might degrade signal integrity.

Could this lead to intermittent or complete camera initialization failures =
on
this hardware?

>  		sc-rgb-xshut-n-pins {
>  			pins =3D "gpio15";
>  			function =3D "gpio";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607160435.3654=
6-1-mitltlatltl@gmail.com?part=3D2
