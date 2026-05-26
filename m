Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EB73B19B6
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 16:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779812512; cv=none; b=izur9fUnYaaK4TZqpL+GjMHAkjTqXyjLl6+HqTDvEP6DlT1uVIGI0jjoDOPOQEpAtQcECgCgAnVyCYLApZQR52OPAGiWBsbAcU/i2eUpxvS1Op7zvu5NMQ6dMfNTW9zFz4aGqQIQjrF3czXiwCawU/bZf2LKk0uA5Tgq3Y5cS7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779812512; c=relaxed/simple;
	bh=MQdkSaAl+BwrjhiObv7Ijtd/wZj/Lz0C2s4LgYNdztw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XFTh54Z7UN7Obgoilq4LBQEfyDRuxZqVHxrtN/QXma5yf8PTg+dn8az9Ql+htgeZ396syTCL7S/7xmNlHrkWRDSz42wpK1QrDg8u2H8m9CL3T5c3Y1q8Bd/vY+IBmextWQ6Jkj5PWxWR5jcb5oMBCm5OOsWkd110b2XXrIZtGro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQD/pHX9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQD/pHX9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF6541F00A3A;
	Tue, 26 May 2026 16:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779812511;
	bh=3uCwvRDAIKTL9h7uHE1dGJBmSxXs8lfILFtB9uwIb+k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oQD/pHX9s0JWZ3y+uMrVDwXw/lEb6nmQIRqdXCyPeHq42NvM5U+etyXoz3dG8OAJ0
	 gf4/bG6bOVvfc5mt+nSPykWgHKXhiSkmqctQPPGZHh5IgzPk21rboPfSBXqKcj0bBj
	 cIEck/+kaslRGN173CDYiaOfc9yOkPUFzQJZfLJIpYFB+59RTPF5WUQDthN7Djpi4n
	 rMLNPEHbajFqUg1TqhSxe+6L1wbK4RG6gV6yTScNALjAQmTGa6IufZEB6h5W+F5rQm
	 GQOJbX/QxvFqHiakzCnLhnwNLMibUTJqCrklER6a8q1vVxrOF/qkHtwBGvZjSY8s1d
	 Bu3p2OLKMFD0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth
 voting support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bibek Kumar Patro" <bibek.patro@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
References: <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 16:21:50 +0000
Message-Id: <20260526162150.DF6541F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Missing cleanup of clock and interconnect resources on probe error=
 paths.
- [High] Failures to enable the interconnect bandwidth vote are ignored, ri=
sking a system crash.
- [Medium] Interconnect bandwidth is voted after clocks are enabled during =
probe, contradicting architectural requirements and resume ordering.

Pre-existing issues:
- [High] Shared interrupt handlers access hardware registers without verify=
ing if the device is active, violating PM guidelines and causing crashes.
- [High] The IOMMU device is exposed to the system before Runtime PM is ful=
ly initialized, creating a race condition that can lead to a PM usage count=
er underflow.
--

commit a35c4344b83f53cca1914e7921a505dbdaa63eb5
Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: iommu/arm-smmu: Add interconnect bandwidth voting support

This commit adds support for an optional interconnect path to the arm-smmu
driver. It votes for bandwidth while the SMMU is active to prevent
intermittent register access failures during sleep/wakeup transitions.

> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.c
> index 0bd21d206eb3e..07c7e44ec6a5b 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
[ ... ]
> @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_de=
vice *smmu)
[ ... ]
> +static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
> +{
> +	if (smmu->icc_path)
> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
> +				   ARM_SMMU_ICC_PEAK_BW_HIGH));
> +}

[Severity: High]
Does this code need to propagate the return value of icc_set_bw() instead of
ignoring it?

If the bandwidth vote fails due to aggregation failures or invalid constrai=
nts,
the hardware might lack the vote required for register access.

Proceeding to access SMMU registers in arm_smmu_device_probe() or
arm_smmu_runtime_resume() without the required bandwidth vote could result =
in
an unrecoverable bus fault.

Could we handle the error and propagate it to fail the probe or resume
sequence gracefully?

[ ... ]
> @@ -2189,6 +2224,17 @@ static int arm_smmu_device_probe(struct platform_d=
evice *pdev)
>  	if (err)
>  		return err;
> =20
> +	/*
> +	 * Acquire and vote the interconnect path before accessing any SMMU
> +	 * registers (including ARM_SMMU_GR0_ID0 in arm_smmu_device_cfg_probe).
> +	 */
> +	err =3D arm_smmu_icc_get(smmu);

[Severity: Medium]
Could this ordering cause an architectural violation?

The commit message notes that the interconnect must have an active vote
whenever the adreno_smmu block is powered on. In arm_smmu_runtime_resume(),
this is handled correctly by calling arm_smmu_icc_enable() before
clk_bulk_enable().

However, in arm_smmu_device_probe(), clk_bulk_prepare_enable() is called
just before this code, before arm_smmu_icc_get() and arm_smmu_icc_enable().

Would it be better to match the resume path ordering to ensure the SMMU clo=
cks
are not powered on without the required interconnect bandwidth vote?

> +	if (err) {
> +		clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
> +		return err;
> +	}
> +	arm_smmu_icc_enable(smmu);
> +
>  	err =3D arm_smmu_device_cfg_probe(smmu);
>  	if (err)
>  		return err;

[Severity: High]
Are we leaking the clock references and interconnect vote on subsequent err=
or
paths?

If arm_smmu_device_cfg_probe() or other subsequent initialization steps fai=
l,
the function returns directly without calling clk_bulk_disable_unprepare() =
or
arm_smmu_icc_disable().

Should there be a cleanup path that properly releases these resources when
probe fails?

[Severity: High]
This is a pre-existing issue, but does arm_smmu_device_probe() expose the
IOMMU device to the system before Runtime PM is fully initialized?

Later in arm_smmu_device_probe(), iommu_device_register() is called before
pm_runtime_enable(). Registering the IOMMU makes it visible to the system,
allowing concurrent device probes to attach to it and trigger mapping
operations, which call arm_smmu_rpm_get().

Since pm_runtime_enable() hasn't run yet, pm_runtime_enabled() evaluates to
false, and arm_smmu_rpm_get() returns 0 without incrementing the usage coun=
ter.

If the probe thread subsequently executes pm_runtime_enable(), the concurre=
nt
thread's matching arm_smmu_rpm_put() will see pm_runtime_enabled() as true =
and
decrement the counter, causing a structural underflow.

[ ... ]
> @@ -2308,6 +2360,7 @@ static int __maybe_unused arm_smmu_runtime_suspend(=
struct device *dev)
>  	struct arm_smmu_device *smmu =3D dev_get_drvdata(dev);
> =20
>  	clk_bulk_disable(smmu->num_clks, smmu->clks);
> +	arm_smmu_icc_disable(smmu);
> =20
>  	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but does disabling the interconnect vote and
clocks here expose a crash in the shared interrupt handler?

The driver requests its IRQs (such as arm_smmu_global_fault) using the
IRQF_SHARED flag, and arm_smmu_global_fault() reads hardware registers
directly without checking the power state.

Since the handler doesn't use pm_runtime_get_if_active() to verify the devi=
ce
is active, if another device on the shared IRQ line triggers an interrupt
while the SMMU is suspended, won't the SMMU's handler access unclocked and
unvoted hardware, leading to a synchronous bus abort?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-smmu_inter=
connect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com?part=3D2
