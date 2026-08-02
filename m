Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611C73ACA7F
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 11:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785669761; cv=none; b=i9Zt0qCHgCecQMV2/38kqVG8u5P1HtP5GNmHqiYXYR7VprWgvvYLwOXDIQtvj8kxAq7NAqr6m5f9QKJo/3zIKAPkjk2l/E7iJBHHnKFjdmNloH95V5+fPbjG/R534qnUAVgd2Z5JbtNNWSTAFLB6kI0M+y9IxPNDAczWKfan0NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785669761; c=relaxed/simple;
	bh=2X03g8yG2Wa/8qDGY6bz74KW4zifkS7tJdf+EYwFm5Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nd3zg8gsYAth+XpHP1HZmw05SItXtW7ne1gjaElSVCOS7piaTzZ+b6KgcaOQwUvUvw3lNlMGo/i2j3V8UoYze3dNpnJgwlvrpEZd6Lll48enPx0tOOBPfBAAmKKL3c0Pat9Ay7uSAicbYJTbtamGq56Pg61OHmTro1VVZWJbvfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3MuljaZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3MuljaZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F441F00A3A;
	Sun,  2 Aug 2026 11:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785669759;
	bh=p0sEhmpDbLTmBkodAltn3gaTqIaxOO43aTgUSmdXp6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o3MuljaZj8lclC2s5bguPeahxP2nM5CpygkVdIDm60Swd9ikFe4E4fbMtJ7lt+/IJ
	 esADECR8fCKZkjqRY68Ng7IKsnLiHpEZNVJ6iSg65rQJ2eWMi0+xpGe/mUyNJXPsPd
	 U9XmuMAU2vCZR+Ae1nS5iMYVxMikXKXjl07OOB5B7LwvieIpW4y6aomDRpC2YAZ7Q0
	 ZccLPqLuTZ2TMqdzitA4RyC8f5NFTJK2MRYXnH6RRUzuJO8xVFC6oQQUECREqpiIf9
	 TeGxmi6eu7Tis+d0ovZqqfvPU4DX0b1VfWIw6yVFZdkPoApRToHCfVwxZLGVwr6UoW
	 3AO3f/E43G+SA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 25/25] clk: mediatek: Add MT8189 ufs clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-25-ac4410697cc2@collabora.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-25-ac4410697cc2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 11:22:38 +0000
Message-Id: <20260802112239.04F441F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but missing `of_clk_=
del_provider()` on the error path in `__mtk_clk_simple_probe()` leads to Us=
e-After-Free.
--

--- Patch [25]: [PATCH v5 25/25] clk: mediatek: Add MT8189 ufs clock suppor=
t ---
commit b3bac535ba9ad99268bbb264f23284ef21189814
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 ufs clock support

This commit adds support for the MT8189 ufs clock controller. It provides
clock gate control and reset capabilities for Universal Flash Storage on the
MT8189 SoC.

> diff --git a/drivers/clk/mediatek/clk-mt8189-ufs.c b/drivers/clk/mediatek=
/clk-mt8189-ufs.c
> new file mode 100644
> index 0000000000000..85afab04420f8
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-ufs.c

[ ... ]

> +static struct platform_driver clk_mt8189_ufs_drv =3D {
> +	.probe =3D mtk_clk_simple_probe,

[Severity: High]
This is a pre-existing issue, but does the error path in
__mtk_clk_simple_probe() leave a dangling pointer in the OF clock provider
list if reset controller registration fails?

When mtk_register_reset_controller_with_dev() fails, the code jumps to
unregister_clks:

drivers/clk/mediatek/clk-mtk.c:__mtk_clk_simple_probe() {
    ...
	if (mcd->rst_desc) {
		r =3D mtk_register_reset_controller_with_dev(&pdev->dev,
							   mcd->rst_desc);
		if (r)
			goto unregister_clks;
	}
    ...
unregister_clks:
	if (mcd->clks)
		mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
...
free_data:
	mtk_free_clk_data(clk_data);
}

The unregister_clks error path frees clk_data but appears to miss calling
of_clk_del_provider() if of_clk_add_hw_provider() had already succeeded.=20

Could this cause a use-after-free if a subsequent clock lookup invokes
of_clk_hw_onecell_get() with the freed clk_data pointer? Since this new
driver registers a reset controller and uses this probe function, it might
be exposed to this vulnerable error path if reset registration fails.

> +	.remove =3D mtk_clk_simple_remove,
> +	.driver =3D {
> +		.name =3D "clk-mt8189-ufs",
> +		.of_match_table =3D of_match_clk_mt8189_ufs,
> +	},
> +};
> +module_platform_driver(clk_mt8189_ufs_drv);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-mt8189-clo=
cks-system-base-v5-0-ac4410697cc2@collabora.com?part=3D25
