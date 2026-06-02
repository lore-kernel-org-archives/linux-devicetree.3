Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7451A680C
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 04:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780375695; cv=none; b=rn2CEWxfkusz57FT00QvyWtxAXcJdqvoKx+Iyt9fzjODFc5HlQ7GzhfxRjookCCkwO7n02zFfYA43w4+crl5hczRADEJIGnzv1n0j2xEjhzLavoM52baI8M0fD6s2xHIiMGxxF9HPCxwaCcuu+BDSR/qDtrrs0LVLwEY5xOndzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780375695; c=relaxed/simple;
	bh=zjA9PZg1JePTVVrE4TANTF7XvpXH7PXf7onxqW5MbOM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mdo++gh4wLFyU44eTjbXwHDqjz5NAMxq8WJqR/DnBDc3tjQS9n10mQ84ryjrQtppqgzQAMlQxWMo9imAI/CnZNYuNPoM+wJF7OsuE6GVZGXZsdqGQhbvDqdmiZejbAmbatmEx2qzOHS+uZGP+IFVbLPipJi526E13XtMIP75h1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PU1UOZVs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PU1UOZVs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FDE1F00893;
	Tue,  2 Jun 2026 04:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780375693;
	bh=JD8NXfGHftRpkaD7cLNv3lEwbp8T/wAlya1cCzx1LMw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PU1UOZVsXndi3TJXpXdMJHTA3MgtWGPWPzlFFXJGMfVeej2LwW0iN0IwNTVhpa0TD
	 8AHLdNX4agJx1NjrDxQ7ABVuc3QRQeglg1uSxm/emM5BqsvWZkE9pu8PeZx3AsJkxr
	 zno/++2dDlEUK+q980yFcL9N+FfaG5Ekhe9nhWsQOgOx1hPT7hCFm3FNL75qsbtJmL
	 UFoZM0/J6sVSMmzxIc+USgZcqYL8XuDAGZsexHOsXq6A/jYJ28tv64ynr8wgRYCEKs
	 lisE3iYycTX7eKeOdOMAMXD28Hlgp9QjgXh7/aI88j/MWNTRjSKShaO5I4JxXgA1JN
	 9LOANRYAJJJAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gcc-msm8660: register PLL4_VOTE for
 LPASS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260602042747.277270-3-github.com@herrie.org>
References: <20260602042747.277270-3-github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 04:48:12 +0000
Message-Id: <20260602044813.69FDE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] DT Binding Schema mismatch due to missing input clock documentat=
ion.

Pre-existing issues:
- [High] NULL pointer dereference when enabling an orphan `pll4_vote` clock.
--

commit 7c30a11d991e96ae79ebcc182c62453a708e5ec5
Author: Herman van Hazendonk <github.com@herrie.org>

clk: qcom: gcc-msm8660: register PLL4_VOTE for LPASS

Add the CPU-side software vote register for LPASS PLL4. PLL4 itself
lives in the LCC (Low Power Audio Subsystem clock controller); GCC
holds the apps-processor vote in PLL_ENA_SC0 (0x34c0) BIT(4).

> diff --git a/drivers/clk/qcom/gcc-msm8660.c b/drivers/clk/qcom/gcc-msm866=
0.c
> index e81b8851a7861..cd392e140e95c 100644
> --- a/drivers/clk/qcom/gcc-msm8660.c
> +++ b/drivers/clk/qcom/gcc-msm8660.c
[ ... ]
> @@ -54,6 +54,20 @@ static struct clk_regmap pll8_vote =3D {
>  	},
>  };
> =20
> +/* PLL4 is the LPASS PLL, defined in LCC. This is the voting clock. */
> +static struct clk_regmap pll4_vote =3D {
> +	.enable_reg =3D 0x34c0,
> +	.enable_mask =3D BIT(4),
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "pll4_vote",
> +		.parent_data =3D &(const struct clk_parent_data){
> +			.fw_name =3D "pll4", .name =3D "pll4",

[Severity: High]
This is a pre-existing issue, but will this cause a NULL pointer dereference
if the LCC driver is not loaded or the DT node is disabled, leaving pll4_vo=
te
as an orphan?

The Common Clock Framework permits clk_enable() to be called on orphan cloc=
ks.
If this happens, clk_pll_vote_enable() fetches the parent via
clk_hw_get_parent(), which returns NULL.

It then unconditionally casts this NULL to struct clk_pll using to_clk_pll(=
).
Because clkr is the last member of struct clk_pll, this yields a non-NULL
invalid pointer offset:

drivers/clk/qcom/clk-pll.c:clk_pll_vote_enable() {
    struct clk_pll *p =3D to_clk_pll(clk_hw_get_parent(hw));
    ...
    return wait_for_pll(p);
}

This pointer is passed to wait_for_pll(), which calls
clk_hw_get_name(&pll->clkr.hw). The &pll->clkr.hw calculation perfectly
reverses the offset, yielding exactly NULL:

drivers/clk/qcom/clk-pll.c:wait_for_pll() {
    const char *name =3D clk_hw_get_name(&pll->clkr.hw);
    ...
}

clk_hw_get_name() then dereferences NULL->core->name, causing a panic. This
patch exposes this pre-existing flaw by introducing the first clk_pll_vote_=
ops
clock with an external parent.

[Severity: Medium]
Will this fw_name direct the clock framework to look for a clock named pll4
in the clock-names property of the qcom,gcc-msm8660 device tree node?

The YAML schema for this binding
(Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml) strictly
enforces maxItems: 2 for the clocks property and only permits pxo and cxo
in clock-names.

Any device tree that correctly supplies pll4 to satisfy this lookup will fa=
il
dt_binding_check validation. Should the DT binding schema be updated alongs=
ide
this patch to accommodate the new input clock?

> +		},
> +		.num_parents =3D 1,
> +		.ops =3D &clk_pll_vote_ops,
> +	},
> +};
> +
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602042747.2772=
70-1-github.com@herrie.org?part=3D2
