Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF18B429014
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786441296; cv=none; b=XOVrA+sGOA59wkUXKnPho753W3r9dKjaqNpwqPNeDlFVCdJmlSBubbewJRsDATNmpEqkXWGWQHX6nPB+yUaNCH8anizRJdCA2KySh1Fs7+HT9nM/yJ5l66rMUIjfylXIhTNcPnxXOcmpwMEeAUbSkxe8fvdGddszwo1DepWLUAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786441296; c=relaxed/simple;
	bh=8gTERy3ZC9SNhuNVJ+JX9P5zo7akI/6Sne0QYTTsk4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GpOrKPP1C2r7x2h8CtDlOFyhfAgjxd7Sa+gI2c4T5ZxEhaioAlgX29sxsvsrlw3cBQxHkEw2u0f+XeyQb4U3GlZQ/RFYaciZb7vdEcdFZEkZnPe754YPbVYo0gDRr/6xFMuerV4knT9SegeJrOfGLWmz2q9YUKQVhXoykV8Uvqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=b3Px12R9; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="b3Px12R9"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84e507b079dso1714451b3a.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786441293; x=1787046093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JpC58LrDcTGTf2uV72KqZqamgkq1gihslLDaf+pUTdY=;
        b=b3Px12R93Nod8EGg4JDwi/kzGyxa+u/dnS2dCZojTvvmTFYNSEkKCRjhRF1R64erYp
         JOIKO14r1aKS2yvlC9XR/NPqQKs/LLqgNeTW4y6mWsKrLOtgvvLcsc0KCHi0kHVSfrH4
         QfFa3ZQ5eAsGCNwC/ZRdY+J5aYPKA4Gb9EoKtApKXpZuuks+iZUt2QvIZbfObSJiGVVK
         FPUNtRgORnwOX0MofdvC+JhqzzacV19VLDtA1kXOPyzUm48oVIj1nIuAKkv0K1r1hZeo
         8pI6bsV1WPAl9/6bG+N/z4upLokHYp2cXkwxs3t3Il+rvWjm9YMVFPqXngh8UIxbPH0z
         GnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786441293; x=1787046093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JpC58LrDcTGTf2uV72KqZqamgkq1gihslLDaf+pUTdY=;
        b=J24rtUub+uFUdS4uA19p4pFmMtQljqQp4wvUg+D5Hq8dj3nB46X6D5Qu2+zhRY2I31
         qNEb3k0e9sOnTiJzIqdOxRUuFVInhIBJY/kyN7EPH+hg5XfQUw/zh0zZLBSMjFgpBlga
         D+9prSFLshqaZPKgUxvKunXxP4hxWLbe59ui5PXZxi0rqkDroLkbtDEFs5gyHixMIJOV
         gqwku7A3A2aaF5TMsZDPvZE3eg8uykBCqMnx4t4iKREr468uDNJWxvBsAuZqAtvRR9K5
         OccsV4+kfiSUaKjHLsSXG0YaODiZzbd77kTe0BKQEmBiGtreR/9KrrqynCifM/AZm0GR
         hE2w==
X-Gm-Message-State: AOJu0YwSxZXlgFF93TMO/G1X6cHR4y9xvXe6Ol7sC41xOCavw6wgGw+J
	gv4yYHyrw4cIjv8UqAgi1i/FvZvRo8AzLBZaM0/hHE+Ulgvynh5gd6A7Y5EzpUoy/KA=
X-Gm-Gg: AR+sD10z2hp25vULoV6J4x+gYXbE7OYCt0Qk7I3yvODNS+ZgYxCbJ5AovOQyQ6fD1bW
	+C9YWLL5wlJCm82/PDZw1qSR/3ywR7mwWi5RKXKR3ijuw7mnr+CnOafNWA5ttKRM5atYvQ0DcMz
	/9lPrzeU0EZ8rQr+RvmMOrzZnQ3pfccIbFTZkpoMguIZks6neyAbUYjwqeIvhnzitcGIS2FPVBr
	bGyZpAR0w9scKhy5nUUh/Anphqy/YbIhvx/unuLTHtdV4m5EQ0bCcXExX4R3lQqhyn0Kr6YHZwj
	Am2UZL/wnVOoN8K8lUYJNsbZkhZnkh72lBZZypVN9YGxoGjOXPALUlF85iTZ+/uqXEkiT02bVQH
	B4XhYOdN7SXbWWVjeib20mrX603cfNAZ4wlgNGLtr70nXghWKejfqYuJfrU1cegBRAN6ZnGzI+D
	qcTX9lCzbHrbPWO4ok+StuQhprMhZjfsXdTQn2xy8SCKXAZ0jQl0/ExzwopY8=
