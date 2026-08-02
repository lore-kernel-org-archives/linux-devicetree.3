Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448C13932EA
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 15:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785686138; cv=none; b=bg4IWYYqRVmyGpMnVgSVJD+NSqP5b/aZJQ2/RUjuFoG8LY5/xMglceedW9YQPmfIWbkG1fJ66qoaqEVEnau3Htp8HajN/3OzvbJIaqDqWF7kN+mZ5l8MsTuASJLXKO1qA0oSyipAlrWZITlYMbhEl1qQdkQVg/6Kzq2RmezEsrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785686138; c=relaxed/simple;
	bh=94Vn9LMeL25bDGpR7IjwB2qxd1rkbpBCCCaZp1irtYM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WWFzJeFrzG+/95lkBjeToX5edeQsj5QaT9tJ+3dppYdjdbruzgGbkyrwbIv169vFYxRtgiUvM1uS4baVOVaZsHfV9doGzkSTB9V7IQ8JwmDk8S8CnS80sqbGMS6oIGaiB3E960MpcgB8nUQi5jTad+vK9+772CCbw7fGe2B724Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRZ2u5d7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRZ2u5d7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561381F000E9;
	Sun,  2 Aug 2026 15:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785686136;
	bh=vRE7BqVz2iEojLrscidbyM2uoiEMjtUhNhmwCfvBL1Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jRZ2u5d7puM8vhe2eaWsf1tyIKqLBF0lBCn43jc9a7z6stFfq9HfGIQa75cY8aKuM
	 sl2B2RGZQ7kXks/ASNGsFPr+aQ1vLdAsHBlOf+lXDgTHVnwUx7iyqBcivVM3FgAzrU
	 1XoaxKKAZHCO7NjwWmWK34dnFf/PVX1z5coW9tQPpFiYcKfhggKNWZOMJ9iqUIXF/u
	 KItI0yB2bZtNALEpGnMVvLGKSR+LF8CYo8+8et/gomu3lxJFngs2ES3DN2pnkK9ywa
	 5LuBPAwHV/iC3wDL0gti+YGAKwuvfrC4J23tzG1ngAgmEZ1Gx4Q2OkkVXHoTNwFOXd
	 czAsfrTDg4eMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] drm: bridge: cdns-mhdp8546: Add no-hpd property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yashas D" <y-d@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260802153825.1570435-3-y-d@ti.com>
References: <20260802153825.1570435-1-y-d@ti.com>
 <20260802153825.1570435-3-y-d@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 15:55:35 +0000
Message-Id: <20260802155536.561381F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Polling `.detect()` breaks DPMS and wastes power by continuously r=
etraining the link after the display is disabled.
- [High] Skipping `cdns_mhdp_bridge_hpd_enable()` in no-hpd mode permanentl=
y masks SW event interrupts, breaking HDCP.

Pre-existing issues:
- [Critical] Accessing `bridge.base.state` outside of atomic commit context=
 without modeset locks leads to a Use-After-Free.
--

--- Patch [2]: [PATCH v6 2/2] drm: bridge: cdns-mhdp8546: Add no-hpd proper=
ty ---
commit 33969e025e143110f913b15c51739edb9cc917f9
Author: Rahul T R <r-ravikumar@ti.com>
Subject: drm: bridge: cdns-mhdp8546: Add no-hpd property

Add a 'no-hpd' boolean property to support boards where the HPD line
cannot be used for hotplug detection due to hardware limitations.

> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/driver=
s/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index 36c07b71fe04b..c81c742e56ac8 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c

[ ... ]

> @@ -698,7 +700,9 @@ static int cdns_mhdp_fw_activate(const struct firmwar=
e *fw,
>  	 * MHDP_HW_STOPPED happens only due to driver removal when
>  	 * bridge should already be detached.
>  	 */
> -	cdns_mhdp_bridge_hpd_enable(&mhdp->bridge);
> +
> +	if (!mhdp->no_hpd)
> +		cdns_mhdp_bridge_hpd_enable(&mhdp->bridge);

[Severity: High]
Does skipping cdns_mhdp_bridge_hpd_enable() here and in cdns_mhdp_attach()
permanently mask software event interrupts?

The CDNS_APB_INT_MASK_SW_EVENT_INT interrupt is multiplexed for multiple
events, including HDCP status (CDNS_HDCP_TX_STATUS).

If it is never unmasked in no-hpd mode, it looks like HDCP initialization
and communication will timeout and fail completely.

[ ... ]

> @@ -2012,6 +2040,16 @@ static enum drm_connector_status
>  cdns_mhdp_bridge_detect(struct drm_bridge *bridge, struct drm_connector =
*connector)
>  {
>  	struct cdns_mhdp_device *mhdp =3D bridge_to_mhdp(bridge);
> +	bool hw_ready;
> +
> +	if (mhdp->no_hpd) {
> +		spin_lock(&mhdp->start_lock);
> +		hw_ready =3D mhdp->hw_state =3D=3D MHDP_HW_READY;
> +		spin_unlock(&mhdp->start_lock);
> +
> +		if (hw_ready)
> +			cdns_mhdp_update_link_status(mhdp);
> +	}

[Severity: High]
Will this polling cause the link to be continuously retrained even when the
display is intentionally disabled?

When the display is disabled for power management (DPMS blanking),
cdns_mhdp_update_link_status() will see the link is down and execute
cdns_mhdp_link_up():

cdns_mhdp_update_link_status() {
    ...
    if (!mhdp->link_up) {
        ret =3D cdns_mhdp_link_up(mhdp);
        if (ret < 0)
            goto out;
    }
}

Since the .detect() callback is periodically invoked by the DRM core (every
10 seconds), does this unconditionally wake the monitor up from sleep and w=
aste
power by ignoring the mhdp->bridge_enabled state?

[Severity: Critical]
This is a pre-existing issue, but does exposing cdns_mhdp_update_link_statu=
s()
to periodic polling significantly expand a use-after-free race window?

Later in cdns_mhdp_update_link_status(), the code accesses the atomic state
holding only the link_mutex:

cdns_mhdp_update_link_status() {
    ...
    state =3D drm_priv_to_bridge_state(mhdp->bridge.base.state);
    ...
    cdns_bridge_state =3D to_cdns_mhdp_bridge_state(state);
    ...
    current_mode =3D cdns_bridge_state->current_mode;
}

Since drm_private_obj.state is managed by the DRM atomic framework, if a
concurrent non-blocking atomic commit completes during this poll, the old
state can be swapped and freed asynchronously by
drm_atomic_state_default_clear(), leaving this thread dereferencing freed
memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802153825.1570=
435-1-y-d@ti.com?part=3D2
