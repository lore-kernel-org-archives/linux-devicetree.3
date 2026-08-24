Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83639432E6F
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 16:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787587973; cv=none; b=XdxnK4aTSII2TFaLwHMMFN+PWNQITZN8Bcq+Um5GDgkK5YHrAn7nVqPQmSS1rU0Qox3UlI38Gdj8XVN2s1p0yHBY8EhKKA7s575wNGGLsA4sOSu5EUf0qh0IjHCJe1LMNrYXKE5bKjdjI6hPKbt4y/LaRoShf8YZrmN3Nfb9Rbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787587973; c=relaxed/simple;
	bh=KJlYA49xB35qVO4130EtpOkHmWTvEFfpDoVRAVV90g4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cgRkbEh2rp8eM5Aa3IA7CDkYb+ClwlpdSEqpaKccIKQEmvWkgdO+v2klqzWio1BkCnKxFBM+XO7xRjykZkHqorz86vqZnORqiDdlLc9oxplO0wAmEFTQuMQwWBv84Px9Ai3qZIodPL/PUBRJIBA3X1GkXomTUt4erLcTMHKIilQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GlC5kN8j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GlC5kN8j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256991F000E9;
	Mon, 24 Aug 2026 16:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787587972;
	bh=RZH4FCP8G5rI85/o1HtcLQZQoeOqLhYdTJU0T6hkSVE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GlC5kN8jP3wXsUvy7f0kgD8fXvcgyzV7jRU7LJ5GRe2Gv1ILKENuWGaeaKhef9ATS
	 SCJSrRa/3+VSZFRE/Tmj8NzxUyQQpfKks7NqyJJBr59cLnty4/LE6nVFDgQ6OLBP8G
	 oH6iSDWq6VwBTXePWbowtv41GRACY2KnNsefBqyJqgx7tE68Ce1kMUL2MLA4lEGKgP
	 Pc4rob3o/XlrBlFeg+ME7d9rgJ5lcNhtyKmmaSwuVUwM2Y41BpzaSXcTslMr0Vyo8G
	 T71gMNCZ3gqRwe8A7Unk/3G1qyRCzJ5sAoPr0TQxGrdHncqVAjI5ZmKqiumU4OLeCD
	 YLn8JSdwTO3ZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: qcs8550-ayaneo-pocket-ds: add
 the lower DSI panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Hamamdjian" <azkali.limited@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260824-pocketds-v6-4-370161574ca2@gmail.com>
References: <20260824-pocketds-v6-0-370161574ca2@gmail.com>
 <20260824-pocketds-v6-4-370161574ca2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 16:12:51 +0000
Message-Id: <20260824161252.256991F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The negative display bias rail (AVEE) is forced always-on, which c=
auses continuous power drain and violates LCD power sequencing constraints.
- [Medium] Misuse of pinctrl 'output-high' to statically drive a panel/DSI =
enable GPIO, breaking runtime power management.
- [Medium] The sde_dsi1_suspend pinctrl state fails to disable the output h=
igh configuration, causing active power leakage during system suspend.
--

--- Patch [4]: [PATCH v6 4/4] arm64: dts: qcom: qcs8550-ayaneo-pocket-ds: a=
dd the lower DSI panel ---
commit 7b158fa2393a8ff0b401b5e960f82b14b4778a83
Author: Alexandre Hamamdjian <azkali.limited@gmail.com>

arm64: dts: qcom: qcs8550-ayaneo-pocket-ds: add the lower DSI panel

This commit adds support for the lower 768x1024 IPS LCD panel on the=20
Pocket DS device. It configures the ST7703 panel along with its required=20
SGM3804 bias supply, SY7758 backlight driver, and TCA6408 GPIO expander.

> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-ds.dts b/arch=
/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-ds.dts
> --- a/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-ds.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-ds.dts
[ ... ]
> @@ -829,6 +840,38 @@ tca6408: gpio@20 {
[ ... ]
> +		sgm3804_neg: neg {
> +			regulator-name =3D "panel1_avee";
> +			regulator-min-microvolt =3D <5200000>;
> +			regulator-max-microvolt =3D <5200000>;
> +
> +			enable-gpios =3D <&tlmm 153 GPIO_ACTIVE_HIGH>;
> +
> +			regulator-always-on;

[Severity: High]
Does forcing this negative display bias rail (AVEE) to be always-on risk
permanent hardware damage?

Applying a continuous negative bias (-5.2V) to the LCD panel while the
positive and logic supplies (AVDD, IOVCC) are disabled during display
blanking or system suspend often violates the absolute maximum ratings
of LCD drivers. Over time, this could cause latch-up and hardware failure,
along with a continuous quiescent battery drain on the device.

Could this negative rail be modeled differently so it is toggled
synchronously with the panel's active/sleep lifecycle?

> +		};
> +	};
>  };
[ ... ]
> @@ -960,6 +1003,45 @@ &mdss_dp0_out {
>  	data-lanes =3D <0 1 2 3>;
>  };
> =20
> +&mdss_dsi1 {
[ ... ]
> +	panel@0 {
> +		compatible =3D "ayaneo,pocket-ds-lower-panel";
> +		reg =3D <0>;
> +
> +		vcc-supply =3D <&sgm3804_pos>;
> +		iovcc-supply =3D <&vreg_panel1_iovcc>;
> +
> +		reset-gpios =3D <&tca6408 2 GPIO_ACTIVE_LOW>;
> +		backlight =3D <&backlight>;
> +		rotation =3D <270>;
> +
> +		pinctrl-0 =3D <&sde_dsi1_active>;
> +		pinctrl-1 =3D <&sde_dsi1_suspend>;
> +		pinctrl-names =3D "default", "sleep";

[Severity: Medium]
Will using the pinctrl output-high property (defined in sde_dsi1_active)=20
to statically drive the panel enable GPIO (tlmm 137) break runtime power=20
management?

Because DRM panels typically do not automatically transition to sleep
pinctrl states during runtime display blanking (for example, in
drm_panel_unprepare), the pin will remain asserted when the screen is
logically turned off.

If this pin controls the panel or a related signal, should it be modeled
as an explicit enable-gpios or fixed regulator instead so it toggles
correctly with the panel lifecycle?

> +
> +		port {
> +			panel1_in: endpoint {
> +				remote-endpoint =3D <&mdss_dsi1_out>;
> +			};
> +		};
> +	};
> +};
[ ... ]
> @@ -1558,6 +1640,21 @@ ts2_irq: ts2-irq-state {
>  		bias-disable;
>  	};
> =20
> +	sde_dsi1_active: sde-dsi1-active-state {
> +		pins =3D "gpio137";
> +		function =3D "gpio";
> +		drive-strength =3D <8>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	sde_dsi1_suspend: sde-dsi1-suspend-state {
> +		pins =3D "gpio137";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-pull-down;

[Severity: Medium]
Does this suspend state cause an active power leakage during system suspend?

The active state configures the pin with output-high, but this suspend
state only defines bias-pull-down without an explicit output-low or
output-disable.=20

When transitioning to suspend, the pin will remain actively driven high
while the internal pull-down resistor is concurrently enabled, which
creates a direct short-to-ground leakage path.

> +	};
> +
>  	ts2_reset: ts2-reset-state {
>  		pins =3D "gpio38";
>  		function =3D "gpio";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-pocketds-v=
6-0-370161574ca2@gmail.com?part=3D4
