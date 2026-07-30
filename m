Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391443C0A08;
	Thu, 30 Jul 2026 07:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785396910; cv=none; b=JtKKrsXxGfl9wE9prjklwuBYLbUqopddYwWJ4M+THQAR4PLJUQoXfFKa7thKgIaCkGyYEwq/ddBQk4FaUm9UM4aVEr0cjC+nzc9YI5+eACtNSP5a1LO57BKP+qDQwkyjc43+mNBY/48KiznJWymhVztpTKywjkl/A1vfCIgn1Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785396910; c=relaxed/simple;
	bh=EiQmc5+X6r4B2NkGuSgpVvfeOI/m7LbeK+0VY59iB8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXFyOmm7VnVkw1olREHmvFLTccT3aSIDWHqvFSkJw7voMan+cdw4dVR9OKaMPEDTakxkG3c8yE1lDCA6eiJILinnz6mkX02lrkLsFg97UqIrtjVF75bDFDX4THFbsMxVzK3VP5ugcW4uyvD5UlnzCAQyi9e+XuaMGqISjgk0sLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQASIhUW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQASIhUW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A304C1F000E9;
	Thu, 30 Jul 2026 07:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785396906;
	bh=MKQl6FL38HDWspXCOxkB5VXhKu31yQlk+FQCz/uJuSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SQASIhUWIZgJoxY6QpH+sbIWUomaO+/6FidLLss9dTPjfKnNntmubmqEMjBMEIqxH
	 eQDgp4Po42u+2U7hemoXGjI/oqHu9eIJXfbKnHrmfvYzVU3b72YkpdqZ9ZySZ1rfWP
	 IUno0DGsimZK4E8eKp3uqQGtWU4AlBUT76lfZmwH0va7m/8+8S9VSCuQq3Ycp7+NgU
	 cnVcI0/MFJAV2TP/FS7p6WRJzazEKG5m+DcQdSE41zZIb1HnhHFxCe0efnsex7yNuF
	 Sb4b7a59/2MzLAOOdEJkwUDZxgkpf7AgOhhfxO5ZbLTbWJ/uho98Z7QMfUKmvbWdm4
	 pbuX4BNMenX+Q==
Date: Thu, 30 Jul 2026 09:35:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	samuel.holland@sifive.com, dlan@kernel.org, guodong@riscstar.com, 
	dfustini@oss.tenstorrent.com, michal.simek@amd.com, junhui.liu@pigmoral.tech, 
	darshan.prajapati@einfochips.com, akpm@linux-foundation.org, zhangchunyan@iscas.ac.cn, 
	luxu.kernel@bytedance.com, pincheng.plct@isrc.iscas.ac.cn, nick.hu@sifive.com, 
	jim.shu@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com, 
	robin.randhawa@sifive.com, scott@riscstar.com, dave.patel@riscstar.com, 
	raymond.mao@riscstar.com, anup@brainfault.org, pawandeep.oza@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] dt-bindings: sifive: Add WorldGuard Checker
Message-ID: <20260730-towering-modest-horse-ccbdcc@quoll>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-4-peter.lin@sifive.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729163908.249838-4-peter.lin@sifive.com>

On Thu, Jul 30, 2026 at 12:39:08AM +0800, Yu-Chien Peter Lin wrote:
> Add YAML binding schema for the SiFive wgChecker, a programmable

There is no "YAML" binding schema.

> access controller integrated in the interconnect fabric of RISC-V
> Worlds-capable SoCs.
> 
> wgChecker enforces World ID (WID) based access control on downstream
> bus transactions. Each checker slot encodes a 2-bit permission field
> per WID (read/write), enabling fine-grained memory partitioning and
> device isolation between execution contexts. Violations are reported
> via bus errors, interrupts, or both, selectable and lockable per slot.
> 
> The binding registers wgChecker as an access-controllers provider.
> Consumers (i.e. its protected device) reference it via the standard
> access-controllers phandle to declare their access requirements.
> 
> Also document the sifive,trustedwid property for the /cpus node,
> identifying the privileged WID authorized to configure all checkers
> on the platform.
> 
> Link: https://github.com/riscvarchive/security/blob/main/papers/worldguard%20proposal.pdf
> Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>

What exactly these reviews pointed out?

> ---
>  .../devicetree/bindings/riscv/worlds.yaml     |   9 +
>  .../bindings/sifive/sifive,wgchecker2.yaml    | 356 ++++++++++++++++++
>  2 files changed, 365 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/riscv/worlds.yaml b/Documentation/devicetree/bindings/riscv/worlds.yaml
> index cc8b3747591e..c39a06c2dd8d 100644
> --- a/Documentation/devicetree/bindings/riscv/worlds.yaml
> +++ b/Documentation/devicetree/bindings/riscv/worlds.yaml
> @@ -34,6 +34,14 @@ properties:
>      minimum: 2
>      maximum: 64
>  
> +  sifive,trustedwid:

