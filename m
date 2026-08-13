Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D555435C6B8
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610313; cv=none; b=tcI1GZD+9n1FZo8O8qBcHGPX+h7979gUYW2AsDMqgOOCwTWFjvDbEEtW2FVhHPXYEFApEsL471qqEcUeAhca6/8pQDwKBOdDGrnliFLn4nX0A6c0RfL7541lekbX8zbwH8lhM8aAJlZKP1mpPe870+tHC7GhRADMdndQEYFnxWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610313; c=relaxed/simple;
	bh=BxUNnp7MteQJi7FPDkXdFUR9QsZJbB6F64ZWzs+U1PU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YAhtjfRHc4ywP6sUdM1FyVv8RumUazW25+SSk7ZaJPOND3eEISC541fuFrhzVUhUxA3MG/uWFBZALsRCiSFjdPQOLDxIpkmurWquj7/zV1V4o7KFzIaDhxDm5Ef8ArzNsS978gVaIPMbQKfhcmbRwYBIR+lcGMxc7xV9ADQBkfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGrCdXcv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGrCdXcv"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso1888135e9.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 01:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786610310; x=1787215110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fYxN56Q1FiCTvNsl0xjkJkMf+TLROP+6g/NIvXZPeBM=;
        b=HGrCdXcvKXe9UvnayEoee2oQPbRnSjY1Z0gIlu075p3ASJBVzRobw4WQgeM4gJaBGB
         uSJNCDpm3qhw8ApNnjvA/xXXuJe711IPa/A6bpivrbaW+IeGbYUZ0uoVEZBG9AGOQs2A
         +COvb5VDubzKosZ68ImV/nj3eOfwnCntNpwziKHacJ9/MkPo0Yif/P24ABOsdvvl2Ytm
         gj1DlhJC2V/L13IxfZY1m8Ng7rwq2wSSdH3Vb+8dDD5GILzEQ5sfLR/LPO0qLVRFjXM1
         N3mz6bF6yQe7EKjDmyv4MwyHtlumS0JeDXcLReucLwx1JFA/InekQGVJU9hBiMstbZv+
         frJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610310; x=1787215110;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fYxN56Q1FiCTvNsl0xjkJkMf+TLROP+6g/NIvXZPeBM=;
        b=Jf/pkOh4CcOys17eP2sUn4pdj6vgqBytUMlHIpYEhio1ZOoB9XLFZcUxMJ7Ifh92Gb
         GkysaCa3EMcwtn7tgOKK/i4uW5pSmu9pT6PTxtGO/+oeZS3ALxewDtcnwVuZJTl1/N4E
         a9A4+jWUjZnSbbVTWzTxaX9u04ZF+OZkMNcXNlK6ZibCtlYrbihDRTFgUvZmjkAukeUc
         AAUFs+1xqY/jFIqCkWkqz83nmaHoprAcqCcy0SCK27TigFOPIPJ6RVBC24/AHqThtfes
         zQP52RTQuuQHRTni2Iw63k4iaPrdamST+PQqSZI2f63jLnX91MuPl8QH5mTt6FcJ14FP
         XLxg==
X-Forwarded-Encrypted: i=1; AHgh+RrCGQbT6my6/nw/gTP7olNQn3LaOKuKK8aUyU1+HO1JQCiNkWZhma3e3bjGOLEwaME8QLhzPhzRZCyM@vger.kernel.org
X-Gm-Message-State: AOJu0YwA8m9cCJ8ksIoGWSNsDm4RftrXOgIkfSJmLHvDyG0P+9n7GRxZ
	v+PMxmDsD/a9Mprnt6s7eXflKktKyIu2BS8GiiH9AU4QMRVsYQRx9nxs
X-Gm-Gg: AR+sD10HVbO0BX+TjyZk12b4SthhLMcp1FSK9dJrCjDOYiwXgMC3Ji2aLbsUXhlktYZ
	6H85zAuVS8TQR5Pw/uzn0+eRZHAz5zG+cPUd/OjHK0vqoTy4U+rqE+9bpEgfJ7bLQg1v/LU1lMs
	LOKth3s1WPb+MA96AHb7gB1qVDJHxAWV+1TakQWMxLVQVMgEaY5nTSiytmhTlSAoY/bdqayl6Lm
	YH0eEMKPVzQBc7AkOxh+zI1U7uytW78PN2PqQfuyHF3IyfGCaIPyFDS7ptqknqjaN0dFlyWDDEG
	obD8OIjXqcg3VZ5tXIEI7tk5iojVkvtL8BabCFZAISnBjelVN3evmLKgFrJUAabZww1wy3RyXs2
	8YKdpa+iiMa26kgtazCjVZP57z/Dai/c84nI1wLhAUvUlIfuIngqK703F2doZdIJE9TfjGr4z8j
	Z/AheMNGNeP5naeeZdFtvGNkwtuxyTCqU91FSvlupfCXE03ZuW/t7JcSOL4ew2ugdIu0JTvzDKl
	HPcMslqwvLFIeMlZPuno435Ti6UXlI=
