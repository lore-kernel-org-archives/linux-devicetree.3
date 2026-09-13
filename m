Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB703EB80D
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 19:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326375; cv=none; b=KEmY4C9EcdOeg8IJNnvR/H1lanlUrKz5/LM6ICigJ74Bvup3L4JpMd7piLffFs3A7rnFnK8nrMhuPtMpyDflNuDeIaRvlkMNP4Y71lp1cgsCLRKOYeKHpBB3K/IX6BOPl4VhQ+CLdZB1qmtNhXSa7Fas5w5ZLQzOuQ4vFtM3Q8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326375; c=relaxed/simple;
	bh=5ZtNBIL5Oz5l6KwxgNiCivaiN+2ncftCI67Ykvr+Zp4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pFfwvqtKrk+ciOmbDygKnjbVdSTqfcMbtCXKhRy2H7Izu7FXVhfHfpBnJ+pCsQtlAwfmWjWK+ukGx3ASBHzWzO2/duQZ2EAT606uUgTruDW09sGi6e39CUX06RBsZG7V65jRHLtTTa//WmDqnBLAcQhZYxZKm5DvAUsjuvYrRvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gFUjSS0s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gFUjSS0s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40E41F000FF;
	Sun, 13 Sep 2026 19:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789326374;
	bh=wmpGOXueapyPAUjDOvE9RvkWavKtnR39qIO/vsqo3Zs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gFUjSS0sIMSEGI72m6KDnGQA8wq+K/SMDq7TWeB8k9+0z+hZEWbb7pwr0A6qsTxGu
	 NuEsKDEZ6KeOOFkMlC1MN7fUT/VJcuGlTy2nrXkuvwk8Vc00aZJfT3tugEXNmz7Yfc
	 WBt/MrT27b88jsUQmyntmAQ2mUwL2ewjF1YMlA9D9OZg7aw4ebfColw2m7DvqzqyzR
	 nRF3OUmLog7TTQMQcTlNMsRTcJHNwolEK3zhPEB9hIxlAGYyvKIjpEtf1o7Ah4krCG
	 yoVdMnr+iCDbY1tfnw9DarjoeLERGV98dUpaGnWCFMbr9jcvK/JStMzUhD7LlhADC+
	 ji5cI+cHAZfSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/13] media: iris: Add non-pixel and pixel context
 bank devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-5-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
 <20260914-vpu_iommu_iova_handling-v4-5-9b9074a73c41@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 19:06:13 +0000
Message-Id: <20260913190613.C40E41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free of `iris_core` structure due to devres and asynchro=
nous V4L2 file closures.
- [High] Race condition in probe exposes video device before initialization=
, causing NULL dereference.
- [High] `iris_remove()` destroys `core->lock` without acquiring it, leadin=
g to a race condition with concurrent file closure.
--

commit 06944aa24efc3154b815139f80472c743bbbd5e1
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Add non-pixel and pixel context bank devices

This commit adds helper functions to create and clean up "non-pixel" and
"pixel" context bank devices from device tree subnodes. It sets up the cont=
ext
banks prior to video device registration to ensure proper DMA addressable
range routing, preventing SMMU page faults and spontaneous reboots.

> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/medi=
a/platform/qcom/iris/iris_probe.c
> index e4acf4a74f944..debd1f0e57038 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
[ ... ]
> @@ -207,6 +268,8 @@ static void iris_remove(struct platform_device *pdev)
> =20
>  	v4l2_device_unregister(&core->v4l2_dev);
> =20
> +	iris_deinit_cb_devs(core);
> +

[Severity: High]
This is a pre-existing issue, but does iris_remove() allow a use-after-free
of core if a userspace process keeps the device node open?

The core structure is allocated with devm_kzalloc() in iris_probe(),
meaning it is freed automatically when the driver unbinds. However,
iris_remove() runs to completion and does not block for active file
descriptors to close.

If userspace holds the file descriptor open during an unbind event and later
closes it, iris_close() is invoked, which dereferences the freed memory:

drivers/media/platform/qcom/iris/iris_vidc.c:iris_close() {
    ...
    iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT=
_MPLANE);
    ...
}

>  	mutex_destroy(&core->lock);

[Severity: High]
This isn't a bug introduced by this patch, but is it safe to destroy
core->lock here unconditionally?

If iris_remove() executes concurrently with a file closure, iris_close()
can acquire this lock via iris_remove_session():

drivers/media/platform/qcom/iris/iris_vidc.c:iris_remove_session() {
    mutex_lock(&core->lock);
    list_for_each_entry_safe(iter, temp, &core->instances, list) {
    ...
    mutex_unlock(&core->lock);
}

Destroying the mutex while it might be held by another thread violates lock=
ing
rules and can lead to corruption when the racing thread releases the lock.

>  }
> =20
[ ... ]
> @@ -269,10 +332,14 @@ static int iris_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D v4l2_device_register(dev, &core->v4l2_dev);
> +	ret =3D iris_init_cb_devs(core);
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D v4l2_device_register(dev, &core->v4l2_dev);
> +	if (ret)
> +		goto err_cb_deinit;
> +
>  	ret =3D iris_register_video_device(core, DECODER);

[Severity: High]
This is a pre-existing issue, but is there a race condition here that expos=
es
the video device to userspace before initialization is complete?

iris_register_video_device() calls video_register_device(), making the
/dev/videoX node visible, and then sets video_set_drvdata(). If userspace
races to open the device node in between, video_drvdata() could return NULL.

Additionally, PM runtime enablement in iris_probe() happens after the device
is registered:

drivers/media/platform/qcom/iris/iris_probe.c:iris_probe() {
    ...
    pm_runtime_use_autosuspend(core->dev);
    ret =3D devm_pm_runtime_enable(core->dev);
    ...
}

If iris_open() is called by userspace before this completes, it attempts to
dereference core->dev (which could be NULL if video_set_drvdata() hasn't
executed yet), leading to a kernel panic:

drivers/media/platform/qcom/iris/iris_vidc.c:iris_open() {
    struct iris_core *core =3D video_drvdata(filp);
    ...
    ret =3D pm_runtime_resume_and_get(core->dev);
    ...
}

>  	if (ret)
>  		goto err_v4l2_unreg;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-vpu_iommu_=
iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com?part=3D5
