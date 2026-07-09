Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BF4410D1E
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 11:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783597515; cv=none; b=na2i7qU4Pf89Ipsuqv/oZ4OmBSnbz1/PYY6NBwxBnTaJfgA/nNYzIbckC8J6H4/K7xiGcm2r8N1OTJ0nETsDg9UdQwqz1A9PkXkEH9k4ncAHoXVyFuPoPBR43Sc8QIJYCBI25iK3i8GnWwowPPmvrpzUjSF/aCuKCdxRSfcdkCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783597515; c=relaxed/simple;
	bh=2OBdz7p99f8mjl1xNW1NNf8FV5RDqN+SXHoGkftcUsw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Hm6xC8trNDMtUBEku3UjgMfmc8lP9+vtQshIocFKURhWLfzPS3Sx09BbGOObkz/D6vrIWJ0YVX3+TQ51QI3u+XUb/gwxcXZtaBIkjPTXx/EcJ0PWLpIUhs7dAoE9B75YpfuarLXzonunbsMG50BumQsp2lUWdpBnrDEa2mgULXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fx/Ca+sj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fx/Ca+sj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F091F00A3A;
	Thu,  9 Jul 2026 11:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783597514;
	bh=k3fEcf3QI/sjj5Cid4RGiPs+Ainmk1/yQvgx8llKw+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fx/Ca+sjOPMM7WVmW6syeffySf7qzObx30OaG8IK5S+zpLEBsundkdo/mnVCkbeLr
	 wWELopOXBMgXtmvmoV7DHhEgIG244kL7UaVYU1d91FMHceTxuezcfBMpQL82rUJlgJ
	 BJ3OI8TQS7BelPUGkjSC/HhaNmKlvdMnDj5fBbKoZxZEMJ50/wa/J/c02U2rG5YjfS
	 Pv1w12vk4wB4SXwYfu6yxNtIh3QATg5BP7yMnB5gSJQpAwZ026BJWIvBxfFPZxd36m
	 H9+tVlwJF0eBMe99cOZvr5QolO1DTd3+hA0p98qMte5X2fB5w2O8SylwEAHPNJNnG3
	 rsaCNl0lZj1gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/14] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709095726.704448-10-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
 <20260709095726.704448-10-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 11:45:13 +0000
Message-Id: <20260709114513.D1F091F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incomplete and race-prone clearing of `hub->ports[]` causing Use-A=
fter-Free during teardown.
- [High] Missing NULL pointer checks cause deterministic crashes if the UAF=
 mitigation is triggered.
- [Medium] Port device sysfs exposure before power sequencer initialization=
 causes data races and potential Use-After-Free.
--

--- Patch [9]: [PATCH v4 09/14] usb: hub: Power on connected M.2 E-key conn=
ectors with power sequencing API ---
commit db3c17ab30961cf683de3a4643e34e109f716eac
Author: Chen-Yu Tsai <wenst@chromium.org>

usb: hub: Power on connected M.2 E-key connectors with power sequencing API

This commit adds power sequencing API support for M.2 E-key USB connectors
so their power can be enabled and W_DISABLE2# signal deasserted. It uses
the usb_port device to acquire the power sequencing descriptor and manages
it during port creation and removal.

> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index db867dc1cd14f..e1908a4e1f54a 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c

[ ... ]