X-Received: by 2002:a05:6a00:368f:b0:845:d6a5:716b with SMTP id d2e1a72fcca58-84fa883fb23mr1845215b3a.23.1786441293155;
        Tue, 11 Aug 2026 02:41:33 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbed8bb9569sm637314a12.3.2026.08.11.02.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:41:32 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:41:22 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	dave.patel@riscstar.com, raymond.mao@riscstar.com,
	anup@brainfault.org, pawandeep.oza@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] dt-bindings: sifive: Add WorldGuard Checker
Message-ID: <anruQsO0gGt/Ppws@plin-1878>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-4-peter.lin@sifive.com>
 <20260730-towering-modest-horse-ccbdcc@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-towering-modest-horse-ccbdcc@quoll>

Hi Krzysztof,

On Thu, Jul 30, 2026 at 09:35:02AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 30, 2026 at 12:39:08AM +0800, Yu-Chien Peter Lin wrote:
> > Add YAML binding schema for the SiFive wgChecker, a programmable
> 
> There is no "YAML" binding schema.
> 
> > access controller integrated in the interconnect fabric of RISC-V
> > Worlds-capable SoCs.
> > 
> > wgChecker enforces World ID (WID) based access control on downstream
> > bus transactions. Each checker slot encodes a 2-bit permission field
> > per WID (read/write), enabling fine-grained memory partitioning and
> > device isolation between execution contexts. Violations are reported
> > via bus errors, interrupts, or both, selectable and lockable per slot.
> > 
> > The binding registers wgChecker as an access-controllers provider.
> > Consumers (i.e. its protected device) reference it via the standard
> > access-controllers phandle to declare their access requirements.
> > 
> > Also document the sifive,trustedwid property for the /cpus node,
> > identifying the privileged WID authorized to configure all checkers
> > on the platform.
> > 
> > Link: https://github.com/riscvarchive/security/blob/main/papers/worldguard%20proposal.pdf
> > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > Reviewed-by: Zong Li <zong.li@sifive.com>
> > Reviewed-by: Jim Shu <jim.shu@sifive.com>
> 
> What exactly these reviews pointed out?
> 
> > ---
> >  .../devicetree/bindings/riscv/worlds.yaml     |   9 +
> >  .../bindings/sifive/sifive,wgchecker2.yaml    | 356 ++++++++++++++++++
> >  2 files changed, 365 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/worlds.yaml b/Documentation/devicetree/bindings/riscv/worlds.yaml
> > index cc8b3747591e..c39a06c2dd8d 100644
> > --- a/Documentation/devicetree/bindings/riscv/worlds.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/worlds.yaml
> > @@ -34,6 +34,14 @@ properties:
> >      minimum: 2
> >      maximum: 64
> >  
> > +  sifive,trustedwid:
> 
> No, for the same reasons.
> 
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    maximum: 31
> > +    description: |
> > +      The World ID (WID) designated as the trusted WID for this platform.
> > +      Transactions tagged with this WID are authorized to access and configure
> > +      WorldGuard blocks, including wgCheckers and wgMarkers.
> > +
> >  additionalProperties: true
> >  
> >  examples:
> > @@ -44,6 +52,7 @@ examples:
> >          #size-cells = <0>;
> >          timebase-frequency = <1000000>;
> >          riscv,nworlds = <4>;
> > +        sifive,trustedwid = <3>;
> >  
> >          cpu@0 {
> >              device_type = "cpu";
> > diff --git a/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml b/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> > new file mode 100644
> > index 000000000000..c025a4765cb3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> 
> No, you do not get per vendor directory. NAK.
> 
> Do you see Qcom? Or TI? Or NXP?
> 
> Place it in appropriate directory matching the hardware.

Will fix, thanks.

> 
> 
> > @@ -0,0 +1,356 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (C) 2026 SiFive, Inc.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sifive/sifive,wgchecker2.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SiFive WorldGuard Checker
> > +
> > +maintainers:
> > +  - Yu-Chien Peter Lin <peter.lin@sifive.com>
> > +
> > +description: |
> > +  The RISC-V Worlds ISA extension defines World IDs (WIDs) as architectural
> > +  identifiers that tag each system transaction with its originating context.
> > +  System integrators assign WIDs to execution contexts such as privilege modes,
> > +  trusted execution environments, or other isolation boundaries.
> > +
> > +  The SiFive WorldGuard Checker is a hardware firewall positioned in the
> > +  system interconnect fabric. It inspects every transaction, evaluating the
> > +  WID against access control policies encoded in checker slots for each
> > +  protected resource. Transactions from unauthorized WIDs are blocked and
> > +  reported as bus errors, interrupts, or both.
> > +
> > +  This enables spatial partitioning of memory regions and memory-mapped devices
> > +  across execution contexts. Different address ranges can enforce distinct
> > +  policies, allowing isolated workloads to coexist with hardware-enforced
> > +  protection.
> > +
> > +  The wgChecker acts as an access-controller provider as defined in the
> > +  access-controllers framework. Protected devices are consumers that declare
> > +  their access policy via the access-controllers property. The hardware
> > +  supports up to 32 World IDs.
> > +
> > +  The World ID authorized to configure WorldGuard blocks is specified by the
> > +  sifive,trustedwid property in the /cpus node.
> > +
> > +allOf:
> > +  - $ref: /schemas/access-controllers/access-controllers.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: qemu,wgchecker2
> > +          - const: sifive,wgchecker2
> > +      - const: sifive,wgchecker2
> 
> You need soc specific compatibles.
> 
> I do not believe the two review tags did any actual real review. They
> would tell you to read writing bindings document, wouldn't they?

My bad, will do.

> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description:
> > +      Base address and size of the wgChecker memory-mapped I/O registers.
> 
> Again, standard comment. Why do you need description?

Sure, will drop.

> 
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description:
> > +      Interrupt line asserted when a WID access violation is detected and
> > +      interrupt reporting is enabled in the slot configuration (IR or IW
> > +      bits set).
> > +
> > +  '#access-controller-cells':
> > +    const: 1
> > +    description: |
> > +      Specifies the partition identifier to reference a partition child
> > +      node that defines the access control region, WID permissions, and
> > +      access failure configuration. The special ID 0xFFFFFFFF indicates
> > +      unprotected mode, granting unrestricted access to the device.
> > +
> > +  '#address-cells':
> 
> Use consistent quotes.

Sure.

> 
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^partition@[0-9a-f]+$":
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        maximum: 0xFFFFFFFE
> > +        description:
> > +          Partition identifier. Must be unique within the wgChecker node.
> > +          The value 0xFFFFFFFF is reserved for unprotected mode and must
> > +          not be used.
> > +
> > +      sifive,protected-region:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        description:
> > +          Protected memory region encoded as a base address and size.
> > +        items:
> > +          - description: Upper 32 bits of the base address
> > +          - description: Lower 32 bits of the base address
> > +          - description: Upper 32 bits of the region size
> > +          - description: Lower 32 bits of the region size
> > +
> > +      sifive,slot-permissions:
> > +        $ref: /schemas/types.yaml#/definitions/uint64
> > +        description: |
> > +          64-bit WID permission bitmap. Each WID N uses two consecutive bits:
> > +            - bit[2*N]  : Read  permission for WID N
> > +            - bit[2*N+1]: Write permission for WID N
> > +          Set bits grant access.
> > +
> > +      sifive,slot-config:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        maximum: 0x1F
> > +        description: |
> > +          Access failure configuration flags for this slot:
> > +            bit[0] (ER): report read  violations as bus errors
> > +            bit[1] (EW): report write violations as bus errors
> > +            bit[2] (IR): report read  violations via interrupt
> > +            bit[3] (IW): report write violations via interrupt
> > +            bit[4] (L) : lock this slot against further modification
> > +          Bits[5:31] are reserved and must be zero.
> > +
> > +    required:
> > +      - reg
> > +      - sifive,protected-region
> > +      - sifive,slot-permissions
> > +      - sifive,slot-config
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +  - '#access-controller-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    // Example 1: Peripheral device protection
> > +
> > +    cpus {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        timebase-frequency = <1000000>;
> > +        riscv,nworlds = <4>;
> > +        sifive,trustedwid = <3>;
> > +
> > +        cpu@0 {
> > +            device_type = "cpu";
> > +            reg = <0>;
> > +            compatible = "riscv";
> > +            riscv,isa-base = "rv64i";
> > +            riscv,isa-extensions = "i", "m", "a", "c", "smlwid";
> > +            riscv,pmwid = <3>;
> > +
> > +            cpu_intc0: interrupt-controller {
> > +                #interrupt-cells = <1>;
> > +                compatible = "riscv,cpu-intc";
> > +                interrupt-controller;
> > +            };
> > +        };
> > +    };
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        uart: uart@1c1000 {
> > +            compatible = "ns16550a";
> > +            reg = <0x0 0x001c1000 0x0 0x1000>;
> > +            reg-names = "control";
> > +            interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
> > +            access-controllers = <&wgchecker0 0>;
> > +        };
> 
> None of these are relevant. Drop all of the nodes.
> 
> Please read carefully writing bindings and DTS101 slides before posting
> next version.

Sure, thanks for the tutorial, that's very helpful.

Best regards,
Peter Lin

> 
> Best regards,
> Krzysztof
> 
