Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF07021D596
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584713; cv=none; b=gQciIMl6Nu1cMpnHzxxiqnJWl1iralO7Uk+Euhy17zrmJDYYJw/0I2Nzk611v1nK/TSc2JeQePwAne+9NTFKf4l/TGKG7ZuMv4gp+YdfpLB1+Pjcd87CF0kdbul1rryzMg9b83bGl2ivBWPphfyg0DSeHTusv+itW67whZiQ9Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584713; c=relaxed/simple;
	bh=Tbw/YQktjqZ32uQ0sec0H8yqRbA2dYw/TL4URlqH9uA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CverymZ/wwwPjTDmg5pk7hNrG0pZ7JujKkHOIZnQyzLwcgNiCed5Jm4CQI+2VBPhV0LMKYewaZmzRe2+42EWoLW/lPZnPZPdeYZeN8Lc47dwTRv/KPNFJjmue5WExvKrxON/9ZAWuLugI5zCaNUVjwLoZTcPgWE3brsfoMjEFT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbyxvwIx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbyxvwIx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526DD1F00893;
	Thu,  4 Jun 2026 14:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780584712;
	bh=/llI3C+WbmqIAlH2drSmCyljnggatwoNel1mhCkb2/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bbyxvwIxVxw7CKhNO8TadpwbO4IKMGmdH5KAiQii7EVPG1z10SSJU3rTnmMxMuyY8
	 vGsgnvMjwnomeBfEXZ7wVTFsG2rE6DgGWzwSRNshw/gKWPK0gK4ciStGOWI5n4dDsh
	 nFv6mX6h450tx20im3WU+u/pIf32r4J1XLLgCGFa5DW4GluoxPftMSTRNnegQKbEJV
	 m6vtsohm8GjvmWzS9VFrfeEy8vhxYGsXm7ljQwnLbUza90zwTEetMTIEmiE+cX9+IG
	 Ms52jWxKG75+SJgR0Js8anGYkWk4UUf2kLHALvYSnZ7lBn9FJVW6LizS+RI4lD+7oA
	 h0E+4yVLfLjIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/7] dt-bindings: timer: Add RISC-V ACLINT mtimer
 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joel Stanley" <joel@jms.id.au>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604143957.668047-5-joel@jms.id.au>
References: <20260604143957.668047-5-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 14:51:51 +0000
Message-Id: <20260604145152.526DD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `reg` and `reg-names` properties implicitly require exactly =
two items, preventing configurations with a shared or external `mtime` regi=
ster.
- [Low] The `interrupts-extended` and `reg-names` properties are missing fr=
om the `required` list in the RISC-V ACLINT MTIMER devicetree binding.
--

commit 1c0856d0470ac7f69215cb07bf901304f4595567
Author: Joel Stanley <joel@jms.id.au>

dt-bindings: timer: Add RISC-V ACLINT mtimer bindings

This commit introduces the device tree binding for the RISC-V machine-level
timer (MTIMER). It supports configuring the memory-mapped mtime and per-hart
mtimecmp registers.

Link: https://lists.riscv.org/g/tech-aia/topic/connections_between_aia_and/=
107177435

> diff --git a/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.=
yaml b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> new file mode 100644
> index 0000000000000..1d645570b1914
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml

[ ... ]

> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - tenstorrent,atlantis-aclint-mtimer
> +          - qemu,aclint-mtimer
> +      - const: riscv,aclint-mtimer
> +
> +  reg:
> +    items:
> +      - description: MTIMECMP registers, one per hart
> +      - description: MTIME register

[Severity: Medium]
The RISC-V ACLINT specification allows the mtime register to be shared acro=
ss
multiple MTIMER devices. By defining the reg array with two items, does this
schema implicitly enforce exactly two items, preventing configurations where
mtime is shared or external?

Should this include a minItems constraint to support secondary MTIMER devic=
es
that only implement the mtimecmp region?

> +
> +  reg-names:
> +    items:
> +      - const: mtimecmp
> +      - const: mtime

[Severity: Medium]
Similarly, does this implicitly require exactly two names, which would
incorrectly reject device trees that lack a dedicated mtime region?

> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 4095
> +
> +required:
> +  - compatible
> +  - reg

[Severity: Low]
Should interrupts-extended and reg-names be included in this required list?

Because the MTIMER hardware relies on timer interrupts to signal events to
the harts, omitting interrupts-extended allows device tree nodes to pass
schema validation without specifying how timer events are routed. Would this
result in a non-functional device passing validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604143957.6680=
47-1-joel@jms.id.au?part=3D4
