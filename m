Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6050C401A25
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 07:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780473358; cv=none; b=gjvZqqeCRenHsMADNa/rLlxuKXy6YsJo5rVzaK7wiPEEVVFjS9Ll9LYemVGOJqOMFMMd+e2d8+GRG+r8HoAHsp3j8kayb/U6+eTw1fAWpmumYiCfL+x3u+glJUlPDzVpJ304N9d7U2vzQTHiIU8JjJY5gpP/4AfrZ/jQgYqvLm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780473358; c=relaxed/simple;
	bh=XZJenswdTRw1d6FNHVFFATpTw/lD4jQWNyl2DUZvlf0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O5Ea5J6+IAHVR3fev1ebuyxwWV8BOvVYmIXNNLtzAwm54EmSbsWDoXOKifCu6SZ42zSfB5jBP640hLRyKlQZcH/Sig3kgvHQiOyaRKFQbuTDvIyGou0pMVL2Qb6nt2EYrdCNdBoe108XJiIV2jn/Yfjtvax8S9+Iqq8PvPmpfio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6c29d2n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6c29d2n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FCC91F00898;
	Wed,  3 Jun 2026 07:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780473356;
	bh=KeeG4eYlZCMNiuI1ugTXf6I+ChAN/zFgZEYbvP5DWLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V6c29d2nc2FAcxi2m1Gnkk8LGlxyJUclFo1VnEoD7mxpTYJREqIbo/NTlA2vtVNXV
	 VOWtpsFto5y4rOJuPQHBvRxMqTjotDV/roUHgEmkOB7VLzqvYIcF/DFDnN+iw0PRM3
	 9bxpWy4IRivGuRRb9Vq6FHlpK4nsGsrklkOtJm88y2yLpM/yUU0e+yIS5RSGzWQVlP
	 KobyIx5Xe+9Z3YWAfFEvWE2awOklw30pA5iwACZRiuRKXbjEcGIJ6ZjjxeOqDz6j/k
	 rfKFhyfG0rLVxcmsiGhHRSifXO/79GdsJew8nkdVwPMAm56s7o7mS0imvjzJduKIdF
	 QnedEh3rsnA2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: timer: Add RISC-V ACLINT bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joel Stanley" <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260603074222.593243-5-joel@jms.id.au>
References: <20260603074222.593243-5-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 07:55:56 +0000
Message-Id: <20260603075556.8FCC91F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The `reg` property erroneously allows up to 4095 items, undermining=
 schema validation.
- [Low] The `interrupts-extended` property is missing from the `required` l=
ist, weakening schema validation.
--

commit 173c98f19d28214c8c437b5b2fe1fe7ffd581f01
Author: Joel Stanley <joel@jms.id.au>

dt-bindings: timer: Add RISC-V ACLINT bindings

This commit documents the device tree bindings for the RISC-V Advanced Core
Local Interruptor (ACLINT). It defines the memory-mapped devices providing
IPI and timer functionalities for each HART on a multi-HART platform.

> diff --git a/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.=
yaml b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> new file mode 100644
> index 0000000000000..192ff3fcf79f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
[ ... ]
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - tenstorrent,atlantis-aclint
> +          - qemu,aclint-mtimer
> +      - const: riscv,aclint-mtimer
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 4095

[Severity: Low]
Is this maxItems limit of 4095 correct for the reg property?

It appears this might be a copy-paste from the interrupts-extended property.
Since the RISC-V ACLINT MTIMER typically has only 1 or 2 memory-mapped
regions (e.g., for mtimecmp and mtime), allowing up to 4095 items could
permit incorrect device tree definitions to silently pass schema validation.

> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 4095
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false

[Severity: Low]
Should interrupts-extended be added to this required list?

Since the primary purpose of the ACLINT MTIMER is to generate machine-level
timer interrupts for harts, omitting the interrupt routing from the required
list might allow incomplete, non-functional hardware descriptions to pass
validation. Other similar bindings typically mandate interrupt routing
properties.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603074222.5932=
43-1-joel@jms.id.au?part=3D4
