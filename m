Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D0B2AD2C
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 03:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781495900; cv=none; b=FHzueyFz2fBk4H86lNQrxTSHAVMTD1mUPEXuKy0Pc7XX3nZLHjpupgqHKG8DPWwiCWNACxcePtpV3XCxW0eHp6XSXsuYpffuhVLIDFf8wim+njMUWWPZBlc/Z9T0+bW4Ioa6srAbEJcvEJAQ45o/Y60iRo/DwmUQ8Sg78SLm39Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781495900; c=relaxed/simple;
	bh=VuGiLCxb1ZdgKmz+BjfjsSmBpdkszizEjrTu7PU+bI4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WcfcIR0eBTVmcEc+VZLDW0dbQp0jrxxBkRclziK/TA0ZkFe5B2W6XasuYKBmmLrrQpPC7pdpOGaF9qfkWizJ3ggynllua3xXYGWsPb0zVQHVKTvNcsi16foePMYhavAqmUuAMljtwFhqXIMINd3iw0Jm5V43786F9m4Q6pDVPPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWUfs6bO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWUfs6bO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 882211F000E9;
	Mon, 15 Jun 2026 03:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781495899;
	bh=H8PPI8cjvtetHOVMAEyJr4tS8Ur8X7GE0xuvusBh+JM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kWUfs6bOFmYZX2Oij49L/wjH8HG1rl+AY9iRI4Lre8Yz6GdQ8z5OuXC3z2wsJotLA
	 mgPmCbe4+N4U4wLALRFuDrh9+j/Bgs8Uja1U8FB6P3BXFcD1dGqa0PeFyiEWs0+wZ+
	 ZjSERLXDugxNeyuaGYGAhfasmSBhold/KCEESF2Zb0elSTTzen84m+ILZ3rHyq2rTa
	 kEZz3T0Ygh12QuYSijOXgguBOlWkD4yohbqUVvXFpmwBW69Ac/stISMGmVnjeSPZpb
	 wB8KLe3xwDfckwcB5ayofl2jJPBbSBnn+0hP/jkzisZgcGogAdHPKuNeeJp6QWRovB
	 LZ4XO826icPwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] dt-bindings: clock: clocking-wizard: Make
 s_axi_aclk optional for static-config
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubhrajyoti Datta" <shubhrajyoti.datta@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615034845.3320286-4-shubhrajyoti.datta@amd.com>
References: <20260615034845.3320286-4-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 03:58:19 +0000
Message-Id: <20260615035819.882211F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Restricting `clocks` and `clock-names` to `maxItems: 1` in static-=
config mode breaks backward compatibility with existing device trees.
--

commit e42f118e6d12d9aebf43f9b7f7b451d1e25632ab
Author: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

dt-bindings: clock: clocking-wizard: Make s_axi_aclk optional for static-co=
nfig

This commit updates the device tree binding for the Xilinx clocking
wizard to allow a single clock input when configured in static-config
mode. It modifies the top-level clock properties to have minItems: 1
and enforces maxItems: 1 in the static-config conditional block.

> diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard=
.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> index aa397550d107c..0daefe89ea89f 100644
> --- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> +++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml

[ ... ]

> @@ -87,9 +89,19 @@ allOf:
>      then:
>        required:
>          - xlnx,clk-mul-div
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1

[Severity: High]
The commit message states the intention is to make the s_axi_aclk optional
for static-config. However, by setting maxItems to 1 here, does this strict=
ly
forbid the second clock instead?

Because the previous schema required s_axi_aclk, existing device trees that
specify both xlnx,static-config and s_axi_aclk will now fail dtbs_check
validation.

If the goal is to make the clock optional while maintaining backward
compatibility with older device trees, would it be better to leave maxItems
unrestricted in this block? This would allow older device trees with both
clocks to continue passing validation while new ones can safely omit it.

>      else:
>        required:
>          - reg

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615034845.3320=
286-1-shubhrajyoti.datta@amd.com?part=3D3
