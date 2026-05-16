Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7568B405C57
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 13:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778936572; cv=none; b=Hq/XjOWKOmz6+qWbUqidTOMyPOqiFBRGC7BmBEhbF0wjcd0JEeeJK9N9Tsu63Ae0qHecCm/yp8bQIPZdf7rPW0tZOS16t6kYQGsNEtoNKJ+GgO4vloVaUsm/vPlH2AQsgiR8wbBeRalT+CM57MfjTzT+qAcEGLrl0OW4vzacLGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778936572; c=relaxed/simple;
	bh=oODo/EnbaVVIDQlTGUxH7PkXLWtZXAnUCsb+faLkpOE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T+cI6TprdB+xeOa5VGhr8v3Go5bL+ov374Cl+lRflaTA6l1ANowx2SL7K+OEgdWSmLMgH0HwcTZEKqcD72WBvFr1KRJccyhvn1STIUv+YPfwL+XRlCpkVjyh5O0dzoiw9MsAipZw1TWtPJFz8TMGcRLv810+WOffKhQBWIq/JBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nD6vGFu3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nD6vGFu3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED6AC2BCB3;
	Sat, 16 May 2026 13:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778936572;
	bh=oODo/EnbaVVIDQlTGUxH7PkXLWtZXAnUCsb+faLkpOE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=nD6vGFu3fqP/vYik8vOuQDF1zQIEY0kmHDOpcpIRc1A+myMALbA3RtuS2gFfYQcHW
	 3uBvfFffRjozvqJHLpBFankyJoOiKpHIBd71P/F98fdrHmNpMD1Ij/X4qfADlx+HlX
	 ZwTERr+KJ/JCIfAbQeIY47ZMtObXibYJQo48bX1KXWqTxUrihpCV0JQ0LBFt6oL4HH
	 yU5ztIsqJQnz3SpKBxXYfChVAz85yg9bQJLTPMINXXJr+rRpyT6jn6hU0NbkIFuuN7
	 fv0xq0vsibA/v9O1ZIvp7FnGAoDFYh6Dwcv7c+5/ELT46Qgw5Fylyw1t8CUF3sChbM
	 Pw/0mUB+X84qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bibek Kumar Patro" <bibek.patro@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260516-smmu_interconnect_addition-v1-2-f889d933f5c1@oss.qualcomm.com>
References: <20260516-smmu_interconnect_addition-v1-2-f889d933f5c1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 13:02:51 +0000
Message-Id: <20260516130251.DED6AC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Dead code `-ENODATA` check in `arm_smmu_icc_get()` causes probe fa=
ilure on platforms without interconnects.
- [High] Shared IRQ handlers access SMMU hardware registers while the devic=
e might be runtime suspended.
- [Medium] Interconnect bandwidth vote is not released during system shutdo=
wn if Runtime PM is disabled.
--

commit efe802bf0c93309aa584a5eb41c34c9788a6e837
Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

iommu/arm-smmu: Add interconnect bandwidth voting support

This commit adds support for an optional interconnect path to the arm-smmu
driver. It votes for bandwidth while the SMMU is active to prevent register
access failures during transitions. The bandwidth vote is enabled during
probe and runtime resume, and released during runtime suspend and errors.

> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.c
> index 0bd21d206eb3e..aedf5edf8f9b2 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
[ ... ]
> @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_de=
vice *smmu)
>  	}
>  }
> =20
> +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
> +{
> +	smmu->icc_path =3D devm_of_icc_get(smmu->dev, NULL);
> +	if (IS_ERR(smmu->icc_path)) {
> +		int err =3D PTR_ERR(smmu->icc_path);
> +
> +		if (err =3D=3D -ENODATA) {

Is this -ENODATA check correct for handling missing interconnects?

Looking at devm_of_icc_get(), it relies on of_icc_get(), which returns
-ENOENT when the interconnects DT property is missing, or -ENODEV on ACPI
platforms where dev->of_node is NULL. It appears it never returns -ENODATA.

Will this cause the driver to unconditionally call dev_err_probe() and fail
to probe on all ACPI platforms and DT platforms that do not define
interconnect properties?

> +			smmu->icc_path =3D NULL;
> +			return 0;
> +		}
> +		return dev_err_probe(smmu->dev, err,
> +				     "failed to get interconnect path\n");
> +	}
> +	return 0;
> +}
> +
> +static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
> +{
> +	if (smmu->icc_path)
> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
> +				   ARM_SMMU_ICC_PEAK_BW_HIGH));
> +}
> +
> +static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
> +{
> +	if (smmu->icc_path)
> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
> +				   ARM_SMMU_ICC_PEAK_BW_LOW));
> +}

Should arm_smmu_icc_disable() also be called during system shutdown?

In arm_smmu_device_shutdown(), if pm_runtime_enabled(smmu->dev) is false,
the driver manually disables the SMMU clocks via clk_bulk_disable().
However, a corresponding call to drop the interconnect vote doesn't appear
to be added to that branch.

Could this leave the bandwidth vote permanently held at
ARM_SMMU_ICC_PEAK_BW_HIGH during system halt or kexec?

[ ... ]
> @@ -2308,6 +2358,7 @@ static int __maybe_unused arm_smmu_runtime_suspend(=
struct device *dev)
>  	struct arm_smmu_device *smmu =3D dev_get_drvdata(dev);
> =20
>  	clk_bulk_disable(smmu->num_clks, smmu->clks);
> +	arm_smmu_icc_disable(smmu);
> =20
>  	return 0;
>  }

With the clocks disabled and the interconnect vote dropped here, is there a
risk of a bus hang if a shared IRQ fires while the device is suspended?

The driver registers its global_fault and context_fault handlers as
IRQF_SHARED. If another device on the same IRQ line triggers an interrupt
while the SMMU is in RPM_SUSPENDED, the handler might attempt to read
hardware registers (such as calling arm_smmu_gr0_read()) while the SMMU is
powered down without an active clock or interconnect vote.

Should the interrupt handlers use pm_runtime_get_if_active() before
accessing registers, and should this suspend callback use synchronize_irq()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-smmu_inter=
connect_addition-v1-0-f889d933f5c1@oss.qualcomm.com?part=3D2
