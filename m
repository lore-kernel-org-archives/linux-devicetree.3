Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668A01A8F97;
	Mon,  8 Jun 2026 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780915556; cv=none; b=fOz3QWaSy0bqVHBqhpKa4a4ixUjW4vv54J/jmddp5yXSFpmamFTVHbPxt9zWNgYBJ9vf449Vsl+K3AYbikv6BXX8PKKJAvjJcfYhXkCY6GfNzy/A13/fmoCceGiXSfWIUBN0nxf2ulGSQg57vTotKrjSWxU32Q1Q3XHR8gFi84s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780915556; c=relaxed/simple;
	bh=h1Je3+HNra4XUDRyldEO2eLsBWefFEzvjDb3d/gWJLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZHeCLuFwNOfycBQvONb53Owz+txTMUICfsDo9OqkcI0CALnoZhykYjUDrptcw0ic84D2vGkwAodL1V2YVgmnF1Wa3XhEe5Jrhw/Qg/pFwcP3mdNOMdgnE1WUDtWrJT3OKiBuAjO6HWw09KUbme+xqvsIkcLNsTKdR6Kh05td6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dH7w9e5c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dH7w9e5c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B051F00893;
	Mon,  8 Jun 2026 10:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780915555;
	bh=lwAr31YE3Z1pED6qS0szzIwG3QCMLEOLMnQ2RMJDUOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dH7w9e5cFvpPBbow5Hvzni+rdfyCJ3vvHYC0PpS0hpnzJH/kiVkxTr/pH/L/j24io
	 sHDosiUTCsVi0O5Ubn/CDuPWvynxVvwHKIpPhBSgGQ3iZMv+fvYy/03Om123qHfaD4
	 rqeT5sS7i3FuHBqZd6+A8R2ymf1lu/2sUxKAw0MH8Fim/BFtCOl6gcXDQvg8yS7On5
	 ulpkSxz+5tbOngYZa8XXDRazCC6gxRlGcimjE5YFDRx6ovgft23vkbHXt871HAA7Gl
	 2PRBnv8wbkJj1Y9JtYZ+9uQ+snvAfGO2VJFOm6a9fC7m2kJ/2cThPgPlVs2Xlm1Rhe
	 68JvJBYcj1lEw==
Date: Mon, 8 Jun 2026 12:45:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: nuvoton: Add MA35D1 USB2 OTG PHY
 binding
Message-ID: <20260608-demonic-horned-honeybee-4f6bb7@quoll>
References: <20260604101220.1092822-1-a0987203069@gmail.com>
 <20260604101220.1092822-2-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260604101220.1092822-2-a0987203069@gmail.com>

On Thu, Jun 04, 2026 at 06:12:19PM +0800, Joey Lu wrote:

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> +properties:
> +  compatible:
> +    const: nuvoton,ma35d1-usb2-phy-otg
> +

Where is reg? MMIO is expressed with reg, not via custom phandle.


> +  clocks:
> +    maxItems: 1
> +
> +  nuvoton,sys:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to the system management syscon.
> +          - description: PHY instance index.
> +            enum:
> +              - 0   # USB0, OTG port (shared with DWC2 gadget controller)
> +              - 1   # USB1, host-only port
> +    description:
> +      A phandle to the syscon node covering the SYS register block, with
> +      one argument selecting the PHY instance. Index 0 selects the OTG
> +      port PHY (USB0) and index 1 selects the host-only PHY (USB1).
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  nuvoton,rcalcode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 15
> +    description:
> +      Resistor calibration trim code written to the RCALCODE field in
> +      USBPMISCR. The 4-bit value adjusts the PHY's internal termination
> +      resistance. When absent the hardware reset default is used.
> +
> +  nuvoton,oc-active-high:
> +    type: boolean
> +    description:
> +      When present, the over-current detect input from the VBUS power
> +      switch is treated as active-high. The default (property absent) is
> +      active-low. This setting is shared by both USB host ports.
> +
> +required:
> +  - compatible
> +  - clocks
> +  - nuvoton,sys
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +
> +    usb_hphy0: usb-host-phy {

usb-phy

And drop unused label.

> +        compatible = "nuvoton,ma35d1-usb2-phy-otg";
> +        clocks = <&clk HUSBH0_GATE>;
> +        nuvoton,sys = <&sys 0>;
> +        #phy-cells = <0>;
> +    };
> -- 
> 2.43.0
> 
