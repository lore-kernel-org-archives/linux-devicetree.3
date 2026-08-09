Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824D137FF70
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307634; cv=none; b=pqkBBjT/4t0szeqj3eIxA43GLdxPxTazKD7d5V4nRVklbOfsMjgZV5x9mKvagQ2w+GP7BvlxGeVy42GIN3D9l5FcQ3y/61knLMjfBn5THdyYMXho35aE4DUuxM9OD5fiFgufjUeW7Q+aMZn5CJ8jSa3DXvgLnmAOxihd8Jm57Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307634; c=relaxed/simple;
	bh=m0wyVWXCEyxD5OAdEGrY4hw1WwUeZiU/ZumtrshHhSU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yg4ycbYT8VqI1842XQG3B1hm/YQOwOrWPcfk9OCZCygYJ3Oah68/0Gn10wkxb8brazFXah503qPSGWPq3ZVhbqJdt317Jr7rixF61qSGH4DHT2lJ3VkKIdi/0DuDCZ10DnTcauHIFJy0fkdU5sOOWxqCNq0GtGhWBXLFwhYuytg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W6aY6Dq8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6aY6Dq8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C22A1F000E9;
	Sun,  9 Aug 2026 20:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786307632;
	bh=2W4dwVWTvGUtqe2yG0ts+yArYXUswxSJ3rLkUkWOZy4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W6aY6Dq8rrGFr/lXaQGlW+Jw3LLMi5Nmr8wWinPjiLLE/LUKLpp+fv10dCrhdIhRy
	 BZ7FRQ2zubN1G4SYCaAx59xx9Da6LiTlqr0p1orkJql8tn4g+a5ONPYKhf/zx6JJ2f
	 WlT/HrG+uwHy3+eNHbggfW1M5Ag/Q6bqD1aadKceX01XgliyrzNFg3twtWWbj+F5eV
	 nsvW7dLxk4dGtvQyu2Mm7TE2+/dQLAaBSaA4T5SgALzckPFGSG6J/sxtKXCgP8Fx26
	 FFUQI1oHZMjXLLbZIeeKcFMtZULpMjKihC2KevcOjzw3xEeraHOU6x+pm8DXm9DNcF
	 6YRgiE802CpHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/12] iommu: qcom_iommu: halt the micro-MMU while
 programming context banks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-8-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <20260809-msm8974-iommu-upstream-v1-8-87f5cd492560@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 20:33:51 +0000
Message-Id: <20260809203351.9C22A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Concurrent domain attachments and context programming cause race c=
onditions in the global micro-MMU halt state, leading to premature unhaltin=
g and data races on the control register.
- [Medium] Spinning for up to 100ms in a tight loop using `cpu_relax()` ris=
ks degrading system responsiveness on hardware timeout.
--

--- Patch [8]: [PATCH 08/12] iommu: qcom_iommu: halt the micro-MMU while pr=
ogramming context banks ---
commit b970b685e94c99403661414d09a198b270daac8a
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

iommu: qcom_iommu: halt the micro-MMU while programming context banks

This commit adds a hardware handshake to halt the micro-MMU before
reprogramming context bank registers. It introduces qcom_iommu_halt()
and qcom_iommu_unhalt() to wrap the context programming sequence.

> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/=
arm-smmu/qcom_iommu.c
> index 8e9488c47d5c1..f27f8722ee640 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c

[ ... ]

> @@ -339,9 +349,41 @@ static int qcom_iommu_reset_ns(struct qcom_iommu_dev=
 *qcom_iommu)
>  	return 0;
>  }
> =20
> +/*
> + * Halting the micro-MMU quiesces the translation front-end: it stops new
> + * client transactions being accepted and waits for the outstanding ones=
 to
> + * retire, so that the context bank registers can be reprogrammed without
> + * in-flight traffic racing the change.
> + */
> +static void qcom_iommu_halt(struct qcom_iommu_dev *qcom_iommu)
> +{
> +	void __iomem *reg =3D qcom_iommu->global_base + QCOM_IOMMU_MICRO_MMU_CT=
RL;
> +	u32 val;
> +
> +	if (!qcom_iommu->cfg || !qcom_iommu->cfg->halt)
> +		return;
> +
> +	writel_relaxed(readl_relaxed(reg) | MICRO_MMU_CTRL_HALT_REQ, reg);

[Severity: High]
Could this read-modify-write on the global MICRO_MMU_CTRL register race if
devices mapped to different IOMMU domains are probing or attaching
concurrently?

> +
> +	if (readl_poll_timeout(reg, val, val & MICRO_MMU_CTRL_IDLE, 0, 100000))

[Severity: Medium]
Does setting the delay parameter to 0 cause this to spin continuously in a
tight cpu_relax() loop for up to 100ms?

If the hardware becomes unresponsive, especially in callers like
qcom_iommu_resume() which loop over multiple context banks, could this block
the CPU for over a second in a non-preemptible kernel?

> +		dev_err(qcom_iommu->dev, "timeout waiting for micro-MMU halt\n");
> +}
> +
> +static void qcom_iommu_unhalt(struct qcom_iommu_dev *qcom_iommu)
> +{
> +	void __iomem *reg =3D qcom_iommu->global_base + QCOM_IOMMU_MICRO_MMU_CT=
RL;
> +
> +	if (!qcom_iommu->cfg || !qcom_iommu->cfg->halt)
> +		return;
> +
> +	writel_relaxed(readl_relaxed(reg) & ~MICRO_MMU_CTRL_HALT_REQ, reg);

[Severity: High]
If qcom_iommu_program_ctx() is called concurrently for different domains,
could this unconditional clear prematurely unhalt the micro-MMU while anoth=
er
thread is still actively programming a different context bank?

Since this modifies the global micro-MMU state without a device-level lock =
or
reference count, does this risk allowing in-flight traffic to race against =
the
reconfiguration?

> +}
> +
>  static void qcom_iommu_program_ctx(struct qcom_iommu_dev *qcom_iommu,
>  				   struct qcom_iommu_ctx *ctx)
>  {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-msm8974-io=
mmu-upstream-v1-0-87f5cd492560@oss.qualcomm.com?part=3D8