X-Received: by 2002:a05:600c:4fcd:b0:495:63e4:7f78 with SMTP id 5b1f17b1804b1-499821e8016mr39965765e9.10.1786610309976;
        Thu, 13 Aug 2026 01:38:29 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a56981csm4384046f8f.10.2026.08.13.01.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:38:29 -0700 (PDT)
Message-ID: <6a7d8285.ebbd881c.33c407.30ab@mx.google.com>
X-Google-Original-Message-ID: <an2CgeKA7uWbj0Wv@Ansuel-XPS.>
Date: Thu, 13 Aug 2026 10:38:25 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: Add documentation for Airoha
 AN7583 USB PHY
References: <20260811124724.702467-1-ansuelsmth@gmail.com>
 <20260811124724.702467-2-ansuelsmth@gmail.com>
 <20260813-xanthic-sawfly-of-greatness-47e9bc@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-xanthic-sawfly-of-greatness-47e9bc@quoll>

On Thu, Aug 13, 2026 at 10:33:31AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Aug 11, 2026 at 02:47:22PM +0200, Christian Marangi wrote:
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
> > The second USB PHY on Airoha AN7583 SoC is used for PCIe Gen2 usage and
> > similar to USB 3.0 require a phys property to configure the serdes.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/phy/airoha,an7583-usb-phy.yaml   | 205 ++++++++++++++----
> >  1 file changed, 168 insertions(+), 37 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
> > index a6e2c0b1acc4..46b311040e02 100644
> > --- a/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
> > @@ -26,64 +26,195 @@ description: >
> >  
> >  properties:
> >    compatible:
> > -    const: airoha,an7583-usb-phy
> > +    enum:
> > +      - airoha,an7583-usb-phy
> > +      - airoha,an7583-pcie-phy
> 
> Keep the list sorted.
> 
> >  
> >    reg:
> > -    items:
> > -      - description: phy register
> > -      - description: ana register
> > -      - description: pma register
> > -      - description: dig register
> > +    minItems: 3
> > +    maxItems: 4
> >  
> >    reg-names:
> > -    itmes:
> > -      const: phy
> > -      const: ana
> > -      const: pma
> > -      const: dif
> > +    minItems: 3
> > +    maxItems: 4
> >  
> > -  usb2-phy:
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> 
> I don't understand this diff. Why do you add cells if you do not have
> chidlren with addressing for new device (pcie)?
> 
> > +
> > +  usb3-phy:
> >      type: object
> >  
> >      properties:
> > -      reg: [0, 0x1000]
> > +      phys:
> > +        items:
> > +          - description: phandle to Serdes PHY
> >  
> > -    airoha,usb2-monitor-clk-sel:
> > -      description: Describe what oscillator across the available 4
> > -        should be selected for USB 2.0 Slew Rate calibration.
> > -      $ref: /schemas/types.yaml#/definitions/uint32
> > -      enum: [0, 1, 2, 3]
> > +      '#phy-cells':
> > +        description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
> > +          as defined in dt-bindings/phy/phy.h.
> > +        const: 1
> >  
> > -    '#phy-cells':
> > -      description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
> > -        as defined in dt-bindings/phy/phy.h.
> > -      const: 1
> > +    required:
> > +      - phys
> > +      - '#phy-cells'
> >  
> > -  usb3-phy:
> > +    additionalProperties: false
> > +
> > +  pcie-phy:
> > +    type: object
> > +
> > +    properties:
> > +      phys:
> > +        items:
> > +          - description: phandle to Serdes PHY
> > +
> > +      '#phy-cells':
> > +        description: The cell contains the mode, PHY_TYPE_PCIE or PHY_TYPE_USB3,
> > +          as defined in dt-bindings/phy/phy.h.
> > +        const: 1
> > +
> > +    required:
> > +      - phys
> > +      - '#phy-cells'
> > +
> > +    additionalProperties: false
> >  
> > -  phys:
> > -    items:
> > -      - description: phandle to Serdes PHY. Optional if USB 3.0 is not used.
> > +patternProperties:
> > +  '^usb2-phy@[0-9-a-f]+$':
> > +    type: object
> > +
> > +    properties:
> > +      reg:
> > +        enum: [0x0, 0x1000]
> >  
> > +      airoha,usb2-monitor-clk-sel:
> > +        description: Describe what oscillator across the available 4
> > +          should be selected for USB 2.0 Slew Rate calibration.
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 1, 2, 3]
> > +
> > +      '#phy-cells':
> > +        description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
> > +          as defined in dt-bindings/phy/phy.h.
> > +        const: 1
> > +
> > +    required:
> > +      - reg
> > +      - airoha,usb2-monitor-clk-sel
> > +      - '#phy-cells'
> > +
> > +    additionalProperties: false
> 
> Looking at the amount of changes this should not be the same binding.
> Also, things would be simpler if children were called 'phy', but OTOH
> why do you need children in the first place? Your pcie-phy child has no
> resources, except phy which can go to the parent device.
> 

Yes while writing the schema I also got this doubt that I should have just
made 2 different schema. I wanted to put everything in one as they are the
same HW and driver.

I will just split these 2 to simplify it.

The child is just for consistency with the USB and easier implementation on
the driver. But I guess for DT this is a no go. I will rework the driver to
drop the redundant child for the PCIe variant.

-- 
	Ansuel
