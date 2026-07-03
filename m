Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4928831F9A0
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 23:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783123162; cv=none; b=RbM+DRDEPYAHypu2choMGNIoPE1nect0OGGprvBE2imrQtJFNapow9n9FdiPD6AvKkWqK+SzR8ausibvbWsHQ87sM/TfsuKxXP7BpY8negBr7ZKtKObxQU/1aktOMfwixEIifH73HJCcBpMaNxmqggKPlUpbzdXx6CTVTAyJNd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783123162; c=relaxed/simple;
	bh=66BBrb6jXDPG5qVEmS8m/pgUwIpL5PbaWFAGZPoqOLc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hn+mbv8/q1IbjSAR2+7pFcezOQjC9wHIklogpwjofvqPhlKP6KCo9EvqtR0JWfSmBbRw6LPL84MVuHUZPlHfS14vSnimqHBCX4UCA6UvFMbrcLjEy93g2Z75U+Q/gmgL3/oOd0pJAcZHwIsJs5USI/suTSvIhzXd/QhCJANMt50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FN5TAskT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FN5TAskT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7D71F000E9;
	Fri,  3 Jul 2026 23:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783123161;
	bh=Qd8jX1NKu4QLPat0ZSTWr2nVGTz9hudvf3gu1AUwTXU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FN5TAskTk6izisCd0G1h5fdSbwNbYNcphXSdd2ZKg664JCg+hRpRKowHYE56iMFKY
	 RBhNHzA9u3/Z9miRNIWd+69w9hH1f2umdy8dtt2PZwXdZR8PBpc5XKhr51HasuPnoj
	 O8uura/b3wmUbuM/tgn5nR5BXLv73uAZzxriodZwNMbHho6sRFJfD3DI9aHWU2ZqhP
	 f20mo93Vr8JjRsnoQy4yH3QLtadIQkQsknd7NbZ1icISmaNMsL2EThnZfPW7umi0ua
	 m63C28eseTp537+8rha28rWyw5NVW5CgxohvJ8eaC1I8lAC90HiMRqatSs2JS8K0jC
	 xEdEyoYtqdNeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 30/36] usb: dwc3: core: support PHY reset
 notifications
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: olteanv@gmail.com, conor+dt@kernel.org, robh@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-30-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
 <20260703-rockchip-usbdp-cleanup-v10-30-a392711ca8a9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 23:59:20 +0000
Message-Id: <20260703235920.9C7D71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing error handling for pm_runtime_get_sync() in dwc3_usb3_phy_=
notify() can lead to hardware access on a suspended device and PM usage cou=
nt leak.
- [High] AB-BA deadlock between PHY notifier rwsem and Runtime PM state loc=
k during DWC3 runtime suspend.
- [High] Concurrent read-modify-write on DWC3_GUSB3PIPECTL can silently cle=
ar the newly added PHYSOFTRST bit.
- [Medium] The PM runtime usage counter is permanently leaked if the DWC3 d=
river unbinds mid-reset.
--

commit 7addd6da511b4b59c9d034fe7f0878d5304dda87
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

usb: dwc3: core: support PHY reset notifications

On recent Rockchip platforms (at least RK3588 & RK3576), DWC3 IP is used
with a USBDP PHY providing USB3 and DP. This PHY needs to be reset when
the mode changes, which may happen when plugging in different USB-C
devices.

> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 517aa7f1486da..899decbd0da04 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
[ ... ]
> @@ -880,10 +886,78 @@ static int dwc3_phy_init(struct dwc3 *dwc)
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
> +		pm_runtime_get_sync(dwc->dev);

[Severity: High]
Does this code handle the case where pm_runtime_get_sync() fails?

If pm_runtime_get_sync() returns a negative error code (failing to resume t=
he
device), it still increments the PM usage counter. Since the return value is
ignored, the code will proceed to unconditionally access DWC3 hardware
registers via dwc3_readl() and dwc3_writel(). Accessing registers on a
suspended, clock-gated device can trigger a synchronous external abort
(SError) or bus fault, causing a kernel panic.=20

Should this error path balance the usage counter via pm_runtime_put_noidle()
and return an error to prevent the leak and crash?

[Severity: High]
Can this pm_runtime_get_sync() call cause a deadlock during runtime suspend?

When a PHY reset notification arrives, the blocking_notifier_call_chain()
holds phy->notifier.rwsem (read lock), and dwc3_usb3_phy_notify() calls
pm_runtime_get_sync().

If DWC3 is concurrently runtime-suspending (in DEVICE mode, the state is
RPM_SUSPENDING), pm_runtime_get_sync() blocks waiting for the suspend to
finish.

The suspend thread calls dwc3_suspend_common() -> dwc3_core_exit() ->
dwc3_phy_unregister_notifiers(), which attempts to acquire
phy->notifier.rwsem (write lock) via blocking_notifier_chain_unregister():

dwc3_phy_unregister_notifiers()
    phy_unregister_notifier()
        blocking_notifier_chain_unregister() -> blocks on write lock

The two threads would mutually block, causing a strict AB-BA system deadloc=
k.

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

[Severity: High]
Can the PHYSOFTRST bit be silently cleared by concurrent register accesses?

While dwc3_usb3_phy_notify() modifies DWC3_GUSB3PIPECTL holding dwc->lock,
the existing dwc3_enable_susphy() function also modifies this register usin=
g a
read-modify-write sequence, but without holding dwc->lock:

dwc3_enable_susphy() {
    ...
    reg =3D dwc3_readl(dwc, DWC3_GUSB3PIPECTL(i));
    if (enable && !dwc->dis_u3_susphy_quirk)
        reg |=3D DWC3_GUSB3PIPECTL_SUSPHY;
    else
        reg &=3D ~DWC3_GUSB3PIPECTL_SUSPHY;
    dwc3_writel(dwc, DWC3_GUSB3PIPECTL(i), reg);
    ...
}

If dwc3_enable_susphy() executes concurrently (e.g., triggered via
__dwc3_set_mode() during a role switch when the PHY reset is also triggered=
),
it can read the register before PHYSOFTRST is set and write it back after,
inadvertently clearing the bit.

> +		break;
> +
> +	case PHY_NOTIFY_POST_RESET:
[ ... ]
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
> +}

[Severity: Medium]
Can this cause a PM runtime usage counter leak if the driver unbinds mid-re=
set?

PHY_NOTIFY_PRE_RESET increments the PM usage counter via pm_runtime_get_syn=
c().

If the driver is unbound (dwc3_remove() -> dwc3_core_remove() ->
dwc3_core_exit()) before PHY_NOTIFY_POST_RESET is sent,
dwc3_phy_unregister_notifiers() cleanly unregisters the notifier.

Because the notifier is unregistered, the DWC3 driver never receives the
POST_RESET event, skipping the corresponding pm_runtime_put_autosuspend(). =
The
PM usage counter would remain unbalanced, preventing the device instance fr=
om
ever suspending if rebound.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-rockchip-u=
sbdp-cleanup-v10-0-a392711ca8a9@collabora.com?part=3D30
