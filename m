Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBBB456DF3
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069196; cv=none; b=EbpTHB64FxCPY+M1W/bs8b7An/Xgq0KQ66r5AvYdg0AOgwwIB+YuVnxM6BvccBtEuXFm8aDqgMbqPOVQLimEioXQPl+g3KXpJ6TOSwGSj/HYR4GGjCCnr7HPNWVhIrtQBxdF/Pia3XxcnPh3nbpSqgjyeMHVPzCdFauuDgDj8rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069196; c=relaxed/simple;
	bh=yCEHAc8mVhsVKkciy8D9xNk9f4lgRN2bS36Js5L9qy8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UgLQe1GqDwRn37ysbtgYvyyo5Rkcr0kguI65BrX9B+xaaRLYuSOKYGhDaR3dYWnOExsBCZman3zlq8HM5lqaWBSQpvpYYbk4fhKYOB0CIpjqiCai049Yl4yW4QF024q1vZCWm2aOazBLa7sZVTnFoFd4yNHVa93frIQjCJGBvwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZGX0ENW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZGX0ENW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA601F000FF;
	Tue, 22 Sep 2026 09:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069194;
	bh=szDcBg4CgRNZ/fk0etDDs6qzpSduboRsDMOOa0HRwnk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FZGX0ENW9KSUv3phnMU/+B4lvR5V/Pg/x9mAn96CexICQIXhTd5c+8V/jGKSrUrRY
	 FSQEt4d7t5GmBP/wmLYb7nSPMwGXW1CKkP6ilp7wBQ2NLLiX4LFQMzUWliz8oXplbQ
	 0eIMhFg4e6lmbrGNUjb7DQAOrTRMTMr4Y89igT51KwRdTYuOzzl1j5hf+eraDX+yfp
	 /a61oduV8RXssch263VIV9orDAcY2WTztlLdL/G8NYyaaaacKhnx4Ua1z0Y2fi+UZ4
	 XqSi7f7N1KpbaaZflE7L2aUAJiOhaGGB3bOdwIw/A/2Jd0QozGHJuvM01SKna9V2h/
	 VdQoZCOLSUm/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 05/12] media: mediatek: jpeg: Fix multi-core clk
 suspend and resume setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260922091530.241762-6-kyrie.wu@mediatek.com>
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-6-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 09:26:33 +0000
Message-Id: <20260922092634.7CA601F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: mtk-jpeg: Suspend disables active clocks causing hardware h=
ang
- [Low] media: mtk-jpeg: Missing pm_ptr() for PM callback structures
--

commit 0db3afe4aa2d7cc8cac14739138325d421e0242c
Author: Kyrie Wu <kyrie.wu@mediatek.com>

    media: mediatek: jpeg: Fix multi-core clk suspend and resume setting

This commit adds suspend and resume callback functions for each multi-core
hardware. It defines dev_pm_ops and sets them up in the platform_driver for
both decoders and encoders.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 9ca68cde45a48..970c0a30e3659 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
[ ... ]
> +static int mtk_jpegdec_suspend(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
> +
> +	return pm_runtime_force_suspend(dev);
> +}

[Severity: High]
Does this suspend path risk causing a system crash by forcefully disabling
clocks while the JPEG hardware is actively performing DMA operations?

Because the multi-core driver design calls v4l2_m2m_job_finish() immediately
after starting the hardware, the TRANS_RUNNING flag is cleared early. This
causes v4l2_m2m_suspend() to not block here. The callback then proceeds
directly to pm_runtime_force_suspend(), which invokes
mtk_jpegdec_pm_suspend() to disable the clocks, disregarding that the hardw=
are
might still be in the MTK_JPEG_HW_BUSY state.

[ ... ]
>  static struct platform_driver mtk_jpegdec_hw_driver =3D {
>  	.probe =3D mtk_jpegdec_hw_probe,
>  	.driver =3D {
>  		.name =3D "mtk-jpegdec-hw",
>  		.of_match_table =3D mtk_jpegdec_hw_ids,
> +		.pm             =3D &mtk_jpegdec_pm_ops,

[Severity: Low]
Should this assignment be wrapped with pm_ptr() to avoid dead code?

When CONFIG_PM is disabled, mtk_jpegdec_pm_ops and the PM callbacks will be
compiled into the kernel but remain unused. Using pm_ptr(&mtk_jpegdec_pm_op=
s)
allows the compiler to eliminate the dead code.

>  	},
>  };
> =20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 44a064dc7b3d0..4a8559c359536 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
[ ... ]
> +static int mtk_jpegenc_suspend(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
> +
> +	return pm_runtime_force_suspend(dev);
> +}

[Severity: High]
Does this suspend path have the same risk of forcefully disabling active
clocks during DMA operations as in the decoder hardware?

Similar to the decoder, v4l2_m2m_suspend() might not block here because
v4l2_m2m_job_finish() is called early in the encoder path, causing the
clocks to be cut while the encoder might still be active.

[ ... ]
>  static struct platform_driver mtk_jpegenc_hw_driver =3D {
>  	.probe =3D mtk_jpegenc_hw_probe,
>  	.driver =3D {
>  		.name =3D "mtk-jpegenc-hw",
>  		.of_match_table =3D mtk_jpegenc_drv_ids,
> +		.pm =3D &mtk_jpegenc_pm_ops,

[Severity: Low]
Should this assignment also be wrapped with pm_ptr() to avoid dead code when
CONFIG_PM is disabled, similar to mtk_jpegdec_pm_ops?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922091530.2417=
62-1-kyrie.wu@mediatek.com?part=3D5
