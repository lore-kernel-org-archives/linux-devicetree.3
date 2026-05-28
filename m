Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD30CA4E
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 04:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779941901; cv=none; b=sDrt8MTS1K0SAuZMdNGaZRPP9PzR4ZVvK8uN1H9+pM9aKdytZRkeMtYF81WkkxX8S3lQNz2b/pUSHg5wnuiFYEKFj9CDzRSpK0jYfuPRF6h2E12IAwcu8VE8dnfuadYoWx9xH2g1wHOiHRjDpVJwWW+lMC1IWoUYMbVeev1Eud0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779941901; c=relaxed/simple;
	bh=tPDVehg9lh87TDC13cCrUkQ0Qm7sCcAboqT7P2Lnua0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cXymavB69e4qyDXI28e3+9v7uy5RWhE9y8endmChlUgrK2lW9KjK2lgD5j5uFYnqUNF0NPtWh04SgfY/jk0ZIibZr8k0NYK1yFxOfgQ14meym8ZJNgK36J8cfDduwNMAacyt4hVbYSsA3OacCjb7s0dYK62yXGlvzMxwV3sgbEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQjsYvQp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQjsYvQp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0DF1F000E9;
	Thu, 28 May 2026 04:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779941900;
	bh=CZbAwce0Hnjqs0FgK3J9AISOVKAbmICZKWp1gjiz2+w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fQjsYvQpfGL7Hah8oWaY7yCmrt7Z0XCsBTdITPlWdtR0BnYu9QsaXdgRZobzG8O07
	 FnqGKcZrfaqRPh+s85nlD1+e0/spMwmcgi3a8SpxFU71gdfakAZ7w4KLd3EuPgjlKz
	 umn1CQmot9HoWzS/cqPMyHEGJ/MwARKhDwb8RPBl3OhGHbENjrMnW61xNFXQsgx6UR
	 OPSQorfxeP0kpAaALpIPxy/YmPJUPITj+v9qqnxjq0nDifph6+KaGkr/IWzfh/nl87
	 Wf0fKGjXqHCoGt6b4qtPvlFXy79GCPNlsPigJ3E1DBHrfqx2tc+xrfrAXKsRU5X1bG
	 ZGHfoNfLVmgEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] soc: qcom: spm: Add MSM8960 SAW2 CPU support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rudraksha Gupta via B4 Relay" <devnull+guptarud.gmail.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527-expressatt_cpufreq-v2-2-b9b7726ccb6d@gmail.com>
References: <20260527-expressatt_cpufreq-v2-2-b9b7726ccb6d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 04:18:19 +0000
Message-Id: <20260528041820.1C0DF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Unconditional division by zero during regulator registration
- [High] Infinite polling loop in hardware register write sequence
--

commit 17a126a384bb63507998b0691e4ff49e0de54dab
Author: Rudraksha Gupta <guptarud@gmail.com>

soc: qcom: spm: Add MSM8960 SAW2 CPU support

This commit adds SPM register data for the MSM8960 CPU. It configures the S=
PM
sequences, PMIC delays, and regulator ranges to support the SAW2 v1.1 hardw=
are
present in this SoC.

Link: https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b5=
6847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L3265-L=
3285
Link: https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b5=
6847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L3353-L=
3381

> diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
> index f75659fff2874..fb3ec8aa42b07 100644
> --- a/drivers/soc/qcom/spm.c
> +++ b/drivers/soc/qcom/spm.c
> @@ -253,6 +253,22 @@ static const struct spm_reg_data spm_reg_8064_cpu =
=3D {
>  	.ramp_delay =3D 1250,
>  };
> =20
> +static const struct spm_reg_data spm_reg_8960_cpu =3D {
> +	.reg_offset =3D spm_reg_offset_v1_1,

[Severity: High]
This isn't a regression introduced by this patch, but registering these
offsets enables a code path with an unbounded polling loop.

During probe, setting up the default low power mode eventually calls
spm_register_write_sync():

drivers/soc/qcom/spm.c:spm_register_write_sync() {
	...
	do {
		writel_relaxed(val, drv->reg_base +
				drv->reg_data->reg_offset[reg]);
		ret =3D readl_relaxed(drv->reg_base +
				drv->reg_data->reg_offset[reg]);
		if (ret =3D=3D val)
			break;
		cpu_relax();
	} while (1);
}

If the hardware is in an invalid state, or if certain register bits are
read-only and fail to reflect the written toggle, could this loop hang
indefinitely?

Would it be safer to use a proper timeout mechanism like
read_poll_timeout_atomic() here to allow for graceful recovery?

> +	.spm_cfg =3D 0x1f,
> +	.pmic_dly =3D 0x03020004,
> +	.pmic_data[0] =3D 0x0084009c,
> +	.pmic_data[1] =3D 0x00a4001c,
> +	.seq =3D { 0x03, 0x0f, 0x00, 0x24, 0x54, 0x10, 0x09, 0x03, 0x01,
> +		0x10, 0x54, 0x30, 0x0c, 0x24, 0x30, 0x0f },
> +	.start_index[PM_SLEEP_MODE_STBY] =3D 0,
> +	.start_index[PM_SLEEP_MODE_SPC] =3D 2,
> +	.set_vdd =3D smp_set_vdd_v1_1,
> +	.range =3D &spm_v1_1_regulator_range,
> +	.init_uV =3D 1300000,

[Severity: Critical]
This is a pre-existing issue, but I noticed that setting init_uV here
triggers a division by zero during probe.

When spm_register_regulator() allocates rdesc via devm_kzalloc(),
rdesc->uV_step is zero-initialized and never explicitly set. Later, it
performs this calculation:

drivers/soc/qcom/spm.c:spm_register_regulator() {
	...
	drv->volt_sel =3D DIV_ROUND_UP(drv->reg_data->init_uV - rdesc->min_uV,
				     rdesc->uV_step);
	...
}

Will this result in an unconditional division by zero when calculating
drv->volt_sel?

> +	.ramp_delay =3D 1250,
> +};
> +

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-expressatt=
_cpufreq-v2-0-b9b7726ccb6d@gmail.com?part=3D2
