Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CC978F2E
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 12:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780403658; cv=none; b=qgvhWAl8Xg/+j6hZyK3H707JJtqwdSlI5SDH27fhfFX73S4nzu5tYqKdJlemdT/Fx2tTZsqK26DqCGi4YQ+ZMH2oTr6x5lhZ44KEag/+XqRMb5xQGwEMsCQXtfSiDiy2srQxFkM0twnNY0PP0wxScOtpwUTwakKqfgicD6dunjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780403658; c=relaxed/simple;
	bh=IjcM2ARSoH3MXCqS1RpctEJDHXWomCdKOat0PXAKjlY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IyoTx6369WuQ1D7FXF3JoVvLBSupJibBAR9KA0oi+xFgfJ1tF/9GDRIiyOW6xqKpBRrP/2Ive/9DyQBAv3sSGCIO+1avi8hHT1OmeUXqKVmPfJVrBglD6Gvarslm2/ubecQ1w5VZvpQFOng2/P8sw7GdIOIuJw3dN3iI8uFLP2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6SHnosM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6SHnosM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113441F00893;
	Tue,  2 Jun 2026 12:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780403657;
	bh=odzJiIqsgqbVcz7JN1F3bcop5Ex9i5UbZP743UlB+Uk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n6SHnosMfKRMMKoLMlqAXscVvqZFV6tZe191i4cO+OCdSZ98SeLaQYMngHobh6kAC
	 jaQPt2rhowd+mLc/ZWiBm6w9zIqLFuRZF+DT9J+YJgrW/9Qy5J7woWmte5oLDRQsHd
	 TpaPfbfeIrSC2j7o3UkqBBapS4BxMyxsH1o9Rr2OMB67RSnOx5gcw+o4eBY+kQQZgG
	 RPA8JgN4c6N2ojbuj+fdoDab/YwfE3VTQtBt/fUNIqmbkeTH7nB8gEhUw+SGTQz39F
	 XM/YJcCHjyKYSia4jytdZy0ZGcmeOCmy7MoIhSUaxSv+EHzohsbVAIgumrTn2a7Wm3
	 jQV6ZVAyBlcoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] arm64: dts: ti: k3-am69-aquila: Add Toradex
 Capacitive Touch Display 10.1" DSI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vitor Soares" <ivitro@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260602115123.1324474-14-ivitro@gmail.com>
References: <20260602115123.1324474-14-ivitro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 12:34:16 +0000
Message-Id: <20260602123417.113441F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch introduces undocumented compatible strings ('riverdi,rvt1=
01hvlnwc00' and 'riverdi,rvt70hslnwca0') and a new vendor prefix ('riverdi'=
), violating DT schema constraints.
--

commit f3ae8be063492bba7bf6849a36601078aae31f5f
Author: Vitor Soares <vitor.soares@toradex.com>

arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display 10.1" =
DSI

This patch adds a device tree overlay for the Toradex Capacitive Touch
Display 10.1" DSI on the Aquila DSI_1 interface. The display uses a TI
SN65DSI83 bridge driving a Riverdi RVT101HVLNWC00 10.1" TFT LCD panel.
It also includes an ILI2132 capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitiv=
e-touch-display-101inch-dsi

> diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-10inch=
-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-10inch-ds=
i.dtso
> new file mode 100644
> index 0000000000000..c5d597873440f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-10inch-dsi.dt=
so

[ ... ]

> +&{/} {
> +	backlight_pwm3: backlight-pwm3 {
> +		compatible =3D "pwm-backlight";
> +		brightness-levels =3D <0 45 63 88 119 158 203 255>;
> +		default-brightness-level =3D <4>;
> +		/* Aquila PWM_3_DSI (AQUILA B46) */
> +		pwms =3D <&main_ehrpwm5 0 6666667 0>;
> +	};
> +
> +	panel-lvds-bridge {
> +		compatible =3D "riverdi,rvt101hvlnwc00", "panel-lvds";
[Severity: Low]
Are the new vendor prefix and compatible strings documented in the device
tree bindings?

The vendor prefix riverdi does not appear to be documented in
Documentation/devicetree/bindings/vendor-prefixes.yaml.

Also, since panel-lvds uses a strict enum for compatible strings, using
riverdi,rvt101hvlnwc00 will cause make dtbs_check to report validation
errors unless it is added to the allowed list.

> +		backlight =3D <&backlight_pwm3>;
> +		data-mapping =3D "vesa-24";
> +		height-mm =3D <136>;
> +		width-mm =3D <217>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602115123.1324=
474-9-ivitro@gmail.com?part=3D5
