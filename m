Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60019367B92
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 18:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779215021; cv=none; b=NVZxgh4wOUEna4JB8mvI7Df31IyoKLstdtwfHnCabKhLQqiDpIovntw6dQsfCUOQ9VAoFZg39mDaqwUZxQ91pKTibml85wg0KeyioqOpE0LyBF9sU1zNnBKKMGRxviPdcUSb5Ri1hDLuXwAn8EKpKbHHMNKCzVyE7mIeLNZVDYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779215021; c=relaxed/simple;
	bh=EfTd7TQ9Fceyd1lEdGhCriGKxt78mLAbLmiW6CxgNAw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GYlHmz3do7Bdvqb9FodYXjrlh77k2fQkQM4tXjAzujLDrf4Q9JAs2Sfq/3Fkr4B/y31qtv9c+6Bod/TvAmPJukbx0Al8uHUbh+tWAEQuvBsH38i7J4NimIEmpkyPX/qAIbAJaZGdFGnpmmXvrwYmmISgSJxjF8JoAik8KoqzBAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6ZaL2Xm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6ZaL2Xm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBDA8C2BCB3;
	Tue, 19 May 2026 18:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779215021;
	bh=EfTd7TQ9Fceyd1lEdGhCriGKxt78mLAbLmiW6CxgNAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=c6ZaL2XmFbxpEJ9VrpQGw1QLsSLvimy2/O9ahPxzpQDumF74y7GuWRpGYH7smM9/Z
	 MRH8H0pzXN4H2lr4te/ELW0ZrZ0t8zrgaZwUCH1pPvfU0q29JeKL0ifv3C3MvvMVRy
	 cztljlzrv8ORF4XlN8T067hPlJTI/wsfV9hjalje8YlmztFmWdthscO6Ztdww6dDIZ
	 8/Q4J20LXyw1cXBOBacm27l53apgOuRFRrB08O98WStVV07r+ZYLsq7bJsAyya0Ur9
	 hrsbu9C+E29n1dGvekuMGTbDYyaYlq1kJUE/buYxljlNe8qxlvIrOxXw8uYZaU298e
	 +vQa48XEXgygA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] cpufreq: qcom: Add cpufreq scaling support for
 Qualcomm Shikra SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260519-shikra-cpufreq-scaling-v2-2-2b09f0e1c9d8@oss.qualcomm.com>
References: <20260519-shikra-cpufreq-scaling-v2-2-2b09f0e1c9d8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 18:23:40 +0000
Message-Id: <20260519182340.CBDA8C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Calling kfree() on an interior pointer of a devm-managed array=
 causes immediate slab corruption.
- [High] Delayed work is cancelled before the threaded IRQ is disabled in `=
qcom_cpufreq_hw_cpu_offline()`, allowing work to be rescheduled after cance=
llation and causing a Use-After-Free.
- [High] Missing bounds check on `index` parsed from device tree leads to a=
n out-of-bounds array access.
--

commit f331397a70453ca14a6a369d3ebce1fe9043850e
Author: Taniya Das <taniya.das@oss.qualcomm.com>

cpufreq: qcom: Add cpufreq scaling support for Qualcomm Shikra SoC
   =20
The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
but supports only up to 12 frequency lookup table (LUT) entries. Hence,
add shikra_epss_soc_data that reuses EPSS configuration with appropriate
LUT entries limit.

> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpu=
freq-hw.c
> index ea9a20d27b8fd..d50b868dced30 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
> =20
>  #include <linux/bitfield.h>

[ ... ]

> @@ -416,11 +419,25 @@ static const struct qcom_cpufreq_soc_data epss_soc_=
data =3D {
>  	.reg_intr_clr =3D 0x308,
>  	.reg_perf_state =3D 0x320,
>  	.lut_row_size =3D 4,
> +	.lut_max_entries =3D LUT_MAX_ENTRIES,
> +};
> +
> +static const struct qcom_cpufreq_soc_data shikra_epss_soc_data =3D {
> +	.reg_enable =3D 0x0,
> +	.reg_domain_state =3D 0x20,
> +	.reg_dcvs_ctrl =3D 0xb0,
> +	.reg_freq_lut =3D 0x100,
> +	.reg_volt_lut =3D 0x200,
> +	.reg_intr_clr =3D 0x308,
> +	.reg_perf_state =3D 0x320,
> +	.lut_row_size =3D 4,
> +	.lut_max_entries =3D 12,
>  };

[Severity: Critical]
This is a pre-existing issue, but calling kfree() on an interior pointer of=
 a
devm-managed array causes immediate slab corruption.

In qcom_cpufreq_hw_driver_probe(), the global array qcom_cpufreq.data is
allocated as a single contiguous block using devm_kzalloc():

    qcom_cpufreq.data =3D devm_kzalloc(dev, sizeof(struct qcom_cpufreq_data=
) *
                                     num_domains, GFP_KERNEL);

In qcom_cpufreq_hw_cpu_init(), a CPU policy's driver data is set to point t=
o a
specific element inside this array:

    data =3D &qcom_cpufreq.data[index];

When a policy is torn down, qcom_cpufreq_hw_cpu_exit() is invoked and
explicitly calls kfree(data):

    static void qcom_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
    {
        ...
        kfree(data);
    }

Does calling kfree() on an interior pointer of a devm-managed block violate
slab allocator invariants, and guarantee a kernel panic followed by a
double-free when devres cleans up the block?

[Severity: High]
This is a pre-existing issue, but delayed work is cancelled before the thre=
aded
IRQ is disabled in qcom_cpufreq_hw_cpu_offline(), allowing work to be
rescheduled after cancellation and causing a use-after-free.

In qcom_cpufreq_hw_cpu_offline(), cancel_delayed_work_sync() is called prio=
r to
disable_irq_nosync():

    cancel_delayed_work_sync(&data->throttle_work);
    irq_set_affinity_and_hint(data->throttle_irq, NULL);
    disable_irq_nosync(data->throttle_irq);

The LMh IRQ is registered as a threaded interrupt (IRQF_ONESHOT). If the
threaded handler qcom_lmh_dcvs_handle_irq() runs concurrently with the offl=
ine
process, cancel_delayed_work_sync() can return before the handler executes
schedule_delayed_work().

Because disable_irq_nosync() masks the interrupt but does not wait for the
currently executing threaded handler to finish, the handler can successfully
re-queue the delayed work.=20

Since qcom_cpufreq_hw_cpu_exit() does not cancel the delayed work before
destroying resources, will the work fire after the driver is unbound, leadi=
ng
to a use-after-free and the execution of unloaded module code?

[Severity: High]
This is a pre-existing issue, but a missing bounds check on the index parsed
from the device tree leads to an out-of-bounds array access.

In qcom_cpufreq_hw_cpu_init(), the driver parses the qcom,freq-domain prope=
rty
from the device tree to obtain an index:

    ret =3D of_parse_phandle_with_args(cpu_np, "qcom,freq-domain",
                                     "#freq-domain-cells", 0, &args);
    ...
    index =3D args.args[0];

It immediately uses this index to access the dynamically allocated global
array:

    data =3D &qcom_cpufreq.data[index];

There is no verification that index is strictly less than num_domains (whic=
h is
determined during probe by counting available MMIO resources).=20

Could a malformed or malicious device tree supplying an out-of-bounds index
cause the driver to read garbage memory for data->base, leading to a page
fault and kernel panic when it subsequently attempts
readl_relaxed(data->base + ...)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-shikra-cpu=
freq-scaling-v2-0-2b09f0e1c9d8@oss.qualcomm.com?part=3D2
