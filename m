Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD130337BA4
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628336; cv=none; b=h7LBqAlw4a11lpm75T59xlFtFp1c5I49WcUt2wRrBnYkSFKa/yQLikcUIHoJVIh6a24EaudkrlgrvA2i7an0qLaMS/Sv+FptJ2WZfaPZCjzOM1dgbGmTWBSiSuMBP9zZtYflkMG3BCttndaPFl700Xuen5jIWvYFUNs9w984G7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628336; c=relaxed/simple;
	bh=vJK0iLk7ibw69ZC1onSc52ZkGKXdpETqHRmAPicgT4o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=atJQbUVh2jgx9iyVBduUpVUTzjcVl3uIIP9xm2h3D/+2Edda0VSfHMWTjIgN2Q7dq9glV2BYunDK6FwfBz1416hZUuRgeoOF9SNhmkVx1Fh+CsszPzpQqAHxlUK2hDS+BHgmbPBQ22TsvghfxF7URruCAcTBZQxWUwlhwpGj/qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2UVKfAZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2UVKfAZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7089B1F00A3D;
	Tue, 21 Jul 2026 10:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784628334;
	bh=K7PTr00P1qb6ulUHL4MXuRtXcvmnujOMskXCwCVWzqs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K2UVKfAZn2qL2WjAJ3MjaDbKXB/az6opbIocCEtl3rZApOJqaksMz1MGoAXW0As+q
	 tRGMQKU4hxXKg7kCP9a807kvh/A7HQ/JaegAQdAspqf/Qy2N3Qh9Cxezh091DQHa2A
	 y8pUTNrBvS191eWCDbewFwt5LLZ03VE5G2/GXfPGHHM+LH2/IAZ8CdmB3SVEUhAQgz
	 8N0qGxLFx1brvEYX2E3PTW6daTjCJsLvlucxsfsQJoyb9avOJOOQbhlmtHqLseiy2n
	 SsdlM3RdWYfQyD1N94KuDBUQc4Trm9mFdeDEirAYXl19g9IqK/tpHoXDKp3WtTCHG4
	 u8fTl069ghSOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 16/18] clk: mediatek: Add MT8189 i2c clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720-mt8189-clocks-system-base-v3-16-8e6d99ab3ad2@collabora.com>
References: <20260720-mt8189-clocks-system-base-v3-0-8e6d99ab3ad2@collabora.com>
 <20260720-mt8189-clocks-system-base-v3-16-8e6d99ab3ad2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:05:34 +0000
Message-Id: <20260721100534.7089B1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free due to missing of_clk_del_provider() on error path.
--

--- Patch [16]: [PATCH v3 16/18] clk: mediatek: Add MT8189 i2c clock suppor=
t ---
commit d3f05e8828a2749801c71cd758adfe9c139d7e3f
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 i2c clock support

Add support for the MT8189 i2c clock controller,
which provides clock gate control for i2c.

> diff --git a/drivers/clk/mediatek/clk-mt8189-iic.c b/drivers/clk/mediatek=
/clk-mt8189-iic.c
> index 0000000000000..80a01706791a4 100644
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-iic.c

[ ... ]

> +static struct platform_driver clk_mt8189_iic_drv =3D {
> +	.probe =3D mtk_clk_simple_probe,

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this probe
assignment, I noticed a pre-existing issue in __mtk_clk_simple_probe() (whi=
ch
mtk_clk_simple_probe wraps).

If mtk_register_reset_controller_with_dev() fails, the error path jumps to
unregister_clks and frees clk_data, but it forgets to unregister the provid=
er:

drivers/clk/mediatek/clk-mtk.c:__mtk_clk_simple_probe() {
	...
	r =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
	...
	if (mcd->rst_desc) {
		r =3D mtk_register_reset_controller_with_dev(&pdev->dev,
							   mcd->rst_desc);
		if (r)
			goto unregister_clks;
	}
	...
unregister_clks:
	...
free_data:
	mtk_free_clk_data(clk_data);
	...
}

Because of_clk_del_provider(node) is not called on this error path, does th=
is
leave the clock provider registered in the system with a dangling pointer to
the freed clk_data memory? Could this lead to a Use-After-Free if another
driver attempts to look up a clock from this provider?

> +	.remove =3D mtk_clk_simple_remove,
> +	.driver =3D {
> +		.name =3D "clk-mt8189-iic",
> +		.of_match_table =3D of_match_clk_mt8189_iic,
> +	},
> +};
> +module_platform_driver(clk_mt8189_iic_drv);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-mt8189-clo=
cks-system-base-v3-0-8e6d99ab3ad2@collabora.com?part=3D16
