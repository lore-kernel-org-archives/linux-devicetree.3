Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5CA35AC12
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786686231; cv=none; b=cNdGkUkb7yCPBAABVb5d+vAOB1PGwGYaqLOvrrnPSLpOpKKDb2kpYUnQXp5PB5FEDYBMRakW8LR5KYzHlXw6Q9UPZbQWA6kKy37wZQPXKG0UFa3g8NZLkKSI02l0PPaNoCAYECiC510yiBALEKjZAjvPFZjOksL73jucRo6sN2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786686231; c=relaxed/simple;
	bh=mYYCRnI1dNpjjwBk7lqsYX5t9jNeAX0ivrGVUhCEQp8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HgRbDHciTqJTPVgreRBxfzaS7rQ1fiPw0k2+GtAuD9nZKXFDexrVepDIa/vu4Z2oWVdL/3bBDvviy2+Yx+xLjaiHDSNPGlXzTVLjhb8MchTAa2rLj21Euq58x8nS7Vh3zFbAH+yCH8VpiyKzak6mzX8MqegynKo/yPGwx7EBkQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=el2uGqgw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="el2uGqgw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFEC1F000E9;
	Fri, 14 Aug 2026 05:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786686229;
	bh=1g6A5FvJ5WXw8UL/HnxMF3zluG9HVvl6rg26A3xq++g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=el2uGqgwpZZJ32YdnHGPEu1NLuJTK+aCP0XEESGldgvBJ6rcNRX0VF56g+sQKYury
	 YtigZ6De6BpHqFU4ufkM4K7qD2pMBglVtyWKAhu+n4pcQ/DXtMIHBj8Ibbe+DV8Net
	 iH6YZY8NBCeoxKsstK2pvGpdBXNPxoqrzdsxvzITbj6QGyLqfhEiDCZLEcyYSVcF34
	 66/H6Gpovqc4I9WqUa/bE7eJaTOAlGzIURGBE8RtZpBo+s/XCbI80/H6EnFpw5SPjn
	 ZHnNVUTAp8mTdwP2//UDmKIUhmMGNHDL7d5C/FOwxbaHQ6Jpg+wRzyVquuT5Gyqi9M
	 YXQTF3lfirtpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 31/38] usb: dwc3: rockchip: support PHY reset
 notifications
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, conor+dt@kernel.org
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-31-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-31-b5ad9c68fa11@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 05:43:48 +0000
Message-Id: <20260814054349.6DFEC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The PHY notification handler unconditionally drops a PM usage refe=
rence if `pm_runtime_get_if_active()` returns `-EINVAL`, causing a usage co=
unter underflow and potentially dropping references owned by other parts of=
 the driver.
- [High] The PHY notifier unregistration is deferred to the devres teardown=
 phase, creating a race condition where an asynchronous PHY reset event acc=
esses unclocked and reset DWC3 hardware, causing a kernel panic.
--

--- Patch [31]: [PATCH v14 31/38] usb: dwc3: rockchip: support PHY reset no=
tifications ---
commit f458b4c213899f50f1d40c52f7c5aaeb38fdb675
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

usb: dwc3: rockchip: support PHY reset notifications

On recent Rockchip platforms (at least RK3588 & RK3576), DWC3 IP is used
with a USBDP PHY providing USB3 and DP. This PHY needs to be reset when
the mode changes, which may happen when plugging in different USB-C
devices. This adds handling for the new PHY framework reset notifications.

> diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-roc=
kchip.c
> index 1df33625b69f8..9e91e5f7e53d6 100644
> --- a/drivers/usb/dwc3/dwc3-rockchip.c
> +++ b/drivers/usb/dwc3/dwc3-rockchip.c
[ ... ]
> +static int dwc3_usb3_phy_notify(struct notifier_block *nb,
> +				unsigned long action, void *data)
> +{
[ ... ]
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
Does this code risk a PM usage counter underflow if PM is disabled?

When pm_runtime_get_if_active() returns -EINVAL, the !ret check evaluates
to false, allowing execution to proceed without incrementing the usage coun=
ter.

[ ... ]
> +	case PHY_NOTIFY_POST_RESET:
[ ... ]
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
Is it safe to unconditionally call pm_runtime_put_autosuspend() here?

The comment in PHY_NOTIFY_PRE_RESET states that PM ref counting is a no-op
in the -EINVAL case, but pm_runtime_put_autosuspend() will decrement the
usage counter regardless. This could cause an unbalanced put and drop
references owned by other parts of the driver.

> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static void dwc3_rk_phy_unregister_notifiers(void *data)
> +{
> +	struct dwc3_rockchip *dwc_rk =3D data;
> +	struct dwc3 *dwc =3D &dwc_rk->dwc;
> +	int i;
> +
> +	for (i =3D 0; i < dwc->num_usb3_ports; i++)
> +		phy_unregister_notifier(dwc->usb3_generic_phy[i],
> +					&dwc_rk->usb3_phy_nb[i].nb);
> +
> +	/* Release any PM references from in-flight resets */
> +	for (i =3D 0; i < dwc->num_usb3_ports; i++) {
> +		if (dwc_rk->phy_reset_active & BIT(i))
> +			pm_runtime_put_autosuspend(dwc->dev);

[Severity: High]
Can this also cause a PM usage counter underflow?

If an in-flight reset was initiated while pm_runtime_get_if_active()
returned -EINVAL, we didn't acquire a reference. Calling
pm_runtime_put_autosuspend() here would result in the same unbalanced put.

> +	}
> +	dwc_rk->phy_reset_active =3D 0;
> +}
> +
> +static int dwc3_rk_phy_register_notifiers(struct dwc3 *dwc)
> +{
> +	struct dwc3_rockchip *dwc_rk =3D container_of(dwc, struct dwc3_rockchip=
, dwc);
> +	int i;
> +
> +	for (i =3D 0; i < dwc->num_usb3_ports; i++) {
> +		dwc_rk->usb3_phy_nb[i].nb.notifier_call =3D dwc3_usb3_phy_notify;
> +		dwc_rk->usb3_phy_nb[i].dwc_rk =3D dwc_rk;
> +		dwc_rk->usb3_phy_nb[i].port_index =3D i;
> +		phy_register_notifier(dwc->usb3_generic_phy[i],
> +				      &dwc_rk->usb3_phy_nb[i].nb);
> +	}
> +
> +	return devm_add_action_or_reset(dwc->dev, dwc3_rk_phy_unregister_notifi=
ers, dwc_rk);

[Severity: High]
Can deferring notifier unregistration to the devres phase cause a kernel
panic during driver unbind?

When the driver is unbound, the DWC3 core is typically shut down (clocks
disabled and hardware reset asserted) before the devres teardown phase runs.

If an external PHY reset event arrives in this window, dwc3_usb3_phy_notify=
()
would execute and attempt to read DWC3_GUSB3PIPECTL from unclocked and reset
hardware, potentially causing a Synchronous External Abort.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-rockchip-u=
sbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com?part=3D31
