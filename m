Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D255723EA8B
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307231; cv=none; b=eEOAznLssigcUwMQSF8RqvJWcQyIZ2KOZhuihONuoZ5BHkz2yW48cdp6LTBl0b0YXR2nvDdXPo621A4psIR2rgc6inIHPvPQIJ5O4BmvtUxqNelb3/QlUBx1H1pM7FqUIIkaedAIa6En//IlGiCZWmoeVVlIS5UgIo54sMMxk3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307231; c=relaxed/simple;
	bh=zUfQ6Ac0nrwSaKYV7dKuJuvLT10nF3CKBw/fgN+T8zM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZYk/fESv1B95rMQXeGU29Pnb5JbnkPzMuNOcV1Js2ZmTpcLCByNefBB8MpfIGUiKCt3jgvIb4buL6ItIJkRtyoP88r1K/mJyaafTGp81kwkam9+3zea++uZwXYnz4hRAvuW7kdF2DZDQIFRrAt++o9gd9v5wFXqAbugHtbt1keQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQFYTurq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQFYTurq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F0A1F000E9;
	Sun,  9 Aug 2026 20:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786307230;
	bh=Up/FlPnTKiaCjrcU72lSulLkVP9YsNTR+SXTdpiL4zQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dQFYTurqxJvq++93xWBJvS4B3fNeaL6f7yxPh/VkSTIO7gJCwbEJmlkB0xYpK9mSY
	 JUQLjLd+j3MwF/plR/EMgnBwGXS6izl7pejcRaI0xH1chHDWuGwXpEreXjYCRljR+U
	 VcIaANY+AbedpcpzT3dq1AF/3UO8O414JuuflPpth3Fq/WvyBemztI0To1TfUEDd0d
	 3IzEU5TbKjjdhJmy1P2pEB3YZHsxVa37P8UUjeanyC65+oclj3C3I4Zx9Xl2kuDAFG
	 pcfJjfgJD9LgrhFGpVwnxBza4Ov0/O6Yuz9adPQXsXC7TBPDXXYrJLJ4LeMPsmz54P
	 5SgUCofKzywhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/12] iommu: qcom_iommu: extract context bank
 programming into a helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-3-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <20260809-msm8974-iommu-upstream-v1-3-87f5cd492560@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 20:27:09 +0000
Message-Id: <20260809202710.15F0A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The `qcom_iommu` parameter in the new helper `qcom_iommu_program_ct=
x` is never used.

Pre-existing issues:
- [High] A use-after-free (UAF) condition exists on the error path of `qcom=
_iommu_init_domain` where a dangling pointer is left in `ctx->domain` and a=
ccessed by the IRQ handler.
--

--- Patch [3]: [PATCH 03/12] iommu: qcom_iommu: extract context bank progra=
mming into a helper ---
commit 7d60ff7e8f25f085f5b849ae6ddac1aa47c3809d
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: iommu: qcom_iommu: extract context bank programming into a helper

This patch extracts the inline context bank programming sequence into a new
helper function qcom_iommu_program_ctx(). It also stores the computed
register values into the qcom_iommu_ctx struct. This allows the registers to
be reprogrammed upon runtime resume for MSM8974 QSMMU instances.

> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/=
arm-smmu/qcom_iommu.c
> index 21d18ce67b982..5bbb51d9bd653 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c

[ ... ]

> @@ -213,6 +218,32 @@ static irqreturn_t qcom_iommu_fault(int irq, void *d=
ev)
>  	return IRQ_HANDLED;
>  }
> =20
> +static void qcom_iommu_program_ctx(struct qcom_iommu_dev *qcom_iommu,
> +				   struct qcom_iommu_ctx *ctx)
> +{

[Severity: Low]
Is the qcom_iommu parameter needed here? It does not appear to be used
anywhere inside this helper function.

> +	/* Disable context bank before programming */
> +	iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);

[ ... ]

> @@ -301,7 +313,9 @@ static int qcom_iommu_init_domain(struct iommu_domain=
 *domain,
>  		if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
>  			reg |=3D ARM_SMMU_SCTLR_E;
> =20
> -		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, reg);
> +		ctx->sctlr =3D reg;
> +
> +		qcom_iommu_program_ctx(qcom_iommu, ctx);
> =20
>  		ctx->domain =3D domain;
>  	}

[Severity: High]
This is a pre-existing issue, but does the error path in
qcom_iommu_init_domain() handle partially initialized context banks correct=
ly?

If an early iteration of the context bank setup succeeds, ctx->domain is se=
t:

drivers/iommu/arm/arm-smmu/qcom_iommu.c:qcom_iommu_init_domain() {
    ...
    qcom_iommu_program_ctx(qcom_iommu, ctx);
    ctx->domain =3D domain;
    ...
}

If a subsequent iteration fails, the function jumps to out_clear_iommu
but leaves ctx->domain pointing to the domain.

When the IOMMU core frees the domain, could a subsequent hardware fault
trigger a use-after-free when the IRQ handler dereferences it?

drivers/iommu/arm/arm-smmu/qcom_iommu.c:qcom_iommu_fault() {
    ...
    if (report_iommu_fault(ctx->domain, ctx->dev, iova, 0)) {
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-msm8974-io=
mmu-upstream-v1-0-87f5cd492560@oss.qualcomm.com?part=3D3
