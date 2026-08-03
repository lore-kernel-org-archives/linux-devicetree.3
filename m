Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAAA374756
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 03:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727672; cv=none; b=dPbZoBXbUzKSzgbUNQU8HMFLz3ko7hkeXbC6n96kZRG9ugvgRVt24r70tBuTWG2DONyDyZ0wVhs4c3nggZJxwYIXO1MYyMDYb2ZWKNTErztOgafTzv/fFR2llOgD+lEOrD3EDbjAkYu0U8uTrUqapqWHdFdEHTIjWxVHku+nxCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727672; c=relaxed/simple;
	bh=PzKsfHi/1uHF1aPimTHsSaUwuhx3uNLVJ2xiqcoKk6o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t35h31QbeuKEa0V5i7C8bPKfc2zcl9W3QUU/Hd+cUuWBe9nLESxsKwRhW+oTzi5sOpSMKAVfQXHwKucEBZrr7cLzMGyLLJw1Tc+Pb5kmDBT+IspaQFcRdsYxcGdpay3ren0ahecoyljmSOQ4DhMy8n/XI1xuBMBzg3dmmrHFWwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRHyRlXl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRHyRlXl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 125FE1F000E9;
	Mon,  3 Aug 2026 03:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785727671;
	bh=UVJYsBkwI2EvDgD5Jw1mvpqmnx7ltaJAKPAcgP32ADM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LRHyRlXlUA7J9bDzITiasj1wsumrMbLX6TZpY2VI32JKx7KHYGnVBsUUv12SxZYjS
	 T1pWVdpEiIeGmLHVh7SoKScS0RxRYwrGJ5P6S7QdhFfG76VVQuZuNDapRDD7U+zJ8P
	 Frl2EUjVC9WRDqCQhRgCU+T3k0qXHX2Q5via5ah4oy4k2yR8hW4Z8L4xLJh4a7Y51O
	 WEPREnDItU0K0a6XpmJ5v4Vqiu7MHgFKAi0p71W3oxBdMC+iy1CbaCtaHMd3VOoFdV
	 Q7PXWND9B7WODZFb5r62J4oWq8SrEY+/Q8GPdxJtq6CuWJzZbNOcbAhFSQFrYG1ybO
	 GhDBX4HlhDB5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/9] usb: misc: qcom_eud: add role-based EUD control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260803031534.2942628-7-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
 <20260803031534.2942628-7-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 03:27:50 +0000
Message-Id: <20260803032751.125FE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Missing `state_lock` in `port_store()` allows a concurrent TOCTOU =
race with `enable_store()`, leading to unbalanced PHY operations and resour=
ce leaks.
- [High] Error handling in `eud_role_switch_set()` causes state desynchroni=
zation and blocks core USB role switches.
- [High] `eud_remove()` lacks `state_lock` and does not set `chip->enabled =
=3D false`, causing a concurrent driver teardown race.

Pre-existing issues:
- [High] Simultaneous VBUS and SAFE_MODE interrupts cause an unacknowledged=
 IRQ storm.
--

--- Patch [6]: [PATCH v5 6/9] usb: misc: qcom_eud: add role-based EUD contr=
ol ---
commit e9c3a517ab0e4301ef49204c0ab1c8da2ba44fa8
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>
Subject: usb: misc: qcom_eud: add role-based EUD control

This commit modifies the EUD driver to treat EUD as usable only in device
role, disabling it in host mode. It uses a role-switch callback to enable or
disable EUD across role transitions and defers sysfs enable requests made
outside device role until the port switches.

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index e83a4402e4b84..538e070cc140a 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c

[ ... ]

