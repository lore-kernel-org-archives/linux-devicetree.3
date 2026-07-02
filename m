Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE3129B200
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 07:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978992; cv=none; b=tklCQjLXvElIWx2Y9+SFB2XNr+XGnFDV37Ez4ReGef7AZsfTN8QE/GcxAnXNR4Rjal84lJP7PtJSiuVxIt9qcC9jU+F+5NuTxGdoOgHNdlR2Xp384o1H5Qt7RoLCvldqCnZS4t3Z5u96hYdzzRE6uowaRoi2jopR2/tmOKgEAnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978992; c=relaxed/simple;
	bh=FQrfYENcwvOpAsgO6Or/j7+HRvvXw8UGcNsEwKfcdBg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ql6GwujqfkeqQPNI+m+ej7m9n2gsmhEabLR9PsDSvTpvbVFWwfhrRDshxjec9z3SVBYfPXUeeq6Obbjlkel305vL3cEE7GJwXSpDPcGJAHaJk4tERZXKZ6LVF8cLyba7rUDQFCtYP0ZqyUAguZ+kYVoyn5fjc9OKKkBmalDTh48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQ1AEwET; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQ1AEwET"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 005AD1F000E9;
	Thu,  2 Jul 2026 07:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782978991;
	bh=00XyTAI5EQeL+TgW+wM+jy0EdqBX1c+3vLzmPqsnXh8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IQ1AEwEThAYZpYxxv7PCzy7Eesu//yFZ/J30JgYrdfbdBbe4VwI8Z64JzeHTQpsql
	 4qGCZRut/kp3TRUNFr0TTpyYcXBCApu+K3B+Ce+8K5DQaCsxVZ5LS2SpwU5QT0Ngry
	 ZhKg0PjFyIC6jd+pVcs75LvbW6N8kAvNWDeu1sfEV1p2vceIAtjl2xZBSP4c9O2+P2
	 0ppxj94evRPKiFtKOT3+Pu6ZZB5/DN4rXniexExnjuSyY/5Q9fy1/MmDw6Dt8MwI7U
	 qy4HXelbqPTwkqsvXJSgkgr+T+hMmvvw+muqhxljPGu8q0xiH3NCz2GKUxiNYCC/Xz
	 z1jhG3zPTpyBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 12/12] media: mediatek: jpeg: add jpeg smmu sid
 setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260702072614.10373-13-kyrie.wu@mediatek.com>
References: <20260702072614.10373-1-kyrie.wu@mediatek.com>
 <20260702072614.10373-13-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 07:56:30 +0000
Message-Id: <20260702075631.005AD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Permanent increment of `hw_index` and `max_hw_count` on probe =
failure leads to Buffer Overflow and Use-After-Free.
- [High] Missing `pm_runtime_put_noidle()` when `pm_runtime_get_sync()` fai=
ls in the encoder worker.
- [High] Race condition between HW IRQ handler and timeout worker leading t=
o double buffer completion.
--

commit 4f42651eeefeb9f2b2cb2fedba4846b1c45e369e
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: add jpeg smmu sid setting

This commit adds a configuration to set the JPEG decoder and encoder SMMU S=
ID.
It maps the SMMU register base from the device tree and updates the SID
settings during worker initialization.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 5a485e905787d..2e079a6e5d5d3 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
[ ... ]
> @@ -666,6 +685,10 @@ static int mtk_jpegdec_hw_probe(struct platform_devi=
ce *pdev)
>  	dev->master_dev =3D master_dev;
>  	master_dev->max_hw_count++;
> =20
> +	ret =3D mtk_jpegdec_smmu_init(dev);
> +	if (ret)
> +		return ret;
> +

[Severity: Critical]
This is a pre-existing issue, but can this early return cause an out-of-bou=
nds
array write on subsequent probe attempts?

In drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:mtk_jpegdec_hw_pr=
obe(),
the counters are incremented prior to this block:

	i =3D atomic_add_return(1, &master_dev->hw_index) - 1;
	master_dev->dec_hw_dev[i] =3D dev;
	master_dev->reg_decbase[i] =3D dev->reg_base;
	dev->master_dev =3D master_dev;
	master_dev->max_hw_count++;

If mtk_jpegdec_smmu_init() (or the pre-existing devm_clk_bulk_get() call be=
low
it) returns an error such as -EPROBE_DEFER, the probe aborts without
decrementing master_dev->hw_index or max_hw_count.=20

When the system retries probing, these counters will be permanently
incremented, rapidly exceeding the bounds of the dec_hw_dev array and
leading to memory corruption.

>  	platform_set_drvdata(pdev, dev);
>  	pm_runtime_enable(&pdev->dev);
>  	ret =3D devm_clk_bulk_get(dev->dev,
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 1cfdfac98829b..0001d69ae7bab 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
[ ... ]
> @@ -390,6 +409,10 @@ static int mtk_jpegenc_hw_probe(struct platform_devi=
ce *pdev)
>  	dev->master_dev =3D master_dev;
>  	master_dev->max_hw_count++;
> =20
> +	ret =3D mtk_jpegenc_smmu_init(dev);
> +	if (ret)
> +		return ret;
> +

[Severity: Critical]
This isn't a bug introduced by this patch, but could this early return also
lead to an out-of-bounds write here?

Just like in the decoder, if mtk_jpegenc_smmu_init() fails in
drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:mtk_jpegenc_hw_probe=
(),
the function returns without rolling back master_dev->hw_index and
max_hw_count. Subsequent probe retries will use an out-of-bounds index for
the enc_hw_dev array.

>  	platform_set_drvdata(pdev, dev);
>  	pm_runtime_enable(&pdev->dev);
>  	ret =3D devm_clk_bulk_get(dev->dev,

[Severity: High]
This isn't a bug introduced by this patch, but does this error handling path
leak the PM runtime usage counter?

In drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:mtk_jpegenc_worker(=
):

	ret =3D pm_runtime_get_sync(comp_jpeg[hw_id]->dev);
	if (ret < 0) {
		dev_err(jpeg->dev, "%s : %d, pm_runtime_get_sync fail !!!\n",
			__func__, __LINE__);
		goto enc_end;
	}

If pm_runtime_get_sync() fails, the code jumps directly to enc_end without
calling pm_runtime_put_noidle() to drop the acquired reference, potentially
preventing the device from ever entering a low-power state.

[Severity: High]
This is a pre-existing issue, but is there a race condition between the
hardware IRQ handler and the timeout worker?

In drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:mtk_jpegenc_hw_ir=
q_handler():

	cancel_delayed_work(&jpeg->job_timeout_work);

	ctx =3D jpeg->hw_param.curr_ctx;
	src_buf =3D jpeg->hw_param.src_buffer;
	dst_buf =3D jpeg->hw_param.dst_buffer;

If the hardware times out, mtk_jpegenc_timeout_work() executes and
unconditionally completes the buffers and drops PM references:

	v4l2_m2m_buf_done(src_buf, buf_state);
	mtk_jpegenc_put_buf(cjpeg);
	pm_runtime_put(cjpeg->dev);

If the hardware interrupt fires concurrently on another CPU,
cancel_delayed_work() will return false without waiting. Both contexts will
proceed to process the completion, potentially leading to double buffer
completion and a double PM runtime put.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702072614.1037=
3-1-kyrie.wu@mediatek.com?part=3D12
