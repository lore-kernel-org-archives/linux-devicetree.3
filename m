Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF0F3630BE
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307319; cv=none; b=cBSdRXLedU/sB0H0pWehqXQnSbKNxD1GbWUK/9N2DAEgztiMropQPaT/ISu6gajSObM42uRD8ZLkpIHkuF8dtF0wwH7f11BPKZSReBdJyd/5DrwqLQwjO9DBzly2PuYpN2zqF4XUiqXGFcETNXb/ffGJHgVw5lWwGV/hKStTcTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307319; c=relaxed/simple;
	bh=2OMazCRPOwCAEdoeHi9CfSu65NVFhsAAnHphbLeHCIM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qoKEgqCMvsfos7+npmB+V6On4Th3JPjoxOA8w5zsDQEUsebrYck3/OKGpIRiTymUVQZP+S7T/3yEJZyCzqxGWgrq++viv9GsyPf9mM2AtgOPk8egjYgFd3LhInUzMK62kSMx9mvo83WAnWyBRBaw5ZD81najut5LtpBcVqsmGjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JjctIR+X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JjctIR+X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346161F000E9;
	Sun,  9 Aug 2026 20:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786307318;
	bh=oqEgCajFDACssAnwquRWwzzchAgKyOWjMVWSNHfbO5Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JjctIR+XD1waedvIiPvjO5JXPoF8eK7lakjhZcfXNtjuCsU8JOIdY9ODyOpAeB6PM
	 6RoFzYirmqK5KsdeSeSeckqhvy03gz3c+icTOj/DWHM3I6QLb58g40NWo2eYwnYLO7
	 fXNMOLmOG9R6URC5GGKqzyFk0NC562AMGIS02k2D3f6XF2NVhs13geeYfprbikjfiZ
	 7rwWSysNMfiPdsDbpXUhOLLSLOv+MrnOskahvzketaPSrSLE0/KH2gwaMsiRR3cXN8
	 CodpbGmaWB16FChX82gGXAD3G7+HlohQG7RAW7Wa9dwC0qwEhrGWZYYdoN8WFUG/+u
	 XzsHWa4yQEimw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/12] iommu: qcom_iommu: program BFP (prefetch)
 settings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-10-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <20260809-msm8974-iommu-upstream-v1-10-87f5cd492560@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 20:28:37 +0000
Message-Id: <20260809202838.346161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing clock disable/unprepare on error paths in qcom_iommu_res=
ume() leading to reference leaks.
--

--- Patch [10]: [PATCH 10/12] iommu: qcom_iommu: program BFP (prefetch) set=
tings ---
commit 7f97a52dc093659d163957e201f4e9c73067ebaf
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

iommu: qcom_iommu: program BFP (prefetch) settings

MSM8974 QSMMU instances require additional programming of the prefetch
settings in the instance-specific space, with the tables being specific
to a particular instance. Implement support for programming BFB tables.

> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/=
arm-smmu/qcom_iommu.c
> index 2b2cf665c39db..9523ae95fa125 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c

[ ... ]

> @@ -1131,6 +1157,8 @@ static int __maybe_unused qcom_iommu_resume(struct =
device *dev)
>  			return ret;

[Severity: Medium]
Does this code leak the clock reference?

If qcom_iommu_reset_ns() or qcom_scm_restore_sec_cfg() fails during device
resume, this error path returns directly without calling
clk_bulk_disable_unprepare() to clean up the clocks that were enabled
earlier in qcom_iommu_resume() via clk_bulk_prepare_enable().

>  	}
> =20
> +	qcom_iommu_bfb_setup(qcom_iommu);
> +
>  	if (qcom_iommu->cfg && qcom_iommu->cfg->ctx_restore) {
>  		/* Restore context banks lost over power collapse */
>  		for (i =3D 0; i <=3D qcom_iommu->max_asid; i++) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-msm8974-io=
mmu-upstream-v1-0-87f5cd492560@oss.qualcomm.com?part=3D10
