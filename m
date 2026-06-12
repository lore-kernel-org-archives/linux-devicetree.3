Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FE835836B
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781258049; cv=none; b=kkfQeMygETg/sy20+NWBKAqfWe0XYgQmCBG8MDfOoGyuef2pT9VRoFLUZXZcIonPr9/sOunEXjUZ8wZ8mM+gZ3kjTuZhJYkZo6J9UEHedDXz6CygM7ZOBAxh3VjtS5v5fR25OD59GN1fkE0sgx15jIde+jnqMZYOeQ5EHR+ixXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781258049; c=relaxed/simple;
	bh=GDYf+MLMVFs2s/YmXnkiUngFsf5Yk3Qnegp3Ak2M7Ls=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TMx5VZWsroqGmvr9oEp/TtqXt9if5l1CxaRcKDdFxFHPLsyQU/1BVXJHI4zzRRoOzhtl8psMveI5xCV63avaFgj+wN0zMpiFKfTuBVp7XdZRil1+e5jVeqGX01sIrMw48qAuDf94J5wlp/hocyK3fqRG9xw7KNVnnLuA21yrX+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5/lHoQn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5/lHoQn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23311F000E9;
	Fri, 12 Jun 2026 09:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781258048;
	bh=HP++2BHj1CDDVfF0oQ7GRKPdehOR8FD8083JmWvKUbs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A5/lHoQnSDWbEt1q3982bcmgh1hWdf/APlI7hv32XQqVANri45Sc5M+7bGV9j3GAj
	 XsTOG/wWFJud8mU/t7MeSGVIx5pYKypa1ppGibgPjOhLzfz/+lDcolCAcBQjT4lK8W
	 lJrqyUY7dqGtLCboCJiuGPpfplyZe/KkWQ+wnQGFmn8U80ADmebklBpbx5Bpx1qMBp
	 kgsVltgSJyTKU3o1UNaRg2g3bvTDgk7EZMEuPIFFL1w/5gDL5Hkx1VRAPAIs6fwdi0
	 tGD0X03h5O6zF6z974D8Er1vBfexilBQzTse7nYsAu98HkdsE1cGbYyUmHd7jqYVDi
	 gmeFX2mn04IQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/16] media: iris: Add framework support for
 AR50_LITE video core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260612-iris-ar50lt-v4-9-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-9-0abfb74d5b3c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 09:54:07 +0000
Message-Id: <20260612095407.D23311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The VPU clock frequency calculation ignores the actual stream fram=
e rate and uses a hardcoded 30 FPS.
- [High] Calculation of VSP frequency causes severe 32-bit integer overflow=
s on 32-bit architectures, leading to under-provisioned clocks.
--

commit 117c5206f4fac821d317f597cfe56c462e1556c1
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: Add framework support for AR50_LITE video core

Add power sequence for ar5lt core.
Add register handling for ar50lt by hooking up vpu op with ar50lt
specific implemtation or resue from earlier generation wherever
feasible.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c b/drivers=
/media/platform/qcom/iris/iris_vpu_ar50lt.c
> new file mode 100644
> index 0000000000000..1af20b067c032
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
[ ... ]
> +static u64 iris_vpu_ar50lt_calc_freq(struct iris_inst *inst, size_t data=
_size)
> +{
> +	struct platform_inst_caps *caps =3D inst->core->iris_platform_data->ins=
t_caps;
> +	struct v4l2_format *inp_f =3D inst->fmt_src;
> +	u32 mbs_per_second, mbpf, height, width;
> +	unsigned long vpp_freq, vsp_freq;
> +	u32 fps =3D DEFAULT_FPS;

[Severity: High]
Does this hardcode the frame rate to 30 FPS instead of using the actual
stream frame rate from the session (e.g., inst->frame_rate)? For
high-framerate streams, this might under-provision the VPU clocks and lead
to dropped frames or hardware stalls.

> +
> +	width =3D max(inp_f->fmt.pix_mp.width, inst->crop.width);
> +	height =3D max(inp_f->fmt.pix_mp.height, inst->crop.height);
> +
> +	mbpf =3D NUM_MBS_PER_FRAME(height, width);
> +	mbs_per_second =3D mbpf * fps;
> +
> +	vpp_freq =3D mbs_per_second * caps->mb_cycles_vpp;
> +
> +	/* 21 / 20 is overhead factor */
> +	vpp_freq +=3D vpp_freq / 20;
> +	vsp_freq =3D mbs_per_second * caps->mb_cycles_vsp;
> +
> +	/* 10 / 7 is overhead factor */
> +	vsp_freq +=3D ((fps * data_size * 8) * 10) / 7;

[Severity: High]
Can this calculation overflow on 32-bit architectures? Since size_t is 32-b=
it
on these platforms, the intermediate product could exceed the 32-bit unsign=
ed
maximum before the division by 7, resulting in a wrap-around and an incorre=
ctly
low requested clock frequency.

> +
> +	return max(vpp_freq, vsp_freq);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-iris-ar50l=
t-v4-0-0abfb74d5b3c@oss.qualcomm.com?part=3D9
