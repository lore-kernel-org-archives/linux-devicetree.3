Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FE93ACA65
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 11:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785669760; cv=none; b=IWqjX6oVdzLukuUbiIy5DiHiqWibtIN9ZouPDafptAg0vUcAchFD4jd94xlWVUyNDyHD0dr6edyDrPUB1ru5izrdHxFLfohtKHPrGDi1gghPrzcyaS/KYAkNDtpMdA3emva7UA93erexX4DrO1c7BblfBl+3qKuQ4QnP3YM6M4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785669760; c=relaxed/simple;
	bh=9j/bkdYfEdKR4V+KC1RCl9cUsc7jG2SaprT76Q0rlIA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gt8XkeMPtB+3MaF4qKeyaDujzwMM1UFCFh+RJNcOLF7OgAllxGGKqYHEfy5ZtcIQ3+JHRXCYJf99HZsORMQmSmEzpqU991xgsdl++JrtUYsLnCvV+Gu22FMy749E5MU9YuTLwhUTcPxo3NP4FUM+lQ+MzLSGpR8fE+50/unpWxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSG8PNBW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSG8PNBW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FD41F00A3E;
	Sun,  2 Aug 2026 11:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785669758;
	bh=Jht/k0t/lwD2X1xbCObD/9lhHnsH9Z6bfTRpCLEwWUQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lSG8PNBWBAkzR4PLUyqlz8fjnQH1IEPRXLTRbb7Y7yWCRFT4pUEmljmh4xr2eZhGp
	 sQFjVXguHDJvuwkIe/TZMsVQfmWv0iPvFGVbK8uk/oY61OLvoUTYQVEKq9CRMYYnS8
	 3J0vRrsyTck6WqkZBfPrOwUbrHUKiAHOtiKMNuAEYl1N7PyLPqfoBTgEEzQ+hKS5bk
	 SoE2xvgnI5BqxCxGCQkeV2CL5bfPwkE8wsl3i8iG9+JyPe5BRqrjSpmh+2yVYgBEiW
	 uSW8pcf0v2OE2V9DyqvrVzGSIPU8A7b7GV0WbEpSyzFHB9fFuhe3wzFPqDA0WSMWBX
	 XfkWBduyMxzeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 24/25] clk: mediatek: Add MT8189 scp clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-24-ac4410697cc2@collabora.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-24-ac4410697cc2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 11:22:37 +0000
Message-Id: <20260802112238.38FD41F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The clock provider is not unregistered when `mtk_register_reset_co=
ntroller_with_dev()` fails, leading to a Use-After-Free.
--

--- Patch [24]: [PATCH v5 24/25] clk: mediatek: Add MT8189 scp clock suppor=
t ---
commit cfb69aff7b6d0acebfb8964210288168aecca4f1
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 scp clock support

Add support for the MT8189 scp clock controller, which provides
clock gate control for System Control Processor.

> diff --git a/drivers/clk/mediatek/clk-mt8189-scp.c b/drivers/clk/mediatek=
/clk-mt8189-scp.c
> new file mode 100644
> index 0000000000000..75197cd98b521
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-scp.c
[ ... ]
> +static const struct of_device_id of_match_clk_mt8189_scp[] =3D {
> +	{ .compatible =3D "mediatek,mt8189-scp-clk", .data =3D &scp_mcd },
> +	{ .compatible =3D "mediatek,mt8189-scp-i2c-clk", .data =3D &scp_iic_mcd=
 },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, of_match_clk_mt8189_scp);
> +
> +static struct platform_driver clk_mt8189_scp_drv =3D {
> +	.probe =3D mtk_clk_simple_probe,

[Severity: High]
This is a pre-existing issue, but I noticed this driver relies on
mtk_clk_simple_probe(), which appears to have a use-after-free on its error
path.

In drivers/clk/mediatek/clk-mtk.c:__mtk_clk_simple_probe(), the clock
provider is registered via of_clk_add_hw_provider(). If the subsequent reset
controller registration fails, the code jumps to unregister_clks:

	r =3D mtk_register_reset_controller_with_dev(&pdev->dev,
						   mcd->rst_desc);
	if (r)
		goto unregister_clks;

The cleanup path then frees clk_data without unregistering the clock provid=
er
first:

unregister_clks:
	mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
free_data:
	mtk_free_clk_data(clk_data);

Because of_clk_del_provider() is never called on this error path, the OF
provider list retains a dangling pointer to the freed clk_data. Could a
subsequent clk_get() that matches this provider's device node dereference
the freed memory?

> +	.remove =3D mtk_clk_simple_remove,
> +	.driver =3D {
> +		.name =3D "clk-mt8189-scp",
> +		.of_match_table =3D of_match_clk_mt8189_scp,
> +	},
> +};
> +module_platform_driver(clk_mt8189_scp_drv);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-mt8189-clo=
cks-system-base-v5-0-ac4410697cc2@collabora.com?part=3D24
