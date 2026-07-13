Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6830C31C56D
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 15:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955522; cv=none; b=ZqTIUPLKHO4UZvGstMBAaN+opR6JeV5oQ7RJJQb3tbjjgtaw2g+UBKyLLmrjrVIh+GigN8xSulnt/j0Q52mqfmunZy7uRpJkZA+cGPXlitcDBAxp0ddnhPKARaSkG/9BjKs8cBmGams4i0vq7ay5xZODBsFDXHQ3vGB7wAs+oxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955522; c=relaxed/simple;
	bh=oQHiC6aeWxIMglMiKwd4SrBEaEq45i/5jhYANduzfu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8SG+/HjSyGhEjsysYFZ7yuXeohRMWvdhifb2yELUaB4jNedYEyyQ9tlk5DLj8l81lQHzn4qNju3oOSacEfvKhLdElKUYLxxNoYAKlSC8ktNvzNb0hYC0fHFEFsVzXd3gBOUEhgYggOVPZaUUHiuVcYXvZYciC9+3YbcY2/0Rik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A8DYmfuM; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A8DYmfuM"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84864086bfeso3325899b3a.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783955520; x=1784560320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/OXZie2Scjfu7LWvUcaxmcID735wVDG7fxoNBIVvm3c=;
        b=A8DYmfuMfi28dNtIoa73x6UBeFAY+8GXSZUNemqpX0edswyvE9xopEaX1+W86PcXf6
         LDdumg0XKSZ/jRVmBH9qNHzIJ7rnF8QWdHw0ZfE6FsfBY9ZuatNt/CVG94yEnm84jHIB
         1xUY+kU8K/wk9+zIoXkY2gcWLAWXW+0fG/MsYThL3dUMADLwMbmd8XtXsGTt1ZG1q55a
         kaIaW+BAqpb2tJRDFqGFtdMLWulQXLbOrRaMd/xH3+7g6Djs3nM3LbBH66OLhLZLEDIi
         fU5+Tj2CwMJO2ofWr+OdmS66n/ZIwp7wBueu2OcinSr2wOXbtjrFCwHXFCtWx1UnAYI8
         nf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955520; x=1784560320;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/OXZie2Scjfu7LWvUcaxmcID735wVDG7fxoNBIVvm3c=;
        b=LEdduxHNiJJkUoNrDctIlEmK+LwUYHpnqxojIwAEzUUNtDZXtiXpPDbhfieQPtwpGh
         rFPAairP0WpV/585ZB1eDyWID4THbjjAsIX2RgG9ytdfhZcqnWy8E+vxVubGJIFwgWMU
         VoZhlLiLwp1iwYj3aZvcO0Bq3g+HmbpIVWAS29n7gjxEsDZiEuLcPLt/MZWkqljyrv9I
         P6RNL0ErywTGD3HJeoSQgFBLMKHbd/WFd0SN8ylrDuqTRk/XerXI2lQ56JGeNFeyFj1c
         PQ00OPjMzdSWL14r5rkwqgjK+9OD21ok59UT6wsjH/9vuH03q6skHBjb5P1w5DgTINKq
         l7Dg==
X-Forwarded-Encrypted: i=1; AHgh+RotgkzfgWs2fN/0esa7WG5FA2lB4vdyliwgmelRvH63ZnsaVknxUzYIZRkCSzk6jHOHqmPwlQiEXqAq@vger.kernel.org
X-Gm-Message-State: AOJu0YyLVOyZXjprt9ZOC7HEYzO2gvOW8E8tEenLxXsDc/RuSbKxuNuv
	H441IVcV82s9aNyDm5/XMaSVjssXRR7KBeTXbNvwIZs5Iznf1dvKgh9EYK14gW2CKdo=
X-Gm-Gg: AfdE7cn7aWueULDLdfSqgXfjO76+krFedZ/9PN+YnhQ5472SlYxxqY5uyWq+FJi69sz
	n7t8sfOPP25H6QAyGnu7fq4MbHrEAb2HZf94huuwLEGOK2EHhjv8qR+AB8exdr14xO4eI+ocAko
	Sv3pwo94Jknm9p/kLltowv0yhe9qsnptmfF5O0UPbbJr693+vDGheF7LnbDq17D8ONyGI7JT1Hk
	CqPgMeS+tM+GIDlwe0dJfQPcJn29NH6RguPeFwkpa3DvSLibGU+j1DnCJpSMza0/bnd1DyUiujS
	HUxYFpwr6/4LKXPRgHCJRwPXRZiwRuULWh71MpaPxYvfrNsT9FOfqohFll7BuzUg/9LQte3wNP1
	uF0WxU2di7I+1/up9FGwBOvaMJJcziu+lPxnCXg00tjoo/C0nJjQydbeM8Y4+5sMctV4fJR/Bhn
	M2o5GiuALc+kvEd3d0
X-Received: by 2002:a05:6a00:4484:b0:848:64fc:510d with SMTP id d2e1a72fcca58-848898722bcmr8370259b3a.45.1783955519627;
        Mon, 13 Jul 2026 08:11:59 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3ead:2a56:27bf:77cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8485413c264sm7384769b3a.61.2026.07.13.08.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:11:58 -0700 (PDT)
