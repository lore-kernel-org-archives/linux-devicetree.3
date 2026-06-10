Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B1A1AA7A6
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081803; cv=none; b=iL+KPN+rItvoLUekWsmN/QAYJwdctO704kTbIa9T2OxxsdbDD7EVK4+v+k9cDpnLhqHpIN6modZ9z7AR3yi3T9oEm2AapxhTfCuJJI7Ztnp8Sht6eQ8kDk2I4ut1prHTFuPdRoMQUiT+aMO6WlkYTYG3Owl+3xigHurCODI34zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081803; c=relaxed/simple;
	bh=BUCh6N4uUmwtu5deOO/7W6gUjsdbRzp9up8D/qjaZMw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YJoA6St736mx5z/a0BO8wBxgjPD7MiuJNrrZuWKV4qE9stzWUDnyxnOyx3hBqbXhtFJa1Csw83xhFhEuvxyZXGI5vKVGIZ3ADCFHh/uYlCLaoTXKaI2zzovEDYNRHYZqX28sYJfxaitwZTXS9T99xVSuB5czVWP5j9+DorJzC0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2dn1SDt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2dn1SDt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE431F00893;
	Wed, 10 Jun 2026 08:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781081801;
	bh=dubolUisTBciyXCzUln5NSLxq/3dcLGoZgB4fBfhLdo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z2dn1SDtqmndJcztf6nSy6+tp7gy2QG6Rhntn4yfxom3/MAvL2QXtubFUmLGyJqdm
	 KdAjKreFBoIuYKJL4KqieH+7iddQKs2bYQVwTZ0Xq/6MQOhQt11ffizgao3aHo39VW
	 6GGH2DsjXaBj+p37DuAzKxegKj9YlQ4hCZeYUVOk+yCdBseqe1Sbg1qIuUjlYPnJHW
	 VbkHDAgA56iGrm8z5P05JYBzdEIrVw90keFOQNHcuzLsKi8qoxKa3RNq2tozFc2QZx
	 n2z1g3Zk8M8TxCDPBTMsEk0g+naUUE24iJlL6v1CV6PCB54NecWgXy0WKRtx7rfku0
	 laAsW5RfC6e3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/16] usb: hub: Associate port@ fwnode with USB port
 device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260610084053.2059858-6-wenst@chromium.org>
References: <20260610084053.2059858-6-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 08:56:41 +0000
Message-Id: <20260610085641.8FE431F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Leaked firmware node reference obtained from fwnode_graph_get_po=
rt_by_id().
--

commit d665d488ed337df469077f70e021bbabc2b8ac61
Author: Chen-Yu Tsai <wenst@chromium.org>

usb: hub: Associate port@ fwnode with USB port device

When a USB hub port is connected to a connector in a firmware node
graph, the port itself has a node in the graph. This commit associates
the port's firmware node with the USB port's device. This is used in
later changes for the M.2 slot power sequencing provider to match
against the requesting port.

> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index b1364f0c384ce..1846eb1206a4d 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -780,6 +780,8 @@ int usb_hub_create_port_device(struct usb_hub *hub, i=
nt port1)
>  	port_dev->dev.driver =3D &usb_port_driver;
>  	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
>  			port1);
> +	device_set_node(&port_dev->dev,
> +			fwnode_graph_get_port_by_id(dev_fwnode(&hdev->dev), port1));

[Severity: Medium]
Does this code leak the fwnode reference? fwnode_graph_get_port_by_id()
returns a firmware node with its reference count incremented, and the caller
is expected to drop it using fwnode_handle_put() when it is no longer
needed.

device_set_node() merely assigns the fwnode to the device without taking
ownership of the reference count. If device_register() fails:

drivers/usb/core/port.c:usb_hub_create_port_device() {
	...
	retval =3D device_register(&port_dev->dev);
	if (retval) {
		put_device(&port_dev->dev);
		return retval;
	}
	...
}

put_device() eventually calls usb_port_device_release(), which frees the
device memory but does not release the fwnode:

drivers/usb/core/port.c:usb_port_device_release() {
	struct usb_port *port_dev =3D to_usb_port(dev);

	kfree(port_dev->req);
	kfree(port_dev);
}

The reference also appears to be permanently leaked upon normal device
removal via usb_hub_remove_port_device(), since usb_port_device_release()
lacks a corresponding fwnode_handle_put(dev_fwnode(dev)) call.

>  	mutex_init(&port_dev->status_lock);
>  	retval =3D device_register(&port_dev->dev);
>  	if (retval) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610084053.2059=
858-1-wenst@chromium.org?part=3D5
