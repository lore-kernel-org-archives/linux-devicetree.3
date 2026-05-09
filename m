Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9371C695
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 06:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778308704; cv=none; b=X7QE3Mc67Sa01jWrX+81V3+P9KEW1eVBSKjV0NwLKSe059IRVk/8t031YXq5yPfwlAgrElr/w+lrINrq2oNz7C2J1Kd2kEkvdRvvUvosfqQRPxGKO4v5q9y9Cey2ypJLqSZqKUQR0ElIhHw56juhyKZ1jnUUfl1UD8A9d1UBIk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778308704; c=relaxed/simple;
	bh=HPZ0GWpgMn1NADsXdWHMnZpVDr0M5Te9ILPTZQBmsaw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RJN02ABjM5HFRtLcdm0hUhfnvMSPr4askuZcUFQG793rCcfLRG92JD2jItRrgLtADQP42baCCOU4pSyfCwxW8D45eAQKMkjx8nzR0jFKl3ZRULOBCKKlZChApA36I26BjfFfery0I2tMgjZEHuZ0Nycf4xObp9BTdRIibq6CD70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ed3MRk3a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ed3MRk3a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BBCEC2BCB2;
	Sat,  9 May 2026 06:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778308704;
	bh=HPZ0GWpgMn1NADsXdWHMnZpVDr0M5Te9ILPTZQBmsaw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Ed3MRk3aEwoiksmKCrdqK0eoSlFHe3BhsSZgSwjzg102TkoSgguHkkBm201KSmVJP
	 Rahi21JjOOC/t5wAbSAgxI8PlMq3fE66AiegjQpXzb7/L0yZddUXLHutTA8v3eetug
	 uhrkwtmuSDIE6vO0eqDGzMmr2NZ3evkYvr7x6sPf35Cd8YTLCzWYJOquRCsyC1Ifan
	 If38GiFmuLsYI0y/MiMF74Z8cCbF1SlWIYA5qe2Edg354DHujzmITKaJXbfVbFrsq4
	 FqdmoMJ5rKCO1qdDzHNOCi9lTd9BHw3vWsR3VSDgVsyfpUwAJrLg+us4xqekKov+vC
	 8PvyZsB15gwOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] scsi: ufs: dt-bindings: starfive: Add UFS Host
 Controller for JHB100 soc
Reply-To: sashiko@lists.linux.dev
To: "Minda Chen" <minda.chen@starfivetech.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260509062759.125472-2-minda.chen@starfivetech.com>
References: <20260509062759.125472-2-minda.chen@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 06:38:23 +0000
Message-Id: <20260509063824.4BBCEC2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Missing `clock-names` in the `required` list.
- [Low] Unconstrained `starfive,syscon` property allows invalid array lengt=
hs and arguments.
- [Low] The example section uses the deprecated `freq-table-hz` property.
--

commit dcb3253ccedb17e87bb1f204ca98535c01e219f6
Author: Minda Chen <minda.chen@starfivetech.com>

scsi: ufs: dt-bindings: starfive: Add UFS Host Controller for JHB100 soc

This commit adds the devicetree binding documentation for the StarFive JHB1=
00
SoC UFS Host Controller, based on the Synopsys DesignWare IP.

> diff --git a/Documentation/devicetree/bindings/ufs/starfive,jhb100-ufs.ya=
ml b/Documentation/devicetree/bindings/ufs/starfive,jhb100-ufs.yaml
> new file mode 100644
> index 0000000000000..4773f1c2670f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ufs/starfive,jhb100-ufs.yaml
[ ... ]
> +  starfive,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      The phandle to System Register Controller syscon node.

The starfive,syscon property is defined as a phandle-array, but should this
include an items or maxItems constraint? Since the example uses a bare
phandle, would it be better typed as just
/schemas/types.yaml#/definitions/phandle to prevent passing arrays of
arbitrary lengths during schema validation?

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - reset-names
> +  - interrupts
> +  - starfive,syscon

Is there a missing entry for clock-names in this list? The binding
mandates the clocks property and defines 'ref_clk' and 'ufs', so omitting
clock-names here allows device trees to define clocks without names and
still pass validation, potentially failing during driver lookup.

[ ... ]
> +examples:
> +  - |
> +    ufs@11b10000 {
> +        compatible =3D "starfive,jhb100-ufs";
> +        reg =3D <0x11b10000 0x20000>;
> +        interrupts =3D <105>;
> +        clocks =3D <&syscrg 4>,
> +                 <&syscrg 5>;
> +        clock-names =3D "ref_clk", "ufs";
> +        freq-table-hz =3D <26000000 26000000>,
> +                        <100000000 100000000>;

This isn't a bug, but does this example need to use freq-table-hz? The
common schema ufs-common.yaml included via $ref marks this property as
deprecated in favor of operating-points-v2. Using it in a new example
might encourage copying deprecated patterns into downstream device trees.

> +        resets =3D <&syscrg 10>,
> +                 <&syscrg 7>;
> +        reset-names =3D "main", "phy";
> +        starfive,syscon =3D <&syscon>;
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509062759.1254=
72-1-minda.chen@starfivetech.com?part=3D1
