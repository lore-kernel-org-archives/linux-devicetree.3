Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1415391E49
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 02:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781576277; cv=none; b=kRD4YTk2V1meljO9rCWVbNzWNt7nKGejEfvevB0t9OL/2mFePyJkxG8Z2ls3jTaCK9i2dI/1WTleH2k5m2iVMxQt3/hhZ8vEdXIAXq9Ur3mcWgKlGjgTv9apylnT54i+rmNHP3a0m+BKmTZk337s4MERjG/kf7YFyaCFAjJ8p+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781576277; c=relaxed/simple;
	bh=GCJwaC8vD15OnBYO2mXtAccwoXGyYiv2AWM5TOqfphM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YrdvJcJ6sQ+Sg8ER5jFkCPhnyClak5CbC7WS/kCXWvVQjulzuk0Lf94oXNjzsShfUskL4Myue3ProhrG68dSr7uPEOy7u0a2VECSnFnvW5DTXUDhPxEqJ10w3f+eQIzu02TJyE1yXKzHifYskM/ps/vpRNZOa0+Bnb448KNGT/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gsiNeUHj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gsiNeUHj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CADC1F000E9;
	Tue, 16 Jun 2026 02:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781576275;
	bh=Wn6Q+NOyBD6Ui8nzoqSrC8hnlFvlbYLe/kzBl6pqK0c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gsiNeUHj6O/mkzbywCa89rAPr5OtEW2fySTz2wUwa/RwEm8nA164/BhnI40s6G56a
	 smnZjsQjmTkyor0cenIurcud5N6tuAtWDN5aUKo6rItZgXA9jSFVVQe5oq1t0DFxs2
	 knUXntmLoMbu1hoyRrFzJnAuPncBPdn80Nustvo8dOemx3VM9MEb2cbnPng4CZGPE3
	 8DTekPPPhKmIe1YoUUBrFeeKfd61VfZywN/MJdXCdfUVP/IXMzjjgVZVd9EdIeJ6dU
	 1wkgERT3nXjnpQmdKHLFXBKniuw1386ZdfuA9v6CxCidBFAu4viuKNnz2hpAbKs3vH
	 ocTQUX7QkT6hw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/16] media: iris: Add framework support for
 AR50_LITE video core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260616-iris-ar50lt-v5-9-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-9-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 02:17:53 +0000
Message-Id: <20260616021754.5CADC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] pm_runtime_get_sync() leaks usage count on failure in iris_enable_=
power_domains().
- [High] iris_disable_power_domains() bails early on OPP failure, bypassing=
 pm_runtime_put_sync() and leaking the PM reference.
- [High] 32-bit multiplication in VPU frequency calculations silently overf=
lows, leading to drastic underclocking at high resolutions/framerates.
- [High] The function `iris_vpu_boot_firmware()` returns success (0) even w=
hen it detects a firmware boot error.
--

commit 7269410ec2faaa10691a53dc0ab6c6efcc23fc3e
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: Add framework support for AR50_LITE video core

Add power sequence for ar5lt core. Add register handling for ar50lt by
hooking up vpu op with ar50lt specific implemtation or resue from earlier
generation wherever feasible.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c b/drivers=
/media/platform/qcom/iris/iris_vpu_ar50lt.c
> new file mode 100644
> index 0000000000000..e084a5b49f2e3
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c

[ ... ]

> +static int iris_vpu_ar50lt_power_on_controller(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret =3D iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRI=
S_CTRL_POWER_DOMAIN]);

[Severity: High]
This isn't a bug introduced by this patch, but do iris_enable_power_domains=
()
and iris_disable_power_domains() leak runtime PM references on failure?

In drivers/media/platform/qcom/iris/iris_resources.c,
iris_enable_power_domains() calls:

	ret =3D pm_runtime_get_sync(pd_dev);
	if (ret < 0)
		return ret;

If the resume fails, it returns a negative error code but leaves the usage
count incremented without calling pm_runtime_put_noidle().

Similarly, iris_disable_power_domains() has an early return that bypasses
pm_runtime_put_sync():

	ret =3D iris_opp_set_rate(core->dev, 0);
	if (ret)
		return ret;
=09
	pm_runtime_put_sync(pd_dev);

If iris_opp_set_rate() fails, the pm_runtime_put_sync() call is skipped,
permanently leaking the runtime PM reference and leaving the power domain
active.

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers=
/media/platform/qcom/iris/iris_vpu_common.c
> index 41498f94480e8..d64e7745a63dc 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -97,7 +97,8 @@ int iris_vpu_boot_firmware(struct iris_core *core)
>  	}
> =20
>  	writel(HOST2XTENSA_INTR_ENABLE, core->reg_base + CPU_CS_H2XSOFTINTEN);
> -	writel(0x0, core->reg_base + CPU_CS_X2RPMH);
> +	if (!core->iris_platform_data->no_rpmh)
> +		writel(0x0, core->reg_base + CPU_CS_X2RPMH);
> =20
>  	return 0;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does iris_vpu_boot_firmware()
return success even when it detects a firmware boot error?

Earlier in this function:

	if ((ctrl_status & CTRL_ERROR_STATUS__M) =3D=3D 0x4) {
		dev_err(core->dev, "invalid setting for uc_region\n");
		break;
	}

Because the loop is exited early via break, the count does not reach
max_tries. This skips the subsequent timeout check (if (count >=3D max_trie=
s)),
and the function incorrectly falls through to return 0.

Could this cause the caller to proceed assuming the firmware booted correct=
ly,
leading to undefined behavior and hardware timeouts later?

[ ... ]

> @@ -422,6 +423,32 @@ void iris_vpu35_vpu4x_program_bootup_registers(struc=
t iris_core *core)
>  	writel(0x1, core->reg_base + WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0);
>  }
> =20
> +u64 iris_vpu2_calculate_frequency(struct iris_inst *inst, size_t data_si=
ze)
> +{
> +	struct platform_inst_caps *caps =3D inst->core->iris_platform_data->ins=
t_caps;
> +	struct v4l2_format *inp_f =3D inst->fmt_src;
> +	u32 mbs_per_second, mbpf, height, width;
> +	unsigned long vpp_freq, vsp_freq;
> +	u32 fps =3D inst->frame_rate;
> +
> +	width =3D max(inp_f->fmt.pix_mp.width, inst->crop.width);
> +	height =3D max(inp_f->fmt.pix_mp.height, inst->crop.height);
> +
> +	mbpf =3D NUM_MBS_PER_FRAME(height, width);
> +	mbs_per_second =3D mbpf * fps;
> +
> +	vpp_freq =3D mbs_per_second * caps->mb_cycles_vpp;

[Severity: High]
This is a pre-existing issue, but does this 32-bit multiplication silently
overflow before assignment?

Both mbs_per_second and caps->mb_cycles_vpp are u32. For high resolutions
and framerates (like 8K at 240+ FPS), mbs_per_second can reach ~33M and
mb_cycles_vpp is ~200. This results in a product greater than 6.6 billion,
exceeding the u32 maximum.

The value wraps around before being cast to unsigned long, which might cause
the requested clock frequency to be set drastically lower than required.

The same multiplication overflow also exists in
iris_vpu3x_vpu4x_calculate_frequency() where mult_frac() internally execute=
s a
u32 * u32 operation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-iris-ar50l=
t-v5-0-583b42770b6a@oss.qualcomm.com?part=3D9
