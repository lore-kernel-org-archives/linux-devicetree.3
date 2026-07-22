Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CE63E7172;
	Wed, 22 Jul 2026 19:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784748204; cv=none; b=LoO25psSy2mQsW9Mc1a5912l6WeaKkDM2Pt4hLqEgAxw3crCjnWSlCsagq83VFTGJIa3v1SE9uwdBfPZToPI/m76obMd4gDs4bLkmIb5snIoLppGjoAGp2OFMDAzPEueGeVWWXu882n6lDXsgOhQ1zWmX3ac1FqDMVkPcZpgjng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784748204; c=relaxed/simple;
	bh=JLDTudKnX3vcPHVYkJ3qI/aqOLGAOYqV/Q9oaPnvwFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bE2LZCEUfNyNg2KSNaJv7/9nXZI6d0LJ7XFjRXaG+POhQ4iN8yAKYQzlr0RvOskmLUE+L1ojeIOQ/Kdhp310u/YXn+w8nD9LHrZmtQeUNMSVw1CBnwAtCGvJc4gKBr41oVHBbg942pSSZ4xM5WItEdNoTeH77W0qAJfr6KkI2hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J0D5jVm+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J0D5jVm+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1E51F000E9;
	Wed, 22 Jul 2026 19:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784748196;
	bh=wRTpnI3StPGqyZJ2e0jZs0V9/+NcQ5Wl1MZbsG14ELs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J0D5jVm+tHNuz6NFGXuBn8qO44eV48taDiGsKs/bwbnO268zCboMnZGF/gYe4VRgf
	 dPh3U5pN6tHjmFEBA13VNddWD1/4bXNb3YOEpePgbBi7Pd8SuH/SuDnKey/picM7Mx
	 QhOpKyckYEOh6nCSlDQPGGNg3oBd/Ar6l0k9JS+u8g4C0RcI6Ja6FFqPVYuqTJfcI2
	 HU1bkMa9iMWuJruAgr0Z/LmlqErWcrm6jefHuXNY2DVZ+tsSuRZuOA0bfFPw91cpPG
	 FxHy9Kkp4K4inaTGvGnkRNUeQtw+Axyrpmq4Hk4uvdwpwYF/ky/mpYWsjRJgj32kOw
	 m8SsTQKxts6jQ==
Date: Wed, 22 Jul 2026 14:23:15 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	radhey.shyam.pandey@amd.com, michal.simek@amd.com
Subject: Re: [PATCH] dt-bindings: i3c: dw: Document missing optional core
 reset
Message-ID: <20260722192315.GA1314342-robh@kernel.org>
References: <20260717105829.567522-1-shubhamsanjay.patil@amd.com>
 <f0278842-ceba-4d90-9dc0-4a15a7e7b342@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0278842-ceba-4d90-9dc0-4a15a7e7b342@kernel.org>

On Fri, Jul 17, 2026 at 01:33:15PM +0200, Krzysztof Kozlowski wrote:
> On 17/07/2026 12:58, Shubham Patil wrote:
> > The DesignWare I3C master IP supports a core reset input, but the
> > binding is missing the corresponding reset description.
> > 
> > Document the reset property and name in the binding. Keep the reset
> > optional because the reset line is integration-specific..
> > 
> > Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> > ---
> > Note:
> > The DesignWare I3C driver support was added by
> > 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP").
> > 
> > The original Synopsys DesignWare I3C binding was added by
> > 116e246a8bcd ("dt-binding: i3c: Document Synopsys DesignWare I3C"),
> > but it did not document the optional core reset.
> > ---
> >  .../devicetree/bindings/i3c/snps,dw-i3c-master.yaml         | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > index e803457d3f55..822faf8d221b 100644
> > --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> > @@ -38,6 +38,12 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >  
> > +  resets:
> > +    maxItems: 1
> > +
> > +  reset-names:
> > +    const: core_rst
> 
> Drop the names, pretty redundant, and fix the driver. Sneaking ABI is a
> poor excuse, IMO, to keep discouraged names.

While fixing the driver, the clock names sashiko pointed out can be 
fixed too.

Rob
