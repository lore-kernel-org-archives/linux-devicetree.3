Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D474E50B2
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 21:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718436; cv=none; b=QGflKMRLikPgGIg5g/wuJiXvmLS6vgFZal2A9xor1wI5k/go4DWbnVJF7CP6LZhAzd7iB6XuxzvXgLL6gZYisAxwbfbkBezuNgS7baNxxCJ2ZRs/+j+jYFn0giSA9pU46ap6Jtsooz5j07dhHTc+sOz7/vIyMGqkcb/XIAhCoUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718436; c=relaxed/simple;
	bh=SKuReJXip+ZX6DQS2Nw/qSdjr6TNs73j5T7dKdEnitM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UtIIiaDm8OldfdyYW2xIWOS9Ptz1lud0BPiBcD7S/nkrPHDCItZGCp9yqtS7oIBTf9JlTYRo8JpYf4ldUJxZZooQikY7D0+5mV9xY5HdtZ2m54LaNpn3m1SAbm3o92NMFkwSr07Xs1TmgAy+9TaKOq9ISDp5m2JQOjhdqQa7uC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f8RknuAI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f8RknuAI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC9BA1F00898;
	Tue, 29 Sep 2026 21:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790718424;
	bh=7pbhDCaySzcssHNKHj+WojU//dZkILOAqhdHAv0DVdc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f8RknuAIKdJ7MOTCq8IgSRZtCEBicOFbqVap+85ysWlSnqldTwEwBnEv2mhnvN8HJ
	 /MMgokhKbFhXkgdTEb7HtjXbSh1+CiD9ZNW8Ayi+OtNGKg9EUtmMS3jZ05uOUVz/iB
	 Sw2VKtgypYWTu8zhaYg6OJmQRZudKSZKMrnPe1XBU6dvj3hGuEeK9Ot/6BaKELRYAf
	 9n6yFDOoMZ01pm7hZxOSDLeDwEapRrWVr2qeM8J+4+DTYYiLOAx4QoLXLNfj+x5wvh
	 wmmOYjmSPN8d4/AUIiXQ/wZChpTbgeAqOg8C+ELNK5bLlFdk8b412zjMIBdzgP6Oev
	 G8kDFCG+dA59A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 6/8] usb: misc: qcom_eud: add role-based EUD control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260929213513.2401005-7-elson.serrao@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-7-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 21:47:03 +0000
Message-Id: <20260929214703.AC9BA1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: qcom_eud: missing hardware and state rollback on role switch =
failure
--

commit ac5ffb8b40f5366751bb4683118798fac6f6bb75
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: add role-based EUD control

EUD functions by presenting itself as a USB device to the host PC and is
therefore only applicable when the port operates in device role. This patch
addresses this by treating EUD as usable only in device role, enabling or
disabling it as the port enters or leaves device role.

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index e227d05cfecd4..5a21a2dd0b0cd 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c

[ ... ]

> @@ -306,7 +331,30 @@ static irqreturn_t handle_eud_irq_thread(int irq, vo=
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
>  	/* curr_role tracks the role from EUD's point of view */
>  	path->curr_role =3D role;
>=20
>  	/* Forward the role request to the USB controller */
>  	ret =3D usb_role_switch_set_role(path->controller_sw, role);
>  	if (ret) {
>  		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
>  			usb_role_string(role), path->num, ret);
>  		return ret;
>  	}

[Severity: High]
Does this error path leave the hardware and state permanently desynchronized
if the downstream controller switch fails?

If a role switch to USB_ROLE_DEVICE is requested, enable_eud() succeeds and
path->curr_role is updated.  Then usb_role_switch_set_role() is called to
forward the switch to the controller.

If this downstream switch fails and returns an error, the function returns
early without reverting path->curr_role or powering down the EUD via
disable_eud().

As noted in the commit message, enabling EUD in host role can cause the USB
controller to misbehave. Could this sequence leave the EUD hardware enabled
while the underlying USB controller remains in its previous role?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929213513.2401=
005-1-elson.serrao@oss.qualcomm.com?part=3D6
