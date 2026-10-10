Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB39231829
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 08:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791620652; cv=none; b=Y/ys9ZkSNAlY/DU2qfHoO+YzFENRu/at6903tyueDdyGDD9tvc63G+7TCCBF57dutPWlheDajgf30IQbaKoy0v9Zdmo3sLOFZ79ok7LL/YCL+a6Za13qIZgrq3wkfpjPMntQmU6ZssTjGfZFBHgnuJdMU31SA2HHvqsMR0jhcDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791620652; c=relaxed/simple;
	bh=EHV1Qq1ZuRTMxouwzWk8SBb3EiTmKv/VzvHVbx+AqXQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EZ9/o4tcSsLeSPCpR3cm8vRwl8qkRtOkuyU+r12LK6MI8HS++6PO5bXbEtWndOeieG4LpukfwonocERi7bxT2v9Q3gBfk6S+y6V5l4madkZHZcbChZZN0iRE493Wxfu42mBiScit9/ciNypqPhhhdpVl2ENDX6kRfLSxD4YMtWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bs7p7aQK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bs7p7aQK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB201F000FF;
	Sat, 10 Oct 2026 08:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791620650;
	bh=Y1MLgGvgtXr9zv7ZFaZ03NdkXifbvh6W554GnZp8De4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bs7p7aQKGiwL68pdn8uYd50DW4QWiKrrT7XukRtvEdxuqovtBlTvq0eZ0BaE7Tj4Y
	 ZIxHiS4SYF5N+0qL2wu1v4FAT37QpV7gyhfno5HcfaSzW2VYCvsveBK7zGQl218+Qk
	 CbBjHEZlxYYCVZgxw08bCRD+5493bnaaxLTm0oguNGkHfum4aJ4DXS4wNgTvtmi1vK
	 jUV5F6xI50M8vzSHWX+/9NFEixitJrna5o+fDcRCRxAt1yx0jhowhmkEFJro502Feg
	 1ddLuN7KY/SKzymg02ARyYX6oJQG8Ti7zcX53mkv7Df9rErVSWfvk4+OwQm9OfL4Ge
	 SewEYLZquSAJw==
Message-ID: <sashiko-outbox-166342@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 05/13] media: mediatek: jpeg: Fix multi-core clk
 suspend and resume setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <0db7631b0515bea82aa47bf3599ea9878fa9bfa6.1791614327.git.kyrie.wu@mediatek.com>
References: <cover.1791614327.git.kyrie.wu@mediatek.com>
 <0db7631b0515bea82aa47bf3599ea9878fa9bfa6.1791614327.git.kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 08:24:09 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] media: mediatek: jpeg: system suspend disables clock while HW =
is running
- [High] media: mediatek: jpeg: Unsafe PM suspend forced while hardware is =
active
- [High] media: mediatek: jpeg: M2M queue unpaused before components resume
- [Low] media: mediatek: jpeg: dev_pm_ops assigned unconditionally causing =
dead code
--

commit 4893ce2818141ce09ed0c83da36108870b5d7724
Author: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: media: mediatek: jpeg: Fix multi-core clk suspend and resume setti=
ng

This patch updates clock management and power management suspend/resume
callbacks for multi-hardware component devices, leaving single-core
callbacks on the master device. It aims to synchronize job suspension
using v4l2_m2m_suspend() before disabling component clocks. Runtime PM
references are used to keep clocks enabled until a job completes or times o=
ut.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
[ ... ]
> +static int mtk_jpegdec_suspend(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	/* Stop new jobs and wait for the current job before clock-off. */
> +	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);

[Severity: Critical]
Does this wait mechanism function correctly if v4l2_m2m_job_finish() is
called immediately after starting the hardware?

In mtk_jpegdec_worker(), v4l2_m2m_job_finish() is invoked right after
mtk_jpeg_dec_start(), which clears the active M2M context early to allow
scheduling on other cores. Consequently, v4l2_m2m_suspend() will see no
active job and return immediately without waiting.

This can lead to pm_runtime_force_suspend() abruptly shutting off hardware
clocks while the hardware is still actively processing a frame, which can
lock up the bus.

Additionally, if the hardware is left running without clocks, the pending
job_timeout_work scheduled on the system workqueue will eventually fire. Wh=
en
it calls mtk_jpeg_dec_reset(), it will attempt to access unclocked device
registers, which can trigger a synchronous external abort and crash the
system.

> +
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int mtk_jpegdec_resume(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D pm_runtime_force_resume(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	v4l2_m2m_resume(jpeg->master_dev->m2m_dev);

[Severity: High]
Can this unpause the global M2M queue before all hardware components are
fully resumed?

During system resume, the PM core sequentially resumes component devices.
If the first resumed component calls v4l2_m2m_resume(), it unpauses the
global M2M queue and schedules the worker thread on a non-freezable
workqueue.=20

The worker thread could execute immediately, select a sibling component
that is still suspended, and call pm_runtime_resume_and_get(). If this
occurs concurrently with the PM core executing pm_runtime_force_resume() on
that same component, the runtime PM call fails with -EACCES, resulting in
dropped V4L2 frames.

> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops mtk_jpegdec_pm_ops =3D {
> +	SYSTEM_SLEEP_PM_OPS(mtk_jpegdec_suspend, mtk_jpegdec_resume)
> +	RUNTIME_PM_OPS(mtk_jpegdec_pm_suspend, mtk_jpegdec_pm_resume, NULL)
> +};
> +
>  static struct platform_driver mtk_jpegdec_hw_driver =3D {
>  	.probe =3D mtk_jpegdec_hw_probe,
>  	.driver =3D {
>  		.name =3D "mtk-jpegdec-hw",
>  		.of_match_table =3D mtk_jpegdec_hw_ids,
> +		.pm             =3D &mtk_jpegdec_pm_ops,

[Severity: Low]
Should this be wrapped with pm_ptr() to avoid compiler warnings and dead co=
de
retention when CONFIG_PM is disabled?

>  	},
>  };
> =20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
[ ... ]
> +static const struct dev_pm_ops mtk_jpegenc_pm_ops =3D {
> +	SYSTEM_SLEEP_PM_OPS(mtk_jpegenc_suspend, mtk_jpegenc_resume)
> +	RUNTIME_PM_OPS(mtk_jpegenc_pm_suspend, mtk_jpegenc_pm_resume, NULL)
> +};
> +
>  static struct platform_driver mtk_jpegenc_hw_driver =3D {
>  	.probe =3D mtk_jpegenc_hw_probe,
>  	.driver =3D {
>  		.name =3D "mtk-jpegenc-hw",
>  		.of_match_table =3D mtk_jpegenc_drv_ids,
> +		.pm =3D &mtk_jpegenc_pm_ops,

[Severity: Low]
Should this also be wrapped with pm_ptr()?

>  	},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791614327.gi=
t.kyrie.wu@mediatek.com?part=3D5
