Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3382036683B
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307343; cv=none; b=ZaTK3k7+F0I+UrX/e4DVMGOk4ugeg7F7ohtSDvLrOO/dRVcziKZFPEKIyigA+CwVH0D8pMWNp82UjqzVv74RCSCOJ0kTKNk5N38pxnlK5ZmV6jcHX6jpTZzzTcciUubbvBuRvsrH64GchAV0UhZzAqKNL2PvIXznlkTrF/8GO+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307343; c=relaxed/simple;
	bh=cUJSlbzdEiUs9kcwT3YxzKFbfjKWE1LiCA+aGup6QXc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RQxjgmmf0XfFNvSVZLCI6YIMehw8OX1bdmuJUiNosV1q6QdDa6EHtg56+27xMlUDPEjeYTH+R3W23HZIecyCrgRiNhkQ/zhVWQJDcPtPBMfqDA4EU3NvldiJFsG4M8p26g9nBGS9dFv/1354UvsyM7LSBssR+oCX+geQdCTKOmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PkG2NBSc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PkG2NBSc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871E61F000E9;
	Sun,  9 Aug 2026 20:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786307341;
	bh=ZxFiLVFtPHZAEtrvX7PgHJgtGMZO/Toy9rG4trE7jIY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PkG2NBSctBmg7h3EPo6JoZzZdOZDhRJ+27K97auqDPtmuzZAL+Dvduf+Orhg6ZBi3
	 XIBh+67pTJr9je8onF+lIp6o+eN5EPm78ZcoOTCqrFAZ7DhH1GC9Glk5Nls/jA5oUw
	 eGPoYy8/R2j/7Sp3+BluZlwHR7dg8tUUUzqqELfj9v2j2RxLMZnPdxsKzdjL5mJHo+
	 7FNZas1JgzRqTdEQqO8fDw5GbkNB/KMy2kjQSJfcd7gLAsQh8sV1JxhrMnsIQ8Q8nv
	 EnWpKzPCV8wRtPiniKaepFWaNdP31lYU6TFhl+Pg0/V1MPiwxJPZycDdpMfzCRAXsd
	 96qGt7w6CJG/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/12] iommu: qcom_iommu: handle the SMMU global
 register space
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-5-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <20260809-msm8974-iommu-upstream-v1-5-87f5cd492560@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 20:29:00 +0000
Message-Id: <20260809202901.871E61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Context bank state is not reprogrammed upon runtime resume, leadin=
g to translation failures for instances in power domains.
- [High] Skipping the FSR clear at probe time allows a pending bootloader f=
ault to trigger an interrupt before `ctx->domain` is set, causing a NULL po=
inter dereference.

Pre-existing issues:
- [High] The shared IRQ handler accesses hardware registers without checkin=
g if the device is active, and there is no IRQ synchronization in the suspe=
nd path.
- [High] Unbinding the parent IOMMU device causes a NULL pointer dereferenc=
e in the child context device's remove callback.
--

--- Patch [5]: [PATCH 05/12] iommu: qcom_iommu: handle the SMMU global regi=
ster space ---
commit bf26052ef6d0329129f71ba618d88c9f30a2725a
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

iommu: qcom_iommu: handle the SMMU global register space

On msm8974 the OS has to access the SMMU global register space: the
non-secured instances need it fully programmed and even the TZ-managed
ones expose OS-writable implementation-defined registers in it. The
driver only knows about the msm8916-style "SMMU local" region in
resource 0, and has no accessors for the global space.

> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/=
arm-smmu/qcom_iommu.c
> index 77c01f217d7ea..428b18697244c 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c

[ ... ]

> @@ -213,6 +256,35 @@ static irqreturn_t qcom_iommu_fault(int irq, void *d=
ev)
>  	return IRQ_HANDLED;
>  }
> =20

[Severity: High]
This is a pre-existing issue, but shouldn't the shared IRQ handler check if
the device is active before accessing hardware registers?

The interrupt line is registered with IRQF_SHARED. If another device sharing
the line asserts an interrupt while the IOMMU's power domain is suspended,
qcom_iommu_fault() executes and accesses ARM_SMMU_CB_FSR without waking the
device via pm_runtime_get_if_active(). Accessing unpowered MMIO registers
can trigger an asynchronous external abort or bus stall.

Also, qcom_iommu_suspend() disables clocks without calling
synchronize_irq(), allowing race conditions if the shared handler is running
mid-flight.

> +static void qcom_iommu_program_ctx(struct qcom_iommu_dev *qcom_iommu,
> +				   struct qcom_iommu_ctx *ctx)
> +{
> +	/* Disable context bank before programming */
> +	iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);

[Severity: High]
Is it necessary to reprogram this cached state during runtime resume?

When the PM domain collapses and subsequently resumes, the non-secure conte=
xt
banks remain unconfigured, breaking any further DMA translations.

Looking at qcom_iommu_resume(), it restores secure configurations but
doesn't restore the OS-managed (non-secure) context banks by looping over
them and calling qcom_iommu_program_ctx().

[ ... ]

> @@ -749,9 +773,10 @@ static int qcom_iommu_ctx_probe(struct platform_devi=
ce *pdev)
>  		ctx->secured_ctx =3D true;
> =20
>  	/* clear IRQs before registering fault handler, just in case the
> -	 * boot-loader left us a surprise:
> +	 * boot-loader left us a surprise.  Instances with a power domain
> +	 * may not be accessible yet; they are reset at first resume.
>  	 */
> -	if (!ctx->secured_ctx) {
> +	if (!ctx->secured_ctx && !qcom_iommu->cfg) {

[Severity: High]
If a bootloader fault is pending and we bypass clearing the Fault Status
Register (FSR) here, could it trigger an interrupt before ctx->domain is se=
t?

When devm_request_irq() enables the shared IRQ line a few lines later, the
pending interrupt could fire immediately. The handler qcom_iommu_fault()
executes and calls report_iommu_fault(ctx->domain, ...).

Because ctx->domain is only assigned later during device attachment
(qcom_iommu_init_domain), it is currently NULL, which report_iommu_fault()
will dereference.

>  		ret =3D pm_runtime_resume_and_get(dev->parent);
>  		if (ret)
>  			return ret;

[ ... ]

[Severity: High]
This is a pre-existing issue, but can unbinding the parent IOMMU device cau=
se
a NULL pointer dereference in the child context device's remove callback?

When the parent driver is unbound, qcom_iommu_device_remove() sets its priv=
ate
data to NULL via platform_set_drvdata(pdev, NULL). Subsequently, devres tea=
rs
down the child devices, invoking qcom_iommu_ctx_remove().

This child callback calls dev_get_drvdata(pdev->dev.parent) to retrieve the
parent's data, which is now NULL, and immediately dereferences it:

drivers/iommu/arm/arm-smmu/qcom_iommu.c:qcom_iommu_ctx_remove() {
    ...
    struct qcom_iommu_dev *qcom_iommu =3D dev_get_drvdata(pdev->dev.parent);
    ...
    qcom_iommu->ctxs[ctx->asid] =3D NULL;
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-msm8974-io=
mmu-upstream-v1-0-87f5cd492560@oss.qualcomm.com?part=3D5
