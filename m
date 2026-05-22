Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F26518DB2A
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 16:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779465992; cv=none; b=jIwRzpoqu1rhBE8Emyz2O4D3FvEeZ03fjIoBGKGwv/gE1V0EH3tfxD6uUtC/cSkpaV9j3TzRpC0CII/Q8Y5OlP9IOSwcgicsv82jbwmqfejfcSpOsYw+zSaJM6hdo4vnvC7oxRAE1L6uKpI6XfVmDn4gUPhi89Dvi54dNuDPSpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779465992; c=relaxed/simple;
	bh=VM8Fo6f/PbM3rLmrQ+vok2VCHigCj3LwZR0iEtEEsGY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H8/g1zkRuvoV/h7aXB8dqhBdPbONJsIJ2+yaUBXpuwsTC6A9r+fKdEjl62H23hvtoOpOlciWa8fePB/h+fTK9/My+PtDmKquNAFhaeaW3U+v9ZQhNaN4rKIoKQLB30/MOOsr1Cu2MD6dMhOXv/rGZi4P40UmQJluU4qOxZUL5A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qhi7JDv6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qhi7JDv6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5D21F000E9;
	Fri, 22 May 2026 16:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779465990;
	bh=eH3KaprQcwamxsd+zYtSYZtvsKen8Ef7VHVq+HohkVk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qhi7JDv6D+xbPtDi3r5JpKKkCwXTNqESYqgf5i8opLaqPk/2AsA/TTZqoCKvD8AgF
	 r7FIEWtE8XApglSuH3HN8ltcs/ECJOFXz/iGM57vyGkt7hM1fY4pX3NqKKoRzIKQT1
	 HMCnjy7naFLRh9vfI7F9gj7JxS3TOosbux6hnhb/buuJ8WzZljiUMwkmn4CYA7JhTw
	 hNmNM54E6baDUaD9nAq8KkHMyEgAbSF9rtf4wmP//k0VIZMWRl2JZfHgu9uEyDFGKm
	 pFBUsJpxiP+v1eX8RMO32fNZt+pJWRt8OKvixuZO15GTGxUu41T2EE8n5hEiIoPiav
	 YuKRTe3oVpFlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] cpufreq: qcom: Add cpufreq scaling support for
 Qualcomm Shikra SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260522-shikra-cpufreq-scaling-v4-2-f042a25896c5@oss.qualcomm.com>
References: <20260522-shikra-cpufreq-scaling-v4-2-f042a25896c5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 16:06:30 +0000
Message-Id: <20260522160630.BE5D21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Calling kfree() on an interior pointer of a devm-managed array=
 causes severe memory corruption.
- [High] The turbo/boost frequency is improperly ignored and left invalid w=
hen the hardware LUT is fully populated.
- [High] The LMh throttle delayed work can outlive the `qcom_cpufreq_data` =
structure, causing a Use-After-Free when the policy is destroyed.
--

commit 04a4ff128bbeeee8119bf80c19ea931913c35395
Author: Taniya Das <taniya.das@oss.qualcomm.com>

cpufreq: qcom: Add cpufreq scaling support for Qualcomm Shikra SoC

This commit adds cpufreq scaling support for the Qualcomm Shikra SoC. It
introduces the shikra_epss_soc_data structure which reuses the EPSS
configuration but limits the maximum lookup table entries to 12.

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
This is a pre-existing issue, but does this loop handle a fully populated L=
UT
where the last entry is a turbo frequency?

When a frequency has a core_count of LUT_TURBO_IND, it is initially marked =
as
CPUFREQ_ENTRY_INVALID. The code relies on encountering a duplicate frequency
on the next iteration to convert that invalid entry into CPUFREQ_BOOST_FREQ.

If the hardware LUT is completely filled with unique entries up to its
capacity limit, the loop terminates naturally. Does this leave the final
turbo entry ignored and invalid since the duplicate check is never reached?

[ ... ]

[Severity: Critical]
This is a pre-existing issue, but could the teardown path free a devm-manag=
ed
interior pointer?

During policy initialization, the driver assigns policy->driver_data to poi=
nt
to an interior element within a collectively allocated devm-managed array:

qcom_cpufreq_hw_cpu_init()
    policy->driver_data =3D &qcom_cpufreq.data[index];

During teardown, the driver appears to manually free this pointer:

qcom_cpufreq_hw_cpu_exit()
    kfree(data);

Can this manual kfree() on an interior pointer bypass devres management and
cause memory issues during device unbind or CPU hotplug?

[Severity: High]
This is a pre-existing issue, but is there a race between the LMh throttle
delayed work and the CPU offline sequence?

In qcom_cpufreq_hw_cpu_offline(), the driver cancels the work before
disabling the interrupt:

qcom_cpufreq_hw_cpu_offline()
    cancel_delayed_work_sync(&data->throttle_work);
    disable_irq_nosync();

If the hardware interrupt fires during this window, the interrupt handler
qcom_lmh_dcvs_handle_irq() unconditionally re-arms the delayed work.=20
Later, when qcom_cpufreq_hw_cpu_exit() frees the data structure, the re-arm=
ed
work could still execute and attempt to access the freed memory:

qcom_lmh_dcvs_poll()
    mutex_lock(&data->throttle_lock);

Could the driver disable the IRQ before canceling the work to ensure the
work is not re-armed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-shikra-cpu=
freq-scaling-v4-0-f042a25896c5@oss.qualcomm.com?part=3D2
