Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD742D3727
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784501; cv=none; b=Iwkx72p5rtXmNcF5dy6Pn/a2I3ruR0GS0LhQT1JJ9+7C92G6AYVbWZFRdhuvialxfSD6kmBCVHPMHeodM+nF9Hvg9KMBnbl4pw4J+NBAsXTcwKeIG+ewAOT+rKZjjD1AgGSUVQdYyVOrFPSHO+H1s6zgW0UYoJyVtNvTiaIzd6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784501; c=relaxed/simple;
	bh=uN81mJ4yKkqOLHpnk09/6YK7tYnVlMWuZcWTzoRtgnM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MLTt3TehjDqsiMmwN32dgd6ynsn2pH0dYlaio5kDV4IOhERTj+ALEXiPD3EsNNoovDCrFs1S6hhEGo7oBftNpxDKscIrN8KJ/cInmMREKbOovOA6sFRAZZDSObrYP11aVNLRIZfM+XzNnTBCyQIA/ychqpIiOYkUaTJOc2WvQg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKEYUQcF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKEYUQcF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96191F00A3A;
	Mon,  7 Sep 2026 12:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788784500;
	bh=1a4bt5Ddg39GajEB4Td1JG0Nb1bjQBiYfYGOrr8JWSY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fKEYUQcF7NWJc6WajFBSLbJBPeKAC8lQg9IPqwjPzYZ2+2nFE1DlJi1K8OGkQQfow
	 uLlmjjt1n10U4jHw2pYfRA3qYmc355pN9a5V7tfdiUTz7P8qqqOsN0+56QjOpX/jQ4
	 IueVsp1Gi2+lkLIujTrzF1mjGVag84qy1v9tB6pjEF/c19CQy8wUkgx7ZfTOkNAe+5
	 Bcy5APTvSYXBle5BUNd2iv1eOKKon6+xpnkJEq/PNfWaibrt1m3aRFYwA57Cjz6xHN
	 tAYM9iTKFAHn4zwzZ9MrbSYzwGV/ZQzmEto1Bvq6KQpMhuDQbD017EkBb1hSFsJDC9
	 auFI5is0z9jww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add support for FriendlyElec
 NanoPC-T6 Plus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Diederik de Haas" <diederik@cknow-tech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907122406.1862398-4-diederik@cknow-tech.com>
References: <20260907122406.1862398-1-diederik@cknow-tech.com>
 <20260907122406.1862398-4-diederik@cknow-tech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 12:34:59 +0000
Message-Id: <20260907123459.B96191F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing 3.3V regulator for the 4G LTE M.2 B-key connector and in=
correct assignment of a 5V regulator.
--

commit 5412bbe217132fabf745d86e1c28d6b071b41043
Author: Diederik de Haas <diederik@cknow-tech.com>

arm64: dts: rockchip: Add support for FriendlyElec NanoPC-T6 Plus

This commit introduces basic support for the FriendlyElec NanoPC-T6 Plus.
It highlights the hardware differences from the NanoPC-T6 LTS, such as the
addition of an M.2 B-key connector for a 4G LTE module.

Link: https://wiki.friendlyelec.com/wiki/index.php/NanoPC-T6_Plus
Link: https://wiki.friendlyelec.com/wiki/images/a/ad/NanoPC-T6_Plus_2511_SC=
H.pdf
Link: http://everest-semi.com/pdf/ES8389%20PB.pdf

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-plus.dts b/arc=
h/arm64/boot/dts/rockchip/rk3588-nanopc-t6-plus.dts
> new file mode 100644
> index 0000000000000..f23ac4bd9f167
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-plus.dts
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
> + * Copyright (c) 2023 Thomas McKahan
> + * Copyright (c) 2024 Linaro Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "rk3588-nanopc-t6.dtsi"
> +
> +/ {
> +	model =3D "FriendlyElec NanoPC-T6 Plus";
> +	compatible =3D "friendlyarm,nanopc-t6-plus", "rockchip,rk3588";
> +
> +	codec_es_3v3: regulator-codec-es-3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-name =3D "codec_es_3v3";
> +		vin-supply =3D <&vcc4v0_sys>;
> +	};
> +
> +	usb2_port_5v: regulator-usb2-port-5v {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpio =3D <&gpio1 RK_PA4 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 =3D <&usb20_host_pwren_h_pin>;
> +		pinctrl-names =3D "default";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;

[Severity: Medium]
Is it correct to define this regulator with a 5V constraint?

This uses the exact GPIO (gpio1 RK_PA4) previously used for the removed USB=
 hub
on the LTS board and retains the 5V constraint, whereas the new M.2 B-key s=
lot
would typically need a 3.3V regulator instead.

> +		regulator-name =3D "usb2_port_5v";
> +		vin-supply =3D <&vcc5v0_sys>;
> +	};
> +};

[ ... ]

> +&u2phy2_host {
> +	phy-supply =3D <&usb2_port_5v>;

[Severity: Medium]
Could this assignment provide the wrong voltage to the 4G LTE module?

Assigning the 5V regulator to the USB PHY port that typically connects to t=
he
4G LTE module's M.2 B-key slot incorrectly requests a 5V supply instead of =
the
required 3.3V. This could result in the module failing to receive power or
operating with incorrect regulator parameters.

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907122406.1862=
398-1-diederik@cknow-tech.com?part=3D3
