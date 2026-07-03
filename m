Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F55B386440
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 11:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783078171; cv=none; b=uJDzS6y2DROe7B+g4NXD9AAO3HodpXpyT/yM3n/KQFedzJ1ILeR8isZ4GN+lOoaVvcjwCKAGGDcCunQcm4LGpXo7SF/9E6MT4W25al+hC2c9c+prgnoRiwSN0Y68faZRv122eK3SxBGYfH/i75UB2D9I5NvyHLVcVKIZfm1edao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783078171; c=relaxed/simple;
	bh=9QB6ZOMvTWbv0jsY6jSxCpMYTInYzvFH49pQLdDa3Sc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dcfOS2NgomAFfdPzfgIyTSJowRKyQ0/GAvrrNQM3KWnDkEaADwPaYSPfx5giAAJLYG4LURhvhvhtrWyiix0HdXHs+f+6m5v9lFKXN22e1yYKul3ddl0y2kkQApbLjmfCHzNBsEtwJeA8xCqk2FrN2hS2KxXLLKFR+WLx7Uavnzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxGIKHYP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxGIKHYP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420A61F000E9;
	Fri,  3 Jul 2026 11:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783078169;
	bh=SqtxQboPkG19SI4FZUKSBHB5CNoqR5mAVLqPovUWpac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gxGIKHYPRjSqWxfH/tQpjThXZDauYGOovxmr+IXSD2WcdQioCPdlK4IZzNDnN3UGH
	 9zMMgmgX7P9LbfxOjRPxdo/p59xHcEvrdEciy8cTL58S/i02Kc9YQkkD5npTR2OWhS
	 Jl2ZOi5lw6F94+UyDCx3qGMpOSVMDGPtITF1DzVDbvrKVAuC3H6BOUIbkXhkNniZEG
	 7SfbnoFKMTvD5ZOwjssNpjdY97gDhvMeVqVzGz0i+l9WgI9lprZSV+ZPj/WMb8eESr
	 ch12fi1DbL/wrJHtqyFnF+y/x/RFxdJ8C3iySjCepmrUh4ptJm0QdrgXRHdjuGRD3a
	 pepJWU3SaNbNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/13] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260703110317.1283411-9-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
 <20260703110317.1283411-9-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 11:29:28 +0000
Message-Id: <20260703112929.420A61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Off-by-one array access in `hub_is_port_power_switchable()` causes=
 an out-of-bounds read and potential use-after-free on the `hub->ports` arr=
ay.
- [High] Missing NULL check for `port->pwrseq` causes all USB ports to fail=
 to power on when `CONFIG_POWER_SEQUENCING` is disabled.
- [Medium] Leaked firmware node reference count in `usb_hub_create_port_dev=
ice`.
- [Low] Missing dummy declaration for `pwrseq_power_is_on()` when `CONFIG_P=
OWER_SEQUENCING` is disabled.
--

commit d1a665b6f212fa1e434ea2cca8c69acf5a200a73
Author: Chen-Yu Tsai <wenst@chromium.org>

    usb: hub: Power on connected M.2 E-key connectors with power sequencing=
 API
   =20
    The new M.2 E-key connector can have a USB connection. For the USB devi=
ce
    on this connector to work, its power must be enabled and the W_DISABLE2#
    signal deasserted. The connector driver handles this and provides a
    toggle over the power sequencing API.

> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 5969c55b2201f..5327ae179181d 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
[ ... ]
> @@ -871,6 +872,30 @@ static void hub_tt_work(struct work_struct *work)
>  	spin_unlock_irqrestore(&hub->tt.lock, flags);
>  }
> =20
> +static int usb_hub_set_port_pwrseq(struct usb_port *port, bool set)
> +{
> +	int ret =3D 0;
> +
> +	if (set)
> +		ret =3D pwrseq_power_on(port->pwrseq);
> +	else
> +		ret =3D pwrseq_power_off(port->pwrseq);
> +
> +	return ret;
> +}

[Severity: High]
Does this code correctly handle the case when CONFIG_POWER_SEQUENCING is
disabled?

When power sequencing is disabled, port->pwrseq is NULL. However, the
inline stub for pwrseq_power_on() in include/linux/pwrseq/consumer.h blindly
returns -ENOSYS.

Because this return value is checked in usb_hub_set_port_power():

drivers/usb/core/hub.c:usb_hub_set_port_power() {
    ...
    ret =3D usb_hub_set_port_pwrseq(pwrseq_port, set);
    if (ret)
        return ret;
    ...
}

