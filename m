Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CD0375AB5;
	Fri, 31 Jul 2026 20:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529199; cv=none; b=pOHWRuT69ZGbRNf+T48b5P3vjc816HNDl7UcZXaqqbXpVxJO1ylmaUs/FJa1ARTL7A+r7PRN1sFAAehXmQwAWVluthwl+0w0lI861oziJuukh3fywTWLVPnGPvpxA/S0Y+2yLS74VwiC+6VDzhxlGdvA6PiU/myH1B3sZmUNeMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529199; c=relaxed/simple;
	bh=z6ogPgFR/z+XXbOzcm5vmg73+jmN+2s6AsGK2AGXxRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPjK2lbqzTZD2fbJrdU4Ht9TSEAGeMchUTYHcb6jsuu1N+PZSwAstpvMKPeJbHxus6p5GPtxnESwtrqIU4db1unRwenyZjxZwb8bQniWxGQ/gONMOVv8GyRre3ZytKoAa4oQtfA3qJ126e7ysNBzElAcUyGbtRPAnlGnw2v5qa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYi+Wf0t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYi+Wf0t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571FE1F00AC4;
	Fri, 31 Jul 2026 20:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529197;
	bh=gAqTgmb8nyHXOBE2Z+WAy2vf/nC7RaTwNiVzTEyUthM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VYi+Wf0tpE5oJ6sdlwlFvIHL5mE5R3eX1tXGXs6hQpPjdmIE6p801MKYyoGbRiAA2
	 uwQ5Az41PsZ7MSPlmY5BU81ClM/UOi+YXpqj+FQOzLJ+m3fDSvOznH9VLFXLYYuYvM
	 5kHkh6v5QJjsk5KeXqDWPKnVKe0XXriiin3BES5Wzhk4i7tvu+a5RgMxX6cbEgXllk
	 ime18CmGbSA+kJmCfKOXrIpEvVejG0mCpyG4f4+4eNmQpUeYmaP9qMe5dufOTpsI1t
	 Ba0tQ+mGnC0jtZjjnbMsfRMGFk+5Sz9GY/VIw7PZtkvyIqxKM3dJjiJxGg6gCFKHIY
	 N691LPdgdRPJQ==
Date: Fri, 31 Jul 2026 15:19:55 -0500
From: Rob Herring <robh@kernel.org>
To: Xing Loong <xing.xl.loong@gmail.com>
Cc: Jens Wiklander <jenswi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: firmware: add mbedtee,tee binding
Message-ID: <20260731201955.GA1585970-robh@kernel.org>
References: <20260720073558.799755-1-xing.xl.loong@gmail.com>
 <20260720073558.799755-3-xing.xl.loong@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720073558.799755-3-xing.xl.loong@gmail.com>

