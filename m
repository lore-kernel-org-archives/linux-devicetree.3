Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A963BB13E
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 07:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781682168; cv=none; b=oESXw7bgdDA+KfW8uPeJOEHYXrKSHVAzoHGl2RJSAtIUKAjGAAt+hkrLYHqybmfGkO6vsIYqc4b5B+b1NhAqmW7RwrP+zHkJmRLzVm9slqqrRPznYccsIx2Clbv2NlAzkPjcRQbUhOJ+COyjI9aCqJ3b7I2cpTjtFE80IyueWHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781682168; c=relaxed/simple;
	bh=Hasr3MWHrSsvjPPIQx/9KTbMYvfNgZcvAiiGwWWMKV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUh/Cmu/zZfoPMsX8+od/F/35uGQ68thoEiPxxYZ77H2mVbLqdMDwGVJvNGsk7Ec36kJZ0s14oniW9g4/aKUR3Dg8rSL2DDLnnwWle8c3ebse4qPRRKHFYVgGRQFHv6n63NEmk29WVburjpfLeCOg3XUMlQSEfWgVQLkCp1EUdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDsYqoZi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDsYqoZi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D8D1F000E9;
	Wed, 17 Jun 2026 07:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781682166;
	bh=6ByWOnbuPRO5xLGpjo0tj70sBAcMhiemQdeIFnut9tE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cDsYqoZiMG4VS1ZWA05YuXgHTViT2MfWsdOBEsknTLojrKu3MNujDLbZJVf9fJql8
	 Phhh0uO0Bm5nkYBqhP+/yffhZB5K+PBbYbCiqWp7HWPTMDCkWHZqxqRuS69m3rn5o1
	 AM58n9MR2vFUv1uPrqrVqAU4s5VZgEAqtluWXwNC3oqwUzZTk/be245XoitlfUJoUN
	 COXna7NRhwf5tcr0ZEnebxvJ+lJZycBbpbCyXTRMjhWmDC97hPgx69ikkrFEka3aDf
	 9HLbDJgWEZ8XsN1MhH6sTx5LFf5E0K2aLs51ZNkNtjvkMGGrJ2krGOfdMFmtN0XCsr
	 Uf4Khn7q96O4g==
Date: Wed, 17 Jun 2026 09:42:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tejas <tejasmutalikdesai@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, sstabellini@kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm: xen: Convert to DT schema
Message-ID: <20260617-sloppy-beneficial-ferret-b2599b@quoll>
References: <20260615112625.7892-1-tejasmutalikdesai@gmail.com>
 <20260615130928.10198-1-tejasmutalikdesai@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260615130928.10198-1-tejasmutalikdesai@gmail.com>

On Mon, Jun 15, 2026 at 06:39:28PM +0530, Tejas wrote:
> Convert the Xen ARM device tree binding documentation from the legacy
> plain-text format (Documentation/devicetree/bindings/arm/xen.txt) to
> the YAML schema format, as required by the modern DT binding process.

There is no YAML schema. It's DT schema.

Your SoB does not match author (see submitting patches document).

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/sub=
mitting-patches.rst#L830

> The old xen.txt is removed as the YAML schema is now the authoritative
> source.
>=20
> The YAML schema:
>   - Uses the preferred dual license (GPL-2.0-only OR BSD-2-Clause)
>   - Validates compatible string format as "xen,xen-<major>.<minor>"
>     followed by the generic "xen,xen" string
>   - Documents reg as accepting 1..N regions (region 0 mandatory for
>     grant table mapping; regions 1..N optional extended regions)
>   - Documents the uefi subnode with correct types:
>       * xen,uefi-system-table:   uint64 (guest PA of UEFI System Table)
>       * xen,uefi-mmap-start:     uint64 (guest PA of UEFI memory map)
>       * xen,uefi-mmap-size:      uint32 (size of UEFI memory map)
>       * xen,uefi-mmap-desc-size: uint32 (size of each mmap entry)
>       * xen,uefi-mmap-desc-ver:  uint32 (mmap descriptor format version)
>   - Marks all five xen,uefi-* properties as required within the uefi
>     subnode; the source table lists all of them as unconditionally
>     populated by Xen when UEFI is supported
>   - 64-bit properties use /bits/ 64 <value> in the example, consistent
>     with other bindings carrying uint64 properties (e.g. opp-v2.yaml,
>     arm/mali-bifrost.yaml)