Date: Mon, 13 Jul 2026 09:11:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <blevinsk@amd.com>
Cc: Ben Levinsky <ben.levinsky@amd.com>, andersson@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: remoteproc: document AMD
 MicroBlaze/V BRAM-based rproc
Message-ID: <alUAPIZOPmAWJ6u8@p14s>
References: <20260709145712.951146-1-ben.levinsky@amd.com>
 <20260709145712.951146-2-ben.levinsky@amd.com>
 <7740b9fe-2cf8-44e5-8d5a-43391ff177d6@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7740b9fe-2cf8-44e5-8d5a-43391ff177d6@amd.com>

On Fri, Jul 10, 2026 at 07:46:29AM -0700, Ben Levinsky wrote:
> Hi Mathieu 
> 
> Though 2/2 got NAK, will you still review this ? 
> 
> If not I will bump rev and update patch 2/2.

Let me have a look before sending another revision.

> 
> Thank you
> Ben
> 
> On 7/9/26 7:57 AM, Ben Levinsky wrote:
> > Describe an AMD MicroBlaze/V BRAM-based remote processor controlled
> > through the remoteproc framework.
> > 
> > The binding models a soft-core processor subsystem instantiated in AMD
> > programmable logic and using dual-port BRAM for firmware storage and
> > execution. The remoteproc device is represented as a child node whose
> > reg property describes the firmware memory window in the processor-local
> > address space. The parent bus node provides standard devicetree address
> > translation through ranges so Linux can access the same BRAM through the
> > system physical address space.
> > 
> > A clock input feeds the soft-core processor subsystem, and an active-low
> > reset GPIO holds the processor in reset until firmware loading completes.
> > The firmware-name property is optional.
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> > ---
> >  .../bindings/remoteproc/amd,bram-rproc.yaml   | 105 ++++++++++++++++++
> >  1 file changed, 105 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
> > new file mode 100644
> > index 000000000000..c0359f447ea8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
> > @@ -0,0 +1,105 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/remoteproc/amd,bram-rproc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: AMD MicroBlaze/V BRAM-based Remote Processor
> > +
> > +maintainers:
> > +  - Ben Levinsky <ben.levinsky@amd.com>
> > +
> > +description: |
> > +  Soft-core processor subsystem instantiated in AMD programmable logic and
> > +  using dual-port BRAM for firmware storage and execution.
> > +
> > +  Hardware Architecture:
> > +
> > +    Host (PS)                        Programmable Logic (PL)
> > +    =========                        ======================
> > +
> > +    AXI Interface -----------------> AXI BRAM Controller (Host Port)
> > +                                             |
> > +                                             | Port A
> > +                                             v
> > +                                     +-----------------+
> > +                                     |  Dual-Port BRAM |
> > +                                     | (shared memory) |
> > +                                     +-----------------+
> > +                                             ^
> > +                                             | Port B
> > +                                             |
> > +                                     AXI BRAM Controller (Soft-core Port)
> > +                                             ^
> > +                                             | LMB
> > +                                             |
> > +                                     Soft-core CPU (MicroBlaze/V)
> > +
> > +    GPIO --------------------------> Proc Sys Reset ----> CPU Reset Signal
> > +
> > +    Clock -------------------------> Clock Distribution -> CPU Clock
> > +
> > +  Memory Architecture:
> > +
> > +    The dual-port BRAM allows simultaneous access from both processors:
> > +      - Port A: Connected to the host AXI BRAM controller for firmware loading
> > +      - Port B: Connected to the soft-core local memory bus for execution
> > +
> > +  The reg property describes the executable BRAM window in the processor-local
> > +  address space. The parent bus node translates that window to the system
> > +  physical address space by using standard devicetree address translation
> > +  through ranges. A clock input and a reset GPIO control the subsystem.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: xlnx,zynqmp-bram-rproc
> > +      - items:
> > +          - enum:
> > +              - amd,versal2-bram-rproc
> > +              - xlnx,versal-bram-rproc
> > +              - xlnx,versal-net-bram-rproc
> > +          - const: xlnx,zynqmp-bram-rproc
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description:
> > +      Processor-local address and size of the BRAM firmware memory window,
> > +      as seen by the soft-core processor (typically 0x0 for reset vector).
> > +      The parent bus ranges property must translate this window to the
> > +      corresponding system physical address.
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description:
> > +      Clock input for the soft-core processor subsystem.
> > +
> > +  firmware-name:
> > +    maxItems: 1
> > +    description:
> > +      Name of the firmware ELF file to load.
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description:
> > +      GPIO specifier controlling the soft-core reset input.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - reset-gpios
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    remoteproc@0 {
> > +      compatible = "xlnx,zynqmp-bram-rproc";
> > +      reg = <0x0 0x40000>;
> > +      clocks = <&pl_clk>;
> > +      firmware-name = "firmware.elf";
> > +      reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
> > +    };
> > +...
> 
