Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF032397923
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 08:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833055; cv=none; b=g+fc5hjxR/WGydstmLUkTc81UPSYCL8RL3g3ZIGosV+oJ9GSlr/+VO6uOwpFWVz0KD09AY7euCgAYTP7ntVdpWWh45t1EVaXmo+kvZxLPC6kC7kXgLqlt4vGzXwFK+eBOxzVPUA5RU/AKa8Vf9CgITMbBhbTuryMCfQVKpd3kos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833055; c=relaxed/simple;
	bh=HGqIclCZXGf4eK5+1idwObFxHjwsPQa0fuU61uB6q40=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W+TZuRbIIgG3kCH6Tem1TbpUd3fwcDpJbblMLXSD44IkBajKzyK8uOvNOl9ITzUa5SEsygbAPXf4WT0hVIX8x+ai4iaifTboyzHpIz5DinnBhuXTCTniwhx30yBBNG25hQpHU5wJUYaeeVdGM+wSAVnWOKHiHNBvu8T9cB6XKOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nnO1NTVI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nnO1NTVI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143611F000E9;
	Tue,  4 Aug 2026 08:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785833054;
	bh=G5gRoThDumjl7Z03nsTXlne3uHQ2LmlU8pnWBDU0ZNI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nnO1NTVIj3StWXDiq0ZMsz+gtF6NtJMOwQNkG+DGkTMYoSVqf9HUTh4mG0HOfVrlV
	 A9X3aPeuTeZ3Rl9BHN2NSw1xkEdVhEZIu9qO+igGOEu/KNDzUDp/m0aox7UsP9hRSn
	 43/TCUhzfCBQnZcvMRYkpTuJwYVADXCvoVezhgXPXKUrzrH4q47zB1etJeYm/cI0rN
	 q+BjVkeY3X1B20vFMxDI3/Ll4qerxuy+DiTWuBzCuk6Vn8rTUj/NKTIzv9U0Mw9ljh
	 LpEyooB4Bguwm0uQud/ylwC+I6JDx/bE+9ZtfijQZ/KhXT/BD/WbAn9idQhoA00I82
	 Evm/m9wqzeigw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/10] drm/bridge: analogix_dp: Handle HPD
 notification from downstream bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804081717.741404-11-damon.ding@rock-chips.com>
References: <20260804081717.741404-1-damon.ding@rock-chips.com>
 <20260804081717.741404-11-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 08:44:13 +0000
Message-Id: <20260804084414.143611F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Bypassing force_hpd initialization breaks AUX channel and link tra=
ining

Pre-existing issues:
- [High] Sleeping in atomic context during bridge enable
--

--- Patch [10]: [PATCH v2 10/10] drm/bridge: analogix_dp: Handle HPD notifi=
cation from downstream bridge ---
commit 9728fd12d41ed8de2891a5a3947c23bae76130a5
Author: Damon Ding <damon.ding@rock-chips.com>

drm/bridge: analogix_dp: Handle HPD notification from downstream bridge

The patch implements the .hpd_notify bridge callback to receive connection
status updates from downstream bridges. It caches the connection status to
short-circuit analogix_dp_detect_hpd() when a downstream bridge has already
confirmed the connection.

> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index f7db5b5a3f917..14a78aea48bd7 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -68,6 +68,13 @@ static int analogix_dp_detect_hpd(struct analogix_dp_d=
evice *dp)
>  {
>  	int timeout_loop =3D 0;
> =20
> +	/*
> +	 * Trust connection status from downstream bridge (e.g.,
> +	 * display-connector with hpd-gpios).
> +	 */
> +	if (dp->plat_data->next_bridge && dp->connection_notified)
> +		return 0;

[Severity: High]
Does returning early here bypass the analogix_dp_force_hpd(dp) call needed
to unblock the AUX channel?

If the downstream bridge manages HPD, the native HPD pin is typically
unconnected, making the hardware HPD_STATUS register read 0. The Analogix
DP hardware blocks all AUX transactions when HPD_STATUS is 0.

By returning 0 early, analogix_dp_force_hpd(dp) is skipped, leaving the
F_HPD bit cleared and the AUX channel blocked. This could cause link
training to fail because it cannot read DPCD over the AUX channel.

>  	while (timeout_loop < DP_TIMEOUT_LOOP_COUNT) {
>  		if (analogix_dp_get_plug_in_status(dp) =3D=3D 0)
>  			return 0;
> =20
>  		timeout_loop++;
>  		usleep_range(1000, 1100);

[Severity: High]
This isn't a bug introduced by this patch, but does this usleep_range()
violate atomic context requirements?

When the core DRM framework calls analogix_dp_bridge_atomic_enable() during
a non-blocking atomic commit, it executes analogix_dp_set_bridge() which
then calls analogix_dp_detect_hpd():

analogix_dp_bridge_atomic_enable()
  analogix_dp_set_bridge()
    analogix_dp_detect_hpd()
      usleep_range(1000, 1100);

Since atomic enable/disable callbacks execute in atomic context, sleeping
functions like usleep_range() are not allowed and can cause kernel
warnings (BUG: scheduling while atomic) or system instability.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804081717.7414=
04-1-damon.ding@rock-chips.com?part=3D10
