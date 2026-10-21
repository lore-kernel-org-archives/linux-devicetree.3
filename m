Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588111;
	b=HFuyDCBkA/IF0cBhEDD8XZpMoNQtWC4QPitxIvnQ7d0t/hWZ7j6u6Td4jMmiunX340NA
	 l1NOB1Rt4C0sawa14XBNeRFgfyAX9tcqTkolthurNbWxPw8pEfmZlbXtR0nLqsGCJVKvt
	 zHZYeCDjnDHoHun6xoo82X4pu0DLwGqs8zODmxext9+JpzyIvegom5ZQcQOFLEyPoObel
	 pgHoStKcWmmKbEhvG/nX82cYnkaFKUOw5ZbTa/ZkHRGa2eVTaSBfhfK1HPTpFvUCcquBx
	 tgyBljfpFeDcwWOdAeVP7s53p5AMhJF0M6Xeyw84YNTkPZnVaBq0Z3EKncnuEGum2qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588111;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4KUfIu4L4+E6H6oX3nMsk4mKP5oeak4eumfpt3iUsvY=;
	b=EICpppf0SVmZd/e77JvUyK9/aeNWyFheOugQ7DcYb6rMMx0PzeWkMupetHONZjalZ5e+
	 Scf2cPKu36jWbLzOCpE8PvCsdnqDXYQCzIvOODj/NWrs+Sjcrno7qLDYDlBjbWhJzH2aV
	 oqrf/BOvKp1XUnwEmRkKlmL8Lb3YuFw8svlvkMGZ+GHih/OK0XEqyR6OXCAZmZ0X+HtfR
	 M7vIwOuJwmeeX10fj+fmgCNeTGpREtelK9NN8bjSx9pY2vQhKo0k0oZIAEv7NNJTxPBq6
	 q71fJ6x2f4q3ULbjJVCFxc1b5lSisiryb8Em9CLGaZ1H742UM2ZeK7MqAbzsKyna9fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D0zJYRpJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0C9606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D0zJYRpJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB751F000C4;
	Wed, 21 Oct 2026 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792588110;
	bh=4KUfIu4L4+E6H6oX3nMsk4mKP5oeak4eumfpt3iUsvY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D0zJYRpJZdWvXtHTm0Z0mc81xWlU8x6j7UkOolqVqQvviA0HgqPWW7J2jwokK3iUo
	 kHZ86ihs4rGHmTqucEAid5yW4K+xLcRo+sWWu+n7zVTsTzGTc52v4XwLVgeZgWgRpd
	 3d8d+Va9xOGnRQ9cwD+11fHcB8D8D47U8yL/SMQ28Y+Yt3GPPVZ619Nscbahm//nrb
	 OOfbzhz5Yuilgin3pOcOIpV1yS5s/bORUJP9uZZEMnAN8CLzT6z6bwo3OFYCAYGt6e
	 zfnvjOJpPRdvX5A5xvJSj0zqKixzCW7IMa3OlEZHrBPZ1+8AVv6kvJFEzeG3yeUQbH
	 Mz+nquK9RPIPA==
Message-ID: <sashiko-outbox-180288@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: edac: xlnx,versal-ddrmc: Add
 xlnx,versal-xilsem compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rama devi Veggalam" <rama.devi.veggalam@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <1792587442-2794880-2-git-send-email-rama.devi.veggalam@amd.com>
References: <1792587442-2794880-1-git-send-email-rama.devi.veggalam@amd.com>
 <1792587442-2794880-2-git-send-email-rama.devi.veggalam@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 13:08:30 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: edac: xlnx,versal-xilsem firmware service modeled a=
s DDRMC MMIO node
--

commit 5dae9ede166dd1a988e3766f5755cc780a87b1f7
Author: Rama devi Veggalam <rama.devi.veggalam@amd.com>

dt-bindings: edac: xlnx,versal-ddrmc: Add xlnx,versal-xilsem compatible

This commit adds the xlnx,versal-xilsem compatible string to the Versal
memory controller binding in
Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac=
.yaml
and gates the reg, reg-names, and interrupts constraints per compatible
string using allOf/if-then blocks.

> diff --git a/Documentation/devicetree/bindings/memory-controllers/xlnx,ve=
rsal-ddrmc-edac.yaml b/Documentation/devicetree/bindings/memory-controllers=
/xlnx,versal-ddrmc-edac.yaml
> index 12f8e9f350bcf..b5dc32065e58d 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-dd=
rmc-edac.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-dd=
rmc-edac.yaml
> @@ -4,25 +4,35 @@
>  $id: http://devicetree.org/schemas/memory-controllers/xlnx,versal-ddrmc-=
edac.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Xilinx Versal DDRMC (Integrated DDR Memory Controller)
> +title: Xilinx Versal DDRMC (Integrated DDR Memory Controller) and XilSEM=
 EDAC
