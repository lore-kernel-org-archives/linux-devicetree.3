Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676514;
	b=UqpernNdx7AGGf2Lo4rCAvibgb7JOECbqtDAKLH0K0XchxctSBwJSCAXXTtl4Ik4Ylaa
	 5mOCytyP/qGfGoHLnicpJnwT/fpy5LoRfQary5NsEJkPZHY6ahtf98y5Gj4JEb6ffOwFQ
	 hMQDo2maQGEqDUryocokvzN/8fEdZeC4SatSvhiAuengzve8V1llCK7YWZyMcHnWo5QB9
	 6GvbuVdfSfmbNIYLmiTeW4o8mioyRfp8eiQnGbrrGOuH65kX/9vfV4XsRfN3nsjD4crsc
	 7k9+mKDUjXjwFYabVf0VMNN0u3j2qsylzxb+Sm4pjlQmcaCZtr/sGr0iMwHde6Fo3lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676514;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rhL1r81qt/J+n11F3Lr+ZU1b0+/pO8cTtjyKspANkt0=;
	b=Bj1doE0SCYCaCq1iJ1gV6DbZd1x12hrR8UDZvKREvViGAMRbSCGDfmhFqk+H/xADszje
	 BZiXaXBLXneCR1ePhUQljFDPwlpWYlB46Nu8DQj4OE//qBcb8VcDHw8/XyPy9p6d9RSNE
	 RFObGYmJTdiHgpXPeAIr1wIQ75DoMYL/ZVDzH0G4kfcbVkvxvhBcQ4NWJR3RD0OvvcN2J
	 1e0D0r/fe4NmnyRbH2XdKBHdKxgbtbl+vCfPt0MCXiARzXtb3lAQbDlURUL4taE0x0PXT
	 nNMygtvuI/XCmwP9PIxpXpWp72Pk11s3S5s5ZYPNTioaDP2Q9/y7KtGPB1DsCOiH5gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fot5chN1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E04606A323
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fot5chN1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E34E1F000C1;
	Thu, 22 Oct 2026 13:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792676513;
	bh=rhL1r81qt/J+n11F3Lr+ZU1b0+/pO8cTtjyKspANkt0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fot5chN1OHuyeOb8+EAbp2FFPFK77tyv6CPzPAMFGzk9xfYAEP6M5I1+N8EdW0iUq
	 uoH/uGAGJbCqycLhHNxDI0/Ee4Ssw/zyznwRBDaZyb4kzDf0KgHQ0s7IbSUaVHxJvx
	 Io2xwABjdA2tC7w3WfKR3MykKeMZJRYWV4ZofsI7IVmJVGzku9JBRzw9o6SJEs1UvY
	 bO+v0xR7TRyCm20Syy2dNxRTAkHK9eomu0HxqFHfq9lToswEdHDfb/NZ1f7CVSAvNo
	 uHvejaimOj9G1tUfFy4a8dbLUIBSToM6YUF0+rY33m6QonuanFLgtd3CQd7nZ1HdTT
	 8Z5i0eYNLB3/A==
Message-ID: <sashiko-outbox-181560@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/7] drm/tegra: rgb: Parameterize configuration based
 on bus flags
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022132259.240717-6-clamor95@gmail.com>
References: <20261022132259.240717-1-clamor95@gmail.com>
 <20261022132259.240717-6-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 13:41:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/tegra: unlocked bridge state access in tegra_rgb_encoder_enabl=
e()
--

commit 743a0ce150c28976e990ee80b4eaf7239b83fcc3
Author: Svyatoslav Ryhel <clamor95@gmail.com>

drm/tegra: rgb: Parameterize configuration based on bus flags

This commit updates tegra_rgb_encoder_enable() to configure pixel clock
polarity, display enable polarity, and data alignment in the Tegra display
controller registers using bus flags retrieved from the attached bridge sta=
te.

> diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
> index b6d09a8d8e5ea..da9e37fe36689 100644
> --- a/drivers/gpu/drm/tegra/rgb.c
> +++ b/drivers/gpu/drm/tegra/rgb.c

[ ... ]

