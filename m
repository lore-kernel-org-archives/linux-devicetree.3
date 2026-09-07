Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AC1448393
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 09:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773089; cv=none; b=CzhaOHc1vET1Dxm7GQdrls6sees+QXKXFo/oU9s37i3Jn4+nCnKZ+UWT7kVYStBbCipvTUsRJBwKEBV2BOnRS1e1EiBBMEk3kz8YbVCzs4RVBoNVydP/qod8iTjDX/O8s0JwWiuBmMJEAQ86Kqrz8KEiopFeOIvbczH8XgFJh1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773089; c=relaxed/simple;
	bh=Esx+dtM0TYwdO57j6xnTXvlu/TzjID1CmstR5RvhL0k=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcUVmp4p1Pg3RWS0QwglvUyHQSMlhMz7tQdmGiXzz2TEJ07k1D1nWLtYdhSHYXGPH5q4IyeNz8luIVlF4Z0cQrnxOD+wFWRVhpkUEQpqKMhTP2Jw+U8urwPUCGhay342JHDqgWlTNaFJBpLo9KTClh3dnNwd3UpYblr5v6KUhjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QyNOXyZx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyNOXyZx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d05d51553so13385245e9.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 02:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788773085; x=1789377885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oRUYERj4W2ZSChyYrd8ZBUDzTcb+VBgjaS3zm4CIBsE=;
        b=QyNOXyZxk/VY3LypHInkRb2EunLm1ieDNALCC4W7lD56GpTbLVPHAeoyeBfqLUwLe+
         de2c0gR5veh/0oXJal6zKnL2U9E+zhykrWILMAKzA3aSAhNOVDIjvs0vsXtjxhy8jOtg
         ozKndcZn2U9yIRZaV2pdkVbxQAYKGyGXBLHmIH5riH1nEQGUG/XjtWBRFYIGUgLCapRu
         Bq3RGYjcbgykIeqTlCxiFewhWFeEvPy4bDnVEV2w38u6tdncMBjjBKEkbSabex7gkbZG
         +jgrreiWu1FnGhy8c8GTVot9Cf+9oxgj4z5R2qsXVD+mf0Qypbkjih6C+IsEuLEKpfaN
         2Jyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773085; x=1789377885;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRUYERj4W2ZSChyYrd8ZBUDzTcb+VBgjaS3zm4CIBsE=;
        b=YbkMm7d1DtXd34vOZ0Jc2KmgUnpJE24FpBHlLBQ49gjyxRqRwdjz2hb9pzQOoJlOL3
         JW/eyWSBl3l4rUr3fPUOCp4Mf0xaPIWh1ndOy8e9Tq/ytO63ugx4KWSdKUyeXGRrZEsW
         ji3hUeq511q/Cpz1ibIRgevm5qkj0zyEzZUciGWLamNFvEGNlzpdKpsumtV0AKGAW43/
         WU6ZHurauLtFF6HI6TNGIryvTbTAlTO/XirWgQACLGb/9BrtjiTGrOZ5+FiX93Hu9Oae
         DoRz6//d2Bg3gpgU779WlR22hG/VRCVw3Wx0k4Z2PuqiB+qRTLktmjiM+Xh+FKBU/USk
         olJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVJzPtZxjoyMj5mFo6c2G/jrpx+0MQBKLhSrQB/beA90XNKz8XuNE1bUb4ws8YBhrGNuAPUPmOI1yq@vger.kernel.org
X-Gm-Message-State: AFuF++kbXAdHCLlsRntL/RSxilwmrEOq5G239YHQatir6wEYeBMjraUl
	fLZefJkwA2wibxTJlhPgVaFuvV07uzfE4dDXTWF6yWONky+tF7UXHZxd
