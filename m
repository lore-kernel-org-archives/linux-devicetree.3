Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D3E372071
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 11:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077484; cv=none; b=oGYKfovJFCnHKkenbrTrCgIiXt+FxZNZC8YF45IPz/ZebGlanVDpBCIsrFeToluljnnC0nJyMxpKUKNNLv50K3TYRfxnNsiMWu+siYVXsBnEEBQmj/BCiYPTW3X2bx25g+GuQFI0PiUitKdwfDyYBy374lN8W6TKB1cT+Mi8GCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077484; c=relaxed/simple;
	bh=TubQsbYnnDr1H5X3xXaMc56FEPqRutoVxIpBmObCZsU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ct8c5vWLaJsfVE0LAII0XwKW5/NrqdOw05P2Znu+7BEC/KEWEZzUekQ13BSoXd+LErdQKTLIWTnH+KlsVnhlMqMcoF+cKb8RNLlV7AZ1d0Gv0BfMzSJEANwG1f0i2Fmac2Jn1HdVK96A8gEXLyZG6fI/2Hd+KYacP6C9b4JbKjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQKK0xmA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQKK0xmA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A601F000E9;
	Fri,  3 Jul 2026 11:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783077483;
	bh=Y+KgXiQfiKfUoacR5pXrRyPdvQdX014LK/RQp+1jHfc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KQKK0xmA9RYlyYhTyC0MIwyxxtPLhvGCb46OftI+b2M5U8JZXd7TZeZc4145dEgo/
	 5JEX4s8accm/+i7D6aWQm83kNBXZJQekeG0bKNhObFKfaFg8akEWlDRr7r7DRsXTgD
	 VcdEBY2iRCoD66+ULWdLs8Vq5KHPSBCSajNGRflof/5qwXtHSrG0jOHCutScQPl3i4
	 EeCzvoxXSUJSOiBZoPvilZ4yDsbLt+hmhpk7WoT3IxFZQuKSX6hAdz42zuzWmc6Uct
	 jy0leYSfe/0ZOTBfRR5/nPizX1N8kGSAPqCJmyknLivLJ3eTqlhBHsYuwrqzJyKu4M
	 GqxSuN+yy8wcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/13] usb: hub: Associate port@ fwnode with USB port
 device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260703110317.1283411-6-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
 <20260703110317.1283411-6-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 11:18:02 +0000
Message-Id: <20260703111802.A8A601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The firmware node reference obtained from `fwnode_graph_get_port=
_by_id()` is leaked because it is never explicitly released.
--

commit 25f9337168757350400d5fa5ab05e87193277473
Author: Chen-Yu Tsai <wenst@chromium.org>

usb: hub: Associate port@ fwnode with USB port device

This commit assigns a firmware node to a USB port device if the hub's
firmware node is not an ACPI node. This association allows later M.2 slot
power sequencing providers to match against the requesting port.

> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index b1364f0c384ce..1088776ef750b 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c

[ ... ]

> @@ -780,6 +781,13 @@ int usb_hub_create_port_device(struct usb_hub *hub, =
int port1)
>  	port_dev->dev.driver =3D &usb_port_driver;
>  	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
>  			port1);
> +	/*
> +	 * ACPI FW nodes are associated later when device_register() happens.
> +	 * Skip assigning one here to avoid potential conflicts.
> +	 */
> +	if (!is_acpi_node(dev_fwnode(&hdev->dev)))
> +		device_set_node(&port_dev->dev,
> +				fwnode_graph_get_port_by_id(dev_fwnode(&hdev->dev), port1));

[Severity: Medium]
Does this code leak the fwnode_handle reference?

fwnode_graph_get_port_by_id() increments the reference count of the returned
firmware node, and the caller is expected to release it.

Since device_set_node() merely assigns dev->fwnode without taking ownership
of the reference, the driver core doesn't automatically drop it when the
device is destroyed.

Looking at usb_port_device_release() in drivers/usb/core/port.c, it
only frees the port structures:

static void usb_port_device_release(struct device *dev)
{
	struct usb_port *port_dev =3D to_usb_port(dev);

	kfree(port_dev->req);
	kfree(port_dev);
}

Without a corresponding fwnode_handle_put(), will this result in a reference
leak whenever a USB hub is disconnected, or if device_register() fails on t=
he
error path?

>  	mutex_init(&port_dev->status_lock);
>  	retval =3D device_register(&port_dev->dev);
>  	if (retval) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703110317.1283=
411-1-wenst@chromium.org?part=3D5
