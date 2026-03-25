Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401473D1707
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774440255; cv=none; b=Etm3iMXcJBmZHHoUuG43yPdKjUir5QM8fnmZDW9r6FDTr8T3MElWXJNKjSiweF2mTDAYxn0oE51o/mJoSGx9n+A0WxKJ5o/bRrzi3/6Fy57ZnDyPD51tVVFjVhNmPtMCdhq8Oqxoob6xWlUXGniHf5ml9fT8PVvQkmxcG1uSW/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774440255; c=relaxed/simple;
	bh=5SYUb3BbQ7TBlOXQSr0mq1lzSbFyyEnEuic7IaJqgVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gAQJoZVM9dlCdKV9ZMm6D+yZT1kUI8xpCAnIJPQFFT8dpe4BzZoJ6fL2+iUdAm73YdspXZ/3GeZ4L078Zsy6pMjAyQzi1y68EQ5EixXA1SZiNhlIADtbdaqF1pG3ReXxRuzdtWBobs6pufO7xQvUhgThL4GrXMzo8d8lx2v5UF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wdhcdea8; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wdhcdea8"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35c1107d4b7so401027a91.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 05:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774440253; x=1775045053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iiuMY7qjsJ2FyszxcbRHj2zaPzXNgme/X+VTGrgnsxs=;
        b=Wdhcdea8qyOPbMaROSRK5xhNrAcNaY1afcf83u+QZ2gjQ5FxGjH6pZxipuFougqQOT
         DZTAw0D55veCtEgtQxsbeD4lcyojTnCFPg+7m3OnWIHOQI8pD1fxp9egQC36r8FFpOf2
         ej29wtj5EAg/wcMDIjlqZcbmKOuzIu0YO1JBxJvPoeJOwXGK1QzTDqNUeKcg8ohzcg7f
         mvGne8rESiGyks5//d8SFw/Gn5DYbcvWnNkaeNsuwYnY2jxk/I+hPWPrvZNzLEF5dcRd
         FtoMSR71A5gv3684TfToBPJYD0PeVByToYLVqhsAw+WhgPrhCN7Xs4pu/pp+h1/iy0M6
         VOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774440253; x=1775045053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiuMY7qjsJ2FyszxcbRHj2zaPzXNgme/X+VTGrgnsxs=;
        b=IzoEsKe5HnilwyfibSAtcoG68xMgmvd1EDT7oJOMOYhwnZhH/OAex61ktrFLK75s8X
         EZHuEGkzh9xOdd0HmWDUHh9lIE8BUcFd2WjqmIeTw/01BiBACuB+OTn+Lffz+E5z5TKw
         0smJxFq/yrFqePrAuJi9vuhMLWxnygpeiOPx1ODHGFDXFTTKPgF11PAoDvbDMqDbdpyN
         0bu+pe37sEPRefbvyY7NKt1oMyS08upkNYEfvWcRPHyrSDfXluf3F2kA2KmiF2AbKCeK
         wfpPX7GKN45s9FZnBBgEgUMOmLrz0ktK+1Je1Bhm02WRmHg9Smm4idrkifOkMem+v9B4
         ftrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDcK++xAnSIDIDphTRr8rxyDGPKEu8ty+VX75XI8BMToDnxtLiRD6v7gErw4oPIiZjI+f+iXKnydY9@vger.kernel.org
X-Gm-Message-State: AOJu0YwSTTFx9vKKvfIPApEqq53uzoTytiKCEMiC8hD+XGkI/+VXkWrQ
	iXsDBf13jTMQFnjEJvfA+IY/OQAommwhjWzgFvKiJLjV7ZrtEFL+IaOlNyvQyLLFPa8=
