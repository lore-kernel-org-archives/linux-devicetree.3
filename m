Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071C04457C1
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 09:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771650; cv=none; b=rKe3MZq4Y8LM+/yTdrbfn1TCHZS7P/s81Cx4xJ9s0myqWWUVPFuo5eMR0oyJwFf9cU23WiCjOoFBLc5yaABLIGYKb2Dk6np4RX3VVxSgcxLIEURQoL3LZV6F9kvy+ekuCSvcxa2/KqokwStLwMqrDTL8ppCOvQlYiiGpcskOrbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771650; c=relaxed/simple;
	bh=qjss7lUF3Y/rjAuBg4W/OXETaJBt4OSrrAlxAxeAmRM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVqaYI6Mjo+lfoGmX4GntgnIhcilCwAnExSqMlmlcibzwkqbiJgD5Ub27TJX7mM1yynXrr/JS8cHTuDVZxF1wpLJ9G9iH0lRUr2SqjEg0nO2e7AEyVD+XuP94LQztkbYWJfThbmlBEpFA0V9tAjLNaFNodZBGROPA8T/lEt4cac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=orNrfk0D; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="orNrfk0D"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2055573c8cso397645166b.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 02:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788771646; x=1789376446; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xy+IN57SJ+erwNKooouJ4W3oQbU76/YCXs2psoMgnps=;
        b=orNrfk0DLL/SslqOLptfIovxTS3FAeTif3FOeRmEyh/z42QMFnlx3bBcPFh5WcXfeJ
         D8LnFPPxZnQ5OMefWFCAZgJWTRXHk5v4KS7Run5GpNgxPF3NmrVeNt9+HRExuabIexfZ
         a5p6I3LX9/vH21vj1Nqyjw0jBFCBLs2xRu6hsiWjZZ4y+9iZfLm4IJGOitDEZ4rm+S2A
         hNNzefbB5+DTYTtNXevMa8MCoGiKewCqtn5hKa+/9dIR0OPBSzYFIYhQXgja54lj7+nr
         Gq8G8ezzNMGotwyBloL7PKU7cBV/bUhpRH/p/13v6YIQ+OEi2jMhKwIggQ3vAk2QdWYO
         cDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771646; x=1789376446;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xy+IN57SJ+erwNKooouJ4W3oQbU76/YCXs2psoMgnps=;
        b=OLXVNvjZcswesRB3VATCx6lvy5EiQQ2lIQ2M+J/8d2xjkos5cfEws2UjLI1wrQZaxY
         fLOZKan/aswOX+BSsrG571rsjXCw966SLi3e551aE5JlqzsrJfBAz4EL9F3sEOxrQIBC
         gFEsDT29n6gmmlmQDBggbiunguOEKQpvzwDRpcS8H7AeOmHFegtbvFUmIqDoT2CvtqpV
         A+prdjHB/wSTo2GsrlZoUeRXa06oMMtwqTuuZRASE2STEw9h4vxGlEwSRdhI5xjS5wCn
         jMCVPV6Xc3RjlkyWy8RGDSYBzZZyTjmy5XQ7ZSvXh4aXxZJEQdMVrkVFAErwUsJwpgJj
         M24Q==
X-Forwarded-Encrypted: i=1; AKwUvBwNR3EZ+/uBlqeqYSeUAMz6h6KJ8dh2/I48BdBzE5d9WgkyYgl7OaT3TMdWKLO2N9T+/ERY0GHQk8Wn@vger.kernel.org
X-Gm-Message-State: AFuF++ly/ZG8iIcjedU7wmLsXpyUckuybd86fptc1hqOLN8xOMhF9ntH
	W4lSfHe4H2UQjLl7dTpmmHp4aMhT5GbGW4zsJKhklzd7lyES/7PZqcVb
X-Gm-Gg: AYBFou3U1NElPQpcAEha/nFz15XrQ+lhhP97Rjz4enfkra4Rv9iXcXzDq9dgOiy5qW4
	NeZcTXqDeRl6bvDqPM8IP4evPmXKTydXDYeRTzi2MFF3Spnk4lEK7wUePiwO8gcepik0RrEp84d
	N4wujNMOIqyge6QFMdwefL9yUNK7uF3pvM0iyK5DL6XvEDMgOfzOBfasDWT/KOpjfiilMpx2/Af
	SWjMHZ5nlXcAoWj6Rw8IqQ98fWD/I2+mycYeKNSGAaFLJnGm5WVzbnvIrOYqnRuRr7vqxWCuNFc
	veO16X2SzJbdxUks5CnNO64A/dLY7fbFOmK6IEzOWXSWUlsYjAQwo0Z53IRUBMdEwZZV7y74tRG
	M4laR//mLF3ZHzeYDbcYOnpRslk+mOal7X8rTpu0AlLg7sf89e50U8V/xAXKha4T4mWVymlmgge
	cLOKGBYxfk+7Y2boNobEvkN+PLdfTaRZ1Et8olrFKn8Vh/OPmxTjdhwNYmgCwPFLlvwqFxgcUur
	Si8Jo66f7TtP6z4wTzxCAZ/5+9vLyVBuj8=
