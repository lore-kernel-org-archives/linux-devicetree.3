Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541470;
	b=M79QakSltUnirAdH2oHkusLY8UOs1UD8t2zhgirGn1a8z/L3c7veZLo6prKYiCxdmuZm
	 2kHJ3LMOsEchHOnMw1DLT6uzFJgy+ntQ27E+83gPjZ4kSyrjit69oYkl7HZ8/Uf9NkZg0
	 9YDWDm2uftkIH7Lms7Vs6RVxVTRu8wxnRh9TPa9Hg//HvDJYHMsHs/WyyIVUKYTzW2O07
	 bzbNZh6093dh42wE/6bxSV4JFHd+jcSurElYc63DZrYl0Mio6blohL9Rjy1zwHa3WA0Kq
	 vDPNhBi3NlcSXSfCc6tFLAhnbTSqR7Q2Q4B0buCyTG+yJ8nYpn/LB2MCur9EdC8OpOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541470;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8UJben6v1pm6GTq2JFF5bc4TQ4cp1c7je2KxHvy8CP4=;
	b=Nbymqw57yCXE4/aXTbpr6ZGkUKwfLrIzeid7t7EA0tVlCf5EUEm6jD4hIVJtNFT/7gkZ
	 /olui+bqXJhHOALWRYfF4EmcCvVs3WzI8WgqHlv6HbvS4v/o8DK0QitY4NPQ9s4E2sL7m
	 O0u1xfLQD3Pu4LZ5oMn3hoV2Gu0sC04jYNPV4rYHW6jMgiQ50CmKOwUh7cpKHaeNbiTXa
	 grVtHBVNPPmtwiS5SYQ97zDHZcyGG9yD08UbI6zGAY9pXguvBIOLpts/HFiD+MGNzWWDP
	 MrpOV0+0XHfQnswAs7LSSGof01OoBkRWRz1eBbPROhjalWoP7l9LCf0TBub8/nuh2Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KJAcn1GX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E2C606A33B
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KJAcn1GX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2901F000EC;
	Tue, 24 Nov 2026 17:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795541469;
	bh=8UJben6v1pm6GTq2JFF5bc4TQ4cp1c7je2KxHvy8CP4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KJAcn1GXQzN5a7WZnEJvKrSqkOLuTGmnWNm9CE1bP9aOF/QeOzXkc1xqeAFxf0iQM
	 xiJ9W9iiQOv8aMkLzsnRtof8isujs3dWK+5KCcEVktu4qvjZi8ZNu3AdmqLd8uaPwm
	 ePvoRv8C75P9TZWcE06ls32LRn4oeVfTTJe4sTrJTLVVXBeNaLWIc36kTLzQdIko0n
	 2KBUucmgH1VUqkCuEVTJMhG93ADHIPVC8TOnI94XWsb9/uQHM6jPiwMNfflwep8mH4
	 Pd5BF8RffPFxct0sRGc9fq0eWe6a+nPpXCf2QYV/vxct3/bbHoWMrup8AqWIvFDk/R
	 ktpcpDknHK3Cg==
Message-ID: <sashiko-outbox-231705@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/24] media: mali-c720: Add 3A statistics video node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anthony McGivern" <anthony.mcgivern@arm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-18-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-18-0cb9bde1bd30@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:31:07 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] media: mali-c720: unlinked stats streamon leaks
  pipe.start_count on stop
--

commit acde35ee7e30f91ca98dde1602bdd7e3bb4e0204
Author: Anthony McGivern <Anthony.McGivern@arm.com>

media: mali-c720: Add 3A statistics video node

This commit adds a metadata capture video node for ISP 3A statistics and
configures the CDMA scatter-gather engine to transfer colour statistics and
pixel intensity histograms into queued buffers.

> diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-stats.c b/dri=
vers/media/platform/arm/mali-c720/mali-c720-stats.c
> new file mode 100644
> index 0000000000000..fdb31ef136c04
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-c720/mali-c720-stats.c
[ ... ]
> +static int mali_c720_stats_start_streaming(struct vb2_queue *q,
> +					   unsigned int count)
> +{
> +	struct mali_c720_stats *stats =3D vb2_get_drv_priv(q);
> +	struct mali_c720 *mali_c720 =3D stats->mali_c720;
> +	struct mali_c720_context *ctx =3D mali_c720_get_active_context(mali_c72=
0);
> +	struct v4l2_subdev *isp_sd =3D &mali_c720->isp.mdev.sd;
> +	int ret;
> +
> +	guard(mutex) (&mali_c720->device_lock);
> +
> +	if (!media_devnode_is_registered(mali_c720->media_dev.devnode)) {
> +		ret =3D -ENODEV;
> +		goto err_return_buffers;
> +	}
> +
> +	ret =3D pm_runtime_resume_and_get(mali_c720->dev);
> +	if (ret)
> +		goto err_return_buffers;
> +
> +	ret =3D video_device_pipeline_start(&stats->vdev, &mali_c720->pipe);
> +	if (ret)
> +		goto err_pm_put;
> +
> +	ret =3D mali_c720_alloc_context(ctx);
> +	if (ret)
> +		goto err_stop_pipeline;
> +
> +	ret =3D mali_c720_pipeline_ready(mali_c720);
> +	if (ret && ret !=3D -EAGAIN)
> +		goto err_free_context;
> +
> +	if (!ret) {
> +		ret =3D v4l2_subdev_enable_streams(isp_sd,
> +						 MALI_C720_ISP_PAD_SOURCE_HV,
> +						 BIT(0));
> +		if (ret)
> +			goto err_free_context;
> +	}
> +
> +	return 0;
[ ... ]
> +static void mali_c720_stats_stop_streaming(struct vb2_queue *q)
> +{
> +	struct mali_c720_stats *stats =3D vb2_get_drv_priv(q);
> +	struct mali_c720 *mali_c720 =3D stats->mali_c720;
> +	struct mali_c720_context *ctx =3D mali_c720_get_active_context(mali_c72=
0);
> +	struct mali_c720_isp *isp =3D &mali_c720->isp;
> +	struct v4l2_subdev *isp_sd =3D &isp->mdev.sd;
> +
> +	guard(mutex) (&mali_c720->device_lock);
> +
> +	v4l2_subdev_disable_streams(isp_sd, MALI_C720_ISP_PAD_SOURCE_HV,
> +				    BIT(0));
> +	mali_c720_stats_return_buffers(stats, VB2_BUF_STATE_ERROR);
> +
> +	mali_c720_free_context(ctx);
> +
> +	video_device_pipeline_stop(&stats->vdev);

[Severity: High]
Can starting and stopping streaming on the 3A stats node while its media
link is disabled leak mali_c720->pipe.start_count and stop an active
capture stream?

mali_c720_create_3a_links() creates the link to stats.vdev disabled by
default.  When a linked capture node (such as fr0-rgb) is already
streaming, mali_c720->pipe.start_count is non-zero and stats->pad.pipe is
NULL.  If userspace then calls VIDIOC_STREAMON on the unlinked stats node,
__media_pipeline_start() takes its start_count > 0 early return without
checking MEDIA_PAD_FL_MUST_CONNECT or setting stats->pad.pipe, and
mali_c720_stats_start_streaming() ignores the resulting -EAGAIN from
mali_c720_pipeline_ready().

When the stats node later stops streaming, mali_c720_stats_stop_streaming()
disables the active ISP stream for the still-running capture node and calls
video_device_pipeline_stop(&stats->vdev) with stats->pad.pipe =3D=3D NULL,
which triggers WARN_ON(!pipe) in __media_pipeline_stop() and returns
without decrementing mali_c720->pipe.start_count.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-b4-initial=
-upstream-candidate-v1-0-0cb9bde1bd30@arm.com?part=3D18
