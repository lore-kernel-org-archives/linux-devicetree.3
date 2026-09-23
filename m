Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2734244A3F2
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148357; cv=none; b=ofLzxi9mTQF3daLnc7WY+th7rP3BgZcYVI3mFluZxp37CpBJTRfkoz5oIVEI6iCLPmdCzIqx0q9pNxuAiGXwd4K5UdeC/EwDEqn/FiG7rBB9qwBzQavZs06JntUMuLG7WKoF7vNxpGLKYnkvvYiHq86yCPPDUxrOzY7L01kETFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148357; c=relaxed/simple;
	bh=IG0tDlOdIilC5op6vKZ7ogi0oByZXFXyNeG1ChOM8zc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b0B6i5J3+bPhnhtbvR9rXEoCT4cLQn+brM7oyP8VK0G1Wmp1Q3O7/Uc8OOaPzCdMnti2iBDcdaP15ByGk2gXjYj9JiXlioOpeoHCNpuy6aker8V15Z7Nj9bJPTMsoqUOojJWEgUKIIkEInvqcSrnnM1dRHSJmTWdkT7+1rxFCW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYvdqLfp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYvdqLfp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9D51F000FF;
	Wed, 23 Sep 2026 07:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790148355;
	bh=n3xfmK5m72MTQtMVaGt4iS8CIq7EFeRjsDN6c5/M5Yo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CYvdqLfpkVXAYNcHTGYx7b7vaSMhO9J6pOOitpQZg9VorLNbvG3PljUny5D4Jplwx
	 m+Liu2zD0jcRcYuW/Wxsa2/ctRJL77M0d5akS8PsOZw7u08Zrl3gv+Uqv0dS5/41t1
	 +T3v/TtUvsBGNqpAyLluLEedLAYO/udewM8/3foqJ22lC+KwI8xWRTztWDlVMT0VeO
	 kAFTAyODty4ztaKis+NBznsIPId5ZGCc/4xboG3ZQcPGZ1VGGt+xxJaIfBOAlogDOL
	 KLlTuixfwxaWNSiv2T40DUb0XDHGDKuOw9amDCMROGfi0hkGjyAtCZnnkTRNd696oS
	 5AbcqO231+VDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Yeong" <joshua.yeong@starfivetech.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260923070014.1340761-2-joshua.yeong@starfivetech.com>
References: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
 <20260923070014.1340761-2-joshua.yeong@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 07:25:55 +0000
Message-Id: <20260923072555.8F9D51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: non-standard voltage-domains property bypasses regu=
lator core
--

commit cdb8b44dd04ecd7ad4b4433307fcafbb4c92ff48
Author: Joshua Yeong <joshua.yeong@starfivetech.com>

dt-bindings: regulator: Add RPMI voltage service bindings

This commit adds device tree bindings for the RISC-V Platform Management
Interface (RPMI) voltage service group. It includes definitions for both the
supervisor-facing regulator controller and the SBI MPXY channel.

> diff --git a/Documentation/devicetree/bindings/regulator/riscv,rpmi-volta=
ge.yaml b/Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.ya=
ml
> new file mode 100644
> index 0000000000000..6334ebd31dc8c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml

[ ... ]

> +description: |

[ ... ]

> +  A consumer names a domain in one of two ways. The first is through a
> +  "<name>-supply" phandle to a child of the optional "regulators" contai=
ner,
> +  whose "reg" is the domain's RPMI DOMAIN_ID. The second needs no child =
with
> +  "#voltage-domain-cells" on the provider, a consumer lists
> +  "voltage-domains =3D <&provider DOMAIN_ID>" and names each entry in
> +  "voltage-domain-names", the way it names a voltage power domain. Both
> +  properties belong to the consumer, so a consumer binding describes them
> +  itself:

[Severity: Medium]
Does this custom voltage-domains property fragment the generic device tree
regulator subsystem architecture?

The standard regulator framework strictly expects consumers to link via
<name>-supply =3D <&phandle> for hardware-agnostic interactions. By advising
downstream consumers to adopt a voltage-domains paradigm in this description
block, the binding subverts the core subsystem. This would force consumers
to rely on bespoke driver APIs instead of standard generic regulator
interactions.

[ ... ]

> +properties:
> +  compatible:
> +    description:
> +      Intended for use by the supervisor software.
> +    const: riscv,rpmi-voltage
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      Mailbox channel of the underlying RPMI transport or SBI message pr=
oxy channel.
> +
> +  "#voltage-domain-cells":
> +    const: 1
> +    description:
> +      Lets a consumer name a domain by its RPMI DOMAIN_ID, the single ce=
ll of
> +      a "voltage-domains" entry, without a child node for the domain.

[Severity: Medium]
Is it safe to redefine how consumers link to regulator providers using this
non-standard property?

This establishes the alternative linkage paradigm mentioned above, which the
core regulator subsystem cannot parse natively.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923070014.1340=
761-2-joshua.yeong@starfivetech.com?part=3D1
