Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703915;
	b=kkzKHiKjbKLj5mCtKpJEhpVn7leCnpHZMUTYf5Lyhch79zc06ZsvieKolA+nThXW/AoA
	 99wpkNc3H425DsGkwUwrVA62ywYL8dHx+jaFPXN4IDlMOjMrmlqN0jv5TUguGKVi2U9lr
	 iVH6TabP9VACmtMYfHvPIxr0Svpt3SUxKEz5IsYhys0undQ4yamnikTRXrcIyjtdDfuqj
	 0onwsIpddIXfgFRmtWcKjV+0zre6pMLyZGNXhAJ5T+kOnfKXlUPVcif0seKJP+ThSi2eO
	 kGQLRBP13JjoLYwkPDU2co7bAaIvNC2tXdGZ08HER2WnIba0WgNUNrZsPcrX3TJc2kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=auCcba+5d77RO1uYXgMttg2oy3VWOurHghWnl0cLv30=;
	b=AhQEVvy9KxSs1l6yEyR2VEaxlRL3LRM6PLP11TK83wTdpwlySCJbZyNLH0jHKCgq6n9A
	 JEDldVY3oH3Lg3mASZ1Y/PJCt/4TdMXTjspWMBffMQ7jDZEPoYLMADC/cKXDDJMRSQ/B6
	 pM6wAC/OcBGHY7Fxd05bRRLhiuLM0xs0Hl8KYJf1vRiBPuWpK2VjPUFi1OLFYDWDmU8G/
	 6VV0RNaUiAvADZwzoyjZYK43DgEEYCJ5OJ8Z9nJpasUNvd7er8jF1xk9qd+eiKkfYeugI
	 FiGYV4Wx+g2jYl7SDg+FZSC54GO3YqVvPmI20FC1+m0toNVOjXW1aq43Ulu3qfUIxkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WnMPnIzC;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175C0606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 175C0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WnMPnIzC
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so17116305e9.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703912; x=1796308712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=auCcba+5d77RO1uYXgMttg2oy3VWOurHghWnl0cLv30=;
        b=WnMPnIzCdls3owP/R7yn2u4u0fUOEWTcVkLBsniilxqyGNDXTQ4mYtnNLW3jq/gu8c
         JPS6XwAQwe668dr05qBwoRf0yembIvH2CAhC+xD8WP+BUPu2x4ClIkjwObp9imYTKk52
         lnj0RGIaYTyR+Z6WA1w2C4afowfHBTIE6Nb8KHlB7IuGRKAu+h+V/HPe5eHILMCfzJOX
         yfV/voIjnBtVa99WV+7BRTtcAJCkH7Z6caSMesferB2eX/KNe0Wl17xIQIPl3rIV603U
         CJeJK0MAOKn2FlslWKKSsBesSuwXYQhexEcxP4WxvsX30dh/dcuhROsUUVhT1G25gxpv
         XJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703912; x=1796308712;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auCcba+5d77RO1uYXgMttg2oy3VWOurHghWnl0cLv30=;
        b=Wit2vGHldj1FVXu/GRnbePgCudCyKCIqvgWjh/D4gICp/FwlOVMHlc7U37vbUaorfg
         +6sxK3+//IBvxg0wQ70/yakGmPLV6SKlmdpruU3x8Gdd4Io/XvALfuYiBqT0yQdeEQER
         NR0OaiPnZfTHZsqMEzZqjHbLleovlZ/USLY43Et3Tqc8vLHkcR1ITlUxgSwSl7f5b2FN
         vSQqpLk0H+aJPT52D7RY45ynIPzJcR/w2gjErW+sHObqjB+3qaTcJ7uKKfs6cBUwdyXV
         RBIPZfuQQa7NTUy2jKK5y4LkiES4DTANsDyZrqzEBNhDNARF8wghBCZNAkpyXsTLvmMT
         x5og==
X-Forwarded-Encrypted: i=1; AL+hErFj645C18MHbLgpXkmdV17g95c7J+95sa8oUPGSzlMaiUM6IP3KydJ399kLZFvX3HJLCWb2WyXjAUt+@vger.kernel.org
X-Gm-Message-State: APuU4Z9q4QTKwWrnEtUKCqCObgdGVFNWE1sfbs0iWTQKzYpv5enEmI/4
	MU9EAvrcvrwlAC1ULq9Zq8G8riwq1+zdRApb/z50o4Leq0iT1GnH4QVV8zIvle/19+w=