I don't understand the purpose of above paragraphs. Are you explaining
the changes done to the binding during conversion? Or explaining the
code? You are not suppose to explain the latter - code tells that. There
is no single point in repeating the diff in commit msg.

>=20
> The uefi subnode was originally introduced through a multi-version review
> series (v2..v7); the mistakes caught during those reviews (typos,
> duplicated UEFI spec content, insufficient description of Xen-specific
> hypercall semantics) are avoided with deliberate caution here.

What does it mean? What mistakes? What is avoided? How did you avoid it?

>=20
> Note: the example emits a dtc warning (unit_address_vs_reg) for the

You cannot have such warning, please fix the node.

> /hypervisor node. Both the normative text in xen.txt ("Xen ARM virtual
> platforms shall have a top-level 'hypervisor' node") and the example
> in xen.txt mandate this exact node name =E2=80=94 the $nodename: const:

Example cannot mandate that.

> hypervisor in the schema is a direct encoding of that pre-existing
> requirement. A unit address is therefore impossible despite the presence
> of reg. This warning is pre-existing and not introduced by this
> conversion.

It is possible. The previous text did not forbid unit address. It only
said node name and the name is stuff before @. Look at DT spec:

"node-name@unit-address
The node-name component specifies the name of the node. It shall be 1
to 31 characters in length and consist solely of characters from the set
of characters in Table 2.1."


>=20
> Signed-off-by: Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
> ---

=2E..

> +title: Xen hypervisor
> +
> +maintainers:
> +  - Stefano Stabellini <sstabellini@kernel.org>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Xen ARM virtual platforms shall have a top-level "hypervisor" node with
> +  the properties defined below.
> +
> +properties:
> +  $nodename:
> +    const: hypervisor
> +
> +  compatible:
> +    description: |

Drop |

> +      Specifies the Xen hypervisor. The version of the Xen ABI is encoded
> +      in the first item as "xen,xen-<version>", followed by the generic
> +      "xen,xen" string.
> +    items:
> +      - pattern: "^xen,xen-[0-9]+\\.[0-9]+$"
> +      - const: xen,xen
> +
> +  reg:
> +    description: |
> +      Base physical address and size of the regions in memory where spec=
ial
> +      resources should be mapped to, using a HYPERVISOR_memory_op hyperc=
all.
> +
> +      Region 0 is reserved for mapping the grant table and must always be
> +      present. The memory region must be large enough to map the whole g=
rant
> +      table (it is larger or equal to gnttab_max_grant_frames()).
> +
> +      Regions 1...N are extended regions (unused address space) for mapp=
ing
> +      foreign GFNs and grants. They might be absent if there is nothing =
to
> +      expose.
> +    minItems: 1
> +
> +  interrupts:
> +    description: |
> +      The interrupt used by Xen to inject event notifications.
> +      A GIC node is also required.
> +    maxItems: 1

=2E..

> +    / {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        gic: interrupt-controller {
> +            #interrupt-cells =3D <3>;
> +            interrupt-controller;
> +        };

Drop everything above.

> +
> +        hypervisor {
> +            compatible =3D "xen,xen-4.3", "xen,xen";
> +            reg =3D <0 0xb0000000 0 0x20000>;
> +            interrupt-parent =3D <&gic>;
> +            interrupts =3D <1 15 0xf08>;
> +
> +            uefi {
> +                xen,uefi-system-table =3D /bits/ 64 <0x1301415>;
> +                xen,uefi-mmap-start =3D /bits/ 64 <0x7591400>;
> +                xen,uefi-mmap-size =3D <0x1800>;
> +                xen,uefi-mmap-desc-size =3D <0x30>;
> +                xen,uefi-mmap-desc-ver =3D <1>;
> +            };
> +        };
> +    };
> +...
> --=20
> 2.54.0
>=20