No, for the same reasons.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 31
> +    description: |
> +      The World ID (WID) designated as the trusted WID for this platform.
> +      Transactions tagged with this WID are authorized to access and configure
> +      WorldGuard blocks, including wgCheckers and wgMarkers.
> +
>  additionalProperties: true
>  
>  examples:
> @@ -44,6 +52,7 @@ examples:
>          #size-cells = <0>;
>          timebase-frequency = <1000000>;
>          riscv,nworlds = <4>;
> +        sifive,trustedwid = <3>;
>  
>          cpu@0 {
>              device_type = "cpu";
> diff --git a/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml b/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> new file mode 100644
> index 000000000000..c025a4765cb3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml

No, you do not get per vendor directory. NAK.

Do you see Qcom? Or TI? Or NXP?

Place it in appropriate directory matching the hardware.


> @@ -0,0 +1,356 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2026 SiFive, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sifive/sifive,wgchecker2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive WorldGuard Checker
> +
> +maintainers:
> +  - Yu-Chien Peter Lin <peter.lin@sifive.com>
> +
> +description: |
> +  The RISC-V Worlds ISA extension defines World IDs (WIDs) as architectural
> +  identifiers that tag each system transaction with its originating context.
> +  System integrators assign WIDs to execution contexts such as privilege modes,
> +  trusted execution environments, or other isolation boundaries.
> +
> +  The SiFive WorldGuard Checker is a hardware firewall positioned in the
> +  system interconnect fabric. It inspects every transaction, evaluating the
> +  WID against access control policies encoded in checker slots for each
> +  protected resource. Transactions from unauthorized WIDs are blocked and
> +  reported as bus errors, interrupts, or both.
> +
> +  This enables spatial partitioning of memory regions and memory-mapped devices
> +  across execution contexts. Different address ranges can enforce distinct
> +  policies, allowing isolated workloads to coexist with hardware-enforced
> +  protection.
> +
> +  The wgChecker acts as an access-controller provider as defined in the
> +  access-controllers framework. Protected devices are consumers that declare
> +  their access policy via the access-controllers property. The hardware
> +  supports up to 32 World IDs.
> +
> +  The World ID authorized to configure WorldGuard blocks is specified by the
> +  sifive,trustedwid property in the /cpus node.
> +
> +allOf:
> +  - $ref: /schemas/access-controllers/access-controllers.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: qemu,wgchecker2
> +          - const: sifive,wgchecker2
> +      - const: sifive,wgchecker2

You need soc specific compatibles.

I do not believe the two review tags did any actual real review. They
would tell you to read writing bindings document, wouldn't they?

> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Base address and size of the wgChecker memory-mapped I/O registers.

Again, standard comment. Why do you need description?

> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      Interrupt line asserted when a WID access violation is detected and
> +      interrupt reporting is enabled in the slot configuration (IR or IW
> +      bits set).
> +
> +  '#access-controller-cells':
> +    const: 1
> +    description: |
> +      Specifies the partition identifier to reference a partition child
> +      node that defines the access control region, WID permissions, and
> +      access failure configuration. The special ID 0xFFFFFFFF indicates
> +      unprotected mode, granting unrestricted access to the device.
> +
> +  '#address-cells':

Use consistent quotes.

> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^partition@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        maximum: 0xFFFFFFFE
> +        description:
> +          Partition identifier. Must be unique within the wgChecker node.
> +          The value 0xFFFFFFFF is reserved for unprotected mode and must
> +          not be used.
> +
> +      sifive,protected-region:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description:
> +          Protected memory region encoded as a base address and size.
> +        items:
> +          - description: Upper 32 bits of the base address
> +          - description: Lower 32 bits of the base address
> +          - description: Upper 32 bits of the region size
> +          - description: Lower 32 bits of the region size
> +
> +      sifive,slot-permissions:
> +        $ref: /schemas/types.yaml#/definitions/uint64
> +        description: |
> +          64-bit WID permission bitmap. Each WID N uses two consecutive bits:
> +            - bit[2*N]  : Read  permission for WID N
> +            - bit[2*N+1]: Write permission for WID N
> +          Set bits grant access.
> +
> +      sifive,slot-config:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        maximum: 0x1F
> +        description: |
> +          Access failure configuration flags for this slot:
> +            bit[0] (ER): report read  violations as bus errors
> +            bit[1] (EW): report write violations as bus errors
> +            bit[2] (IR): report read  violations via interrupt
> +            bit[3] (IW): report write violations via interrupt
> +            bit[4] (L) : lock this slot against further modification
> +          Bits[5:31] are reserved and must be zero.
> +
> +    required:
> +      - reg
> +      - sifive,protected-region
> +      - sifive,slot-permissions
> +      - sifive,slot-config
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'
> +  - '#size-cells'
> +  - '#access-controller-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    // Example 1: Peripheral device protection
> +
> +    cpus {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        timebase-frequency = <1000000>;
> +        riscv,nworlds = <4>;
> +        sifive,trustedwid = <3>;
> +
> +        cpu@0 {
> +            device_type = "cpu";
> +            reg = <0>;
> +            compatible = "riscv";
> +            riscv,isa-base = "rv64i";
> +            riscv,isa-extensions = "i", "m", "a", "c", "smlwid";
> +            riscv,pmwid = <3>;
> +
> +            cpu_intc0: interrupt-controller {
> +                #interrupt-cells = <1>;
> +                compatible = "riscv,cpu-intc";
> +                interrupt-controller;
> +            };
> +        };
> +    };
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        uart: uart@1c1000 {
> +            compatible = "ns16550a";
> +            reg = <0x0 0x001c1000 0x0 0x1000>;
> +            reg-names = "control";
> +            interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
> +            access-controllers = <&wgchecker0 0>;
> +        };

None of these are relevant. Drop all of the nodes.

Please read carefully writing bindings and DTS101 slides before posting
next version.

Best regards,
Krzysztof

