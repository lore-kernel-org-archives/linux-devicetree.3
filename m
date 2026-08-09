Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490D937FF70
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307435; cv=none; b=UScAgo3BBpGncAKGN9EvEjMuDsNx7LZ7uZ81DnomRYYsps+KzYY4I8nO9JVdn/3smJOdd6QOw7V0J2eguFCaqrEc/d4yoT3gW6n0cFGdqxHmru33Kghc559/OwEX/86B9Elsh0AcqTdbnjJ0mKUBEThOdS7pz4AGafK9qkVqzIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307435; c=relaxed/simple;
	bh=JDlmQoKyaCjV8SoPS2/4hAQ/zyOqG+KKWdlyHScFtLc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TZA99ti9SL52Ibh7lTUyl4KJhJdXjvJmPARtkG/9Oo8PiFqV+Y+hlgFD1NB+NjMuurCmoa9wc/+hDGZn6rEeVKbTqkZWGFU1ZrAbUmUv0CJNIVhY15XXUHCjOfXblfXpHtR4C4yHyiVYvUstEFlPbfpFpfnMJlzSTcey6uUh/AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLuFtq9y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLuFtq9y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97591F000E9;
	Sun,  9 Aug 2026 20:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786307434;
	bh=eKemXd+j07Zch2TaVjacljHhMxXr6NBrYde4Gm0mVvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fLuFtq9yRM6HqE0ZhJ1SAakwKGmUyKW3+2OcEn+RSA4hmV5KzNJFQojmhDdyY4tlr
	 dodooJEExme6m/IdcCjEiz1gWwBEs28hfXKTV2qVNbK3FBlKQK2BoGmQR+vBH6xJFr
	 9jmQebhXigFBrnCPMfTJo4NRJxUZGcJCbDeWrSuIcbj8PEzqlcsYTq4IDbZsMujzol
	 blHOX/H53Ec0Bbky5QkHGHaSTgRLx7l8OEF7iGVEb0RZ5H2POqwGCjAM7jlyNJF2/B
	 wNLHUP5qAA9o5ZjgWCaPyO8p1Rc5h3k8JJxP0tgduOEeuAStYy77jwfOMlmmjWvH6y
	 hVS+19BwTO9/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/12] iommu: qcom_iommu: support the short-descriptor
 pagetable format
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-4-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <20260809-msm8974-iommu-upstream-v1-4-87f5cd492560@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 20:30:33 +0000
Message-Id: <20260809203033.A97591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing rollback in qcom_iommu_init_domain leaves dangling ctx->do=
main pointers and active contexts, causing UAF in the fault handler.
- [High] Missing reset of `iova` base address in TLB invalidation loop caus=
es missed TLB flushes for subsequent context banks.
- [High] Unprogrammed contexts cause NULL pointer dereference in fault hand=
ler.
--

--- Patch [4]: [PATCH 04/12] iommu: qcom_iommu: support the short-descripto=
r pagetable format ---
commit 058d015d111c3926c8cd1da34f2ceba59b5078db
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

iommu: qcom_iommu: support the short-descriptor pagetable format
   =20
The MSM8974-generation QSMMU does not walk the LPAE tables this
driver hardcodes: every access faults with an access flag fault
despite AF being set in the descriptors.

> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/=
arm-smmu/qcom_iommu.c
> index 5bbb51d9bd653..77c01f217d7ea 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c

[ ... ]

