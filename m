Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD67549F105
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 14:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172350; cv=none; b=HdUQtew1QKWxg62fkNXk3EFGf4eaTmQOb4B7f9QiUlrvoJhb0t5GfYtbvoqPOU3TVvjnKFka0zXu3q0AayM2zfVj0st1k2tjvhxzvk6v4Hzc669+aERFuAwP1u8Nn8Ac7XIMs7mzjaGPQ8Co2Cx8wrZzPh0BdGc5w33Pc8j9JzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172350; c=relaxed/simple;
	bh=CLd9C8v2wsqAkVdBWYmxYxN+MtHepNE2QcYr5ENnODw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JDZTYbgZIU+ghr1AjG7/jKeoHRq7m9il4kyGyT4OUQQUzYJCv2ZdISatTq4Vf1Hocl1mSo9KsGGoi6m++EXn3cDxRb7URHYNiPd0bscPfiAkKA28zomQyH58UIFQXl5FD7j0Nr69vVvJtn/ahIBIe9m58a4iswchMuU0tIk0Rss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqHBXG2k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqHBXG2k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44771F000FF;
	Wed, 23 Sep 2026 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790172345;
	bh=jbr9HP9tuVAMuuALkLPVr1CNe4DeVeIIlPu6DMAnHqM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DqHBXG2kc1Qco6Iu/0TDxbcuw50+uXdLToFMM5UMQqkpBlUv6GiAlR6DMhJwNKp++
	 CfeG0mTYJruG3BnpVvo4BgcPfrW5/yMxpt51V1bxQbm3sfnnk4NfOF7NmqAJxjWdpm
	 3/OiVz+67AUceNoHCTp4KV/ASO+c07B9TYIJ4KgfZX6wo4T0svHfQ/ODTcFY/N0AAH
	 uSItFNTrV09B3XGcTF7WIBUJiCRR4NR9JezeCQWvuqRfHyihtHJlrMGqyCX355iTV4
	 l0TfRBMtKoT22tRIcrY4D8RhV5eK39t9xwuUa6d9N/GTSj57HcaO5Kg2M2h+wEGdJa
	 FWzGjqPKzfpxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 9/9] media: synopsys: hdmirx: get the 5V state from the
 upstream subdev
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923-hdmirx-media-v1-9-ea3d77d4a5f3@pengutronix.de>
References: <20260923-hdmirx-media-v1-0-ea3d77d4a5f3@pengutronix.de>
 <20260923-hdmirx-media-v1-9-ea3d77d4a5f3@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 14:05:44 +0000
Message-Id: <20260923140544.B44771F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: synopsys: hdmirx: UAF/Null dereference in hdmirx_notify() d=
uring teardown
--

commit c68bf2a72fd61990cd4b4472b5560e917e6f7cb9
Author: Gerald Loacker <gerald.loacker@wolfvision.net>

media: synopsys: hdmirx: get the 5V state from the upstream subdev

On a board whose HDMI connector belongs to a device in front of this
receiver, the connector's +5V line goes to that device and hpd-gpios is
absent. tx_5v_power_present() then reads a NULL descriptor, which
gpiod_get_value_cansleep() reports as zero, so the receiver never sees a
source and hdmirx_plugin() never runs.

> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drive=
rs/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 23b4dd853be57..43d7857b4458b 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
[ ... ]
> @@ -2673,6 +2736,18 @@ static int hdmirx_register_cec(struct snps_hdmirx_=
dev *hdmirx_dev,
>  	return 0;
>  }
> =20
> +static void hdmirx_notify(struct v4l2_subdev *sd, unsigned int notificat=
ion,
> +			  void *arg)
> +{
> +	struct snps_hdmirx_dev *hdmirx_dev =3D
> +		container_of(sd->v4l2_dev, struct snps_hdmirx_dev, v4l2_dev);
> +
> +	if (notification !=3D V4L2_DEVICE_NOTIFY_RX_POWER_PRESENT || !arg)
> +		return;
> +
> +	hdmirx_5v_source_edge(hdmirx_dev, !!*(unsigned int *)arg);
> +}
> +

[Severity: High]
Does this code introduce a potential NULL pointer dereference or use-after-=
free
regression during teardown?

During driver unbind, hdmirx_remove() calls v4l2_async_nf_unregister(), whi=
ch
can set sd->v4l2_dev to NULL. Since the subdevice's IRQ remains active, it
could concurrently send a notification via v4l2_subdev_notify(). If
hdmirx_notify() is called during this time, sd->v4l2_dev may be NULL, causi=
ng
a bogus pointer dereference via container_of() and subsequently in
hdmirx_5v_source_edge().

[ ... ]
> @@ -2926,6 +3038,9 @@ static void hdmirx_remove(struct platform_device *p=
dev)
>  	v4l2_async_nf_unregister(&hdmirx_dev->notifier);
>  	v4l2_async_nf_cleanup(&hdmirx_dev->notifier);
> =20
> +	/* The unbind above arms the hotplug work again. */
> +	cancel_delayed_work_sync(&hdmirx_dev->delayed_work_hotplug);

[Severity: High]
Can asynchronous subdevice notifications re-arm the hotplug work after this
cancel_delayed_work_sync() call?

If a subdevice notification fires after this line, hdmirx_notify() could qu=
eue
delayed_work_hotplug on a freed hdmirx_dev, leading to a use-after-free
regression.

> +
>  	media_device_unregister(&hdmirx_dev->mdev);
> =20
>  	vb2_video_unregister_device(&hdmirx_dev->stream.vdev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-hdmirx-med=
ia-v1-0-ea3d77d4a5f3@pengutronix.de?part=3D9
