Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88A83AB288
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785243310; cv=none; b=W//7WP3ZsiZw8whFuZlt2nHtq5xrP5h7EvuPTmLmrytHefvJgxS93wTF9R0Ui8TL5P5ylMaLHv3/Euw9m3IUcCDGZeUMI6yOHeYJqIkITQCJN1cK+x5m2QV9cSXJmdqYwHahQkoBe/EoOewOl8h0RXIvXP3Tkn3XRbe2h7pR5So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785243310; c=relaxed/simple;
	bh=18M3pZECk+LvI1Wc4lbaqp566aIhOlECtWNdp/JdM30=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L+lfkM2+Var3+h5/o7TD5gNenH8mMmVRCs9PrIT+qF9/v6zpZ2JYF4Vd2UpSJGJBK3qRXgpaGpQjRo3BrScOlFsj1RVFEl3tLnfhwt3QTs4cfyR8mKG2VyocdFt+e2Klxm4Kj6g4nX0MSkwDSA1WQFty/Z4GMCY5DPDj1za7kak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEPUcDcz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEPUcDcz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3D91F000E9;
	Tue, 28 Jul 2026 12:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785243308;
	bh=LQBNqCVGkWIzbqqryFnVGrDB6uWpwVgR0I37B9tzyY4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JEPUcDczQuCJ+wfFcfcZeXQmCjsPpRHCDLdIBRUMioc0lOeHK/+NHUAPa3gSaR9sx
	 me8ffYDJUfY2UpiEJ8JrB3UUSLQr0D88V5td2MImtqUt/4+uK71Z5DTrmu9VTkIUGH
	 bwv2L2GSb52hp/JR9QfuQLbDhdJHgqmSrGGpo4qnognHaZFSCc1OqKc9o7ppYO0uHF
	 Y0nnKHVG6c7Mrfd0IvVU4YM5k6A7BOzMsrIf/2Obw9/cOgWIf3CpKf/sksQYE3dL3I
	 NlLJ+0SLOaf2DYSiimpT9XNYz5aRgGiAyflZSc2MrRp4lJOJQVqaujNf0RlsDMGYKv
	 cC6EpicBHLzJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] drm: bridge: cdns-mhdp8546: Add no-hpd property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yashas D" <y-d@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260728124224.774785-3-y-d@ti.com>
References: <20260728124224.774785-1-y-d@ti.com>
 <20260728124224.774785-3-y-d@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 12:55:07 +0000
Message-Id: <20260728125508.2E3D91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] Arbitrary 100ms synchronous timeout in `cdns_mhdp_attach()` for as=
ynchronous firmware loading permanently fails DRM display initialization.
- [High] Disabling `cdns_mhdp_bridge_hpd_enable()` in `no-hpd` mode uninten=
tionally masks all software event interrupts, breaking HDCP.
- [High] Returning `-ETIMEDOUT` directly on firmware load timeout in `cdns_=
mhdp_attach()` leaks the AUX device and leaves the bridge in an invalid sta=
te.
- [High] Periodic `.detect()` polling continuously reprograms display hardw=
are stream registers every 10 seconds.
- [Medium] Polling monitor presence using the DP_LANE0_1_STATUS (0x202) reg=
ister triggers unintended DP sink state transitions.

Pre-existing issues:
- [Critical] Unsafe unlocked access to `bridge.base.state` inside `cdns_mhd=
p_update_link_status()`.
- [High] The driver never powers down the DP link on disconnect because it =
checks the newly updated disconnected state instead of the previous state.
--

--- Patch [2]: [PATCH v5 2/2] drm: bridge: cdns-mhdp8546: Add no-hpd proper=
ty ---
commit e7dd3a882f8493a89d4bfbcdc3952a36383bfe27
Author: Rahul T R <r-ravikumar@ti.com>

drm: bridge: cdns-mhdp8546: Add no-hpd property

Add a 'no-hpd' boolean property to support boards where the HPD line
cannot be used for hotplug detection due to hardware limitations.

> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/driver=
s/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index 504a3186ebb3a..73d5c718c7db5 100644
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
Does skipping this function unintentionally disable other features like HDC=
P?

Despite the name cdns_mhdp_bridge_hpd_enable(), it unmasks the
CDNS_APB_INT_MASK_SW_EVENT_INT interrupt. This interrupt handles all softwa=
re
events from the firmware, not just HPD.

Without it, will operations waiting for software events, such as
cdns_mhdp_wait_for_sw_event(), silently timeout and fail?

