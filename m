Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E1C35E1B1
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788146244; cv=none; b=UV8Fdhu0cVEL5ZerJ0NPUasuIwPXHUWRccssQr9E+FNkyZcRr9Z7OvcOp4hDiLGCx32LIq0bDZqpUvSAdNi8NvQQ89bUIjqJ2YvgddTVmDDWwHWIG3e0JRue05Xmj/gOKywKB4kZh6pfetSgt59r4AjdawvtHq0GavycZ6iDB6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788146244; c=relaxed/simple;
	bh=CGhpRzuvlYlHPtow0xseVvLTQnXAGPCXXeB0kqdtG3o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VM6JW8qk3RjETSuVZ7JU279TCsJhKIe8O9Gx2ozbc73UNP2YnB4/aQ5yvuOJfuZCyXAEoV8W+New7rpY9K7B0WxumWrFzivy6wdFv8q5gj0+y4Dp/Xif1+llQRNjdElQwj/+NjE2Q5IjZ03ed3F91N/6UpwY9F7ar8tkvk5Jcsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0PFFNHS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0PFFNHS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446311F000E9;
	Mon, 31 Aug 2026 03:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788146242;
	bh=F8JyuZ6jTeRYvPVbJQgqaFTea+XIzAmtar1q3v5duGw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c0PFFNHS0a+fDBcZPz0S+Qv+s72a+NF524Lnmxm9ThRoyAlvI/ecAeIqIiZY3yfag
	 RXMF3OkdQgfX+7KE7GDEON+LIRGoVEwgcQlN3GBC15IuAd8YtI+K8XIcqfwX4/Xft0
	 QQd6hMPV9vqAJBHL+xPu/otnpXtOYF/4ZyNWFWr4kXtuwtFjtlKjtLeJuNCEBXgKQM
	 rM3XUjCk1XTCYgcbzPK60jIby4YS3TT6xVWlIshWPDzcwnduPdMeA4Th6Mru6HrB5C
	 Lk5btS46PPJoJWsKL1hl+4CZXVmGGL1TL0THx1ghrAZimB9n1DAShMCzTu8dxsSErm
	 nFViekYgDI2yg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 7/8] usb: misc: qcom_eud: fix virtual attach/detach
 event handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831030147.1500616-8-elson.serrao@oss.qualcomm.com>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
 <20260831030147.1500616-8-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 03:17:21 +0000
Message-Id: <20260831031722.446311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but registration of =
the USB role switch occurs before hardware resources are mapped, exposing u=
ninitialized state during probe and creating a use-after-unmap vulnerabilit=
y during driver removal.
- [High] This problem wasn't introduced by this patch, but the primary inte=
rrupt handler sleeps in atomic context and fails to handle simultaneous int=
errupts, leading to IRQ storms and kernel panics.
--

commit 67f0b0cd525e7084b985eee06acbfa51320d857a
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: fix virtual attach/detach event handling

EUD provides virtual USB attach/detach events to simulate cable
plug/unplug while maintaining the physical debug connection. However,
the current implementation incorrectly sets the USB role to HOST on
virtual detach, which doesn't represent the disconnected state.

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 549c0d852bbba..605f675ec7dd0 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -306,10 +306,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, v=
oid *data)
> =20
>  	path =3D chip->paths[chip->port_idx];
> =20
> +	/*
> +	 * EUD virtual attach/detach event handling for low power debugging:
> +	 *
> +	 * When EUD is enabled in debug mode, the device remains physically
> +	 * connected to the PC throughout the debug session, keeping the USB
> +	 * controller active. This prevents testing of low power scenarios that
> +	 * require USB disconnection.
> +	 *
> +	 * EUD solves this by providing virtual USB attach/detach events while
> +	 * maintaining the physical connection. These events are triggered from
> +	 * the Host PC via the enumerated EUD control interface and delivered
> +	 * to the EUD driver as interrupts.
> +	 *
> +	 * These notifications are forwarded to the USB controller through role
> +	 * switch framework.
> +	 */
>  	if (chip->usb_attached)
>  		ret =3D usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
>  	else
> -		ret =3D usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
> +		ret =3D usb_role_switch_set_role(path->controller_sw, USB_ROLE_NONE);
>  	if (ret)
>  		dev_err(chip->dev, "failed to set role switch\n");
> =20

[Severity: High]
This isn't a bug introduced by this patch, but looking at eud_probe()
further down in the same file, the USB role switch is registered before
hardware resources are mapped:

drivers/usb/misc/qcom_eud.c:eud_probe() {
    ...
	for_each_child_of_node_scoped(np, child) {
		ret =3D eud_init_path(chip, child);
		if (ret)
			return ret;
	}

	/* Primary path is mandatory. Secondary is optional */
	if (!chip->paths[0])
		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");

	chip->base =3D devm_platform_ioremap_resource(pdev, 0);
    ...
}

Does this expose uninitialized state during probe and create a use-after-un=
map
vulnerability during driver removal?

If devm_platform_ioremap_resource() fails during probe, or during driver
removal, chip->base is unmapped before the USB role switch is unregistered
because devm actions execute in reverse order.

If the role switch receives an event (e.g., from userspace via sysfs) in th=
is
window, eud_role_switch_set() calls enable_eud() or disable_eud(), which
access the unmapped chip->base memory.


[Severity: High]
This is a pre-existing issue, but the primary interrupt handler
handle_eud_irq() sleeps in atomic context and fails to handle
simultaneous interrupts:

drivers/usb/misc/qcom_eud.c:handle_eud_irq() {
    ...
	switch (reg & EUD_INT_ALL) {
	case EUD_INT_VBUS:
		usb_attach_detach(chip);
		return IRQ_WAKE_THREAD;
	case EUD_INT_SAFE_MODE:
		pet_eud(chip);
		return IRQ_HANDLED;
	default:
		return IRQ_NONE;
	}
    ...
}

If both EUD_INT_VBUS and EUD_INT_SAFE_MODE bits are asserted, does the bitw=
ise
AND operation evaluate to 0x14, bypassing the handlers and dropping both
interrupts?

Additionally, when EUD_INT_SAFE_MODE fires, handle_eud_irq() calls pet_eud(=
):

drivers/usb/misc/qcom_eud.c:pet_eud() {
    ...
		/* Delay to make sure detach pet is done before attach pet */
		ret =3D readl_poll_timeout(chip->base + EUD_REG_SW_ATTACH_DET,
					reg, (reg =3D=3D 0), 1, 100);
    ...
}

Does this readl_poll_timeout() macro call usleep_range() inside the hard IRQ
context? Should it use readl_poll_timeout_atomic() instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831030147.1500=
616-1-elson.serrao@oss.qualcomm.com?part=3D7
