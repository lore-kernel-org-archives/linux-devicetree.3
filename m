Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C82F3AD510
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782474462; cv=none; b=Vz5om2APHULTXyIUOsC8QpdfMusji61i2tRqH9TM+NPmMXAsh3y54TYtaNNl6rcy9k9J1LpOiiM/+Avz+jtbWpfkpJV50T+ktkC5qTQsaT7ZPhrLNdjXEHS5fzQ6LGIRV58fQYpLOfCI6Q47p8mg6NrsQ4us387fv01H4VPcLq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782474462; c=relaxed/simple;
	bh=R8xvfTZKyRhEDkLTWiheYcQXLuR8+3ZzZdaD71GWZ3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJFuVIIPKuv23V88u6K9EyKcZfh7xv0uApXbgBuWCYir+9A4cAvb2/ps4xWRysaudb4NhYfrn7ppZmdAYTQ1F0XHDsB+hHMaszs0xchY4mNX8VR8Xf3J0IsFZYC1KCSglXhqcZC1CzYIySWiK2VtfpVYTIMU4v5SWDU8704S3OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=I1mPfg8V; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="I1mPfg8V"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37d82f3a244so385066a91.2
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 04:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782474460; x=1783079260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dioXPMSt1EARQSLrGqQkhe/4CP6WY1S+tXkvTD0rOSY=;
        b=I1mPfg8VJ1D2xKfhk9ZypPUzUcWIjmiwYApPB+goXSipfLcBZN2ay2rpWpQGsViY7j
         2TbwJ6xSd3ZOaZEyBb8TDkM/FgJFevTgvcW1METaQW2jS9jWGirs4QvVcyQZxX8wYWL5
         U+bMwO9RQCX/JWF0wMJWV1AGg3NICl0fcheRP0Ai4cvvNV98NrB7aXMSR23iz27r1nkS
         snBNMpO14Y8CluhZiR4qqQcPo1XD8B9PHWM8Q2Inf1nmiTjvNk8KbmAR/sMFSBOF+osl
         z+KW2bjWiHYOBOOSBUUFmASn8iiWSKqIxvZB3UIZ+jJY5MCIAzIuYK03t8l1LaH/dPin
         p6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782474460; x=1783079260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dioXPMSt1EARQSLrGqQkhe/4CP6WY1S+tXkvTD0rOSY=;
        b=R3LtR4WD7jS6h313RojuAjZDSkj+hKf7xI76Wp4ExCDSRdWCyqrPbbw0lNTLq9h3M7
         OwqMR5IoADV/5GHfkb8BxTdDGjrfWXHN7kkFoSb93LsK0luVSEslyopo14PWb5+BWiGN
         x/Wg+Cfufq6zLOTTnLP4T4TEat9tEu7y8WsHVwn42/D8NXYWE0CLzy1QTGpVgnoNW3AZ
         UvUtNb+BSPJ4iNjqIa4MYj2K70unE+839byXXiEiSy8/VItZiAIH1oZm8ysTV2sdLjuB
         pgO1OX8/RiHQAAPoTZY55IsMPFL/Go7YxayKjm3ctcVY6vShKQJQMuTOaxOe/J8FDUXk
         79gw==
X-Gm-Message-State: AOJu0Yy9VpMSDnVdV4EmLMyKQNU1zhC1Q3ODwIG9zqNV7zXpRF1ME51w
	FmEAjyeGCIk6BxNSopXFjE1jtxbKVlTdV4YQbiElCxsUVYqBJowjMflXxH+jnnM9sFI=
X-Gm-Gg: AfdE7ckYcY7t5NViSWLtfXcWSgfnA0AV1YGlCC7QY6VKm4AZPUEADfbxVlBLM0R1U/g
	i5PQoeVzC0R0g8OIGEJyyrWnV4SyC3eaFQ0r7I1mYsrimAfYU6WdHNPuFpsPCUOHocORkC8+KAw
	G3N0zDbT9Y5gSMX376rXF7PLcmFAZpm0acDS3DuoPb1WO2kSUK5kpB75Kc7FrzskJiIilgwyW8+
	9+5VL4bJAY34F2/rHnydOOiSJMTwy0exKSj1RMa1lhKXN8wIpxBrmcTxJ3mLz80pD1r2ex6vD6O
	q+wgGkXdSrP7QRwv710WTWQWF7lr0LNWwgmF0u6ngJtxIx6iFSLrX0MgMxWKCRhXmkU40L3kMVB
	e4ETcRZ+Xmr/iQrWaCFUWqyADDRQ+ETVFoWRaI9a6RrYSmPRpqQsjSdxkmer2UNKxu3di29Nfl4
	ztv2YnrPfILNA=
X-Received: by 2002:a17:90b:2788:b0:37d:ee77:78ac with SMTP id 98e67ed59e1d1-37f816aeeeemr169488a91.19.1782474460154;
        Fri, 26 Jun 2026 04:47:40 -0700 (PDT)
