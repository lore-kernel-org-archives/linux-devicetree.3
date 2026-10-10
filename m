Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF991D7E5C
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 23:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791675428; cv=none; b=fjk0wmuwwURnhtIE6kmr5O+Vsahb1B70qH2goLmV2p3DcdA9kjkWWuu4CUjyi7Nd5ZtD+fQYAApL4XjqUx+BaQ5xqYTcAscqGGpPHuBfAOwclkiFQSkScRG91tOTs0UmW+t07zSXZmGyCbrAZ1EoZlsNubc1gMnhKFCLAesb1Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791675428; c=relaxed/simple;
	bh=c9aKP5Ap+p7vV+nh28usO3eUYLSTbffjrFIsmMv0f5Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=a5svGbRD/iKuNSZAKDnwQl1sqzXos2VQAk/Tf089LtGVSYUBSNcs/bw6Zcj3BHNXEZLNgJGB8hyEvFTHJMwewfpC1nbJyajIGTM9KrBbAOIN3ZSMMY6PUrXO93zmKYPbH8RY3m+MzML/dx7yYzKbKuIT8LYtcU2qrFpWz2BWRa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JoBXnq7x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JoBXnq7x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1291F000FF;
	Sat, 10 Oct 2026 23:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791675427;
	bh=3QamY1Gb8A8Ny5Yds8gfu5aA2p1komHGqOr0cDTdyZc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JoBXnq7xU0NY6OI1bgbHI8OhqZvV4/fW7ugv0TO+Sn+09/Fa8NtguUxGz14t2gXmb
	 IYL57s1qyheT720qRiOBcnewvRHcW4TCWABrLv/FYQtTHDZ7qQrR+MH6BRncwl/MYU
	 B5+besDNXFT8L9LyYFfsY/udcYSDdWiG0ig8c/ttSPrOjZ7n6mvjmLHIpeF2xmpIaS
	 vRwVunkAKwKzmllXCJnYYIwOSScpexlZy1/KOhbvfmLEse5LkH2yHtkgglY3Glwihk
	 cjMW28BjGWizJizELecN3Fok0wYdfJg40PCYGlnMKb2U6cMU3JzihM8nX5J96y7mGQ
	 uFA+J7z+gz8Iw==
Message-ID: <sashiko-outbox-166934@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Enable display on UNIHIKER
 M10 V1.2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miotsuki Mizuno" <founder@crepuse.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261010232857.26950-3-founder@crepuse.com>
References: <20261010232857.26950-1-founder@crepuse.com>
 <20261010232857.26950-3-founder@crepuse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 23:37:06 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing schema definition for 'dfrobot,unihiker-m10-di=
splay'
--

commit 6e141ce95f426918ca0341028cd073760d1b80d9
Author: Miotsuki Mizuno <founder@crepuse.com>

arm64: dts: rockchip: Enable display on UNIHIKER M10 V1.2

This commit enables the onboard SPI display for the UNIHIKER M10 V1.2 board.
It adds device tree nodes for the backlight, LCD control pins, and the SPI
display itself along with its timing and required properties.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts b/=
arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts
> index 270ea970c95a7..a3264ef23746e 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts

[ ... ]

> @@ -211,6 +230,40 @@ &sdmmc {
>  	status =3D "okay";
>  };
> =20
> +&spi2 {
> +	assigned-clocks =3D <&cru SCLK_SPI2>;
> +	assigned-clock-parents =3D <&cru PLL_DPLL>;
> +	assigned-clock-rates =3D <100000000>;
> +	status =3D "okay";
> +
> +	display@0 {
> +		compatible =3D "dfrobot,unihiker-m10-display", "panel-mipi-dbi-spi";

[Severity: Low]
Will make dtbs_check report a validation failure here?

The panel-mipi-dbi-spi driver parses the first compatible string to constru=
ct
the firmware filename, but the corresponding schema located at
Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
enforces an explicit list of valid compatible strings via an enum.

Since dfrobot,unihiker-m10-display does not appear to be added to the schem=
a,
does this violate the DT binding rules?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010232857.2695=
0-1-founder@crepuse.com?part=3D2
