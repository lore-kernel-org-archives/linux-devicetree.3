Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB45029AB07
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374893; cv=none; b=iLoPYznwCP5MupglQgiXcp8710ghsoXFurnELzBiSrSUMVpyIj7C3rIfw5+yhlcxvF+18NLDcM1aRpBEpFSXRojFDNFpdNJaGSwn6DTGNrM/zHCK1CCr7Xpt1NDY3o70S/eBiMPfHvDhrtgqzrq0CI41qocAfSZtWElsyhEOHNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374893; c=relaxed/simple;
	bh=82Puy0GQ28QQtmcURXv9x4UjaZUJfIa6RTqbgly0qeA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YR3ljJp9vXeY64b5zt2pdUMKYiZzoK0DsWMb47HSIlfltLo44QDLqnbQzrPFBQLhyMnCF19N2Gf42Q+e1XRHuKQYew7TKG824mwMjx5NUFyKGL1yr6Zt7v0LnhRZa+sRbU+UQ98oyOjP5xRnr9vLHdLYpxBUVDbbZrLiQnFma38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bPFVzwCr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bPFVzwCr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A231F000E9;
	Thu, 21 May 2026 14:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779374892;
	bh=g2pBW6Sc5ULpDhvLolRjZMRR+kZ6i7gzEwHOMcS9fLM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bPFVzwCrQ2BSrt7EtVTrkJjgNu8tKCrxxISdTSUe1l48VFMj9K1KT7unYbEeAyouG
	 vpa+gmo+svDB93S2sqsmGFlAA2Xv+j0QLM5eiG7gvFszDRqDmypk8KcEUl76aEmJIv
	 VpWp2h1n4ROn1dxOA9KonhtaaUVcO4ArbGm+8EyQ/nkrSCh8YzJOLNRYr9V6hF1M3o
	 ILtnMLmuHDEAozQbLqX8iuvefjPrxeYkZNt6zgrFqUwHPU/2D8hNR3svVfMbkqrNyF
	 RmzVvUH4OFN/h4cpSoDkGTqFt6jKVFHDObw0OvD3hTigfPOxJqwfhxnfaxrOwztC5t
	 uWZSkMuqDCSUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] cpufreq: qcom: Add cpufreq scaling support for
 Qualcomm Shikra SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260521-shikra-cpufreq-scaling-v3-2-883c13d1e514@oss.qualcomm.com>
References: <20260521-shikra-cpufreq-scaling-v3-2-883c13d1e514@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 14:48:11 +0000
Message-Id: <20260521144812.32A231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Invalid `kfree()` on a `devm_kzalloc`-managed interior pointer=
 in `qcom_cpufreq_hw_cpu_exit()` leads to a guaranteed SLUB BUG and kernel =
panic.
- [High] Boost/Turbo frequency is lost and incorrectly reported as invalid =
(~0u) when the hardware frequency LUT is completely populated.
- [High] Memory and OPP entries are permanently leaked in the error paths o=
f `qcom_cpufreq_hw_cpu_init()`.
- [High] An unbalanced `disable_irq_nosync()` during CPU offline leaves the=
 LMh hardware throttle IRQ permanently disabled.
- [Medium] Unhandled `request_threaded_irq()` failure leaves `throttle_irq`=
 populated, leading to invalid IRQ operations and kernel warnings.
--

commit 3d8cb988016155d4dc9ae011b0b91c02adb8ac0d
Author: Taniya Das <taniya.das@oss.qualcomm.com>

cpufreq: qcom: Add cpufreq scaling support for Qualcomm Shikra SoC

This commit introduces cpufreq scaling support for the Qualcomm Shikra SoC =
by
adding the shikra_epss_soc_data structure. It dynamically limits the freque=
ncy
lookup table based on the new lut_max_entries field, replacing the hardcoded
LUT_MAX_ENTRIES limit to prevent out-of-bounds reads.

> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpu=
freq-hw.c
> index ea9a20d27b8fd..3d5a865fb8a35 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
[ ... ]
> @@ -236,7 +238,7 @@ static int qcom_cpufreq_hw_read_lut(struct device *cp=
u_dev,
>  		icc_scaling_enabled =3D false;
>  	}
> =20
> -	for (i =3D 0; i < LUT_MAX_ENTRIES; i++) {
> +	for (i =3D 0; i < soc_data->lut_max_entries; i++) {
>  		data =3D readl_relaxed(drv_data->base + soc_data->reg_freq_lut +
>  				      i * soc_data->lut_row_size);
>  		src =3D FIELD_GET(LUT_SRC, data);

[Severity: High]
This is a pre-existing issue, but if the hardware frequency lookup table is
completely populated up to soc_data->lut_max_entries with unique
frequencies, doesn't the loop terminate without processing a duplicate
entry?=20

If so, it appears the fix-up block is bypassed, leaving the highest
performance state marked as CPUFREQ_ENTRY_INVALID (~0u). Could this cause
qcom_cpufreq_get_freq() to return ~0u and potentially break the scaling
governors?

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but looking at
qcom_cpufreq_hw_cpu_init(), if steps fail after policy->freq_table is
allocated via kzalloc_objs (such as a failure in qcom_cpufreq_hw_lmh_init),
the function directly returns an error code.=20

Since the cpufreq core doesn't invoke the exit() callback on an init()
failure, does this permanently leak the dynamically allocated memory and opp
entries?

[Severity: Critical]
This is a pre-existing issue, but in qcom_cpufreq_hw_cpu_exit(), the code
calls kfree(data) on policy->driver_data.=20

Given that qcom_cpufreq.data was originally allocated using devm_kzalloc()
in qcom_cpufreq_hw_driver_probe(), won't passing this interior pointer
directly to kfree() cause a slab allocator bug and kernel panic?

[Severity: High]
This is a pre-existing issue, but when hardware throttling occurs,
qcom_lmh_dcvs_handle_irq() calls disable_irq_nosync() and schedules
throttle_work to re-enable it.=20

If the cpu is offlined before the work executes,
qcom_cpufreq_hw_cpu_offline() cancels the work and calls
disable_irq_nosync() again.=20

Will this bring the irq disable depth to 2, so that when the cpu is brought
back online, qcom_cpufreq_ready() calling enable_irq() only reduces the
depth to 1 and leaves the thermal throttling interrupt permanently disabled?

[Severity: Medium]
This isn't a bug introduced by this patch, but in qcom_cpufreq_hw_lmh_init(=
),
if request_threaded_irq() fails, it logs an error and returns 0.=20

However, it doesn't seem to invalidate data->throttle_irq. Because it is
still populated with a valid irq number, will subsequent cpufreq callbacks
like qcom_cpufreq_ready() and qcom_cpufreq_hw_lmh_exit() erroneously attempt
to call enable_irq() and free_irq() on it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-shikra-cpu=
freq-scaling-v3-0-883c13d1e514@oss.qualcomm.com?part=3D2
