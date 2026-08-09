Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338A326A08A
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 13:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786282544; cv=none; b=dLH/5n8bH76FLul3LAXC1ibkyWlZQlZycEZAkefnTzEWY5a89EATf9YUj0+jsdljfuI24q0dtwnVvEK1vQLUSQ0Udfsgx6DJnFLDts5kV9cKSpEULQYmp325rs9z4Il4Y7ALRSvJKK3pKXrCJmNbsLJGS+nkK1c2SRut0wYWw4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786282544; c=relaxed/simple;
	bh=ueHVOKIMukmJB+mnCI+ZGHgkR3zKHnlhb1axfuH5p0I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nu1Lwh0m2z7XHL4JRQdgSdRr1aR5nifD9MySlpsR0eKAKM8k6plGVMPC6/6WmtQxXgiHyKj2uIx1xqITsfYgYlagwiaSrl6WLyVVU3lNVlpGd5QbBdzwzEbzbY2Ew/azwZElDe5Xegbm43Cn5LEpk1bBvZGYIoeBR+VuJP4ynvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e785woHM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e785woHM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E0581F000E9;
	Sun,  9 Aug 2026 13:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786282543;
	bh=ugjGOriiU0Y2ChGNDbvl2kZUdWr9sAEtGxiFxyxChyg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e785woHMjnNjaj5kZw3qn4bBB48fUKAC855tvn7aeWigr/z3Gp5VELgEQTE7DJoXH
	 qfT12sLiYpgZrZmnE7vDBNAqD82oiJD9OsT8032KcEvEt7Ewut59pfqdhzkQZDr+KP
	 YW65vm8cMJmBVP4zy9pPUnqiH3vjuAG2Gus3P/L7KL8YE3Bx8w1tlfplQhcCl+YTDR
	 SD9FAeYH0K0D0q4n159U8r1JnzOjm8T2FTJ02Y8jGZwDncKcz7GXRVlJefyF6/8mBV
	 m0XSTlhGKxHP5b3+AfziDpQUiK9kB6xhAIsRK2PjacmtbS9p5j2iloQD+qEGf9ZZ9H
	 TiW39iG4lgPaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/17] drm/spacemit: add Saturn DPU DRM device driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cody Kang" <codykang.hk@gmail.com>
Cc: linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20260809-k3-display-v2-11-327d7910bf71@gmail.com>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-11-327d7910bf71@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 13:35:41 +0000
Message-Id: <20260809133542.3E0581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The driver calls sleeping delay functions (`usleep_range()`) from =
within CRTC atomic enable and disable callbacks, violating DRM atomic conte=
xt rules.
- [Medium] Setting drm_mode_config.max_width and max_height to a single CRT=
C's maximum resolution breaks multi-monitor support.
- [Medium] Missing error check after `drm_of_component_match_add()` inside =
the OF component loop causes device node reference leaks on subsequent iter=
ations.
--

--- Patch [11]: [PATCH v2 11/17] drm/spacemit: add Saturn DPU DRM device dr=
iver ---
commit cbbaf4042bf32b29313b65d5c670b16c44e0fb03
Author: Cody Kang <codykang.hk@gmail.com>

drm/spacemit: add Saturn DPU DRM device driver

Add the DRM device for the SpacemiT K3 Saturn display processing unit
and hook the driver up to the build. The SoC has two DPU instances;
each drives one CRTC that scans out a single primary plane in linear
RGB at up to 3840x2160@60 and feeds a downstream DP/eDP controller
over an OF-graph endpoint. Buffers use drm_gem_shmem_helper. The
AFBC/compressed decode path is not exposed and writeback is not
implemented.

> diff --git a/drivers/gpu/drm/spacemit/spacemit_drm.c b/drivers/gpu/drm/sp=
acemit/spacemit_drm.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/gpu/drm/spacemit/spacemit_drm.c

[ ... ]

> +int spacemit_drm_mode_config_init(struct drm_device *drm)
> +{
> +	int ret;
> +
> +	ret =3D drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +
> +	drm->mode_config.min_width =3D 1;
> +	drm->mode_config.min_height =3D 1;
> +	/* K3 user manual: each DPU scans out at most 3840x2160@60 */
> +	drm->mode_config.max_width =3D 3840;
> +	drm->mode_config.max_height =3D 2160;

[Severity: Medium]
Will setting max_width and max_height to a single CRTC's maximum resolution
break multi-monitor support?

These values dictate the maximum dimensional bounds for the entire DRM
framebuffer, not just a single CRTC's scanout. Windowing systems allocating
a single large framebuffer to span all connected monitors might fail if they
attempt to configure side-by-side dual monitors exceeding 3840x2160.

> +
> +	drm->mode_config.funcs =3D &spacemit_drm_mode_config_funcs;
> +	drm->mode_config.helper_private =3D &spacemit_drm_mode_config_helper;
> +
> +	return 0;
> +}