X-Received: by 2002:a05:6938:a084:20b0:c26:3107:71dd with SMTP id a640c23a62f3a-c2631077920mr261082266b.13.1788771644348;
        Mon, 07 Sep 2026 02:00:44 -0700 (PDT)
Received: from Ansuel-XPS. (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5bb9a9sm420312466b.55.2026.09.07.02.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:00:43 -0700 (PDT)
Message-ID: <6a9e7d3b.0f5dc47b.330412.df04@mx.google.com>
X-Google-Original-Message-ID: <ap59OSq9XsFz44OY@Ansuel-XPS.>
Date: Mon, 7 Sep 2026 11:00:41 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: airoha: Document support for
 AN7583 USB PHY
References: <20260901123933.15388-1-ansuelsmth@gmail.com>
 <20260901123933.15388-2-ansuelsmth@gmail.com>
 <20260907-auspicious-liberal-raccoon-bd7a81@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-auspicious-liberal-raccoon-bd7a81@quoll>

On Mon, Sep 07, 2026 at 08:35:56AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Sep 01, 2026 at 02:39:31PM +0200, Christian Marangi wrote:
> > Add documentation for Airoha AN7583 USB PHY that describe the USB PHY
> > for the USB controller.
> > 
> > Airoha AN7583 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> > always supported. The USB 3.0 mode is optional and depends on the Serdes
> > mode currently configured on the system for the relevant USB port.
> > 
> > To correctly calibrate, the USB 2.0 port require correct value in
> > "airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
> > selecting one of the 4 monitor clock for calibration (internal clock not
> > exposed to the system) but each port have only one of the 4 actually
> > connected in HW hence the correct value needs to be specified in DT
> > based on board and the physical port. Normally it's monitor clock 1 for
> > USB1 and monitor clock 2 for USB2.
> > 
> > To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
> > property is required with the phandle pointing to the correct Serdes port
> > provided by the SCU node. Providing the phys property is optional if USB
> > 3.0 is not used.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/phy/airoha,an7583-usb-phy.yaml   | 133 ++++++++++++++++++
> >  1 file changed, 133 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
> > new file mode 100644
> > index 000000000000..f1a5d83e8968
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
> > @@ -0,0 +1,133 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/airoha,an7583-usb-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha AN7583 SoC USB PHY
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +description: >
> > +  The Airoha AN7583 SoC USB PHY describes the USB PHY for the USB controller..
> > +
> > +  Airoha AN7583 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> > +  always supported. The USB 3.0 mode is optional and depends on the Serdes
> > +  mode currently configured on the system for the relevant USB port.
> > +
> > +  On Airoha AN7583 there is an unified PHY implementation where a single
> > +  PHY provide support for both the 2 USB 2.0 port and
> > +  optionally one 3.0 USB.
> > +
> > +properties:
> > +  compatible:
> > +    const: airoha,an7583-usb-phy
> > +
> > +  reg:
> > +    items:
> > +      - description: phy register
> > +      - description: ana register
> > +      - description: pma register
> > +      - description: dig register
> 
> "registers"
> 
> > +
> > +  reg-names:
> > +    items:
> > +      - const: phy
> > +      - const: ana
> > +      - const: pma
> > +      - const: dig
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  usb3-phy:
> > +    type: object
> > +
> > +    properties:
> > +      phys:
> > +        items:
> > +          - description: phandle to Serdes PHY
> > +
> > +      '#phy-cells':
> > +        description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
> > +          as defined in dt-bindings/phy/phy.h.
> > +        const: 1
> > +
> > +    required:
> > +      - phys
> > +      - '#phy-cells'
> > +
> > +    additionalProperties: false
> > +
> > +patternProperties:
> > +  '^usb2-phy@[0-9a-f]+$':
> 
> You should not mix MMIO and non-MMIO children. Either children have
> distinctive addressing, or not. Not both.
> 
> The other problem is that your children have no resources, so are not
> really distinctive children and should be folded in to the parent.
> 
> I already asked that at v2, so let's finish with asking: drop the
> children.
>

I misunderstood the request and tought it was only related to the PCIe
part.

I'm not really sure how to drop the child without complicating the node
structure a lot (also I feel dropping the child would make the description
of the HW less clear and I would like to prevent that)

The register for the usb2 node 0x0 and 0x1000 are offset of the register
declared in the parent node 0x1fac0000. For usb2 1 the phy registers are at 
0x1fac0000 - 0x1fac0200, for usb2 2 the phy register are at
0x1fac1000 - 0x1fac1200.

The driver read this offset and apply it to every register access for the
related phy.

The usb2 child are needed for the specific airoha,usb2-monitor-clk-sel
property since it's specific for the usb 2.0 phy.

Also would like to stress that these PHY are all part of the same register
block.

One solution might be to just classify the usb2 node as 0x0 and 0x1 and
handle internally the register mapping with the driver. But again the
problematic thing is map the monitor-clk-sel with the relevant USB 2.0 phy.

Any hint on this? Is it ok to keep the child node and use 0x0 and 0x1?

-- 
	Ansuel