> @@ -55,6 +56,8 @@ struct eud_chip {
>  	struct device			*dev;
>  	void __iomem			*base;
>  	struct eud_path			*paths[EUD_MAX_PORTS];
> +	/* serializes EUD control operations */
> +	struct mutex			state_lock;

[Severity: High]
Does the introduction of state_lock serialize EUD operations entirely, or
could this leave a regression with unbalanced PHY operations?

Looking at port_store() and handle_eud_irq_thread(), they appear to access
chip->port_idx and chip->enabled without acquiring state_lock. For example,
in port_store():

    /* Port selection must be done before enabling EUD */
    if (chip->enabled)
        return -EBUSY;

    writel(port, chip->base + EUD_REG_PORT_SEL);
    chip->port_idx =3D port;

If Thread A writes to the port sysfs attribute and Thread B writes to the
enable sysfs attribute concurrently, could Thread A read chip->enabled as
false, while Thread B acquires state_lock in enable_store() and enables
the PHY for the current port?=20

If Thread A then locklessly updates chip->port_idx, future disable operatio=
ns
would target the new port's PHY instead of the old one. Could this lead to
a regression by leaving a permanent PHY power leak?

[ ... ]

> @@ -304,7 +323,30 @@ static irqreturn_t handle_eud_irq_thread(int irq, vo=
id *data)
>  static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role=
 role)
>  {
>  	struct eud_path *path =3D usb_role_switch_get_drvdata(sw);
> -	int ret;
> +	struct eud_chip *chip =3D path->chip;
> +	int ret =3D 0;
> +
> +	guard(mutex)(&chip->state_lock);
> +
> +	/*
> +	 * EUD is usable only in device role. Power it down for every other
> +	 * role to avoid keeping an unusable module 'ON'. chip->enabled
> +	 * preserves user's sysfs configuration and is not modified across
> +	 * role transitions.
> +	 */
> +	if (chip->enabled && path->num =3D=3D chip->port_idx && role !=3D path-=
>curr_role) {
> +		if (role =3D=3D USB_ROLE_DEVICE)
> +			ret =3D enable_eud(chip);
> +		else if (path->curr_role =3D=3D USB_ROLE_DEVICE)
> +			ret =3D disable_eud(chip);

[Severity: High]
If a Type-C role switch occurs concurrently during or after module unload,
could this introduce a regression by corrupting the hardware state?

Looking at eud_remove(), it calls disable_eud() without holding state_lock
and without setting chip->enabled to false:

    static void eud_remove(struct platform_device *pdev)
    {
        struct eud_chip *chip =3D platform_get_drvdata(pdev);

        if (chip->enabled)
            disable_eud(chip);

Since the EUD role switch and IRQs are managed by devm, they remain active
during eud_remove(). If eud_role_switch_set() executes concurrently and
observes chip->enabled is still true, could it re-enable the hardware just
before devres teardown, leading to PHY imbalances?

> +
> +		if (ret) {
> +			dev_err(chip->dev, "failed to %s EUD for role %s: %d\n",
> +				str_enable_disable(role =3D=3D USB_ROLE_DEVICE),
> +				usb_role_string(role), ret);
> +			return ret;
> +		}
> +	}

[Severity: High]
Does this early return introduce a regression where core USB role switches
fail if EUD encounters an error?

If enable_eud() fails, the function returns early and completely bypasses
the downstream usb_role_switch_set_role() call, which might block core
USB role switch functionality.

Additionally, if enable_eud() succeeds but the downstream controller switch
fails:

    ret =3D usb_role_switch_set_role(path->controller_sw, role);
    if (ret) {
        dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
                usb_role_string(role), path->num, ret);
        return ret;
    }

    path->curr_role =3D role;

The function returns without rolling back the EUD state and without updating
path->curr_role. When the port later switches back to USB_ROLE_HOST,
role !=3D path->curr_role would evaluate to false, skipping the disable step
and permanently desynchronizing the state.

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but does handle_eud_irq()
correctly handle the hardware state where multiple interrupt bits are asser=
ted
at once?

Looking at handle_eud_irq():

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

If both EUD_INT_VBUS and EUD_INT_SAFE_MODE are asserted simultaneously,
the bitwise AND results in both bits being set. This combined value falls
through to the default block, returning IRQ_NONE without clearing the
interrupts. Could this cause an unacknowledged IRQ storm and force the kern=
el
to disable the EUD IRQ line?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803031534.2942=
628-1-elson.serrao@oss.qualcomm.com?part=3D6
