Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D70A45039
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 04:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779856660; cv=none; b=JPT/zGbY2U0oU2Pk1ti5BMG56oLeGXR96dIrsQQqoo5LQ/6OImzyus5yxehFEuQjkgvztq9W70TZVRo+qlQSVo/bUwtI4F5RF9olC54j59VYn+q+8Y74iffn7kOtIVDu4DXhb5jB6t4dwgXUv1PH6auw+jX3Av6URI4nwA3/73g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779856660; c=relaxed/simple;
	bh=Ofz6j4kdsI0OjxffZBIjOCZQ6L9smnC2J8ExqeLz/vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rb0RK3nM1hIN9y5rNn1IJ3sHZGxzeS5oD1HeGteMqP4c7izMlFevfJhfP1cncM4i1xVsMd33yV0q1wJwg2wocFcV55UdR3rnPjCvhx1FfVofbAf2iNimYi1xQSwnjpBSw52tLctTl09HnlsyLP/nv/FBF4BMNuewKbKYtY1Gc/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HuRHcydv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HuRHcydv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CF31F000E9;
	Wed, 27 May 2026 04:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779856658;
	bh=94I3uy159Xi2uviJPaEP/Gc02nuOjrjAABNvfWtdOrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HuRHcydv3VGwebg2FGarjkL8BLTyRNZySOoHttfhdL4maXiWRKbN9trKxRzREe3gN
	 pyy3/1/iFaz2o5oGAf14emQOuxnJ0I6hFtjozl0Mz+wWXDeFvHXnSy/khVWMO/47RO
	 rFy1T8VDanuBRQ6MokhqT3KWm+9nyaU48YIFaLc7piMhjCmZaYVGFgx8d5iMVLMAvu
	 hvQlMbws5SxtCu7r/0t7Th2EBhRWKTNa6UTJM/avtlgg+/FYuQRO5kLhao8N83SBhh
	 iGaVYThWMArC7O5aQ53DmafNJlIX0YlKiByd2LikmdrDHP/UCxifTKcl7xw7hUf/0G
	 uhkAP9kaHnqMg==
Date: Wed, 27 May 2026 12:18:31 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: i3c: dw: Add apb reset
Message-ID: <ahZwl3uXjyOZRvGW@xhacker>
References: <20260525140018.19598-1-jszhang@kernel.org>
 <20260525140018.19598-3-jszhang@kernel.org>
 <f8efa4ae-76e8-4082-a445-ca5f6d230bf3@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f8efa4ae-76e8-4082-a445-ca5f6d230bf3@kernel.org>

On Mon, May 25, 2026 at 05:25:45PM +0200, Krzysztof Kozlowski wrote:
> On 25/05/2026 16:00, Jisheng Zhang wrote:
> > Add dt-binding for support of apb reset which is to reset the APB
> > interface.
> 
> And this is ABI break, so you must explain WHY breaking ABI is worth

This just adds an optional apb reset, it doesn't break any exisiting
ABI. Kindly let me know whether adding new optional binding is also
an ABI break.

> doing that or what is the impact. Additionally you should explain which
> devices have it. Does Altera have it? You really lack explanation WHY
> you are doing it and which hardware you exactly describe.

I'm preparing one of synaptics SoCs support to uptream, it needs this
apb reset signal for i3c. So you mean I delay this series until the SoC
upstream series come, right?

> 
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > index 613dce7757bc..2575442b28ff 100644
> > --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > @@ -38,10 +38,12 @@ properties:
> >    resets:
> >      items:
> >        - description: Reset signal
> > +      - description: APB interface reset signal
> >  
> >    reset-names:
> >      items:
> >        - const: core_rst
> > +      - const: apb_rst
> 
> apb
> 
> >  
> >    interrupts:
> >      maxItems: 1
> 
> 
> Best regards,
> Krzysztof