> @@ -298,12 +318,22 @@ static int qcom_iommu_init_domain(struct iommu_doma=
in *domain,
>  			continue;
>  		}
> =20
> -		ctx->ttbr0 =3D pgtbl_cfg.arm_lpae_s1_cfg.ttbr |
> -			     FIELD_PREP(ARM_SMMU_TTBRn_ASID, ctx->asid);
> -		ctx->tcr[0] =3D arm_smmu_lpae_tcr(&pgtbl_cfg) | ARM_SMMU_TCR_EAE;
> -		ctx->tcr[1] =3D arm_smmu_lpae_tcr2(&pgtbl_cfg);
> -		ctx->mair[0] =3D pgtbl_cfg.arm_lpae_s1_cfg.mair;
> -		ctx->mair[1] =3D pgtbl_cfg.arm_lpae_s1_cfg.mair >> 32;
> +		if (fmt =3D=3D ARM_V7S) {
> +			ctx->ttbr0 =3D pgtbl_cfg.arm_v7s_cfg.ttbr;
> +			ctx->tcr[0] =3D pgtbl_cfg.arm_v7s_cfg.tcr;
> +			ctx->tcr[1] =3D 0;
> +			/* PRRR/NMRR share the MAIR0/MAIR1 offsets */
> +			ctx->mair[0] =3D pgtbl_cfg.arm_v7s_cfg.prrr;
> +			ctx->mair[1] =3D pgtbl_cfg.arm_v7s_cfg.nmrr;
> +			ctx->contextidr =3D ctx->asid;
> +		} else {
> +			ctx->ttbr0 =3D pgtbl_cfg.arm_lpae_s1_cfg.ttbr |
> +				     FIELD_PREP(ARM_SMMU_TTBRn_ASID, ctx->asid);
> +			ctx->tcr[0] =3D arm_smmu_lpae_tcr(&pgtbl_cfg) | ARM_SMMU_TCR_EAE;
> +			ctx->tcr[1] =3D arm_smmu_lpae_tcr2(&pgtbl_cfg);
> +			ctx->mair[0] =3D pgtbl_cfg.arm_lpae_s1_cfg.mair;
> +			ctx->mair[1] =3D pgtbl_cfg.arm_lpae_s1_cfg.mair >> 32;
> +		}
> =20
>  		reg =3D ARM_SMMU_SCTLR_CFIE | ARM_SMMU_SCTLR_CFRE |
>  		      ARM_SMMU_SCTLR_AFE | ARM_SMMU_SCTLR_TRE |

[Severity: High]
This isn't a bug introduced by this patch, but does qcom_iommu_init_domain()
properly roll back if a later context bank fails to initialize?

If qcom_scm_restore_sec_cfg() fails for a later context bank, it jumps to t=
he
out_clear_iommu error path without un-programming the earlier context banks
or resetting their ctx->domain pointers to NULL:

drivers/iommu/arm/arm-smmu/qcom_iommu.c:qcom_iommu_init_domain() {
...
			ret =3D qcom_scm_restore_sec_cfg(qcom_iommu->sec_id, ctx->asid);
			if (ret) {
				dev_err(qcom_iommu->dev, "secure init failed: %d\n", ret);
				goto out_clear_iommu;
			}
...
}

If a hardware fault subsequently occurs on one of the still-active context
banks, would qcom_iommu_fault() pass the dangling ctx->domain pointer to
report_iommu_fault(), potentially causing a use-after-free?

[Severity: High]
This is a pre-existing issue, but does qcom_iommu_tlb_inv_range_nosync() mi=
ss
TLB flushes for subsequent context banks?

In qcom_iommu_tlb_inv_range_nosync(), when there are multiple context banks,
the iova variable is incremented in the inner loop but isn't reset for the
next iteration of the outer loop:

drivers/iommu/arm/arm-smmu/qcom_iommu.c:qcom_iommu_tlb_inv_range_nosync() {
...
		iova =3D (iova >> 12) << 12;
		iova |=3D ctx->asid;
		do {
			iommu_writel(ctx, reg, iova);
			iova +=3D granule;
		} while (s -=3D granule);
...
}

Could this heavily incremented iova value cause missed TLB flushes for
subsequent context banks, leading to stale TLB translations and incorrect
memory accesses?

[Severity: High]
This is also a pre-existing issue, but can unprogrammed contexts cause a NU=
LL
pointer dereference in the fault handler?

During qcom_iommu_ctx_probe(), if a bootloader left the context active, a D=
MA
fault can fire before qcom_iommu_attach_dev() initializes the context and s=
ets
ctx->domain. If this occurs, qcom_iommu_fault() passes a NULL ctx->domain to
report_iommu_fault():

drivers/iommu/arm/arm-smmu/qcom_iommu.c:qcom_iommu_fault() {
...
	if (report_iommu_fault(ctx->domain, ctx->dev, iova, 0)) {
...
}

Which then dereferences the domain pointer without checking if it is NULL:

drivers/iommu/iommu.c:report_iommu_fault() {
...
	if (domain->cookie_type =3D=3D IOMMU_COOKIE_FAULT_HANDLER &&
	    domain->handler)
...
}

Would this lead to a kernel panic from a NULL pointer dereference during
device initialization?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-msm8974-io=
mmu-upstream-v1-0-87f5cd492560@oss.qualcomm.com?part=3D4
