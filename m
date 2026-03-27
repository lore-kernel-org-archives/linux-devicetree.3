Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543AA3C061A;
	Fri, 27 Mar 2026 08:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600137; cv=none; b=juMugeVmwgMjVlevNJzwvFzOzsichoOElWZuce9RBnd4h0U7/62KDOrQ6cbPnYSH6mF03KdcquQ49t+FqlywC/AOh/FJaULQuSQJoKRhxwHk/6iXvIIvlkeLQMVJIzQ1d3m6pBbBie3gclh9JeQ34qzYbQcsegGqdHMK890VAB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600137; c=relaxed/simple;
	bh=aX3T5HqlHVFDXpCojT5Kga3nSDgSpxMzAsP25toZvf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XdxYRuG/T4uWYji6I+IkRiSxSMSPvq60Vf6c0QfDjN+dsun9zL9n8qNlRP7FnDAxsPsKW4MgqvnPFmzJNubtdw71csdwBbZGaGAH9JAngvOgm9qipNxE1Fl6SMBRayaPzxuR5pWgW+5GveLX4bhHL593rCXI/D1rVdgFY34RaWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9d/D/k9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9d/D/k9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2AD2C19423;
	Fri, 27 Mar 2026 08:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774600137;
	bh=aX3T5HqlHVFDXpCojT5Kga3nSDgSpxMzAsP25toZvf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J9d/D/k9DZCR2xoru2YNoVx5+cGNkmX4sBvk4N2LZONHULOBSMJNyBUBqmT8KkNXC
	 DjUrkFHSHKzabNc8wrMhTpweCuWg0hVXGTUhkEYdsOgDgri3a5q97+CSnbLKxpcWfs
	 h8LZnVx79QV6x7eTza+YZYjFBn8RKMiqL/YfW0TYy3Y8hPpCK97RlI9UBTZ7gvFZaE
	 vL21DxlzLXfytELBLfoOVijLe8wDMENLgRjb3IWpCbvh7esATkW81D8Mn+9zxuewqT
	 iVbXtYbNyYUh1jg3MF/6fRSYaw24Kb+O+eRR9ssOOhqeyXA9642+cqamCpfu3z0xXv
	 jMBOnHsk6slSg==
Date: Fri, 27 Mar 2026 09:28:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rustam Adilov <adilov@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stanley Chang <stanley_chang@realtek.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: phy: realtek,usb2phy.yaml: extend for
 resets and RTL9607C support
Message-ID: <20260327-berserk-roaring-quetzal-24dd7e@quoll>
References: <20260326193419.48419-1-adilov@disroot.org>
 <20260326193419.48419-4-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326193419.48419-4-adilov@disroot.org>

On Fri, Mar 27, 2026 at 12:34:16AM +0500, Rustam Adilov wrote:
>  description: |
> -  Realtek USB 2.0 PHY support the digital home center (DHC) RTD series SoCs.
> +  Realtek USB 2.0 PHY support the digital home center (DHC) RTD and
> +  RTL9607C series SoCs.
>    The USB 2.0 PHY driver is designed to support the XHCI controller. The SoCs
>    support multiple XHCI controllers. One PHY device node maps to one XHCI
>    controller.
> +  This driver also supports the OCHI and EHCI controllers.

Hardware is fixed, does not change. Don't reference your driver changes
here.

>  
>    RTD1295/RTD1619 SoCs USB
>    The USB architecture includes three XHCI controllers.
> @@ -57,6 +59,12 @@ description: |
>    XHCI controller#1 -- usb2phy -- phy#0
>    XHCI controller#2 -- usb2phy -- phy#0
>  
> +  RTL9607C SoCs USB
> +  The USB architecture includes OHCI and EHCI controllers.
> +  Both of them map to one USB2.0 PHY.
> +  OHCI controller#0 -- usb2phy -- phy#0
> +  EHCI controller#0 -- usb2phy -- phy#0
> +
>  properties:
>    compatible:
>      enum:
> @@ -69,6 +77,7 @@ properties:
>        - realtek,rtd1395-usb2phy-2port
>        - realtek,rtd1619-usb2phy
>        - realtek,rtd1619b-usb2phy
> +      - realtek,rtl9607-usb2phy
>  
>    reg:
>      items:
> @@ -130,6 +139,9 @@ properties:
>      minimum: -8
>      maximum: 8
>  
> +  resets:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -157,6 +169,15 @@ allOf:
>      then:
>        properties:
>          realtek,driving-level-compensate: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - realtek,rtl9607-usb2phy
> +    then:
> +      required:
> +        - resets

If it is unclear, they might not have it so,

else: ... :false

see example-schema.

Best regards,
Krzysztof

