Received: from mail-oa2-f1.google.com (mail-oa2-f1.google.com [74.125.231.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8A02222AC
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 07:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783062999; cv=none; b=SB0MJlYKYd0Si6it7CjC80OOwPoBlMzHAKHL4YhalQcw0VXk7BzkjbsK4lWf87VdrFsJk+gY9P/2UfQEsPNX9gdH9wWgHGb9iV1c8l17fEOLajkH1zvvEjyVX/zggdIos82tWpWr9OGcif/Br0fiOXGpcmSBnTyPNRYsGtqijig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783062999; c=relaxed/simple;
	bh=pDWQBNRlaLxTmIvMc3NFXeZsGJx8oiS0avPZ2MjhvNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=nYKJcPOPGehkwUT3TlNoXQwSmmODZq+15QMxksJoERFC9g+eBkSDUX43CVK6KcaMLQqC5xgbKw1Zlpm22wopLan/c/j3ZtyA/tp4QJLNhlmriSjeS5U48bSfv7e7KA10/GkEv9l2kInuSF14hHC80HODp1HKOz2MsDy/yFo0jOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muQpyQfz; arc=none smtp.client-ip=74.125.231.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muQpyQfz"
Received: by mail-oa2-f1.google.com with SMTP id 586e51a60fabf-447489dd9c7so125063fac.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 00:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783062997; x=1783667797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8/To5uu366iTzXiach4JBOKu6hRxUbkL3Sh+ENphnrM=;
        b=muQpyQfz8mSGPrEH/S0/huNlfsruRmRJdrwcpbUf2xFVIiR4ySTY7+mKh5ts4qn6Cc
         rQLNfPovFWDJ3y61uIOxdZLphR54ZyBDHKkaA+6Zg5jmtjySLSRp+C+VXwcy7cH8g3xV
         gDxoMc6PxrQbdcauwENd1PuRJME1+6wd+aWsve/UrUiWNZP3rAReO0EM2AO9oI4/FIBZ
         djBTTEfEAA85EsuFU0P2THGOCKHgFrE4LIyFt9TnZAevy3zCH6sBj/Q8+CfGk5NhPcaN
         UU+DlXuZ46BFMebmkmNywSo1JA8dZHHN9dpz0y2k89wqssltnQjHVps5Vzg0yGb3E9yh
         segg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062997; x=1783667797;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/To5uu366iTzXiach4JBOKu6hRxUbkL3Sh+ENphnrM=;
        b=if7b62MZrG1zON6HmYESlbVZd2zRn7Vy+bby0TT6ivl5+QB/mLHjf+dsY1YCaN3LRE
         cpeEx1Xwgzl4WJP90gojzCbDO7RyLWSDfhWGgwVtUb2NqkgHJ/cLYYZNfh4D+sULj0uj
         dFzdVbeCq2A+dYD15TOdwGf8o9FpJ+lWw5aLaAmO63VcEDYM0ppaYTnuDKkx7D+Mly0b
         0oIorvhIWZOmbRT2nusNkWPUS89hIHL+jaUefq2Jn/o90wDzx4jt4+WT/QX4HTZ3tWDy
         nndwWVgJBvDg0GttFyE4ytzScAcMjVQmpxUS3VBZ9QARSuMLVP0xN4XwptEGelEsvMt0
         TzVQ==
X-Forwarded-Encrypted: i=1; AFNElJ82jSkKtlcjQXdeyRpV/0ZfbDxMx2KsgzrwfkmOJSQS7kM7Uf6IQlZuW+84d9QR1S9hoWxT9neuFPxm@vger.kernel.org
X-Gm-Message-State: AOJu0YwHqPr3fEOhrJTnDvSvn4HVhZ3x7jkMMaOmgqqiwGXMkBwqKA8J
	AfBEHq9mX4+6lW7iRte6ECK+mkMXfqLFNA0vv25I8wy6FVOC9+A+2Y28fdVZekXbrpEx7g==
X-Gm-Gg: AfdE7ckF16W44KqXc3NROeQo7Tg0XDsc7OPObkOpPjwR/cumVgE4wWIXDSzKIIMSEJq
	F8ggKH9tGosifiVgDmcfW2wmF/mPAvnpVD7fDeD53pmutIihCs07H13OZFY3UrC68CNUX7pCzsu
	G/9qPHUb29ZBQBRPk+xIWU/KUHDOaFEQ1smceR/kVv9cd30QNJivp6Jeu1tu3YRhh+rP42CTi3Q
	HWgVMzudyolNLe73OIGvu4BxJpfjfpTsKh7eRzj5gjlbFDU7+2obihCfhhw+z+Fcc2rw1Tt9Ggw
	JGyuVde7vmGbX4euVp3wsy2SIvw0+xwYjeTFzSkO1QxfZPWMcvF3DQiTw7ITlhH9EXSe6O4Oljo
	zoeylgVxJ5WwAgcXi/14MGYP+PG8hPszLCLEZK5LY1q1+sf0PtPZNXaMvVkp5Zz68t2ybUzSHtz
	/BDiIBZN8g9Nz3+/UoUbqsfbJDeQwcUxxhjLccHa6P5PX9pDyOztjHZoiySEr3bbs=
X-Received: by 2002:a05:6870:2187:b0:449:bccd:79fb with SMTP id 586e51a60fabf-44cab961fb9mr6076032fac.24.1783062997063;
        Fri, 03 Jul 2026 00:16:37 -0700 (PDT)
Received: from ubuntu24 (dsl092-249-254.sfo4.dsl.speakeasy.net. [66.92.249.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb54f775sm1162626fac.10.2026.07.03.00.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:16:36 -0700 (PDT)
Date: Fri, 3 Jul 2026 15:16:29 +0800
From: Xing Loong <xing.xl.loong@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jens Wiklander <jenswi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: firmware: add mbedtee,rpc binding
Message-ID: <akdhzUQWPsUS69P5@ubuntu24>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70068ae8-ede1-41d2-899b-98ed11e19953@kernel.org>


On 01/07/2026 16:05, Krzysztof Kozlowski wrote:
> On 01/07/2026 15:25, Xing Loong wrote:
> > Add YAML devicetree binding for the MbedTEE Trusted Execution
> 
> Drop YAML, there is no such thing as YAML binding.

Will drop.

> > Environment driver.
> 
> We don't take bindings for drivers but for hardware or firmware. Please
> describe these instead.

Will rewrite the description to describe what MbedTEE is as
firmware, not the driver or the binding.

> > The binding covers two platform configurations:
> >   - ARM/AArch64 (TrustZone, SMC): two reserved-memory regions
> >     (rpc-t2r-ring and rpc-t2r-shm) plus a GIC SPI edge interrupt
> >     for TEE-to-REE notifications.
> >   - RISC-V (IMSIC): three reserved-memory regions, adding
> >     rpc-r2t-ring for REE-to-TEE command submissions; no interrupts
> >     property (T2R notifications use IMSIC MSI allocated at runtime).
> > 
> > Signed-off-by: Xing Loong <xing.xl.loong@gmail.com>
> > ---
> >  .../bindings/firmware/mbedtee,rpc.yaml        | 221 ++++++++++++++++++
> >  1 file changed, 221 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml b/Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml
> > new file mode 100644
> > index 0000000..08ae255
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml
> > @@ -0,0 +1,221 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/firmware/mbedtee,rpc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MbedTEE Trusted Execution Environment
> > +
> > +maintainers:
> > +  - Xing Loong <xing.xl.loong@gmail.com>
> > +
> > +description: |
> > +  MbedTEE is a Trusted Execution Environment for embedded systems.
> > +  This binding describes the shared-memory regions used for RPC
> 
> Describe firmware, not the binding. It's redundant to say what the
> binding is about, just say what is the hardware.

Will rewrite, removing "driver", "YAML" and "This binding
describes" wording throughout.

> > +  communication between the Linux REE driver and MbedTEE OS.
> > +
> > +  The REE and TEE CPUs sharing the RPC memory must be in a
> > +  hardware-coherent domain (same CPU cluster, coherent caches).
> > +
> > +  Two or three reserved-memory regions are required:
> > +
> > +    rpc-t2r-ring  ring buffer for TEE-to-REE notifications (all platforms)
> > +    rpc-t2r-shm   shared memory for TEE-to-REE RPC payloads (all platforms)
> > +    rpc-r2t-ring  ring buffer for REE-to-TEE command submissions (RISC-V only)
> > +
> > +  On ARM/AArch64 the transport uses SMC calls; TEE-to-REE
> > +  notifications use a GIC SPI edge interrupt.
> > +
> > +  On RISC-V the TEE notifies the REE via IMSIC MSI; the REE submits
> > +  commands via shared-memory rpc-r2t-ring that the TEE polls. No
> > +  REE-to-TEE interrupt is used. No SBI ecall is involved.
> > +
> > +properties:
> > +  $nodename:
> > +    const: mbedtee
> 
> Drop, why would it be relevant?

Will drop.

> > +
> > +  compatible:
> > +    const: mbedtee,rpc
> 
> Feels way too generic. First, Google results on mbedtee are basically
> non-existing, so what sort of company is that?
> 
> Second, rpc is just not specific enough. Please carefully read writing
> bindings doc.

Will rename to "mbedtee,tee". mbedtee is an open-source TEE
project (https://github.com/mbedtee), not a company. Patch 1/3 adds
the corresponding "mbedtee" entry to vendor-prefixes.yaml.

> > +
> > +  interrupts:
> > +    description:
> > +      GIC interrupt used by the TEE to notify the REE of pending RPC
> > +      responses (ARM/AArch64 only). Not present on RISC-V platforms which
> > +      use IMSIC platform MSI interrupts allocated dynamically at runtime.
> 
> Please read writing bindings doc.

Will drop the description.  Will add maxItems: 1 instead.

> > +
> > +  msi-parent:
> > +    maxItems: 1
> > +    description:
> > +      IMSIC MSI controller used by the Linux driver to allocate the
> 
> Again drivers...

Will drop the description.  Will keep only maxItems: 1.

> > +      TEE-to-REE notification interrupt on RISC-V platforms. Not present on
> > +      ARM/AArch64 platforms, which use the interrupts property.
> > +
> > +  memory-region:
> > +    minItems: 2
> > +    maxItems: 3
> > +    description:
> > +      References to reserved-memory regions for REE<->TEE communication.
> > +      Entries must match memory-region-names order.
> 
> Obvious. Please do not come with your own style of bindings.

Will drop the description.  Understood, will follow the standard
style used by existing bindings.

> > +
> > +  memory-region-names:
> > +    minItems: 2
> > +    maxItems: 3
> 
> Why is this flexible?

Will constrain it via the allOf: if/then branches (ARM: fixed at 2,
RISC-V: fixed at 3).

> > +    items:
> > +      enum:
> > +        - rpc-t2r-ring
> 
> rpc is redundant, drop

Will drop the "rpc-" prefix.  Will use t2r-ring, t2r-shm, r2t-ring.

> > +        - rpc-t2r-shm
> > +        - rpc-r2t-ring
> > +
> > +required:
> > +  - compatible
> > +
> > +allOf:
> > +  - if:
> > +      required:
> > +        - interrupts
> > +    then:
> > +      required:
> > +        - interrupts
> > +        - memory-region
> > +        - memory-region-names
> > +      properties:
> > +        msi-parent: false
> > +        memory-region:
> > +          minItems: 2
> > +          maxItems: 2
> > +        memory-region-names:
> > +          items:
> > +            - const: rpc-t2r-ring
> > +            - const: rpc-t2r-shm
> > +    else:
> > +      required:
> > +        - msi-parent
> > +        - memory-region
> > +        - memory-region-names
> 
> So memory-region is always required?

Yes.  Will move memory-region and memory-region-names to the
top-level required: list to make this explicit.  The interrupts and
msi-parent properties will also be made mutually exclusive per
platform (msi-parent: false on ARM, interrupts: false on RISC-V).

> > +      properties:
> > +        memory-region:
> > +          minItems: 3
> > +          maxItems: 3
> > +        memory-region-names:
> > +          items:
> > +            - const: rpc-t2r-ring
> > +            - const: rpc-t2r-shm
> > +            - const: rpc-r2t-ring
> 
> Your top level schema said that. You only need minItems.

Will drop the redundant constraints from the else branch.

> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    /* ARM TrustZone (SMC) */
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    / {
> > +      #address-cells = <2>;
> > +      #size-cells = <2>;
> > +
> > +      gic: interrupt-controller@2f000000 {
> > +        compatible = "arm,gic-v3";
> > +        reg = <0 0x2f000000 0 0x10000>,
> > +              <0 0x2f100000 0 0x200000>;
> > +        interrupt-controller;
> > +        #interrupt-cells = <3>;
> > +      };
> > +
> > +      reserved-memory {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +        ranges;
> > +
> > +        mbedtee_t2r_ring: rpc-t2r-ring@85f10000 {
> > +          reg = <0 0x85f10000 0 0x20000>;
> > +          no-map;
> > +        };
> > +
> > +        mbedtee_t2r_shm: rpc-t2r-shm@85f30000 {
> > +          reg = <0 0x85f30000 0 0x40000>;
> > +          no-map;
> > +        };
> > +      };
> 
> None of the above is relevant, drop.

Will drop all platform infrastructure nodes.  Will follow the
minimal example pattern seen in linaro,optee-tz.yaml.

> > +
> > +      firmware {
> > +        mbedtee {
> > +          compatible = "mbedtee,rpc";
> > +          interrupt-parent = <&gic>;
> > +          interrupts = <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>;
> > +          memory-region = <&mbedtee_t2r_ring>, <&mbedtee_t2r_shm>;
> > +          memory-region-names = "rpc-t2r-ring", "rpc-t2r-shm";
> > +        };
> > +      };
> > +    };
> > +
> 
> Best regards,
> Krzysztof

Thanks for the thorough review.  Will send v3 after incorporating
all of the above.

Best regards,
Xing Loong
