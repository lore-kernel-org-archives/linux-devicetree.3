Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FA8F9C0
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 06:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045826; cv=none; b=g/W8RiU2spIzkE7qdiSvheXdM0cX4hAZ8DXPmcKZHQVGn/mfdjjaTBZMdBKDpi4LmXMUFnqhNno9L9ofNrBZ952RVK0Ind6fSO2sIGHpc1e5OVSrNqJWdUbFmaX2A7NS8MAPv7eyIx5RXINpN8kErEBKerCkns0RFv+EjNjhur0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045826; c=relaxed/simple;
	bh=DLA32xmIQzRz04IFPqW6ETGiuEqTcUAF8sS1+4IYIK0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d22U3pY775kCudAA1SwAKG2HgxyUop/TNDnpxOE/H8x1Fi4/yLdAEiJxmwWyahbxFpAzXa3JdeMINvpp14U5/ayIb254Hh9Dw6Ck5zZ0G4GFgLEZ2GABs9l02jAmSbiGmRy6puPRVYHG5oZcETGmDINsHyvcT9pCnTYxrZno/qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jggnqCiw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jggnqCiw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C021F000E9;
	Sun, 26 Jul 2026 06:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785045825;
	bh=qbgBxH/FARMP2IozCAl4n7DsrJXbbXhUFgv4nO7J1hY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jggnqCiw/faeTNZLVXhklAvMkrk19jRp3M4Hpx38lfAXpzCPoGGfr+EtYKitLSfgZ
	 sw7RZXfkA4j7s6obHjFVfhfriQPIapoXKQs1fhVT9YoQKJJXkSUspCKWVLh9F6Cijc
	 Be7x5RHNMJD3dOgl+LkPEVsLmLBQomPX0MoXGzjrSOZ4iB48IMqfEVMa0FJvp00cXA
	 4j9PKN4raI9hqxphUYlDQiG4I3w4kT0UWk3A0eO3FmC0TVVYrhzLDVTfdYHg4SqGSj
	 tfGvjXeeJ7oPXNN22uWrlkt6aIQT7hoAalPWf0rBCYfhqKZC0/DZ+zLoD1WPPM/e0C
	 QGLUQqw1QXJuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 11/14] media: iris: Add hooks for pixel and
 non-pixel context banks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260726-glymur-v10-11-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-11-de451559e88b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 06:03:44 +0000
Message-Id: <20260726060345.01C021F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Dangling pointer in `vb2_queue->dev` due to synchronous unregistra=
tion of context-bank platform devices.

Pre-existing issues:
- [High] Missing cancel_delayed_work_sync() for sys_error_handler in iris_r=
emove() leads to use-after-free.
--

--- Patch [11]: [PATCH v10 11/14] media: iris: Add hooks for pixel and non-=
pixel context banks ---
commit 1f1fdc377aea1a90f259a986e4bc14be351b3bc0
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Add hooks for pixel and non-pixel context banks
   =20
Iris platforms use separate context-bank devices for the pixel, non-pixel
firmware domains. Add platform hooks to create and destroy those
subdevices, providing a interface for their lifecycle management across
platforms.
   =20
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/medi=
a/platform/qcom/iris/iris_vpu3x.c
> index ec35ad4f86102..bc95be22ed96d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -397,6 +397,52 @@ static u64 iris_vpu36_get_required_freq(struct iris_=
inst *inst)
>  	return max(vcodec0_freq, vcodec1_freq);
>  }
> =20
> +static int iris_vpu3x_init_cb_devs(struct iris_core *core)
> +{
> +	struct device *dev;
> +
> +	dev =3D iris_create_cb_dev(core, "non-pixel");
> +	if (IS_ERR(dev))
> +		return PTR_ERR(dev);
> +
> +	core->np_dev =3D dev;
> +
> +	dev =3D iris_create_cb_dev(core, "pixel");
> +	if (IS_ERR(dev))
> +		goto unreg_np_dev;
> +
> +	core->p_dev =3D dev;
> +
> +	dev =3D iris_create_cb_dev(core, "video-firmware");
> +	if (IS_ERR(dev))
> +		goto unreg_p_dev;
> +
> +	core->fw_dev =3D dev;
> +
> +	return 0;
> +
> +unreg_p_dev:
> +	if (core->p_dev)
> +		platform_device_unregister(to_platform_device(core->p_dev));
> +	core->p_dev =3D NULL;
> +unreg_np_dev:
> +	if (core->np_dev)
> +		platform_device_unregister(to_platform_device(core->np_dev));
> +	core->np_dev =3D NULL;
> +
> +	return PTR_ERR(dev);
> +}
> +
> +static void iris_vpu3x_deinit_cb_devs(struct iris_core *core)
> +{
> +	if (core->fw_dev)
> +		platform_device_unregister(to_platform_device(core->fw_dev));
> +	if (core->p_dev)
> +		platform_device_unregister(to_platform_device(core->p_dev));
> +	if (core->np_dev)
> +		platform_device_unregister(to_platform_device(core->np_dev));
> +}

[Severity: High]
Does this code synchronously free the context-bank platform devices without
waiting for userspace V4L2 file descriptors to close?

If a userspace application holds a video device file descriptor open during
driver unbind, this function will unregister and free the context-bank
platform devices.

However, in iris_m2m_queue_init(), the context-bank devices are assigned to
vb2_queue->dev:

drivers/media/platform/qcom/iris/iris_vidc.c:iris_m2m_queue_init() {
    ...
	src_vq->dev =3D iris_get_cb_dev(inst, BUF_INPUT);
    ...
	dst_vq->dev =3D iris_get_cb_dev(inst, BUF_OUTPUT);
    ...
}

Because the V4L2 core does not hold a reference to q->dev during videobuf2
queue initialization, won't this result in a use-after-free when userspace
finally closes the file descriptor and v4l2_m2m_ctx_release() triggers
vb2_queue_release() to unmap DMA buffers?

[Severity: High]
This is a pre-existing issue, but does iris_remove() fail to cancel the
sys_error_handler delayed work before returning?

drivers/media/platform/qcom/iris/iris_probe.c:iris_remove() {
    ...
	iris_core_deinit(core);

	video_unregister_device(core->vdev_dec);
	video_unregister_device(core->vdev_enc);

	v4l2_device_unregister(&core->v4l2_dev);

	iris_deinit_cb_devs(core);

	mutex_destroy(&core->lock);
}

If a system fatal error triggers an interrupt just before or during module
removal, the sys_error_handler delayed work could be scheduled.

Since iris_remove() doesn't explicitly cancel this work before returning,
could the handler execute after the devm_kzalloc-managed core structure is
freed?

drivers/media/platform/qcom/iris/iris_probe.c:iris_sys_error_handler() {
	struct iris_core *core =3D
			container_of(work, struct iris_core, sys_error_handler.work);

	iris_core_deinit(core);
	iris_core_init(core);
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-glymur-v10=
-0-de451559e88b@oss.qualcomm.com?part=3D11