Received: from plin-1878 ([136.226.240.191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df3b4bd5bsm3748919a91.13.2026.06.26.04.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 04:47:39 -0700 (PDT)
Date: Fri, 26 Jun 2026 19:47:31 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	dlan@kernel.org, guodong@riscstar.com, dfustini@oss.tenstorrent.com,
	michal.simek@amd.com, junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com, akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn, luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn, nick.hu@sifive.com,
	jim.shu@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com,
	robin.randhawa@sifive.com, scott@riscstar.com,
	dave.patel@riscstar.com, raymond.mao@riscstar.com
Subject: Re: [RFC PATCH 2/3] dt-bindings: riscv: Add Worlds per-hart
 properties
Message-ID: <aj5m00m4KxRAPAnB@plin-1878>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
 <20260619105834.1277302-3-peter.lin@sifive.com>
 <20260622-profanity-herbs-1cc1bcf6206f@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-profanity-herbs-1cc1bcf6206f@spud>

Hi Conor,

On Mon, Jun 22, 2026 at 06:12:47PM +0100, Conor Dooley wrote:
> On Fri, Jun 19, 2026 at 06:58:33PM +0800, Yu-Chien Peter Lin wrote:
> > Add per-hart DT properties for RISC-V Worlds architecture:
> > riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
> > platform-defined values are primarily used by M-mode firmware
> > to configure World ID CSRs and restrict WID usage across
> > privilege levels.
> > 
> > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > ---
> >  .../devicetree/bindings/riscv/cpus.yaml       | 21 +++++
> >  .../devicetree/bindings/riscv/worlds.yaml     | 77 +++++++++++++++++++
> >  2 files changed, 98 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > index 5feeb2203050..4b5778b6d3e7 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -26,6 +26,7 @@ description: |
> >  allOf:
> >    - $ref: /schemas/cpu.yaml#
> >    - $ref: extensions.yaml
> > +  - $ref: worlds.yaml
> >    - if:
> >        not:
> >          properties:
> > @@ -120,11 +121,31 @@ properties:
> >        thead systems where the vector register length is not identical on all harts, or
> >        the vlenb CSR is not available.
> >  
> > +  riscv,pmwid:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Platform-defined M-mode World ID (WID) assigned to this hart.
> > +    minimum: 0
> > +    maximum: 63
> > +
> > +  riscv,pmwidlist:
> > +    $ref: /schemas/types.yaml#/definitions/uint64
> > +    description:
> > +      Platform-defined bitmap of M-mode World IDs (WIDs) that this hart may use.
> 
> I don't understand what the difference is between this property and the
> one before it are.
> Is this one meant to be used by m-mode software to then select one which
> will appear in riscv,pmwid?

pmwid (single value) is the reset default, while pmwidlist (bitmap)
defines the allowed set. The root-of-trust M-mode software may select
an allowed value from the pmwidlist and write it to the mwid CSR.

> 
> > +
> > +  riscv,pmlwidlist:
> > +    $ref: /schemas/types.yaml#/definitions/uint64
> > +    description:
> > +      Platform-defined bitmap of World IDs (WIDs) that S-mode and U-mode may use
> > +      on this hart.
> > +
> >    # RISC-V has multiple properties for cache op block sizes as the sizes
> >    # differ between individual CBO extensions
> >    cache-op-block-size: false
> >    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
> >    timebase-frequency: false
> 
> > +  # RISC-V requires 'riscv,nworlds' in /cpus, so disallow it here
> > +  riscv,nworlds: false
> 
> Isn't this pointless? Nothing ever defines riscv,nworlds as a cpu level
> property so there's no need to disallow it?

Okay, thanks for the catch, will drop this.

Best regards,
Peter Lin

> 
> >  
> >    interrupt-controller:
> >      type: object
> > diff --git a/Documentation/devicetree/bindings/riscv/worlds.yaml b/Documentation/devicetree/bindings/riscv/worlds.yaml
> > new file mode 100644
> > index 000000000000..cc8b3747591e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/worlds.yaml
> > @@ -0,0 +1,77 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/riscv/worlds.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RISC-V Worlds Extension
> > +
> > +maintainers:
> > +  - Yu-Chien Peter Lin <peter.lin@sifive.com>
> > +
> > +description: |
> > +  The RISC-V Worlds ISA extension, as described in the RISC-V Privileged
> > +  Specification, adds World ID tagging for context isolation.
> > +
> > +  This binding describes the system-wide Worlds configuration for the /cpus node
> > +  and is used alongside per-hart Worlds-related properties such as riscv,pmwid in
> > +  the RISC-V CPU binding and Worlds-related ISA extensions enumerated via
> > +  riscv,isa-extensions.
> > +
> > +select:
> > +  properties:
> > +    $nodename:
> > +      pattern: "^cpus$"
> > +
> > +properties:
> > +  riscv,nworlds:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      Number of World IDs (WIDs) supported by the platform. This is a system-wide
> > +      property that describes the total number of isolation contexts available.
> > +      Hardware components such as the WorldGuard Checker use this to determine
> > +      the valid range of WID values.
> > +    minimum: 2
> > +    maximum: 64
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    // Example: System with 4 World IDs
> > +    cpus {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        timebase-frequency = <1000000>;
> > +        riscv,nworlds = <4>;
> > +
> > +        cpu@0 {
> > +            device_type = "cpu";
> > +            reg = <0>;
> > +            compatible = "sifive,bullet0", "riscv";
> > +            riscv,isa-base = "rv64i";
> > +            riscv,isa-extensions = "i", "m", "a", "f", "d", "c";
> > +            riscv,pmwid = <0>;
> > +
> > +            interrupt-controller {
> > +                #interrupt-cells = <1>;
> > +                compatible = "riscv,cpu-intc";
> > +                interrupt-controller;
> > +            };
> > +        };
> > +
> > +        cpu@1 {
> > +            device_type = "cpu";
> > +            reg = <1>;
> > +            compatible = "sifive,bullet0", "riscv";
> > +            riscv,isa-base = "rv64i";
> > +            riscv,isa-extensions = "i", "m", "a", "f", "d", "c";
> > +            riscv,pmwid = <1>;
> > +
> > +            interrupt-controller {
> > +                #interrupt-cells = <1>;
> > +                compatible = "riscv,cpu-intc";
> > +                interrupt-controller;
> > +            };
> > +        };
> > +    };
> > -- 
> > 2.43.7
> > 


