Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870413AA4ED
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145990; cv=none; b=ePT31aWTcEbI8h+8Xj44JwamTF3Aj7EdzDuuC+UjRwzULV80mxafx3Wkkqrw5gFkxOD8yRXmaHw3FY5hxIxVa1od8Reif8QXgIeUaSCCGEw5l8KRyjcNOgROxD0i1DnqnbBW1KKp2rDs7ASGDD8+3zl9SapPXDI2w43HeTPsCck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145990; c=relaxed/simple;
	bh=aXBizR2U+JzPKTd46AlngrUMeG4F8P2vT+JPpiThtYE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gwRlA+cRADVrhB4dS6HPZx1/P6nVKURt28O4OoSVhiDR5OgomJwQ2X73FqGS0RniKb6/wSZLqzBweVKiXkwEnC12aEQQg0KsxA3gj+eOV9Ln6L5Kdd7RWv2Giw6oBX9I1ELY8VrzOUGaZtZC+RXZ0FA1ziuZJzx0oxZlP5J6qi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtzxRNAg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtzxRNAg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CECA01F000E9;
	Mon, 31 Aug 2026 03:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788145989;
	bh=QrHmqR4em24Mtb2k42Keqt5NBY7FcBQw1niCfPfVfZs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YtzxRNAgRwU6TembJHiEnqpdYxL54y3XuPYCamrJMW04C3sa16cp/aIyOlNlus4oO
	 9g/BVGgIxylTyIszToEnyZnXvmOym3VOuCzY+iaLZK9hDzvuqVtbxM9Kol8ga7jc+v
	 nvI4xCkRZDDGDMcI2fwTKluV5nrxPBJLuVGAZ2nxah1eW4L3hqT01mPLD/x83Mnj+D
	 hNyxTG8QYJL5JukpOm47CqWcb+ELmM4iJSCbX24nDkoNJb7Gi+tjLk+fGyCPwTZInk
	 ahL3fWXoCCXafacHi75/3Utz3UUmWGY66SHiQW5P8W1m12mNubj4JwfpL1J9NIWyhv
	 tDvN9JR8rnchg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/8] usb: misc: qcom_eud: add role-based EUD control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831030147.1500616-7-elson.serrao@oss.qualcomm.com>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
 <20260831030147.1500616-7-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 03:13:08 +0000
Message-Id: <20260831031308.CECA01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing `state_lock` acquisition in `port_store` and `eud_remove` =
introduces data races that can corrupt port state and leave hardware incorr=
ectly enabled.
- [Medium] Missing error rollback in `eud_role_switch_set` leaves EUD hardw=
are incorrectly enabled if the USB controller fails to switch roles.
--

commit 73436063bf4c0e29764237d75663c476d5f5b246
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: add role-based EUD control

EUD functions by presenting itself as a USB device to the host PC and is
therefore only applicable when the port operates in device role. Keeping
EUD enabled in other roles provides no benefit and unnecessarily keeps
the associated PHY resources enabled. Furthermore, enabling EUD in host
role can cause the USB controller to misbehave because the EUD hub
supports only a single upstream-facing port.

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 07522225a8f89..549c0d852bbba 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
[ ... ]
> @@ -156,17 +159,33 @@ static ssize_t enable_store(struct device *dev,
>  		const char *buf, size_t count)
>  {
>  	struct eud_chip *chip =3D dev_get_drvdata(dev);
> +	struct eud_path *path;
>  	bool enable;
>  	int ret;
> =20
>  	if (kstrtobool(buf, &enable))
>  		return -EINVAL;
> =20
> +	guard(mutex)(&chip->state_lock);
> +
>  	/* Skip operation if already in desired state */
>  	if (chip->enabled =3D=3D enable)
>  		return count;
> =20
>  	if (enable) {
> +		path =3D chip->paths[chip->port_idx];
> +
> +		/*
> +		 * If not yet in device role, honor the userspace request and defer
> +		 * EUD enablement until the port transitions to device role in the
> +		 * set_role callback.
> +		 */
> +		if (path->curr_role !=3D USB_ROLE_DEVICE) {

[Severity: High]
Does this code race with port_store() and eud_remove() which do not take the
newly introduced state_lock?

Looking at port_store():

drivers/usb/misc/qcom_eud.c:port_store() {
    ...
	/* Port selection must be done before enabling EUD */
	if (chip->enabled)
		return -EBUSY;

	writel(port, chip->base + EUD_REG_PORT_SEL);
	chip->port_idx =3D port;
    ...
}

If a concurrent sysfs write to the port attribute changes chip->port_idx
after enable_store() has acquired state_lock and cached the path, wouldn't
enable_store() validate the role for the old port, but call enable_eud() wh=
ich
will use the new port index locklessly updated by port_store()? This could
power on the PHY for the newly selected port regardless of its role.

Similarly, eud_remove() manipulates hardware state without the state_lock:

drivers/usb/misc/qcom_eud.c:eud_remove() {
    ...
	if (chip->enabled)
		disable_eud(chip);
    ...
}

Could this teardown logic race with ongoing concurrent role-switch operatio=
ns
and unbalanced PHY power management on module removal?

> +			dev_info(chip->dev, "Deferring EUD enable until port enters device mo=
de\n");
> +			chip->enabled =3D enable;
> +			return count;
> +		}
> +
>  		ret =3D enable_eud(chip);
>  		if (ret) {
>  			dev_err(chip->dev, "failed to enable eud\n");
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

[Severity: Medium]
If hardware state changes are made here before calling
usb_role_switch_set_role(), what happens if the controller transition fails
below?

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
> +	if (ret) {
> +		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
> +			usb_role_string(role), path->num, ret);
> +		return ret;
> +	}

If usb_role_switch_set_role() fails, this returns the error immediately wit=
hout
rolling back the physical state changes made earlier and without updating
path->curr_role.

If a transition to USB_ROLE_DEVICE enabled the EUD, but the controller swit=
ch
failed, wouldn't a subsequent switch back to USB_ROLE_HOST skip disabling t=
he
EUD because path->curr_role never became USB_ROLE_DEVICE? Could this perman=
ently
leave the EUD active in host mode, triggering controller misbehavior and le=
aking
the PHY power?

> +
> +	path->curr_role =3D role;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831030147.1500=
616-1-elson.serrao@oss.qualcomm.com?part=3D6
