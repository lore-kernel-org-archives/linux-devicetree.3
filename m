Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCAD319617
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 01:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786496938; cv=none; b=ZSZr3EOHl+6rCq4A+TN/2EH8KWNFOmljvLybG/zwj9UfRiU3ljLLJNdmSBGPdUMuAI/P4kgwSHwX88+ARvtl3Z10Re+OLjOXIUdHYVUGvYNeZqGuiomtLU2y6ohJ/tfGWrkuO/EofkVaiFCDWVdbI2VS4FIRGzTXPCKESz7HtFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786496938; c=relaxed/simple;
	bh=ANiMiJaFT0PyjINMgCjLIMP1yeXoelrUEMDCuFdeLiQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pD9Z4OcVt10LBfd7ODeSIqapqK6VC3TU+XmeD7QeEICs20Fz77hcXm6s2+IpSwSLy38nWVcT/xiZbAOMUY1PWfZ6rr/92ydAd8G6rUvf8kNCIcRH0s4TEFHJrMclywbc2TYVs4O/+wYzR+19WMzI+E/FmvXZMWdCrWhY3papAW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kb3ORulF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kb3ORulF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712B71F000E9;
	Wed, 12 Aug 2026 01:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786496937;
	bh=w+M5bOqN+dcIrzZc9eSaBRVwTBzszlOoa94Kqow5cPg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kb3ORulFETU2P9/EplZoOJc2XjiBVeLgrNKDEIttn+ipQ3huUt21XlsSHlz3XKalf
	 kobADTYXCOrKZOZmN5lNmXksayq1CurR7GhTNblI0x65ZM3vLmJFnl4OIgqiIUseZg
	 ERTYL9+Edx7opd7HbAHvid2WVr1IFUxvUn51N9Wf9/V1cujsEFOXif40YmX2Ixfms9
	 eFLUgA8HJo3VAgQH0/gzB052uLwOtrybtk1TVEWwICY/Jur4Jml7FEHDBTGPnPMsXh
	 kPvz54P3H6IneXIVOr/tuXId8PFqliZGkrtxAOlSCy99u4ZMjFxBI50wLjNiZGXwgI
	 dbUgIR4+PpzUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/8] dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3
 xHCI USB controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20260812010157.1772849-6-marex@nabladev.com>
References: <20260812010157.1772849-1-marex@nabladev.com>
 <20260812010157.1772849-6-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 01:08:55 +0000
Message-Id: <20260812010856.712B71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing reference to DWC3 core schema causes valid USB propertie=
s to be rejected.
- [Low] The `resets` property is missing a `maxItems` constraint.
--

--- Patch [5]: [PATCH 5/8] dt-bindings: usb: dwc3: Document ST STM32MP2 DWC=
3 xHCI USB controller ---
commit df84943476bf67384e16624668aaadbaba67875b
Author: Marek Vasut <marex@nabladev.com>

dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3 xHCI USB controller

The ST STM32MP2 SoC contains single instance of DWC3 USB controller with
glue logic wrapper around it controlled by syscon. Document the glue
logic and DWC3 controller.

> diff --git a/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml=
 b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
> new file mode 100644
> index 0000000000000..e377efef43503
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
> @@ -0,0 +1,108 @@

[ ... ]

> +  phy-names:
> +    minItems: 1
> +    items:
> +      - const: usb2-phy
> +      - const: usb3-phy
> +
> +  resets:
> +    minItems: 1

[Severity: Low]
Does this resets definition need a maxItems constraint?

Without an upper bound, dt-schema allows an arbitrary number of reset items,
which might let invalid hardware configurations silently pass validation.

> +
> +  st,syscfg:

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - phys
> +  - phy-names
> +  - resets
> +  - st,syscfg
> +
> +unevaluatedProperties: false

[Severity: Medium]
Will this strict constraint cause valid USB or DWC3 core properties to be
rejected?

Since the schema does not include a reference to the core DWC3 schema (such
as allOf: - $ref: snps,dwc3.yaml#), only the explicitly listed properties
are permitted.

Standard properties like maximum-speed, usb-role-switch, or child nodes
intended for the DWC3 core will fail validation when checked.

> +
> +examples:
> +  - |

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812010157.1772=
849-1-marex@nabladev.com?part=3D5
