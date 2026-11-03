Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793741898;
	b=SdW9xukCNx0jWdTfAT7v2fL6h0rewf3uPfipIpe3r+NQKHDJ1go/S0Ie4hdz/+UHB2a2
	 g7/lmsAxZ34nNeNKeGbqOfzM1b7os3RCPAh8f7Et2NZYJy25rfsFEQjjezK6qpR4mWsIE
	 x+WliTo/wIiETr1UN9MutPP5Ll1OXoxUzmMCNL069EwU7f6t6cpV9DNWve3G3JQ+0+ICM
	 V2woZlzSMcUkPXiFIa1RlouP8UpKl/c9jVruFXR2DctQjI25XfVV1kLuU0Y84pfpO3c1k
	 hxhPERbgrHkW9LuTiiEHN/JCo/3K0lOAPf096z4rJI6NGGudlXlQc+ARuJoMIyfum/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793741898;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=eh+qRbA3bME5c1pRaWcGmkrqsIv0w4n8JsQ57iK626g=;
	b=Bmccw500cW2dz1LJxoBNUFQnvEiUymXrxeSzYhz7CIVKrtqAMPe1ps7qr9FGATwe6Hjt
	 KdyhKVaRb2K2HmBm6Uug+cOk6q8rm0xj2Fd6SJaT8cS+feiorYve6saB5S+1KpzWr0DBi
	 +y3tvk7a4drEORD722cTXbu+tHMkdyyW2D+Jix+CCQGoyui3OpxM4D2b5mSbnrnEpiYGH
	 0AY1cpz1eC9OENeUW4S5GRNfPbWY7SeI25JIwZTQ2qJpx9Uwh1fqslqLz3JZfh0EBtuzf
	 xwBGk5AzEDFylONhy72SuVi2XR6BmGE7Psx3RDBySOI9umIRPvrijJrk6hajwRDJj+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WqsXTXVi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F0E606A32D
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 21:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WqsXTXVi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ACF81F00A16;
	Tue,  3 Nov 2026 21:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793741897;
	bh=eh+qRbA3bME5c1pRaWcGmkrqsIv0w4n8JsQ57iK626g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WqsXTXViNTQMa1esxLkXmZKYQh60GbH5Vpc58FocGNIpzbKlxVlV+lbThPu42BTik
	 VvjiLOUtGZxey/krutJ6N5PVXvR6/r55+9zqUR8RsgZZOW07WsP0eXMrsxUmoFBZKn
	 m9avJ3O6/DbYBE5tN8iduUYqwTAjOJ1rnPWKYpNmmOPQjfRfAxkB3RUfBToB/YjT+y
	 AY6n4d2Rna5BTnHGfYLMlS9Cfy0MFaCzb9SOtWf9R7mdXUHskjbNn9ppMCtp88R9JT
	 ihzPVSxMhChmLQ16m/krXpummoBj0b5/eQ+hUdJtJz0Sa0YsAv/GQ6rIVKley/gTe1
	 xw+KNHIlruQDQ==
Date: Tue, 3 Nov 2026 15:38:14 -0600
From: Rob Herring <robh@kernel.org>
To: William Zhang <william.zhang@broadcom.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: cpus: Add brcm,bca-smp enable
 method
Message-ID: <20261103213814.GB3951195-robh@kernel.org>
References: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org>
 <20261021-genexis-xg6846-smp-v7-3-rc1-v3-1-7c871f1755db@kernel.org>
 <20261022141541.GA1009304-robh@kernel.org>
 <CAHi4H7FpJJs0FqfCV=7bT26J642JTMgJ860hsDezKRET7q9TeQ@mail.gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHi4H7FpJJs0FqfCV=7bT26J642JTMgJ860hsDezKRET7q9TeQ@mail.gmail.com>

On Fri, Oct 23, 2026 at 09:20:06PM -0700, William Zhang wrote:
> On Thu, Oct 22, 2026 at 7:15 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Oct 21, 2026 at 05:09:52PM +0200, Linus Walleij wrote:
> > > BCMBCA systems booted through CFE can release a secondary CPU by
> > > writing its ARM-state entry address to a 32-bit MMIO mailbox and
> > > sending a wakeup interrupt.
> > >
> > > Document brcm,bca-smp and its single-cell cpu-release-addr property.
> > > The boot CPU does not need a mailbox; secondary CPUs do. Add a
> > > Cortex-A7 example showing both CPU nodes.
> > >
> > > Suggested-by: William Zhang <william.zhang@broadcom.com>
> > > Signed-off-by: Linus Walleij <linusw@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/arm/cpus.yaml | 36 +++++++++++++++++++++++++
> > >  1 file changed, 36 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> > > index 5be89c584026..6771b85f757b 100644
> > > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > > @@ -255,6 +255,7 @@ properties:
> > >            - amlogic,meson8b-smp
> > >            - arm,realview-smp
> > >            - aspeed,ast2600-smp
> > > +          - brcm,bca-smp
> > >            - brcm,bcm11351-cpu-method
> > >            - brcm,bcm23550
> > >            - brcm,bcm2836-smp
> > > @@ -471,6 +472,20 @@ allOf:
> > >      then:
> > >        required:
> > >          - secondary-boot-reg
> > > +  - if:
> > > +      properties:
> > > +        enable-method:
> > > +          const: brcm,bca-smp
> > > +      required:
> > > +        - enable-method
> > > +    then:
> > > +      properties:
> > > +        cpu-release-addr:
> > > +          $ref: /schemas/types.yaml#/definitions/uint32
> > > +          description:
> > > +            Physical address of the 32-bit MMIO mailbox read by CFE after
> > > +            a wakeup interrupt. Required on secondary CPUs. The kernel
> > > +            writes the ARM-state entry address before sending the interrupt.
> >
> > required:
> >   - cpu-release-addr
> >
> > ??? But cpu0 doesn't have an address. Is there really no address or you
> > just omitted because you don't really need it. Should still be there in
> > the latter case IMO.
> >
> > Alternatively, add the enable-method value to the existing section that
> > does this. Also, there might be other cases that are a 32-bit address
> > and need this same constraint.
> >
> Cpu0 does not need release because it is the boot up CPU.

I get that. Is that convention or h/w restriction? I seem to recall the 
arm32 kernel might require cpu0 booting, but I think other arches do 
not. What if you support power gating or hot unplug of CPU0? Then you'd 
need the address.

>  But there
> is no harm to add it to be consistent.

If there is an release address for cpu0, then yes, you should have the 
property. If there is not and you just have to make up something to be 
consistent, then you should not have the property.

Rob
