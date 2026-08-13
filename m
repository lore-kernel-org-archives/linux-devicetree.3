Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FEE38DC4F;
	Thu, 13 Aug 2026 08:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610019; cv=none; b=ZANc3V51pCu0mg39Kp96CNdXFgm60krlwR4UxXwtB4DmbCeEa6V0hvWu+HnITtPRtsYajRRaLSN32g4v3c6aH6zhWiVC9SEUHvcaFqv/e4+xb4UEVngOoRNlV9UUwu1KvU+Cn7aVe/J8rT2/+JTJF++PvnMXTcuautlHBUMF20w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610019; c=relaxed/simple;
	bh=scwsrObXceIW25+t4EBOXP5mUC0R3030EikGBWBWLdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kot75vZAMXuo0DFeodx8tLFRWFgudGTtE4zeAQ68JDcASgNv++zftDxwwzWK5rDdGcKayRqCFNqCjcIlOzwFFfRXM3b9igwV8Ueg7lLvsvI/SA8BosQj6jjuaXZANxM5pSocTxKfR+n9gegWuwbskn2B2fklEuJse5KtrkfCXjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhUlY0Ig; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhUlY0Ig"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F2DB1F000E9;
	Thu, 13 Aug 2026 08:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786610017;
	bh=3pi032W6HNnsB6a/BIb5totDN4yPYUsdDVDiwq7RYlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NhUlY0Ig8/hSWLibzaLr+JJCEQmXS0sfO0JL8kclxf0T+91n6ZZDd0+nKJXWLhxpZ
	 09tVkQB678PqQsFbOeg9pYw7crzGzTI0i4auYZJQJ7wBFrZ5YGMtm5lPRBfEbcaaRd
	 LQWFtjCQENHSRxD40YvXz+EozeG7P7KKLWLlWahNMxjbP6iyaxnIsHDfXg2F7BkWo5
	 aX6XDi1qBQL4VszD/EuJvWTiR6NN6CLh/J02onIhgFGuOclWCZmSjB73kLU5wKa2tQ
	 P+UkSWqwJ/ZVacf9NFECFVloDb8hpssGVaqQAmQYjsVk+kdYOk/z8jbUsR7xfapWRv
	 dT4pOOuNzDYQA==
Date: Thu, 13 Aug 2026 10:33:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: Add documentation for Airoha
 AN7583 USB PHY
Message-ID: <20260813-xanthic-sawfly-of-greatness-47e9bc@quoll>
References: <20260811124724.702467-1-ansuelsmth@gmail.com>
 <20260811124724.702467-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260811124724.702467-2-ansuelsmth@gmail.com>

On Tue, Aug 11, 2026 at 02:47:22PM +0200, Christian Marangi wrote:
> Add documentation for Airoha AN7583 USB PHY that describe the USB PHY
> for the USB controller.
> 
> Airoha AN7583 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> always supported. The USB 3.0 mode is optional and depends on the Serdes
> mode currently configured on the system for the relevant USB port.
> 
> To correctly calibrate, the USB 2.0 port require correct value in
> "airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
> selecting one of the 4 monitor clock for calibration (internal clock not
> exposed to the system) but each port have only one of the 4 actually
> connected in HW hence the correct value needs to be specified in DT
> based on board and the physical port. Normally it's monitor clock 1 for
> USB1 and monitor clock 2 for USB2.
> 
> To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
> property is required with the phandle pointing to the correct Serdes port
> provided by the SCU node. Providing the phys property is optional if USB
> 3.0 is not used.
> 
> The second USB PHY on Airoha AN7583 SoC is used for PCIe Gen2 usage and
> similar to USB 3.0 require a phys property to configure the serdes.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/phy/airoha,an7583-usb-phy.yaml   | 205 ++++++++++++++----
>  1 file changed, 168 insertions(+), 37 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
> index a6e2c0b1acc4..46b311040e02 100644
> --- a/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
> @@ -26,64 +26,195 @@ description: >
>  
>  properties:
>    compatible:
> -    const: airoha,an7583-usb-phy
> +    enum:
> +      - airoha,an7583-usb-phy
> +      - airoha,an7583-pcie-phy

Keep the list sorted.

>  
>    reg:
> -    items:
> -      - description: phy register
> -      - description: ana register
> -      - description: pma register
> -      - description: dig register
> +    minItems: 3
> +    maxItems: 4
>  
>    reg-names:
> -    itmes:
> -      const: phy
> -      const: ana
> -      const: pma
> -      const: dif
> +    minItems: 3
> +    maxItems: 4
>  
> -  usb2-phy:
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0

I don't understand this diff. Why do you add cells if you do not have
chidlren with addressing for new device (pcie)?

> +
> +  usb3-phy:
>      type: object
>  
>      properties:
> -      reg: [0, 0x1000]
> +      phys:
> +        items:
> +          - description: phandle to Serdes PHY
>  
> -    airoha,usb2-monitor-clk-sel:
> -      description: Describe what oscillator across the available 4
> -        should be selected for USB 2.0 Slew Rate calibration.
> -      $ref: /schemas/types.yaml#/definitions/uint32
> -      enum: [0, 1, 2, 3]
> +      '#phy-cells':
> +        description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
> +          as defined in dt-bindings/phy/phy.h.
> +        const: 1
>  
> -    '#phy-cells':
> -      description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
> -        as defined in dt-bindings/phy/phy.h.
> -      const: 1
> +    required:
> +      - phys
> +      - '#phy-cells'
>  
> -  usb3-phy:
> +    additionalProperties: false
> +
> +  pcie-phy:
> +    type: object
> +
> +    properties:
> +      phys:
> +        items:
> +          - description: phandle to Serdes PHY
> +
> +      '#phy-cells':
> +        description: The cell contains the mode, PHY_TYPE_PCIE or PHY_TYPE_USB3,
> +          as defined in dt-bindings/phy/phy.h.
> +        const: 1
> +
> +    required:
> +      - phys
> +      - '#phy-cells'
> +
> +    additionalProperties: false
>  
> -  phys:
> -    items:
> -      - description: phandle to Serdes PHY. Optional if USB 3.0 is not used.
> +patternProperties:
> +  '^usb2-phy@[0-9-a-f]+$':
> +    type: object
> +
> +    properties:
> +      reg:
> +        enum: [0x0, 0x1000]
>  
> +      airoha,usb2-monitor-clk-sel:
> +        description: Describe what oscillator across the available 4
> +          should be selected for USB 2.0 Slew Rate calibration.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2, 3]
> +
> +      '#phy-cells':
> +        description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
> +          as defined in dt-bindings/phy/phy.h.
> +        const: 1
> +
> +    required:
> +      - reg
> +      - airoha,usb2-monitor-clk-sel
> +      - '#phy-cells'
> +
> +    additionalProperties: false

Looking at the amount of changes this should not be the same binding.
Also, things would be simpler if children were called 'phy', but OTOH
why do you need children in the first place? Your pcie-phy child has no
resources, except phy which can go to the parent device.

Best regards,
Krzysztof

