Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2513435AC13
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376013; cv=none; b=rnb/PF93bl4NI2h0MLQSQRC4yXPXhFsLVJpxYrQoeVxnhvrQJFfErintzRC+QaEpT3etVKh/P0/+qSDfXU/jBB6W3+RU157cHTF37zRUjzhV3vuD8TQuT8GwVBCjdyKNBljF/goYwE9M4KMC5U9cMDhUMVIeiUC+6iEJDp2fBoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376013; c=relaxed/simple;
	bh=kSn+P0Zc+04B3ivG7RyZ84H/i4tMzHtoG+/9sXTpkcI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rFiK6TtjeureZ74OrqX6LOyVexCNKf5ttWWJ4LuKUebywoUC83oIOV8GNGSKBLM5LSuR4p2dUu3dbnvBumittKsA7IwXSMVR0RFEkWfWDW3pCw4NZWhCtcKuevQ+xoL7Syhy9f+YlU74QmMBTE4nbpNQRK/c0+SmcD63VYJMPbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X93Yu1oL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X93Yu1oL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1391F000E9;
	Mon, 10 Aug 2026 15:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786376008;
	bh=WSk82B/F46GdCx4IEVPYarWQ5iw50HseAyytuqrnM8w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X93Yu1oLBjqbW2W1rbqfnt7NMXDUTOisbvDEaBVym8P2Ub7qN8uVE2IwxxQEpUBcw
	 xf5NA6qKfIBa3V4tHukLXeezBAkjNcXEYlHmPPlJIXdRaaxBqx6zuTRqXvHC5Q0Cet
	 Z6IPp2QzNKoub6+EmhU+pDcp/1br0PlS5tjHN7bctp1QyjfF58arEynxOywllcEtsV
	 AdabcbzGmaBHR0CNW7uaQ2V0t7775VD0N6ZFVshydO147zWjkoApMxR5egeC2PwG0G
	 0ArzOnj6OeKbkPR0ndfp64Kh6H0eE9OH1FH8URJBv/OAJeFq3XxPCbiroB7j33q8uy
	 in/jl8UkDqpyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/14] dt-bindings: Add RISC-V trace component
 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260810152223.3946743-2-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-2-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:33:26 +0000
Message-Id: <20260810153327.4E1391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The schema mandates the `qemu,trace-component` compatible string=
 for all instances, directly contradicting the commit message's claim that =
component-specific strings are not needed.
- [Medium] The generic binding sets `unevaluatedProperties: false` but comp=
letely omits standard physical hardware properties such as `clocks`, `reset=
s`, and `power-domains`.
--

--- Patch [1]: [PATCH v5 01/14] dt-bindings: Add RISC-V trace component bin=
dings ---
commit 48aff1e54e6f77b7c90ec16a8b7b4fc01e4b287f
Author: Anup Patel <anup.patel@oss.qualcomm.com>

dt-bindings: Add RISC-V trace component bindings

This commit adds device tree bindings for memory mapped RISC-V trace compon=
ents
that support both the E-trace and N-trace protocols. The commit message sta=
tes
that component-specific compatible strings are not needed as the type and=20
version can be discovered from the IMPL register.

> diff --git a/Documentation/devicetree/bindings/riscv/riscv,trace-componen=
t.yaml b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
> new file mode 100644
> index 0000000000000..bb519bc4a163e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
> @@ -0,0 +1,120 @@
[ ... ]
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qemu,trace-component
> +      - const: riscv,trace-component

[Severity: Medium]
The commit message states that component-specific compatible strings are not
needed, but does this schema enforce qemu,trace-component for all instances?

If a physical hardware device uses just riscv,trace-component, will it fail
schema validation because of the strict two-element array requirement defin=
ed
here?

[ ... ]
> +required:
> +  - compatible
> +  - reg
> +
> +anyOf:
> +  - required: [ in-ports ]
> +  - required: [ out-ports ]
> +
> +unevaluatedProperties: false

[Severity: Medium]
Since unevaluatedProperties is set to false, how should physical hardware
instances declare standard properties like clocks, resets, or power-domains?

Because they are omitted from the properties block above, won't the schema
validator unconditionally reject device trees that attempt to provide these
standard physical hardware properties?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810152223.3946=
743-1-mayuresh.chitale@oss.qualcomm.com?part=3D1