> @@ -104,14 +105,24 @@ static void tegra_rgb_encoder_enable(struct drm_enc=
oder *encoder)
>  	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mode;
>  	struct tegra_output *output =3D encoder_to_output(encoder);
>  	struct tegra_rgb *rgb =3D to_rgb(output);
> -	u32 value;
> +	struct drm_bridge_state *bridge_state;
> +	u32 bus_flags, value;
> +
> +	/* Get but flags from the bridge state. */
> +	bridge_state =3D drm_bridge_get_current_state(output->bridge);
> +	if (bridge_state)
> +		bus_flags =3D bridge_state->input_bus_cfg.flags;
> +	else
> +		bus_flags =3D DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> +			    DRM_BUS_FLAG_DE_HIGH |
> +			    DRM_BUS_FLAG_DATA_MSB_TO_LSB;

[Severity: High]
Does calling drm_bridge_get_current_state(output->bridge) from
tegra_rgb_encoder_enable() in drivers/gpu/drm/tegra/rgb.c access the bridge
state without holding output->bridge->base.lock?

Looking at drm_bridge_get_current_state(), it asserts that bridge->base.lock
is held before reading bridge->base.state:

include/drm/drm_bridge.h:drm_bridge_get_current_state() {
	if (!bridge)
		return NULL;

	drm_modeset_lock_assert_held(&bridge->base.lock);

	if (!bridge->base.state)
		return NULL;

	return drm_priv_to_bridge_state(bridge->base.state);
}

There appear to be two paths where output->bridge->base.lock is not held wh=
en
tegra_rgb_encoder_enable() runs:

1. Non-blocking atomic modeset commits (DRM_IOCTL_MODE_ATOMIC with
DRM_MODE_ATOMIC_NONBLOCK | DRM_MODE_ATOMIC_ALLOW_MODESET):
tegra_drm_mode_config_funcs.atomic_commit uses drm_atomic_helper_commit() in
drivers/gpu/drm/drm_atomic_helper.c, which swaps state via
drm_atomic_helper_swap_state() and schedules state->commit_work onto
system_dfl_wq, after which drm_mode_atomic_ioctl() in
drivers/gpu/drm/drm_atomic_uapi.c immediately drops all acquired modeset
locks:

drivers/gpu/drm/drm_atomic_helper.c:drm_atomic_helper_commit() {
	...
	drm_atomic_commit_get(state);
	if (nonblock)
		queue_work(system_dfl_wq, &state->commit_work);
	else
		commit_tail(state, false);
	...
}

drivers/gpu/drm/drm_atomic_uapi.c:drm_mode_atomic_ioctl() {
	...
	drm_modeset_drop_locks(&ctx);
	drm_modeset_acquire_fini(&ctx);
	...
}

When the system_dfl_wq worker executes
commit_tail() -> tegra_atomic_commit_tail() ->
drm_atomic_helper_commit_modeset_enables() ->
drm_atomic_helper_commit_encoder_bridge_enable() ->
tegra_rgb_encoder_enable(), no drm_modeset_lock is held by the worker threa=
d.

2. Bridges without .atomic_duplicate_state during synchronous modeset commi=
ts:
drm_bridge_attach() always initializes bridge->base.lock via
drm_atomic_private_obj_init(), but drm_atomic_add_encoder_bridges() skips
acquiring bridge->base.lock when the bridge does not implement
.atomic_duplicate_state:

drivers/gpu/drm/drm_atomic.c:drm_atomic_add_encoder_bridges() {
	...
	drm_for_each_bridge_in_chain(encoder, bridge) {
		/* Skip bridges that don't implement the atomic state hooks. */
		if (!bridge->funcs->atomic_duplicate_state)
			continue;

		bridge_state =3D drm_atomic_get_bridge_state(state, bridge);
	...
}

In both cases, calling drm_bridge_get_current_state(output->bridge) trigger=
s a
lockdep warning on drm_modeset_lock_assert_held(&bridge->base.lock) under
CONFIG_PROVE_LOCKING and reads output->bridge->base.state without holding
bridge->base.lock.

Should tegra_rgb_encoder_helper_funcs implement .atomic_enable() instead of
.enable() and look up the bridge state from the atomic state via
drm_atomic_get_new_bridge_state(state, output->bridge)?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022132259.2407=
17-1-clamor95@gmail.com?part=3D5
