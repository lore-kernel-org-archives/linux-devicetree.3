Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83171DA62E
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 15:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966968; cv=none; b=sP+FXw4gaJT1BrtkC3/4Do5jZrP8h8ywZM+0GQxkP5+GqeAwVi3jL9Y2g4u7oVHSKHlI1ph9Zmsy8uvARI114/GevSgqRKKyeygPfVs/CuDjY9CP+wc0PqZqA+udyNLXUdWrXHZfzwAhaVCuDL3nXPtn/34TICY1d1mChUxcUMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966968; c=relaxed/simple;
	bh=Mj39BtijOzScpcPxB05rLu6ja4cHo/p7aMutpCNPrmw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KndMQRf0FAyJRmiU6pgGvstNs4hofLspohRhhcB2vISmoGoR6x0qVQMqRu0TDT3ilspomNwmjHkwjvOeD021tSMfHsTeArNTy7RJ3qN5zCDwL6aOMgxfpY9l5RUjCsXCbAQvMWN77hstImlVp0GQzbg2HNux8oOSnns1b1hlBnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMuuUS4x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMuuUS4x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06DF1F00A3A;
	Wed,  9 Sep 2026 15:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788966967;
	bh=63afFCmAYc2tH1BPrtZvWSgnCvPBDeQzXJHShKqwqGg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oMuuUS4xrd6OSsviAmobESKfiFU61fbcxFmodBrgwHC6VPmrZtUJmdV6Ruj7E9Qds
	 Lng6u3lc779LA8Jw763zfyLcDmRUCiFm5C2Rhy+qKtCuadohFdfr2tTkyhB/8E7i3S
	 xNiM4VXTyYOq1svjkacT0Q2ldbyMCw85A4KECa587UNKueZCjvlYo0XPx8yHTXX3Dx
	 lsZPSi10uhLScVtHbmFnwUUGZID/uRvkjCiTtA5CGmKTg0+bHBm/zqzvxKcghGvCr9
	 F93dE4o7Esa0yM8/aQh+pR69orRDXDcqRRNZmQTFSXsIqD5w8Zh9xgNCVqW0M0Qmz3
	 TeZ5NMdg5b7Ew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/13] media: iris: Add non-pixel and pixel context
 bank devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260909-vpu_iommu_iova_handling-v3-5-2fe43ae45495@oss.qualcomm.com>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
 <20260909-vpu_iommu_iova_handling-v3-5-2fe43ae45495@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 15:16:06 +0000
Message-Id: <20260909151606.E06DF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free of devres-allocated `core` memory on driver unbind =
via lingering file descriptors.
- [High] Missing `cancel_delayed_work_sync` in driver teardown allows `sys_=
error_handler` to execute asynchronously on freed memory.
--

commit 5f2788e633116dd856570ea29baabf6ce4157fbe
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Add non-pixel and pixel context bank devices

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. This patch describes
"non-pixel" and "pixel" as separate context bank subnodes. Helper
functions are added to create and clean up these devices during probe
and remove.

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
>  	mutex_destroy(&core->lock);

[Severity: High]
This isn't a bug introduced by this patch, but doesn't this leave the
driver vulnerable to a use-after-free if a userspace process has the
video device open during driver unbind?

The core context is allocated with devm_kzalloc() in iris_probe(),
so it will be freed automatically upon return from iris_remove().

However, this function does not wait for active V4L2 file descriptors
to close. If a lingering file descriptor is closed later, iris_close()
will invoke iris_remove_session(), which accesses the freed core
memory and attempts to lock the destroyed mutex:

iris_vidc.c:iris_remove_session() {
    ...
    mutex_lock(&core->lock);
    ...
}

[Severity: High]
This is a pre-existing issue, but is there a missing
cancel_delayed_work_sync() for core->sys_error_handler during teardown?

In iris_probe(), the delayed work is initialized:

    INIT_DELAYED_WORK(&core->sys_error_handler, iris_sys_error_handler);

If a hardware SYS_ERROR interrupt fires near the time of unbind, the
delayed work could be scheduled. Since iris_remove() completes without
cancelling it, the core memory is freed by devres.

The work queue could subsequently execute iris_sys_error_handler()
asynchronously on the freed pointer, attempting to access core->dev
and call iris_core_deinit(core).

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-vpu_iommu_=
iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com?part=3D5
