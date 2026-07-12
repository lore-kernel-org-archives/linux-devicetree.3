Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8F033FE02
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 16:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783873722; cv=pass; b=baHH58aVn8t7Wfyw9q8mKGb5W3eSOoBIYN8/f1HhqiJal30gW/QUaUuE1qjcCZauyjFEpl61q1zqwg2vzzyBROLycVGo3cKmQ/wHR4ssgWdxbnoBlPTus4FU8D6aMH3kY2FxihtucCcBeAP4wZOWqVGvMNMKjtm76dNm/0cuAvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783873722; c=relaxed/simple;
	bh=7i/Rn/dhr3Mgij/9YcNdsjZtxF1/hEU+xQBeMW9Ey4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iXBVn/REXiZNk5ve5xV6VhIfLWZOovYzWS3DyiL2EbdvQBmA4dyridq/ixXOVXUcGlfWhrxltSeQmRkIXKJNwcqY4BasXjuX01QE5ZDAy+5Yl+4kGkB4R00t8W+GtS+JPmXKHOY4vHsh/vGEmPZdj7f1SOKVvkGs8ZKtpxt6tkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWCaehET; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWCaehET"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-698a99b1c37so396483a12.1
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 09:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783873719; cv=none;
        d=google.com; s=arc-20260327;
        b=N2xwu5afj92DplVRZpIxbNc1L0vcty0iWpo6L9iANY8XUdBV9IrcZ9tWj134EzBwuz
         UBgXi3yuLrP4YApxl/dzLWA7rRJIzj6ptx+QF7euNNeLi9aUneUiAWMvRgboKl0t6ngh
         ssEY1Il9S4Jgofp5hPIyuu+666ctSYQyN4H2Xz41coo3fDDpum06gK/Oldzb8RBhtH8L
         03ckZDMFSukcrTEhLBBFsjzWaqgrmHxIWWN32zhVFcRzJnDUzS0xIypipSZj3lx+dgxu
         9kT2/XMuM0ETTtNMyIRaAdRmSN277BuWvaXeKQ9+Zf6lDGPfgQCK1vNJyduLjkhKD4rb
         8sTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EgoCmnmVbjw1BMhsQWXcWZO4KmCIzPKcvkDJCNUSpVo=;
        fh=neebcQkZAFzn+fy5lStoDOGgSXKvSTMX+lqIkpUY/nw=;
        b=T0WFdyJ3abkpHmDBngxqv1S4QxQnuPKv+Rw9zEB0zLCqVLMysldSbrHIciBBXEZiKP
         ipKUsImiIC6ipQ8WAAVxhIpVLrKxdmHinS6mphCPvQ7MbATql+d5jlz4/GVR+fMljN/J
         WjvvAuN7iI6zUsnJLUM4H+u+BbsjOgJboot7eMfufPrpHc9bJd964JX9yE2vwrW9VLaE
         mhWKOb7rYFi6BBykif6tFzxv7vhTYX1sksD17zVEWhEaAHdcaSQhBIR3UY4XE9wyqvU6
         yJbRZOW4sh9CnFCs9/toC5NS3DDxXnxUqdUz9IbnIN2Aj1SuEwbkKyb8ah/AC/UaQdsc
         7dTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783873719; x=1784478519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EgoCmnmVbjw1BMhsQWXcWZO4KmCIzPKcvkDJCNUSpVo=;
        b=EWCaehETWOhBYSMyVmYlgtmQieLg8Njn6+a8HC45RtqSsrQfRK/NikjK3uSjYQpAG+
         qVMPTupjtmRU/oaA3rktNhK+cTRzNAYz6oeBvjQINndnajS6/OJMA8c3RcidN9qXuFzO
         wZa0saRIfDU4z8RitCmQs9WUQ/rMzc3lOARagWq4NdxJVASVQgY/H7VKrTe97gshaMj9
         2YPN8slsVXce+gbAMGzdGUtrLkoJR85JMwcCdRwRZH/23j5a97KfVMxUdyx1lJjKZ/YC
         nXMXpHmj/0/hU0ldBGOHydgQ5aC9EyXfd1ch6mlMBpKkSbw3rbiMZ+lRyKZkoUVWxqTG
         SQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783873719; x=1784478519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EgoCmnmVbjw1BMhsQWXcWZO4KmCIzPKcvkDJCNUSpVo=;
        b=e+le4OZ/DUY/ReH5qsaaM/05bmPuRM+8jWoEuH9z0a8hXuvn79f6MYK8FxhUJcXn/0
         tYNBFWzW9onxPV4ani0swbNe+IznEE0EwbQjNHRsQf/l8j1Z9/4lufYO/oVoFo6Y2Bb4
         L7OtSKL/Hkt3e8X4xMNNuU1jTympRlTJvy3wgPXBKJg0n603fWPlnuqFHVStH2XA6tNG
         IP51nD72P0G56V6cvMoS6r3vK+CpdB9Yvr93xyiG2Y4d8ZzcGMIZt4hHqDPVF1TN5xQi
         gCLZH7KVFyfCJvKlf1xt44pu5Jge0rPsu68BnSienqNSS3ea41puW9/sh1h9XCG7nZDm
         0dHg==
