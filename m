Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733FB362153
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785483462; cv=none; b=OQSwfmnnLpY6R40JTUBkfsr0IShKBb7318kgUietPE52ePepeMtajDZAUX7rAehAYa2AUpz4mkr6VevsseIQzbapIUwdQadjPqIQmEt6EJupOTpaFtCbdCxVdsDyl2l5fGmHDiaPF12XFCO8fFQTeCc/fm0TyojmYYnDqHTiqG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785483462; c=relaxed/simple;
	bh=5OSEgmOzqyGo53KUeAXeza2PmHF+h6kMbeFqM2Kz3E8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c4DZafzNU0H9tuUo+omYX/kS41DsZ9g6QFkQ05ue3Sb6AAkEzKyZy16oWf/3vLxGn9Xu1PnEEX5lT02WbDf0FhsZcQv69xDkLOurlpjznICquYMBGUgusunGkw3lnk7jfOORGnTWsfHzM+A+y4vKcnjGI3whTx2YbPLKGQbRuF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOz2dZm0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOz2dZm0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CBA1F000E9;
	Fri, 31 Jul 2026 07:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785483461;
	bh=ceIT0MAHBU+b9eJchpsYN+uEBjUCBuUTBZoOdBQj1xI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KOz2dZm0+crnGIbhKGelBcHIxPMxP3tlAeqAoojpwoA97LEwmDM9ITmbF1JLaveDr
	 xqEtwxjvQRdu6tVYqHDp52KiQWYUe5DvD6CXX8hwGMVzQw8/0mE4tmmvtM3k6WYhIp
	 DIwjPq6rennZ/i2vVCwspyoHNFOf+CR8GHBW6IMW+lF0G6o46Jhess8XCwnKVvDCpJ
	 VFcQmI0PIQUqaYkof+DvMJeTRWKJEdHrg5lQX/pX8uJZGVY8i+MnmcCR2OuzJMFzQk
	 i9ChCFAKh+3UX4q7Augpp1EP1nbl3rq33H0PLQ7eo6rbRwkQQz9fMmjXusc/qZccQK
	 0cC14eOG/+RfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/8] clk: clocking-wizard: Skip s_axi_aclk for
 static-config
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubhrajyoti Datta" <shubhrajyoti.datta@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260731072049.957624-6-shubhrajyoti.datta@amd.com>
References: <20260731072049.957624-1-shubhrajyoti.datta@amd.com>
 <20260731072049.957624-6-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 07:37:40 +0000
Message-Id: <20260731073740.F1CBA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The provided concern incorrectly states that the callback resolves=
 its context using an invalid offset due to `nb_axi`. In the actual code, `=
nb_axi` does not exist, and `clk_wzrd->nb` is used for both registrations, =
so the offset calculation is correct. However, a critical bug exists at the=
 same location: the exact same `notifier_block` instance (`clk_wzrd->nb`) i=
s registered to two different clock notifier chains (`clk_in1` and `axi_clk=
`). A `notifier_block` has only one `next` pointer and cannot be added to m=
ultiple SRCU notifier chains simultaneously (or twice to the same chain). D=
oing so corrupts the notifier linked list.
--

--- Patch [5]: [PATCH v3 5/8] clk: clocking-wizard: Skip s_axi_aclk for sta=
tic-config ---
commit 8f005ad6b615119302b96a70915b5c138c7ff09f
Author: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

clk: clocking-wizard: Skip s_axi_aclk for static-config
   =20
For static-config mode the AXI bus interface is not used, so there is
no need to get and enable s_axi_aclk. Move the axi_clk setup inside
the non-static-config branch.

> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xil=
inx/clk-xlnx-clock-wizard.c
> index 1332abc8a9501..c79733f58082d 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
[ ... ]
> @@ -1259,22 +1258,24 @@ static int clk_wzrd_probe(struct platform_device =
*pdev)
[ ... ]
>  	if (!of_property_present(np, "xlnx,static-config")) {
> +		unsigned long rate;
> +
> +		clk_wzrd->axi_clk =3D devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the axi_clk
setup here, I noticed a pre-existing issue further down in clk_wzrd_probe()
where the exact same notifier_block is registered for both clk_in1 and
axi_clk:

drivers/clk/xilinx/clk-xlnx-clock-wizard.c:clk_wzrd_probe() {
	...
	if (clk_wzrd->speed_grade) {
		clk_wzrd->nb.notifier_call =3D clk_wzrd_clk_notifier;

		ret =3D devm_clk_notifier_register(&pdev->dev, clk_wzrd->clk_in1,
						 &clk_wzrd->nb);
		...
		ret =3D devm_clk_notifier_register(&pdev->dev, clk_wzrd->axi_clk,
						 &clk_wzrd->nb);
	...
}

Does this corrupt the SRCU notifier linked list? A notifier_block has only
one next pointer and cannot be added to multiple SRCU notifier chains
simultaneously (or twice to the same chain).

If the clocks are different, nb->next would be overwritten, merging the
chains and corrupting traversal. If the clocks are the same, registering
the same block twice creates a circular linked list (n->next =3D n), which
can cause an infinite loop and hard lockup during clock rate changes.

Could we add a second notifier_block to struct clk_wzrd to handle the
axi_clk registration separately?

> +		if (IS_ERR(clk_wzrd->axi_clk))
> +			return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->axi_clk),
> +					     "s_axi_aclk not found\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731072049.9576=
24-1-shubhrajyoti.datta@amd.com?part=3D5
