Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7F43EFFC2
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 18:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780339285; cv=none; b=dREquwWqbD8bJOFrgutx7TrMuw5RIdKTHzJUu8NPVGV313lErN5tEcXoYG6GkDiOfM48IB0HqbopKUzGWR4l0HMHz4PW35WpEeNS0fAL7o6V19dbC3+ECWlRd2k7EgViRrs6XgwnIN+aJ7SMEdcbfymoRyJ/0b6amtGEWfmccIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780339285; c=relaxed/simple;
	bh=UdiOLU7sMt+h+In5DnM6aJIi/7fwwCbgKSaDAVecajE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hvxRBoyGnVEgA+d0kRCVcKH6kwfuZ1QcfPoF3pU7MIXWs2M2EZcaUfdqlCP4GHymRQris4Owcdl1PioCMMoZPPkXrpm3atg+PgZz1sVuC7nklEKc9IFGsfJciEQP1kJamYc0eHvQF1KAkqwwxZXVwfew+rXk83XLy9BuWUEGiFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pp69WKTl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pp69WKTl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A10A1F00893;
	Mon,  1 Jun 2026 18:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780339276;
	bh=gXT3jmFqA2ePH0kOi0sNkVWPj0gWCLHI7vKpzXht0t4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pp69WKTl3jD9MZLcgRhgMvj9c5CBUomlRi94Xt2N43Z2/XwWVkuG+Pko3wUgTywD9
	 2S0sbcnO7MPMTfXxZHMMmE60xF3ExY37F9oS7ADI5YjrWSkijUIQcWKWeVshg5ATWq
	 wSv2ajIyv3vX+EF06QiDisDIxUN81OR5dHImtrzKBK32RcRs0Om2Skns8OgGvCJEaN
	 A8IEoqGWSEAVi3dO8Z/TRja0ZZncS96cSKlB/0k1QGSfQ/vBkymEfZ3v5O57HdM8sp
	 CsEz0T4r42Qv10CUUW7smzEkLH13mLBsAlNl1sRbmfPQrZCA/kqz0Yqjwpy19R5LP4
	 M9eZYS4H8TBuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/12] clk: qcom: gpucc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-8-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-8-61c1ba3735e8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 18:41:15 +0000
Message-Id: <20260601184116.4A10A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `.use_rpm =3D true` in `gpu_cc_qcm2290_desc` breaks power =
domain scaling and prevents the device from suspending, locking the VDDCX p=
ower domain permanently ON.
--

commit 550d1d532a5ef23bc31943f5777d495cc864e4b4
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

clk: qcom: gpucc-qcm2290: Move to the latest common qcom_cc_probe() model

This commit updates the QCM2290 GPUCC driver to use the qcom_cc_probe() mod=
el.
It moves critical clocks and PLL configurations to driver_data and removes
explicit pm_clk handling.

> diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qc=
m2290.c
> index dc369dff882e6..1c8ed12f6bf81 100644
> --- a/drivers/clk/qcom/gpucc-qcm2290.c
> +++ b/drivers/clk/qcom/gpucc-qcm2290.c

[ ... ]

> @@ -350,6 +331,12 @@ static const struct regmap_config gpu_cc_qcm2290_reg=
map_config =3D {
>  	.fast_io =3D true,
>  };
> =20
> +static const struct qcom_cc_driver_data gpu_cc_qcm2290_driver_data =3D {
> +	.alpha_plls =3D gpu_cc_qcm2290_plls,
> +	.num_alpha_plls =3D ARRAY_SIZE(gpu_cc_qcm2290_plls),
> +	.clk_cbcrs =3D gpu_cc_qcm2290_critical_cbcrs,
> +	.num_clk_cbcrs =3D ARRAY_SIZE(gpu_cc_qcm2290_critical_cbcrs),
> +};
> =20
>  static const struct qcom_cc_desc gpu_cc_qcm2290_desc =3D {
>  	.config =3D &gpu_cc_qcm2290_regmap_config,
> @@ -359,6 +346,7 @@ static const struct qcom_cc_desc gpu_cc_qcm2290_desc =
=3D {
>  	.num_resets =3D ARRAY_SIZE(gpu_cc_qcm2290_resets),
>  	.gdscs =3D gpu_cc_qcm2290_gdscs,
>  	.num_gdscs =3D ARRAY_SIZE(gpu_cc_qcm2290_gdscs),
> +	.driver_data =3D &gpu_cc_qcm2290_driver_data,
>  };

[Severity: High]
Does this migration lock the VDDCX power domain permanently ON?

The previous probe function explicitly called devm_pm_runtime_enable() and
pm_runtime_put_sync(), allowing the device to drop its power domain vote.

Because .use_rpm =3D true is omitted in gpu_cc_qcm2290_desc, the common
clock framework will not manage runtime PM for this device.

Without runtime PM enabled, the device remains permanently active, which
can prevent the shared CX power domain from suspending.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-shikra-dis=
pcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com?part=3D8