Could this cause all USB ports to completely fail to power on when the kern=
el
is built without CONFIG_POWER_SEQUENCING support, returning -ENOSYS before
calling set_port_feature()?

[ ... ]
> @@ -3242,7 +3271,10 @@ int usb_port_is_power_on(struct usb_port *port, un=
signed int portstatus)
>  			ret =3D 1;
>  	}
> =20
> -	return ret;
> +	if (!port->pwrseq)
> +		return ret;
> +
> +	return ret && pwrseq_power_is_on(port->pwrseq);
>  }

[Severity: Low]
Is there a missing dummy declaration for pwrseq_power_is_on() when
CONFIG_POWER_SEQUENCING is disabled?

It appears that the fallback #else block in include/linux/pwrseq/consumer.h
is missing a dummy stub implementation for pwrseq_power_is_on(). This could
lead to an implicit function declaration error when building the kernel with
CONFIG_USB=3Dy and CONFIG_POWER_SEQUENCING=3Dn.

> diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> index b65d9192379db..99bae6ace4da0 100644
> --- a/drivers/usb/core/hub.h
> +++ b/drivers/usb/core/hub.h
[ ... ]
> @@ -147,7 +149,13 @@ static inline bool hub_is_port_power_switchable(stru=
ct usb_hub *hub)
>  	if (!hub)
>  		return false;
>  	hcs =3D hub->descriptor->wHubCharacteristics;
> -	return (le16_to_cpu(hcs) & HUB_CHAR_LPSM) < HUB_CHAR_NO_LPSM;
> +	if ((le16_to_cpu(hcs) & HUB_CHAR_LPSM) < HUB_CHAR_NO_LPSM)
> +		return true;
> +	/* check for controllable external power sequencers */
> +	for (unsigned int i =3D 1; i <=3D hub->hdev->maxchild; i++)
> +		if (hub->ports[i] && hub->ports[i]->pwrseq)
> +			return true;
> +	return false;
>  }

[Severity: High]
Does this loop index cause an out-of-bounds read and potential use-after-fr=
ee
on the hub->ports array?

The loop iterates from i =3D 1 to hub->hdev->maxchild, skipping index 0 and
reading one element past the allocated boundary (index maxchild).=20

Additionally, if usb_hub_create_port_device() fails to initialize a port,
the port device pointer is still assigned in the array:

drivers/usb/core/port.c:usb_hub_create_port_device() {
    ...
    hub->ports[port1 - 1] =3D port_dev;
    ...
    retval =3D device_register(&port_dev->dev);
    if (retval) {
        put_device(&port_dev->dev);
        return retval;
    }
    ...
}

If this initialization fails for port X, hub->ports[X-1] will retain a poin=
ter
to the freed port device. When hub_is_port_power_switchable() iterates,
it will access hub->ports[1] through hub->ports[X-1], leading to a
use-after-free when reading the ->pwrseq field.

> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index 77dbf51f17604..87b8e4f90be68 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
[ ... ]
> @@ -809,10 +848,18 @@ int usb_hub_create_port_device(struct usb_hub *hub,=
 int port1)
>  		goto err_put_kn;
>  	}
> =20
> +	port_dev->pwrseq =3D usb_hub_port_pwrseq_get(port_dev);
> +	if (IS_ERR(port_dev->pwrseq)) {
> +		retval =3D PTR_ERR(port_dev->pwrseq);
> +		dev_err_probe(&port_dev->dev, retval,
> +			      "failed to get power sequencing descriptor\n");
> +		goto err_put_kn;
> +	}
> +

[Severity: Medium]
Can this code leak a firmware node reference count?

Earlier in usb_hub_create_port_device(), fwnode_graph_get_port_by_id()
returns a fwnode_handle with its reference count incremented:

drivers/usb/core/port.c:usb_hub_create_port_device() {
    ...
    if (!is_acpi_node(dev_fwnode(&hdev->dev)))
        device_set_node(&port_dev->dev,
                fwnode_graph_get_port_by_id(dev_fwnode(&hdev->dev), port1));
    ...
}

This fwnode_handle is assigned to the device, but the device core does not
automatically drop it on device_unregister(). Since fwnode_handle_put() is
never called in usb_port_device_release() or usb_hub_remove_port_device(),
is this reference permanently leaked during port device teardown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703110317.1283=
411-1-wenst@chromium.org?part=3D8
