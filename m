Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360DC2DF701
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 15:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696155; cv=none; b=E4Is82wv/jyuNr4lb7f9FW5DowWGzZkU4CPN4F2azCDj1Gq+hRBvR0VHcGNvjZ5zhH/jvs65LRVyZJgJi92JkX3rpqxjL0CeF7OH0krgmlsu7u08AKois3CEr405E/5xQ55ge8FiU6hxsBosd1lnYVNfyGjHsFLq88h10Ww1I+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696155; c=relaxed/simple;
	bh=ZqXpfsLW+rzk2cqAVG0jYII1lKWrKY6I+Vzt6Meak7M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M1q8ejZXcI2D7NR4R2twwef29iGe8WolqUlEK5Zl/H4ua/R4z4gOE4ZAAijpPjPxgWBFdRRilnFkxl4AslmZnh4PDeZ36YF1chvyOsANr+YEwxOCUlIMVWu63r7SQ3Nlz0FWj9ZkvwtTiFc+OKpHLpbs+gjNXom22ciMdI9YpMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRb5OY7r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRb5OY7r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD1F1F00A3F;
	Fri, 10 Jul 2026 15:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783696152;
	bh=VI6byPbPPJ6p5uVtMED65mFTPrIVTyRUHefZ5zfcgWw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PRb5OY7r6o/fgXXpFNc6uzwEHwiD+/QJSQ/W3kRwChrbU5URkZaw1CA9TsVd/O//F
	 Wv5Typ4SleA8xTLf6x+Stm/JYZV19fRzkQXPMgZYRuNE05Xxby6py5qhWxFKqxGyTg
	 5fBeBHTOKpjHUD18e648f1j3VE+lv4hwXgT6NIXa5nxxYriJ6WMkz/ftbVLHV6Ow8Y
	 7R0VLUAA34yhtBZn4XyqJRySJiekZKGU5EwMQjxDev2GW52XWiqkZpDBSdrdTtCvSH
	 81KryH+nAwQno2fKYT9obBFBcn5oY26ZP28kPboCh42yzdHpHpIughq5VzIR9dkV+D
	 2tgu3QvZynMhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 18/18] clk: mediatek: Add MT8189 ufs clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709-mt8189-clocks-system-base-v2-18-2926da3db6cf@collabora.com>
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
 <20260709-mt8189-clocks-system-base-v2-18-2926da3db6cf@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 15:09:11 +0000
Message-Id: <20260710150912.6AD1F1F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing `of_clk_del_provider()` in the error path of `__mtk_clk_si=
mple_probe()` leaves a dangling clock provider pointer, leading to a potent=
ial use-after-free.
--

--- Patch [18]: [PATCH v2 18/18] clk: mediatek: Add MT8189 ufs clock suppor=
t ---
commit 9858e88b79ed61ffe0a3b2d09755d7d4f94f084e
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 ufs clock support

This commit adds support for the MT8189 UFS clock controller, providing clo=
ck
gate control for Universal Flash Storage. It introduces a new driver handli=
ng
clock sources, dividers, and gates specific to the MT8189 platform.

> diff --git a/drivers/clk/mediatek/clk-mt8189-ufs.c b/drivers/clk/mediatek=
/clk-mt8189-ufs.c
> new file mode 100644
> index 0000000000000..85afab04420f8
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-ufs.c
[ ... ]
> +static const struct mtk_clk_rst_desc ufscfg_ao_rst_desc =3D {
> +	.version =3D MTK_RST_SET_CLR,
> +	.rst_bank_ofs =3D ufscfg_ao_rst_ofs,
> +	.rst_bank_nr =3D ARRAY_SIZE(ufscfg_ao_rst_ofs),
> +	.rst_idx_map =3D ufscfg_ao_rst_idx_map,
> +	.rst_idx_map_nr =3D ARRAY_SIZE(ufscfg_ao_rst_idx_map),
> +};
> +
> +static const struct mtk_clk_desc ufscfg_ao_reg_mcd =3D {
> +	.clks =3D ufscfg_ao_reg_clks,
> +	.num_clks =3D ARRAY_SIZE(ufscfg_ao_reg_clks),
> +	.rst_desc =3D &ufscfg_ao_rst_desc,

[Severity: High]
This is a pre-existing issue, but does setting .rst_desc here expose a
potential use-after-free in the probe error path?

Looking at __mtk_clk_simple_probe() in drivers/clk/mediatek/clk-mtk.c:

	r =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
	if (r)
		goto unregister_clks;

	platform_set_drvdata(pdev, clk_data);

	if (mcd->rst_desc) {
		r =3D mtk_register_reset_controller_with_dev(&pdev->dev,
							   mcd->rst_desc);
		if (r)
			goto unregister_clks;
	}

If mtk_register_reset_controller_with_dev() fails, the code jumps to
unregister_clks, which frees clk_data without calling of_clk_del_provider().
Any subsequent attempt to resolve a clock from this node could trigger a
use-after-free on the freed clock provider pointer.

Should __mtk_clk_simple_probe() be fixed to cleanly unregister the provider
before this new driver uses .rst_desc?

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-mt8189-clo=
cks-system-base-v2-0-2926da3db6cf@collabora.com?part=3D18
