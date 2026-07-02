Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699063ACEE2
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 07:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978087; cv=none; b=FM8f3TmA3iiDU74AdZ0tBkWus4t9QJ54hfyxm4zhW0D1/5rHXzsVMjPO+oZKayNA++UyP06PYbQ0bcay7aNkmn+DxBn5qi/b/b6MbQdujKIrbU2rjrlmBmUzdPnmo4e57gcuZQpb6nklDasrn/I+202LhLp9ed5B+1nPXcdwOSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978087; c=relaxed/simple;
	bh=Xv/l+M8hSbeVrt9VQrTGd2wHvLkJ/20lvt6m9Gz4YbI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qHBepk0b6QatBqYIPBI0vjyZJnOIjC+sQZeQrn3LMe+gV+GVSNFVE+F9/Koas6LUUC+/4sDgOqp9XXqwPOL3HBrGeNmM8o2u9PtaUaPRq4WrRnyJ3OaMYpUPCUbY6IkUrZXHZKzSwJEH8qOdQgD7aHSWitHTM00NumfN5mUhoU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JlNvgzEx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlNvgzEx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D401F00A3D;
	Thu,  2 Jul 2026 07:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782978084;
	bh=t0trqmHScCMnhJ1rcsJ40ebvCp81V7s/iuxpqjhcra4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JlNvgzEx2zug3rCMLXFZMaLVDex3crs8LG7CIpwU0xXo0/gNDXnwValGNdefuB2ya
	 fXBBRZfoA/ndEK4k2eipwvmR8lXrMkFzcBy+SM/kq5vo6qm6FcIuM14VZnHliJsrMM
	 R+uVXIBsv1/QusPqB8Jv2S+FPl8h6lwKZAODdS8UYQXNOfZ0dBRtyQ8MoiE3d1Gzu5
	 NYIT9yqL1oG235OajHhBJNX8T0S7128EzWcDqjRtJHhaJWVrdyeB/CFhzi15Bs3lSR
	 0FtaS1ECV9VGwyQ+eMjqIUaZnVcEQE28LbVuCTK3gPuL1ln4cDeq5cyGIyGqrVDGur
	 MvkgG2DdSDOoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 01/12] media: mediatek: jpeg: fix jpeg cores'
 amounts setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702072614.10373-2-kyrie.wu@mediatek.com>
References: <20260702072614.10373-1-kyrie.wu@mediatek.com>
 <20260702072614.10373-2-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 07:41:23 +0000
Message-Id: <20260702074123.A5D401F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Critical] Unbounded max_hw_count growth on probe failure causes stack an=
d heap buffer overflows.
- [High] Uninitialized stack memory access in worker threads upon retry.
- [High] Mismatched tracking of available hardware causes an infinite busy-=
loop and job failure.
- [High] Data race and missing memory barriers between child probe and work=
er threads cause NULL pointer dereferences.

Pre-existing issues:
- [High] Use-After-Free during device removal due to asymmetric devres work=
queue teardown.
--

commit 0ee6ba9604510a9c4d1afe2cbb648113729e18a6
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: fix jpeg cores' amounts setting

This commit updates the driver to track the number of available hardware
cores dynamically using a max_hw_count variable instead of relying on a
hardcoded macro. It modifies the probe routines to increment this counter
and bounds the iterations in the worker threads based on the new variable.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index d147ec4830811..1e014fd698ae0 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

[ ... ]

> @@ -1592,7 +1592,7 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
>  		jpeg_work);
>  	struct mtk_jpeg_dev *jpeg =3D ctx->jpeg;
> =20
> -	for (i =3D 0; i < MTK_JPEGENC_HW_MAX; i++)
> +	for (i =3D 0; i < jpeg->max_hw_count; i++)
>  		comp_jpeg[i] =3D jpeg->enc_hw_dev[i];
>  	i =3D 0;

[Severity: Critical]
Since max_hw_count can increment on probe retries (as noted below in the
probe routines), could this unbounded count exceed the fixed size of the
comp_jpeg stack array and cause a buffer overflow?

[Severity: High]
Since max_hw_count and the enc_hw_dev pointers are updated during child
probes without locks or memory barriers, could this worker thread observe
an incremented max_hw_count but read a NULL or uninitialized enc_hw_dev
pointer if the operations are reordered?

[Severity: High]
If a deferred child probe completes while waiting, and a subsequent call to
mtk_jpegenc_get_hw() returns a newly probed hw_id, does the retry loop use
an uninitialized pointer from the comp_jpeg array?

mtk_jpegenc_worker() {
    ...
retry_select:
    hw_id =3D mtk_jpegenc_get_hw(ctx);
    if (hw_id < 0) {
        ret =3D wait_event_interruptible(...);
        ...
        goto retry_select;
    }
    ...
    ret =3D pm_runtime_get_sync(comp_jpeg[hw_id]->dev);
}

Because the comp_jpeg array initialization loop happens before retry_select,
it is not re-run to pick up the newly assigned pointers.

[Severity: High]
Does the mismatch between hw_rdy and max_hw_count cause an infinite busy
loop when active cores are busy?

The wait condition relies on hw_rdy, which is initialized to the total
number of child nodes during the master probe:

    ret =3D wait_event_interruptible(jpeg->hw_wq,
                                   atomic_read(&jpeg->hw_rdy) > 0);

If a child node defers probing, max_hw_count will be less than hw_rdy.
When active cores are busy, this overcount could cause the worker to wake
up immediately and retry until it exhausts the retry limit and fails.

[Severity: High]
This is a pre-existing issue, but does device removal have a use-after-free
regression risk with the worker threads?=20

During unbind, mtk_jpeg_remove() synchronously releases the m2m device:

mtk_jpeg_remove()
    ...
    v4l2_m2m_release(jpeg->m2m_dev);

However, the workqueue teardown is registered via devres and executes after
remove completes. If a worker thread is running during unbind, could it
call v4l2_m2m_job_finish() and access the already-freed m2m_dev context?

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index b6f5b2249f1f2..2765dafab4ad4 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -386,6 +386,7 @@ static int mtk_jpegenc_hw_probe(struct platform_devic=
e *pdev)
>  	master_dev->enc_hw_dev[i] =3D dev;
>  	master_dev->reg_encbase[i] =3D dev->reg_base;
>  	dev->master_dev =3D master_dev;
> +	master_dev->max_hw_count++;
> =20
>  	platform_set_drvdata(pdev, dev);
>  	pm_runtime_enable(&pdev->dev);

[Severity: Critical]
If a failure occurs later in the probe routine, such as in
mtk_jpegenc_smmu_init(), are the master_dev->max_hw_count increment and
pointer assignments rolled back?=20

Without a rollback, a subsequent probe retry would increment max_hw_count
again and leak the previous hw_index, potentially overflowing counters and
corrupting adjacent memory structures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702072614.1037=
3-1-kyrie.wu@mediatek.com?part=3D1
