Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB306399363
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555248; cv=none; b=n4fydzAqnipgFa9Cjraw7Lyk0n74o2iha87fR1UwI65h7SjNhOB67WyPFI6rJMwuZFXh3UfB2fWBnSMAc9LDW/Y4VnkfPk44kwCF/zesGYFwAkzM2uYoXsU6+72BQEQ6luFaXAgiJeHLt0WII32My5zWjlAHVqXqlnwyL4BobTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555248; c=relaxed/simple;
	bh=HDHMlAn1oxdi7lBSCjikvMuTHOjhRgv9S65TuD2g+s4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gwnez8k9nkJcD0nOL2Boom2w0yxEmNYEzkCBAcwuwVuASFmuJs7sMvYUYHMFfuHe65NH+suNhXbP+DJSqJ1WDboRoD7K1Gyf9NWlcBr1/FnjrdpXCYXBDhyJpBDiNoXoOWlFZP4KGgG3Md9mon56N3O53UPDmqMUkWPhlddU9Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l4qFw6dQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l4qFw6dQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 716831F000E9;
	Mon, 20 Jul 2026 13:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784555246;
	bh=CrWKTZ/UUtwYRDcSQV1jNy7m/By7TOjQkc5nx+e00yA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l4qFw6dQz/7YAvd83tbryF+NMwt7tbt0DpvM6WHapOC3E5vGgukyNU8UpUq+iE//X
	 l3K7HKRAQ/QI9kJ8RCt/wYMY9i5aFEnRGMn0YcADzTM3rfq1NMqyIe2vdMfZFN0GVl
	 jlTyP+Oj5doz4KOJaDaxbylM5YIvY7RGUQebPiy3U+InMT0Y2xCYO+Y731DBvxko6O
	 zIxbbb9HsS1ouxMhfglMVLYZRnzMedOiejGAk6RapTMnn9XHSqVPE7D5UnLBEZXkqa
	 VK0fCeFgxLVCZo0ByY53OEKCFywN1J+LSwMfUsaQYJSXFy0w+QpR0G9XINMnnV4RqW
	 Zkrp8ezMgGkRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 01/12] media: mediatek: jpeg: fix jpeg cores'
 amounts setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720133432.1042046-2-kyrie.wu@mediatek.com>
References: <20260720133432.1042046-1-kyrie.wu@mediatek.com>
 <20260720133432.1042046-2-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 13:47:26 +0000
Message-Id: <20260720134726.716831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:

New issues:
- [High] Stack buffer overflow due to unbound loop over `max_hw_count` into=
 fixed-size stack arrays.
- [High] Overwriting `hw_rdy` to 0 after child hardware probes guarantees a=
 permanent deadlock of the workqueues.
- [Medium] Missing `wake_up` on `hw_wq` in component probe functions causes=
 worker threads to sleep indefinitely.

Pre-existing issues:
- [High] Null pointer dereference in hardware selection if a child device p=
robe is deferred.
- [High] Use-After-Free of `m2m_dev` on module removal due to asynchronous =
workqueue flush.
- [High] Heap out-of-bounds writes in child probe functions due to unconstr=
ained `hw_index`.
- [High] Failed child device probe leaves a dangling pointer in the parent'=
s hardware array.
- [Medium] Mismatched Runtime PM references between parent and child device=
s cause usage counter leaks and underflows.
- [Medium] Leaked Runtime PM usage counter on `pm_runtime_get_sync` failure=
 paths.
--

--- Patch [1]: [PATCH v16 01/12] media: mediatek: jpeg: fix jpeg cores' amo=
unts setting ---
commit 87a5b6564c9380ac04a07956302ca1970a500438
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: fix jpeg cores' amounts setting
   =20
Different ICs have different amounts of cores,
use a variable to set the cores' amounts.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1325,7 +1325,8 @@ static int mtk_jpeg_probe(struct platform_device *p=
dev)
>  		for_each_child_of_node(pdev->dev.of_node, child)
>  			num_child++;
> =20
> -		atomic_set(&jpeg->hw_rdy, num_child);
> +		jpeg->max_hw_count =3D num_child;

[Severity: High]
Can this overflow fixed-size arrays? num_child comes directly from the
device tree without bounds checking. Later, mtk_jpegenc_worker() and
mtk_jpegdec_worker() use jpeg->max_hw_count to loop and copy pointers into
fixed-size stack arrays like comp_jpeg[MTK_JPEGENC_HW_MAX].

If the device tree specifies more than MTK_JPEGENC_HW_MAX (2) children,
won't this blindly write past the end of the stack array?

> +		atomic_set(&jpeg->hw_rdy, 0);

[Severity: High]
Does this overwrite cause a permanent deadlock? Since
devm_of_platform_populate() runs synchronously before this code, the child
probes will have already incremented jpeg->hw_rdy correctly.

