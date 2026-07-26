Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A0F2BDC1C
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 06:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045684; cv=none; b=lP+ZCx/ogxwsLSHFTzIk/6t8YYlhhxWjoBu5zVOyu02JCzgVvxQRT6Hn2YipeUuFuyOHI676XApxuiPOs+HcrqN3umnOh92AHNSRDc6kfIupYLyGZ3ykZchP0PcvXzlM3lmT3e8f4ZrVfB3MwTBv2Oh9092ciYBzIr1xZkTCemY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045684; c=relaxed/simple;
	bh=3Xw0EA857kqZbq6XSyHm0eDpU9KGbB5ZZf3kxlasyYA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aILL7ivo/hEmWbk9q7DY2Y5PAZwcblumAgpQO2hqqvnYr5ljRzVlHSUwozXftsydmWqZxaFI1LFwYLwl+blWVxj5kPSmRhiZbRoDQd+Zb3Kv4EnP5sgclAFKf62GzuOcc6+7T8mFZ9fI9ysptCpDhDN+GtcvQBldIiMq5hSuR4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxIJZN7D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxIJZN7D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706271F000E9;
	Sun, 26 Jul 2026 06:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785045682;
	bh=r+BkEnApjezC4qtP0NZorUH0thc+H2H5lNj3lIZcCU0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VxIJZN7DEued8o+XBdi5T4elLMjuIVQ/VNGp52IRx+B4D7LlPoU+LvgJTY5tvUtko
	 9pW3pFb5JyoDZojTO41dA/m8U4S59/tnO9O5RBmhuGgv+tfmRS9Xjq85uPieoPipVk
	 gCZn5UwQsVOX9B1evl6oYIS+gymCZ+T37mQMpt4jcceZdnNKGepwtHWRzEyuBFI8Ce
	 MctNniJhmPRG/lX1srPrQ3zW9QDxFRm4L7UD4CJWL9UhWxcR6+Gsz3vVS9ddHPdJ2Q
	 /HrD1nfvtkp28jacUpX7/WZhlitB8T+qwzeqzDqSyf26xTf6AUJrHISeOBOx4NdVSZ
	 /ndgr/OevIrFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 02/14] media: iris: Add hooks to initialize and tear
 down context banks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260726-glymur-v10-2-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-2-de451559e88b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 06:01:22 +0000
Message-Id: <20260726060122.706271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The delayed work `sys_error_handler` is not canceled during device=
 unbind or probe failure, leading to a potential use-after-free.
- [High] The `core` structure is freed via devres on unbind before all V4L2=
 file handles are closed, causing a use-after-free on open file descriptors.
- [High] video_register_device() is called before video_set_drvdata(), crea=
ting a race window where userspace can trigger a NULL pointer dereference.
--

--- Patch [2]: [PATCH v10 02/14] media: iris: Add hooks to initialize and t=
ear down context banks ---
commit f6349f3a455a3158cecfabf25954add23f0a63fb
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Add hooks to initialize and tear down context banks

Add platform hooks to set up and tear down context bank devices.
Different iris platforms may require different context bank setup, so
let platform data provide the required operations via vpu_ops.

> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/medi=
a/platform/qcom/iris/iris_probe.c
> index c2dcb50a27824..2594f5a67378a 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
[ ... ]
> @@ -150,6 +151,20 @@ static int iris_init_resources(struct iris_core *cor=
e)
>  	return iris_init_resets(core);
>  }
> =20
> +static int iris_init_cb_devs(struct iris_core *core)
> +{
> +	if (core->iris_platform_data->vpu_ops->init_cb_devs)
> +		return core->iris_platform_data->vpu_ops->init_cb_devs(core);
> +
> +	return 0;
> +}
> +
> +static void iris_deinit_cb_devs(struct iris_core *core)
> +{
> +	if (core->iris_platform_data->vpu_ops->deinit_cb_devs)
> +		core->iris_platform_data->vpu_ops->deinit_cb_devs(core);
> +}
> +
>  static int iris_register_video_device(struct iris_core *core, enum domai=
n_type type)
>  {
>  	struct video_device *vdev;

[Severity: High]
This isn't a bug introduced by this patch, but looking at
iris_register_video_device(), video_register_device() is called before
video_set_drvdata():

drivers/media/platform/qcom/iris/iris_probe.c:iris_register_video_device() {
    ...
	ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
	if (ret)
		goto err_vdev_release;

	video_set_drvdata(vdev, core);
    ...
}

Does this create a race window where userspace can open the video node befo=
re
drvdata is set?

If so, iris_open() could retrieve a NULL core pointer via video_drvdata() a=
nd
dereference it during pm_runtime_resume_and_get().

[ ... ]
> @@ -207,6 +222,8 @@ static void iris_remove(struct platform_device *pdev)
> =20
>  	v4l2_device_unregister(&core->v4l2_dev);

[Severity: High]
This is a pre-existing issue, but could removing the device without waiting=
 for
all file handles to be closed lead to a use-after-free?

Because core is allocated with devm_kzalloc(), it will be freed automatical=
ly
by devres when iris_remove() finishes.

If a userspace application keeps the video node open, wouldn't a subsequent
file close call into iris_close() and access the already freed inst->core?

> =20
> +	iris_deinit_cb_devs(core);
> +
>  	mutex_destroy(&core->lock);
>  }

[Severity: High]
This is also a pre-existing issue, but shouldn't iris_remove() cancel the
sys_error_handler delayed work?

If the delayed work is scheduled and iris_remove() completes, core will be
freed by devres. When the workqueue later executes iris_sys_error_handler(),
it will access the freed core memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-glymur-v10=
-0-de451559e88b@oss.qualcomm.com?part=3D2
