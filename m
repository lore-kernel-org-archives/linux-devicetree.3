Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD633F58FB
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 11:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596506; cv=none; b=BTJYHdOwuZrmKjXbPA9ZwJSWl2rrpc0SzpGbvWXpJugAoKVlZR0S9g5HTD+3ELnFbxWBfZ9nV4CObDGZtRnUZGJg7SgVpQtw4zKxFe+LfJPPDt58HzyJFJpSROMPuOynagPewR0qN3pks7fnFd3IjUW0Bi7Sx5nxwwA5vg/SB1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596506; c=relaxed/simple;
	bh=jH7zrJg+99oa6x5JLOCFBnA5Q6yjS656izTKDeAez/0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LhzGrpFkjItVOU7OzzAsgZWsygPJ9DOZV/giJ7fAtAvwzSmT8hhXsolY0NwCc8fVW8ob8K2S+5vfkjzV6sUWeiwl6wcf0bgC0xvheVDTmd1M3lGzC2X62DVr3XHEsJvGOUl4yELTUjUrIRXsDxkHhJsiXa6ZjQhvS/nu4NYJPkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EwURWuT5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EwURWuT5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFBAB1F00A3D;
	Thu,  9 Jul 2026 11:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783596505;
	bh=6KIeQ/rvwyQmm14e78h1ImLwXW1+W3EEcYBVyoI8wPE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EwURWuT5pDp4ER0MyYUW4kXTeoGJS/jooZDz04UcKMzi27XmXAYTHA+fU5BmpztSm
	 7WhYvtLOBGpEClUkkE3tN/yVL59up+h+18jiDA0QsGz+FF+3UWmvOnOxhnMR+t4iHP
	 OxcdR8GlXH2LBy3z2dWyGy9Cve73Cy1RFBR+zVnHxaydCh33A/LrRXm4EVEH6WA1AF
	 1pbP2lRXEkz5bGrM9K+QTa0BZSAmYBegwjgg/L07BBSgFLzqr3NpweTiUDAbFud6kH
	 FI0/xooRTbFsshqUtGzFal61IgLia/Q9+7nsvnZjDF8Vs4mtlBupflPzBvk6jNgi9f
	 DPbHM0RRlHgtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/8] clk: clocking-wizard: Skip s_axi_aclk for
 static-config
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubhrajyoti Datta" <shubhrajyoti.datta@amd.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260709111403.1579159-6-shubhrajyoti.datta@amd.com>
References: <20260709111403.1579159-1-shubhrajyoti.datta@amd.com>
 <20260709111403.1579159-6-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 11:28:24 +0000
Message-Id: <20260709112824.BFBAB1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Double registration of the same `struct notifier_block` instance i=
nto two different SRCU notifier chains.
--

--- Patch [5]: [PATCH v2 5/8] clk: clocking-wizard: Skip s_axi_aclk for sta=
tic-config ---
commit 02fdca3c9a0733ff035a7b08c1d76f778176b4c1
Author: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: clk: clocking-wizard: Skip s_axi_aclk for static-config

This patch moves the axi_clk setup into the non-static-config branch,
skipping the s_axi_aclk initialization when the AXI bus interface is not
used in static-config mode.

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

[Severity: High]
This is a pre-existing issue, but since we are modifying the setup of
axi_clk here, does the subsequent notifier registration corrupt the core
clock notifier lists?

Looking further down in drivers/clk/xilinx/clk-xlnx-clock-wizard.c in
clk_wzrd_probe(), the exact same notifier block instance is registered to
two different clocks unconditionally when xlnx,speed-grade is set:

    if (clk_wzrd->speed_grade) {
        clk_wzrd->nb.notifier_call =3D clk_wzrd_clk_notifier;

        ret =3D devm_clk_notifier_register(&pdev->dev, clk_wzrd->clk_in1,
                                         &clk_wzrd->nb);
        ...
        ret =3D devm_clk_notifier_register(&pdev->dev, clk_wzrd->axi_clk,
                                         &clk_wzrd->nb);
    }

Since srcu_notifier_chain_register() modifies the next pointer of the
passed notifier_block, doesn't the second registration overwrite the next
pointer established by the first?

Could this break the clk_in1 notifier list, causing its traversal to follow
into the axi_clk notifier list, potentially leading to an infinite loop,
skipped notifiers, or a kernel panic upon subsequent rate changes?

> +		if (IS_ERR(clk_wzrd->axi_clk))
> +			return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->axi_clk),
> +					     "s_axi_aclk not found\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709111403.1579=
159-1-shubhrajyoti.datta@amd.com?part=3D5
