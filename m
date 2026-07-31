Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036752DB791
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785483218; cv=none; b=NDRj9LVbIBIUQRR8smIRUJdM+iKn3KgZbXMP68SdFr+r6HYzQ8xAXfTq+2UyDmJu4LjNNO7CNECm8clL7mgBkYKJMz7TAxTM27BEn4g6Lt4269a/kVb4hnpXQ5vJ44SejqjmBXKWWeZ5fJ9L6uyJdxt6qdIuQr8F2HJIrlvkZkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785483218; c=relaxed/simple;
	bh=+vSquBJwrk+SgxDsUpaPXkiFbUoF7FBEtpyQgr3QIR4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nqY2h/8JwqXQard3YoY4kvxmGZwdClvPOpgZv+6wsRJi4mjmuyuv5kcirTHhHVqPodf11qc2M0xNh3AZB44HnlU4DL7GsZKkrWKhCYIfGPe2lWu52BNQyrdorLlPhi28GLfufCYCst+HbNMfp76uaCLZ1+yAHtcnME49kgvbv9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+6nvHli; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+6nvHli"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D041F000E9;
	Fri, 31 Jul 2026 07:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785483212;
	bh=XFZdcQVhUe2GMcR7/McyCdg1waMLp2a628toNs5DZaU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H+6nvHlihZe5wRHQSkN4JFwvS85XyrBHQjpuG4cqvprM4VBdLcMxwjXMxftv4rP9w
	 jNLJ/LKZgWvNqjkaI5YDWvVTxZB0HDdBqyzK4Y2y+SEi2GZH3vnjsh30wQlPXFI3Yl
	 KDAFJNk92Iuz1PxJq7+IfAKgND7rehTCl/cvh1ya+8vkTz14wzF/1ERDN4mTJny8GQ
	 wxYf6TbraRfaaITSJL42+1QJ3PTjRd7/JHmVcEj/auLLy7vxc7iw7LV1k/0EaX0CyS
	 +8mdY/gjJ3OMduyB9T/pOKU9EimTqKsgJY80bubqW/6y6aMeIHNh8Ds5M3mNWcX66q
	 EC9jgVYZGJLFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/8] clk: clocking-wizard: Do not map the memory for
 static-config
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubhrajyoti Datta" <shubhrajyoti.datta@amd.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260731072049.957624-3-shubhrajyoti.datta@amd.com>
References: <20260731072049.957624-1-shubhrajyoti.datta@amd.com>
 <20260731072049.957624-3-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 07:33:32 +0000
Message-Id: <20260731073332.92D041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Unconditional AXI clock fetch breaks probe in static-config mode.

Pre-existing issues:
- [High] Driver completely skips parsing and registering output clocks when=
 static-config is enabled, acting as a silent stub.
- [High] The driver shares a single `struct notifier_block` instance to reg=
ister rate-change notifiers for two different clocks, corrupting the kernel=
's SRCU notifier chains.
- [High] Ineffective value cap allows writing out-of-range values to hardwa=
re registers.
--

--- Patch [2]: [PATCH v3 2/8] clk: clocking-wizard: Do not map the memory f=
or static-config ---
commit 5be3eccdee47c9c51ffe9fd16deab92141ef8346
Author: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: clk: clocking-wizard: Do not map the memory for static-config

With xlnx,static-config the MMCM/PLL topology is fixed at synthesis time
and no register programming is performed; only the dynamic path needs
the AXI register block. Move devm_platform_ioremap_resource() under the
non-static-config branch.

> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xil=
inx/clk-xlnx-clock-wizard.c
> index 4a0136349f71a..e082051221bef 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c

[ ... ]

> static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long rat=
e,
> 				     unsigned long parent_rate)
> {
[ ... ]
> 	value =3D DIV_ROUND_CLOSEST(parent_rate, rate);
>=20
> 	/* Cap the value to max */
> 	min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
>=20
> 	/* Set divisor and clear phase offset */
> 	writel(value, div_addr);

[Severity: High]
This is a pre-existing issue, but is the value cap effective here?

The min_t() macro evaluates as a standalone statement and doesn't modify its
arguments in place. Because the returned minimum value is discarded, the
'value' variable remains entirely uncapped when passed to writel(). If the
calculated divisor exceeds the expected width, it could corrupt adjacent bit
fields within the hardware register.

[ ... ]

> @@ -1168,10 +1168,6 @@ static int clk_wzrd_probe(struct platform_device *=
pdev)
>  		return -ENOMEM;
>  	platform_set_drvdata(pdev, clk_wzrd);
> =20
> -	clk_wzrd->base =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(clk_wzrd->base))
> -		return PTR_ERR(clk_wzrd->base);
> -
>  	clk_wzrd->axi_clk =3D devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
>  	if (IS_ERR(clk_wzrd->axi_clk))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->axi_clk),

[Severity: High]
Does this unconditionally fail the probe when static-config is enabled?

The commit message notes that only the dynamic path needs the AXI block, wh=
ich
implies "s_axi_aclk" might be omitted from the device tree for static
configurations. If the clock is missing, devm_clk_get_enabled() will return
-ENOENT and immediately abort the probe before reaching the static-config
check.

> @@ -1183,6 +1179,10 @@ static int clk_wzrd_probe(struct platform_device *=
pdev)
>  	}
> =20
>  	if (!of_property_present(np, "xlnx,static-config")) {
> +		clk_wzrd->base =3D devm_platform_ioremap_resource(pdev, 0);
> +		if (IS_ERR(clk_wzrd->base))
> +			return PTR_ERR(clk_wzrd->base);
> +

[Severity: High]
This is a pre-existing issue, but does this branch entirely skip clock
registration for static configurations?

When "xlnx,static-config" is present, the driver skips this block and simply
returns 0 at the end of the probe function. No fixed-factor clocks are
registered, meaning any downstream consumers requesting a clock from this
provider will indefinitely defer their probe (-EPROBE_DEFER).

[ ... ]

> 			ret =3D devm_clk_notifier_register(&pdev->dev, clk_wzrd->clk_in1,
> 							 &clk_wzrd->nb);
> 			if (ret)
> 				dev_warn(&pdev->dev,
> 					 "unable to register clock notifier\n");
>=20
> 			ret =3D devm_clk_notifier_register(&pdev->dev, clk_wzrd->axi_clk,
> 							 &clk_wzrd->nb);

[Severity: High]
This is a pre-existing issue, but does this corrupt the SRCU notifier chain?

The exact same notifier_block instance (&clk_wzrd->nb) is registered to two
independent clock notifier chains (clk_in1 and axi_clk). The notifier API l=
inks
the structure into a singly-linked list via the 'next' pointer embedded ins=
ide
the notifier_block.

Registering the same block twice overwrites the 'next' pointer for the first
chain, which can permanently break the lists and lead to kernel oopses or
infinite loops during traversal.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731072049.9576=
24-1-shubhrajyoti.datta@amd.com?part=3D2
