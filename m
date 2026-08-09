Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D601237FF70
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307327; cv=none; b=NL3+mqmCQP42qHqJQyeV1lzyVv/tCCg8vJZV+CjiTXv4xTRFc3GWY3EOn/Qb7VNGAe89dDcFBsZsxD+K//TlMJXdRcFZYRTpjCdHhGR9CP13Mh7+PjqKbLuuJr/WJoFwm1KE4+7ciB2fAHBm49999cwDDsjTEDZkEsXAdWxRyG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307327; c=relaxed/simple;
	bh=dZ1WYMr5sZerJ3NH/9WMMIv3ZzCZFVzzvdQO/LiZk9w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u12yyuAYcX0MO6SYoDnXtAhslKqrHJ6Szpn6sFpq3pRv/qm56wDTSq0Vj1aF3ZjY088ryK8C4/f1eDIHpZldt253FR3S4KHXvI8ac2Q2SYkf+ZWWaIftU7nwpwSKNwVH9dxvb5tKShUZMa8eVxMVj3XeAAyKv9mxbyIaSDIklHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1YMEy91; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1YMEy91"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4141F000E9;
	Sun,  9 Aug 2026 20:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786307325;
	bh=gV3D5z+nkrUkR6XfyHcwF+lj2t4dVzyN3Ecp1l7d7js=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W1YMEy916MHT+SC3Q7sgOrxsSHdQFovUQ5ymjb5Cd4HahXrxTcD6Zxxf7emhpMJJ3
	 o9PhfpvzmOjpEG7BHUkRDuu5I9CtDgQF2adasMQlXdDjZB/Eeuj4+5LMERy3O+muoz
	 2OgqGLd0QIi8JGtbCh6M4qBZ1oVhqIqUNuGR4EbVDmblatsss7B4lITFrmigMSyGdy
	 RYYR6su3u6FTxX+ZD/fNVVoSEPjrb/ietD86bvlqQvyOEhyiecHML1ZVyexQYllqSO
	 BayDmGsgEHHKQOU0BEqnO9/ap9yJYmYFHuFz25rFB3H6uRQEhC4Nzrp2Wb4rSN8Oy9
	 1eBQo3B30ZU4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/12] iommu: qcom_iommu: add the MSM8974 instances
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-11-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <20260809-msm8974-iommu-upstream-v1-11-87f5cd492560@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 20:28:44 +0000
Message-Id: <20260809202845.3E4141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The commit message claims to add per-instance configurations for=
 five MSM8974 IOMMUs (explicitly mentioning camera blocks), but only three =
are provided.
- [Low] The Venus IOMMU is configured to halt the micro-MMU, but the commit=
 message only justifies this behavior for the display (MDP) IOMMU.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the qcom_iommu_f=
ault interrupt handler accesses device hardware registers directly without =
checking the device's PM state.
--

--- Patch [11]: [PATCH 11/12] iommu: qcom_iommu: add the MSM8974 instances =
---
commit bfa29c5d93fde62303c2c0ea8deeb5f5b59f6431
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

iommu: qcom_iommu: add the MSM8974 instances

This commit adds per-instance configurations for MSM8974 IOMMUs. It configu=
res
them to terminate faulting transactions rather than stalling.

> Add the per-instance configurations for the five MSM8974 IOMMUs. MDP and
> Venus are TZ-secured (SCM secure IDs 1 and 0), so only their context
> banks are programmed, like on MSM8916. GPU is fully OS-managed. The
> stream ID maps come from the downstream MSM8974-v2 DT. All instances use
> the short-descriptor pagetable format with the AFE quirk.

[Severity: Medium]
The commit message claims to add per-instance configurations for five
MSM8974 IOMMUs, but only three are provided in this patch. Are the other
instances missing from the patch, or does the commit message need updating?

> All instances terminate faulting transactions rather than stalling them,
> as downstream does. The display IOMMU also halts the micro-MMU while its
> context banks are programmed: a hung GPU cannot drain, so halting it
> during GPU recovery resets the SoC.

[Severity: Low]
Does the Venus IOMMU also need to halt the micro-MMU? The commit message
only justifies this behavior for the display (MDP) IOMMU, but the Venus
configuration in msm8974_venus_cfg sets halt =3D true. Could the commit
message be expanded to document this?

> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/=
arm-smmu/qcom_iommu.c
> index 9523ae95fa125..bc7d692a20436 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c

[ ... ]

> +static const struct qcom_iommu_cfg msm8974_venus_cfg =3D {
> +	.halt =3D true,
> +	.no_stall =3D true,
> +	.fmt =3D ARM_V7S,
> +	.no_afe =3D true,
> +	.ctx_restore =3D true,
> +	.bfb =3D msm8974_venus_bfb,
> +	.num_bfb =3D ARRAY_SIZE(msm8974_venus_bfb),
> +};

[ ... ]

>  static const struct of_device_id qcom_iommu_of_match[] =3D {
>  	{ .compatible =3D "qcom,msm-iommu-v1" },
>  	{ .compatible =3D "qcom,msm-iommu-v2" },
> +	{ .compatible =3D "qcom,msm8974-gpu-iommu", .data =3D &msm8974_gpu_cfg =
},
> +	{ .compatible =3D "qcom,msm8974-mdp-iommu", .data =3D &msm8974_mdp_cfg =
},
> +	{ .compatible =3D "qcom,msm8974-venus-iommu", .data =3D &msm8974_venus_=
cfg },
>  	{ /* sentinel */ }
>  };

[Severity: High]
This is a pre-existing issue, but the qcom_iommu_fault interrupt handler
accesses hardware registers directly without checking the device PM state:

drivers/iommu/arm/arm-smmu/qcom_iommu.c:qcom_iommu_fault() {
    ...
	fsr =3D iommu_readl(ctx, ARM_SMMU_CB_FSR);

	if (!(fsr & ARM_SMMU_CB_FSR_FAULT))
		return IRQ_NONE;
    ...
}

Because the interrupt is shared (IRQF_SHARED), an interrupt from another
device on the same line could trigger this handler while the IOMMU is in a
suspended PM state. Can reading from the unpowered hardware register
ARM_SMMU_CB_FSR cause a bus stall or return 0xffffffff? Should the handler
use pm_runtime_get_if_active before accessing the registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-msm8974-io=
mmu-upstream-v1-0-87f5cd492560@oss.qualcomm.com?part=3D11
