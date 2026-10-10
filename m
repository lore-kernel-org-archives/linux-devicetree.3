Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61B33603DB
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 08:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791620177; cv=none; b=IR6kR+lo/92Os/Nyqmjgbk7yJYbPRO6d4ZDdVtVK20kkURba7Je/BAhh3tSqOZNBN0LU1elbClshc3I+BoA+G/AdrnncwCNoYyDMewHNOoRTu/rSd+m24vpkVDonvM8B0eaEGUqOvpqDvhgwncs70fVVu5L1CWaxPwe63hWKCoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791620177; c=relaxed/simple;
	bh=3tuhpU0zRbhf17JEdmYv3u/6fCC+pY7v7TGFJoaoVGY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=rDc+6k1PkZhTYcUDiIFQlU5IQ8eRxRmWvhoKOs093EVymvOjzkEWelEZirze00Fq8URSn+y3ZYeJ0NxHlzgRyt87BkER0MQtcDLEsrUH/UQ4Oe+xO/LmahKNl5gvPJuMVe048Qy2md0/5pxXPLfrQ0ZD0aPabtx7dp44jkjI1K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7Ykk2iV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7Ykk2iV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62DD1F000FF;
	Sat, 10 Oct 2026 08:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791620176;
	bh=il5NpjG4FYjy0VxsCZmb2Lpt42YE0xXdphPgj3lGb1Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f7Ykk2iV2ht+dnoyM8DlkLaWXCtZdskmAi3hmNcPE74D+EuWqigDLq59wBFSUbgT9
	 7EOgvAl5nQZRGZF8ZSLYkoWcavgetuPpI+fP8/4f4HEYKWbKptToWQ6z2tx8NlmPO1
	 nqyJGhlfr6jQvbjdIGB6BnJOgmclzg73+YgLUiwPMOvk1KNkpHm4KX7fdhU8TstyuI
	 Ki6BAaYu72gY74n1CLSUDsvpsXmE1FZAihar2Xu26Kww4e1BDVvJuwrzemW2DErFNs
	 jL1KRNu2MaFzt1N9MRCIL3G9UNvf+nHdLzqoY43vXZLkBN5XIDEcSlb0/XoAGx9DCh
	 TFuGkwLSSp5zQ==
Message-ID: <sashiko-outbox-166327@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 01/13] media: mediatek: jpeg: fix jpeg cores'
 amounts setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <cc21c4887ec07ac8abf68100a9512a6a121b868b.1791614327.git.kyrie.wu@mediatek.com>
References: <cover.1791614327.git.kyrie.wu@mediatek.com>
 <cc21c4887ec07ac8abf68100a9512a6a121b868b.1791614327.git.kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 08:16:15 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] media: mtk-jpeg: Parent probe resets hw_rdy and hw_index after chi=
ld probes
- [High] media: mtk-jpeg: Stack buffer overflow from unbounded max_hw_count
- [High] media: mtk-jpeg: NULL pointer dereference on deferred or failed ch=
ild probes
--

commit cdbdedb11a1804a4b9d2eaffc176211c725722a4
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: fix jpeg cores' amounts setting

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

[Severity: High]
Does this code overflow the comp_jpeg[] stack arrays in mtk_jpegenc_worker()
and mtk_jpegdec_worker()?

The child node count from the device tree is assigned to max_hw_count witho=
ut
verifying it fits within the driver's hardcoded limits (MTK_JPEGENC_HW_MAX =
or
MTK_JPEGDEC_HW_MAX).

If a malformed device tree provides more nodes than these limits, the worker
functions will perform out-of-bounds writes on their fixed-size stack array=
s.

> +		atomic_set(&jpeg->hw_rdy, 0);
>  		atomic_set(&jpeg->hw_index, 0);

[Severity: High]
Is it safe to reset these atomic variables here?

Earlier in mtk_jpeg_probe(), devm_of_platform_populate() synchronously prob=
es
available child devices. When those child probes succeed, they increment hw=
_rdy
and hw_index, as seen in the changes to mtk_jpegdec_hw_probe() and
mtk_jpegenc_hw_probe() below.

By unconditionally resetting hw_rdy and hw_index to 0 here, the state
established by the successfully probed children is wiped out. This leaves h=
w_rdy
at 0 despite having ready cores.

When workers subsequently try to consume hardware, they will decrement hw_r=
dy to
a negative value, causing other workers calling wait_event_interruptible() =
to
block indefinitely, leading to a deadlock.

Also, deferred child probes will mistakenly receive index 0, overwriting po=
inters
of previously probed children.

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
Can this dereference a NULL pointer if a child node fails to probe or is
disabled?

max_hw_count is the total number of child nodes in the device tree, but
enc_hw_dev[] is only populated when a child driver successfully probes. If a
child node has status =3D "disabled" or fails to probe, its corresponding s=
lot in
enc_hw_dev[] remains NULL.

Iterating up to max_hw_count and unconditionally dereferencing comp_jpeg wi=
ll
cause a NULL pointer dereference in this scenario.

>  			hw_id =3D i;

[ ... ]

> @@ -1509,7 +1510,7 @@ static int mtk_jpegdec_get_hw(struct mtk_jpeg_ctx *=
ctx)
>  	int i;
> =20
>  	spin_lock_irqsave(&jpeg->hw_lock, flags);
> -	for (i =3D 0; i < MTK_JPEGDEC_HW_MAX; i++) {
> +	for (i =3D 0; i < jpeg->max_hw_count; i++) {
>  		comp_jpeg =3D jpeg->dec_hw_dev[i];
>  		if (comp_jpeg->hw_state =3D=3D MTK_JPEG_HW_IDLE) {

[Severity: High]
Similarly, can this trigger a NULL pointer dereference if a decoder child n=
ode
fails to probe or is disabled?

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
As mentioned earlier, does this overflow the fixed-size comp_jpeg stack arr=
ay
if max_hw_count exceeds MTK_JPEGENC_HW_MAX?

Additionally, this lockless copy will cache NULL pointers if there were fai=
led
child probes, leading to a crash later in the worker when
pm_runtime_get_sync(comp_jpeg[hw_id]->dev) is called.

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
Similarly, does this overflow the comp_jpeg stack array if max_hw_count exc=
eeds
MTK_JPEGDEC_HW_MAX, and can it cache NULL pointers?

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
>  	return 0;
>  }
> =20
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
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791614327.gi=
t.kyrie.wu@mediatek.com?part=3D1
