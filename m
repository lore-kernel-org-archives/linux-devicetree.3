Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D909E31716B
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082227; cv=none; b=XOx1hxXku7uYxqKg6PPImov31F7qcRnY+7DCV54S8XrsFp0aYmnRDPeRHt7P5Z9wi+HoDlDlLlkr+Ux285inBjAEPI2j5xvCprus/SxCPMaFopxZGRq3xjvslIQKdZbRTNaEa2JkbT1RelkTBE7beaEdMfMuChk8YsQm2HQp/Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082227; c=relaxed/simple;
	bh=79p0Oc8fMVTwl1KI/pOjCZyiktjHRz0ZI47pBrMcqWI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lY4GAO/vvIW8dkJjBUfK3jwDdKI3P/qF0nQ4jmIQQtXANZz2vRMGfVcYrLacLwfCIflOxp9RHRNTfuiZt37FFoj1C5/BTke53OjnVws/O3+wmyotjNSjx4uhn6a11cJERBu+jZKBqlSOaqsO+kZvpRVokL19IEOn+T2RZivK7V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIN5A7Xi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIN5A7Xi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335541F00893;
	Wed, 10 Jun 2026 09:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781082225;
	bh=NEKeVqcsuf+fTUKPWYYZEz1jNE8y6PzL64lhb4RBn38=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SIN5A7XigNVXnaM0i4dkYa0VOl5m08cWz9YfuXr6H94VbxDZOHXD0F/4mGR2SaWir
	 WZbsAhQHPsrXyscYmXxJ09h7FwPYDEBivlwtBMWGTVCtCK/531Ai+5p3Vg4oVJ2Ufr
	 QdlRTu66mlMRnHEKsDb/tTJKrl326OV1D6YoQVh4M2gzslcWcddt9Pxig5SqDLB8k/
	 6m/4GuFcRlQnn0zyuwaJB0ktdGfORR9IGYDg6ndTzDucZMG/tYSRY5THmXnpgl20OL
	 S6qF8CBRznMOyehMYE1IGTtAW4lzgPMLLYmuAZi/b5mjDLslPdUZ2rp7qK0M5kB4Gv
	 7EL+V5dfjDUUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/16] usb: hub: Power on connected M.2 E-key
 connectors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260610084053.2059858-8-wenst@chromium.org>
References: <20260610084053.2059858-8-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 09:03:44 +0000
Message-Id: <20260610090345.335541F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Unconditional calls to power sequencing APIs will fail all USB=
 port initializations when `CONFIG_POWER_SEQUENCING` is disabled.
- [High] Concurrent modification of the `pwrseq_on` bitfield on a shared `u=
sb_port` device causes data races and corruption of other bitfields.
- [High] Premature physical power-off of the shared M.2 E-key power sequenc=
er when one peer logical port suspends, unexpectedly disconnecting the acti=
ve peer.
- [Medium] Leaked fwnode reference during USB port creation via `fwnode_gra=
ph_get_port_by_id()`.
--

commit 984160fb49fab6dc951a766897ded9fb49d0992b
Author: Chen-Yu Tsai <wenst@chromium.org>

usb: hub: Power on connected M.2 E-key connectors

This patch adds support for powering on directly connected M.2 E-key
connectors via the power sequencing API. It ties the power sequencing
descriptor to the usb port device to allow providers to distinguish
ports on a hub. The power state is toggled using the power sequencing
API during port power changes.

> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 0c75965fefb7c..585b6beec71bb 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -886,20 +887,41 @@ static void hub_tt_work(struct work_struct *work)
>  int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
>  			   int port1, bool set)
>  {
> -	int ret;
> +	struct usb_port *pwrseq_port =3D hub->ports[port1 - 1];
> +	int ret =3D 0;
> +
> +	/* non-SuperSpeed USB port holds pwrseq descriptor reference. */
> +	if (hub->ports[port1 - 1]->is_superspeed && hub->ports[port1 - 1]->peer)
> +		pwrseq_port =3D hub->ports[port1 - 1]->peer;
> +
> +	if (set && !pwrseq_port->pwrseq_on)
> +		ret =3D pwrseq_power_on(pwrseq_port->pwrseq);
> +	else if (!set && pwrseq_port->pwrseq_on)
> +		ret =3D pwrseq_power_off(pwrseq_port->pwrseq);

[Severity: High]
Will this prematurely cut physical power to the M.2 slot if the HiSpeed
logical port suspends?

A physical M.2 connector has both a SuperSpeed and HiSpeed logical port.
This patch binds the power sequencing descriptor only to the HiSpeed port
and shares a single pwrseq_on boolean for both logical ports.

If a SuperSpeed device is connected, the SuperSpeed port remains active,
but the HiSpeed port suspends via usb_port_runtime_suspend() since it detec=
ts
no active HiSpeed device. Suspending the HiSpeed port invokes
usb_hub_set_port_power(..., false) which immediately calls
pwrseq_power_off() here since pwrseq_on is true.

This would abruptly cut physical power to the M.2 slot and drop the active
SuperSpeed device, because the boolean flag bypasses the power sequencing
framework's internal reference counting and ignores the active state of the
SuperSpeed port.

> +	if (ret)
> +		return ret;
> =20
>  	if (set)
>  		ret =3D set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
>  	else
>  		ret =3D usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
> =20
> -	if (ret)
> +	if (ret) {
> +		if (set && !pwrseq_port->pwrseq_on)
> +			pwrseq_power_off(pwrseq_port->pwrseq);
> +		else if (!set && pwrseq_port->pwrseq_on)
> +			pwrseq_power_on(pwrseq_port->pwrseq);
>  		return ret;
> +	}
> =20
> -	if (set)
> +	if (set) {
>  		set_bit(port1, hub->power_bits);
> -	else
> +		pwrseq_port->pwrseq_on =3D 1;
> +	} else {
>  		clear_bit(port1, hub->power_bits);
> +		pwrseq_port->pwrseq_on =3D 0;
> +	}

[Severity: High]
Could modifying this bitfield without holding usb_lock_port() cause a data =
race?

Since pwrseq_on is packed alongside other 1-bit fields in struct usb_port
(like ignore_event, early_stop, and usb3_lpm_u1_permit), modifying it here
in usb_hub_set_port_power() without synchronization can cause a
read-modify-write data race.

If sysfs (like usb3_lpm_u1_permit_store) or hub event workqueues modify
adjacent bits under their respective locks concurrently, one thread's update
could silently overwrite the other's, corrupting the port state.

[ ... ]

> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index d9d3e2bb8f251..a5e7fbf4aa6e2 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -803,10 +846,25 @@ int usb_hub_create_port_device(struct usb_hub *hub,=
 int port1)
>  		goto err_put_kn;
>  	}
> =20

[Severity: Medium]
Does port creation leak an fwnode reference here?

Earlier in usb_hub_create_port_device(), the call to
fwnode_graph_get_port_by_id() returns a firmware node with an incremented
reference count. This node is passed to device_set_node(), which assigns it
but does not take ownership of the reference.

Neither the error paths in usb_hub_create_port_device(), nor
usb_hub_remove_port_device() call fwnode_handle_put() to release it, causing
a reference leak every time a usb port is enumerated.

> +	port_dev->pwrseq =3D usb_hub_port_pwrseq_get(port_dev);
> +	if (IS_ERR(port_dev->pwrseq)) {
> +		retval =3D PTR_ERR(port_dev->pwrseq);
> +		dev_err_probe(&port_dev->dev, retval,
> +			      "failed to get power sequencing descriptor\n");
> +		goto err_put_kn;
> +	}
> +
> +	retval =3D pwrseq_power_on(port_dev->pwrseq);
> +	if (retval) {
> +		dev_err_probe(&port_dev->dev, retval, "failed to enable power\n");
> +		goto err_put_pwrseq;
> +	}

[Severity: Critical]
Will this fail port creation for all usb ports when power sequencing
is disabled?

If the kernel is built without power sequencing enabled,
usb_hub_port_pwrseq_get() deliberately returns NULL.

However, pwrseq_power_on(NULL) unconditionally returns -ENOSYS when the
feature is disabled. Treating -ENOSYS as a hard failure here will abort port
creation, causing the entire usb subsystem to fail enumerating any ports on
systems where power sequencing is disabled.

> +	port_dev->pwrseq_on =3D 1;
> +
>  	retval =3D component_add(&port_dev->dev, &connector_ops);
>  	if (retval) {
>  		dev_warn(&port_dev->dev, "failed to add component\n");
> -		goto err_put_kn;
> +		goto err_pwrseq_off;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610084053.2059=
858-1-wenst@chromium.org?part=3D7