[ ... ]
> @@ -1523,6 +1532,26 @@ static int cdns_mhdp_attach(struct drm_bridge *bri=
dge,
> =20
>  	spin_unlock(&mhdp->start_lock);
> =20
> +	if (mhdp->no_hpd) {
> +		/*
> +		 * In no-hpd mode there is no interrupt to signal firmware
> +		 * readiness. The firmware loads asynchronously after probe(),
> +		 * so we must wait here until the uCPU is running before
> +		 * attempting the first AUX channel poll for monitor presence.
> +		 */
> +		ret =3D wait_event_timeout(mhdp->fw_load_wq,
> +					 mhdp->hw_state =3D=3D MHDP_HW_READY,
> +					 msecs_to_jiffies(100));
> +		if (ret =3D=3D 0) {
> +			dev_err(mhdp->dev, "%s: Timeout waiting for fw loading\n",
> +				__func__);
> +			return -ETIMEDOUT;
> +		}

[Severity: High]
Will this hard-coded 100ms timeout cause permanent probe failures?

Since the firmware loads asynchronously, file system latency or user-space
helper delays could easily exceed 100ms. Returning -ETIMEDOUT directly bypa=
sses
the standard -EPROBE_DEFER mechanism and permanently aborts the display
initialization pipeline.

[Severity: High]
Could this direct error return leak resources and cause a use-after-free?

Earlier in cdns_mhdp_attach(), the code registers the AUX device and sets
mhdp->bridge_attached to true:
    drm_dp_aux_register(&mhdp->aux);
    ...
    mhdp->bridge_attached =3D true;

Returning -ETIMEDOUT directly bypasses the goto aux_unregister cleanup path.

Additionally, it leaves mhdp->bridge_attached set to true. When the
asynchronous firmware load eventually completes, cdns_mhdp_fw_cb() will see
bridge_attached =3D=3D true and call drm_bridge_hpd_notify() on a bridge th=
at
failed to attach, which might lead to a crash.

[ ... ]
> @@ -2013,6 +2042,9 @@ cdns_mhdp_bridge_detect(struct drm_bridge *bridge, =
struct drm_connector *connect
>  {
>  	struct cdns_mhdp_device *mhdp =3D bridge_to_mhdp(bridge);
> =20
> +	if (mhdp->no_hpd)
> +		cdns_mhdp_update_link_status(mhdp);
> +

[Severity: High]
Could calling cdns_mhdp_update_link_status() directly from the detect
callback cause display flickering or tearing?

The DRM framework polls the detect callback every 10 seconds. Inside
cdns_mhdp_update_link_status(), if the monitor is connected and the bridge
is enabled, it unconditionally calls cdns_mhdp_sst_enable().

This reprograms the hardware stream registers (video timing, TU sizes, MSA)
on an active stream. Will this disrupt the display periodically during
routine polling?

>  	return cdns_mhdp_detect(mhdp);
>  }
> =20
> @@ -2100,7 +2132,16 @@ static int cdns_mhdp_update_link_status(struct cdn=
s_mhdp_device *mhdp)
> =20
>  	mutex_lock(&mhdp->link_mutex);
> =20
> -	mhdp->plugged =3D cdns_mhdp_detect_hpd(mhdp, &hpd_pulse);
> +	if (mhdp->no_hpd) {
> +		ret =3D drm_dp_dpcd_read_link_status(&mhdp->aux, status);

[Severity: Medium]
Is it safe to read the link status register for periodic presence detection?

drm_dp_dpcd_read_link_status() reads from DP_LANE0_1_STATUS (0x202), which
is in the link training status range.

Reading these registers outside of the link training sequence can trigger
unintended state machine transitions in DP sinks, potentially causing screen
flickering or link training failures.

> +		hpd_pulse =3D false;
> +		if (ret < 0)
> +			mhdp->plugged =3D false;
> +		else
> +			mhdp->plugged =3D true;
> +	} else {
> +		mhdp->plugged =3D cdns_mhdp_detect_hpd(mhdp, &hpd_pulse);
> +	}
> =20
>  	if (!mhdp->plugged) {
>  		cdns_mhdp_link_down(mhdp);

[Severity: High]
This is a pre-existing issue, but does cdns_mhdp_link_down() fail to power
down the DP link when disconnected?

When a monitor is disconnected, the connection state is updated:
    mhdp->plugged =3D false;

Then the code enters the disconnect path and calls cdns_mhdp_link_down():
    if (!mhdp->plugged) {
        cdns_mhdp_link_down(mhdp);

Inside cdns_mhdp_link_down(), the power down is guarded by the plugged stat=
e:
    if (mhdp->plugged)
        drm_dp_link_power_down(&mhdp->aux, mhdp->link.revision);

Since mhdp->plugged was just cleared, it appears the link is never actually
powered down.

[Severity: Critical]
This is a pre-existing issue, but is it safe to access the atomic bridge
state without holding the necessary DRM modeset locks here?

Later in cdns_mhdp_update_link_status(), the code accesses the state pointe=
r:
    state =3D drm_priv_to_bridge_state(mhdp->bridge.base.state);
    ...
    cdns_bridge_state =3D to_cdns_mhdp_bridge_state(state);
    current_mode =3D cdns_bridge_state->current_mode;

Because cdns_mhdp_update_link_status() is now called periodically from the
unlocked .detect() callback, could an atomic commit concurrently swap and f=
ree
the bridge state, leading to a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728124224.7747=
85-1-y-d@ti.com?part=3D2
