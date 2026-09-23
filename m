Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C881448D11
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171891; cv=none; b=T/1EgPgdK+0xVxDjmOxp65yXzIGvM/2m4lQ+Ek7MCt/33Js0sib1+0GUjpKs2DXPALsh9+0K9bjHeU4t+TcYtFxI5ofmUw5OpZYD/nzaq7ZfH9/iB1YjMjVf12/Oo7FnGu6Q5YQ3/D8K0ywJIUjUi0ffupBYE+K0YpnM9DnWOLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171891; c=relaxed/simple;
	bh=XEvTOvF4wYnne3wZOh54NpvuvEkTXYQVGec++WrfQ10=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=srdmCGaogzuPzF7YD8/G2oD8+pHWHIHVsGrlZXNw88TWBah29CZ19vH5qot8mBQqQjiF3za0KBugZR7T0zRLPp9Z9meSfTCHzFtbYtKHZc+vL48a/KdEqke12SOIa1G/5rM5083cEolvAnCzZpqh9glkiMvd5nfNKQF/Qjpx/HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUXW9XQf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUXW9XQf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622691F000FF;
	Wed, 23 Sep 2026 13:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790171889;
	bh=O6ZsJDpUnuE+w290ksk4w85uH7lQOcqsPBwwINm+eBQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OUXW9XQfGQm1AUXpnTpnHeuSSssCWtQ6zOWjd/zr5Nkc3o+QExZ0D8q5Pfr8NWe2f
	 OuorPlfj2isTQ1/oEluvXIYM5gqPcskuGwKZw+g4G01RuANqSFhKe93YuSWKgQO0lx
	 S/KKS7haf7ZnLZBsWEXe3TY1u/KUAKdWlchWFXOW+CII+lF0ogVQWv0+GBoWDicIa+
	 2s6NQL0tnpBnug+tyGAW+MQcEhYK5AvNCAd/57Iv3NijhEfuqW4whCjJkho/RZCoL+
	 kC7feUc9rJlVBsjIuwj3FTGpR4t4Y0F84jjvpH6iizyZTdjB7wjR9HyXcu7mZaYspV
	 p/LwPzWUmZ0aQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/9] media: synopsys: hdmirx: add async subdevice
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923-hdmirx-media-v1-4-ea3d77d4a5f3@pengutronix.de>
References: <20260923-hdmirx-media-v1-0-ea3d77d4a5f3@pengutronix.de>
 <20260923-hdmirx-media-v1-4-ea3d77d4a5f3@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 13:58:08 +0000
Message-Id: <20260923135809.622691F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: missing graph_mutex lock in hdmirx_fwnode_bound() leading t=
o list corruption
--

commit ac73c2eba89ee9517b8e00beeec227f11b4a4eae
Author: Gerald Loacker <gerald.loacker@wolfvision.net>

media: synopsys: hdmirx: add async subdevice support
   =20
Add V4L2 async notifier support to enable dynamic binding of connected
subdevices in the video pipeline. The driver parses device-tree endpoints
to discover and register video bridge subdevices.

> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drive=
rs/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 11a9b16586a57..0c7cac25bf694 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c

[ ... ]

> @@ -2649,6 +2653,48 @@ static int hdmirx_register_cec(struct snps_hdmirx_=
dev *hdmirx_dev,
>  	return 0;
>  }
> =20
> +static int hdmirx_fwnode_bound(struct v4l2_async_notifier *notifier,
> +			       struct v4l2_subdev *subdev,
> +			       struct v4l2_async_connection *asc)
> +{
> +	struct snps_hdmirx_dev *hdmirx_dev =3D
> +		container_of(notifier, struct snps_hdmirx_dev, notifier);
> +	int source_pad;
> +	int ret;
> +
> +	source_pad =3D media_entity_get_fwnode_pad(&subdev->entity,
> +						 asc->match.fwnode,
> +						 MEDIA_PAD_FL_SOURCE);
> +	if (source_pad < 0) {
> +		dev_err(hdmirx_dev->dev, "%s has no source pad for %pfw: %d\n",
> +			subdev->name, asc->match.fwnode, source_pad);
> +		return source_pad;
> +	}
> +
> +	ret =3D media_create_pad_link(&subdev->entity, source_pad,
> +				    &hdmirx_dev->stream.vdev.entity, 0,
> +				    MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);

[Severity: High]
Is it safe to call media_create_pad_link() here without holding the
mdev->graph_mutex?

This function modifies shared media graph lists (such as mdev->links).

Since the media device has already been registered in hdmirx_probe(),
concurrent access from userspace is possible. A userspace process calling t=
he
MEDIA_IOC_G_TOPOLOGY ioctl could be traversing the topology lists while this
call modifies them, potentially leading to list corruption.

Should this call be wrapped in mutex_lock(&hdmirx_dev->mdev.graph_mutex)?

> +	if (ret) {
> +		dev_err(hdmirx_dev->dev, "Failed to create media link: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}

[ ... ]

> @@ -2772,9 +2820,38 @@ static int hdmirx_probe(struct platform_device *pd=
ev)
>  		goto err_unreg_video_dev;
>  	}
> =20
> +	ep_node =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);

[Severity: High]
Does registering the async notifier after calling media_device_register()
expose a race condition?

The media_device_register() call (which happens just before this block in
hdmirx_probe()) exposes the topology traversal interface (MEDIA_IOC_G_TOPOL=
OGY)
to userspace prematurely.

This opens a race window where asynchronous bindings handled by the notifier
can conflict with userspace topology traversal.

Would it be better to call media_device_register() after registering the as=
ync
notifier?

> +	if (ep_node) {
> +		v4l2_async_nf_init(&hdmirx_dev->notifier, &hdmirx_dev->v4l2_dev);
> +		hdmirx_dev->notifier.ops =3D &hdmirx_async_ops;
> +
> +		asc =3D v4l2_async_nf_add_fwnode_remote(&hdmirx_dev->notifier,
> +						      of_fwnode_handle(ep_node),
> +						      struct v4l2_async_connection);
> +		of_node_put(ep_node);
> +
> +		if (IS_ERR(asc)) {
> +			ret =3D PTR_ERR(asc);
> +			dev_err_probe(dev, ret, "Failed to add remote fwnode\n");
> +			goto err_unreg_media;
> +		}
> +
> +		ret =3D v4l2_async_nf_register(&hdmirx_dev->notifier);
> +		if (ret) {
> +			dev_err_probe(dev, ret, "Failed to register async notifier\n");
> +			goto err_cleanup_notifier;
> +		}
> +	} else {
> +		ret =3D v4l2_device_register_subdev_nodes(&hdmirx_dev->v4l2_dev);
> +		if (ret) {
> +			dev_err_probe(dev, ret, "Failed to register subdev nodes\n");
> +			goto err_unreg_media;
> +		}
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-hdmirx-med=
ia-v1-0-ea3d77d4a5f3@pengutronix.de?part=3D4
