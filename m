Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528B3394785
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 11:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596318; cv=none; b=UvXZ77TdIKLU/e4Gx4S110sJxa1pE68Ny8riGOkA6b3mikxgrsgLO91foyDoLqKOtsCjcz9TCApHAYVFCo67n9mBGidSkSkfXU0Vi7QyQ3E6v1Hx+DRoG8GfnYUasUzgqBC9uw8HoCxp+GSmzvmHm+T6Yiz16wFpx/wF3J7k1g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596318; c=relaxed/simple;
	bh=6caxVkzzRVT+eNSOfT4LzvVWCk9jSUN5vNN2llWnPFk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A7CiCW98m0mg2t9/Sg/XbTUKj/SIkbAIzfrXb1F6B3KK7+PWKK5YARQ7VwG3Tp4YaV3+dslqIpks6PeG8KMfFdViQFimZGc2w4dEPftJ0E/h8nK/Gw0ngA91SaFgkR5USfUMDKCoRF2XHYkHq2fT3gNe9FT028tGZmji9SmW+Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VdKbDSNs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VdKbDSNs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9842B1F000E9;
	Thu,  9 Jul 2026 11:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783596316;
	bh=yN0MUTjfwX7R1FN+69fBWXi/+kW0cdRfeyQLF+wHtCY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VdKbDSNsojro88Rzo7UssR6ZlFXlL0Y8bbFxRu0VNNId4ESqzLB3AXfP5EkswV2WH
	 xVt5tnC4zlEyvngJKnJ9Voc7Xbn1OcE6hZocm/bcsp9B/1M3HRwOhc5evTbRE75fXC
	 3k8nLjm/6J1P3qU6269vPgFQrnZbs3HKeIhuJiYkfMh/EG6fKdultRQ87LUyYIadNY
	 U1TwZ4dc031fRJ3PrK1iiDKWZBsJeJjXYhYQgNxXIz3ZTF0sW5tkggvjQr5WDL1V6m
	 Y1X6DzdcUSyFzEuOTuXyxSwv0AGur3a5UuMCtsdSgB5Jn2pLFfM4/D7IMRcldCCue0
	 EV4FTxKIqC/6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/8] clk: clocking-wizard: Use dev_err_probe() when
 mapping registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubhrajyoti Datta" <shubhrajyoti.datta@amd.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260709111403.1579159-7-shubhrajyoti.datta@amd.com>
References: <20260709111403.1579159-1-shubhrajyoti.datta@amd.com>
 <20260709111403.1579159-7-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 11:25:16 +0000
Message-Id: <20260709112516.9842B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Wrapping `devm_platform_ioremap_resource()` in `dev_err_probe()`=
 causes redundant double error logging, and the commit message's justificat=
ion regarding deferred-probe behavior is factually incorrect.

Pre-existing issues:
- [High] Registering the exact same `struct notifier_block` instance (`clk_=
wzrd->nb`) to two different clock notifier chains corrupts the SRCU linked =
lists.
--

--- Patch [6]: [PATCH v2 6/8] clk: clocking-wizard: Use dev_err_probe() whe=
n mapping registers ---
commit 62924401e7cb937dd4102855b2b6f8bf68175467
Author: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

clk: clocking-wizard: Use dev_err_probe() when mapping registers

This commit updates the error handling for mapping registers in the clock
wizard driver. It replaces a direct return of the error code with a call
to dev_err_probe().

> Align the devm_platform_ioremap_resource() error path with clk_in1 and
> s_axi_aclk handling for consistent logging and deferred-probe behavior.

[Severity: Medium]
Is this description accurate regarding deferred-probe behavior?

Since devm_platform_ioremap_resource() never returns -EPROBE_DEFER, could
the commit message be more precise about what deferred-probe behavior is
expected here?

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
Does wrapping devm_platform_ioremap_resource() with dev_err_probe() cause
redundant error logging?

Because devm_platform_ioremap_resource() calls __devm_ioremap_resource()
internally, which natively utilizes dev_err_probe() to print detailed error
messages for all its failure modes, would this exact same failure end up
being logged twice?

[Severity: High]
This is a pre-existing issue, but does registering the same notifier block
instance to two different clock notifier chains corrupt the SRCU linked
lists?

Looking at clk_wzrd_probe(), the driver attempts to register the exact same
notifier block instance to both clk_in1 and axi_clk:

drivers/clk/xilinx/clk-xlnx-clock-wizard.c:clk_wzrd_probe() {
    ...
    clk_wzrd->nb.notifier_call =3D clk_wzrd_clk_notifier;

    ret =3D devm_clk_notifier_register(&pdev->dev, clk_wzrd->clk_in1,
                                     &clk_wzrd->nb);
    if (ret)
        dev_warn(&pdev->dev,
                 "unable to register clock notifier\n");

    ret =3D devm_clk_notifier_register(&pdev->dev, clk_wzrd->axi_clk,
                                     &clk_wzrd->nb);
    ...
}

Because a notifier_block structure contains a next pointer used to link it
into a singly-linked list, does registering it to the second clock's chain
overwrite the next pointer and corrupt the first clock's notifier list?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709111403.1579=
159-1-shubhrajyoti.datta@amd.com?part=3D6