[ ... ]

> +int spacemit_drm_of_component_probe(struct device *dev)
> +{
> +	struct device_node *ports, *port, *ep;
> +	struct device_node *remote;
> +	struct component_match *match =3D NULL;

[ ... ]

> +	for_each_child_of_node(ports, port) {
> +		if (!of_node_name_eq(port, "port"))
> +			continue;
> +		for_each_child_of_node(port, ep) {
> +			if (!of_node_name_eq(ep, "endpoint"))
> +				continue;
> +			remote =3D of_graph_get_remote_port_parent(ep);
> +			if (!remote)
> +				continue;
> +			if (of_device_is_available(remote))
> +				drm_of_component_match_add(dev, &match,
> +							   compare_of, remote);

[Severity: Medium]
Could this loop leak an OF device node reference on subsequent iterations
if drm_of_component_match_add() fails and returns an error pointer?

If drm_of_component_match_add() encounters a memory allocation failure, it
sets the match pointer to ERR_PTR(-ENOMEM). Because this loop does not
check IS_ERR(match) to break out early, subsequent iterations will pass the
error pointer back into the function.

Internally, drm_of_component_match_add() unconditionally calls of_node_get()
to increment the reference count, but component_match_add_release()
immediately returns without registering a release callback when the match
pointer is already an error.

> +			of_node_put(remote);
> +		}
> +	}

[ ... ]

> diff --git a/drivers/gpu/drm/spacemit/spacemit_crtc.c b/drivers/gpu/drm/s=
pacemit/spacemit_crtc.c
> --- a/drivers/gpu/drm/spacemit/spacemit_crtc.c
> +++ b/drivers/gpu/drm/spacemit/spacemit_crtc.c

[ ... ]

>  static void spacemit_crtc_atomic_enable(struct drm_crtc *crtc,
>  					struct drm_atomic_commit *old_state)
>  {
>  	struct spacemit_crtc *a_crtc =3D to_spacemit_crtc(crtc);
>  	struct spacemit_drm_private *priv =3D crtc->dev->dev_private;
>  	int idx;
>  	int ret;
>=20
>  	if (!drm_dev_enter(crtc->dev, &idx))
>  		return;
>=20
>  	trace_spacemit_crtc_atomic_enable(a_crtc->dev_id);
>=20
>  	/*
>  	 * U-Boot leaves its boot-logo pipeline running. Hard-stop it with the
>  	 * resets alone; the clocks are not ours to gate until we have enabled
>  	 * them.
>  	 */
>  	if (unlikely(a_crtc->first_modeset)) {
>  		ret =3D reset_control_bulk_assert(ARRAY_SIZE(priv->pipe_resets),
>  						priv->pipe_resets);
>  		if (ret)
>  			dev_warn(a_crtc->dev,
>  				 "failed to assert resets: %d\n", ret);
>  		usleep_range(10000, 20000);

[Severity: High]
Does this code call a sleeping function from within atomic context?

CRTC atomic enable callbacks execute in atomic context, where sleeping is
strictly forbidden. Calling usleep_range() here can cause kernel warnings,
system instability, and potential deadlocks.

>  		a_crtc->first_modeset =3D false;
>  	}

[ ... ]

>  static int dpu_pm_suspend(struct device *dev)
>  {
>  	struct spacemit_drm_private *priv =3D dev_get_drvdata(dev);
>  	struct spacemit_crtc *a_crtc =3D priv->a_crtc;
>  	int ret;
>=20
>  	/*
>  	 * Assert before gating: a reset asserted into an already-gated block
>  	 * has no clock edges to propagate on and leaves the register file
>  	 * untouched.
>  	 */
>  	ret =3D reset_control_bulk_assert(ARRAY_SIZE(priv->pipe_resets),
>  					priv->pipe_resets);
>  	if (ret)
>  		dev_warn(dev, "failed to assert resets: %d\n", ret);
>  	usleep_range(10000, 20000);

[Severity: High]
Is this sleeping function also reached from atomic context?

Because dpu_pm_suspend() is called during CRTC atomic disable (via
spacemit_crtc_atomic_disable()), this usleep_range() call also occurs in an
atomic context where sleeping is forbidden.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-k3-display=
-v2-0-327d7910bf71@gmail.com?part=3D11
