Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9F135A39F
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 19:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778786777; cv=none; b=MH46ZsT8C4xL4LcD8kvtQVGo2xZ9P29Rt++LGyS0rUKOcpnbAMhtAUVBvltEfRvd3oyBtHQt5B/HVzKr/YyjYoo+ck9GNMQQpmwMWdx5p0KLSKRX6KTYshS8/wPDbXGtJt7IC+GEXPqhTmeo41SkJzvYyKUjDNLF3GZ9Frg9yCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778786777; c=relaxed/simple;
	bh=7O/Saw8JSEK2O57W7o/SoR0E9wont6r9wDhg/m0rm14=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p00He7t6KIe5hF3oKnx7eTXywJ0coc638YUcQDyBCC8+5kDE/Eoq/827RYA8ijgwZcc7HTm0D+40eqC/MBkFpzGrtbXldCJOop3X+MEUj38HAi5QIaZ2/SWLvHkXAJA7i6NwIoKfOwz2nfS4ed5q5lFQOhAcETpKCT90swBG9RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tqPykkCp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tqPykkCp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20EB5C2BCB3;
	Thu, 14 May 2026 19:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778786777;
	bh=7O/Saw8JSEK2O57W7o/SoR0E9wont6r9wDhg/m0rm14=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=tqPykkCpZEVSoQgSljQTnaf/2WVNXTyMWjz1Bjk/xRHNfLuUbqexTVUC4O4iZJqF8
	 X4Ln7VN5p46bS+Or1uMOKLliaL+DgRvwDQUHxhaIFO6pfQ47O7kO1WeVNQnNJUpB/H
	 QNi0BkZGdFGKvbDUQrX8WeiFapMQsPpFamK8VUSgVPj3eDvVkQWnDem4t0zV9V07T8
	 jlKu5zBZpewSDoIxVXMz77NTSI8jE+hbLT13SUnnr7Vf4Z8kBTwwvzw04v0yQxfDuR
	 hXIdmpKnluY4owD3R/tIqtpuqI9ij8oDeivUcwiCYV9F+Kxcx+qYBMm8lBhtJ1bfY0
	 kPL6tt9vw/B/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] drm/rcar-du: dsc: Add rudimentary Renesas R-Car V4H
 DSC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomi Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260514-rcar-du-dsc-v1-3-d65f7a9e9841@ideasonboard.com>
References: <20260514-rcar-du-dsc-v1-3-d65f7a9e9841@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 19:26:16 +0000
Message-Id: <20260514192617.20EB5C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Resource leak of the `next_bridge` reference on probe failure and =
driver unbind.
- [Medium] Kconfig logic error prevents the driver from being compiled unde=
r `COMPILE_TEST` when `DRM_RCAR_DU` is disabled.
- [Medium] Unbalanced clock disable and reset assertion if initialization f=
ails in `rcar_dsc_atomic_enable()`.
- [Low] Usage of the deprecated `devm_reset_control_get()` API.
--

commit f5db250d6f577d9fcb67af0530df62ba814ec079
Author: Marek Vasut <marek.vasut+renesas@mailbox.org>
drm/rcar-du: dsc: Add rudimentary Renesas R-Car V4H DSC driver

This commit adds a rudimentary VESA DSC encoder driver for the R-Car V4H So=
C,
which acts as a pass-through bridge and allows DSI1 to be operational.

> diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/re=
nesas/rcar-du/Kconfig
> index 840305fdeb49a..a51f996d35375 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig

[ ... ]

> @@ -33,6 +33,19 @@ config DRM_RCAR_DW_HDMI
>  	help
>  	  Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
> =20
> +config DRM_RCAR_USE_DSC
> +	bool "R-Car DU DSC Encoder Support"
> +	depends on DRM_BRIDGE && OF
> +	depends on DRM_RCAR_DU || COMPILE_TEST
> +	default DRM_RCAR_DU
> +	help
> +	  Enable support for the R-Car Display Unit embedded DSC encoder.
> +
> +config DRM_RCAR_DSC
> +	def_tristate DRM_RCAR_DU

Because DRM_RCAR_DSC is a hidden config with def_tristate DRM_RCAR_DU, will
it always evaluate to 'n' if DRM_RCAR_DU is disabled, even when COMPILE_TEST
is enabled through DRM_RCAR_USE_DSC?

This seems like it would prevent the driver from actually being compiled un=
der
COMPILE_TEST when the main DU driver is not selected.

> +	depends on DRM_RCAR_USE_DSC
> +	select RESET_CONTROLLER

[ ... ]

> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c b/drivers/gpu/drm=
/renesas/rcar-du/rcar_dsc.c
> new file mode 100644
> index 0000000000000..2ab5a4bb099c3
> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c

[ ... ]

> +static void rcar_dsc_atomic_enable(struct drm_bridge *bridge,
> +				   struct drm_atomic_state *state)
> +{
> +	struct rcar_dsc *dsc =3D bridge_to_rcar_dsc(bridge);
> +
> +	WARN_ON(clk_prepare_enable(dsc->clk));
> +	WARN_ON(reset_control_deassert(dsc->rst));
> +}
> +
> +static void rcar_dsc_atomic_disable(struct drm_bridge *bridge,
> +				    struct drm_atomic_state *state)
> +{
> +	struct rcar_dsc *dsc =3D bridge_to_rcar_dsc(bridge);
> +
> +	reset_control_assert(dsc->rst);
> +	clk_disable_unprepare(dsc->clk);

If clk_prepare_enable() fails in rcar_dsc_atomic_enable(), it returns an er=
ror
code but execution proceeds since the function returns void.

Will the unconditional call to clk_disable_unprepare() here lead to
unbalanced clock operations and trigger underflow warnings in the clock
framework?

[ ... ]

> +	dsc->clk =3D devm_clk_get(dev, NULL);
> +	if (IS_ERR(dsc->clk))
> +		return dev_err_probe(dev, PTR_ERR(dsc->clk),
> +				     "Failed to get CPG clock\n");
> +
> +	dsc->rst =3D devm_reset_control_get(dev, NULL);

This isn't a bug, but devm_reset_control_get() is documented as a deprecated
transition wrapper in <linux/reset.h>. Should this use
devm_reset_control_get_exclusive() instead?

> +	if (IS_ERR(dsc->rst))
> +		return dev_err_probe(dev, PTR_ERR(dsc->rst),
> +				     "Failed to get CPG reset\n");
> +
> +	remote =3D of_graph_get_remote_node(dev->of_node, 1, 0);
> +	if (!remote)
> +		return -EINVAL;
> +
> +	dsc->bridge.next_bridge =3D of_drm_find_and_get_bridge(remote);
> +	of_node_put(remote);
> +	if (!dsc->bridge.next_bridge)
> +		return -EPROBE_DEFER;
> +
> +	dsc->bridge.of_node =3D dev->of_node;
> +
> +	return devm_drm_bridge_add(dev, &dsc->bridge);
> +}

of_drm_find_and_get_bridge() intentionally increments the module and device
reference counts for the returned bridge.

If devm_drm_bridge_add() fails, does this leak the reference to
next_bridge?

Also, since the driver lacks a .remove callback or a devm cleanup action, is
the reference permanently leaked when the driver is unbound?

Could this use the managed devm_drm_of_get_bridge() API to ensure proper
lifecycle management?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-rcar-du-ds=
c-v1-0-d65f7a9e9841@ideasonboard.com?part=3D3
