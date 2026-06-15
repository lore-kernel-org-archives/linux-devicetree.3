Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0086E3C06
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781496144; cv=none; b=BHRaxUcOq2KktBKVlrb+QkyEMCFX/sezmIg6Yga5C65AdKr32NAxSS1x+e/ivC9VYZZRrAcjdg62f9Bvcu77m/rlV+EUh4F2LhbAS8+h8zg5PzSMZCH6NzLYLKBwv7lNDMBPTrp4b1JY98NEMURkH8Sk1tF/l3dDnpcUfmA3Voo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781496144; c=relaxed/simple;
	bh=JY4P7Xh3ds3TBrpzcinVADAvT91i6FdqjmbEvW+AZnA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r1fwirKPvsXDG1PV9sCFYLt0S4UDCXjQs04yImj3uzv3MlidtCiOd1iFRnfy5ml4PpSnPw1QvF7w0abcoHZu8x9UCTAU4IpPyMCoF9KMmyb4IwXOoiKmZEokqI5tXgmNf0W89SgtcjESrmcxstcogdWK0XIKEupBNGSkLKQP7og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dADPu0+S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dADPu0+S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6849A1F000E9;
	Mon, 15 Jun 2026 04:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781496142;
	bh=qh5Pbv7ep5/A+OTLeA627U//JpsxbS1dIws+chWtvNM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dADPu0+Sbjd9Y8jaGuYw2g2r7RB1KA5b7SwFTDTx9PH8fc2Uw3dcyTVL4k57ANcu2
	 5ftcxBdrFCbKrbHSYBTSm2fys2tudsQEInCE6hcoYM2HLTBAl38IpaVEAMfbFtOxYi
	 Eks0JC2LwKaoGrCAmSNPGGDLQ56rB+wPXcvyrYgws+P+REXBqu8Z91Ja8tGMKv6Q+F
	 HhdlbpdFlSwt+FAq3EkGjm7Wkg94SEFE8khE/yskqFBrxcrQ8OHEw/B3cTxTk+/Nm8
	 pSkJ8fGvauhGj77fkAZB577t/M6Q6EkNWjMhKudGcEmh+DbAeRvIdb/9KRY3Q9paaw
	 Qsc49UJ9DmRdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/8] clk: clocking-wizard: Add static-config clock
 provider support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubhrajyoti Datta" <shubhrajyoti.datta@amd.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260615034845.3320286-7-shubhrajyoti.datta@amd.com>
References: <20260615034845.3320286-7-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 04:02:22 +0000
Message-Id: <20260615040222.6849A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Division by zero in `clk_wzrd_determine_rate` when the requested r=
ate is significantly larger than the parent rate.
- [High] Logic bug with ignored `min_t` return value leads to unbounded reg=
ister writes.
- [High] Division by zero in `clk_wzrd_get_divisors` and `clk_wzrd_get_divi=
sors_ver` when the target rate is 0.
--

commit b31cd102641055f0a34c6e79498f21e726bb2a91
Author: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

clk: clocking-wizard: Add static-config clock provider support

When xlnx,static-config is present the divider/multiplier path is
synthesized inside the Wizard without exposing runtime MMIO
reconfiguration, so omit the AXI register mapping and advertise each
routed output clock as a clk_fixed_factor child of clk_in1 using the
synthesized ratios exported through xlnx,clk-mul-div.

> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xil=
inx/clk-xlnx-clock-wizard.c
> index ffc78c90bee6f..5470a717fccc8 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c

[ ... ]

This isn't a bug introduced by this patch, but I noticed a potential divisi=
on
by zero in the unpatched code:

drivers/clk/xilinx/clk-xlnx-clock-wizard.c:clk_wzrd_determine_rate() {
    ...
    div =3D DIV_ROUND_CLOSEST(req->best_parent_rate, req->rate);

    req->rate =3D req->best_parent_rate / div;
    ...
}

[Severity: High]
If the requested rate is significantly larger than the best parent rate,=20
could div evaluate to 0 and trigger a division by zero exception here?


This is a pre-existing issue, but the capping logic appears to be unused
in the following code:

drivers/clk/xilinx/clk-xlnx-clock-wizard.c:clk_wzrd_dynamic_reconfig() {
    ...
    /* Cap the value to max */
    min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);

    /* Set divisor and clear phase offset */
    writel(value, div_addr);
    ...
}

[Severity: High]
Does this code leave value unbounded before the register write since the
return value of min_t() is not assigned to anything?


This isn't a bug introduced by this patch, but there might be another divis=
ion
by zero risk in the divisor calculations:

drivers/clk/xilinx/clk-xlnx-clock-wizard.c:clk_wzrd_get_divisors_ver() {
    ...
    o =3D DIV_ROUND_CLOSEST_ULL(vco_freq, rate);
    ...
}

And similarly in clk_wzrd_get_divisors():

drivers/clk/xilinx/clk-xlnx-clock-wizard.c:clk_wzrd_get_divisors() {
    ...
    o =3D DIV_ROUND_CLOSEST_ULL(vco_freq, rate);
    ...
}

[Severity: High]
If rate is exactly 0, can this cause a kernel panic due to a division
by zero?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615034845.3320=
286-1-shubhrajyoti.datta@amd.com?part=3D6
