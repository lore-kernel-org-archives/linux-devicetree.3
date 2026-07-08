Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90E53F2113;
	Wed,  8 Jul 2026 07:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494056; cv=none; b=BZgDagHbPLjdL8NHJBasE3lLxmFQPagcNQe0MZr2sxFiBE4H4x+aRFaBmGhBnjj71OEpa/cHaT6n+dK3Y8ulZvlf2nkivWDI/wk8tWvyNFB3nyUNxB3Y/WHvf/FO75V7ISXI7dY3+c6NmtbY4R8TU/fHDtXejmYa2unrx6U0MzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494056; c=relaxed/simple;
	bh=Qdu1Q50kVGWPNuQ4xURinx2E+KR0pgStu8yCdnFR1iA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hk4AGosN7vDgZPhwuLcFlRNzMSflRHl6ESpKCe4kZLqwJe5ScWGXuHgZMx7G/N0U6NbcOW/Diugh7fCljq6gxSes6EZ0fAl0bpiYUv07k2YwuO6AjrdTD+rOi2tqA0n6w+jZaISEzDdBbpGMIlvRJOT4E7dpX5rUsQW4qRg+HLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hXU1ypIn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXU1ypIn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552561F000E9;
	Wed,  8 Jul 2026 07:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783494041;
	bh=3gpwDhSFjdSUHz2a8ffo3K/wM+YiCFuLEQMawml1Hw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hXU1ypInJxGquEdsqvJziPjoAuoFjvxvsPuxCuEWE+UOuZ/a4k4vbnahAGu56hiZT
	 dHFoFc6js6kZh75ovZx6+DFfaiN/HP2k7WYHrWcHxA+pwdAhNfdOEPglthhL3FOAfH
	 mOV/Fo9O17K3/dOefXPDKAK9FtOsEXCrOOWd8jepHP8pWVF+K3G1JI331GixB4aGed
	 vEDy2/RXo/JHVKECpaPBwDgWtr5jJ6VkY2dxiqtL//znRJCrrkwc33U9rjKeqzT7IC
	 V65Hk6CMsVo9JTI1k5LnViEeNtb3zmHB55UqfjO0kugCZwfa/0BsdgTOVEurPfAhlG
	 bMoQkcqphA3/A==
Date: Wed, 8 Jul 2026 09:00:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, daniel.baluta@nxp.com, simona.toaca@nxp.com, 
	goledhruva@gmail.com, m-chawdhry@ti.com
Subject: Re: [PATCH v2 5/5] dt-bindings: soc: ti: omap-iva: Document DSP
 child node
Message-ID: <20260708-attentive-coral-coua-7d4f65@quoll>
References: <20260706085917.835875-1-egbostina@gmail.com>
 <20260706085917.835875-6-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706085917.835875-6-egbostina@gmail.com>

On Mon, Jul 06, 2026 at 08:59:17AM +0000, Eduard Bostina wrote:
> Document the DSP child node in the IVA schema to resolve dtbs_check
> warnings.
> 
> OMAP3 device tree (omap3.dtsi) models the DSP as a child of the
> IVA subsystem. This node was missing from the old iva.txt binding.
> Add it to align the schema with current ABI usage.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
>  .../devicetree/bindings/soc/ti/ti,iva.yaml          | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,iva.yaml b/Documentation/devicetree/bindings/soc/ti/ti,iva.yaml
> index 799461a20b04..d7168d76fdb0 100644
> --- a/Documentation/devicetree/bindings/soc/ti/ti,iva.yaml
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,iva.yaml
> @@ -22,12 +22,25 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/string
>      const: iva
>  
> +  dsp:
> +    type: object
> +    $ref: /schemas/soc/ti/ti,omap3-c64.yaml#

This also should be squashed.

Best regards,
Krzysztof

