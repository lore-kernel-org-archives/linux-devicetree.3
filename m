Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13FF37C924;
	Thu, 16 Apr 2026 08:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776329818; cv=none; b=nKp/zUJEHCrQ6Tphu9uod7xF+RxvlePIPo18cojlenY1zyumJGbT+olbUpLYCIQ7wLGJYYe+VY9VbVYQo6NPB1qeh5vI96WP+TNinloWqsFLxigk6tuLZkeHzbHY70nrP+u12o71O2Uq5Hl4lxvLEhD+JufNr1AGev+WYcan29g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776329818; c=relaxed/simple;
	bh=vl7msSVm/Rgwxg49h1Sq1unOUgNN5gUFB5siCR+yTVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qab4T8cIrFuaIIytzvk83IKB+T5e++MjsOERlpNR3x3oGJt1dzaPMDUCxxxjldETnxr5Prep5rf8kngjKNOy7z4jVo3Plvprs2OoTHV3H8oFAZVxg3nxl7fRaz6IbMjoeVHDpajqzQ90s7SspG23Y+JfYHtt80ZoR432RQ281CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pgLFFsm6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pgLFFsm6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A3FC2BCAF;
	Thu, 16 Apr 2026 08:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776329818;
	bh=vl7msSVm/Rgwxg49h1Sq1unOUgNN5gUFB5siCR+yTVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pgLFFsm6NHz3pwjpal0HBdNtK2K9UWYBSwSvTYF6hNldu5GBSvOUb/qDfaYLvjRmP
	 t2VuX+M10i0DNuGtsM01lRnTiCftAnFhz/V2e/BiWuO/PjMkjma4wm3gyou/9CfV2A
	 XCWWecdUlDqlfvOljHlGvLF68zQq3YKPEOrKrTAAyoyzwi2zcw71kjsN9yQFwPdlks
	 qwi1eo6sYaz4EosAB9PpDTFFxHCic5BKyeNAxEOzahtjzjBwPObNi1OyGPJqCizDql
	 CynunWN8OMIO3+ct8ptqc0GksMa6Y49V7bM+oo40Icu4MkDc3IkFxCOKwnLYq5f6qV
	 INjFB9QOpYXrw==
Date: Thu, 16 Apr 2026 10:56:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Sirius Wang <sirius.wang@mediatek.com>, Vince-wl Liu <vince-wl.liu@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 4/6] dt-bindings: soc: mediatek: devapc: Add bindings
 for MT8189
Message-ID: <20260416-sophisticated-wealthy-hawk-efb7f4@quoll>
References: <20260416031231.2932493-1-xiaoshun.xu@mediatek.com>
 <20260416031231.2932493-5-xiaoshun.xu@mediatek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260416031231.2932493-5-xiaoshun.xu@mediatek.com>

On Thu, Apr 16, 2026 at 11:12:07AM +0800, Xiaoshun Xu wrote:
> Extend the devapc device tree bindings to support the MediaTek MT8189
> SoC. This includes:
> 
> - Adding "mediatek,mt8189-devapc" to the list of compatible strings.
> - Introducing the "vio-idx-num" property to specify the number of bus
>   slaves managed by devapc.
> 
> These changes enable proper configuration and integration of devapc on
> MT8189 platforms, ensuring accurate device matching and resource
> allocation in the device tree.

Pointless paragraph. Would you write a commit which does not enable
proper configuration?

> 
> Signed-off-by: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/devapc.yaml       | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> index 99e2caafeadf..06a096440331 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> @@ -14,13 +14,14 @@ description: |
>    analysis and countermeasures.
>  
>  maintainers:
> -  - Neal Liu <neal.liu@mediatek.com>

Your commit said what the change is doing. It's pointless because we see
it in the diff. Except that we don't...

> +  - Xiaoshun Xu <xiaoshun.xu@mediatek.com>
>  
>  properties:
>    compatible:
>      enum:
>        - mediatek,mt6779-devapc
>        - mediatek,mt8186-devapc
> +      - mediatek,mt8189-devapc
>  
>    reg:
>      description: The base address of devapc register bank
> @@ -30,6 +31,10 @@ properties:
>      description: A single interrupt specifier
>      maxItems: 1
>  
> +  vio-idx-num:

Nah, compatible defines it. Please follow standard rules for bindings,
see writing-bindings doc.


> +    description: Describe the number of bus slaves controlled by devapc
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
>    clocks:
>      description: Contains module clock source and clock names
>      maxItems: 1
> @@ -42,8 +47,6 @@ required:
>    - compatible
>    - reg
>    - interrupts
> -  - clocks
> -  - clock-names

Why?

This commit explains nothing and makes some random-looking code changes.

Best regards,
Krzysztof

