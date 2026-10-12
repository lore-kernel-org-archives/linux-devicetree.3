Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBE0489FB4
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807976; cv=none; b=pGtXsyGKolk2GSRrU58Sl9ebp4EcwdEXg36FrwrgAFfSG9BGVv6LwwpyN/QP8nM6SJnViKF9pyFADrwrmSVx8d4EBBUA1zViPICfBsJ7GvsvKHmzi2J6+SZZx6H+50xF3c0kuErX3vqXwkjtsNy/NY9mVDY2SPuaE4k0lmp3yQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807976; c=relaxed/simple;
	bh=10dZ8tCMeYJfwHBDhJLKMsKkdFxapCQEE8kpItZMvfU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LFR805NUdKM6uMAbMFVPTRK+ds9brFQN3X3jKmFpm3WsjhdKsrWtVU9Dw2bK2C/MDsQK+gelctV//FoBhr0kHdahkKBWfSRIjp4O9ZDwuvXMM8D6BarsADOsevbvxhokNCy+masMhrnsoMG7N0w9MEmHKXSZkOX+iJqJ/ykQm+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJ6YNnVP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJ6YNnVP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05ADD1F0089C;
	Mon, 12 Oct 2026 12:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791807974;
	bh=obYHc3+M18UAdUeKmDPXnw9X5JtSIpmf0cWdGUwtbiQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HJ6YNnVP6iFJogscQhvHVvri5pOfqsTlhKI7S1qwBlYznAp0MBz0fsSNnAJ6xmZxm
	 nKvXw/l+igSvMPM8p1nynFg4LeGGoNn7KB4iIE7Oo4oUBUanLWDGqmQ321CAB7in4Y
	 rZ/XRAKireLRfZEiz1iyTbfEsk1gM6vSsYx2rx6mLmDiYhJpxBDKP27J7R+zqPSmX8
	 k51MzIKpMNTbk1xYML1py31RL2SIDELLjTD8lZPDYlF7FBpNt3W0NbTsm6YfXU6I6d
	 FihVkf6g0cyJXl6KM2SeaVCPPDvXo5VaR57Uk/XNY2TST9YYnxStGqjHnxSK3QUkuC
	 huq+IyQYkcA0g==
Message-ID: <sashiko-outbox-168094@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Enable display on UNIHIKER
 M10 V1.2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miotsuki Mizuno" <founder@crepuse.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20261012121718.53481-3-founder@crepuse.com>
References: <20261012121718.53481-1-founder@crepuse.com>
 <20261012121718.53481-3-founder@crepuse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 12:26:13 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: undocumented compatible string dfrobot,unihiker-m10-di=
splay
--

commit bb7cab2e48d73305c4348ab50dde38a500cc0a23
Author: Mizuno Miotsuki <founder@crepuse.com>

arm64: dts: rockchip: Enable display on UNIHIKER M10 V1.2

Enable the onboard 240x320 SPI display using panel-mipi-dbi. Add its
D/C and reset GPIOs, display timing, and PWM1 backlight, and enable
SPI2 with a maximum transfer frequency of 50 MHz.

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
Does the dfrobot,unihiker-m10-display compatible string need to be added to
the corresponding YAML binding schema?

Since it is used here without being documented in the panel-mipi-dbi-spi
bindings, it might trigger validation warnings during make dtbs_check.

> +		reg =3D <0>;
> +		spi-max-frequency =3D <50000000>;
> +		pinctrl-names =3D "default";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012121718.5348=
1-1-founder@crepuse.com?part=3D2
