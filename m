Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B91D3290C7
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009330; cv=none; b=NYbATLaHNpM5fhqgRC/7tYgf6pSXzDL249sNr/7DfLQvEcAjKnXokWj/KrYhu0PizV1MRIRKEeCMXFpoK3Me3KGYPsaYURo6dlyuMJ2HC9nSTXvoPeohnOVwI7ehceegsr4t3H5SalN6d8afPhVQ3lGbVYwOHEG2upOo0W3jGPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009330; c=relaxed/simple;
	bh=5NvbeUZdK10baRsUmXePtvDc5LelMpE1vCZ7mLXMUOQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bN8RmlNDUqCeIyO2UACkbxq1FQX3eq2M5I1/C0UKUOjdbrH+47CnhiyOA7jw7CMcQpCpiDb1KRuKe5H5uUWnJPF5HAJusEkzpnclavBH9eyurvk/C5OQX2QG2CvU7MWQgDDhFHLY0/LM1LdvTwHKzPqrqiJyd9G4U+DAbCNOEL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNveksO7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNveksO7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 627171F000E9;
	Thu,  6 Aug 2026 09:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786009328;
	bh=Hed/32dKUMyMYA0/C28CG4W+Wj0GhZsdRYJ8gpIUmXw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gNveksO7muWr+p9PvXU6EDacG9mSnQS1dTavEb+VlOLV06Usrdp1vLtVhv44O0+AX
	 YM/4l9uyCQuKSIQfIMNKtFTap5QtZlsMWlJj5tOiYv4+NN3JsszVGElAKcXTWPTdTo
	 zoKIaHhAFHPPxBtRmOJijMU1EdTa5dKfAWNjMr0WSPHD0rSTfonF2OIVMsK6P0bc6G
	 yt1+aPr1JtuomLWMvv5c91UuPMzW4S0LnTd0i9nE670FWb1nELQ6VN87MIiAp/vxn7
	 BYoS0E8R1bPbwZdcIL6kRlgIakz3LWYbvisex6Hj2zXEaBq1n74PaoTwtMgSuIrttX
	 nSTTpnUPkd9Fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/10] dt-bindings: clock: add Ambarella CV75 RCT
 clock controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806-longzhao-upstream-cv75-v2-v2-3-6b09707c5fe9@ambarella.com>
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
 <20260806-longzhao-upstream-cv75-v2-v2-3-6b09707c5fe9@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:42:07 +0000
Message-Id: <20260806094208.627171F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The binding omits the `#reset-cells` property for the RCT (Reset=
 and Clock Tree) block, failing to document its reset provider capabilities.
- [Low] The dt-bindings header includes a `CV75_CLK_NUM` macro, which is an=
 anti-pattern for device tree bindings.
- [Low] The `$nodename` pattern `^clock-controller@` is incomplete and allo=
ws trailing garbage in the unit address.
--

--- Patch [3]: [PATCH v2 03/10] dt-bindings: clock: add Ambarella CV75 RCT =
clock controller ---
commit 06893bbacfebbbcc609e16261fa2b05c7e05554d
Author: Long Zhao <longzhao@ambarella.com>

dt-bindings: clock: add Ambarella CV75 RCT clock controller

Add the CV75 RCT clock controller binding and clock ID header.

> diff --git a/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.y=
aml b/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
> new file mode 100644
> index 0000000000000..aa96533bab9b5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
> @@ -0,0 +1,66 @@
[ ... ]
> +properties:
> +  $nodename:
> +    pattern: "^clock-controller@"

[Severity: Low]
Is this regex pattern a bit too permissive? Without the end-of-string anchor
and unit address character classes, this will match invalid node names with
non-hexadecimal characters or trailing garbage, such as
"clock-controller@1000xyz".

Should this be updated to strictly enforce the expected node name format,
such as "^clock-controller@[0-9a-f]+$"?

[ ... ]
> +description: |
> +  The RCT (Reset and Clock Tree) block on the Ambarella CV75 SoC provides
> +  PLLs, clock muxes and dividers for on-chip peripherals.
[ ... ]
> +  "#clock-cells":
> +    const: 1
> +
> +required:
> +  - compatible

[Severity: Medium]
Since the description indicates this hardware block is the Reset and Clock
Tree, shouldn't #reset-cells be included in the properties and required
lists?

Because additionalProperties: false is set, any device tree attempting to
describe the reset functionality of this hardware will fail schema validati=
on.

Device tree bindings typically need to comprehensively describe the full
hardware block's capabilities, not just the features currently implemented =
by
the OS clock driver.

[ ... ]
> diff --git a/include/dt-bindings/clock/ambarella,cv75-clock.h b/include/d=
t-bindings/clock/ambarella,cv75-clock.h
> new file mode 100644
> index 0000000000000..3d3314446e75f
> --- /dev/null
> +++ b/include/dt-bindings/clock/ambarella,cv75-clock.h
> @@ -0,0 +1,17 @@
[ ... ]
> +/* Boot / bus clocks */
> +#define CV75_GCLK_UART0		0
> +#define CV75_GCLK_CORE		1
> +#define CV75_GCLK_AHB		2
> +#define CV75_GCLK_APB		3
> +
> +#define CV75_CLK_NUM		4

[Severity: Low]
Does this code need to expose CV75_CLK_NUM in the bindings header?

Defining total count macros in DT binding headers ties the ABI to a software
implementation detail. If new clocks are discovered or added later, updating
this macro modifies a published ABI, which violates DT stability rules and
can cause mismatches between updated headers and older drivers.

Could the total number of clocks be tracked internally within the clock
driver itself instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-longzhao-u=
pstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com?part=3D3
