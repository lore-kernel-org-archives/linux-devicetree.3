Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB0526FDBF
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778752950; cv=none; b=YvApeAD+y8V+8EY011QuImjvDXMXccpJxHjiKAz+Z80g3Spvr5svFMf4dDbdbmvjsv6cCNiRcTQYPuQ7BInGtT5hvOEJoGR5J05aOVkT4npgt+JwaWahvx8Y31fYhL7VWAFO6QS5mi9OTlPkc3GmpAM3ORWZcvz2YSnmNNm1s/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778752950; c=relaxed/simple;
	bh=3TesIslMUkv49mPtKr9ZpsovX7UrqkMHEv55XJ2uoNA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e0JJAJxUIRLqmUfYZwm9kKJPoJ4nlWfY5fTLvedInaTLxWLjUJX+QtNCD03Bly3wwMACSHI0VXkKHyXJOt4iRuQ/t7R12OaPY6yXT5vdeV7GQzWYj47Id6T6lAtANc5VK1no4qyp8W6j5+DxZB3AbkJJL2zvCHL93ES7xFliRbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQWv49PF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQWv49PF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD7CC2BCB3;
	Thu, 14 May 2026 10:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778752950;
	bh=3TesIslMUkv49mPtKr9ZpsovX7UrqkMHEv55XJ2uoNA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=CQWv49PFMSleUonAyNKY7Knrdv7QX5nnbv8k+lChE3mDIQHbU4a2e2rHBJqk3n2lQ
	 l2rEMAoHAGNeTZ7NLgY9s3okxAANZkApvXtXLCIUm0XI0eQUUlphacwpHE0Rk+gTq9
	 ygWTrxb/cJQdzIQ2uWaJS8XeuYMZDkhbY0KCLhr7Ql+7oM7PF2q4X5VBnS03VcOTXB
	 ypmnUgMolqFyxuFybfcW9yDOA3Kcu5r2ZbJ4JeHldUoYihaPMGU4EBldqduc5TwCUb
	 dwdXVVDzBnz2KmWqKaPDyzRJ9rLhamwETE4mPgXUau5veKktW2Qw5mV8kjQqZkMyh2
	 vMG+t2xeMdrBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] clk: qcom: gpucc: Add GPU Clock Controller
 driver for Eliza
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260513-eliza_mm_cc_v2-v3-5-b59c370dc281@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v3-5-b59c370dc281@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 10:02:29 +0000
Message-Id: <20260514100230.0AD7CC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardware State Conflict and CCF Reference Counting Race on SMMU Vo=
te Clocks
--

commit 677d8bac725b37e31762837245d464597c8a7f08
Author: Taniya Das <taniya.das@oss.qualcomm.com>

clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza

This commit adds Graphics Clock Controller (GPUCC) support for the Eliza
platform.

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

Will this cause a hardware state conflict?

Both gpu_cc_gpu_smmu_vote_clk and gpu_cc_hlos1_vote_gpu_smmu_clk are defined
using the exact same hardware register (0x7000) and mask (BIT(0)).

Since the Common Clock Framework maintains software reference counts per
clk_core instance rather than per hardware bit, if two separate consumers
enable these clocks, both will set BIT(0).

If one consumer then disables its clock, the disable callback will clear
BIT(0) in hardware because its local software reference count reached 0.
This would turn off the physical clock even though the other consumer's
reference count is still positive.

Could this lead to a system hang, bus fault, or unrecoverable kernel panic
when the active consumer accesses the unclocked hardware?

> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "gpu_cc_hlos1_vote_gpu_smmu_clk",
> +			.ops =3D &clk_branch2_ops,
> +		},
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-eliza_mm_c=
c_v2-v3-0-b59c370dc281@oss.qualcomm.com?part=3D5
