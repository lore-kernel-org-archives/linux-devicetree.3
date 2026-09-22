Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBDE4570E5
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069316; cv=none; b=Wf0N0grPUe2s0SInVrsqIkl5now7uPmFGE0fmYlnpj+tkm2vxMttzUGe28j+UtkpSSwGKOz6DfgYgbIhWFbnvXbI25ahZXOEtz6kXBKlT3ve8WtAHw1IVApZgRWtLKqJtj33sZ2Q41vdgpRiAnyxV0OdDESe3fmyleGLkDAScqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069316; c=relaxed/simple;
	bh=xQLGjsLLrlKoo6Ik/vmvLKXMDtNcCsbnMAs9OovaQhE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MlaMpqbKDZhmTGdocM87oMjtjSGqxqfrhAgP1nu7HFnIxXDKkjmf3aUPyLyFaYfOED6FBVesg1SotZ7hDkvomFFSgygXKxilG40SlZjCToEEQMwsiXC9p8GOHVqLohQqgsPd2TsDLYTe297n6cMvVWkUlmwTca7lQZ/it37nfng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nvarn2Yk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nvarn2Yk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1450E1F000FF;
	Tue, 22 Sep 2026 09:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069313;
	bh=twrV6VmP+Y5Je9MtNdXbsjqWnqgVCAWNDQxpH7z7bNg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nvarn2YkQCP1BsZe/OrIp5ZKe9caczGw8g/T6fHppsKtFl1ZoztOtEWUfR0jryFJ1
	 TOe/Nav58nKLOP9UwkXZ4V+dkevqjxAHtcAlMl5550vhpnWKSYV1FQpkCcMbBKFQaD
	 RTOqksGxK7+Y6dbDYbeh0v+CDz9LEa256CFncmXLUPaqN+6eCLhJWc+g2ASWgG995Y
	 5OmguI0gZ7EruVk3ke0u+chBRMveUwMD+j6bo27cRvBFtnI0FMm6IBXyFaAERxUS3h
	 2Q3GL3tYjF+lSYVWc3j44/3Gc1NLrrqeEeGjOu/NOuTU2YiBiCLCzf+CE1GwVmjPTe
	 I/2g9nXj7EvvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 01/12] media: mediatek: jpeg: fix jpeg cores'
 amounts setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260922091530.241762-2-kyrie.wu@mediatek.com>
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-2-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 09:28:32 +0000
Message-Id: <20260922092833.1450E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] media: mtk-jpeg: unbounded DT child nodes cause stack and heap buf=
fer overflows
- [High] media: mtk-jpeg: overwriting hw_rdy to zero deadlocks worker threa=
ds
- [Medium] media: mtk-jpeg: missing wake_up in child probes stalls waiting =
workers
--

commit 0bd01f62e3fa6a9492c56fbcebce1fed2d29d3bd
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: fix jpeg cores' amounts setting
   =20
Different ICs have different amounts of cores,
use a variable to set the cores' amounts.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index d147ec4830811..41c4cf8dc2626 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1325,7 +1325,8 @@ static int mtk_jpeg_probe(struct platform_device *p=
dev)
>  		for_each_child_of_node(pdev->dev.of_node, child)
>  			num_child++;
> =20
> -		atomic_set(&jpeg->hw_rdy, num_child);
> +		jpeg->max_hw_count =3D num_child;
> +		atomic_set(&jpeg->hw_rdy, 0);

[Severity: High]
Does setting hw_rdy to 0 here cause a deadlock for worker threads?

Since mtk_jpeg_probe() synchronously probes available child devices via
devm_of_platform_populate() just before this, those probes will have already
incremented hw_rdy correctly.

If we unconditionally reset hw_rdy to 0 here, it overwrites that count.
When jobs are queued, mtk_jpegenc_get_hw() assigns an idle hardware core and
decrements hw_rdy, making it negative. When cores finish and increment
hw_rdy, it will remain <=3D 0, causing all subsequent jobs that block on
wait_event_interruptible(..., hw_rdy > 0) to sleep forever.

>  		atomic_set(&jpeg->hw_index, 0);

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
This isn't a bug introduced by this patch, but can this locklessly
dereference an unprobed child device?

If userspace queues a video job before child devices are guaranteed to
have probed (or if a child node is disabled in the device tree), this
loop can read a null pointer from jpeg->enc_hw_dev[i]. Because
mtk_jpegenc_hw_probe() publishes the device pointer to this array
without synchronization, comp_jpeg can be null here, leading to a panic
when checking comp_jpeg->hw_state.

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
Does this code overflow the fixed-size comp_jpeg stack array?

Since jpeg->max_hw_count is derived directly from the device tree without
bounds checking against MTK_JPEGENC_HW_MAX, this loop can write out of
bounds if the device tree has more child nodes than expected.

>  	i =3D 0;

[ ... ]

> @@ -1687,7 +1688,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
>  	struct mtk_jpeg_fb fb;
>  	unsigned long flags;
> =20
> -	for (i =3D 0; i < MTK_JPEGDEC_HW_MAX; i++)
> +	for (i =3D 0; i < jpeg->max_hw_count; i++)
>  		comp_jpeg[i] =3D jpeg->dec_hw_dev[i];

[Severity: High]
Does this code also overflow the fixed-size comp_jpeg stack array for the
same reason?

>  	i =3D 0;

[ ... ]

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 32372781daf57..9ca68cde45a48 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -668,6 +668,8 @@ static int mtk_jpegdec_hw_probe(struct platform_devic=
e *pdev)
>  	platform_set_drvdata(pdev, dev);
>  	pm_runtime_enable(&pdev->dev);
> =20
> +	atomic_inc(&master_dev->hw_rdy);
> +

[Severity: Medium]
Does this increment need a corresponding wake-up signal for pending workers?

If child devices are probed asynchronously (e.g., due to probe deferral)
and a worker thread is already waiting on hw_wq for a core to become
ready, the thread will miss the readiness notification and sleep forever
without a wake_up(&master_dev->hw_wq) call.

>  	return 0;
>  }

[ ... ]

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index b312a15d707b2..44a064dc7b3d0 100644
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
Does this also require a wake-up signal to prevent worker threads from
stalling, just like in mtk_jpegdec_hw_probe()?

>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922091530.2417=
62-1-kyrie.wu@mediatek.com?part=3D1
