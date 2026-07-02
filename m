Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42BB171BB
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 00:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782950900; cv=none; b=uuZ5qw7BeiNNP3ICFSwZvs2DqyxouENgF3q1TKN4riK9IAKro5UCA5aU4bqus5kWEd4XegpKux1CD8Ev8i+gABNcFPW9j8MJR+1UDPkA7eC/Swt/S1+cbuWXxkDhbx5rHDHQMy22eemnyfYasmRTEYKjtzId7w/NFhoK64HpKAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782950900; c=relaxed/simple;
	bh=qb38VjVoODqvESl1s8BcKqEAJXvlZxRbDLMW5f+MUds=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=meF3Ak3YEVfJkY9OiriU/EMWI9aS67cwFMDs57yiL338dKQm/Z4lNCQCyRUXEeAKlQw/VSD0KS2FyZk2Dafmp8do23T7nXPBepBYp94/HSqCO6JiwN0Sizd8/vsQrDjNj5c0/yVgBDSCGs+EOx8JtPNg493xZLfiIHe58hnkfiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0OQjxel; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0OQjxel"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB59D1F000E9;
	Thu,  2 Jul 2026 00:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782950898;
	bh=M/5ysJp42pvE6B0FFEBLRvGvS9MPo32gqnlRpeduy24=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y0OQjxeldP6FuuAOGFDhMctqyhHVzbuCRedQ9cMyRD6FSRlIx6g2+q9QE5xAGoVVm
	 z/O6VtqCKQSmfgxznHPXHkn6+KKuEMW2wu2JMn7vjQCeuAVqECQ/tSio4nqIzWqlM3
	 Iuybffum5cFpFvIN6gUWOC8BOOPruf7E1AhncrX2sD3sDNxvpzVfJGO8rcIcJyfdNL
	 BbeDHBNHPT2/WFCyammun+PyV7hECYsejKUBS/Q9sg64nO8b4E0WpcmyMqpgf4MLS2
	 XkQgZA+b1AX/KKw7+5QMXRad5Urg9kXzX69nnrFwfH5MEeYnwLwqtJNKAv3Idt556R
	 Mf9BhdnHg+PbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 32/38] usb: dwc3: core: support PHY reset
 notifications
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, vkoul@kernel.org
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-32-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
 <20260702-rockchip-usbdp-cleanup-v9-32-e31efbb62d2e@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 00:08:17 +0000
Message-Id: <20260702000817.EB59D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The PHY reset notifier checks `pm_runtime_suspended()` without sec=
uring a PM reference, which can cause a kernel crash if the DWC3 controller=
 suspends concurrently.
- [High] Unsynchronized modification of the `phy_reset_in_progress` bitfiel=
d causes a data race that can corrupt adjacent bitfields in `struct dwc3`, =
including PM state flags like `suspended`.
- [High] The PHY reset notifier incorrectly treats a per-port PHY reset as =
a global event, applying soft reset to all USB3 ports and using a single gl=
obal state flag, breaking multi-port controllers.
- [High] The notifier performs read-modify-write operations on `DWC3_GUSB3P=
IPECTL` without acquiring the DWC3 spinlock, leading to register state corr=
uption.
--

commit e7db10d74b0389657368c887d592e9b830ec1fac
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

usb: dwc3: core: support PHY reset notifications

This adds handling for the new PHY framework reset notifications to assert
PHYSOFTRST within the DWC3 controller before the external PHY resets. This
prevents the DWC3 from interfering with PHY reinitialization and avoids
LCPLL lock failures on Rockchip platforms.

> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
[ ... ]
> @@ -1430,6 +1430,7 @@ struct dwc3 {
>  	unsigned		wakeup_configured:1;
>  	unsigned		suspended:1;
>  	unsigned		susphy_state:1;
> +	unsigned		phy_reset_in_progress:1;

[Severity: High]
Can modifying this locklessly corrupt the adjacent bitfield flags?

Since phy_reset_in_progress shares a memory word with suspended and
susphy_state, a concurrent modification to those PM state flags could be
overwritten during the non-atomic read-modify-write of this bitfield.

> =20
>  	u16			imod_interval;

> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
[ ... ]
> @@ -886,10 +886,86 @@ static int dwc3_phy_init(struct dwc3 *dwc)
>  	return ret;
>  }
> =20
> +static int dwc3_usb3_phy_notify(struct notifier_block *nb,
> +				unsigned long action, void *data)
> +{
> +	struct dwc3 *dwc =3D container_of(nb, struct dwc3_phy_nb, nb)->dwc;
> +	int i;
> +
> +	switch (action) {
> +	case PHY_NOTIFY_PRE_RESET:
> +		/*
> +		 * If the controller is already suspended (e.g. runtime PM),
> +		 * there is no internal state to clean up.
> +		 */
> +		if (pm_runtime_suspended(dwc->dev))
> +			return NOTIFY_OK;

[Severity: High]
Does this check protect against the device suspending immediately after?

If pm_runtime_suspended() returns false, the controller could still
asynchronously suspend before PHY_NOTIFY_POST_RESET occurs.

Should this acquire a reference via pm_runtime_get_if_active() to prevent
the device clocks from being gated while the reset is in progress?

> +
> +		dwc->phy_reset_in_progress =3D true;
> +
> +		/*
> +		 * Assert USB3 PHY soft reset within DWC3 before the external
> +		 * PHY resets. This disconnects the PIPE interface, preventing
> +		 * the DWC3 from interfering with PHY reinitialization and
> +		 * avoiding LCPLL lock failures.
> +		 */
> +		for (i =3D 0; i < dwc->num_usb3_ports; i++) {

[Severity: High]
Does this unintentionally disrupt all ports on a multi-port controller?

The notifier block identifies the specific dwc3_phy_nb (and implicitly the
port) that triggered the event, but this loops over all num_usb3_ports and
asserts soft reset on all of them.

Overlapping resets on different ports might also clobber the shared
dwc->phy_reset_in_progress flag, dropping connections on ports that did
not trigger the notification.

> +			u32 reg =3D dwc3_readl(dwc, DWC3_GUSB3PIPECTL(i));
> +
> +			reg |=3D DWC3_GUSB3PIPECTL_PHYSOFTRST;
> +			dwc3_writel(dwc, DWC3_GUSB3PIPECTL(i), reg);

[Severity: High]
Can this lockless read-modify-write corrupt DWC3_GUSB3PIPECTL?

This modifies the register without holding dwc->lock.

If this races with PM transitions running dwc3_enable_susphy(), which also
modifies this register, could one of the register updates be lost?

> +		}
> +		break;
> +
> +	case PHY_NOTIFY_POST_RESET:
> +		if (!dwc->phy_reset_in_progress)
> +			return NOTIFY_OK;
> +
> +		dwc->phy_reset_in_progress =3D false;
> +
> +		/*
> +		 * Deassert PHY soft reset and reconfigure the PIPE interface
> +		 * settings after PHY reinitialization.
> +		 */
> +		for (i =3D 0; i < dwc->num_usb3_ports; i++) {
> +			u32 reg =3D dwc3_readl(dwc, DWC3_GUSB3PIPECTL(i));

[Severity: High]
If the device suspended asynchronously between PRE_RESET and POST_RESET,
could accessing this hardware register cause a synchronous external abort?

Since phy_reset_in_progress is true, this path executes unconditionally
even if the controller's clocks are now disabled.

> +
> +			reg &=3D ~DWC3_GUSB3PIPECTL_PHYSOFTRST;
> +			dwc3_writel(dwc, DWC3_GUSB3PIPECTL(i), reg);
> +		}
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-rockchip-u=
sbdp-cleanup-v9-0-e31efbb62d2e@collabora.com?part=3D32
