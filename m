Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5231B1448E0
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 07:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775719825; cv=none; b=mQQJts1ob4rLhkauVbC6iqKrbaplsCVquAiCUtXLRsz4+GjNRvUxTxlOe9M1dr3w+kUXU7CbhBUjSbrubux5vBEqp06Z/L2D4vKzCGTfUsJaFpn5ocq7poUUfsve+g03e9uEjMbLnoRZcjR4hN3u7+ZQgE+0tra+lohY5dWyylo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775719825; c=relaxed/simple;
	bh=vwghWor8OZe17SmQaOpkWmuy9YBmg+3I3XnkIV/bOig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XgbEtum0VkM0JIYhNqh2YzMLhzJq7wd3NlJWY8BcdKCqZp317OfrWKryAnkRVhP4IjAp3HinGnEWE7dZoo9N2Ho9cHmHhPm6/70dmDC7vCXH3lRXP/zdu4djC+Iv5DebxfbngD/PSpMWfecv7skuRJQ8OQTKowUhmAnAjiu9Nsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ubxdOzey; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ubxdOzey"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4827EC4CEF7;
	Thu,  9 Apr 2026 07:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775719824;
	bh=vwghWor8OZe17SmQaOpkWmuy9YBmg+3I3XnkIV/bOig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ubxdOzeyBTj+xJL5QphQ13nGFi9Y7uZlWAPeqOQVhIbTssTm5eLVRQfZGM0zCNBP2
	 CuRqfybrbijyPd2NCt9JaXYmSRYiI+ObSkFP89QOPazz6ZKGRlwC2BRRg2LiIaUaUZ
	 vArBk2OpZRCUFWnWxD69y3CShwa7If0gChD47f9b59ibWotr1kowXE7gOoXaP96ymj
	 54R8bO/ZzzCjyDS9y8Rz+ge2M0HXiDnncQGdtibon+vRkHEb4oU3l/o8DpRgUrUWHc
	 D8dbVIw99xyu5lXojtVjYkysEKG+/bjMk4o1ND4HSjv200ODdMIcbC6ixGTeiVhdRs
	 2NXKxf8/6xyoA==
Date: Thu, 9 Apr 2026 09:30:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, linux-i3c@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Frank Li <Frank.Li@nxp.com>, Maciej Lawniczak <maciej.lawniczak@intel.com>, 
	Jeremy Kerr <jk@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/3] ARM: dts: aspeed-g6: Add nodes for i3c controllers
Message-ID: <20260409-massive-natural-crayfish-c1cf2f@quoll>
References: <cover.1775679285.git.dawid.glazik@linux.intel.com>
 <51c4bdc02b45f67a0e32610a228091e137c135a6.1775679285.git.dawid.glazik@linux.intel.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <51c4bdc02b45f67a0e32610a228091e137c135a6.1775679285.git.dawid.glazik@linux.intel.com>

On Wed, Apr 08, 2026 at 10:34:34PM +0200, Dawid Glazik wrote:
> Add the i3c controller devices to the ast2600 g6 common dts. We add all
> 6 busses to the common g6 definition, but leave disabled through the
> status property, to be enabled per-platform.
> 
> Originally-by: Jeremy Kerr <jk@codeconstruct.com.au>

Don't invent tags. This is not used outside of TIP.

> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> ---
> v3:
>  - add i3c aliases
>  - rebase on top of latest tree and solve conflicts
>  - as agreed with Jeremy off-list, he said I can take authorship of this going forward
> v2:
>  - use inline bus representation, without the i3c: label
> ---
>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 97 +++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> index f5641128614f..f986fcbed604 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -29,6 +29,12 @@ aliases {
>  		i2c13 = &i2c13;
>  		i2c14 = &i2c14;
>  		i2c15 = &i2c15;
> +		i3c0 = &i3c0;
> +		i3c1 = &i3c1;
> +		i3c2 = &i3c2;
> +		i3c3 = &i3c3;
> +		i3c4 = &i3c4;
> +		i3c5 = &i3c5;

Bus aliases are not properties of SoC DTSI.

>  		serial0 = &uart1;
>  		serial1 = &uart2;
>  		serial2 = &uart3;
> @@ -1066,6 +1072,97 @@ i2c15: i2c@800 {
>  				};
>  			};
>  
> +			bus@1e7a0000 {
> +				compatible = "simple-bus";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				ranges = <0 0x1e7a0000 0x8000>;
> +
> +				i3c_global: i3c-global@0 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

Best regards,
Krzysztof

