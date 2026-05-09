Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752ED33F8BE
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 19:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778355843; cv=none; b=qX9FXkLlRmgFkzKfi6TUjYb3zm6CQTpZivJSnfXkudJMASfhvOpEovBZuoOtDys9zJGm9EQ23IpiDJfw4iSiSpgXPXTbZ8Rn9invFUpbqOYuDLKR5kibXP9c6XXE0WB0ZtCcNdJ07YuCCaxOTlTyf5fgl6M1HFHQZmo48K2enGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778355843; c=relaxed/simple;
	bh=0MuxlFSE2hW3PPTuknn674+Q3bbF8Yz/gVcQXmjCOeA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dN0YYHeWxQOFG1kBSl1ZjAwx3pp3TAqZqi0w750mLBC5fOs1PJ6ov+nH7qObKkNM0V5vz5X8jQ53bjbDsylo7dJqzadppYG+Lru+eJi185LpkqZKsMRFNqnYhux24UWkHfBUJQi4UNlzjP8Jl14X8Jlpd8Yty7vcHK5tuKRNp/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQI4ohDH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQI4ohDH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB552C2BCB2;
	Sat,  9 May 2026 19:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778355843;
	bh=0MuxlFSE2hW3PPTuknn674+Q3bbF8Yz/gVcQXmjCOeA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=QQI4ohDHY5ff3/Ql8wmTNyBxmsh565UcSuhJF2bNRgiUuaghymqN34r90d0izfjgL
	 orPsxhL4GZlJNLE+T17V4oaErsiqMVI/92Rg1UoF/wn4iJHOb4PahTUKadP2udMgFL
	 5NlRhs0WecDQV3R/dhlCJaUOpYt6aY+qvMy0Gj3wE+ozVe3wnsl0qHJLAHVsMHMz6h
	 JKH2v7OSXhHEfrnxUNEVKQ3PJvnKG5cmqDQWYCisIZU2+MAR5OHcSnsisgSda7j5WL
	 syTmf1vSJuBgyLVoiS4htT3NNsM3lJGudB3DB3YGhq7YtjajtuGOpFfudBRopqXEcU
	 QJuiQql51T5sg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/8] clk: sunxi-ng: de2: Fix Display Engine 3.3
 definitions
Reply-To: sashiko@lists.linux.dev
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260509190015.79086-2-jernej.skrabec@siol.net>
References: <20260509190015.79086-2-jernej.skrabec@siol.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 19:44:02 +0000
Message-Id: <20260509194402.EB552C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The new DE33 clock definitions omit the bus clocks for MIXER1 and =
WB, leaving their bus interfaces unclocked and breaking hardware support.
--

commit 7e5df4616faf2d32c9447b44291572215aac8a17
Author: Jernej Skrabec <jernej.skrabec@gmail.com>

clk: sunxi-ng: de2: Fix Display Engine 3.3 definitions

This commit fixes the Display Engine 3.3 resets and clocks to match
the vendor driver, as the positions of clocks and resets changed in
version 3.3.

> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/=
ccu-sun8i-de2.c
> index a6cd0f988859d..6ec6c0dc4c261 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c

[ ... ]

> @@ -54,6 +61,9 @@ static SUNXI_CCU_M(wb_div_a83_clk, "wb-div", "pll-de", =
0x0c, 8, 4,
>  static SUNXI_CCU_M(rot_div_a83_clk, "rot-div", "pll-de", 0x0c, 0x0c, 4,
>  		   CLK_SET_RATE_PARENT);
> =20
> +static SUNXI_CCU_GATE(bus_mixer0_h616_clk, "bus-mixer0", "bus-de",
> +		      0x08, BIT(0), 0);
> +

Will this omission cause a regression for mixer1 and wb?

It looks like the bus clocks for mixer1 (BIT(1)) and wb (BIT(4)) at register
offset 0x08 are missing here.

Since RST_MIXER1 was previously mapped to 0x08 BIT(1), the DRM driver
deasserting that reset was inadvertently enabling the DE33 bus clock for
mixer1.

Now that RST_MIXER1 is correctly moved to 0x00, will accessing the
unclocked MIXER1 or WB hardware blocks cause a hard system hang due to MMIO
access failures?

[ ... ]

> @@ -147,6 +163,17 @@ static struct clk_hw_onecell_data sun50i_a64_de2_hw_=
clks =3D {
>  	.num	=3D CLK_NUMBER_WITH_ROT,
>  };
> =20
> +static struct clk_hw_onecell_data sun50i_h616_de33_hw_clks =3D {
> +	.hws	=3D {
> +		[CLK_MIXER0]		=3D &mixer0_h616_clk.common.hw,
> +		[CLK_MIXER1]		=3D &mixer1_h616_clk.common.hw,
> +		[CLK_WB]		=3D &wb_h616_clk.common.hw,
> +
> +		[CLK_BUS_MIXER0]	=3D &bus_mixer0_h616_clk.common.hw,

Similarly, should the bus clocks for mixer1 and wb be populated in this
array so the DRM driver can properly request and enable them?

> +	},
> +	.num	=3D CLK_NUMBER_WITHOUT_ROT,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509190015.7908=
6-1-jernej.skrabec@siol.net?part=3D1
