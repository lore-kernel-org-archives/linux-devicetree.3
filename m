Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B451F2380
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778754371; cv=none; b=OnXWHxT5scgqHnAsqwsuIXCM6RUZTPBEKmYVW6xZpI3pdj34tt305Spi+ohXbLphaZMaDIorQeixAfkSU7EUpPGo6crgvkE5aUsEg26X24ADol029xous7T9ORkxxfxp9uK7S60kYJ7gKpW93UhmZ1X+M6S5OlOUyF46Q6YHaNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778754371; c=relaxed/simple;
	bh=kfhFXJDVzV3jD5ksLFrFUQBSNOcncGtl/0nBgvjiWJE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zrw2Mpc1MDMXHzjxs2YlgiAYESMJ6vRLVFd3cihCoT805I4fhpJ1GaNe1Q4jkck8wQWLHRJ33eggBUAdoGjYvXcM7wWyxZ4b403DWxVTybisxGF5q/sFP41a4EwwPD9Ee8AeUe/A3n5xSGstxBBIsevk+Uq180zQjWLB4meuYiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3kxfXna; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3kxfXna"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A69C2BCC9;
	Thu, 14 May 2026 10:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778754371;
	bh=kfhFXJDVzV3jD5ksLFrFUQBSNOcncGtl/0nBgvjiWJE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=f3kxfXnaP8e/07F0xg5W4aduEbUd4Y72kFS/9vjTy7DIPu9Mgrl18awuqxiKugsrr
	 +9zRqSvj2xQy6Uh2Vnzm900hdPmvVLbYQPKpfuQVmJSa6F7GF4KNldL8on/5qsMiqa
	 U269J4omN01WEiIRChSFlPlY13mX4oobjEsiVyg2U8mvMSXr1KFB3tLtk/oETV3uec
	 Oz6iu8q2WKXHaDSnqJr02/ehje5sv51diqtYzI5S6TcpRldYYEAD1isj2jLTx8Txy5
	 u1YM7pO6y7J7sWKQx4NZWhJ4Jf11Ab6Dse5PjsI8RvKOA9DRFrf+rSBedDXwHkp/xV
	 DoGBpKT8mLn9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/7] clk: qcom: gpucc: Add GPU Clock Controller
 driver for Eliza
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260513-eliza_mm_cc_v2-v4-5-e61b5434e8d9@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v4-5-e61b5434e8d9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 10:26:10 +0000
Message-Id: <20260514102611.14A69C2BCC9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Duplicate clock definitions for the same hardware register and bit=
 (gpu_cc_gpu_smmu_vote_clk and gpu_cc_hlos1_vote_gpu_smmu_clk).
--

commit 6d648a0e43468c77f650349682c80884c4151795
Author: Taniya Das <taniya.das@oss.qualcomm.com>

clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza

This commit adds the Graphics Clock Controller (GPUCC) driver for the Eliza
platform, providing clock, reset, and GDSC definitions.

> diff --git a/drivers/clk/qcom/gpucc-eliza.c b/drivers/clk/qcom/gpucc-eliz=
a.c
> new file mode 100644
> index 0000000000000..85ae0ab118405
> --- /dev/null
> +++ b/drivers/clk/qcom/gpucc-eliza.c

[ ... ]

> +static struct clk_branch gpu_cc_gpu_smmu_vote_clk =3D {
> +	.halt_reg =3D 0x7000,
> +	.halt_check =3D BRANCH_HALT_VOTED,
> +	.clkr =3D {
> +		.enable_reg =3D 0x7000,
> +		.enable_mask =3D BIT(0),
> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "gpu_cc_gpu_smmu_vote_clk",
> +			.ops =3D &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk =3D {
> +	.halt_reg =3D 0x7000,
> +	.halt_check =3D BRANCH_HALT_VOTED,
> +	.clkr =3D {
> +		.enable_reg =3D 0x7000,
> +		.enable_mask =3D BIT(0),
> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "gpu_cc_hlos1_vote_gpu_smmu_clk",
> +			.ops =3D &clk_branch2_ops,
> +		},
> +	},
> +};

Both gpu_cc_gpu_smmu_vote_clk and gpu_cc_hlos1_vote_gpu_smmu_clk map to the
exact same hardware register (0x7000) and enable mask (BIT(0)).

Because the Common Clock Framework maintains independent reference counts a=
nd
state for each clock object, if one consumer disables its clock, won't CCF
clear BIT(0) in register 0x7000?

Could this abruptly shut down the SMMU clock in hardware even if the other
consumer's reference count is still active?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-eliza_mm_c=
c_v2-v4-0-e61b5434e8d9@oss.qualcomm.com?part=3D5
