Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9778D411A12
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 12:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252243; cv=none; b=qCs55tWYkLucdiykaGA+4DTWlUs1LuPlt692aVLPv66ntpznWCPBrDUD5D78Lz2+7LpfDwKsnHDfDHoLdx2fBc0z5Jf4Z1byAWIaR2B0XGcyr3m8EqYuWtVBWYauv1/e5dTBT3fxWw5Z08gbezS+b0S0tz23QTAFX6M5LPcFrrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252243; c=relaxed/simple;
	bh=B1lhPs9OBTu8xYmMUHlTUcT8WCEp+zHAWwOXixLdTsA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G/DglRVbuLMG+A8XoL9jMmorGsZ4b8aQdCnAAb+gSopv145MGo07S27dT+yyJTFvu5pFE1F3QS3HHQLhFw0cvuYMIyzDXGhUXshdb8EVlVw6GY3jhIoFXiVvkAdZCyyhqZK6MuIvP52+kTMdUOAjRdbL5dQ2F/3gjfoguFFguhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNDs5jsU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNDs5jsU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C961F000FF;
	Thu, 24 Sep 2026 12:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790252242;
	bh=15FuZd1V18SeM7wK+V+Rk5lx7CZYYaSk5H7h5wj9Qvg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VNDs5jsU05pO/n14Oj4dr8TL8Y90vgvjw5kQ1CmcjX3wnYVtJn+w7V+hEKowOfXdH
	 D45ZehPGtAKOHVaGkrxuRlJ/MJ8OYwYVoAhvas8f8fMjzmg13xMsFk+D/kZ2drHM6p
	 6Zv7JaTAa5XmoyhdShjNBAU9gzSiAMnkGshTAYn2qorfw3jNcK1CRbZoBL/kQs9ako
	 qu8e8F1ZwBQO36R+pNHhZTgZBubqFmnfKR2vfNXjxVrLbQULJ/me1fKTIWqgVNA7v8
	 2pbq8uRjS9N+OKTvbuSQ1o9rddCQLZOE1g7C1Lw3FxS/SyBEcxMswzQoXjbThfyL+6
	 DkoMsywlL9JAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/9] media: synopsys: hdmirx: add media device
 infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260924-hdmirx-media-v2-1-c12f641d8b0f@pengutronix.de>
References: <20260924-hdmirx-media-v2-0-c12f641d8b0f@pengutronix.de>
 <20260924-hdmirx-media-v2-1-c12f641d8b0f@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 12:17:21 +0000
Message-Id: <20260924121721.E5C961F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: synopsys: hdmirx: UAF on video device close after unbind
--

commit 19fb95033898b3ee8ada95f78f4121a10de2c8c5
Author: Gerald Loacker <gerald.loacker@wolfvision.net>

media: synopsys: hdmirx: add media device infrastructure
   =20
Initialize the media device to enable integration with HDMI bridge
devices in the video capture pipeline. This provides the foundation
for representing the hardware topology through the media controller
framework.

> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drive=
rs/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 25f8ca0d6d946..f51a1619b71ec 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
[ ... ]
> @@ -2771,6 +2778,7 @@ static int hdmirx_probe(struct platform_device *pde=
v)
>  	vb2_video_unregister_device(&hdmirx_dev->stream.vdev);
>  err_unreg_v4l2_dev:
>  	v4l2_device_unregister(&hdmirx_dev->v4l2_dev);
> +	media_device_cleanup(&hdmirx_dev->mdev);

[Severity: High]
Could this destructively clean up the media device while entities might sti=
ll
be actively referencing it asynchronously due to open file descriptors?

In the error path of hdmirx_probe(), media_device_cleanup() is called which
destroys mdev->graph_mutex. Then devres automatically frees the
snps_hdmirx_dev structure containing both the video_device and media_device.

If a local user opens /dev/videoX before the probe failure and keeps the
file descriptor open, closing the file descriptor later will cause the V4L2
core to invoke v4l2_device_release().

This accesses the freed vdev structure and attempts to unregister the media
entity, locking the already destroyed and freed mdev->graph_mutex.

>  err_hdl:
>  	v4l2_ctrl_handler_free(&hdmirx_dev->hdl);
>  err_pm:
[ ... ]
> @@ -2794,6 +2802,7 @@ static void hdmirx_remove(struct platform_device *p=
dev)
>  	vb2_video_unregister_device(&hdmirx_dev->stream.vdev);
>  	v4l2_ctrl_handler_free(&hdmirx_dev->hdl);
>  	v4l2_device_unregister(&hdmirx_dev->v4l2_dev);
> +	media_device_cleanup(&hdmirx_dev->mdev);

[Severity: High]
Does this code trigger a similar race condition when the driver is unbound?

If a local user opens /dev/videoX and keeps the file descriptor open while
the driver is unbound (e.g., via sysfs or hardware removal), hdmirx_remove()
completes and calls media_device_cleanup() which destroys mdev->graph_mutex.

Like in the probe error path, devres will automatically free the
snps_hdmirx_dev structure. Later, when the user closes the file descriptor,
the V4L2 core invokes v4l2_device_release() which will attempt to use the
freed structures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-hdmirx-med=
ia-v2-0-c12f641d8b0f@pengutronix.de?part=3D1