By resetting it to 0 here, the correct readiness count is wiped out. When a
worker subsequently finds an idle core and decrements hw_rdy to -1, won't
future jobs block forever on wait_event_interruptible(jpeg->hw_wq, ... > 0)?

>  		atomic_set(&jpeg->hw_index, 0);
> =20
>  		jpeg->workqueue =3D alloc_ordered_workqueue(MTK_JPEG_NAME,

[ ... ]

> @@ -1462,7 +1463,7 @@ static int mtk_jpegenc_get_hw(struct mtk_jpeg_ctx *=
ctx)
>  	int i;
> =20
>  	spin_lock_irqsave(&jpeg->hw_lock, flags);
> -	for (i =3D 0; i < MTK_JPEGENC_HW_MAX; i++) {
> +	for (i =3D 0; i < jpeg->max_hw_count; i++) {
>  		comp_jpeg =3D jpeg->enc_hw_dev[i];
>  		if (comp_jpeg->hw_state =3D=3D MTK_JPEG_HW_IDLE) {

[Severity: High]
This isn't a bug introduced by this patch, but is it safe to dereference
comp_jpeg unconditionally here?

If a child device probe defers, the array entry in jpeg->enc_hw_dev[i]
remains NULL. Because devm_of_platform_populate() successfully returns
anyway and userspace can queue jobs, won't mtk_jpegenc_get_hw() oops when
accessing comp_jpeg->hw_state?

>  			hw_id =3D i;

[ ... ]

> @@ -1592,7 +1593,7 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
>  		jpeg_work);
>  	struct mtk_jpeg_dev *jpeg =3D ctx->jpeg;
> =20
> -	for (i =3D 0; i < MTK_JPEGENC_HW_MAX; i++)
> +	for (i =3D 0; i < jpeg->max_hw_count; i++)
>  		comp_jpeg[i] =3D jpeg->enc_hw_dev[i];

[Severity: High]
Can this loop write out-of-bounds? The stack array comp_jpeg is bounded by
MTK_JPEGENC_HW_MAX, but the loop condition is now jpeg->max_hw_count.

If the device tree provides more child nodes than the hardcoded maximum,
won't this corrupt the stack?

[Severity: High]
This isn't a bug introduced by this patch, but does the worker accessing
jpeg->m2m_dev on module removal cause a use-after-free?

jpeg->workqueue is registered via devm_add_action_or_reset(), so it is
destroyed after the remove callback returns. However, mtk_jpeg_remove()
explicitly calls v4l2_m2m_release(jpeg->m2m_dev), freeing the memory.

When devres synchronously flushes the workqueue, mtk_jpegenc_worker() calls
v4l2_m2m_job_finish(jpeg->m2m_dev, ...) and accesses the freed pointer.

[Severity: Medium]
This isn't a bug introduced by this patch, but does the worker mismanage
Runtime PM references?

The worker correctly acquires the child's PM reference via
pm_runtime_get_sync(comp_jpeg[hw_id]->dev). However, mtk_jpeg_enc_done()
incorrectly calls pm_runtime_put(ctx->jpeg->dev) on the parent device.

Does this cause the child's counter to leak and the parent's to underflow?

[Severity: Medium]
This isn't a bug introduced by this patch, but does the worker leak the
Runtime PM usage counter on failure?

If pm_runtime_get_sync() fails, the code jumps directly to the enc_end
label without dropping the implicitly acquired usage counter, leaving it
permanently leaked.

>  	i =3D 0;

[ ... ]

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -389,6 +389,8 @@ static int mtk_jpegenc_hw_probe(struct platform_devic=
e *pdev)
>  	platform_set_drvdata(pdev, dev);
>  	pm_runtime_enable(&pdev->dev);
> =20
> +	atomic_inc(&master_dev->hw_rdy);
> +

[Severity: Medium]
Does this need to wake up the workqueue? If a child device defers probing a=
nd
finishes asynchronously later, worker threads might already be waiting on
master_dev->hw_wq.

Without a corresponding wake_up(&master_dev->hw_wq), won't those sleeping
workers wait indefinitely?

[Severity: High]
This isn't a bug introduced by this patch, but does this probe function wri=
te
out-of-bounds on the parent array?

Earlier in the function, hw_index is obtained via
atomic_add_return(1, &master_dev->hw_index) - 1. This index is
unconditionally used to write pointers into master_dev->enc_hw_dev[i].

If the device tree has more child nodes than MTK_JPEGENC_HW_MAX, won't this
exceed array bounds and corrupt the parent mtk_jpeg_dev structure?

[Severity: High]
This isn't a bug introduced by this patch, but does a failed probe leave a
dangling pointer?

The dev struct is assigned to master_dev->enc_hw_dev[i] before
mtk_jpegenc_smmu_init(dev) is called. If the SMMU init fails, the probe
returns an error without clearing the array entry.

Since devres will free the dev memory, won't this leave a dangling pointer
that workers will later dereference?

>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720133432.1042=
046-1-kyrie.wu@mediatek.com?part=3D1
