Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D74F37FF70
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307320; cv=none; b=UlZ25oQzhk2xz4JpFwVYXkId0u7QEWQ624wKtIP1FeEXzEVitYaGYfiU6rqSkJ+mkdjwEtoDD1/FzSyCoRRf38ia0gBp40/80Ijp+IYO+6QFmsCQf9NgJpaWVR3XX79qPnKUDzhnioKCTGZM0GjpYWnFemvdaFhztyjxews4Am0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307320; c=relaxed/simple;
	bh=GMa/EvFZw1xNGavhmJ/6BbvcKTdeHV6cPUhCZlGJZhU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mb0AJNiDQDU57oJ07ziQJisz9MHEZJNjR7KdMuOPgGdwlK0bch4duT4YDEum7T9NftkI5M2xJ960LbvgGZAXU2CO6+mdxFWJU1QuMHiB9D2dXijmkF/IsYjlQhSpe0D8wvI8fsimlnzs22ygUCqQlpG6ylsh7QYX0LY1wmQonjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9tpdEX6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9tpdEX6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BF21F00A3A;
	Sun,  9 Aug 2026 20:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786307319;
	bh=CxS2MH5KcrofrxNP+bPZSRyNmT+Gy5PK2d7PDv7+yQo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F9tpdEX6n1yHuGQ65/m0HTS93TlsVg3bMvnCbPj7DSVAvQuLm/zd14O062O5K6/4p
	 YfI5Xlbzo50AuSQBWze4DGCA2BMLPoVFbP13BImsgEstc1GLiLoWaPsxHIANSyqTnN
	 Ykn1KTg3fNFm++8zpe97ASO4kRCrm2OHKwugbFaHdvDT3Yy7u+URdbshPV7T0YXtD5
	 EfSSweNQzX/+VDZj2RpS/fUOwUzisPtASu+vhjgm/pp9EqU2GAh+82tJgxQ+EFPt00
	 PfsvG8dCpkqiJTEy8BDhv/cUz612Fw1UoLh5MCttdGUXiY80kMaQGuNp+1F5696UD8
	 T0tGprUis2kvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/12] iommu: qcom_iommu: allow faulting transactions to
 terminate
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-9-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <20260809-msm8974-iommu-upstream-v1-9-87f5cd492560@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 20:28:38 +0000
Message-Id: <20260809202838.D7BF21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The `qcom_iommu_fault` interrupt handler unconditionally writes to=
 `ARM_SMMU_CB_RESUME`, causing CONSTRAINED UNPREDICTABLE behavior when `no_=
stall` is enabled.

Pre-existing issues:
- [High] The driver ignores the return value of `pm_runtime_get_sync()`, ri=
sking a synchronous external abort on QCOM platforms if power enablement fa=
ils.
--

--- Patch [9]: [PATCH 09/12] iommu: qcom_iommu: allow faulting transactions=
 to terminate ---
commit 7786a25b4251a5907f3352e2d3045ccfe7aefaab
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

iommu: qcom_iommu: allow faulting transactions to terminate

This commit introduces a no_stall flag to qcom_iommu_cfg. When set, this
flag clears the CFCFG bit in SCTLR so that faulting transactions terminate
instead of stalling. The interrupt handler remains unchanged.

> through the existing interrupt handler; only the stall goes away, and
> with it the handler's RESUME write becomes a formality.

[Severity: High]
Does this write actually become a formality, or could it cause a regression
with unpredictable behavior?

If stalling is disabled, FSR.SS will remain 0 when a context fault occurs.
According to the ARM SMMUv2 spec, writing to CB_RESUME when the stall status
(FSR.SS) is 0 is constrained unpredictable and can trigger a synchronous
abort.

The qcom_iommu_fault() interrupt handler unconditionally writes to
ARM_SMMU_CB_RESUME:

drivers/iommu/arm/arm-smmu/qcom_iommu.c:qcom_iommu_fault() {
    ...
	iommu_writel(ctx, ARM_SMMU_CB_FSR, fsr);
	iommu_writel(ctx, ARM_SMMU_CB_RESUME, ARM_SMMU_RESUME_TERMINATE);
    ...
}

Should the unconditional write to CB_RESUME be guarded by a check for
FSR.SS?

> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/=
arm-smmu/qcom_iommu.c
> index f27f8722ee640..2b2cf665c39db 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
[ ... ]
> @@ -500,6 +502,9 @@ static int qcom_iommu_init_domain(struct iommu_domain=
 *domain,
>  		if (qcom_iommu->cfg && qcom_iommu->cfg->no_afe)
>  			reg &=3D ~ARM_SMMU_SCTLR_AFE;
> =20
> +		if (qcom_iommu->cfg && qcom_iommu->cfg->no_stall)
> +			reg &=3D ~ARM_SMMU_SCTLR_CFCFG;
> +
>  		ctx->sctlr =3D reg;
> =20
>  		qcom_iommu_program_ctx(qcom_iommu, ctx);

[Severity: High]
This is a pre-existing issue, but is it safe to proceed with initializing
the domain without checking if power enablement succeeded?

This function is called by qcom_iommu_attach_dev(), which ignores the return
value of pm_runtime_get_sync():

drivers/iommu/arm/arm-smmu/qcom_iommu.c:qcom_iommu_attach_dev() {
    ...
	pm_runtime_get_sync(qcom_iommu->dev);
	ret =3D qcom_iommu_init_domain(domain, qcom_iommu, dev);
	pm_runtime_put_sync(qcom_iommu->dev);
    ...
}

If pm_runtime_get_sync() fails, qcom_iommu_init_domain() will perform MMIO
accesses on unpowered hardware. On Qualcomm platforms, accessing unclocked =
or
unpowered IOMMU hardware registers causes a synchronous external abort.

Should qcom_iommu_attach_dev() check the return value and safely abort befo=
re
attempting to access unclocked registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-msm8974-io=
mmu-upstream-v1-0-87f5cd492560@oss.qualcomm.com?part=3D9
