Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCB01A6808
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778733027; cv=none; b=F3vbMvXLrIRYIPty3o1A1kwmm6m3CT+4P/s+m8NEYjMHyGEhLjNbNF4uzRr+qQV5P8yuyBTPQjrhgNbeVxIq7mx93LUNb7OBbQD/S7yA6BvknAa/C3YP7o7TQBbo3jpwfxZefM1rSBacooEdOGJo9dhrXZLcmzwUo5e8RqWOYac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778733027; c=relaxed/simple;
	bh=LEqhfAqZ9MemiQuFsj7gmLHd9OTMry97/gu+qITPFNE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h1HOTSAhxbAYwI/YoN5+Wil5iG/g5iLdUEdsekURcueHd8vkBtCzJoDhdlJ7pekqZUi8oiRhjB6N/R3UKi0HZSFsI0C5US5WfuNrP3n8EO+0Jxa8pH4UqoEhcoE+IbGGiq/QsKcsP1ieTmbqqXLnsfACxKSMS7qahz1a5Dvf0ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxMxubCd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxMxubCd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B73C2BCB7;
	Thu, 14 May 2026 04:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778733027;
	bh=LEqhfAqZ9MemiQuFsj7gmLHd9OTMry97/gu+qITPFNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=lxMxubCdjWDv/60lwMcfhyHQuswoT7xUcG+grQXPRHNcQAEX01HRresFztwrVDu7p
	 uD9oYKndNW2L8c4iXwn0LrZDoloYo6gx6qp8hn6LemvqrR1G2c7F6l4zg9GDw3JFP6
	 tE1ajnCZHwKHSLiqszLTg9SwfxglDPhUcmfXlob1NPlkm+0efKqNX48mh+WzZtjBDz
	 tEM95957umrZ0ABRLfYwr9C4duUOSR3Nlbcgw/It8a+3+RJOHr9s4xEM18u9BnSeLx
	 ZKufUKWjOza6KgmMqQ71yjzpfKAgbIXEbdlKs4kyihjPMzkmKjc/ErIhu0cpcPG7LM
	 EIt81iX4LwIXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] soc: qcom: llcc-qcom: Add support for Eliza
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260513-eliza-llcc-v2-2-27381ae833d5@oss.qualcomm.com>
References: <20260513-eliza-llcc-v2-2-27381ae833d5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 04:30:26 +0000
Message-Id: <20260514043026.E8B73C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Dynamically calculating `num_banks` creates a critical index-shift=
ing vulnerability for `bcast_regmap` when combined with a static 4-region D=
T layout.
- [Medium] The LLCC_GPU slice configuration sets `.write_scid_cacheable_en =
=3D true` but omits `.write_scid_en =3D true`.
--

commit 33894fa3694ee52109e04ccbe94ee141b9842f00
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

soc: qcom: llcc-qcom: Add support for Eliza

This commit adds the SoC-specific configuration and compatible string for
Eliza. Eliza uses a 4-region LLCC register layout with two per-bank base
register regions and broadcast OR/AND regions.

> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 0161ceec88421..7c05cb3619b2d 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c

[ ... ]

> @@ -181,6 +181,171 @@ enum llcc_reg_offset {
> +	{
> +		.usecase_id =3D LLCC_GPU,
> +		.slice_id =3D 9,
> +		.max_cap =3D 896,
> +		.priority =3D 1,
> +		.bonus_ways =3D 0xfff,
> +		.write_scid_cacheable_en =3D true,
> +	},

The LLCC_GPU slice configures .write_scid_cacheable_en =3D true but omits
setting .write_scid_en =3D true. Without write_scid_en set, the correspondi=
ng
bit in the LLCC_TRP_WRS_EN register evaluates to 0 and is not enabled.

Without the hardware write allocator enabled for this SCID, could the
cacheable setting be rendered ineffective? Other comparable configurations
like glymur_data explicitly set both flags for the GPU slice.

[ ... ]

> @@ -4141,6 +4306,15 @@ static const u32 llcc_v6_reg_offset[] =3D {
>  	[LLCC_TRP_WRS_CACHEABLE_EN]	=3D 0x00042088,
>  };
> =20
> +static const struct qcom_llcc_config eliza_cfg[] =3D {
> +	{
> +		.sct_data	=3D eliza_data,
> +		.size		=3D ARRAY_SIZE(eliza_data),
> +		.reg_offset	=3D llcc_v6_reg_offset,
> +		.edac_reg_offset =3D &llcc_v6_edac_reg_offset,
> +	},
> +};

Eliza uses a static 4-region Device Tree layout (llcc0, llcc1, bcast,
bcast_and). Since .num_banks is not hardcoded here, the driver will
dynamically read it from LLCC_COMMON_STATUS0.

If a defective bank is fused off on a lower-binned SKU, num_banks would be
read as 1. The probe function initializes regmaps based on num_banks:

qcom_llcc_probe() {
    ...
    for (i =3D 1; i < num_banks; i++) {
        ...
    }
   =20
    drv_data->bcast_regmap =3D qcom_llcc_init_mmio(pdev, i, "llcc_broadcast=
_base");
    ...
}

If num_banks is 1, the loop exits with i =3D 1. The driver will then map
index 1 from the Device Tree to bcast_regmap. Since index 1 corresponds to
llcc1_base in a static 4-region layout, could this result in broadcast
commands being incorrectly written to the llcc1 base registers, causing
memory corruption and non-functional broadcasts?

Should .num_banks =3D 2 be explicitly hardcoded here to prevent this index
shifting, or should the driver be updated to map resources by name instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-eliza-llcc=
-v2-0-27381ae833d5@oss.qualcomm.com?part=3D2