On Mon, Jul 20, 2026 at 03:35:56PM +0800, Xing Loong wrote:
> MbedTEE is a Trusted Execution Environment for embedded
> systems (https://github.com/mbedtee). It communicates with
> the REE via shared-memory ring buffers using a fixed RPC
> protocol. Two platform configurations are supported:
> 
>   - ARM/AArch64 (TrustZone, SMC): two reserved-memory
>     regions (t2r-ring and t2r-shm) plus a GIC SPI edge
>     interrupt for TEE-to-REE notifications.
>   - RISC-V (IMSIC): three reserved-memory regions, adding
>     r2t-ring for REE-to-TEE command submissions; no
>     interrupts property (T2R notifications use IMSIC MSI
>     allocated at runtime).
> 
> Signed-off-by: Xing Loong <xing.xl.loong@gmail.com>
> ---
> Changes in v3:
> - Drop all phandle stub nodes from examples.
> - Remove redundant required: - interrupts from then branch.
> - Simplify title and description.
> 
> Changes in v2:
> - Fix DT binding review comments from Krzysztof Kozlowski:
>   - Drop $nodename, "YAML devicetree binding" wording, property descriptions
>   - Rename compatible string to mbedtee,tee
>   - Rename memory regions: rpc-t2r-ring -> t2r-ring, rpc-t2r-shm -> t2r-shm,
>     rpc-r2t-ring -> r2t-ring
>   - Add memory-region / memory-region-names to required
>   - Simplify allOf constraints (drop redundant else-branch items)
>   - Rewrite description to describe hardware/firmware, not the binding or driver
>   - Drop all irrelevant platform nodes (gic, cpus, reserved-memory)
>   - Add maxItems: 1 constraint to interrupts property (Sashiko AI review)
> 
> ---
> 
>  .../bindings/firmware/mbedtee,tee.yaml        | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml
> 
> diff --git a/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml b/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml
> new file mode 100644
> index 0000000..a8f1201
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/mbedtee,tee.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MbedTEE
> +
> +maintainers:
> +  - Xing Loong <xing.xl.loong@gmail.com>
> +
> +description: |
> +  MbedTEE is a Trusted Execution Environment for embedded systems.
> +  It communicates with the REE (Linux) via shared-memory ring
> +  buffers using a fixed RPC protocol.
> +
> +  We're using "mbedtee" as the vendor prefix for the open-source TEE
> +  project at https://github.com/mbedtee.
> +
> +  The REE and TEE CPUs sharing the RPC memory must be in a
> +  hardware-coherent domain.
> +
> +  Two or three reserved-memory regions are required:
> +    t2r-ring: ring buffer for TEE-to-REE notifications
> +    t2r-shm:  shared memory for TEE-to-REE RPC payloads
> +    r2t-ring: ring buffer for REE-to-TEE command submissions (RISC-V)

Put any details about specific properties with the property schema.

> +
> +  On ARM the transport uses SMC and a GIC SPI interrupt. On RISC-V
> +  the transport uses shared-memory rings and IMSIC MSI; the TEE
> +  polls r2t-ring for commands from the REE.
> +
> +properties:
> +  compatible:
> +    const: mbedtee,tee
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  msi-parent:
> +    maxItems: 1
> +
> +  memory-region:
> +    minItems: 2
> +    maxItems: 3
> +
> +  memory-region-names:
> +    minItems: 2
> +    maxItems: 3
> +    items:
> +      enum:
> +        - t2r-ring
> +        - t2r-shm
> +        - r2t-ring

Needs to define the order as sashiko points out. The order doesn't 
change, so it doesn't need to be defined in the if/then schemas.

> +
> +required:
> +  - compatible
> +  - memory-region
> +  - memory-region-names
> +
> +allOf:
> +  - if:
> +      required:
> +        - interrupts
> +    then:
> +      properties:
> +        msi-parent: false
> +        memory-region:
> +          maxItems: 2
> +        memory-region-names:
> +          items:
> +            - const: t2r-ring
> +            - const: t2r-shm

Just 'maxItems: 2'

> +    else:
> +      required:
> +        - msi-parent
> +      properties:
> +        interrupts: false
> +        memory-region:
> +          minItems: 3
> +        memory-region-names:
> +          items:
> +            - const: t2r-ring
> +            - const: t2r-shm
> +            - const: r2t-ring

Just 'minItems: 3'

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    firmware {
> +        mbedtee {
> +            compatible = "mbedtee,tee";
> +            interrupts = <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>;
> +            memory-region = <&t2r_ring>, <&t2r_shm>;
> +            memory-region-names = "t2r-ring", "t2r-shm";
> +        };
> +    };
> +
> +  - |
> +    firmware {
> +        mbedtee {
> +            compatible = "mbedtee,tee";
> +            msi-parent = <&imsic>;
> +            memory-region = <&t2r_ring>, <&t2r_shm>, <&r2t_ring>;
> +            memory-region-names = "t2r-ring", "t2r-shm", "r2t-ring";
> +        };
> +    };
> -- 
> 2.43.0
> 
