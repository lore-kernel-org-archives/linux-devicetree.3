Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676867;
	b=wgUdxP8ZbaIRs9Oqzz4XeZ2q7E29TCfhgzzTULVQU+56FG6wG0jRBv4JYpGAaIgTCQ0+
	 u78J/mIF725NwmkQGuYiOIKLR9GgLSZGIRY0xTaPZOkpp6zS/V//GqukDcGu80GPuCVVj
	 szW3FpfhvZ7nW0hKS1Op+PBaKk08ARspZfnnz9R6Or9pizSglPE5a4w2IFlwLSUgzaxR/
	 37DSbm7FSi+QKTvJW1/a1a9lw3gXI5fp/bm5FS9Sc8WVF2Zzfje82TvIZt8brfT5Zv6d6
	 NWKlvCE3VBWSrgq8OSKDGFfzpEkoqxP0+wo1YwRhwuiBnrzbs+vKGYcaNKzGY0NNhLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676867;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OxxKOH7t6FGURuJlztIT2JeBLZQD+0wcCCE6Y7WLeZw=;
	b=c1WdLReM29QwRp6jKoS4gmjOdK0o0qzY2DVWQiUyO5EwUuWmzMWXGPjDd80gUNh8Natc
	 zCiD1dCfan47+GH2f9sx+7FQ30EJYnt/XQu2gEmHOfLj51m31QiS9I/FxJn+sQH/ur4td
	 gns6aVztOa5XsqJWwnTsa09TVc7uYIfryoaSUnPvFfStribfiVmxWsRgds2hOaWmgYDBc
	 OhgpO45/zQqGf3laq1NjVBDojy9w99dKb1UWSqKI0TYJg/aAgWKoM0kUv/CHAhP6ZEXRQ
	 qUH/A9MFEJRX3ecXJ7WdAjOTxwCxC9DVx7bgUS+fbTIqMZs1+j8kKsGYK/TL2R6NLcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UGlQNmbO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1550560A6F6C
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UGlQNmbO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93FEA1F000C1;
	Thu, 22 Oct 2026 13:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792676866;
	bh=OxxKOH7t6FGURuJlztIT2JeBLZQD+0wcCCE6Y7WLeZw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UGlQNmbO1kSZCqA3+rn17josT3C3IhTMDY1pDLco957Sh+CXl2Q+ENuCrEHkRLSb9
	 aKGMkqCrNEo7AIKWq+/K1yFQpGdZzkw0McDwmsoI6l1zDHniLStY4DTqALu9tgNi8Y
	 g7iSJf4dTwOii7tOZ6+uNz0l0s8wvZsGBXRWwIggDpV7IFdiTFviehpIs5GKXwdpmM
	 84E4PQjI6bvs5oTTZEGjQUve9eT5Du8Nl1tzKgSdo5OdkDWXMaOtWDCdbx7XIaPFdw
	 xJrYUau5m0R0BO5vHluXtL4bu8DG2MgxoD9RWM2BAvYJLLqgu2SdXfuHkMGMdjUfuj
	 +4oe0EDDiDP0w==
Message-ID: <sashiko-outbox-181583@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/7] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022132259.240717-7-clamor95@gmail.com>
References: <20261022132259.240717-1-clamor95@gmail.com>
 <20261022132259.240717-7-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 13:47:46 +0000
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
- [High] drm/tegra: unlocked drm_bridge_get_current_state() call in tegra_r=
gb_encoder_enable()
--

commit 743a0ce150c28976e990ee80b4eaf7239b83fcc3
Author: Svyatoslav Ryhel <clamor95@gmail.com>

drm/tegra: rgb: Parameterize configuration based on bus flags

This commit updates tegra_rgb_encoder_enable() to read bus flags from the
bridge state and configure pixel clock polarity, display enable polarity,
and data alignment accordingly.

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
Is it safe to call drm_bridge_get_current_state() from
tegra_rgb_encoder_enable() during a non-blocking atomic commit?

In include/drm/drm_bridge.h, drm_bridge_get_current_state() asserts that
bridge->base.lock is held before reading bridge->base.state:

static inline struct drm_bridge_state *
drm_bridge_get_current_state(struct drm_bridge *bridge)
{
	if (!bridge)
		return NULL;

	drm_modeset_lock_assert_held(&bridge->base.lock);

	if (!bridge->base.state)
		return NULL;

	return drm_priv_to_bridge_state(bridge->base.state);
}

During a non-blocking atomic modeset commit in
drivers/gpu/drm/drm_atomic_helper.c, drm_atomic_helper_commit() queues
state->commit_work to run commit_tail() asynchronously on system_dfl_wq,
and drm_mode_atomic_ioctl() drops all modeset locks before the worker runs:

drm_mode_atomic_ioctl() ->
  drm_atomic_nonblocking_commit() ->
    drm_atomic_helper_commit()
      queue_work(system_dfl_wq, &state->commit_work);
  drm_modeset_drop_locks()

When the worker executes commit_tail() -> tegra_atomic_commit_tail() ->
drm_atomic_helper_commit_tail_rpm() ->
drm_atomic_helper_commit_modeset_enables() ->
drm_atomic_helper_commit_encoder_bridge_enable() ->
tegra_rgb_encoder_enable(), no drm_modeset_lock is held. Calling
drm_bridge_get_current_state(output->bridge) here will trigger the
drm_modeset_lock_assert_held(&bridge->base.lock) lockdep warning and perform
an unlocked read of bridge->base.state that can race with concurrent atomic
commits swapping or freeing the state.

In addition, if an attached bridge does not implement
.atomic_duplicate_state, drm_atomic_add_encoder_bridges() skips acquiring
bridge->base.lock even during blocking modeset commits, while
drm_bridge_attach() unconditionally initializes bridge->base.lock via
drm_atomic_private_obj_init().

Would it be better to switch tegra_rgb_encoder_helper_funcs to use the
.atomic_enable callback and look up the state from the drm_atomic_state via
drm_atomic_get_new_bridge_state(state, output->bridge)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022132259.2407=
17-1-clamor95@gmail.com?part=3D6
