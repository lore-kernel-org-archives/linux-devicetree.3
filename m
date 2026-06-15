Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D773A7F58
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781505659; cv=none; b=tWsDfz0KhEXfhhKzTcKX5aBHORsfhXwrRjd1SyrQvrMSXFjOUG/6Qm0C3Eun2ZzVmO1aODkGB1cUayo+kSqj0LeAk8bY8TO4lVAtkrZelWznxjIqgpInJsNAH7lZha4nYDK+7/0hLfo/UjVFj13bl6JaaiiXMJv234h0qOY4vx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781505659; c=relaxed/simple;
	bh=MjkUbsX3SaSD2VZkXKrsV4JjZyXRysVFfTDQQw62Yy8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IJniy/LwoyVnvKUKBRXxEORLa3AOO3aGdiRC61HZAJLGc/UvyCbk4Oe7aYfPdMQEt+NqRDX291kG7IATe0tmXa3XMkfvEm+iEANVKaWntjd5H/tyysW4CVyvXbEE/5ZagaarqQ1IdYKGRIDgD9//SeWV8fKzKQSHMB3E/cuC5/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRqP6/B/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRqP6/B/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481A71F000E9;
	Mon, 15 Jun 2026 06:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781505658;
	bh=tWnt9Ww98hhgzq9XvVcEyk8KWxVkx9x5gfaAj+61UtQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iRqP6/B/ftxNnLHcGWeD/pIMZyhxa3KjXxJilXEmi9ktJxFhlAZ3xjCL2O4hZiZw8
	 gtizn5gpwU4WGOrtMEzUuUHEZ88OYgMIqDhtA6pUOdB8xfHehUwJH54ijtckAYjiJ+
	 X2TfdvqMUiHxIQvPmml+8pqCgc7BrGGGFe39ZtrfMIPaBduOGWH6F43OmPBSkF43YL
	 3GAHg9Hv21ZPRFbwGkTYr266wF2MLMlp6C2c2/7E9QrUcExRX6GhRpr5ZwilK15cuF
	 iguPDILrYkcoGaMBkrDJB8JTyOgcHsYLL5W8QIZas2sDE9aLUF5l1oNtHjG9MwxgqA
	 rprPDLaXngRfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/7] drm/rcar-du: dsi: Support DSC in the pipeline
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomi Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615-rcar-du-dsc-v4-4-93096a1b56a3@ideasonboard.com>
References: <20260615-rcar-du-dsc-v4-4-93096a1b56a3@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 06:40:57 +0000
Message-Id: <20260615064058.481A71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unsafe bridge advancement leads to NULL pointer dereference and ty=
pe confusion
--

commit 1b871953b11e075ad828c5d792325efbdffe6d91
Author: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

drm/rcar-du: dsi: Support DSC in the pipeline

This commit adds checks to rcar_du_crtc_atomic_enable() and disable() to
detect the DSC via the bridge type. It skips the DSC bridge when needed so
that the crtc correctly calls rcar_mipi_dsi_pclk_enable() on the DSI instead
of the DSC.

> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c b/drivers/gpu=
/drm/renesas/rcar-du/rcar_du_crtc.c
> index 1a246ebbfc613..5679983fc4d1a 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
> @@ -754,6 +754,15 @@ static void rcar_du_crtc_atomic_enable(struct drm_cr=
tc *crtc,

[ ... ]

>  	if ((rcdu->info->dsi_clk_mask & BIT(rcrtc->index)) &&
>  	    (rstate->outputs &
>  	     (BIT(RCAR_DU_OUTPUT_DSI0) | BIT(RCAR_DU_OUTPUT_DSI1)))) {
>  		struct drm_bridge *bridge =3D rcdu->dsi[rcrtc->index];
> =20
> +		/*
> +		 * When we have a DSC block between the DU and the DSI,
> +		 * the "bridge" points to the DSC. Detect the DSC by looking
> +		 * at the bridge type, and skip the DSC if the bridge is not
> +		 * the DSI bridge.
> +		 */
> +		if (bridge->type !=3D DRM_MODE_CONNECTOR_DSI)
> +			bridge =3D bridge->next_bridge;
> +

[Severity: High]
Could this lead to a NULL pointer dereference or type confusion if the devi=
ce
tree is misconfigured?

If bridge->next_bridge is NULL, passing it to rcar_mipi_dsi_pclk_enable()
would dereference a NULL pointer when it accesses bridge->encoder.

Additionally, if the next bridge exists but is not an rcar_mipi_dsi bridge
(for instance, a generic panel bridge), the container_of() cast in
bridge_to_rcar_mipi_dsi() would result in type confusion and potential
memory corruption.

Should we verify that the new bridge is valid and is actually the expected =
DSI
bridge before proceeding?

>  		rcar_mipi_dsi_pclk_enable(bridge, state);
>  	}
> =20
> @@ -796,6 +805,15 @@ static void rcar_du_crtc_atomic_disable(struct drm_c=
rtc *crtc,

[ ... ]

>  	if ((rcdu->info->dsi_clk_mask & BIT(rcrtc->index)) &&
>  	    (rstate->outputs &
>  	     (BIT(RCAR_DU_OUTPUT_DSI0) | BIT(RCAR_DU_OUTPUT_DSI1)))) {
>  		struct drm_bridge *bridge =3D rcdu->dsi[rcrtc->index];
> =20
> +		/*
> +		 * When we have a DSC block between the DU and the DSI,
> +		 * the "bridge" points to the DSC. Detect the DSC by looking
> +		 * at the bridge type, and skip the DSC if the bridge is not
> +		 * the DSI bridge.
> +		 */
> +		if (bridge->type !=3D DRM_MODE_CONNECTOR_DSI)
> +			bridge =3D bridge->next_bridge;
> +

[Severity: High]
Would this have the same risk of a NULL pointer dereference or type confusi=
on
during the disable path when passed to rcar_mipi_dsi_pclk_disable()?

>  		/*
>  		 * Disable the DSI clock output, see
>  		 * rcar_du_crtc_atomic_enable().
>  		 */
>  		rcar_mipi_dsi_pclk_disable(bridge);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-rcar-du-ds=
c-v4-0-93096a1b56a3@ideasonboard.com?part=3D4
