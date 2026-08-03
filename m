Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FB5364933
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 03:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727576; cv=none; b=lTkv8Col7odHjcFk9bw7gxw/grVOhF9ydlUM1a6pu3OO4GS5v+rq6DQtrbkDdA6aaJ7ur4z+QllcbKMvwmk1N3Notn0vs9pr4pLP5rFbf1mBpFOfFEoVrm7BTaY8hD3PYNhnE4GNbkjSZRqftfNCWzWGiOOU0Lr4ywadZm+2Maw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727576; c=relaxed/simple;
	bh=16jsQacORsRE1HnUa1m8WQqllQlMlELDTvvEOOk4RHU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EqCkrn0+ihnXOL9ie050FXPj8+3IjUb593t1RAU/HcU1xsdcDGJsdSwO14NOF/Ox/BlW2PUJvTPNl98xWUvd6d2PMOCV0jboq6J9RgCM/l/MGqx7cZHw3jz7WwOI0kamWq5JaUjr7Xhg3IrWA+7fI+ocoGcutnR9N+2R3zwmK7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOgcdHSe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOgcdHSe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CB8F1F000E9;
	Mon,  3 Aug 2026 03:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785727575;
	bh=vIvwmpDfRI2ge7RvVCn6kR1/y2KncG8lVe6sp0z3AIU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NOgcdHSeyBlA1PCB3byEUg38cjNI0q0QFyz1CMiH4i8NvxOOJpoxP0KhCl5uKdE9b
	 eR+tZw1qKAUlQuZJAjQm8J0ufZ6jOSWU+aiscd7SFN+ixHtoqmKFOxz88Vb83YkTL7
	 N0glVlmD84zF3ptp1DeVVUglQitn0lXSL3ga1mAHR9Nctam4+bbj3MA8VguOosck+E
	 aAe6e5CaFrvenOUNIPmeN9nQX6uv+LLIvI8eTdmMzqnFfePH4/TnrkqB6J3b37DC7H
	 Gan1+n75oX9gHq6HA2KkFFCv38trgo91LODpVo22m7RYMdsmlvdScQSsBiJA23anzY
	 ABPnKvHWFGuoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/9] usb: misc: qcom_eud: fix virtual attach/detach
 event handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803031534.2942628-8-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
 <20260803031534.2942628-8-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 03:26:14 +0000
Message-Id: <20260803032615.3CB8F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Race condition in `port_store` allowing unsafe concurrent modifica=
tion of `port_idx`.
- [High] Threaded IRQ handler modifies controller role without synchronizat=
ion, racing with Type-C physical detachment.
- [High] The EUD driver fails to restore the physical USB role when disable=
d while in a virtually detached state.
--

--- Patch [7]: [PATCH v5 7/9] usb: misc: qcom_eud: fix virtual attach/detac=
h event handling ---
commit ce50a52a3d67527a1dac91d09de56e8f3206cf1c
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: fix virtual attach/detach event handling

EUD provides virtual USB attach/detach events to simulate cable plug/unplug
while maintaining the physical debug connection. This commit fixes the virt=
ual
detach handling by setting the USB role to NONE instead of HOST, which
correctly represents the disconnected state.

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 538e070cc140a..a02f3535956db 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -306,10 +306,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, v=
oid *data)

[ ... ]

>  	if (chip->usb_attached)
>  		ret =3D usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
>  	else
> -		ret =3D usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
> +		ret =3D usb_role_switch_set_role(path->controller_sw, USB_ROLE_NONE);

[Severity: High]
This isn't a bug introduced by this patch, but does this threaded IRQ handl=
er
race with Type-C physical detachment?

The role switch is performed locklessly and without verifying if EUD is sti=
ll
logically active or physically attached.

If the physical Type-C cable is unplugged before this threaded IRQ handler =
runs,
eud_role_switch_set() could disable EUD and set path->controller_sw to
USB_ROLE_NONE.

When handle_eud_irq_thread() runs concurrently, if it sees chip->usb_attach=
ed
as true, it would blindly call usb_role_switch_set_role() and set the role =
to
USB_ROLE_DEVICE after the PHY has been powered off. Can this cause hardware
inconsistency or controller hangs?

>  	if (ret)
>  		dev_err(chip->dev, "failed to set role switch\n");


[Severity: High]
This is a pre-existing issue, but does the EUD driver fail to restore the
physical USB role when disabled while in a virtually detached state?

If the physical Type-C cable is connected (where path->curr_role is
USB_ROLE_DEVICE) and a virtual detach triggers handle_eud_irq_thread(), the
controller role is overridden to USB_ROLE_NONE.

If the user then disables EUD via sysfs:

drivers/usb/misc/qcom_eud.c:enable_store() {
    ...
    ret =3D disable_eud(chip);
    if (ret) {
        dev_err(chip->dev, "failed to disable eud\n");
        return ret;
    }
    ...
}

The driver does not appear to restore path->controller_sw to the actual
physical role (USB_ROLE_DEVICE).

Since the physical cable was never unplugged, the Type-C driver will not is=
sue
a new attach event. Could this leave the device controller stuck in
USB_ROLE_NONE and permanently prevent USB functionality until a physical re=
plug
occurs?

[Severity: High]
This is a pre-existing issue, but is there a race condition in port_store()
that allows unsafe concurrent modification of chip->port_idx?

If thread A starts enable_store() and acquires chip->state_lock, and thread=
 B
executes port_store() concurrently, thread B reads chip->enabled locklessly.

Since chip->enabled is still false, thread B bypasses the -EBUSY check and
updates chip->port_idx:

drivers/usb/misc/qcom_eud.c:port_store() {
    ...
    /* Port selection must be done before enabling EUD */
    if (chip->enabled)
        return -EBUSY;

    writel(port, chip->base + EUD_REG_PORT_SEL);
    chip->port_idx =3D port;
    ...
}

Thread A then finishes enable_store(), initializing the old port's PHY and
setting chip->enabled =3D true.

When EUD is subsequently disabled, disable_eud() calls eud_phy_disable(chip)
using the new chip->port_idx, attempting to power off an uninitialized PHY.
Does this leave the originally initialized PHY powered on indefinitely and =
risk
causing a kernel warning or crash?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803031534.2942=
628-1-elson.serrao@oss.qualcomm.com?part=3D7
