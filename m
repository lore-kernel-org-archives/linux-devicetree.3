Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D303D9058
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784881167; cv=none; b=EYmCdvRbpRXkkxmVww6Ps8EsgJhwwemQI4cfqBgopSj/uYkFoKX9xKKQpsYtGCKr4f6NlRCJl/fhnEsKLJfX6dUOPpFEqIWQ18f7+Tdao9B65h7/JR4pQYbGkQkB7zixR1qZZ9wq6FtNWXGsn/FqLmm3xnusExZuQrTow9jYr6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784881167; c=relaxed/simple;
	bh=jtOpnVEBhiHVdvXsRdhYrn8HJGrFyhtGOB0h+wIvoeU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pkpnXDhLIq3WQTUqAuMpgch+4N6fu4YzDsoFu8tHH0GbeQ8HzJ4ailaRVd7Ifd+yi0usPXCOLKKDMwzImmfpTsjbA9TGx3YZFR9b3DMDLJYGS9yP6Gwt92oIwbaqz6raOrfPpA3MK/9QPOXxDtmRZQgl1ahFq6xvu9Ru0eDR4tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXxgDfsB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXxgDfsB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9787E1F000E9;
	Fri, 24 Jul 2026 08:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784881160;
	bh=gWx9UNVjnKtfoMQ6Z9LFyVzOm7NhkgnrUH+MpbB/elI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nXxgDfsBwm+ZUt6Eth+EAa3OfgEVuYG3YfvDrEyPevhJobDxTtWYj61sq68Ij4MgZ
	 1783J+sGf5X9ioDch5oRmsUYqdiCYERFt8P79KU5NaTz9xB2BwFm0OQZykF0N4ZjZ1
	 Xxwwe5lkHcIgka4SByz/A/7vq1Q0ezw/8eLRO9tKUsKNbnM8bKJdhFdwS/mPlvfWZv
	 m+4YsKxmddx9EhpEJ3Uo9CNIfrhPTaZS0lXY/Z99o43agP64ed36B0RUVU1eHCQI6k
	 0YdNSW5yieYn2FPB0bqWPq8fAfme6guLi6KYjCQUa4imjdbBnjXh28Kv6CXge7d2qp
	 hWKZ3ZVQ60WkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] drm/rockchip: lvds: propagate bus_flags to the
 CRTC state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rok Markovic" <rok@kanardia.eu>
Cc: devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260724080824.115260-2-rok@kanardia.eu>
References: <20260724080824.115260-1-rok@kanardia.eu>
 <20260724080824.115260-2-rok@kanardia.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 08:19:19 +0000
Message-Id: <20260724081919.9787E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] rockchip_lvds_bind overwrites external bridge function pointers, p=
erforms invalid frees on error paths, and leaks objects on unbind.
--

--- Patch [1]: [PATCH v2 1/4] drm/rockchip: lvds: propagate bus_flags to th=
e CRTC state ---
commit 1b0e3d7f00cf4d61b195bc93e8d5dc954705b92b
Author: Rok Markovic <rok@kanardia.eu>

drm/rockchip: lvds: propagate bus_flags to the CRTC state

rockchip_lvds_encoder_atomic_check() sets output_mode and output_type
but never copies the connector's bus_flags into the Rockchip CRTC state.
This prevents the VOP from deriving the pixel clock polarity, causing
panels to be clocked on the wrong edge.

> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/r=
ockchip/rockchip_lvds.c
> index 7a0c4fa29f2f0..150299c12298a 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c

[ ... ]

While reviewing this patch, I noticed some pre-existing issues in the same
file.

Looking at rockchip_lvds_bind():

	if (lvds->bridge) {
		lvds->bridge->driver_private =3D lvds;
		lvds->bridge->ops =3D DRM_BRIDGE_OP_MODES;
		lvds->bridge->funcs =3D &rockchip_lvds_bridge_funcs;

[Severity: High]
This is a pre-existing issue, but does overwriting the bridge's function
pointers and private data here destroy the foreign driver state if this is
an external bridge?=20

It seems this would break drm_bridge_is_panel() and prevent the bridge from
being enabled or providing modes.


Further down in rockchip_lvds_bind() on the error path:

err_free_bridge:
	drm_panel_bridge_remove(lvds->bridge);

[Severity: High]
This is a pre-existing issue, but could this error path leak the panel brid=
ge?

Since the bridge's funcs were overwritten earlier in this function,
drm_bridge_is_panel() will return false. This would cause
drm_panel_bridge_remove() to early-return without freeing the bridge.


Looking at rockchip_lvds_unbind():

static void rockchip_lvds_unbind(struct device *dev, struct device *master,
				void *data)
{
	struct rockchip_lvds *lvds =3D dev_get_drvdata(dev);
	const struct drm_encoder_helper_funcs *encoder_funcs;

	encoder_funcs =3D lvds->soc_data->helper_funcs;
	encoder_funcs->disable(&lvds->encoder.encoder);
	pm_runtime_disable(dev);
}

[Severity: High]
This isn't a bug introduced by this patch, but is the unbind function
missing cleanup for the bridge, encoder, and connector?=20

It appears these objects will leak and corrupt the DRM state list on
every unbind.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724080824.1152=
60-1-rok@kanardia.eu?part=3D1
