Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD6D25B098
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786687168; cv=none; b=iW7wkcVflQ5UUgtWMq49zMa/RyzF9E6szsQnE2HqjgB9uFFw7slW3z7xf+yBN0FVKCs079BnFfjWntTMGOWRSCTcQz5/QpI8NwO0Q1d95MrPQkeCb1p048BWlz/V0pPq7q8tLwkW2Z4ektrbMxClTtJauVmc5YVI+fIK18ORAb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786687168; c=relaxed/simple;
	bh=hQwiKBNLanvcgm8kUX9QuAe1qNuEcQTlUI8O1dOVl2Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HZsGkARS9r3xGG6FjCdKV7pjBXrE4BHR8LEuc40BXVd5R2r7xityVR4Raq/IP8Nrwf/5LY+L/Pjk2t37wyLD/omRKy73zzXmOuO8iHkTo6itdtN5dmJ4DiEx/3d18+bDc0tc74XDrVBqiL99uGCO1xJY6VrMoEh0yOlwU9f2cHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AU5vPqVB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AU5vPqVB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C847E1F000E9;
	Fri, 14 Aug 2026 05:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786687167;
	bh=dwYkajfXVsc/lluqOH69OJDf3Dzy05FDpzrJUVIwxlg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AU5vPqVB1o8G4Ar/rE9VMSoJZXr5CKk/CTForunfOi9ErpVzyLkcghmJoEr4y4iTR
	 0BZWfEe7YhBrh/2xI2ZWNyHN2skJHE5GQqFhsAALcgB2IH/aQT8cY2jl6PmW4l8kjt
	 B4nszCBMbEGtsbrK8Y8gbIcBMHgDZhR1h6gmjyl/eUHDXKbW+GAYTJKMHrRhxLrXOJ
	 dfM1HtDsAOCmYmxYcU6t0pOEWNjkAixuriyheCELzhNtis3eG69OTEUNc5R5yq3Cg8
	 Os5cQjbhMelS2d4brBmagfgCxdmieFmBNg7YJ+6IiKHju4o+AxQqVwwABtD2llp6O+
	 Sja0suslWp7gA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 32/38] usb: dwc3: rockchip: fix USB-C reconnect in
 gadget mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, vkoul@kernel.org, olteanv@gmail.com, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-32-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-32-b5ad9c68fa11@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 05:59:26 +0000
Message-Id: <20260814055926.C847E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Checking !dwc->gadget_driver in dwc3_rockchip_vbus_handler breaks =
the UDC core's VBUS state tracking, defeating the patch's intended PM resum=
e logic.
- [High] TOCTOU race in dwc3_rockchip_vbus_handler leading to Use-After-Fre=
e of gadget and UDC structures.

Pre-existing issues:
- [High] Using asynchronous pm_runtime_put_autosuspend() in the device remo=
val path introduces race conditions.
- [High] Mishandling of -EINVAL from pm_runtime_get_if_active() causes PM u=
sage count underflow and unsafe MMIO access without clocks.
--

--- Patch [32]: [PATCH v14 32/38] usb: dwc3: rockchip: fix USB-C reconnect =
in gadget mode ---
commit 9dbfd69b985e240b0787670a034f6b9c37a180d0
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

usb: dwc3: rockchip: fix USB-C reconnect in gadget mode

When USB-C is configured in gadget mode and the cable is unplugged the
USB controller is suspended. This patch triggers a runtime PM resume
when the role is changed to fix an issue where the controller stays
suspended and the port status remains not-attached after reconnecting.

> diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-roc=
kchip.c
> index 9e91e5f7e53d6..246d7dcafc68f 100644
> --- a/drivers/usb/dwc3/dwc3-rockchip.c
> +++ b/drivers/usb/dwc3/dwc3-rockchip.c
> @@ -25,8 +25,17 @@ struct dwc3_rockchip {
>  	struct dwc3		dwc;
>  	struct dwc3_rk_phy_nb	usb3_phy_nb[DWC3_USB3_MAX_PORTS];
>  	u8			phy_reset_active;
> +	enum usb_role		role;
>  };
> =20
> +static void dwc3_rockchip_vbus_handler(struct dwc3 *dwc, bool present)
> +{
> +	if (!dwc->gadget || !dwc->gadget_driver)
> +		return;

[Severity: High]
Does this early return break the UDC core's VBUS state tracking when a gadg=
et
driver is not yet bound?

If the system boots with the cable unplugged and no gadget driver is loaded,
this returns early and drops the unplug event. The UDC core's udc->vbus wou=
ld
remain true.

When the gadget driver is later loaded, this true state would cause a
premature pullup that wakes the device but then lets it autosuspend. When t=
he
cable is actually plugged in later, the UDC core might see the state hasn't
changed and skip the pullup, meaning the device never receives the PM resume
needed to detect the connection.

[Severity: High]
Can this lead to a use-after-free of the gadget and UDC structures?

This function is called locklessly from the asynchronous PHY notifier
dwc3_usb3_phy_notify(). If a concurrent role switch occurs (like DEVICE to
HOST), dwc3_gadget_exit() could be freeing the gadget structure under
dwc->mutex:

dwc3_rockchip_vbus_handler()
    if (!dwc->gadget || !dwc->gadget_driver)

Concurrent dwc3_gadget_exit()
    usb_put_gadget() -> kfree(gadget)

Would this result in the notifier dereferencing a freed gadget pointer when
it calls usb_udc_vbus_handler() below?

> +
> +	usb_udc_vbus_handler(dwc->gadget, present);
> +}
> +

[ ... ]

> @@ -57,6 +66,8 @@ static int dwc3_usb3_phy_notify(struct notifier_block *=
nb,
>  		if (!ret)
>  			return NOTIFY_OK;

[Severity: High]
This is a pre-existing issue, but does this check properly handle the
-EINVAL return from pm_runtime_get_if_active()?

pm_runtime_get_if_active() returns -EINVAL when runtime PM is disabled.
By checking if (!ret), the -EINVAL case falls through and allows the code
to proceed. This can cause unsafe MMIO access without clocks.

Additionally, in the PHY_NOTIFY_POST_RESET case, pm_runtime_put_autosuspend=
()
is called unconditionally:

dwc3_usb3_phy_notify() {
    ...
    case PHY_NOTIFY_POST_RESET:
        ...
        pm_runtime_put_autosuspend(dwc->dev);
        break;
}

Since pm_runtime_put_autosuspend() calls rpm_drop_usage_count(), this would
decrement the usage count and cause an underflow if the corresponding get
failed with -EINVAL.

> +		dwc3_rockchip_vbus_handler(dwc, false);
> +
>  		/*
>  		 * Assert USB3 PHY soft reset within DWC3 before the external

[ ... ]

> @@ -130,7 +144,16 @@ static int dwc3_rk_phy_register_notifiers(struct dwc=
3 *dwc)
>  	return devm_add_action_or_reset(dwc->dev, dwc3_rk_phy_unregister_notifi=
ers, dwc_rk);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does the cleanup function
dwc3_rk_phy_unregister_notifiers() safely handle device removal?

The cleanup function executes during devres teardown:

dwc3_rk_phy_unregister_notifiers() {
    ...
    for (i =3D 0; i < dwc->num_usb3_ports; i++) {
        if (dwc_rk->phy_reset_active & BIT(i))
            pm_runtime_put_autosuspend(dwc->dev);
    }
}

Since this runs during device removal, the asynchronous suspend could fire
after device memory is freed or during bus teardown. Should this use
pm_runtime_put_sync() instead to ensure hardware is in the correct state
before removal completes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-rockchip-u=
sbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com?part=3D32
