Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1708B3E63B6
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064751; cv=none; b=p+2B4sKNLpYPLBRN/oqHyfjr2BdKUPPUSxaHdwe3lQnjcBtzav2LbgCPlmm5pL35LjlmzlZeMVUKrZMFKZu/XuLBHS7nrwoZpisQ/Ts4AryOhpGFVuFesAbOJqRZUj35IxSVE0TgtkkpZDRjbSU5gWWPientvl5iKUqISoBAF4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064751; c=relaxed/simple;
	bh=LFHVuIaOlpfOfY78B9lOE36JTqD5OwOfqeTB4lwVero=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=isfA1HMfd3ecslWkjNJQOgMb58ynmMOhvoM1jWuleB/He94jdw/ahkrZRwaSmvfuKiMjeOiePsN4d48rDUitPUI2TgC/HDhx2vw4jJ/gsB97TNCa+eqNLwZpiF1cAbnpVfYvcXYdwboYIcQ2eQT3LRKDPJdVGBvCBp/XWgZ0H0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fgwl8Rs9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fgwl8Rs9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 831911F00893;
	Fri, 29 May 2026 14:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780064749;
	bh=4JcrFTgQI9vZRqhWydgXIyh5dgdPmej79kEJn/3eup0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fgwl8Rs9yzm+QPQx1EcHZ6PGgE1fxYYIdqU9M1w1ByEqzfXipl0y+dYSm2TV4Ut5t
	 1hz5bRaBrqS2s7/ZcKcIZdWO9aiwF5+t5MOKFLf9+/eHkur5VR4Zj7FdD6kQidqfep
	 EaTwZ2h/8+011BZViVDl45I6eSGj2LUnIJQIXi5Dj3jMoEa/L3cmarLQtM0cgHKpru
	 elu3Gjk1y+VPraWGlMcNhUSq1WcB1cUKo2aV9/qS2qpX5Gqs/U6gx0Jh6t+BrzEIzG
	 bP/a1Jjvkhe7YEzw07jUeWdNyXyAkxFPkQPsmcwg0tOpheqvf1R6fJfCId8GvtS0JX
	 +2Xdp3ockJBCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 5/7] arm64: dts: ti: k3-am69-aquila: Add Toradex
 Capacitive Touch Display 10.1" DSI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vitor Soares" <ivitro@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260529120853.636015-14-ivitro@gmail.com>
References: <20260529120853.636015-14-ivitro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 14:25:49 +0000
Message-Id: <20260529142549.831911F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The panel compatible string 'riverdi,rvt101hvlnwc00' is used for th=
e LVDS panel without being documented in any dt-binding schema.
--

commit 16f710376251336a2f18cb25c4edfa0ffe46414a
Author: Vitor Soares <vitor.soares@toradex.com>

arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display 10.1" =
DSI

This commit adds a device tree overlay for the Toradex Capacitive Touch
Display 10.1 inch DSI on the Aquila DSI_1 interface. It also updates the
Makefile to combine the overlay with the Aquila AM69 Clover carrier board
device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitiv=
e-touch-display-101inch-dsi

> diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-10inch=
-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-10inch-ds=
i.dtso
> new file mode 100644
> index 0000000000000..3880026951f36
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
Is the riverdi,rvt101hvlnwc00 compatible string missing from the device tree
bindings documentation?

It looks like this panel is used without being documented in any dt-binding
schema, such as the panel-lvds.yaml items enum. This will likely cause make
dtbs_check to fail with a validation error since unevaluatedProperties rest=
ricts
the allowed compatible items.

> +		backlight =3D <&backlight_pwm3>;
> +		data-mapping =3D "vesa-24";
> +		height-mm =3D <136>;
> +		width-mm =3D <217>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529120853.6360=
15-9-ivitro@gmail.com?part=3D5
