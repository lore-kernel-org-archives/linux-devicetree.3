Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE7138C426
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307313; cv=none; b=JXJ2Ek+Mn6X8NaWs9XgCkvXJR8+qb9kRBPW/eSX96uP+DmRmiyIucNtnlVK9hx2M6/uu39/mGP6DpwmooRiO8KVEDanlJObMsjA/Dtt1bkvonytOGhSVkgrL3b15HMRX7KsCuJekUrIitpR8/WkfTMCSBev8I/RCnJIcNH+zppY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307313; c=relaxed/simple;
	bh=bzRy1qx+3jyencgsXFv1WtXsqsWTJ9YhNwog/Epg3jw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WISlUXx2+VwZ+5EwnJh8nhGG+9kxRwSec/IxvGWJR/pJKPIMM+4Qf9qjtcr3z3Mn8aKAQf/vbSFHcBSEHwMU6bR/QnhGo2ZerT2vNQVozDSIIz/uIW0zKl6k9rd5tCMJwtZBadAd4OrlQ6DJL3skmEGcDh5Ie8KkKV2S0Lsz4YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RodTPbSh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RodTPbSh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450B21F000E9;
	Sun,  9 Aug 2026 20:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786307311;
	bh=KAs85zeABWWCHDlY4ApVtCK5xtihOvFn2K5Fcry10Pc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RodTPbShBpeNHHd0PYAHnrgt2OYpmGN3PxQTQJtvJ69iFtIcpLNAkEYa5CzTUPYSZ
	 ZK6HvT3UFCOmiII/N2Is+0isSNm2t8Bi5x9E5nhfJBsEBlIUlrAqKfsx9nk7FRr209
	 KFGSboS9Tl50SpcSdaLOBkBjOcSZOYGhMfpF8uEiad486CHm3leKDn796B9y1bxsN2
	 Ip3116ON9hjz6ocqgcFPi2RMkBaj8UMA3wsGz3t9Pj2Dmiqho6AOdsyJeWCkt84kNf
	 MzjyI7RvC+WW9VVVdkqlkrJpY/rniZyDTSEgDqWNfzQO1lX72xX+ob4dNSvPrV88yf
	 ojE6TsjlJ758w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/12] iommu: qcom_iommu: restore context bank state
 after power collapse
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-7-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <20260809-msm8974-iommu-upstream-v1-7-87f5cd492560@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 20:28:30 +0000
Message-Id: <20260809202831.450B21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free and hardware page table corruption due to dangling =
`ctx->domain` on initialization error path.
--

--- Patch [7]: [PATCH 07/12] iommu: qcom_iommu: restore context bank state =
after power collapse ---
commit 4c924588306637fe44ecea534620e5e790b49aa8
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

iommu: qcom_iommu: restore context bank state after power collapse

This commit caches the computed context bank register values at attach
time and replays the global reset, stream mapping and context bank
programming on runtime resume. Instances opt in through the new
ctx_restore configuration flag.

> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/=
arm-smmu/qcom_iommu.c
> index 3b07c4cf23fe1..8e9488c47d5c1 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
[ ... ]
> @@ -1079,6 +1082,16 @@ static int __maybe_unused qcom_iommu_resume(struct=
 device *dev)
>  			return ret;
>  	}
> =20
> +	if (qcom_iommu->cfg && qcom_iommu->cfg->ctx_restore) {
> +		/* Restore context banks lost over power collapse */
> +		for (i =3D 0; i <=3D qcom_iommu->max_asid; i++) {
> +			struct qcom_iommu_ctx *ctx =3D qcom_iommu->ctxs[i];
> +
> +			if (ctx && ctx->domain && !ctx->secured_ctx)
> +				qcom_iommu_program_ctx(qcom_iommu, ctx);

[Severity: High]
This is a pre-existing issue, but could this new resume logic trigger a
use-after-free and corrupt hardware page tables if initialization previously
failed?

In drivers/iommu/arm/arm-smmu/qcom_iommu.c:qcom_iommu_init_domain(), the er=
ror
path frees the allocated page tables but fails to clear the ctx->domain poi=
nter
for context banks that were successfully processed before the error occurre=
d:

out_clear_iommu:
	free_io_pgtable_ops(pgtbl_ops);
	qcom_domain->iommu =3D NULL;

If a device with multiple context banks fails initialization midway (for ex=
ample,
during a firmware SCM call for a subsequent bank), the error path leaves
ctx->domain dangling and the page tables freed.

Upon the next PM runtime resume, this new loop in qcom_iommu_resume() sees =
the
truthy ctx->domain and programs the hardware with the stale ctx->ttbr0, cau=
sing
the IOMMU to use freed memory for DMA translation page tables.

> +		}
> +	}
> +
>  	return ret;
>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-msm8974-io=
mmu-upstream-v1-0-87f5cd492560@oss.qualcomm.com?part=3D7
