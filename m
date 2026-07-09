Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856D8414A31
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 11:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596024; cv=none; b=Ocw2PpxeJkJXsyUzct8PHd0z8mZ8vqsiNzjcEg0uT0PezorCi37J3i9wSbmvNAGxpjRogFCh3WlJpxCDtRrwkmokoIRVKQanmXSVT0pQFlN4Xa93twLJ9YiFeQq4J3YWgQ8UWrrLO9S5TyNHCpB2wj6C72ECvH1DQ0iiyWiMKSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596024; c=relaxed/simple;
	bh=kyqTCjcPBKDmDbhJaQIwajyRclLNv4JjG8sXxp2O4Vg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L4alziLTYGOj1BNG/zLNYPp4geP6+3+Lfj7rX+k0ycAOMGCo1sfZSF47gtpIqOZv2fvvyqumXpLoXZFJeX6gQ5R7f4k2mI2XgEPd/lUnft/gxcsWIC3/6b1aivoY1Qt5FVJvmz8mLZMmGG+3GvGi0jm6IXZsBEhOmis7wbvYl7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Grqz991b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Grqz991b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B421F00ADB;
	Thu,  9 Jul 2026 11:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783596023;
	bh=db5QYznW5xf/Hd/GXaXEuPFqjRu+CSLiGqpqeVi6r+w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Grqz991bEctGInIzL9hD+SPKFGikgEq9s2f5paUAXQ+YtLPxNtse+tB6mwTun4q+9
	 gpi1VyuafY/gybwslbxOZi2Oi5TCpQJ3yh8Na0Gvdbm77vOUV3DGYnAhqCX59Hjgrg
	 up32KUVgvs/rLG7xY3SLV/cOJLuXDLpC8s9oFYGBX0Nprq2VqBcH6IJRc//nIZvGyn
	 nfo2kUz7077xV5YBSJ7VU65ptVTlckfzvukmzOpNbIA4fvHcKwmRSGRg5mgadntn52
	 Yx67jzil8MXGjumfU9/7EN+op/hOCvv9+f0UwktTXOFGKKAKqNkVrnZb7iSfnwURSS
	 PI2p9SaBC/ORQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/8] clk: clocking-wizard: Use separate
 notifier_block for each clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubhrajyoti Datta" <shubhrajyoti.datta@amd.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709111403.1579159-9-shubhrajyoti.datta@amd.com>
References: <20260709111403.1579159-1-shubhrajyoti.datta@amd.com>
 <20260709111403.1579159-9-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 11:20:22 +0000
Message-Id: <20260709112023.02B421F00ADB@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect `container_of` cast when reusing the same notifier callb=
ack for a new `notifier_block`, resulting in a misaligned `struct clk_wzrd`=
 pointer and out-of-bounds memory accesses.
--

--- Patch [8]: [PATCH v2 8/8] clk: clocking-wizard: Use separate notifier_b=
lock for each clock ---
commit f1481850744c067369ec043b5f8c6bf3ee19d10b
Author: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

clk: clocking-wizard: Use separate notifier_block for each clock

This commit introduces a dedicated notifier_block, nb_axi, for the
s_axi_aclk chain. This prevents linked list corruption that occurs
when registering a single notifier block to multiple chains.

> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xil=
inx/clk-xlnx-clock-wizard.c
> index 289c32ab5cd80..bcbfb4341dbab 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -137,6 +138,7 @@ enum clk_wzrd_int_clks {
>   */
>  struct clk_wzrd {
>  	struct notifier_block nb;
> +	struct notifier_block nb_axi;
>  	void __iomem *base;

[ ... ]

> @@ -1318,8 +1320,10 @@ static int clk_wzrd_probe(struct platform_device *=
pdev)
>  				dev_warn(&pdev->dev,
>  					 "unable to register clock notifier\n");
> =20
> +			clk_wzrd->nb_axi.notifier_call =3D clk_wzrd_clk_notifier;
> +
>  			ret =3D devm_clk_notifier_register(&pdev->dev, clk_wzrd->axi_clk,
> -							 &clk_wzrd->nb);
> +							 &clk_wzrd->nb_axi);

[Severity: High]
Does sharing clk_wzrd_clk_notifier for nb_axi lead to an incorrect
container_of() cast?

Looking at clk_wzrd_clk_notifier(), it uses to_clk_wzrd(nb), which is
hardcoded to expect the original nb field:

#define to_clk_wzrd(_nb) container_of(_nb, struct clk_wzrd, nb)

Since nb_axi is at a non-zero offset in struct clk_wzrd (unlike nb), won't=
=20
using the same callback for nb_axi result in a misaligned struct clk_wzrd=20
pointer?=20

It seems this would lead to out-of-bounds memory accesses and incorrectly=20
skipped frequency bounds checks when the s_axi_aclk chain triggers a rate=20
change.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709111403.1579=
159-1-shubhrajyoti.datta@amd.com?part=3D8