> @@ -886,20 +897,24 @@ static void hub_tt_work(struct work_struct *work)
>  int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
>  			   int port1, bool set)
>  {
> +	struct usb_port *pwrseq_port =3D hub->ports[port1 - 1];
>  	int ret;
> =20
> +	ret =3D usb_hub_set_port_pwrseq(pwrseq_port, set);

[Severity: High]
Does this code dereference a NULL pointer if the port creation previously
failed?

If usb_hub_create_port_device() hits an error, it sets this array entry
to NULL. A concurrent PM or sysfs call to usb_hub_set_port_power() might
pass this NULL pointer directly into usb_hub_set_port_pwrseq(), which
then accesses port->pwrseq.

> diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> index de524c6da9fc4..7277c38c9e62c 100644
> --- a/drivers/usb/core/hub.h
> +++ b/drivers/usb/core/hub.h

[ ... ]

> @@ -103,7 +103,13 @@ static inline bool hub_is_port_power_switchable(stru=
ct usb_hub *hub)
>  	if (!hub)
>  		return false;
>  	hcs =3D hub->descriptor->wHubCharacteristics;
> -	return (le16_to_cpu(hcs) & HUB_CHAR_LPSM) < HUB_CHAR_NO_LPSM;
> +	if ((le16_to_cpu(hcs) & HUB_CHAR_LPSM) < HUB_CHAR_NO_LPSM)
> +		return true;
> +	/* check for controllable external power sequencers */
> +	for (unsigned int i =3D 0; i < hub->hdev->maxchild; i++)
> +		if (hub->ports[i] && hub->ports[i]->pwrseq)

[Severity: High]
Is it possible for hub->ports[i] to be set to NULL between the two reads?

Since the array entry can be cleared by another thread without a lock or
READ_ONCE(), evaluating hub->ports[i] twice might result in a NULL pointer
dereference on the second read.

> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index f3e4d6a31798a..dfb9f4bcd6124 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c

[ ... ]

> @@ -813,6 +859,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, i=
nt port1)
>  	if (!is_acpi_node(dev_fwnode(&hdev->dev)))
>  		device_set_node(&port_dev->dev,
>  				fwnode_graph_get_port_by_id(dev_fwnode(&hdev->dev), port1));
>  	mutex_init(&port_dev->status_lock);
>  	retval =3D device_register(&port_dev->dev);

[Severity: Medium]
Does registering the device here expose sysfs attributes before the power
sequencer is fully initialized?

device_register() exposes the device to userspace. A concurrent write to
the sysfs disable attribute can invoke disable_store(), which calls
usb_hub_set_port_power() and accesses port_dev->pwrseq without locking,
before it is assigned below.

>  	if (retval) {
>  		put_device(&port_dev->dev);
> +		hub->ports[port1 - 1] =3D NULL;
>  		return retval;
>  	}

[ ... ]

> @@ -871,10 +925,13 @@ int usb_hub_create_port_device(struct usb_hub *hub,=
 int port1)
>  	}
>  	return 0;
> =20
> +err_put_pwrseq:
> +	pwrseq_put(port_dev->pwrseq);

[Severity: Medium]
Could this result in a use-after-free if a concurrent sysfs write is in
progress?

If device_register() succeeded earlier, a racing sysfs operation might be
using the pwrseq descriptor when we free it here on the error path.

>  err_put_kn:
>  	sysfs_put(port_dev->state_kn);
>  err_unregister:
>  	device_unregister(&port_dev->dev);
> +	hub->ports[port1 - 1] =3D NULL;

[Severity: High]
Does clearing the array entry after device_unregister() leave a race window?

Since device_unregister() blocks to drain active sysfs and PM operations,
the array still contains a dangling pointer to this soon-to-be-freed memory
during that window. Should hub->ports[port1 - 1] be cleared before
unregistering?

> =20
>  	return retval;
>  }
> @@ -888,6 +945,7 @@ void usb_hub_remove_port_device(struct usb_hub *hub, =
int port1)
>  {
>  	struct usb_device *hdev =3D hub->hdev;
>  	struct usb_port *port_dev =3D hub->ports[port1 - 1];
>  	struct usb_port *peer;
> =20
>  	peer =3D port_dev->peer;

[Severity: High]
Does this code need to check if port_dev is NULL?=20

If usb_hub_create_port_device() failed previously, it sets this array entry
to NULL. During hub disconnect, iterating over all ports and calling this
function would blindly dereference port_dev here.

>  	if (peer)
>  		unlink_peers(port_dev, peer);
> +	pwrseq_put(port_dev->pwrseq);

[Severity: High]
Could freeing the power sequencer here cause a use-after-free?

By calling pwrseq_put() before device_unregister(), the descriptor is freed
while PM runtime and sysfs attributes are still fully active. A racing PM
autosuspend timer calling usb_hub_set_port_power() could dereference the
freed port->pwrseq.

Additionally, should hub->ports[port1 - 1] be set to NULL here to prevent
dangling pointers?

>  	component_del(&port_dev->dev, &connector_ops);
>  	sysfs_put(port_dev->state_kn);
>  	device_unregister(&port_dev->dev);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709095726.7044=
48-1-wenst@chromium.org?part=3D9
