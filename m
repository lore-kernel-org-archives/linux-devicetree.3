Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CA6390C9F
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425954; cv=none; b=sSXkL/E44g1REvKFgctbuvyD/I7y++YEYwwq2gUt4J8+UzKM6cP8j+tdeaXlNiHacfZHAuMDw46siGltXEyl1NciW1/WbrS8xNvw5Vo7f70wA2ZzZh/MM4G74+k9S1rRgxudSh7EUfzFMr7kmkHMe+/s0VqVE/SemDuC7HCGVZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425954; c=relaxed/simple;
	bh=95WB2jXREgpHlSYAS0nLsX71ZiRC2bzaCYV0V4uuiZQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FyhYEuSkY0jKb/y0C5pLto4BYtl0CcQlG3XXKhAb+ft2JslmzJZoLKp1reCJWc63IAU/3DeBRXkUAI2hu9E7K9muPR+YxbZurPjTxqBiAvMobYCdSfflfYF+gV+NsV21nqbQXqxBnLpbBXIFcw7KUmm1He/bdki7eUBqzRwDdWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QB/JIkmx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QB/JIkmx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC5E1F00A3D;
	Thu, 30 Jul 2026 15:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785425953;
	bh=TjNBrTCtYBzNWNsyLG1kxHXqs+yodHFRj2rK4p70iVI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QB/JIkmx7dwLFkUEHajMX/XSTlNAeACiX0rOF+AYozOVPOjj0EKUIyx9SrGdgt6md
	 KIVEyOgkahZAIZmAzm/jTttSYg3ybyeut8uQB4RvTXRW7o+5mxGEfaGt2G9U2Ptecm
	 Q2BHPGkNTEckEtnIj8j1gbv7xZeA1425ThqmhEkSNT+wrr8956wL+TTcDISuHIYMlU
	 BGP3Ic8aCjlOVPhqb8szeFz9W8MpsyAVP7nTsEpjqmf4AlP7X7GgVhlFrTvK/Fyc/d
	 BwCWX/WWqjNd+CmkEG7dTH/WSppGU2t3anBUjTOhuPESsF01zFSPyFvNizUFnke9S9
	 +jl+GMqLUZ8IQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 17/18] media: venus: skip QCM2290 if Iris driver is
 enabled
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-iris-ar50lt-v8-17-6597c08cea6f@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
 <20260730-iris-ar50lt-v8-17-6597c08cea6f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 15:39:12 +0000
Message-Id: <20260730153912.BAC5E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Unbalanced teardown of delayed work core->work leads to Use-Af=
ter-Free.
- [Medium] Memory and DMA allocations are leaked on the venus_probe() error=
 path.
--

--- Patch [17]: [PATCH v8 17/18] media: venus: skip QCM2290 if Iris driver =
is enabled ---
commit 3f4135bbccd5abb2cbdcfce435629b2b86cda1f5
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

media: venus: skip QCM2290 if Iris driver is enabled

As the Iris driver now supports the QCM2290 hardware too, there is a
race between Venus and Iris drivers on binding to the corresponding
device. Follow the approach used by other platforms and skip QCM2290 in
the Venus driver if Iris is enabled.

> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/pla=
tform/qcom/venus/core.c
> index 243e342b0ae75..3c88594eb1d00 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
[ ... ]
> @@ -1169,13 +1168,16 @@ static const struct venus_resources qcm2290_res =
=3D {
>  	.enc_nodename =3D "video-encoder",
>  	.min_fw =3D &min_fw,
>  };
> +#endif
> =20
>  static const struct of_device_id venus_dt_match[] =3D {
>  	{ .compatible =3D "qcom,msm8916-venus", .data =3D &msm8916_res, },
>  	{ .compatible =3D "qcom,msm8939-venus", .data =3D &msm8939_res, },
>  	{ .compatible =3D "qcom,msm8996-venus", .data =3D &msm8996_res, },
>  	{ .compatible =3D "qcom,msm8998-venus", .data =3D &msm8998_res, },
> +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
>  	{ .compatible =3D "qcom,qcm2290-venus", .data =3D &qcm2290_res, },
> +#endif
>  	{ .compatible =3D "qcom,sc7180-venus", .data =3D &sc7180_res, },
>  	{ .compatible =3D "qcom,sdm660-venus", .data =3D &sdm660_res, },
>  	{ .compatible =3D "qcom,sdm845-venus", .data =3D &sdm845_res, },

[Severity: Medium]
This is a pre-existing issue, but does the error path in venus_probe() leak
memory and DMA allocations?

Looking at venus_probe(), if devm_request_threaded_irq() fails, the code ju=
mps
directly to err_core_put:

drivers/media/platform/qcom/venus/core.c:venus_probe() {
    ...
	ret =3D devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_threa=
d,
					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
					"venus", core);
	if (ret)
		goto err_core_put;
    ...
err_hfi_destroy:
	hfi_destroy(core);
err_core_put:
    ...
}

This bypasses err_hfi_destroy and skips the hfi_destroy() cleanup, permanen=
tly
leaking the resources allocated by hfi_create(). Should the failure path ju=
mp
to err_hfi_destroy instead?

[Severity: Critical]
This is a pre-existing issue, but could the delayed work core->work lead to=
 a
use-after-free?

In the venus_probe() error path, cancel_delayed_work_sync() is omitted enti=
rely.
If the IRQ is successfully registered and fires before probe aborts, it can
queue core->work which could execute after the core object is freed.

Additionally, in venus_remove():

drivers/media/platform/qcom/venus/core.c:venus_remove() {
	cancel_delayed_work_sync(&core->work);
    ...
	hfi_destroy(core);
    ...
}

cancel_delayed_work_sync() is invoked before the IRQ is disabled in
hfi_destroy(). If an interrupt fires between these two calls, the ISR can
re-queue the work, which will subsequently execute on a freed core object.=
=20

Could we move the cancel_delayed_work_sync() call after the IRQ is disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-iris-ar50l=
t-v8-0-6597c08cea6f@oss.qualcomm.com?part=3D17
