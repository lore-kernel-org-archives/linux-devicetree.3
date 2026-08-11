Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F35E42E8FC
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786442376; cv=none; b=G7xjyM7Yg4IwgjTPBRS71Udf1TEYJlTlJexbcEEWy8wyvQ28zqD9lie+r/fMmfrTYi1KRB3FA7dx86prU5bDD2V3AZckZ9u12RZDLrcn4lCL4HF9Cs12XP0+y+rL+Ne520ztUYnuUzJ/DvIn8Sv1JkzxcB9qar9cR/VOE6WDYp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786442376; c=relaxed/simple;
	bh=vWrkDQU3lEu3IPNJfagdQBDh/fpnbMzMn7LStKYkWqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SL/bkqHufihdLR7tQbi0pbyc+FSAOIQx5EZtFD82M3nJ5AFDD5q7kE5DR+b2YkXWnE/q+7Q99Y8pspFhawwSTDR4fW5rTYKXH1B+75mQUWayHhP9FEsNHjHQcL/eZR577iK4D2YpeNDx1mRqDY+uy0OewL251xtd0vETBLxODcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=YtMbgiay; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YtMbgiay"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ceb096e675so31842145ad.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786442374; x=1787047174; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2CES8RXugLAnF2pHLkpGhNtXnAeSlp9QbBFcsaosuXs=;
        b=YtMbgiay26bZ/ZCbS0C6e5L0hXl2GMNVvJl+jyMjfld3NHfqXtnEJ6YkZtfsW90Vt2
         djsZc1QEcCWh4F6vqfztRrh7+RKXQLacU8ttTwBim6tkAnfPWU1w45oRE1S6teroQDNU
         nc9yzxWGTK5xq1XdNwFgPN2KQqN+oPFe+j8D6cYmTFE3gZB2C6qAIclOq9xpfL9owxqJ
         1aI0Y2shx0tmIP+xrHPt0kujobmrJARDms/4MuZZHnooV1rolzZPbBKOQ3imSb+RnvdP
         vO/qt+TSNr+mpI0lDyhXD5Cg4ShQUMlQlhYmZvr3kZSnFMXvLzBWASqxBIdI0QCHjk8J
         YeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786442374; x=1787047174;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2CES8RXugLAnF2pHLkpGhNtXnAeSlp9QbBFcsaosuXs=;
        b=VKo6wqyzYkwziOqmeB/ZhxWQp0po6X/7EzLK2sxvoGUZ/6A+1FcARQXhkseACNTV5G
         2YJeOinDgs48LK5H5vYFlLtU1MQkThVbPuDJOnQhVJ2zBgJp4sv+7Ryc9Haue58fyHCg
         ZJ52pAEY37CXDTmvckqfIYwgxfNP3Q7t8rwNkzK/bP5PWqI/2n0E+AqY9ecv7AzOBsUq
         0qWwTb+2ByNhieDIzd/jzuxPkesNHFyK51n74+gnKY2LQkvC9YeNB1a7rh3MxppvFtu8
         O2jT4bZApPcNzoFfdMD9+yy8Ek2mfhm+PbptycpRE9uZXYcz4Y3ftsBAefJJJeXOWWLC
         2niA==
X-Forwarded-Encrypted: i=1; AHgh+Rrs4/zuQ+Pk5CsngQ4rVbOzorMolzNXcDUQ9OXKwOItR3mpcoNYOgO8SceT6rgOUBe4EHsb/Lsdbw1i@vger.kernel.org
X-Gm-Message-State: AOJu0YzJRDfrGIk2WaFgcNwzq8D8W1JA+AAQoh2WjzAnsv4OA8WqGxht
	37AI6Wf27hVdW9P0uIK5WKbOAtej/+vWrnwiAc8iV327JQv/6ro2KXGYyWfy9ARaJ00=
