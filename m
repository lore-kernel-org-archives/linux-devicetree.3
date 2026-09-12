Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BECF344DB5
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 23:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789254188; cv=none; b=UFeW1xoLTAf3OfKAApEBNz073piB+MggEcc5YZ/BZRaruD8QGKl3WolIUyGbhYKm+zdGmsdwpMWkizVmsFGILNvB5cogIgT83tuZ1YO950hIXF9Y/FCbZN/HYCah5ekyyoXus71DrKb5CRLktBCsafpy1JvAv3UfG0qg6uttNFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789254188; c=relaxed/simple;
	bh=yT17rBtH/T4i/QAlXQFpbLg1QN4c550LSxThFMCOlWo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tuoExgRCuO5+OwtgLiZQrja/0nskhjyYp1jOiILhvp0b1Q2J0y2IXnifxuOPx/XiW9aXJ0/Jk/YcoGtJg833c7vekpxt1dGQh68SLeO+g1jlHBycu7rbaH0wgmVsdSdj85j00AZEKFhCgdVfcGZUYlmHJZ9NtCc4RyRrNJTAfwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUGpE5Hv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUGpE5Hv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0EBD1F000FF;
	Sat, 12 Sep 2026 23:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789254184;
	bh=PDYxxARBp7qi6cR+aE/4YaZLFVEBB38SQuE0qvJnbAg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RUGpE5HvIUcJJuBbJwJrChKUPhgjNYEOwgS+5UGRHooAYt4JLffjzTnPX7UZoPsvx
	 G1K46XcvHANX9GwAdXfNXKNhOAKFBh/IjKaaZbWs8L2ot6msz0gWMNDRQxB79T5nrn
	 OeJoWbLTcPL2r1f1DW3gRdhIgCEhYjKfleJmiUWuRHiqUREzIruwJtw7D5ZwsuCtm7
	 h675Bs9WGUER8N5hcjU/XqGnIxI9ikXNs7SjWjAdXXiNnxu+nwOxe3gI73pCMABLPm
	 ODk4dsstzst/UgWkdJb8x66qPpu6lIwY19paRlJjFKxnwt+gkd9xAqJvCSaScabEMp
	 7UC4lm0t9NpBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 6/8] usb: misc: qcom_eud: add role-based EUD control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260912225301.3396556-7-elson.serrao@oss.qualcomm.com>
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
 <20260912225301.3396556-7-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 23:03:04 +0000
Message-Id: <20260912230304.A0EBD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Mixing goto-based exit logic with scope-based guard() cleanup in `h=
andle_eud_irq_thread`.
--

commit 5bca652d5a5a406c9aee75922062a73bc36dc72b
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: add role-based EUD control

This commit updates the QCOM EUD driver to only operate when the port is in
device role, preserving hardware resources and preventing controller misbeh=
avior
in host role. It uses a mutex to serialize state management across sysfs, I=
RQ,
and role switch paths.

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
[ ... ]
> @@ -285,8 +306,13 @@ static irqreturn_t handle_eud_irq_thread(int irq, vo=
id *data)
>  	struct eud_path *path;
>  	int ret;
> =20
> +	guard(mutex)(&chip->state_lock);
> +
>  	path =3D chip->paths[chip->port_idx];
> =20
> +	if (!chip->enabled || path->curr_role !=3D USB_ROLE_DEVICE)
> +		goto out;
> +

[Severity: Low]
Does this code mix a goto-based exit label (out) with a scope-based
guard(mutex) in handle_eud_irq_thread()?

The Cleanup and Guard Subsystem architectural guidelines explicitly ban mix=
ing
these patterns in the same function to prevent confusing ownership semantic=
s.
While this might not lead to an immediate runtime failure here since the go=
to
just skips to clearing an interrupt and returning, the subsystem documentat=
ion
states that for a given routine, all resources must either be converted to
scope-based cleanup, or none of them should be.

>  	if (chip->usb_attached)
>  		ret =3D usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
>  	else
> @@ -294,6 +320,7 @@ static irqreturn_t handle_eud_irq_thread(int irq, voi=
d *data)
>  	if (ret)
>  		dev_err(chip->dev, "failed to set role switch\n");
> =20
> +out:
>  	/* set and clear vbus_int_clr[0] to clear interrupt */
>  	writel(BIT(0), chip->base + EUD_REG_VBUS_INT_CLR);
>  	writel(0, chip->base + EUD_REG_VBUS_INT_CLR);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912225301.3396=
556-1-elson.serrao@oss.qualcomm.com?part=3D6