X-Forwarded-Encrypted: i=1; AHgh+RobhoKqh0/tltrC36pW5XHJmc46nSKYa/L1cihdcg53Nc48J6BFFNyLRa8B7q89sWTWnKQaR4Amoa35@vger.kernel.org
X-Gm-Message-State: AOJu0YzzADoYtdwK5dmIHxrGwvshGZ6JOtFsWFvhiSwAV8JPL6ZeIG9I
	7pLiXeL9DS+i8m3xsDuMqpbt9m146w+13q4f4CsPD2qoy3+Xjp8ZfB1/LiE7toO1kwVDzXYm5/B
	S3DvpmtaqtC5eJkHPoeG5KAseDVzerRM=
X-Gm-Gg: AfdE7cnY2pdhjR2fSnj/KCLK1ipq+xKd9HPKrzNqlALozGKjxhwFa8JXoYS+iP0BKv0
	oKmxOfjP83QliyaC//z2tocozhkJgmkcsQo9c5mokNZ95fP1X+0HHOcKAOr0zQh7UdMVjmJDdmc
	qvsgYLVtCCrS7HwE1fqxhUzSTpXIWr8fn1pdBMOPX6N//DzQuI3NdksXAX5Zbjuu6QApDLRc/i2
	7+RDMcGfsTtlzY/xIolDpDJKHVPck7RT7HrFrkit1da/vLu1fbW8+nVOPjkhnvDd97ia68aK3sW
	jwWittdsnqI4vcUOhz2oqfa6+60UvoU=
X-Received: by 2002:a05:6402:2554:b0:697:f628:e20e with SMTP id
 4fb4d7f45d1cf-69c5f0fb24emr1619159a12.4.1783873719294; Sun, 12 Jul 2026
 09:28:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-ti-dma-crossbar-v2-1-2ac0d6efde36@gmail.com> <20260712-dainty-condor-of-luxury-bacfa4@quoll>
In-Reply-To: <20260712-dainty-condor-of-luxury-bacfa4@quoll>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 12 Jul 2026 21:58:25 +0530
X-Gm-Features: AUfX_mwMgDvCB9nBCCsjpCryDFHPIKYbDGQ8Zy_zFoLA_FiJjkw_3uJlAmv6NuU
Message-ID: <CAOWyW_79oQB0L=3MtCnRuLst3=5ATJj=wpSS_550skTswUE2LQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: dma: ti,dma-crossbar: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
	simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jul 12, 2026 at 6:22=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Jul 08, 2026 at 10:02:18PM +0530, Bhargav Joshi wrote:
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,dra7-dma-crossbar
> > +      - ti,am335x-edma-crossbar
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#dma-cells":
> > +    minimum: 1
> > +    maximum: 3
>
> That's rather:
>   enum: [1, 3]
>
> right?
value 2 is required by DRA7 enhanced DMA crossbar (edma_xbar), and it is
used in dra7-l4.dtsi so i think we can keep it unless you specifically
prefer enum: [1, 2, 3]

>
> > +
> > +  dma-requests:
> > +    minimum: 1
> > +    maximum: 256
> > +
> > +  dma-masters:
> > +    maxItems: 1
> > +
> > +  ti,dma-safe-map:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Safe routing value for unused request lines
> > +
> > +  ti,reserved-dma-request-ranges:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    description:
> > +      DMA request ranges which should not be used when mapping xbar in=
put to
> > +      DMA request, they are either allocated to be used by for example=
 the DSP
> > +      or they are used as memcpy channels in eDMA.
> > +    items:
> > +      items:
> > +        - description: starting DMA request line number
> > +        - description: number of consecutive lines to reserve
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#dma-cells"
> > +  - dma-requests
> > +  - dma-masters
> > +
> > +allOf:
> > +  - $ref: dma-router.yaml#
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: ti,am335x-edma-crossbar
> > +    then:
> > +      properties:
> > +        "#dma-cells":
> > +          const: 3
>
> else:
>   properties:
>     dma-cels:
>       const: 1
Yes but this should be rather,
else:
  properties:
    '#dma-cells':
        enum: [1, 2]
as dra7 doesn't use value 3 but uses 1 and 2, I will add it in next version
>
>       Best regards,
>       Krzysztof
>

Best Regards,
Bhargav