X-Gm-Gg: AR+sD115dM8H1JVZXPRL63Vz9sMbEV0GI7KxUEnKExO4nt2TeMwZTjaMHB249+L+KTI
	SwVeSKn2Tk4pQsoyxRnNxT0CrwGze1Sygg2m6WvV39iR8PjNYd+d5Gh6kEiRImbeilyxiAZ62gI
	vcLet2Mv+RqzbFeEWmVipRuUDX5v3EEiS84vLiZJ0ZV0u7t84kFxcxljuEho6oTEGLjgoss1SLw
	Xav5TpOSZL858J5WvOo9x2kZ9SNzuJCKLorWpPAgQpqFUL0YjWm8FjI5VWFgj3ydlOvqBbxueC6
	1VOeZzdDMEyQE2YOF059aLVY9MZqaH/j2xIFk4UmEK+YE5h2YrDz1QQsR1KuOJbN4mUewL07oWM
	qtH3UTjfOWTlqRqTy7//3q7LvzeYfjPIB9usUnz8v55oLXq6Z9awP3fNWGzyBRp9lAcRbm3aVOz
	iUP+1w6LYdyBqdFqj9ZIwbsm9yL2JRU3ECQULUOz7DXTUDV6+J5ihy6y1rycjqkdqDCtFrUw==
X-Received: by 2002:a17:903:2288:b0:2ce:93a3:c16c with SMTP id d9443c01a7336-2d31788ea09mr22405295ad.12.1786442373625;
        Tue, 11 Aug 2026 02:59:33 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d31621a0dasm4892725ad.69.2026.08.11.02.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:59:33 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:59:22 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, samuel.holland@sifive.com, dlan@kernel.org,
	guodong@riscstar.com, dfustini@oss.tenstorrent.com,
	michal.simek@amd.com, junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com, akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn, luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn, nick.hu@sifive.com,
	jim.shu@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com,
	robin.randhawa@sifive.com, scott@riscstar.com,
	dave.patel@riscstar.com, raymond.mao@riscstar.com,
	anup@brainfault.org, pawandeep.oza@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] dt-bindings: sifive: Add WorldGuard Checker
Message-ID: <anryepIiqKAbJTZJ@plin-1878>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-4-peter.lin@sifive.com>
 <20260730-towering-modest-horse-ccbdcc@quoll>
 <20260730-component-wake-80840a196f8d@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730-component-wake-80840a196f8d@spud>

Hi Conor and Krzysztof,

On Thu, Jul 30, 2026 at 06:36:27PM +0100, Conor Dooley wrote:
> On Thu, Jul 30, 2026 at 09:35:02AM +0200, Krzysztof Kozlowski wrote:
> > On Thu, Jul 30, 2026 at 12:39:08AM +0800, Yu-Chien Peter Lin wrote:
> > > Add YAML binding schema for the SiFive wgChecker, a programmable
> > 
> > There is no "YAML" binding schema.
> > 
> > > access controller integrated in the interconnect fabric of RISC-V
> > > Worlds-capable SoCs.
> > > 
> > > wgChecker enforces World ID (WID) based access control on downstream
> > > bus transactions. Each checker slot encodes a 2-bit permission field
> > > per WID (read/write), enabling fine-grained memory partitioning and
> > > device isolation between execution contexts. Violations are reported
> > > via bus errors, interrupts, or both, selectable and lockable per slot.
> > > 
> > > The binding registers wgChecker as an access-controllers provider.
> > > Consumers (i.e. its protected device) reference it via the standard
> > > access-controllers phandle to declare their access requirements.
> > > 
> > > Also document the sifive,trustedwid property for the /cpus node,
> > > identifying the privileged WID authorized to configure all checkers
> > > on the platform.
> > > 
> > > Link: https://github.com/riscvarchive/security/blob/main/papers/worldguard%20proposal.pdf
> > > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > > Reviewed-by: Zong Li <zong.li@sifive.com>
> > > Reviewed-by: Jim Shu <jim.shu@sifive.com>
> > 
> > What exactly these reviews pointed out?
> > 
> > > ---
> > >  .../devicetree/bindings/riscv/worlds.yaml     |   9 +
> > >  .../bindings/sifive/sifive,wgchecker2.yaml    | 356 ++++++++++++++++++
> > >  2 files changed, 365 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/riscv/worlds.yaml b/Documentation/devicetree/bindings/riscv/worlds.yaml
> > > index cc8b3747591e..c39a06c2dd8d 100644
> > > --- a/Documentation/devicetree/bindings/riscv/worlds.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/worlds.yaml
> > > @@ -34,6 +34,14 @@ properties:
> > >      minimum: 2
> > >      maximum: 64
> > >  
> > > +  sifive,trustedwid:
> > 
> > No, for the same reasons.
> 
> I am not entirely sure that this is defined by the platform compatible,
> if you've got something like a FPGA with lots of configurability then it
> may be needed. Then again, yeah maybe it can just come from the platform
> compatible unlike a device shows up that actually needs it.
> This is especially true if the consumer of the property is the SBI
> firmware.
> 
> (that's assuming "same reason" follows on from your comment on the
> prior binding)