X-Gm-Gg: ATEYQzyeESGCWR1YMDxQzYldeSJX3hXTv2b1NgOX+0+SovYTPWn9hDCzoLmAlGTjGy+
	B7vKxlCnZLztHIcSREp3lvKqgzMh3hBa+u+vNjkxbG6Y3oGTYHyJMSUthqIpDPrVx2gyVHdgyO+
	tF98gTuIA54WtwfYdz8v7M4EU307FZVZgGCb5bt9Cn4axGasBEYEFlTDATK2yGQ3jCGCVXz9GNj
	F46vCPqm7UnRoyZ9SfFZ7Dm3vZTjtSjJKd+/2OghhctdwkTlbkkUbGnrCmUWtF0VEa10ePDxcH4
	l0b4kfsOh60YdlENRjls0xa4u5YAJXCLOH1+bLHKudPl15bNU5UpthLeDA0gqTD/eQxhbYv90Wp
	KZBr2jQDZhAeOizO1s5QlRp0+0UMNNvSzma7JTFkZZg3bV96+sYG2ifNEITbKGXFVoOXVltNShb
	FRJYQYyQXmyN+0JXZlDxxtkFaKCcoF2U//6vZ3/ISJIHEd9Qn1VJOg6NI9IW0=
X-Received: by 2002:a17:90b:2b4f:b0:35b:99f8:966d with SMTP id 98e67ed59e1d1-35c0ddc3f25mr2750442a91.24.1774440253469;
        Wed, 25 Mar 2026 05:04:13 -0700 (PDT)
Received: from localhost ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0ea59e43sm765837a91.11.2026.03.25.05.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:04:12 -0700 (PDT)
Date: Wed, 25 Mar 2026 17:34:07 +0530
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sre@kernel.org, robh@kernel.org, krzk+dt@kernel.org, lee@kernel.org, 
	conor+dt@kernel.org, daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, 
	m-chawdhry@ti.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: reset: st: convert to dtschema
Message-ID: <acPMx9NZBehAzkBp@toolbx>
References: <20260324155935.183952-1-krishnagopi487@gmail.com>
 <20260325-speedy-amethyst-beaver-08a3a4@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-speedy-amethyst-beaver-08a3a4@quoll>

On Wed, Mar 25, 2026 at 12:39:36PM +0100, Krzysztof Kozlowski wrote:

> On Tue, Mar 24, 2026 at 09:29:30PM +0530, Gopi Krishna Menon wrote:
> > Convert the STiH4xx reset controller bindings to DT schema.
> > 
> > Suggested-by: Daniel Baluta <daniel.baluta@nxp.com>
> > Suggested-by: Dhruva Gole <d-gole@ti.com>
> 
> Both suggested you to write this patch?
> 
Hi Krzysztof,

Thanks for the review, They helped me to improve the PATCH,

- Dhruva suggested me to change the subject from dt-bindings: power:
  reset: st: convert to dtschema to dt-bindings: reset: st: convert to
  dtschema as that was the general trend followed with similar files.
- Daniel suggested me to use the word 'reset' instead of 'restart' in
  the patch (whereever possible) as that is more accurate here.

That's why I added those Suggested-by tags.

> > Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
> > ---
> > Note:
> > * This patch is part of the GSoC2026 application process for device tree bindings conversions
> > * https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
> > 
> >  .../power/reset/st,stih407-restart.yaml       | 31 +++++++++++++++++++
> >  .../bindings/power/reset/st-reset.txt         | 11 -------
> >  2 files changed, 31 insertions(+), 11 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/power/reset/st,stih407-restart.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/power/reset/st-reset.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/power/reset/st,stih407-restart.yaml b/Documentation/devicetree/bindings/power/reset/st,stih407-restart.yaml
> > new file mode 100644
> > index 000000000000..d7adbc00f5c3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/power/reset/st,stih407-restart.yaml
> > @@ -0,0 +1,31 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/power/reset/st,stih407-restart.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ST SW reset controller
> > +
> > +maintainers:
> > +  - Lee Jones <lee@kernel.org>
> > +
> > +properties:
> > +  compatible:
> > +    const: st,stih407-restart
> > +
> > +  st,syscfg:
> > +    description: phandle of the syscfg node
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +required:
> > +  - compatible
> > +  - st,syscfg
> > +
> > +unevaluatedProperties: false
> 
> additionalProperties instead
> 
Ok will send a V2 for this.
> 
> Best regards,
> Krzysztof
> 
Thanks,
Gopi Krishna Menon
