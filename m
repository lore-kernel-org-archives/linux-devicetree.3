Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462923ACA79
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785483209; cv=none; b=LGtfcSDESSfrLpHO6s9QwokYCevmmmK9slm8lr2r8B0mfHjHCJHh3d1lNOSRPXUQ/h+JpQ0i4sUFLPCFN8KUZut8ia/2qEYalo3x/eBAeax0PLcYUROLhjGp8PUM6p5I9PCxKvIzP4oqPgXSYkLyeDhgA2nZ9Duaz5fp5asyVKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785483209; c=relaxed/simple;
	bh=O941O6lI4wxrmp/WZBHnKblbmSRu2GHn/a4YLgj7Pto=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iWRUeWSsSrByn/Nf5wTOERnEMWys3q/FbIenfukDay0nnelrd+h07Yu9XzmPgjrbZTPT52cNlJ1nfvHVG22YMoV4MlW3PLtRj0Sap9b4pguRWb4HrARg0yI7tR+Hjk5+BsOwBCW2Svf76hq1JJjv3OSJuBlkGHBxHWfgS2Sd//w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DI9lyiVE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DI9lyiVE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19CC11F000E9;
	Fri, 31 Jul 2026 07:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785483206;
	bh=3+xzltafRHtrrR6AlGlcPiDjh4oWWA32RF9gJk5Ol3E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DI9lyiVEbNW0MTZUaisB4rBzOmBh4NqH5GaG/gdKYi3occJ7zbRDtwFQGL6emD/aN
	 T1cSqL4EqRYZibrnXaZbjCQaisRVWeXGRgYbyuJf0mCGqNemekc24DpCy86xHsyWUK
	 gr4vF55bvdXh/7zL8IezhZXiU0Fm1g3kUfEZdNxgUuF3E/d4gRSetq0tCzc5y+i0WJ
	 X/YkhMmAsrcuEF+OVvhU9G1KWmmSD+dqBrjQeiTvvc1gbwoPsCC8XQ0VHCJFLZBjFh
	 +SYdyyBCkvczuvW5HJmF38QyzX8UU0CmmUpC9Y10JBucrgQWTE8yQL3Loko3vVSGfP
	 KRX7McrDeMmAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/8] clk: clocking-wizard: Move clk_in1 acquisition
 before static-config check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubhrajyoti Datta" <shubhrajyoti.datta@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260731072049.957624-4-shubhrajyoti.datta@amd.com>
References: <20260731072049.957624-1-shubhrajyoti.datta@amd.com>
 <20260731072049.957624-4-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 07:33:25 +0000
Message-Id: <20260731073326.19CC11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Missing implementation for static-config mode clock registration
- [High] Unconditional s_axi_aclk acquisition breaks static-config mode pro=
be

Pre-existing issues:
- [High] Double registration of the same notifier_block corrupts SRCU notif=
ier chains
--

--- Patch [3]: [PATCH v3 3/8] clk: clocking-wizard: Move clk_in1 acquisitio=
n before static-config check ---
commit 7ab44b637bfcd95c4cb1c02dbfa9fac870a83ce3
Author: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

clk: clocking-wizard: Move clk_in1 acquisition before static-config check
   =20
The clk_in1 is the input clock for both the dynamic reconfig and the
static-config paths. Acquire clk_in1 for static-config as well. Output
clocks are registered as fixed-factor children of clk_in1.

> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xil=
inx/clk-xlnx-clock-wizard.c
> index e082051221bef..ffc78c90bee6f 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -1178,6 +1178,11 @@ static int clk_wzrd_probe(struct platform_device *=
pdev)
>  		return -EINVAL;
>  	}
> =20

[Severity: High]
Does unconditionally fetching s_axi_aclk break the probe for static-config
mode?

Earlier in clk_wzrd_probe():

	clk_wzrd->axi_clk =3D devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
	if (IS_ERR(clk_wzrd->axi_clk))
		return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->axi_clk),
				     "s_axi_aclk not found\n");

If the device tree bindings explicitly omit s_axi_aclk when using
xlnx,static-config, wouldn't this unconditional fetch return -ENOENT and
abort the probe?

> +	clk_wzrd->clk_in1 =3D devm_clk_get(&pdev->dev, "clk_in1");
> +	if (IS_ERR(clk_wzrd->clk_in1))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->clk_in1),
> +				     "failed to get clk_in1\n");
> +
>  	if (!of_property_present(np, "xlnx,static-config")) {

[Severity: High]
Does this code skip registering output clocks for the static-config mode?

The commit message states that "Output clocks are registered as fixed-factor
children of clk_in1".

However, since all the clock registration logic is inside the
!of_property_present(np, "xlnx,static-config") block, it seems this mode
just returns 0 without parsing xlnx,clk-mul-div or calling any clock
registration functions.

>  		clk_wzrd->base =3D devm_platform_ioremap_resource(pdev, 0);
>  		if (IS_ERR(clk_wzrd->base))

[ ... ]

> @@ -1192,11 +1197,6 @@ static int clk_wzrd_probe(struct platform_device *=
pdev)
>  			}
>  		}
> =20
> -		clk_wzrd->clk_in1 =3D devm_clk_get(&pdev->dev, "clk_in1");
> -		if (IS_ERR(clk_wzrd->clk_in1))
> -			return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->clk_in1),
> -					     "clk_in1 not found\n");
> -
>  		ret =3D clk_wzrd_register_output_clocks(&pdev->dev, nr_outputs);
>  		if (ret)
>  			return ret;

[Severity: High]
This isn't a bug introduced by this patch, but does registering the same
notifier block twice corrupt the SRCU notifier chains?

Later in clk_wzrd_probe():

	ret =3D devm_clk_notifier_register(&pdev->dev, clk_wzrd->clk_in1,
					 &clk_wzrd->nb);
	...
	ret =3D devm_clk_notifier_register(&pdev->dev, clk_wzrd->axi_clk,
					 &clk_wzrd->nb);

The struct notifier_block has a single next pointer used by the kernel's
list implementation. Registering the single clk_wzrd->nb instance to two
distinct lists overwrites its next pointer, which can physically merge the
two independent clock notifier lists and drop any notifiers that followed in
the first list.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731072049.9576=
24-1-shubhrajyoti.datta@amd.com?part=3D3
