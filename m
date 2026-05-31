Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D582727FD
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 04:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780202006; cv=none; b=WDOewwQt+Yh+x1QT1teYHa9L9l+vOvBTpWFA5XlMhHV5a9Rl4Gd94GigtAvRrowrLKYOpRjop8gSg1ANWdUFVQ15kQfrOph9g8eHUDtbNDPDpbCkrYi0fvHTcrKYxC15TdKIeKGEFA/kjnk+vk46xSz46BvND85qcB8QZC/RRC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780202006; c=relaxed/simple;
	bh=vDH5bP/UF2mvmn90uwMnjgJpUVyOkr4QfsGxbQYAYDI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FmT58AINxpYk203ipcc3eKVjIVjgSk+ZmdjIZ8b/PhscC6YCxfz6aRIx7q2hscPnrvNHIDRxm/+MsZ3e135Hoh+gDGc9b+cM7Rbq3Zl1hX+fBA1ZJRLNUHVPY215wi9HzzjFB030hypOI3qVk6aCiqaCvPnOCNl6fzjPCF7XrGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dffsItTB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dffsItTB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F031F00893;
	Sun, 31 May 2026 04:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780202005;
	bh=9vnwfNn2kj+4jxcTHapNkx/J1xDXf2rG+me+br8iVl4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dffsItTBgnpKRYq5x4oC60bKojAHOAmFBG6HhL5KolCC46WCdTjRfNiynYlhQu1eM
	 ZyeSz5xHzNJ2r88J3RbPeHFZgQ8oCNxbPzTSbfyR0g4On7DgpBG18r528tpPMgjgvL
	 1tkXUXZvTdWJB5PM9+zN9Jh9DRdiQISI2efm8Eo4047tIj/2jYrSw4cU+lisQ3yJfq
	 33d7LsY7Gx/akgpQQ8JKLKKQ4tDF8yJf5eSegz/s3US60JZrcT5x7gUhF8BnSAxesO
	 0zgW0HA3+1kZb7uiT9vHQX+jy2ZJe64YCLhsLfwgrFhD5okKvc1Wad7FOVyy7kYTbr
	 VDojK2um51CHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] clk: qcom: add MSM8x60 LCC (LPASS) driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <f5db4c0e8826d597338fb98e5d8f71ce97aa1cbd.1780197511.git.github.com@herrie.org>
References: <f5db4c0e8826d597338fb98e5d8f71ce97aa1cbd.1780197511.git.github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 04:33:24 +0000
Message-Id: <20260531043325.35F031F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Missing Clock Parent `pll4_vote` leading to orphaned clocks.

Pre-existing issues:
- [High] Race condition between RCG clock `set_rate` and Branch clock `enab=
le`/`disable` sharing the same register.
--

commit 0c6b3f0cf3eb1cc15e3add96b0433ff823210d70
Author: Herman van Hazendonk <github.com@herrie.org>

clk: qcom: add MSM8x60 LCC (LPASS) driver

This commit adds a clock driver for the LPASS Clock Controller on the
MSM8x60 family. It handles the specific register layout, muxing, and
divider topology for this generation, ensuring LPASS audio DSP clocks
work correctly before audio playback or capture.

> diff --git a/drivers/clk/qcom/lcc-msm8660.c b/drivers/clk/qcom/lcc-msm866=
0.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/clk/qcom/lcc-msm8660.c
[ ... ]
> +static const struct clk_parent_data lcc_pxo_pll4[] =3D {
> +	{ .fw_name =3D "pxo", .name =3D "pxo_board" },
> +	{ .fw_name =3D "pll4_vote", .name =3D "pll4_vote" },
> +};

[Severity: High]
Does this correctly reference the local PLL4?

The driver registers the local PLL simply as "pll4" (via clk_pll pll4),
and unlike MSM8960, the MSM8660 platform doesn't appear to export a
"pll4_vote" clock from the global clock controller.

Because the clock framework cannot find "pll4_vote", will parent
resolution fail and leave the essential LPASS root clocks orphaned?

Should this refer to the local PLL using .hw =3D &pll4.clkr.hw or
.name =3D "pll4" instead?

[ ... ]
> +#define CLK_AIF_OSR_SRC(prefix, _ns, _md)			\
> +static struct clk_rcg prefix##_osr_src =3D {			\
> +	.ns_reg =3D _ns,						\
[ ... ]
> +#define CLK_AIF_OSR_CLK(prefix, _ns, hr, en_bit)		\
> +static struct clk_branch prefix##_osr_clk =3D {			\
> +	.halt_reg =3D hr,						\
> +	.halt_bit =3D 1,						\
> +	.halt_check =3D BRANCH_HALT_ENABLE,			\
> +	.clkr =3D {						\
> +		.enable_reg =3D _ns,				\
[ ... ]
> +CLK_AIF_OSR_SRC(mi2s, 0x48, 0x4c)
> +CLK_AIF_OSR_CLK(mi2s, 0x48, 0x50, 17)

[Severity: High]
This is a pre-existing issue, but does sharing the ns_reg (e.g., 0x48)
between the RCG clock and Branch clock expose a race condition?

The RCG clock's set_rate callback (__clk_rcg_set_rate) performs a
non-atomic read-modify-write on this register protected only by the
global CCF prepare_lock mutex.

Concurrently, a branch clock's enable callback (clk_enable_regmap)
performs an atomic regmap_update_bits on the same register protected
by the global CCF enable_lock spinlock.

Since these two locks don't serialize against each other, can an
interrupt-driven clk_enable preempt the clk_set_rate thread between
its read and write steps?=20

If clk_set_rate writes its stale value back, it could revert the
branch clock's hardware enable state, potentially triggering a fatal
external abort on unclocked register access.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780197511.gi=
t.github.com@herrie.org?part=3D3