> =20
>  maintainers:
>    - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>    - Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> +  - Rama Devi Veggalam <rama.devi.veggalam@amd.com>
> =20
>  description:
>    The integrated DDR Memory Controllers (DDRMCs) support both DDR4 and L=
PDDR4/
>    4X memory interfaces. Versal DDR memory controller has an optional ECC=
 support
>    which correct single bit ECC errors and detect double bit ECC errors.
> =20
> +  Xilinx Versal Soft Error Mitigation (XilSEM) is part of the Platform L=
oader
> +  and Manager (PLM) which is loaded into and runs on the Platform Manage=
ment
> +  Controller (PMC). XilSEM is responsible for detecting and optionally
> +  correcting soft errors in Configuration Memory of Versal. Whenever an =
error
> +  is detected, be it correctable or uncorrectable, XilSEM notifies the e=
rrors
> +  to user applications via the firmware's event notification interface,
> +  rather than a devicetree-described interrupt.
> +
>  properties:
>    compatible:
> -    const: xlnx,versal-ddrmc
> +    enum:
> +      - xlnx,versal-ddrmc
> +      - xlnx,versal-xilsem
> =20
>    reg:
> -    items:
> -      - description: DDR Memory Controller registers
> -      - description: NOC registers corresponding to DDR Memory Controller
> +    minItems: 1
> +    maxItems: 2
> =20
>    reg-names:
>      items:
> @@ -35,8 +45,39 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - reg-names
> -  - interrupts
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: xlnx,versal-ddrmc
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: DDR Memory Controller registers
> +            - description: NOC registers corresponding to DDR Memory Con=
troller
> +        reg-names:
> +          items:
> +            - const: base
> +            - const: noc
> +      required:
> +        - reg-names
> +        - interrupts
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: xlnx,versal-xilsem
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: XilSEM (Soft Error Mitigation) register region
> +        reg-names: false
> +        interrupts: false
> =20
>  additionalProperties: false
> =20
> @@ -55,3 +96,12 @@ examples:
>          interrupts =3D <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
>        };
>      };
> +  - |
> +    bus {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +      edac@f2014050 {
> +          compatible =3D "xlnx,versal-xilsem";
> +          reg =3D <0x0 0xf2014050 0x0 0xc4>;
> +      };
> +    };

[Severity: Medium]
Is Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-e=
dac.yaml
the right place to model xlnx,versal-xilsem when a devicetree defines this
node for xsem_edac_probe() in drivers/edac/versal_edac.c?

In Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-e=
dac.yaml,
the description section notes that XilSem is part of the Platform Loader and
Manager running on the Platform Management Controller and notifies error
events via the firmware event notification interface rather than a
devicetree-described interrupt. In include/linux/firmware/xlnx-zynqmp.h,
enum pm_module_id defines XilSem as a firmware module:

enum pm_module_id {
	PM_MODULE_ID =3D 0x0,
	XPM_MODULE_ID =3D 0x2,
	XSEM_MODULE_ID =3D 0x3,
	TF_A_MODULE_ID =3D 0xa,
};

and its control and query operations in drivers/firmware/xilinx/zynqmp-sem.c
are performed through firmware calls.

In the examples section above, edac@f2014050 uses reg =3D <0x0 0xf2014050 0=
x0 0xc4>.
As shown in struct xsem_edac_priv in drivers/edac/xsem_edac.h and in
xsem_edac_probe() in drivers/edac/versal_edac.c (which maps resource 0 as
plmrtca_baseaddr), 0xf2014050 is a shared-memory offset within the firmware
Run-Time Configuration Area at 0xf2014000 in controller sram rather than a
dedicated hardware peripheral register block.

In addition, because XilSem monitors configuration memory and registers
rather than acting as a memory controller, it shares no hardware properties
with xlnx,versal-ddrmc. This forces the allOf section in
Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac=
.yaml
to split reg, reg-names, and interrupts into mutually exclusive if/then
branches solely because the drivers were combined in
drivers/edac/versal_edac.c.

Should this firmware service instead be represented under
xlnx,versal-firmware or instantiated as a child platform device by the
firmware driver (similar to xlnx_event_manager in
drivers/firmware/xilinx/zynqmp.c), rather than modeling a firmware
shared-memory offset as a memory controller bus node in devicetree?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/1792587442-2794880-=
1-git-send-email-rama.devi.veggalam@amd.com?part=3D1
