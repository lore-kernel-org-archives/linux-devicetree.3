Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D8A3FB06D
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 21:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786485248; cv=none; b=JS1j2OuD73QmBlmZh1tgOiLM4mRszVMt+BGrBwi1WuuspLfkIe0i1Qx435YLgpyBjobTwt79GYDp735J9k9c+S7beKKU2DN98oabMyF/Yq5DMNrQ4KtRn13N3C1dv/ADCOutVjiOw77ympfkDKs5NePstRXeBaziP9NMkNw4RF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786485248; c=relaxed/simple;
	bh=DT21wdaIrT1r0d/apCXT298bkCyDnFfMbUvWz0lH7Io=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OleIfS0OuFPuOXg4pZ1h3f9J7yBI7gboAACiWckcMjc+phqNbesbx80zR6wYr6FQQCNnsmGPjKUJ+ilbnE0BbfnL6nBSnlpw7jBdKadUk+IdmRGMfo8DfOgbdpApfD2KbFAFll4GaDg28xCmF3qO9f620/aPzWSDTRQ9y84CHf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0Fsvb5V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0Fsvb5V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD161F00A3A;
	Tue, 11 Aug 2026 21:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786485246;
	bh=zdtDiPpVWJpH0jgGVRgmR3a81nH+RjjRM0OGAUU+MLI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A0Fsvb5V7mlLIBc7q0wvIz0k78LJhoSwNOVFUwqrVIS3vUTcnQq6OI/0+F7bvobTb
	 ssRIkyQtVcP15HFPNY4V0vljb3cooinGQYVDdbpRwC7++zUkKkl2HiY4Tt16XHsDvh
	 lzbnGAP5kvwYP52peLGBznnYPXw4Y0v0x+WH/Md1cFDTaidwfQOsmiBcrLzoy8nEGO
	 n57aW6lHMq0kP/A9Wm3I9m+h6ZpgN4QxxgenCRyqAkZUiGspnuSdvWi9LIuwvo2h7n
	 rCYqIu6QhZG4aeqisism5sYF7YhF/DiGqmSZh/F1B8TpSd0o6yXb3NVS50N2RbCjdm
	 fya3eQdYBvAcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/9] usb: misc: qcom_eud: add role-based EUD control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260811213610.2956147-7-elson.serrao@oss.qualcomm.com>
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
 <20260811213610.2956147-7-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 21:54:06 +0000
Message-Id: <20260811215406.7FD161F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect devres ordering causes a use-after-unmap vulnerability d=
uring driver removal.
- [Medium] Missing rollback on downstream USB role switch failure causes pe=
rmanent state desynchronization and PHY power leak.
--

--- Patch [6]: [PATCH v6 6/9] usb: misc: qcom_eud: add role-based EUD contr=
ol ---
commit bc0de19142343d10fe6a60512025d0e334d88fb3
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: add role-based EUD control

EUD functions by presenting itself as a USB device to the host PC and is
therefore only applicable when the port operates in device role. This patch
updates the driver to treat EUD as usable only in device role, modifying the
role-switch callback to enable or disable EUD accordingly.

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index e83a4402e4b84..538e070cc140a 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
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
> +
> +		if (ret) {
> +			dev_err(chip->dev, "failed to %s EUD for role %s: %d\n",
> +				str_enable_disable(role =3D=3D USB_ROLE_DEVICE),
> +				usb_role_string(role), ret);
> +			return ret;
> +		}
> +	}
> =20
>  	/* Forward the role request to the USB controller */
>  	ret =3D usb_role_switch_set_role(path->controller_sw, role);

[Severity: Medium]
If the downstream controller rejects the role switch and returns an error,
does this leave the EUD hardware state out of sync?

Looking at eud_role_switch_set(), if we were transitioning to USB_ROLE_DEVI=
CE,
we already called enable_eud(). If usb_role_switch_set_role() then fails,
the function returns without updating path->curr_role or rolling back the
physical enable:

    ret =3D usb_role_switch_set_role(path->controller_sw, role);
    if (ret) {
        dev_err(...);
        return ret;
    }

Since path->curr_role remains out of sync with the physical state, will fut=
ure
transitions to USB_ROLE_NONE evaluate (role !=3D path->curr_role) as false =
and
permanently skip calling disable_eud(), leaving the PHY powered on?

[ ... ]
> @@ -431,6 +473,8 @@ static int eud_probe(struct platform_device *pdev)
> =20
>  	chip->dev =3D &pdev->dev;
> =20
> +	mutex_init(&chip->state_lock);
> +
>  	for_each_child_of_node_scoped(np, child) {
>  		ret =3D eud_init_path(chip, child);
>  		if (ret)

[Severity: High]
Does registering the role switch here create a devres ordering issue with t=
he
I/O memory mapping?

In eud_probe(), the USB role switch is registered via eud_init_path() before
chip->base is mapped via devm_platform_ioremap_resource() later in the probe
function.

Since devres callbacks run in strictly reverse order, during driver teardown
chip->base will be unmapped before the role switch is unregistered. If a
concurrent role switch event arrives during this window, eud_role_switch_se=
t()
could see chip->enabled =3D=3D true and call enable_eud(), which writes to =
the
already unmapped chip->base.

Could this lead to a panic or page fault during driver removal?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811213610.2956=
147-1-elson.serrao@oss.qualcomm.com?part=3D6