After refactoring the OpenSBI support for the Worlds ISA and wgChecker,
I plan to remove riscv,nworlds and sifive,trustedwid in v3.

The riscv,nworlds property is used only to validate the WID range. This
validation can be performed using the riscv,pmwid, riscv,pmwidlist, and
riscv,pmlwidlist properties, making riscv,nworlds unnecessary.

For sifive,trustedwid, a hart attempting to access wgChecker can probe
non-zero value from an MMIO register to verify whether it is trusted,
this property may also be unnecessary.

Although some downstream drivers currently require sifive,trustedwid,
those drivers are not public yet. Therefore, let’s drop both system-level
properties for now.

> 
> > 
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    maximum: 31
> > > +    description: |
> > > +      The World ID (WID) designated as the trusted WID for this platform.
> > > +      Transactions tagged with this WID are authorized to access and configure
> > > +      WorldGuard blocks, including wgCheckers and wgMarkers.
> > > +
> > >  additionalProperties: true
> > >  
> > >  examples:
> > > @@ -44,6 +52,7 @@ examples:
> > >          #size-cells = <0>;
> > >          timebase-frequency = <1000000>;
> > >          riscv,nworlds = <4>;
> > > +        sifive,trustedwid = <3>;
> > >  
> > >          cpu@0 {
> > >              device_type = "cpu";
> > > diff --git a/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml b/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> > > new file mode 100644
> > > index 000000000000..c025a4765cb3
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> > 
> > No, you do not get per vendor directory. NAK.
> > 
> > Do you see Qcom? Or TI? Or NXP?
> > 
> > Place it in appropriate directory matching the hardware.
> 
> Which would be access-controllers.

Thanks for pointing me to the appropriate directory.

> 
> > 
> > 
> > > @@ -0,0 +1,356 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +# Copyright (C) 2026 SiFive, Inc.
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/sifive/sifive,wgchecker2.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: SiFive WorldGuard Checker
> > > +
> > > +maintainers:
> > > +  - Yu-Chien Peter Lin <peter.lin@sifive.com>
> > > +
> > > +description: |
> > > +  The RISC-V Worlds ISA extension defines World IDs (WIDs) as architectural
> > > +  identifiers that tag each system transaction with its originating context.
> > > +  System integrators assign WIDs to execution contexts such as privilege modes,
> > > +  trusted execution environments, or other isolation boundaries.
> > > +
> > > +  The SiFive WorldGuard Checker is a hardware firewall positioned in the
> > > +  system interconnect fabric. It inspects every transaction, evaluating the
> > > +  WID against access control policies encoded in checker slots for each
> > > +  protected resource. Transactions from unauthorized WIDs are blocked and
> > > +  reported as bus errors, interrupts, or both.
> > > +
> > > +  This enables spatial partitioning of memory regions and memory-mapped devices
> > > +  across execution contexts. Different address ranges can enforce distinct
> > > +  policies, allowing isolated workloads to coexist with hardware-enforced
> > > +  protection.
> > > +
> > > +  The wgChecker acts as an access-controller provider as defined in the
> > > +  access-controllers framework. Protected devices are consumers that declare
> > > +  their access policy via the access-controllers property. The hardware
> > > +  supports up to 32 World IDs.
> > > +
> > > +  The World ID authorized to configure WorldGuard blocks is specified by the
> > > +  sifive,trustedwid property in the /cpus node.
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/access-controllers/access-controllers.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - items:
> > > +          - const: qemu,wgchecker2
> > > +          - const: sifive,wgchecker2
> > > +      - const: sifive,wgchecker2
> > 
> > You need soc specific compatibles.
> > 
> > I do not believe the two review tags did any actual real review. They
> > would tell you to read writing bindings document, wouldn't they?
> 
> I did okay the qemu compatible FWIW, the standalone sifive one though I
> did not.

Sure, will fix.

Best regards,
Peter Lin

> 


