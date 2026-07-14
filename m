Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA837427FAC
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 20:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784060136; cv=none; b=ggZrZtjyh9hLLr/QTlLge3swAD2WF8nms4SoewdVlGNI6EIvFxHzNkai9Oa7bGKF7FFhHKdpU635qo8Z2OYIC6FyQfLPZ6e+2G1D/fAXzF5CTJR0d3NPnK5AoeAcaGuEheZ1W9Rj/PF8cW0E+AVVV3H+b5U49V80GUYz2w16JY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784060136; c=relaxed/simple;
	bh=zjsfppYN9pgoZ6rzJfaaRoiBt8eCTsNIN5I+Q+UoluY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K8/qCx66twrGHqxjJhI5QjUwP+czyDmcaBgellg7OTOB8Madf0zDaroUz3ZcTDBRUeJyusD4Yus54s+9R2IICjoGxjByQNZfLoC7y3EHF42XngEiNzWt9dfn6+2Sn0UnFsT2Vq3N0Q0F9XXbqwEFrtoVqdXQWbTxOuVes21UYC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIM5RkyF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIM5RkyF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F3C1F000E9;
	Tue, 14 Jul 2026 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784060135;
	bh=LiSZe3OhxklEFbbPus5fchxNB3n/wmy8hSpsKl4TQpg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DIM5RkyFVdOVdnv538LRXo0NbzPcPYytg/tPg/vfCYp0L3TTLpBn/Uih2S0Bvpn/W
	 5nuZ3W+JU9pY9QDRfgS8+RcIdhNZlcO+k8lGZtcfUW0Yyc8xUGcu+CdjZ6Ac0Nq6Ou
	 qPbOOD3rDycx/eeYQQCwDk/H12KVE44aTxk9nTHtcWr5MEbYC+vnzJ+kkrt4QY9r0h
	 GgbG7D9wavWoc1H997wrOMWATkOpcQrJ4/ewTxJSqlgQGZ1nYdQGdgYWiCZh2O8Apl
	 q3OL4ub/ibCja+9CzK1ESYZsk5t3thdg9jDEfl4qBVvmCsU1H7qFPoPYduZrRUbECy
	 pO6YrkU82Y2JA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 29/35] usb: dwc3: core: support PHY reset
 notifications
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-phy@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-29-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
 <20260714-rockchip-usbdp-cleanup-v13-29-6cb3e769d4c5@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 20:15:34 +0000
Message-Id: <20260714201535.14F3C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unhandled `-EINVAL` from `pm_runtime_get_if_active()` leads to uns=
afe unclocked hardware access and guaranteed PM usage count underflow.
- [Medium] `PHY_NOTIFY_PRE_RESET` skips asserting `PHYSOFTRST` while DWC3 i=
s runtime suspending, undermining the patch's purpose.
--

--- Patch [29]: [PATCH v13 29/35] usb: dwc3: core: support PHY reset notifi=
cations ---
commit 6e8dbcf8839d758e54f1776486d2e59f6acec9ca
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

usb: dwc3: core: support PHY reset notifications

This commit adds handling for PHY framework reset notifications to the DWC3
core. It asserts the PHYSOFTRST bit before the external PHY resets and
deasserts it afterward. This prevents the external USBDP PHY from entering
a corrupted state resulting in LCPLL lock failures.

> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 517aa7f1486da..10678dd63419a 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
[ ... ]
> @@ -880,6 +881,103 @@ static int dwc3_phy_init(struct dwc3 *dwc)
>  	return ret;
>  }
> =20
> +static int dwc3_usb3_phy_notify(struct notifier_block *nb,
> +				unsigned long action, void *data)
> +{
> +	struct dwc3_phy_nb *pnb =3D container_of(nb, struct dwc3_phy_nb, nb);
> +	struct dwc3 *dwc =3D pnb->dwc;
> +	int port =3D pnb->port_index;
> +	unsigned long flags;
> +	u32 reg;
> +	int ret;
> +
> +	switch (action) {
> +	case PHY_NOTIFY_PRE_RESET:
> +		/*
> +		 * If already suspended, the resume path will reinit GUSB3PIPECTL
> +		 * via dwc3_core_init(). A forced resume is not possible as that
> +		 * would call phy_init() resulting in a deadlock. Due to the
> +		 * phy_init() in the resume path there is also no need to block
> +		 * async RPM resume on our side, since the PHY synchronizes it
> +		 * for us.
> +		 *
> +		 * pm_runtime_get_if_active() returns 0 when suspended (skip),
> +		 * 1 when active (ref held), or -EINVAL when PM is disabled
> +		 * (device always active). In the -EINVAL case PM ref counting
> +		 * is a no-op, so the unconditional put in POST_RESET is safe.
> +		 */
> +		ret =3D pm_runtime_get_if_active(dwc->dev);
> +		if (!ret)
> +			return NOTIFY_OK;

[Severity: High]
If pm_runtime_get_if_active() returns -EINVAL (e.g. when PM is disabled),
this check only looks for 0 and allows execution to proceed without having
incremented the usage count.

Since the device might not actually be active or clocked when PM is disable=
d,
could this lead to unclocked hardware access on DWC3_GUSB3PIPECTL and a ker=
nel
panic?

Also, the comment mentions that PM ref counting is a no-op for -EINVAL,
making the unconditional put in POST_RESET safe. However,
pm_runtime_put_autosuspend() unconditionally decrements the atomic usage
counter via rpm_drop_usage_count(). Won't this cause a usage count underflo=
w?

[Severity: Medium]
If the device state is RPM_SUSPENDING, pm_runtime_get_if_active() returns 0.
Could an external PHY reset occur concurrently while dwc3_suspend_common() =
is
executing but before it disables clocks?

If so, this returns NOTIFY_OK and bypasses PHYSOFTRST assertion while the
DWC3 IP is still actively driving the PIPE interface, potentially causing t=
he
exact LCPLL lock failure this patch is meant to fix.

> +
> +		/*
> +		 * Assert USB3 PHY soft reset within DWC3 before the external
> +		 * PHY resets. This disconnects the PIPE interface, preventing
> +		 * the DWC3 from interfering with PHY reinitialization and
> +		 * avoiding LCPLL lock failures.
> +		 */
> +		spin_lock_irqsave(&dwc->lock, flags);
> +		dwc->phy_reset_active |=3D BIT(port);
> +		reg =3D dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
> +		reg |=3D DWC3_GUSB3PIPECTL_PHYSOFTRST;
> +		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
> +		spin_unlock_irqrestore(&dwc->lock, flags);
> +		break;
> +
> +	case PHY_NOTIFY_POST_RESET:
> +		spin_lock_irqsave(&dwc->lock, flags);
> +		if (!(dwc->phy_reset_active & BIT(port))) {
> +			spin_unlock_irqrestore(&dwc->lock, flags);
> +			return NOTIFY_OK;
> +		}
> +
> +		dwc->phy_reset_active &=3D ~BIT(port);
> +
> +		/*
> +		 * Deassert PHY soft reset to reconnect the PIPE interface
> +		 * after PHY reinitialization.
> +		 */
> +		reg =3D dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
> +		reg &=3D ~DWC3_GUSB3PIPECTL_PHYSOFTRST;
> +		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
> +		spin_unlock_irqrestore(&dwc->lock, flags);
> +
> +		pm_runtime_put_autosuspend(dwc->dev);

[Severity: High]
If pm_runtime_get_if_active() returned -EINVAL earlier, won't this
unconditional put drop the PM reference and lead to a usage count underflow?

> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
[ ... ]
> +static void dwc3_phy_unregister_notifiers(struct dwc3 *dwc)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < dwc->num_usb3_ports; i++)
> +		phy_unregister_notifier(dwc->usb3_generic_phy[i],
> +					&dwc->usb3_phy_nb[i].nb);
> +
> +	/* Release any PM references from in-flight resets */
> +	for (i =3D 0; i < dwc->num_usb3_ports; i++) {
> +		if (dwc->phy_reset_active & BIT(i))
> +			pm_runtime_put_autosuspend(dwc->dev);

[Severity: High]
Similarly, if a reset is in-flight when PM is disabled (meaning no reference
was acquired), won't this also cause a usage count underflow?

> +	}
> +	dwc->phy_reset_active =3D 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-rockchip-u=
sbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com?part=3D29
