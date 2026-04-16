Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769D63B7773;
	Thu, 16 Apr 2026 13:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776344974; cv=none; b=VsYLmDUKIGpDz10sCkl0+/LqUmFC1urpG4Kqcoo4ctDH7Wr4zyX276POI0xhAFKAtQpOvNi3PU0XP4/xLsd5mZE7CQLuPefav2Z9YSkGJIaoSX8cLbkfwJHdUqbtbIEKC9mTMiOBm7DQb6hZ2WaAt51vX+rhiyuco9Ktp2yS6gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776344974; c=relaxed/simple;
	bh=x6vLOatvX0u1D3ES70v+tZ0/zOg4L661uMa6B6zNNIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zn8/Sb0QXoSoF9XTpX5qQM4TkwLX/AJsNHV+glpMwS686TLitPsHizDN89kEpaepG9ywLFE4MZZIPhIa7NKp2EvHmpKtRyFPGhKWLsZmceWDtPjw1gsgn3NMfItSv8GJQ12EN2jYjIo4ZPLRj+kwuNMPdqw5dpl7M19IjNNiK6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rDxBEMI5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rDxBEMI5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A631EC2BCAF;
	Thu, 16 Apr 2026 13:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776344974;
	bh=x6vLOatvX0u1D3ES70v+tZ0/zOg4L661uMa6B6zNNIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rDxBEMI5HVctMffXjyvPkbG3ZasOVS+DrJlXzUxkhz78a18OXopWebUScBIiDPhkx
	 cfUbQTCQHOmb5Zw/NV3B+kf9W6J2fPm+Ct+britbmxx79hxaJ6G0l4ic5Vaw8yS4bG
	 k6F4nCCSSdTE/ika3ZjPUzaYUi4vAhuGApSxvxav2LixAnnjnK4LOjt1EAI/XQv0TI
	 xAHIfIc5cVftOKFkN11HkTSPoGdUbHG+MW4fXFgu1WJQh/mbi6LIy9JAOSo7hztI0z
	 GV9dqh0nHKu4bG7+gPJQsfsufVhn4VCwY/9fCihTwVeEUIVwsUtFzdFzyj1qqVxift
	 wlprlc7JcsJcw==
Date: Thu, 16 Apr 2026 14:09:30 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: interrupt-controller: Add support for
 secure donated SGIs
Message-ID: <20260416-true-prophetic-centipede-3ad8e5@sudeepholla>
References: <20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org>
 <20260412-b4-ffa_ns_sgi_gicv3-v1-1-af61243eb405@kernel.org>
 <20260416121146.GA2736962-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260416121146.GA2736962-robh@kernel.org>

On Thu, Apr 16, 2026 at 07:11:46AM -0500, Rob Herring wrote:
> On Sun, Apr 12, 2026 at 06:04:37PM +0100, Sudeep Holla wrote:
> > In GICv3, SGI security is defined by interrupt grouping and configuration
> > rather than by SGI number alone. Linux conventionally reserves SGIs 0-7
> > for non-secure internal kernel IPIs, while higher SGIs is assumed to be
> > owned/stolen by the Secure world unless explicitly made available.
> > 
> > Document secure donated SGI interrupt specifiers for the GICv3 binding.
> > It describes "arm,secure-donated-ns-sgi-ranges" for SGIs donated by the
> > secure world to non-secure software. It excludes SGIs 0-7, which are
> > already used by the kernel for internal IPI purposes.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> > ---
> >  .../bindings/interrupt-controller/arm,gic-v3.yaml  | 27 +++++++++++++++++++++-
> >  include/dt-bindings/interrupt-controller/arm-gic.h |  1 +
> >  2 files changed, 27 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
> > index bfd30aae682b..664727d071c9 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
> > @@ -45,17 +45,24 @@ description: |
> >  
> >        The 1st cell is the interrupt type; 0 for SPI interrupts, 1 for PPI
> >        interrupts, 2 for interrupts in the Extended SPI range, 3 for the
> > -      Extended PPI range. Other values are reserved for future use.
> > +      Extended PPI range, and 4 for SGI interrupts. Other values are
> > +      reserved for future use.
> >  
> >        The 2nd cell contains the interrupt number for the interrupt type.
> >        SPI interrupts are in the range [0-987]. PPI interrupts are in the
> >        range [0-15]. Extended SPI interrupts are in the range [0-1023].
> >        Extended PPI interrupts are in the range [0-127].
> >  
> > +      SGI interrupts are in the range [8-15] which overlaps with the SGIs
> > +      assigned to/reserved for the secure world but donated to the non
> > +      secure world to use. Refer "arm,secure-donated-ns-sgi-ranges" for
> > +      more details.
> > +
> >        The 3rd cell is the flags, encoded as follows:
> >        bits[3:0] trigger type and level flags.
> >          1 = edge triggered
> >          4 = level triggered
> > +      SGIs are edge triggered and must be described as such.
> >  
> >        The 4th cell is a phandle to a node describing a set of CPUs this
> >        interrupt is affine to. The interrupt must be a PPI, and the node
> > @@ -136,6 +143,24 @@ description: |
> >        - $ref: /schemas/types.yaml#/definitions/uint32
> >        - $ref: /schemas/types.yaml#/definitions/uint64
> >  
> > +  arm,secure-donated-ns-sgi-ranges:
> > +    description:
> > +      A list of pairs <sgi span>, where "sgi" is the first SGI INTID of a
> > +      range donated by the secure side to non-secure software, and "span" is
> > +      the size of that range. Multiple ranges can be provided.
> > +
> > +      SGIs described by interrupt specifiers with type 4 (SGI) must fall
> > +      within one of these ranges. SGIs(0-7) reserved by non-secure world
> > +      for internal IPIs must not be listed here. "sgi" must be in the
> > +      range [8-15], "span" must be in the range [1-8], and the range must
> > +      not extend past SGI 15.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    items:
> 
> As a matrix, you need:
> 
> items:
>   items:
>     - ...
>     - ...
> 
> However, given this is at most 8 entries, I would just do an array:
> 
> minItems: 1
> maxItems: 8
> uniqueItems: true
> items:
>   minimum: 8
>   maximum: 15
>

Makes sense.

> Unless we need more flexibility in GICv5?
>

IIUC, there are not SGIs in GICv5 and we may need to use one software PPI
as a replacement for SGIs. LPIs are used for IPIs.

I am assuming Marc will soon post his opinion/rejection on this series 😉
based on some offline discussion we had with respect to how it fits with
GICv5.

> Is there an example we can stick this property into so it gets tested?
>

Not sure if [1] serves as an example or you are looking for something else.

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20260412-b4-ffa_ns_sgi_gicv3-v1-5-af61243eb405@kernel.org/
