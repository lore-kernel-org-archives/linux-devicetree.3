Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3BC351C28
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779351753; cv=none; b=o4BUI3GpQFJ9X6uG72hXbigNk5NJvkE2+Iopv0hX7hWcqsUbV2BcNSkbaNFk3oOy3dOHFgsVveLSJ19Z8yUi8GT84lIclp6K6rPKMEh1dbtHH9cnPlIdTV85TiYf2nVXvU9z2OQRGdOROn7OD4rDsUwA8EQ0pg2fR5pFGSH2tdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779351753; c=relaxed/simple;
	bh=2U4Iz+y/ftIEQD2G9GHkxV5IQLWcE2W5F9DA9bvujfE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3GzOKJKR/JLmDzsOvtMN7fUH/1rwksv2mAVxn/5S0Kf7sbAboonuwUwQnAZ+b5JRdfFPVRlwwE9r67Nke7EOJYzUuzB7shyV/ur6wVY4hbjieeBrjlGLm0jqPYS0/78aH3Cir3evW2zFhKl0Sg3DIRgRT52CChy53jz7BeNCl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1RPX4Tr; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1RPX4Tr"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso48314135e9.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779351751; x=1779956551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iCcyB5LFRmVcSIROxmyKJG5EejU8FPAzcsI/5iDjdGU=;
        b=Y1RPX4TrHsw4GfhL/hlzBc7o0EBKZ404MMtMm9nl9sKh2faf3YcHRDm5/fXHxjSYvA
         ORz13F6JG1EraOGiT/j3w89DwyrifOeytE2R2aHu4JMHRzbGtmLAm6Ql4nkI2ZVD9hOy
         WPMoiqbRqlmT2D4vP/z0PpAgH/6zOS00Clg5N8D7f1ISkR2DHeth9KRS9yjU/NFmFC8T
         xfY293wXAVSvGX73fkj+UHxQ9Zjsz+Vc9++YiAkcB3xx/CX5B8/WC5cdRq5syopbcRh/
         ggYm+v6uy+DDsNu1wwRopoIdyY3AnbDIJPHubn9aD7PAnkdkE4tZV+D8Jpst0DyyTBF6
         CA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779351751; x=1779956551;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCcyB5LFRmVcSIROxmyKJG5EejU8FPAzcsI/5iDjdGU=;
        b=UZybKiltLnsDP7RcyZOvrfngZtYOhNmC2vvm+os2ErI0exeaf9gClwdCbYEDCClmeU
         5A0vspci2dhvg8ZLpurkcyQTNexXwYIxLvN/Zf2W/WCyZYicPUX2aY7Dl+WdGtgDk0Bt
         gcBziuzJf2mvkh6Du5RErmRCwsMxsZcudR7fDO6RhOyMxkx4+hr8OfrdPoDcaFs3RUis
         JmiLuz5iC609MCoYPMJcRvI36Rv0p8Mztq8tg3rA3EKxJ6C2vIsTTN35zZnrUAsMrzao
         BM8JMSPb0TG/3hYqvNDZwc2TGfbU6iv9BxJ4bRyz+lqAClTxC6xtJfEyaWIZozWo5yIJ
         uNgw==
X-Forwarded-Encrypted: i=1; AFNElJ+57rTnVOyYm33N8zivXDCXLFJPhMIOFYw0jmRJZyuNs+E26Dau+/vd9Q7jlH93GoLUI6CAbGjTzfxR@vger.kernel.org
X-Gm-Message-State: AOJu0YzFoU468lplYBs/VnT0j7A/BBoGGOHCdR0qNeD3wxt4Dxc5nZo2
	pkuz9wMlYk3+7r2I4Z1l7YLq93ScG9nN04B5GqXQ+EVCEZ1i8nwkcM19
X-Gm-Gg: Acq92OEXPGgab9cUofESmbZeSa8ew+Y4ZxeNAUxDWHIFf3xeVH6tRiklC7lIjiekYoJ
	3jy44ZkeP9iorhyRBCJkr+9YOeWepctYbeI6RNiLAbxVLe5Xsd5QlMt9xuqUQc+x3GMjisF25tz
	H1iuFWQWjfoj9jTXSPhjEt+tsM6ye7WEpK1+ucaw8V3mBSM8X+5OoMdQ4oXPLOJabEHfgzJhytf
	LOsCgyxhxP8koF4tElGy7dx2G3VK72mzlShs1A4cqfIRXlg3FVD8LSwxTuQYM2oqxjaHOyQOAaK
	27GG7K8pj/+U0MfGrl2kNbIYuNe0zJQONejg58tayllECld5+ze+57UncIWowQRzYDnUehJDdc2
	OKFmRJ8WdaoQNFyA9+odqfJbuRFFmS7NAxDH6h1SE/STR8jABjrXKOBN3deQuL/8+BycZXwziPr
	EtqLbPwm1gmZosTgx3kWOI2Le+lvKihFx+r2pvS0Z6+EbxIZNRIl6DBgc4ZYDLWi+63IP2RCVv
X-Received: by 2002:a05:600c:858c:b0:490:778:4fec with SMTP id 5b1f17b1804b1-490360f28f7mr17896195e9.33.1779351750348;
        Thu, 21 May 2026 01:22:30 -0700 (PDT)
Received: from Ansuel-XPS. (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm9490145e9.14.2026.05.21.01.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:22:29 -0700 (PDT)
Message-ID: <6a0ec0c5.16c38fd9.2b754a.4dc3@mx.google.com>
X-Google-Original-Message-ID: <ag7Aww1CbIvhnItD@Ansuel-XPS.>
Date: Thu, 21 May 2026 10:22:27 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v8 2/5] dt-bindings: phy: Add documentation for Airoha
 AN7581 USB PHY
References: <20260520150912.11614-1-ansuelsmth@gmail.com>
 <20260520150912.11614-3-ansuelsmth@gmail.com>
 <20260521-ambrosial-abiding-lyrebird-9dc86f@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-ambrosial-abiding-lyrebird-9dc86f@quoll>

On Thu, May 21, 2026 at 09:44:16AM +0200, Krzysztof Kozlowski wrote:
> On Wed, May 20, 2026 at 05:09:07PM +0200, Christian Marangi wrote:
> > Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
> > for the USB controller.
> > 
> > Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
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
> > provided by the SCU node.
> 
> 
> ^^^ here - required but:
>

I think I have to rephrase it. It's required if the USB3 is used/wanted. In
the other case for the USB2 phy is not needed.

I will bettet describe this in commit description and on the phys property
description.
 
> > +  phys:
> > +    items:
> > +      - description: phandle to Serdes PHY
> > +
> > +  '#phy-cells':
> > +    description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
> > +      as defined in dt-bindings/phy/phy.h.
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - airoha,usb2-monitor-clk-sel
> 
> 'phys' is not required? I think you need it to configure the serdes
> correctly, no?
> 
> > +  - '#phy-cells'
> > +
> > +additionalProperties: false
> 
> Best regards,
> Krzysztof
> 

-- 
	Ansuel
