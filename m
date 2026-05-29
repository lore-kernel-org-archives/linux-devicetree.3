Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBA224468C
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 13:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780061570; cv=none; b=j69+CQWsTlBkpH/6ET8W4nUhATh2UsyQdtUN8fIpOJKvzDbbsCsW3rykyfciqH9IoAvbybtgnDgjKJ2vbAoSgioHfPSVHbcTEFeOYYv+fhxyg5EIQaZ9O6nTTp0NF2nqzC0cfgWzj4qNOlA5nKJrVt+vlQGXriJYTnKJVH1z8Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780061570; c=relaxed/simple;
	bh=eGPz/hP/VXHOK1QX1w1iebTSs+pMKoUyDahc61zIlZE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ckoyDlXSWR5vouZFHvhdFk0cOtYsEepKWAgOjlvrw6n0vR9b9Trbr0M4sQUlAk1fjwRCMIltodB7NSqJ+zMn9NSdvZPhfpl/pmxS4gAke5IMgW72wH8ZGqx7TmBWuqrT0FuLVGl9KzX0V0cZonXCDBthydwnSMS2I65pStOzMQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEmQA6A8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEmQA6A8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897C61F00893;
	Fri, 29 May 2026 13:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780061568;
	bh=QvNQIUMILd9DqJOqRhDpjwWgBzv/l2qFJJ8E8DeStxA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cEmQA6A8qjuSWirXowxjOwChnGj03J2G1SN5MqVnU1H/4hUwWm7INftBFs8m6RDm1
	 oe2Jlu+bDqubzTKTbZSoPHWEvyNxT09uQDtriAVrXUUibbRkPCqSGp9r1DuupjzPNw
	 OUpwIEHIVJmyHfJrcwNiaHFdRnq6lwG9MShBfsyS5OiLOkmto0Yf+p61NVABMAggPb
	 1AcwsEZFn+9n6lGfsHF4RicEIlxveg6VzCZqV8YU1XYXBzc0pAg8w9QJ5QxqZ6Xoq8
	 /k1keOd5HIHjdicyUjcS/PVTiM/ZBoPcgA57pD9/XSGiZ1sBcbdtzFl5qBV8bTIkpU
	 FpXeucPmQvUBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/7] arm64: dts: ti: k3-am69-aquila: Add Toradex
 Capacitive Touch Display 10.1" DSI with adapter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vitor Soares" <ivitro@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529120853.636015-12-ivitro@gmail.com>
References: <20260529120853.636015-12-ivitro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 13:32:48 +0000
Message-Id: <20260529133248.897C61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The compatible string 'riverdi,rvt101hvlnwc00' is used for the pane=
l-lvds-bridge but is not documented in the panel-lvds.yaml device tree bind=
ings.
--

commit 6da5915d7239711d881dbcc76243cee1bbd475cc
Author: Vitor Soares <vitor.soares@toradex.com>

arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display 10.1" =
DSI with adapter

This commit adds a device tree overlay for the Toradex Capacitive Touch Dis=
play
10.1" DSI on the Aquila Development Board. It configures the internal Texas
Instruments SN65DSI83 DSI-to-LVDS bridge, a Riverdi 10.1" TFT LCD panel, and
an Ilitek ILI2132 touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitiv=
e-touch-display-101inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-displa=
y-adapter

> diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touc=
h-10inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap=
-touch-10inch-dsi.dtso
> new file mode 100644
> index 0000000000000..d24207a149a06
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-10inc=
h-dsi.dtso

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
This isn't a bug, but is the riverdi,rvt101hvlnwc00 compatible string
documented in the device tree bindings?

It appears to be missing from panel-lvds.yaml or any other binding
schema, which could trigger dtbs_check validation warnings.

> +		backlight =3D <&backlight_pwm3>;
> +		data-mapping =3D "vesa-24";
> +		height-mm =3D <136>;
> +		width-mm =3D <217>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529120853.6360=
15-9-ivitro@gmail.com?part=3D3
