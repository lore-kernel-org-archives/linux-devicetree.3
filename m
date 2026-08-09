Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315F8342539
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307996; cv=none; b=pu6i6Q1jUZkTT69WwheJijA3Rzl/IXlA1jVKi2jEGMvv7rMlB2nuZHVFyU5SYvIgZM4gNiY+864MlHAy992mXjrsB/EBBzAf11/EvjEUvwbfQXeWYZJydPStxE0fIkSidmgpX0AaZ+3PV9Xz3rEsTQ4Fqm3Cs6s+eeOg/7g9kkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307996; c=relaxed/simple;
	bh=k4t813JB2/SqLCbanQ5nev7Sian9D5yTwTcXLrP3lg8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rWHDMOaWTw+TteEkzlBGVz2PRPzlZQrIWThHO7t3SZFaMDBHasQYngQyjie1GR9DVLR38V0NF8PM8Z6sDweYMVpJU49X/sZs1Prs+orzQ6DADg1RI0ekGCKVZ0l7JIxdQmAaPUtZ9j7tYcPilA4KeyEKfEJkj/s0s0Ee80DjH20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THZHpQey; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THZHpQey"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F341F000E9;
	Sun,  9 Aug 2026 20:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786307994;
	bh=/8p62zjD2nL5A3drPJHXEwvJiib697T6kcqVGpxLP/Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=THZHpQeyCrkudGlQg+FLQPD8pnMBpAx1RHxVKzTFGAiTpS9WGrG/uwMUuoPsDnUkE
	 QpwQo1e4m17fqFECgNcd4CBNikcaARq9Gei6YEsRL/Gkjufh8N+dTE10FIXbMvcPAa
	 oC17qfqbu+7sgjMPxAlA5lVF8m5oSRyfr/yWOpAzBGweorqKOe2ss27GMG3GFR+qQm
	 RrZ5nVaaOgFoCnyrmtJVyq2v9MZjB6nP+u/+b5SZ1eEYQnwo9SPrncIBUWPUYyOwWk
	 bDCMNtsdpmRnf7pjfJzKDPuKz12MR2b64copgfRmaFkWVxD+VSgazJOhGTDDjVNu0/
	 PkVu8AkHb8A1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/12] iommu: qcom_iommu: support non-TZ-managed
 instances
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-6-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <20260809-msm8974-iommu-upstream-v1-6-87f5cd492560@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 20:39:53 +0000
Message-Id: <20260809203954.71F341F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Missing configuration data in `qcom_iommu_of_match` makes the non-=
secure code path unreachable.
- [High] Context bank registers are not restored during runtime resume for =
non-secure IOMMU instances.

Pre-existing issues:
- [High] Dangling pointer and potential UAF when `qcom_iommu_init_domain()`=
 fails halfway through context bank initialization.
- [High] The shared interrupt handler `qcom_iommu_fault` can be invoked whi=
le the device is suspended or before a domain is attached, leading to unclo=
cked register accesses and a NULL pointer dereference.
- [High] `qcom_iommu_unmap` calls `pm_runtime_get_sync`, which sleeps, but =
IOMMU unmap operations can be invoked from atomic context.
--

--- Patch [6]: [PATCH 06/12] iommu: qcom_iommu: support non-TZ-managed inst=
ances ---
commit e923920b01d0c5363e8c876cd9db3360e29f7e5a
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
iommu: qcom_iommu: support non-TZ-managed instances

This patch adds non-secure programming mode support for MSM8974 GPU IOMMU
instances that are not managed by TZ. It configures the global space at
runtime resume, clears global faults, and sets up stream mapping instead of
relying on secure calls.

> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/=
arm-smmu/qcom_iommu.c
> index 428b18697244c..3b07c4cf23fe1 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
[ ... ]
> @@ -327,7 +411,7 @@ static int qcom_iommu_init_domain(struct iommu_domain=
 *domain,
>  	for (i =3D 0; i < fwspec->num_ids; i++) {
>  		struct qcom_iommu_ctx *ctx =3D to_ctx(qcom_domain, fwspec->ids[i]);
> =20
> -		if (!ctx->secure_init) {
> +		if (!qcom_iommu->non_secure && !ctx->secure_init) {

[Severity: High]
This is a pre-existing issue, but is there a dangling pointer and potential
use-after-free when qcom_iommu_init_domain() fails halfway through context
bank initialization?

If context bank initialization fails (for example, qcom_scm_restore_sec_cfg=
()
fails on a subsequent iteration), the function returns an error without
clearing ctx->domain for the already processed context banks. The IOMMU core
then frees the domain memory.

If a hardware fault interrupt fires, will qcom_iommu_fault() dereference the
freed ctx->domain?

>  			ret =3D qcom_scm_restore_sec_cfg(qcom_iommu->sec_id, ctx->asid);
>  			if (ret) {
>  				dev_err(qcom_iommu->dev, "secure init failed: %d\n", ret);
[ ... ]
> @@ -907,8 +991,12 @@ static int qcom_iommu_device_probe(struct platform_d=
evice *pdev)
> =20
>  	if (of_property_read_u32(dev->of_node, "qcom,iommu-secure-id",
>  				 &qcom_iommu->sec_id)) {
> -		dev_err(dev, "missing qcom,iommu-secure-id property\n");
> -		return -ENODEV;
> +		if (!qcom_iommu->cfg) {
> +			dev_err(dev, "missing qcom,iommu-secure-id property\n");
> +			return -ENODEV;
> +		}

[Severity: High]
Does the missing configuration data in qcom_iommu_of_match make this
non-secure code path unreachable?

During device probe, of_device_get_match_data() returns NULL because the ne=
wly
introduced compatibles (like qcom,msm8974-gpu-iommu) and their struct
qcom_iommu_cfg data were not added to the qcom_iommu_of_match array in this
patch.

This causes qcom_iommu->cfg to evaluate to NULL, unconditionally failing
with -ENODEV here when probing a non-secure instance.

> +		/* The secure world does not manage this instance at all */
> +		qcom_iommu->non_secure =3D true;
>  	}
> =20
>  	if (qcom_iommu_has_secure_context(qcom_iommu)) {
[ ... ]
> @@ -981,8 +1069,15 @@ static int __maybe_unused qcom_iommu_resume(struct =
device *dev)
>  	if (ret < 0)
>  		return ret;
> =20
> -	if (dev->pm_domain)
> -		return qcom_scm_restore_sec_cfg(qcom_iommu->sec_id, 0);
> +	if (qcom_iommu->non_secure) {
> +		ret =3D qcom_iommu_reset_ns(qcom_iommu);
> +		if (ret)
> +			return ret;

[Severity: High]
Are context bank registers restored during runtime resume for non-secure
IOMMU instances?

When the non-secure IOMMU is runtime resumed (e.g., after GDSC power
collapse), qcom_iommu_resume() restores the global registers via
qcom_iommu_reset_ns(), but it seems to completely omit iterating over and
reprogramming the attached context banks.

Since the context bank child devices lack PM operations, do they remain
disabled (SCTLR =3D 0) after resume, causing translation faults for all
non-secure instances?

> +	} else if (dev->pm_domain) {
> +		ret =3D qcom_scm_restore_sec_cfg(qcom_iommu->sec_id, 0);
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	return ret;
>  }

[Severity: High]
This is a pre-existing issue, but can the shared interrupt handler
qcom_iommu_fault() be invoked while the device is suspended or before a
domain is attached, leading to unclocked register accesses and a NULL
pointer dereference?

In qcom_iommu_ctx_probe(), a shared IRQ is requested before a domain is
attached:

drivers/iommu/arm/arm-smmu/qcom_iommu.c:qcom_iommu_ctx_probe() {
    ...
	ret =3D devm_request_irq(dev, irq,
			       qcom_iommu_fault,
			       IRQF_SHARED,
    ...
}

If another device sharing the IRQ fires, qcom_iommu_fault() executes and
accesses ARM_SMMU_CB_FSR. If the device is unclocked, this crashes the bus.

If clocked and a bootloader fault is pending, it dereferences a NULL
ctx->domain. The target patch seems to explicitly bypass clearing pending
bootloader faults for non-secure instances when qcom_iommu->cfg is present:

drivers/iommu/arm/arm-smmu/qcom_iommu.c:qcom_iommu_ctx_probe() {
    ...
	if (!ctx->secured_ctx && !qcom_iommu->cfg) {
		ret =3D pm_runtime_resume_and_get(dev->parent);
    ...
}

Will this ensure the crash triggers immediately upon shared IRQ firing?

[Severity: High]
This is a pre-existing issue, but does qcom_iommu_unmap() call
pm_runtime_get_sync() which sleeps, even though IOMMU unmap operations can
be invoked from atomic context?

The DMA API invokes the IOMMU unmap operation from an atomic context
(e.g., interrupt handlers):

drivers/iommu/arm/arm-smmu/qcom_iommu.c:qcom_iommu_unmap() {
    ...
	pm_runtime_get_sync(qcom_domain->iommu->dev);
	spin_lock_irqsave(&qcom_domain->pgtbl_lock, flags);
    ...
}

Because the device is not marked with pm_runtime_irq_safe(),
pm_runtime_get_sync() acquires a mutex and sleeps. Can this lead to a "BUG:
sleeping function called from invalid context" panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-msm8974-io=
mmu-upstream-v1-0-87f5cd492560@oss.qualcomm.com?part=3D6
