Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2CD1A6836;
	Wed,  5 Aug 2026 07:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785915551; cv=none; b=e7+JTbdpHMY4JYXmLeTSImDJhz3tvKpCJncABbr4LKIQneAqlmYM2LvZq/odduUJHf6RDmU6YWfV9FRdT26LMoUuTpcBsxZxkLj6hp11pNQQjUEvYnUWRljJcnW9Wcel+z7uLtEjscaGzIc+XISaoMuwAF3+xHw7l8obv9LKi7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785915551; c=relaxed/simple;
	bh=Dym9MRfKi8BuxFPOTgyIQqE+R0V0YvA8RVCZxPUIbAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ijlz2DX7YxDBmAkoCRA23RRI+GZsuzyBLnSowJWfI0gzseq39TBhpqa+jIsgAIUt/kQk4GeOLhdWIOfI78tMQakQ01MKZ7gdhieCO8drS2yZtApRwx5OJSKFJtwS11IfgT4wSxJMEuK7MHOC+oj0ljXQCCAopF1T/kxDPuHysq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQ5n6mhf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQ5n6mhf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3347C1F000E9;
	Wed,  5 Aug 2026 07:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785915549;
	bh=vn3RpXvpxXIGbd3ddD9ECwKW6PZImCdLNKEfBy8sGa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dQ5n6mhfggqpd3YWcbezcHtrc4sFfIhkvGGQsK4o1Hhrctwh0fu1BgfRwaD1cdl7d
	 m+HX4DLe/ueBkTGN9nubfUfVw5HOjGKlHQRvp0WDniXF1BYFyWROskAS81wlu+1J8b
	 RJc245haS6pO7ruURKnFkhj6aZST6EDvMg6bjtKG2ezr60r4VYu1btlxmNsRM2MIxS
	 CpuqDV1Hfr/5E1zfQCEph4LrjLxQRz5qGxPG6KG0FtRyw10ZifV0FhQpIP7c1FPthX
	 jhrx1vujVe/vcf2nNGx0P77TaHlUAQlrlWcB3laHoQtQ1UDSVAkKehnF9UNsFTT4Wd
	 t4plxCy00BvRw==
Date: Wed, 5 Aug 2026 09:39:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, johan@kernel.org, rogerq@ti.com, 
	Julian.FRIEDRICH@frequentis.com, upstream+omap@sigma-star.at
Subject: Re: [PATCH 2/2] dt-bindings: phy: ti,phy-usb3: document aspcie
 reference clock setting
Message-ID: <20260805-uptight-onyx-unicorn-cfd0ce@quoll>
References: <20260804111849.92046-1-david.oberhollenzer@sigma-star.at>
 <20260804111849.92046-3-david.oberhollenzer@sigma-star.at>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260804111849.92046-3-david.oberhollenzer@sigma-star.at>

On Tue, Aug 04, 2026 at 01:18:49PM +0200, David Oberhollenzer wrote:
> Add syscon-acspcie-tx-rx property to the PHY bindings.

Why? Actually better to explain WHY in the property description.

> 
> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> ---
>  Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml b/Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml
> index 84f538aa587c..4fb017df2898 100644
> --- a/Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml
> +++ b/Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml
> @@ -52,6 +52,15 @@ properties:
>        enum: [wkupclk, sysclk, refclk, dpll_ref,
>               dpll_ref_m2, phy-div, div-clk]
>  
> +  syscon-acspcie-tx-rx:

Please organize the patch documenting the compatible (DT bindings)
before the patch using that compatible.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

Not a valid naming, missing vendor prefix and syscon looks like
Linuxism, since you called it "system control module".

> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1
> +    items:
> +      items:

Missing -

Also, update the example.

Best regards,
Krzysztof