X-Gm-Gg: AYBFou09Xj+eb98I7SXD1wE67hmeTY1vS3upgIR+8Vf9V5gzzGHiWrn+10nE9VFZmab
	lXYYb0eUTd2EKd8MQQ6E3AVN8Bx8+Mvzc7XQPaEut2KB6HMs5CazFA9eRcvZDbH8XRdHYFiISHg
	cNOX3TkUBkDbEIwXqHU6nT32lM6oo+CnW3tRvBv0LfyXpT6wG9WUoCIAbzn+1cXKlhbrX1xsdpg
	vQ3RU2WpZw9FdHoLQrPrK7lDA7xE1h+Vgmbm5syyNXtuf46uTzvNBMUG+TvlekDeWFvThaRxd92
	lQGjjnjMH4k6ivtSC7lObTMy+pYIKmN6oKz8f+afAMFiaryVtjE8syRM5Az6lBkqNLt0YHqzoBN
	wiMcmPjl268uPNjGDXw7n4DlC3whSVFBLKsq4zbY2U3//5hjq1Ng1Im7+RpLyGnVBBv7M/ozmNX
	ZElaW4lYnF19d6eGsXskddky+d9+TAEMj8VIYYBeMU/4DUyj7U7EmvSBR/td/kw8Vi4jwYZBVIL
	qrh2sGcsd72QI/IIYfGg8jqBi+Qv4PyTkJD
X-Received: by 2002:a05:600c:310d:b0:49c:dc14:d681 with SMTP id 5b1f17b1804b1-49cf81e5449mr213057725e9.3.1788773085428;
        Mon, 07 Sep 2026 02:24:45 -0700 (PDT)
Received: from Ansuel-XPS. (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm294849975e9.0.2026.09.07.02.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:24:44 -0700 (PDT)
Message-ID: <6a9e82dc.8fb0a6ce.a0d71.1d0a@mx.google.com>
X-Google-Original-Message-ID: <ap6C2YKs_NPS0pm9@Ansuel-XPS.>
Date: Mon, 7 Sep 2026 11:24:41 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: clock: airoha: Document support for
 AN7583 clock
References: <20260819221458.30040-1-ansuelsmth@gmail.com>
 <20260819221458.30040-2-ansuelsmth@gmail.com>
 <20260827-expert-ruby-grasshopper-954aa2@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-expert-ruby-grasshopper-954aa2@quoll>

On Thu, Aug 27, 2026 at 11:52:13AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Aug 20, 2026 at 12:14:54AM +0200, Christian Marangi wrote:
> > Document support for Airoha AN7583 clock. This is based on the EN7523
> > clock schema with the new requirement of the "airoha,chip-scu".
> > 
> > Add additional binding for additional clock and reset lines.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/clock/airoha,en7523-scu.yaml     | 20 ++++++
> >  include/dt-bindings/clock/en7523-clk.h        |  3 +
> >  .../dt-bindings/reset/airoha,an7583-reset.h   | 65 +++++++++++++++++++
> >  3 files changed, 88 insertions(+)
> >  create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > index eb24a5687639..edecc635807b 100644
> > --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > @@ -30,6 +30,7 @@ properties:
> >    compatible:
> >      items:
> >        - enum:
> > +          - airoha,an7583-scu
> >            - airoha,en7523-scu
> >            - airoha,en7581-scu
> >            - econet,en751221-scu
> > @@ -50,12 +51,30 @@ properties:
> >      description: ID of the controller reset line
> >      const: 1
> >  
> > +  airoha,chip-scu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle to the Chip SCU providing the registers required
> > +      for configuring the PCIe related clocks and resets.
> 
> This is the clock provider. Clock provider should not be accessing
> registers of other device to configure its clocks. Either you
> misrepresented clock hierarchy or devices.
> 
> I did search for DTS to try to understand the big pictuer - nothing, no
> results, no upstream submission to Linux kernel.
>

Hi, you can use en7581 as an example as the implementation is exactly the
same register wise.

The register for clock and reset for normal system and PCIe are scattered
between the "SCU" and "chip SCU" registers (they are 2 different register
block, the name is taken from the programming guide)

- Chip SCU provide register access to some clk gate and clk rate
- SCU provide register for reset, PCIe clock, other clock gate and PHY
  SERDES.

Upcoming and current airoha clock driver all follow this pattern of
declaring one of the 2 register and use a sysconf for the other as the 2
register block are tighlty coupled.

There was a similar phandle in another series adding support for pinctrl
for econet EN7528.

This phandle is not present for en7581 just because it's hidden by a direct
call to the syscon with syscon_regmap_lookup_by_compatible API.

With AN7583 I'm trying to fix this by making it more explicit.

Does this makes the situation more clear? 

-- 
	Ansuel
