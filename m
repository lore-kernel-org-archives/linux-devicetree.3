Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174A13B14C2
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 21:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718403; cv=none; b=MU/PelRVG3ZagHuL9U/ZHgblWipMnLk9m8Gc5oPnfWe6ukmIXw0glyS/kEamaiDx+nE188hgYvL0bQXvzRUIfecg7xIDi4ZLVBMrw69953SHWYiXLOBewLB6e+H5XFb+vWIfBjrAcWqJxP300TrYi2SL/hjCxW/ICuxgCX80WbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718403; c=relaxed/simple;
	bh=Mey/L86LXHTjCZDtl+gOHdvQ0iXtLAFRq/NRjxr54zo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WSAxRmim7VNM9xliQQKo3DU/+bIHN/KzoJXIG18qKymXHluXjhwpAc1WZASCMLb+U/Lfplrv+XiZ0Idry0VD/krDThaf5WkpdJieQDtVx+Vh9Cnb5GRtU75BnGxH0iQsl9UFjnYHC9/sKOrbKsMseNru35tRzZCzy8P0owuUG3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyV1pL0l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyV1pL0l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A5731F00A3A;
	Fri, 10 Jul 2026 21:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718402;
	bh=EI+LtceVAhQJEqPxtiiVn7H7VZKchQfHbavOANyRi7U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LyV1pL0l38EmEVHkBSQDImMBrnShKnu0prThj3DrGOcTjFz20gf4GF78yJmnXZPyn
	 AWjjITzEfqdr6i8tiKlgg1lDVXzXCmk1JC+qSv/pTTMPYOaqdSgki2c/cMZ4Ry4Ryz
	 QFN783GG3WpbunIZssyWaru+LVW8bitUSR4aGgkmrSrusgGvHcJ2uOkHxoRLEHgf6p
	 6QdWFhgmOv+TcApl9aOyc1b6GCT4Y0luKvQj9zg044y85SOWCdStsR0PG1Vz3anLhE
	 JDpG+0lXIgtC0T270CqjANcsh9YQoOzg8Kd0cdjRxIfJnMUiEO5XV07TJOEIzcwNp8
	 cByT4MUlk9AIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 30/36] usb: dwc3: core: support PHY reset
 notifications
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-30-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
 <20260710-rockchip-usbdp-cleanup-v12-30-8b41a9a9bef0@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 21:20:01 +0000
Message-Id: <20260710212001.8A5731F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The global `phy_reset_count` atomic variable is incorrectly used t=
o track the reset state of multiple independent USB3 ports, and is read non=
-atomically, leading to cross-port state corruption, TOCTOU race conditions=
, and unbalanced PM usage counters.
- [High] The PHY reset workaround is completely bypassed if Runtime PM is d=
isabled in the kernel configuration or via sysfs, causing the very hardware=
 corruption the patch intends to fix.
--

--- Patch [30]: [PATCH v12 30/36] usb: dwc3: core: support PHY reset notifi=
cations ---
commit 9e1e85d93d9ab9e98188f6d4d342fd431f334513
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

usb: dwc3: core: support PHY reset notifications

This commit handles external PHY reset notifications on Rockchip platforms
by asserting PHYSOFTRST before the PHY disables and deasserting it when the
PHY returns. This prevents the DWC3 IP from corrupting the PHY's internal
state and failing to lock PLL clocks.

> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 517aa7f1486da..4d0b4c1c73f11 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c

[ ... ]

> @@ -880,6 +881,90 @@ static int dwc3_phy_init(struct dwc3 *dwc)
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
> +		 */
> +		if (pm_runtime_get_if_active(dwc->dev) <=3D 0)
> +			return NOTIFY_OK;

[Severity: High]
If CONFIG_PM is disabled, or runtime PM is disabled for this device via
sysfs, pm_runtime_get_if_active() returns -EINVAL.

Will this check treat the -EINVAL error code as suspended and bypass the
workaround completely, even though the DWC3 IP is actively running?

Also, if the check is later modified to proceed on -EINVAL, would the
POST_RESET path underflow the PM counter? pm_runtime_get_if_active()
doesn't increment the usage count when returning -EINVAL, but POST_RESET
unconditionally calls pm_runtime_put_autosuspend().

> +
> +		atomic_inc(&dwc->phy_reset_count);
> +
> +		/*
> +		 * Assert USB3 PHY soft reset within DWC3 before the external
> +		 * PHY resets. This disconnects the PIPE interface, preventing
> +		 * the DWC3 from interfering with PHY reinitialization and
> +		 * avoiding LCPLL lock failures.
> +		 */
> +		spin_lock_irqsave(&dwc->lock, flags);
> +		reg =3D dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
> +		reg |=3D DWC3_GUSB3PIPECTL_PHYSOFTRST;
> +		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
> +		spin_unlock_irqrestore(&dwc->lock, flags);
> +		break;
> +
> +	case PHY_NOTIFY_POST_RESET:
> +		if (!atomic_read(&dwc->phy_reset_count))
> +			return NOTIFY_OK;

[Severity: High]
Can this global count cause state corruption on multi-port systems if
notifications interleave with PM state changes?

For example, if Port 0 starts a reset while suspended, it skips the PRE_RES=
ET
workaround and doesn't increment phy_reset_count.

If the controller resumes and Port 1 starts a reset, it increments the
global phy_reset_count to 1.

When Port 0 finishes its reset and hits POST_RESET, it sees phy_reset_count
as 1. Won't it erroneously clear PHYSOFTRST for Port 0 (which was never set=
),
call pm_runtime_put_autosuspend() unbalanced, and decrement the count to 0?

If Port 1 then finishes its reset, won't it see phy_reset_count at 0 and
skip its cleanup, leaving Port 1 permanently stuck in PHYSOFTRST?

> +		/*
> +		 * Deassert PHY soft reset to reconnect the PIPE interface
> +		 * after PHY reinitialization.
> +		 */
> +		spin_lock_irqsave(&dwc->lock, flags);
> +		reg =3D dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
> +		reg &=3D ~DWC3_GUSB3PIPECTL_PHYSOFTRST;
> +		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
> +		spin_unlock_irqrestore(&dwc->lock, flags);
> +
> +		pm_runtime_put_autosuspend(dwc->dev);
> +		atomic_dec(&dwc->phy_reset_count);
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-rockchip-u=
sbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com?part=3D30
