Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEE036EAA4
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 10:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781866771; cv=none; b=eZBZCVIGnN/lnG2LdW0tCkMCuH7OG0uPC5bGJESkBUJAFl1lrsJSS4gtZwTIAokcRNWrRK2fqE6wnNlNXOwhVLxyqkPmW/5bWqRIHlYByjDZCYnuvaErG4sheUnWbupegXN8AhoXSWzmBCiTaKUEL1Ej3QLxBsehBlBHyx0afCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781866771; c=relaxed/simple;
	bh=upEHbb0uAGC5oHKuMZNTc91v43HnSTMnQ1Q+jvgQh+k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MeR/Yas345drm4TcMAkJl8p/Syp0X6hrrZKPk9VQfAoASAD3b2d9mIu5djG2/DgxV2vNemVDrzljdehtz0APXL3hgkHT3SdCbnsNyoe23XQ7cThJayrN/GUhlBTCyeh8Ei+p6bCWGXdcAyk2ThluLHPaEfd1OXKOXmEq3XsHWE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xt1zPX4v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xt1zPX4v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2711F000E9;
	Fri, 19 Jun 2026 10:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781866769;
	bh=dslPb430IX/pHl/4hcyIY4aKfD4eGLG9Ll+BSv8UsdM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xt1zPX4vTSvhJt4ptOxEUXLV4Jv78dr0bysW0yrKqpmNDMkshVqjV6YGpeiuvuRA2
	 JqRjetuA0Bl3zFrspvF14P/fMZ0j25MjVI3rKFD1yjo4WoaTOle5qfX83db3QjJ1Gc
	 xVxZ80KI/sJQ3imzppAf82YhJM5pVE/esX0xK/AIQuTkiMr17GOOOMp/TuYFr3ZVcE
	 Wzfv0RxiZ9wtoQm95MVnUlKvU7gFeqve++uvIcehfWRe1xg/O616aW/7ImHYBoMFyl
	 v28gEi6CEQxwzXZ5bKJPrDLTYDLPpAOQe4YVb20i7aof5tcdbXk7d88QTXSTyVCVz5
	 apslxHqqvCeew==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/3] dt-bindings: riscv: Add Worlds per-hart
 properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chien Peter Lin" <peter.lin@sifive.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260619105834.1277302-3-peter.lin@sifive.com>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
 <20260619105834.1277302-3-peter.lin@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 10:59:29 +0000
Message-Id: <20260619105929.6B2711F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect and unnecessary schema reference: `cpus.yaml` (which v=
alidates child `/cpus/cpu@*` nodes) improperly includes a `$ref` to `worlds=
.yaml` (which validates the parent `/cpus` container node). This erroneousl=
y bleeds parent constraints into the child schema.
--

commit 2b4a193c4b5716c3f96b6ae87becc46dcf104835
Author: Yu-Chien Peter Lin <peter.lin@sifive.com>

dt-bindings: riscv: Add Worlds per-hart properties

This commit adds per-hart device tree properties for the RISC-V Worlds
architecture, such as riscv,pmwid and riscv,pmwidlist. These platform-defin=
ed
values are used by M-mode firmware to configure World ID CSRs and restrict
usage across privilege levels.

> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 5feeb2203050a..4b5778b6d3e70 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -26,6 +26,7 @@ description: |
>  allOf:
>    - $ref: /schemas/cpu.yaml#
>    - $ref: extensions.yaml
> +  - $ref: worlds.yaml

[Severity: Medium]
Does this reference unintentionally bleed the parent container properties i=
nto
the child hart nodes?

The schema worlds.yaml is designed to validate the system-wide /cpus node
via its select: pattern: "^cpus$", while cpus.yaml validates the individual
/cpus/cpu@* nodes. By referencing worlds.yaml here, properties meant for
the parent container leak into the child schema. Any future properties added
to worlds.yaml would implicitly bypass unevaluatedProperties strict
evaluation on the cpu@* nodes.

>    - if:
>        not:

[ ... ]

> @@ -120,11 +121,31 @@ properties:
>        thead systems where the vector register length is not identical on=
 all harts, or
>        the vlenb CSR is not available.

[ ... ]

>    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
>    timebase-frequency: false
> +  # RISC-V requires 'riscv,nworlds' in /cpus, so disallow it here
> +  riscv,nworlds: false

[Severity: Medium]
Is this explicit disallowance a workaround for pulling in the parent schema
via the reference above?

If the reference to worlds.yaml is removed from the allOf block, this manual
workaround shouldn't be necessary. Removing the reference would also prevent
future parent properties from silently sneaking into the child node schemas.

> =20
>    interrupt-controller:
>      type: object

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619105834.1277=
302-1-peter.lin@sifive.com?part=3D2
