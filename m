Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD203377AA2
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138777; cv=none; b=GMSp0I2fBE2UBwHxjXNPWDVzRZBxcV24Ai19zQqazIl6J8hu3uC2qchMNq6KtW1Gdf1KTrfKnOD/q0sB1zUq6j3EEAC2ZJBYLdFFSjunnrpU/gfW1jezLNqhaA+XjViK2Kj3cVFTdCGbD5C00ic4PvmiIRuKChN8hMGHi9/i9+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138777; c=relaxed/simple;
	bh=1u8Y4AyQQ4ig4jZQ0uAt1J3U/PBdgVNxXsWP8C6Rikg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IgROm3K8ohw+tzNKpvgN3VfSnjWFneAJm/ToQHq8tdjZn/lvzVrlAU5fAnbW9EsrbTJzGnIKhvc0Zlq7XNodDs6tPjzVfh+9L102akvbItqu2dhlz2Iv6qLo1wD5pRZOHa9BrQABviXl6CkPAWBULYkZORhIzfC88H8qTxJJSUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=LmMl/OUm; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="LmMl/OUm"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cab973140bso31754085ad.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 00:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1785138775; x=1785743575; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HbSDbVaDmzeDl40IpS/n9zeYRhfzN1ldtzWWLApwZkk=;
        b=LmMl/OUmFYN6IMegYtEfQ/LN5dGfKcG57La96mNtzOBAbT2sLEiSuP1h8I7+F5ZGOR
         nua7VjBY+/VEMtWDkUZB9p7KIIQQkYiOK56DT3Na0ZGnj2DVTO11uXGRR+4Stq6vycGo
         77G1TDcV0o0wXRGr3tcgp7xo9+hHkL9QbNozxFXQ7ktjiOZ8DrxXih3oTMPJ3DWSl/E6
         DvEHdkJW2wj1sRwGyz56usjh5d3LYQc39rM/LP5EaZKs8kwt4unO/3vYPr+R+C3H4koe
         XK8lmhShGJYVQb1T22NaDzPfpu3xwJoo4AHTeCY9H6hVnIc2iBULnJ1+N/T8B+x43DBT
         0mpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138775; x=1785743575;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HbSDbVaDmzeDl40IpS/n9zeYRhfzN1ldtzWWLApwZkk=;
        b=NRIA5AcSE1nbVAsMD+cX0/2T/mOMnbNytUSrHrfPFDuGl5aQeQRJco/rQP7l0RM8ix
         fd9ZDO6nzL4oSU/JyN/sjFXlmZkkkdXUQXlURXJc1HHXqLd8Gb9JjImIROBAbqcKoN9k
         yqAnCoE1qBs4ckHG01C6YtSRGDAcYxSxmC9mG2GMOd0QwObiaHlGbL1wSQTgs7Y44+xr
         lWDhE3T7KcLJIQx34/Cs5fF2UG5sFCA1tKC5IlpgXodRrAZ+sLA+lQK3LA+WBhidblS5
         kqBKr9fF0LsMhKnXnD9gVQqwQj0H4NJbKqYFzkoC+lOvCILYpUtP9Ixro76SvjnIuOyb
         wFcQ==
X-Gm-Message-State: AOJu0YxCVYazEl6wvqQI0yaHZYdRib1Lrryma7qa4agPsjylJ0VTcoA6
	RgkihHO5nbRanGX6/397xUIoky2RwOziZGfQallHwDjx5ky19Nrm8TkKZ3++S7pQBhQ=
X-Gm-Gg: AR+sD13qXJoihyfyjZTpGvNRgE387/NxO1+8Rxo8E4sFCJzTFJL/I9KAwq8oisqxesg
	wqfIQz7R3/+YqtYANlqWUz0GTUOTz9NC8F2mTfFROGpF0iVmnrDqHoOh6o++tvRElGAhqpOIj9L
	SnvEphu91TzwccT/Pz2YVkuef7ZqAR/Q7IhLVxuGlVeRPk8C/tZl94fXBL5aEjgst26IkcoOz/4
	s4b/Edzqh7Q7R2D29Y83GKeniD8W/vwcH060WyLz2xFkP+zlfBHg+lbs7gXCYayO8iCy11pV1AC
	gPR6kUxrVqVrMxJM0PfEETzNLeO7rLpDmvIUWnDMcdHMMgU+50nM6uHWWcx0/+VP+RhH+Trr+kP
	fBYAgStsPTAk3BLcfBjeozaBus98KKIw3cRsFOmLGyor7HsthoEO1ta6LL60j114fix/NtSxT7Z
	6G
