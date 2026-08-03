Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EF0360EC0
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 03:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727805; cv=none; b=FT2MY8WPBGhrdg2WFAhrmwrE2JuyaN72SKkVgY2v83i2yXvfj+IrgROnTpBbq6rzHS3WG0qt9/6w8RGo3ix378yFdTuq0h/8KJNCI6Vr9Q7fRQEIjI+G4UaDK8+Oisar3SvHA8wH5Vl2BWgWGzzJNbOiF5ExGQgx7tIgnUdiB5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727805; c=relaxed/simple;
	bh=hzcxJac49eC4V/mpexIECW5LDhsF+rce/kxIvDwxQE4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mi/iBhuPJ/e9W8B5A6kvZJ5xLXC+POdy8h2Yb4fjCq4KcNTpUZNhI2VF0e0MtOf78SWf3g7gCYYHwIbd13WXLfdy7bz+tvtfJM/61s9bt1Z5RsvD77kC0E+i9c5WC18pn/mlbbqhQ3vrHtiNKJ1rbSC0jo/LbuXHKY4zvQ586Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6QV2sXn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6QV2sXn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A381F000E9;
	Mon,  3 Aug 2026 03:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785727804;
	bh=CDYjTeCnUJVxktJ+fEzBMHnxRYQU0WMbxOrpniUbrMU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D6QV2sXnQqsSxoHMAvz/SwtyZcnI9UPxfQWuVKVQqaUzPjCjTc5BwI8pVE1pt6UUZ
	 zIhY2J5hWvX7EWeyw8GcGuW29NSzyHK/GCzQE2UAShPDbyd/UThIvHKD1Dp1QJkS96
	 MWNbOig7Z0CSDY7/X3mgxVsJkZgnnghaoDsxNOvpIN935yrCT+5JVMuPppW9PFzVYp
	 yrVKSc6Zz2wntrReR0UsECBoKRPT8DDr2Bj5Wx8LOdID964hwVF+LQr/1A3exha9GG
	 bqyRlTcB3r3ulzUMzshsU7D/LMh19fwtk4fbX5AlmgEVqOiH1fL9rNOUD1CjC0f0id
	 +hw0EFwaoqWZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/9] usb: misc: qcom_eud: add per-path role switch
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260803031534.2942628-5-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
 <20260803031534.2942628-5-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 03:30:03 +0000
Message-Id: <20260803033003.F2A381F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Missing synchronization in sysfs handlers enable_store and port_st=
ore causes PHY reference count corruption and hardware desynchronization.
- [High] EUD remains physically enabled when the role switches to HOST, bre=
aking host mode.

Pre-existing issues:
- [High] Sysfs enable_store fails to clear chip->enabled on disable, perman=
ently locking port_store.
--

--- Patch [4]: [PATCH v5 4/9] usb: misc: qcom_eud: add per-path role switch=
 support ---
commit b7772664d1b8d3bcc67e85e648539118fa47a9cd
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: add per-path role switch support

This commit updates the EUD driver to support per-path role switches instead
of a single chip-level switch. It allows each path to handle independent ro=
le
management by relaying requests from the connector to the controller. The
unnecessary role switch call from enable_eud() is also removed.

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 03d1c200658c8..48a4441b0c9c0 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c

[ ... ]

> @@ -286,17 +292,39 @@ static irqreturn_t handle_eud_irq_thread(int irq, v=
oid *data)
>  	return IRQ_HANDLED;
>  }
> =20
> -static void eud_role_switch_release(void *data)
> +static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role=
 role)
>  {
> -	struct eud_chip *chip =3D data;
> +	struct eud_path *path =3D usb_role_switch_get_drvdata(sw);
> +	int ret;
> +
> +	/* Forward the role request to the USB controller */
> +	ret =3D usb_role_switch_set_role(path->controller_sw, role);
> +	if (ret) {
> +		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
> +			usb_role_string(role), path->num, ret);
> +		return ret;
> +	}
> +
> +	path->curr_role =3D role;
> +
> +	return 0;
> +}

[Severity: High]
Does the EUD remain physically enabled when the role switches to USB_ROLE_H=
OST?

If a role switch to USB_ROLE_HOST occurs, eud_role_switch_set() forwards the
request to the USB controller but doesn't appear to dynamically disable the
EUD hardware itself. Since EUD is only usable in device role, would keeping=
 it
enabled during host role disrupt the UTMI lines and break the host connecti=
on?

[Severity: High]
Could the missing synchronization between the sysfs handlers enable_store()
and port_store() cause PHY reference count corruption?

Looking at drivers/usb/misc/qcom_eud.c, if Thread A executes enable_store()
while Thread B concurrently executes port_store(), port_store() can modify
chip->port_idx locklessly:

Thread B in port_store():
    chip->port_idx =3D port;

Thread A in enable_store() would then execute enable_eud() without seeing t=
he
updated port_idx or while it is changing:

Thread A in enable_store():
    ret =3D enable_eud(chip);
    if (!ret)
        chip->enabled =3D enable;

Because neither function holds a lock, port_store() can bypass the
chip->enabled check. This might cause eud_phy_enable() to power on the PHY
for the new port. When disable_eud() is later called, could it disable the
wrong PHY and leak the power-on state for the old PHY?

[Severity: High]
This is a pre-existing issue, but does enable_store() fail to clear the
enabled flag on disable?

Looking at enable_store() in drivers/usb/misc/qcom_eud.c:

enable_store() {
    ...
    } else {
        ret =3D disable_eud(chip);
    }

    return ret < 0 ? ret : count;
}

If a user writes 0 to the enable sysfs attribute, this calls disable_eud(ch=
ip)
but doesn't set chip->enabled =3D false. Could this permanently lock
port_store(), since subsequent writes will unconditionally fail with -EBUSY
when checking if (chip->enabled)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803031534.2942=
628-1-elson.serrao@oss.qualcomm.com?part=3D4
