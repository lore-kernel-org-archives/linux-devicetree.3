Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CED3AE19B
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 20:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782677551; cv=none; b=pmLmJprNAk8wG/F4C1K1Jc3Ay8xtFDdq0Qtserr7pY7I1/UumOay1NoqKl7E5zN108VZPHPSz8QUqLcHmCE4vZaSQa4eVSO9WgssCIFMUT3aBYwo4HcJRaXsx9fI3F+lPbUcXAcnEmIJKtp4fTF4qO7g26B3esuo6AUe1pVUicc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782677551; c=relaxed/simple;
	bh=4xKC7kl4VEBBD8vWU8qgTUqeDHIFPWkAlNhwzvI5wbk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DiRs3XoJ/cdGBKVJwUw4Jvo1rnr3b2RP4gni9pRBX1QkH4IedpmMQZIPY98sjEfXqNBIQtLhQvt7LeGw9Oh9Lb8nCLGMjKd47UIOenfq7pu5H1rOdEzcclBljn4SDsMVtux43RWR6kzztBx/ix529LDOVuIPDnk+3TyJBSIV+FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lg9snM2h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lg9snM2h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692DF1F000E9;
	Sun, 28 Jun 2026 20:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782677550;
	bh=MsSdBRrZEyNiKNLJwbzv7aPQnRv1iIjBpdaS5vjTVuI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lg9snM2hDo7D/aSlRCTkXR0kgQSNFIpVx3Aatz7bHM5ZuvfWkj6x29LRsJFJvFujl
	 CudXBcR7kltedJ69SATBLjmp9/8WOx02mmQdXUpHSMPO6DwK8z8yQ9aki2jg8a6AMC
	 GMKI+x1Tc2GzjX3Mulpgr3qjIcbDOzsprQCsVOPL+nQVW/nfDrjXg6mSWgi6T9DMzr
	 /9M584iw4q70V00BW/YBYEENaC9BqHpU0gNAExE3LgJ4wdcFy/p16wHMlDhj069fuT
	 rThHR3gHPi9NQ8xc75xp3A7bEN6nSTeZCWYNXvKH8kKb3cnBjRKZaTUvyEx62JHe6p
	 CcKRn/UhO2xtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 01/12] dt-bindings: soc: zte: Add zx297520v3 top
 clock and reset bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260628-zx29clk-v5-1-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
 <20260628-zx29clk-v5-1-79ff044e4192@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 20:12:30 +0000
Message-Id: <20260628201230.692DF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `syscon-reboot` node example omits the `value` property and us=
es `mask` alone, triggering a deprecated legacy fallback in the driver that=
 overwrites the entire register.
- [Low] The child node is explicitly named `syscon-reboot`, violating the D=
evicetree Specification for generic node names.
--

commit fc119f64e363e1f9ec8efce39f051382b3c78be5
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

dt-bindings: soc: zte: Add zx297520v3 top clock and reset bindings

This commit introduces device tree bindings for the Zte zx297520v3 SoC top
clock and reset controller. It defines the yaml schema for the controller,
including clocks, resets, and a syscon-reboot child node. It also adds the
corresponding clock and reset header definitions.

> diff --git a/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-top=
crm.yaml b/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-topcrm.=
yaml
> new file mode 100644
> index 0000000000000..6baab5c98d25e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-topcrm.yaml
> @@ -0,0 +1,85 @@
[ ... ]
> +  "#reset-cells":
> +    const: 1
> +
> +  syscon-reboot:

[Severity: Low]
Does this child node name violate the Devicetree Specification for generic
node names? By explicitly restricting the node name to syscon-reboot,
validating a device tree that uses the standard generic name reboot will
fail since additional properties are not allowed. Could this be renamed to
match the generic class of the device?

> +    type: object
> +    $ref: /schemas/power/reset/syscon-reboot.yaml#
> +    description:
> +      Reboot method for the SoC.
> +
> +required:
[ ... ]
> +        #clock-cells =3D <1>;
> +        #reset-cells =3D <1>;
> +
> +        syscon-reboot {
> +          compatible =3D "syscon-reboot";
> +          offset =3D <0x0>;
> +          mask =3D <0x1>;

[Severity: High]
Is it intentional to omit the value property in this example?

In drivers/power/reset/syscon-reboot.c, if the value property is omitted,
the driver interprets mask as the legacy value and forces the actual update
mask to 0xffffffff. When a reboot is requested, it executes
regmap_update_bits(map, 0x0, 0xffffffff, 0x1), which clears all bits except
bit 0.

Since the topcrm register at offset 0x0 controls core clocks and resets,
would overwriting the entire register hang the system ungracefully before
the reboot can proceed? Adding the value property would ensure the mask
operates as intended.

> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628-zx29clk-v5=
-0-79ff044e4192@gmail.com?part=3D1
