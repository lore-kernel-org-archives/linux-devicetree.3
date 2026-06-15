Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EED2DC76F
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 03:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781495922; cv=none; b=TY27FWRjmcnAlnheGbeechZ00ROaFe7ScrSgEwOh+t3lLN874fznkmMYz1REAHH6D3Ka+AAukbXCJlIISrt1h94fxOJlYMel7aWTZ2xXOckuAcoq47uXcLBo9xXLMVOqM6EytZB+e+1smmc6ISG7IbZyYL1LtpiSkrMzZ9USBJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781495922; c=relaxed/simple;
	bh=/kBo1xiONou1Fg1ByqINwakDFVscHfazvWeOwHDGqGQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CVRg1vf1Ml6yuHHxCq5/B2HJdGTcIhixUAKSjg0y0RzWikZlsTNqAbxPDYhnndKxgeIQcI+8KuXYNcasFo61/yPUbvFdKs9nXZWz6D6q97ppAnvx7BHyHlzlBP75+75THxdqMgDAjedVVVoilk7mVGXXnqO7HxC/kuy0Qa5GLv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lvOvEIBT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lvOvEIBT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA1D1F000E9;
	Mon, 15 Jun 2026 03:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781495921;
	bh=qLiwW1E4C/8RgcM2DNghzbu2w52Truti3DBiahOsBz8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lvOvEIBT/z2pozSv3hnRRggFe0eHr27zb1mNcUFDRVVwQaia+KZu77Oak5VmVT9To
	 Bf2pDoXL1WOr3BkP7HathqdD3R2YOHiBQSoi6/4jcXbeDVLf+l4cQ/2rdvVKZF83cQ
	 hjVWjayuwJ+3xe42tDw1Skk9T5UdJ8e5Nz3Ov2QVfjdQAxaPGtJNYTUeF0t6n4pEHX
	 3rLK0/lo5Juo+C1qfy+U+6ix5BLFpgMGEMeEcC2fMQphQUqb6ARMAJRU1rK1bRNPHu
	 ORTjqmdfrhcuw2eRRM0zJjlEHmWYi405NDxI5QLrjVPbXHCtlpyOyl/mAGf7u2ZBWL
	 cNEEle6gggiQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/8] clk: clocking-wizard: Skip s_axi_aclk for
 static-config
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubhrajyoti Datta" <shubhrajyoti.datta@amd.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260615034845.3320286-8-shubhrajyoti.datta@amd.com>
References: <20260615034845.3320286-8-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 03:58:40 +0000
Message-Id: <20260615035840.BAA1D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver registers the same `struct notifier_block` instance (`c=
lk_wzrd->nb`) to two different clock notification chains (`clk_in1` and `ax=
i_clk`), causing notifier list corruption.
--

commit 2cde73f9cf8529ad3e29f28db978947c4f80fd0e
Author: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

clk: clocking-wizard: Skip s_axi_aclk for static-config

For static-config mode the AXI bus interface is not used, so there is
no need to get and enable s_axi_aclk. Move the axi_clk setup inside
the non-static-config branch.

> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xil=
inx/clk-xlnx-clock-wizard.c
> index 5470a717fccc8..fe73ee02b54ee 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
[ ... ]
> @@ -1258,22 +1257,24 @@ static int clk_wzrd_probe(struct platform_device =
*pdev)
>  		return -ENOMEM;
>  	platform_set_drvdata(pdev, clk_wzrd);
> =20
> -	clk_wzrd->axi_clk =3D devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
> -	if (IS_ERR(clk_wzrd->axi_clk))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->axi_clk),
> -				     "s_axi_aclk not found\n");
> -	rate =3D clk_get_rate(clk_wzrd->axi_clk);
> -	if (rate > WZRD_ACLK_MAX_FREQ) {
> -		dev_err(&pdev->dev, "s_axi_aclk frequency (%lu) too high\n", rate);
> -		return -EINVAL;
> -	}
> -
>  	clk_wzrd->clk_in1 =3D devm_clk_get(&pdev->dev, "clk_in1");
>  	if (IS_ERR(clk_wzrd->clk_in1))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->clk_in1),
>  				     "failed to get clk_in1\n");
> =20
>  	if (!of_property_present(np, "xlnx,static-config")) {
> +		unsigned long rate;
> +
> +		clk_wzrd->axi_clk =3D devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
> +		if (IS_ERR(clk_wzrd->axi_clk))
> +			return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->axi_clk),
> +					     "s_axi_aclk not found\n");
> +		rate =3D clk_get_rate(clk_wzrd->axi_clk);
> +		if (rate > WZRD_ACLK_MAX_FREQ) {
> +			dev_err(&pdev->dev, "s_axi_aclk frequency (%lu) too high\n", rate);
> +			return -EINVAL;
> +		}
> +

[Severity: High]
This is a pre-existing issue, but does using the same struct notifier_block
instance for multiple clock notifiers corrupt the notification chain?

Looking further down in clk_wzrd_probe(), the same &clk_wzrd->nb instance
is registered to two different clocks:

    ret =3D devm_clk_notifier_register(&pdev->dev, clk_wzrd->clk_in1,
                                     &clk_wzrd->nb);
    ...
    ret =3D devm_clk_notifier_register(&pdev->dev, clk_wzrd->axi_clk,
                                     &clk_wzrd->nb);

Since a struct notifier_block has a single next pointer, registering the
same instance to a second chain overwrites its next pointer. Doesn't this
merge the two clock notification chains and corrupt the first notifier list?

>  		clk_wzrd->base =3D devm_platform_ioremap_resource(pdev, 0);
>  		if (IS_ERR(clk_wzrd->base))
>  			return PTR_ERR(clk_wzrd->base);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615034845.3320=
286-1-shubhrajyoti.datta@amd.com?part=3D7
