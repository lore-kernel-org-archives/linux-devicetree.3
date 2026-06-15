Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682CC2DD5F6
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 03:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781495688; cv=none; b=jFAdlefGN4mwYw/lKbmXpF8wHdUpog7el7JkwQHNYwKNIwKMQZJ4DcVnhCu3zo4zVF0DG7q7Z/ot+hkDbrY1OaQMbm23eJQpG9h96iBcM4EWmBc/gPGG70ltp3XZ/oOpsrdRlDRiF7mGrhHOF3SoAeBODG5mwLg57DQ/Pzf/TjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781495688; c=relaxed/simple;
	bh=Y5tRKFUILbacVsD1uBk8W+S17y2D0vNs1qthZR8OYPU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cne6lD+tVpCXoLWSIIvFypH2QzO0qRHALDmPT8d4ljTMn8rCSVEJNA47VQI/q6IIgdtP8J5Ep6rzyDEEypXObQ8suDVd1Nz67JxNmeACqDSG9hQFV4K+k9XkfFbcozjtjfb4aseDjpA5hkO5uBjRGvdV1N5uNxMTHPu1mSnHXkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BK82Ie8I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BK82Ie8I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC6D1F000E9;
	Mon, 15 Jun 2026 03:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781495686;
	bh=/HmwwspuBBubArgfGtmwdA3etWBJfBj8hFMDnMT1WPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BK82Ie8Ii5/1EyoDUcVXeCvRscczw2sjD53PcDuCDc4UOWcpp87l8eChkarKrDqH5
	 hp8CsghVR+3W6zJNpIeSuKuLf4jLGWSbm2ztlkUxM4FfNIuD8fe6hO0NAGiekM61c0
	 PMSJq5eSgHPE+bTvopLvluucATNpw+mlQTUYxU97287+b1DE7p+Sy964ggiLqkND6f
	 85LQWTMNoIsFTKRP8tAuD+/wOwo1K01j5xsj7BAPLh9itFdOlBo43ytDZxhFYfrBle
	 7yOSV4MXxF2lHAwThJp/dax/k65Y4+L4Fnc46ckoDePzC52oPjfdIy9d6uRSRSnofU
	 ijvlVw122FwbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/8] clk: clocking-wizard: Use dev_err_probe() when
 mapping registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubhrajyoti Datta" <shubhrajyoti.datta@amd.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260615034845.3320286-9-shubhrajyoti.datta@amd.com>
References: <20260615034845.3320286-9-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 03:54:45 +0000
Message-Id: <20260615035445.EEC6D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Redundant error logging and incorrect commit justification for d=
evm_platform_ioremap_resource()
--

commit fc6668cc718e0e8c82476eab0f48f985072a67de
Author: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

clk: clocking-wizard: Use dev_err_probe() when mapping registers

This commit wraps the error return of devm_platform_ioremap_resource() in
dev_err_probe() to align with other error paths. The commit message states
this is for consistent logging and deferred-probe behavior.

>     Align the devm_platform_ioremap_resource() error path with clk_in1 and
>     s_axi_aclk handling for consistent logging and deferred-probe behavio=
r.

[Severity: Medium]
Is the deferred-probe justification accurate for this specific function?
Since devm_platform_ioremap_resource() handles memory resources, it does
not return -EPROBE_DEFER.

> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xil=
inx/clk-xlnx-clock-wizard.c
> index fe73ee02b54ee..381e396aef0e7 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -1277,7 +1277,8 @@ static int clk_wzrd_probe(struct platform_device *p=
dev)
> =20
>  		clk_wzrd->base =3D devm_platform_ioremap_resource(pdev, 0);
>  		if (IS_ERR(clk_wzrd->base))
> -			return PTR_ERR(clk_wzrd->base);
> +			return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->base),
> +					     "failed to map registers\n");

[Severity: Medium]
Does this result in duplicate error messages in the kernel log?

The devm_platform_ioremap_resource() helper internally uses dev_err_probe()
to log its own detailed error messages for missing resources, request
failures, and ioremap failures. Wrapping the return value with an additional
dev_err_probe() in the driver might emit a redundant error string.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615034845.3320=
286-1-shubhrajyoti.datta@amd.com?part=3D8
