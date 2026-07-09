Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D693F39EF
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586338; cv=none; b=dozvE708bRu2WfhZfjn+H0HwSA1X7T4K4KpM0L6hSpzmKVDo3cBFFPA7ClEi9Esm2xZLr453x8IzUW1smnrLgAJBtKy3v082R/3RraXIkK5QKs4izXn0vTHK2On1FoFOmFTZFe3cq031hUTG8eMlpsy4ty2XVRF22bNEUBPtLYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586338; c=relaxed/simple;
	bh=fVx4GI8GO2fkLh9rRxWtaeQfXDTwTiOGYVXXhZvsye0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PnEkFsBGdCqYvUJbhxSsrNkr0KpobUCy/1pH2BmGgGpayfZev/Bwn78ksotWgx8Whrbc8ALRFtXxVsUNAH6dDbvug94lYz5+C1g0TJ6beaqmMbL8XEvA+R+VCCSnbvbC8kzUkuBGHxgTWNcJmtiweSkYrU42KSaCxWEK6PGEZm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYjfESAD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYjfESAD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526261F000E9;
	Thu,  9 Jul 2026 08:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783586331;
	bh=fHlLr5GZV8B3XkHYfrJRVxt4h/bZyWQDrkRCQkdlRNU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iYjfESADbBtYR3whSuduKiJO840ZxLYzO/8h+aWecHRWwlDBQkRdtA4xlexRQzL2G
	 oEXgt5PwIOMui4Y79mrYTDtQjGO39UzOwTpsRC6PVKR4/NzRDypAnavmATKuuKZHrM
	 b1aRyBk+QF0w6AMqGdt9NCP2u2tBgLsyz0EJZSGVUzQV9r2jmpd4ehcm8W4DxShoB8
	 +6PLlfbpb22GbftvXl+QdS4ajAWiq2pgIe6wVHntUpD2xQPytKSTmTbLQcts5tyaQH
	 0mk7ffivy9r+gxAO2Yrfqw+dHYd9OTY2+q9yrZDHKFsghlWmrnR1gCfaH3ZoWN3WrF
	 4k9XeajM17e3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/9] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
 Document RZ/G3L support
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260709083108.108370-2-biju.das.jz@bp.renesas.com>
References: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
 <20260709083108.108370-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 08:38:50 +0000
Message-Id: <20260709083851.526261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added `regulators` object node is missing the `additional=
Properties: false` constraint. This omission permits arbitrary undocumented=
 or misspelled properties within the `regulators` node to silently bypass d=
evicetree schema validation.
--

--- Patch [1]: [PATCH v4 1/9] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl=
: Document RZ/G3L support ---
commit 0d58c252d092486ce47b52a5876e30094131aee2
Author: Biju Das <biju.das.jz@bp.renesas.com>

dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support

This commit documents the Renesas RZ/G3L USB PHY controller bindings. It
introduces a regulators sub-node to handle per-port vbus0 and vbus1 entries
for the RZ/G3L, which has an OTG controller per port.

> diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy=
-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-c=
trl.yaml
> index c83469a1b379a..06e003218d2a8 100644
> --- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.y=
aml
[ ... ]
> @@ -50,6 +53,28 @@ properties:
>      $ref: /schemas/regulator/regulator.yaml#
>      unevaluatedProperties: false
> =20
> +  regulators:
> +    type: object
> +    description:
> +      list of vbus regulators provided by this controller.
> +

[Severity: Low]
Does this new regulators object need an additionalProperties: false
constraint? Without it, arbitrary undocumented or misspelled properties
within the regulators node might silently bypass devicetree schema validati=
on.

> +    properties:
> +      vbus0:
> +        type: object
> +        description: Port 1 USB VBUS regulator
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709083108.1083=
70-1-biju.das.jz@bp.renesas.com?part=3D1
