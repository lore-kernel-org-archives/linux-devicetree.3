Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD173B6BFF
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 06:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791528851; cv=none; b=h+/W33AVof2l/kObDcPsU+HPMCgFga06HbH2p8sYNHJqBuzX2bkMXZPbLgN2kfwxBrBuzkBH6KsVrxhpZlH72QtMbQulqlPAMzKgM1y47m1uBILw5I7fu8yxV/59NeHH3OIbwh7LsLi9X1FUQwVxH/57ipy/xmc/Cnf+RS6vSwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791528851; c=relaxed/simple;
	bh=e9YSAjEls93sG0P94tPkD+f/Ynqrhwpk8nnymYfoHTA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Ya+zj3qRa5/rJCW20dQ0xZX5EgqPdPF8Y6Jc9KAEzwsZO9b2OVo1q/PF9o3szabBoFJ6aMcvVM68NcEIPFR5yzMiHaLWk7DIMf9r8nFWMMozR7mnp6sVJNJwoHg9GebrdyAUB1geLeHbUhs43be9LpItbOg3T8WOisDG8SlzowE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSUpUt2l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSUpUt2l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6038E1F000FF;
	Fri,  9 Oct 2026 06:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791528849;
	bh=M4C/ci/K/kssp6GkM1WbBaSmae0wVmUEikBCtgOVDr0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kSUpUt2lhyeZ9zfy88vTSSddzQ9M6v4I6YuloY9WYXjJHGFAfDPnx9Yk99UozNv/P
	 WmjXzQ6yLIIQSYcFIAyZCCQtY4tuKIyY5er2WBpkbaymo3ajeXf+jHKNO40EpQJVhx
	 IDcBhEdQ+td9uGO6KsCiVxQZCJjT/egxxVQSVzidkePmFof5mQ7gWw1v33f9v9naJH
	 5K70zrfGWqgkU8bCffogKZh3P8Y1SPenCewieAlEZQvvMsmDAQLQBMZn4EzywS0GIu
	 KF1VNz2wG1E6X/2Ycu3lkcZ41R2p23w+PhQMsTevQcE7sJk2UYsKRLPBvjvKDVdDba
	 mWPX2x2vZWs8w==
Message-ID: <sashiko-outbox-164969@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] drm: bridge: cdns-mhdp8546: Add no-hpd property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yashas D" <y-d@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20261009064024.985688-3-y-d@ti.com>
References: <20261009064024.985688-1-y-d@ti.com>
 <20261009064024.985688-3-y-d@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 06:54:08 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/bridge: cdns-mhdp8546: no-hpd property inadvertently disables =
all SW event interrupts
- [Medium] drm/bridge: cdns-mhdp8546: .detect polling forces link training =
when disabled
--

commit 74d172bfd85fd1324471808ee819e4a124d26946
Author: Rahul T R <r-ravikumar@ti.com>
Subject: drm: bridge: cdns-mhdp8546: Add no-hpd property

Adds a no-hpd boolean property for boards where the hardware HPD line is
unavailable. When set, the driver uses DPCD AUX reads to poll monitor
presence via the .detect() callback instead of relying on HPD interrupts.

> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/driver=
s/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index f47717bd10798..b02147a725a2d 100644
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
When no-hpd is set, cdns_mhdp_bridge_hpd_enable() is bypassed here.

Looking at cdns_mhdp_bridge_hpd_enable(), it unmasks all SW events, not just
HPD:

static void cdns_mhdp_bridge_hpd_enable(struct drm_bridge *bridge)
{
        ...
        if (mhdp->bridge_attached)
                writel(readl(mhdp->regs + CDNS_APB_INT_MASK) &
                       ~CDNS_APB_INT_MASK_SW_EVENT_INT,
                       mhdp->regs + CDNS_APB_INT_MASK);
}

Since this bit controls all software event notifications from the firmware,
won't bypassing this cause features like HDCP to unconditionally time out w=
hen
they wait for SW events?

> =20
>  	spin_unlock(&mhdp->start_lock);
> =20
[ ... ]
> @@ -1523,6 +1532,19 @@ static int cdns_mhdp_attach(struct drm_bridge *bri=
dge,
> =20
>  	spin_unlock(&mhdp->start_lock);
> =20
> +	if (mhdp->no_hpd) {
> +		/*
> +		 * In no-hpd mode there are no HPD interrupts to trigger
> +		 * detection. If firmware is already ready, do the initial
> +		 * AUX poll immediately. Otherwise fw_cb() will call
> +		 * cdns_mhdp_update_link_status() once firmware finishes
> +		 * loading and sees bridge_attached is true.
> +		 */
> +		if (hw_ready)
> +			cdns_mhdp_update_link_status(mhdp);
> +		return 0;
> +	}

[Severity: High]
This early return also bypasses the SW event interrupt unmasking during bri=
dge
attach. Should CDNS_APB_INT_MASK_SW_EVENT_INT be unmasked independently of =
the
HPD configuration?

> +
>  	/* Enable SW event interrupts */
>  	if (hw_ready)
>  		cdns_mhdp_bridge_hpd_enable(bridge);
[ ... ]
> @@ -2100,7 +2132,29 @@ static int cdns_mhdp_update_link_status(struct cdn=
s_mhdp_device *mhdp)
> =20
>  	mutex_lock(&mhdp->link_mutex);
> =20
> -	mhdp->plugged =3D cdns_mhdp_detect_hpd(mhdp, &hpd_pulse);
> +	if (mhdp->no_hpd) {
> +		u8 rev;
> +
> +		/*
> +		 * Use a side-effect-free capability register for presence
> +		 * detection. A successful AUX read means a sink is present;
> +		 * we do not need link training status registers here.
> +		 */
> +		ret =3D drm_dp_dpcd_read(&mhdp->aux, DP_DPCD_REV, &rev, 1);
> +		mhdp->plugged =3D (ret =3D=3D 1);
> +		ret =3D mhdp->plugged ? 0 : -EIO;
> +		hpd_pulse =3D false;
> +
> +		/*
> +		 * If the monitor is still connected and the link is already
> +		 * up, there is nothing to do. Avoid falling through to
> +		 * cdns_mhdp_sst_enable() on every poll cycle.
> +		 */
> +		if (mhdp->plugged && old_plugged && mhdp->link_up)
> +			goto out;

[Severity: Medium]
During DPMS off or atomic_disable, the driver correctly powers down the link
and sets mhdp->link_up to false.=20

When the 10-second polling calls .detect() while the bridge is disabled,
mhdp->link_up will be false. The short-circuit condition here evaluates to
false, causing the code to fall through to:

	if (!mhdp->link_up) {
		ret =3D cdns_mhdp_link_up(mhdp);
		if (ret < 0)
			goto out;
	}

Will this unconditionally perform full hardware link training and issue
DP_SET_POWER_D0 on every poll cycle, defeating power management while the
bridge is logically disabled?

> +	} else {
> +		mhdp->plugged =3D cdns_mhdp_detect_hpd(mhdp, &hpd_pulse);
> +	}
> =20
>  	if (!mhdp->plugged) {
>  		cdns_mhdp_link_down(mhdp);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009064024.9856=
88-1-y-d@ti.com?part=3D2