X-Gm-Gg: AZFdTZeylsxVW58N+KuSpGM0rn71nG0vayl4wynJbIsj3xok4AmJ9KT/7CxDUdFzaYP
	I0XE04/FJanQEm6i26W95pbfmxlq+sAKMCTMolNLXBg8X/y5MIif1NuzaB6KhaRTW8PUkzli6Ce
	liqTi7R3nlabXJ1r0z86Tx7SHECsZWoPeoYsbBIlA4hajirLaEMww8E5b6WoAiAHfFUwp/UC9D8
	h3quB9RP5lXFOdR0ORU1xv6aH+7wA13FAQRMAcdgFqrGLTyl7bTLfBm/aOXP6Tce06FurnWAyXb
	1LZCtKmAukrQRxEm+kVYTx319KwhRQ/IgttB/LWTQGbiQXxzMsKakADCMI5rzkObdI6yVl4VRJf
	wdq3UqG8wADMjQbdVJmMOTySwoBidXthulyG+CYz6M+MT/7I3ZufKxJyLSXgeogP1bmnmXyRio5
	kotn8+t0aHr477J0wYtZUfW9zPWQwPsWnQ4COFJxzbe/4GLPY3wjTsgp/NefdbvbXTaZwfENiWP
	oWC9wiFuOeMkO40QtK4+uCBSr/O1jln9vlKTGWYHpxU/iv8udx8SwmJASq7cMEWkkABfGE44pHe
	WeYYJg7l9P7F8VEVY3S++N/Kj5Qzdw==
X-Received: by 2002:a05:600c:4e16:b0:4bb:69b2:d3df with SMTP id 5b1f17b1804b1-4bb88813024mr437965725e9.25.1795703912479;
        Thu, 26 Nov 2026 06:38:32 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm615439805e9.5.2026.11.26.06.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:38:32 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:42:32 +0100
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/28] dt-bindings: dma: brcm,bcm2835-dma: Document
 dma-channel-mask and DREQ flags
Message-ID: <awhFWBteSWqZ5keD@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-7-andrea.porta@suse.com>
 <awXnR8jz-Nd4QLJ_@lizhi-Precision-Tower-5810>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awXnR8jz-Nd4QLJ_@lizhi-Precision-Tower-5810>

Hi Frank,

On 14:36 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:44PM +0100, Andrea della Porta wrote:
> > The available channels are currently described by the vendor specific
> > brcm,dma-channel-mask property, while the generic dma-channel-mask
> > property from dma-common.yaml carries exactly the same information.
> > Allow the generic property and mark the vendor one as deprecated,
> > requiring at least one of them, so that device trees can provide both
> > for compatibility with older kernels.
> >
> > The single specifier cell is also not limited to the DREQ number: the
> > driver interprets some of the upper bits as per-channel flags (AXI
> > priorities, wide accesses, burst and write-response handling). Document
> > the meaning of those bits.
> >
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  .../bindings/dma/brcm,bcm2835-dma.yaml        | 26 ++++++++++++++++---
> >  1 file changed, 23 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > index c9b9a5490826..f619e395cf0d 100644
> > --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > @@ -37,15 +37,30 @@ properties:
> >      maxItems: 16
> >
> >    '#dma-cells':
> > -    description: The single cell represents the DREQ number.
> > +    description: |
> > +      The single cell contains the DREQ number in bits 0-4, optionally
> > +      combined with the following per-channel flags:
> > +        bits 16-19: AXI priority
> > +        bits 20-23: AXI panic priority
> > +        bit 24: use wide (128-bit) source reads
> > +        bit 25: use wide (128-bit) destination writes
> > +        bit 27: do not wait for AXI write responses
> > +        bit 28: wait for outstanding writes before signalling completion
> > +        bit 29: do not pause the channel when the debug signal is asserted
> > +        bit 30: use multi-beat bursts
> 
> Add header file for such defination.

Ack, in v4, the header will be include/dt-bindings/dma/brcm,bcm2835-dma.h, used
by both the driver and the device trees.

Thanks,
Andrea

> 
> Frank
> 
> >      const: 1
> >
> > +  dma-channel-mask:
> > +    maxItems: 1
> > +
> >    brcm,dma-channel-mask:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > +    deprecated: true
> >      description:
> >        Bitmask of available DMA channels in ascending order that are
> >        not reserved by firmware and are available to the
> >        kernel. i.e. first channel corresponds to LSB.
> > +      Use the generic dma-channel-mask property instead.
> >
> >  unevaluatedProperties: false
> >
> > @@ -54,7 +69,12 @@ required:
> >    - reg
> >    - interrupts
> >    - "#dma-cells"
> > -  - brcm,dma-channel-mask
> > +
> > +anyOf:
> > +  - required:
> > +      - dma-channel-mask
> > +  - required:
> > +      - brcm,dma-channel-mask
> >
> >  examples:
> >    - |
> > @@ -96,7 +116,7 @@ examples:
> >                          "dma14",
> >                          "dma-shared-all";
> >          #dma-cells = <1>;
> > -        brcm,dma-channel-mask = <0x7f35>;
> > +        dma-channel-mask = <0x7f35>;
> >      };
> >
> >  ...
> > --
> > 2.51.0
> >
