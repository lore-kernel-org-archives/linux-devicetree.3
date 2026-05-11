Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED75C3AD50F
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778532329; cv=none; b=JiGmVHcwfZaEznxpXzmPIFpHnu0Obx2Z5sSq2Eicmk2aCdFmpLjJlZv0jhUvNZoR2nbYUdxAgSbOznwxYdoVpBbbQ997AJEAoFxoyYqLDPsUwfZgO5Rc9h4nCzgSTIP4rI0HQWOBwbVbqr8T4ittTOuqI83FD1FA+ATJjykifeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778532329; c=relaxed/simple;
	bh=T+qxdqc45IgPnIcfAeNbL3svtTgjm31fyXpnPSwKacA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=La8n4FafdqYTc8rQs6+ehU/ccRhu1jXyHH+Gmx9l2NXfX/Rkkh8vZH5L9KEaN0O6bfDIpdbS10cnOS697kOJGF4A3RcFnG1NjO4Vk4GMuYchlCT854WYMzJ6lUqgsRtEJzgwxHhc66j8q4hM9WswIyRRk78fFJwV8ZABm3LzO4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sJDtgdaK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sJDtgdaK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14632C2BCB0;
	Mon, 11 May 2026 20:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778532328;
	bh=T+qxdqc45IgPnIcfAeNbL3svtTgjm31fyXpnPSwKacA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=sJDtgdaKDyiJ6J1uyZBxjcrTX6gXncwP7udOcfNhqB57L/dZbp7V2XKPwryGM7Gvy
	 1DQ8dBE9Wmi1wcg5kdxRin3Vu1j8v036kvRXcEyb6l8S/GtU1wZi18LMzm77rqe8rp
	 I008Egbx2xb4cYnq9SPl2tTv9IDreZlMV0RS8KiEbQlJyeXGFI7OaE87heZ40i8M2y
	 EbQ4A0s9q71HwBh+63oUfXtOTcpiJKEkpNR5vt70SfkxDKi72/79E3IftGKNBrl+2z
	 8a0SE3WhRO8dzGBeCj9M5e2WKGAZ8gHpynn91knS7S0VGzeQLR7k191aPHklXXtbCt
	 TWpFuDMGwUyJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/10] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
Reply-To: sashiko@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260510084303.122426-2-phucduc.bui@gmail.com>
References: <20260510084303.122426-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 20:45:27 +0000
Message-Id: <20260511204528.14632C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The schema fails to enforce the mandatory SPU clock for the r8a774=
0 hardware variant, and the example provides a functionally broken configur=
ation.
- [Medium] Mismatch between strictly positional `clocks` descriptions and u=
nordered `clock-names`, combined with missing `clock-names` enforcement.
--

commit 3adcf4902a5e62b71566ef5381f002fd5338a399
Author: bui duc phuc <phucduc.bui@gmail.com>

    ASoC: dt-bindings: renesas,fsi: add support multiple clocks

This commit updates the FSI bindings to support multiple clocks to properly
describe the hardware clock tree. It adds the SPU bus/bridge clock required
for the r8a7740 SoC, as well as definitions for functional clocks, internal
dividers, and external clock inputs.

> diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/D=
ocumentation/devicetree/bindings/sound/renesas,fsi.yaml
> index df91991699a72..c50e7115b21a0 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> @@ -38,7 +38,32 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Main FSI module clock
> +      - description: |
> +          SPU bus/bridge clock. On R8A7740, this clock must be enabled t=
o allow
> +          register access as the FSI block is connected behind the SPU b=
us.

Should we add an allOf block with an if-then condition to enforce the
presence of the SPU clock for the renesas,fsi2-r8a7740 hardware variant?

Without it, incomplete device trees might silently pass schema validation b=
ut
fail catastrophically at runtime, as the commit message notes that missing
this clock causes a system hang.

The examples section of this file demonstrates this:

    sh_fsi2: sound@fe1f0000 {
            compatible =3D "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
            ...
            clocks =3D <&mstp3_clks R8A7740_CLK_FSI>;

This example only supplies a single clock and omits both the required SPU
clock and the clock-names property, which contradicts the commit message.

> +      - description: CPG DIV6 functional clocks for FSI port A
> +      - description: CPG DIV6 functional clocks for FSI port B
> +      - description: Internal FSI dividers for port A used for audio clo=
ck generation
> +      - description: Internal FSI dividers for port B used for audio clo=
ck generation
> +      - description: External clock inputs for FSI port A provided by th=
e board
> +      - description: External clock inputs for FSI port B provided by th=
e board
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 8
> +    items:
> +      enum:
> +        - fck  # Main FSI module clock
> +        - spu  # optional SPU bus/bridge clock

Does defining clock-names with an enum correctly map sparse clocks?

Because clocks defines an items array with eight fixed descriptions, it
acts as a strict positional tuple. If a board provides the Main clock and
the icka clock but omits the optional spu clock, icka shifts to index
1. The dt-schema tooling will then incorrectly map it to the SPU descriptio=
n.

Additionally, using an enum here allows arbitrary ordering and does not
enforce uniqueItems: true.

Could we add clock-names to the required list when multiple clocks are
provided? Since it is not required, a device tree could specify multiple cl=
ocks
without names, leaving the driver unable to reliably map the phandles to th=
eir
respective internal functions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510084303.1224=
26-1-phucduc.bui@gmail.com?part=3D1