X-Received: by 2002:a17:902:fd87:b0:2cc:1452:a014 with SMTP id d9443c01a7336-2cfde7bca17mr68252865ad.18.1785138775086;
        Mon, 27 Jul 2026 00:52:55 -0700 (PDT)
Received: from plin-1878 ([136.226.240.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bc57asm30513145ad.45.2026.07.27.00.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:52:54 -0700 (PDT)
Date: Mon, 27 Jul 2026 15:52:46 +0800
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
Subject: Re: [RFC PATCH 3/3] dt-bindings: sifive: Add WorldGuard Checker
Message-ID: <amcOTrafvWgdT7zL@plin-1878>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
 <20260619105834.1277302-4-peter.lin@sifive.com>
 <20260622-exemplary-navigate-88985b1444f5@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260622-exemplary-navigate-88985b1444f5@spud>

Hi Conor,

On Mon, Jun 22, 2026 at 06:50:28PM +0100, Conor Dooley wrote:
> On Fri, Jun 19, 2026 at 06:58:34PM +0800, Yu-Chien Peter Lin wrote:
> > Add DT binding for SiFive wgChecker2, a hardware firewall enforcing
> > WID-based access control in RISC-V Worlds. Provides checker slots to
> > program per-WID permissions for downstream resources, with optional
> > sub-range partitioning.
> > 
> > Link: https://github.com/riscvarchive/security/blob/main/papers/worldguard%20proposal.pdf
> > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > Reviewed-by: Zong Li <zong.li@sifive.com>
> > Reviewed-by: Jim Shu <jim.shu@sifive.com>
> > ---
> >  .../devicetree/bindings/riscv/worlds.yaml     |   9 +
> >  .../bindings/sifive/sifive,wgchecker2.yaml    | 237 ++++++++++++++++++
> >  2 files changed, 246 insertions(+)
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
> What's sifive specific about this? Wouldn't other vendors also have
> trusted worlds?

The property is intended to identify the trusted WID, i.e. the
trusted agent authorized for programming WorldGuard components
such as wgChecker according to the policy specified in the device
tree (see sifive,partition-rule below).

wgChecker is a proprietary Worlds-aware firewall and is not part of
the RISC-V ISA specification, so the Worlds extension itself does
not define a corresponding concept of a trusted world for this.

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
> > index 000000000000..043c748385ed
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> > @@ -0,0 +1,237 @@
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
> > +    const: sifive,wgchecker2
> 
> Missing device specific compatibles.

We will test on qemu, can I add "qemu,wgchecker2" here?

> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description:
> > +      Base address and size of the wgChecker memory-mapped I/O registers.
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description:
> > +      Interrupt line asserted when a WID access violation is detected and
> > +      interrupt reporting is enabled in the slot configuration (IR or IW
> > +      bits set).
> > +
> > +  '#access-controller-cells':
> > +    const: 7
> > +    description: |
> > +      Specifier for one access-control rule, encoded as seven u32 cells:
> > +        <addr-hi addr-lo size-hi size-lo perm-hi perm-lo config>
> > +
> > +      where:
> > +        - addr-hi, addr-lo: 64-bit base address of the protected region.
> > +        - size-hi, size-lo: 64-bit size of the protected region in bytes.
> 
> These two cells effectively just duplicate the reg property.

Agreed, will drop this region encoding.

> 
> > +        - perm-hi: Permission bitmap for WIDs 16..31. Two bits per WID:
> > +                     bit 2*(WID-16)   = Read  permission
> > +                     bit 2*(WID-16)+1 = Write permission
> > +                   Set bits grant access. Use 0x0 for systems with
> > +                   riscv,nworlds <= 16.
> > +        - perm-lo: Permission bitmap for WIDs 0..15. Two bits per WID:
> > +                     bit 2*WID   = Read  permission
> > +                     bit 2*WID+1 = Write permission
> > +                   Set bits grant access.
> 
> And these two look like a layering violation to me. Why does the
> consumer contain its own configuration information? If firmware provides
> this to s-mode, it is either useless (because firmware has already done
> the configuration) or it makes the access control pointless because
> s-mode is expected to program its own access.

Yes — DT only describes the access rules. The wgChecker slots are programmed
by M-mode firmware (OpenSBI), which holds the trusted WID.

riscv,pmwid = <3>;
sifive,trustedwid = <3>
M-mode  : WID3 (sets mlwid to 0)
S/U-mode: WID0

It's fine for Linux to see the access rule, because WID0 is not the trusted
WID and therefore cannot program the wgChecker configuration registers.
For denied accesses, reads return zero data and writes are ignored.

> With that in mind, the first 4 cells can probably just be transmuted to
> a single cell with platform-specific unique identifiers.

Good point, for memory partition use case, I plan to update the
encoding to:

  ddr: memory@80000000 {
      device_type = "memory";
      reg = <0x0 0x80000000 0x0 0x80000000>;
      access-controllers = <&wgchecker2 0>, // partition ID: 0
                           <&wgchecker2 1>, // partition ID: 1
                           <&wgchecker2 2>; // partition ID: 2
  };
  
  wgchecker2: wgchecker@40000000 {
      compatible = "sifive,wgchecker2";
      reg = <0x0 0x40000000 0x0 0x1000>;
      #access-controller-cells = <1>;
      #address-cells = <2>;
      #size-cells = <2>;
      interrupts = <82 IRQ_TYPE_LEVEL_HIGH>;
      interrupt-parent = <&aplic_m>;
  
      partition@0 {
              reg = <0x0 0x80000000 0x0 0x40000000>;
              sifive,partition-id = <0>;
              /* (perm_hi, perm_lo, config) */
              sifive,partition-rule = <0x0 0x000000cf 0x0f>;
      };
  
      partition@1 {
              reg = <0x0 0xc0000000 0x0 0x01000000>;
              sifive,partition-id = <1>;
              /* (perm_hi, perm_lo, config) */
              sifive,partition-rule = <0x0 0x000000cc 0x0f>;
      };
  
      partition@2 {
              reg = <0x0 0xc1000000 0x0 0x3f000000>;
              sifive,partition-id = <2>;
              /* (perm_hi, perm_lo, config) */
              sifive,partition-rule = <0x0 0x000000cf 0x0f>;
      };
  };

I hope this work for you.

> Surely the ecall involved with actually requesting access needs
> something like that anyway?

In this initial support, there is no such interface for S-mode
to request reconfiguration -- wgCheckers are programmed once at
boot-time.

> 
> The only value I can see in this is if some worlds that a bit of
> software is running on can access a peripheral (or part thereof) and
> others can't? Though platforms like that might benefit more from being
> reworked to have homogeneous access! I've got no idea how a Linux driver
> etc would handle the only some CPUs being permitted to access a register
> region.

One use case is APLIC, which naturally has separate root-domain
and child-domain regions and should be controlled by M-mode and
S-mode respectively. A wgChecker can protect these regions
with different access permissions, for example M-mode-only access
for the root domain and M/S-mode access for the child domain.

The same mechanism can also support multiple supervisor domains
e.g. for a TEE. As shown in third example, a DRAM sub-region may
be carved out exclusively for the TEE.

> 
> > +        - config:  Slot configuration bits:
> > +                     Bit 0 (ER): Report read  violations as bus errors
> > +                     Bit 1 (EW): Report write violations as bus errors
> > +                     Bit 2 (IR): Report read  violations via interrupt
> > +                     Bit 3 (IW): Report write violations via interrupt
> > +                     Bit 4 (L):  Lock bit - prevents further modification
> > +                   Bits 5..31 are reserved and must be zero.
> 
> For the next revision of this, I really would like to see the access
> controller driver.

Sure, the fdt driver will be added to OpenSBI. (Not in the kernel which
runs untrusted WID).

> 
> > +
> > +      Multiple entries may be listed to apply different policies to
> > +      different address ranges, including sub-ranges within a single
> > +      physical resource.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#access-controller-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    // Example 1: Single device protection
> > +    // WID 0 and WID 3 have RW access to UART; errors and IRQs reported.
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
> > +            riscv,isa = "rv64imac";
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
> > +            // WID 0,3 RW; report errors+IRQs
> > +            access-controllers = <&wgchecker0
> > +                                  0x0 0x001c1000 0x0 0x00001000
> > +                                  0x0 0x000000c3 0x0f>;
> > +        };
> > +
> > +        wgchecker0: wgchecker@1c2000 {
> 
> I think this should be access-controller@

Will update.

Thanks,
Peter Lin
