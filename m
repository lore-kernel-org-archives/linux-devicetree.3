Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226503;
	b=ZmZPr9/mUzv6u2bJfFFdcmU4CCeVi3RX97MREbNwwhhEG5FfHI3yWgqaHi8RXs5BUjz6
	 KTBjd8MJxXEWAWZ7nXtOnrhsF5yF6cSz6Kw++7hcz3xp3cV8fDksbe322ZJGtZVEyC4XT
	 e05VuNw2grbah3Tc87qeCvXTOD4LcEHUy2/Z4e8D82plkUmmOO9QMEHGV/mQWWTwpZRxZ
	 /Zh5vc9kGl0eLom7W+buSMXN95Rmkq6xG1itVBIJX1rHBiiLQ+hRcERdM7Z102XW1bpRa
	 oK1dZQfG/emk5gpF44AaLBurMmflLQGDpio8vZ2F08e4f2kiwMVaz5g9KZhBOMys8YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226503;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=F/qByzTe+KcUp8tgIGYWQnDAqtdqoJO6RFLIIg0+kwU=;
	b=gwAMowanizBw6rZyWiPGWO41Jd37pdWBNspu/I0z2ot9M3wn7kXEwMxM+glJ00kghOnR
	 JRJIQTXrxrEd/GB5tQKNWnYNwnsfnVO1FNA3o1BBemEMRu90VSXEbvNL0YR0P37vDhhSL
	 tBGZmf60NreFCBaY3WVJOb9mz7ta6wcwRVVPs30qrLqvuTTsUVvElcZRvhhiWRvmTHHz2
	 VAqjSyYZ4lW/iTIh3+352Za5rdlMoewvg4r6uz/bdEhEN2VX1XpgAnXqyT3lrZf+mByYp
	 DEAYbd5BJ/6YX4c08wUix9H1tVxG/iDgM74bfEQxR0k3hahNQJBaYj6MzHtSxndR6pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IE2MCKFF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F318D606A323
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 12:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IE2MCKFF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7851F0089F;
	Mon,  9 Nov 2026 12:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794226502;
	bh=F/qByzTe+KcUp8tgIGYWQnDAqtdqoJO6RFLIIg0+kwU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IE2MCKFFZEgj7Sjp/pSEQXFcmpmZzxNN6iMyE68TlxX3GCLPyPaOi663RPaTwQy/1
	 9u1v5mdIt283cFR3cbYkSXsyBTpIkjOzeJOpYYTX98fjlq6teskboX3U6LW5alLwl5
	 6UF9+vfdjA/bJ4wcAkfjjbusNvnqJ3eVuQqBbd1pvbMDvkUxrxyhnFK1HPNZkVe5x+
	 xT87XWdImRB51R6mep8yxkSBPPWkhqIP5wz5GPc253zLUUqZKXigIOFQdCBJotBqka
	 8pUKakrj9EmuQJUzIfvUlocwNU1RQzcecX8BC7FsYrKv6+5SyUzyXBrn2pyPSZa3Eg
	 zja0tm4JmJ4Zw==
Message-ID: <sashiko-outbox-204921@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: Add CIX Sky1 Mali support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cunyuan Liu" <cunyuan.liu@cixtech.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, ojeda@kernel.org, gary@garyguo.net
In-Reply-To: <20261109120902.125242-2-cunyuan.liu@cixtech.com>
References: <20261109120902.125242-1-cunyuan.liu@cixtech.com>
 <20261109120902.125242-2-cunyuan.liu@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 12:15:01 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: gpu: arm,mali-valhall-csf: unwieldy per-compatible
  conditionals
--

commit db19953a0ba8128d65457c4ba6cdd6315dce5402
Author: Cunyuan Liu <cunyuan.liu@cixtech.com>

dt-bindings: gpu: Add CIX Sky1 Mali support

This commit adds the CIX Sky1 compatible string, resource requirements, and
example to the Arm Mali Valhall CSF GPU binding schema.

> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.y=
aml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> index 8eccd4338a2b2..a93acc6d91ec8 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml

[ ... ]

> @@ -51,6 +52,9 @@ properties:
>            - stacks
>        - const: stacks
> =20
> +  resets:
> +    maxItems: 1
> +
>    nvmem-cells:
>      items:
>        - description: bitmask of functional shader cores
> @@ -146,6 +150,34 @@ allOf:
>          - nvmem-cells
>          - nvmem-cell-names
>          - power-domains
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: cix,sky1-mali
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: core
> +            - const: stacks
> +        power-domains:
> +          maxItems: 1
> +        power-domain-names: false
> +        mali-supply: false
> +        sram-supply: false
> +        nvmem-cells: false
> +        nvmem-cell-names: false
> +      required:
> +        - clock-names
> +        - resets
> +        - power-domains
> +    else:
> +      properties:
> +        resets: false

[Severity: Low]
This isn't a bug, but adding resets at the top level and another large
if/then/else block to disable variant-specific properties makes the
per-compatible conditionals in this schema unwieldy. Would it be cleaner
to split the binding into separate schema documents for the SoC variants
instead of piling more conditionals onto arm,mali-valhall-csf.yaml?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109120902.1252=
42-1-cunyuan.liu@cixtech.com?part=3D1
