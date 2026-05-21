Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467BB34AB03
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377152; cv=none; b=BaWvb8Ft88EmLeCnNLJRc3blWff9TrOn5xIoyMTV2SQG2m6/Cqqmcr2SLOl8u+haI1odxI6Wgv+bti3vQtmXvCAXK9VxItjwDKpA/4EnVcoSfdg464sAcnSmbMG4o0iY0as/SE5YJAyTppKAiflAEehIy749o0+dg+Uize/QJLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377152; c=relaxed/simple;
	bh=ZFX15B9OZeTj1rWki3S0O9P5l+D8Jstnnz0li742ooA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PxxtO90/5Ce0q4qw0XK+5ARws/vQ7iSz/qdLOSdC9JLbYxJTWcqAqcNL32L/IgQf4teRkeLmHiprSjMzPpFmich6fHxwDvbOVGvTgVmMlZ1FZzL/EY07dZBH/zzOZZL2PUxU+TY3SdaRqWE7mv0iUoffI2JzO9uxnXJDwKZlM4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SOrT2YlE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SOrT2YlE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A928B1F000E9;
	Thu, 21 May 2026 15:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779377150;
	bh=PsYjRo36TCdvig8x6+l9K2dfGmCm7yQhNtMqlN0rJBM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SOrT2YlE4U9ou9D69vQPs7i6XVPSpcsN5090Kwn210jz7mjPAahrOHSQzKJ4pCt1i
	 NL4s5SplJxyrWyDkM/6SoLMEIMUX/hL93VOv4Co64ZuGSjnmRffo5q3F2LwDI63Db6
	 vAvZdU2KHDxyl+n7iFdiSywUz1vdcXawrZqqDEnY8K6ddPo7MZErBAXtCJw73zlx9D
	 AhSIoZeogDUgUwg/ObfHSGLbMXwka8dgNQUFFas0oDGGdoJPsujiA7Jkxz6dtmSCNX
	 8QqQHh8zal0Emm4+XCuo5yH+5tnRcf9fRrXBPsbNc2q57OXV+6wUab9PFUrFFzM5It
	 wFszRTtsFUpWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 06/15] arm64: dts: ti: k3-am62-verdin: Add Toradex
 Capacitive Touch Display 10.1" DSI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vitor Soares" <ivitro@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260521150038.103538-23-ivitro@gmail.com>
References: <20260521150038.103538-23-ivitro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 15:25:50 +0000
Message-Id: <20260521152550.A928B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect interrupt trigger type configured for the active-low t=
ouchscreen interrupt pin.
--

commit 2b76fed10d722885f62d56294af26475663bbac9
Author: Vitor Soares <vitor.soares@toradex.com>
arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display 10.1" =
DSI

This commit adds a device tree overlay for the Toradex Capacitive Touch
Display 10.1" on the Verdin DSI_1 interface. It also combines the overlay
with the Verdin AM62 Dahlia carrier board device trees to provide
ready-to-use DTBs.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitiv=
e-touch-display-101inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-displa=
y-adapter/

> diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inc=
h-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-=
dsi.dtso
> new file mode 100644
> index 0000000000000..de0148ddd5969
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-dsi.d=
tso

[ ... ]

> +	touch@41 {
> +		compatible =3D "ilitek,ili2132";
> +		reg =3D <0x41>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_dsi1_int>, <&pinctrl_i2s_2_bclk_gpio>;
> +		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
> +		interrupt-parent =3D <&main_gpio1>;
> +		interrupts =3D <49 IRQ_TYPE_EDGE_RISING>;

[Severity: Medium]
Is IRQ_TYPE_EDGE_RISING the correct trigger type here?

The comment mentions TOUCH_INT#, which usually indicates an active-low
signal. If the hardware line is active-low, triggering on the rising edge
might cause the interrupt to only fire when the line is de-asserted (such
as when a user lifts their finger).

Could this lead to delayed or erratic touch input since the driver relies
on the device tree for the interrupt trigger configuration? Other Verdin
overlays appear to use IRQ_TYPE_EDGE_FALLING for this same pin.

> +		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
> +		reset-gpios =3D <&main_gpio0 35 GPIO_ACTIVE_LOW>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521150038.1035=
38-17-ivitro@gmail.com?part=3D6
