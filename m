Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B02035AC0C;
	Tue, 11 Aug 2026 17:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786470164; cv=none; b=d+AeXlsXIS1P88nZaeAMZq77HpqaLDwv2kL5Nj/aPzKRms6iw9c1W3rSLCzEYXw01Zt4gLDR9g0Kb7wfg025l6gCtbIz6ocBc1LEm+jpxjCz0ayCy6/F1DOR7ePAuXXnOGQQ44ib0s572THZrk9XIeRu8yCVdND3BgIEvnLVCdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786470164; c=relaxed/simple;
	bh=wyncWd/0t3HO3MmRF/Z6fM1YmJAc0CRSYSSdEW/Bm78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmZecMvE4qw/vUYs6bx+7j84auhsMIirvkxylYW8kxJ6jNDxs+MR7vD97wo68XjxZBkXaCbYSnWziPEFc3o+lHHwj4tLHPXzGx89KcEIBBZFWlbiefX8saDmm+oZolbvFGddBPII9CHGJFLM8bptmfW8gn9uHEAdYSzqbzgsj3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=en0FHej1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="en0FHej1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B15A01F000E9;
	Tue, 11 Aug 2026 17:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786470162;
	bh=Nqd/Di8be6XuymwMb8jVYvbA0+af2I3DW6eRFF+/bSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=en0FHej1ZRtOYUDFIBcslYDitVkhpwSuynu7eRt4Lrvv41G4kOAY/uyofJWt13Rc9
	 em5hcLBecaZhlPv/tAJbYKzoOXI/OGPFrWzhJHrAfEYslRfIDN4i7oITsnCKvTYJAi
	 D289iP5H9yxLi7fIruN6BDZBFsR348a+yoY3M+kEl1fDhumLhNnhKW1QXeddOe0UgZ
	 WYY+om9X665vwnCRYKmbbvem5+xjAa1yYkisnX86VxbcZmO19HSlrApLkl1HmM5QAA
	 iskpLKk9ly2fKciGAf4VS678CTY66TA1ksz4LH3eTmwC4fR2fG42z0zq2gLIkeTw+p
	 gjFuIGfujQWMQ==
Date: Tue, 11 Aug 2026 12:42:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: daniel.baluta@nxp.com, Mark Brown <broonie@kernel.org>,
	m-chawdhry@ti.com, devicetree@vger.kernel.org, simona.toaca@nxp.com,
	Conor Dooley <conor+dt@kernel.org>, goledhruva@gmail.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: arm: omap: Convert L4 interconnect to DT
 schema
Message-ID: <178647000356.2691288.1005812421865758029.robh@kernel.org>
References: <20260810134051.380538-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810134051.380538-1-egbostina@gmail.com>


On Mon, 10 Aug 2026 13:40:51 +0000, Eduard Bostina wrote:
> Convert the Texas Instruments OMAP L4 interconnect bus bindings
> to DT schema.
> 
> During the conversion, several updates were made:
> - Defined the compatible property as an array to require
>   the TI-specific string first, followed by either 'simple-bus' or
>   'simple-pm-bus'.
> - Added a 'select' block to ensure this schema is only
>   applied to TI-specific nodes, preventing duplicate
>   schema warnings against the core simple-pm-bus.yaml.
> - Added the L4 compatible strings used by the boards but missing from
>   the text binding, and corrected the 'ti,am3-l4-wkup' typo to
>   'ti,am33xx-l4-wkup'.
> - Made 'reg' and 'reg-names' optional.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
> Changes in v3:
> - Restricted additional properties to child nodes ('additionalProperties:
>   type: object') and defined the '#address-cells', '#size-cells', 'clocks',
>   'clock-names', 'power-domains' and 'dma-ranges' properties the L4 buses use.
> 
> Link to v2:
> https://lore.kernel.org/all/20260723100540.628609-1-egbostina@gmail.com/
> 
>  .../devicetree/bindings/arm/omap/l4.txt       |  37 -----
>  .../bindings/arm/omap/ti,omap-l4.yaml         | 140 ++++++++++++++++++
>  2 files changed, 140 insertions(+), 37 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/omap/l4.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/omap/ti,omap-l4.yaml
> 

I moved it to bindings/bus/ and applied, thanks!

Rob
