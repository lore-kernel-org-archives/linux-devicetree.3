Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AA826E710
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781505250; cv=none; b=hqzzQZ/uUTuOGIXwA44SvN0ADnSKRpwj5PzXp+m+KE9G6MZXfXWgkB8Zu9712VVMgR3SoiRXLrr4BE+EbPPFdQU+fvkfoIwlt0XTxD4wPKYJ6pEfBZUNT0VjJQWn+Jav9CdJQ9LRQWPlz9OiTejzAxZhAbWTEBACiel3LPLMyfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781505250; c=relaxed/simple;
	bh=6SLaDAqcS/OeJu4eGi6y4W6aQYcuJbmRKPaeonP7Mak=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NO7kQczNH2FPvootsfZmTWu6joS7mj/swXvnpvGpw5usEJ0VtY6wKVBKhE32VNYv2RZWv0I/+0ttcyHRjfh8IWlxuO5iwn+1l/qK1vSrVu3dfnjzWD93gUoiv/ghAhmkRBhY4RBrmPz+oqZuQfy6/t+i3Xpq8Io8uQV5TEVlsYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfA/RG5K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfA/RG5K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74C11F000E9;
	Mon, 15 Jun 2026 06:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781505249;
	bh=KJB66/+GRQlMBTLzxNiwr90NsdExgZU8pcK43avWcxQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MfA/RG5K2mvRg/RcNtiyNhlKqT5OeVBX1oQsQhKWQW0ZWQ/4ynMHEVqudVH3eSN63
	 b29hK6yJ5Lh8lsSPN92JkQTWczecArgO4vHSDNXYsvjLqBEWA/+AWJUQoUO917s8Ps
	 JkOcluRp1SpfPzAq+pCbhyWkEM9vJQGzBrFPYl0VxxXvNQ2vbSrVNFocMrSdzPnVJf
	 6bqdVqYXnuvEm+6ncod2NNCvNPim7O1DATUD3/GV3MZoRExkcCSU/Dt9ENFcnIpO2d
	 VrFc/8jcl/meEY4vDCdO6mhaRngQ0d7IOTlrxY8o9Vk1WvNIkVwA/Meh4W50CNw9ai
	 Nn7S11h2zbR/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomi Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260615-rcar-du-dsc-v4-2-93096a1b56a3@ideasonboard.com>
References: <20260615-rcar-du-dsc-v4-2-93096a1b56a3@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 06:34:08 +0000
Message-Id: <20260615063408.B74C11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The DT binding example fails schema validation because its `compati=
ble` string array is incomplete and does not match the schema's requirement=
s.
--

commit 0c24ed90ba663d71759d36b46777595ba20ee9c3
Author: Marek Vasut <marek.vasut+renesas@mailbox.org>

dt-bindings: display: bridge: Document Renesas R-Car V4H DSC bindings

This commit adds device tree bindings for the VESA DSC Display Stream
Compression encoder embedded in the Renesas R-Car V4H SoC. It defines the
schema constraints, required properties, and provides an example node.

> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsc=
.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
> new file mode 100644
> index 0000000000000..4d2c2c6cb1f08
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
[ ... ]
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r8a779g0-dsc
> +      - const: renesas,rcar-dsc
> +
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a779g0-sysc.h>
> +
> +    bridge@feb8d000 {
> +        compatible =3D "renesas,r8a779g0-dsc";

[Severity: Low]
Does this example fail dt_binding_check validation? The schema requires the
compatible property to be an array containing exactly two items: the=20
SoC-specific string and the fallback constant (renesas,rcar-dsc). However,
the example only provides the SoC-specific string.=20

Should the example be updated to match the schema requirements?

> +        reg =3D <0xfeb8d000 0x400>;
> +        interrupts =3D <GIC_SPI 559 IRQ_TYPE_LEVEL_HIGH>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-rcar-du-ds=
c-v4-0-93096a1b56a3@ideasonboard.com?part=3D2
