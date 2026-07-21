Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BCB446BE5
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628335; cv=none; b=hPDQUz0df3ic6NpVGa04qF8eBJ9W5L0LpfY5y5ENlcu2ht9MlLj9K+CW7NPlxdn1wpIFz4jZ73aRZMFsIjuJKUdUTkwJ9zNDh0CeDQaer1HfBj2P2TImwh/CQb7vIaqMd70nsPpZG1bpK38xkFkGLRAJaOeYaTjYS4OCK0BIP+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628335; c=relaxed/simple;
	bh=McTNTaMWS4dE4aIFg2rbmyMU0p5zKr7gVPF9i8jsLcM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vCTP238O9IJx1B7aHTt1HUHxUGt6LbnymGjoyj6sMPTThbe0bV5lmzNHq9GmNsS8CNtE9+zJNzxQF61LZQJ27Oe7uVTj2Keom3MIm0PsHyTIO0sMt6UPVuEes14IzHzB5xVkDerKFit3anSPq6dRg5HZTh/KLLrrY+hedwtAcf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvaScd6g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvaScd6g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41AB1F000E9;
	Tue, 21 Jul 2026 10:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784628333;
	bh=W7+uOwvsuHR2k3Sxv+cfKRBZWqhdf1EhNoeFtK0t/wA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JvaScd6g/F7wUO87uw5/V8DTUhqne+hj6zmG7fl9GzEP9pNXf2L9zkZruHZWfxyi2
	 aWVIk1zNAv64lUlAL9usejp4sAe8cr2mKGng0t8dKMwOrHV/2mOjHLwFztEppPfun4
	 x6nnZquNeXlR5kiOakjplzisyELl9xFF1nfUYLSzkD4O5K5wfCYFe2BlkD+LSMie1u
	 ygxpRTWOUpndKp63f8R2ubFqQwHgPEELWdV3Ovfdtg5Onr++ObHlhneO29FHKc974C
	 1neadrfgwFC/ajtnkxX1SBdp06WTMGtlY8NvkdXmwYprZoMA2uGQWlGaYwkgPTJsy0
	 i/LsfOACQc8MQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 13/18] clk: mediatek: Add MT8189 bus clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260720-mt8189-clocks-system-base-v3-13-8e6d99ab3ad2@collabora.com>
References: <20260720-mt8189-clocks-system-base-v3-0-8e6d99ab3ad2@collabora.com>
 <20260720-mt8189-clocks-system-base-v3-13-8e6d99ab3ad2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:05:33 +0000
Message-Id: <20260721100533.A41AB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] In `__mtk_clk_simple_probe()`, failing to register a reset control=
ler leaks the clock provider, leading to a Use-After-Free.
--

--- Patch [13]: [PATCH v3 13/18] clk: mediatek: Add MT8189 bus clock suppor=
t ---
commit d3c19cc0c5f63d9545bd23ef786acfaedbc92bed
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 bus clock support
   =20
Add support for the MT8189 bus clock controller, which provides clock gate
control for infra/peri IPs.

> diff --git a/drivers/clk/mediatek/clk-mt8189-bus.c b/drivers/clk/mediatek=
/clk-mt8189-bus.c
> new file mode 100644
> index 0000000000000..494f25e85d11c
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-bus.c

[ ... ]

> +static const struct of_device_id of_match_clk_mt8189_bus[] =3D {
> +	{ .compatible =3D "mediatek,mt8189-infra-ao", .data =3D &ifrao_mcd },
> +	{ .compatible =3D "mediatek,mt8189-peri-ao", .data =3D &perao_mcd },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, of_match_clk_mt8189_bus);
> +
> +static struct platform_driver clk_mt8189_bus_drv =3D {
> +	.probe =3D mtk_clk_simple_probe,

[Severity: High]
This is a pre-existing issue, but since this new driver uses
mtk_clk_simple_probe(), it might be affected by an error handling bug in
the shared probe code.

Does the error path in drivers/clk/mediatek/clk-mtk.c:__mtk_clk_simple_prob=
e()
miss deregistering the OF clock provider when reset controller registration
fails?

drivers/clk/mediatek/clk-mtk.c:__mtk_clk_simple_probe() {
    ...
			r =3D mtk_register_reset_controller_with_dev(&pdev->dev,
							   mcd->rst_desc);
			if (r)
				goto unregister_clks;
    ...
}

If mtk_register_reset_controller_with_dev() fails (e.g., due to memory
allocation failure), the code jumps to the unregister_clks label and frees
the clk_data structure without calling of_clk_del_provider().

Could this lead to a use-after-free if a subsequent clock lookup dereferenc=
es
the freed clk_data memory?

> +	.remove =3D mtk_clk_simple_remove,
> +	.driver =3D {
> +		.name =3D "clk-mt8189-bus",
> +		.of_match_table =3D of_match_clk_mt8189_bus,
> +	},
> +};
> +module_platform_driver(clk_mt8189_bus_drv);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-mt8189-clo=
cks-system-base-v3-0-8e6d99ab3ad2@collabora.com?part=3D13
