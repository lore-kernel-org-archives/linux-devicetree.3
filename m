Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB16736B067
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789612540; cv=none; b=OCwv0UIVs6tYkjfOMA2GZ6mk9qmTDaek6zBbB/0kDDTiO3XxEo9vKKvXv3/fflj4o3m1pC+H/Du5wOARk1NvZczb0noFUPLVzr3TBsLJxTWbxNGY+Z93GDr3Orc/2RX8XABqiHJXgDZgAF7A7CjfThpNLNM2aRXa30TzjHjsgdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789612540; c=relaxed/simple;
	bh=gwsr1gzbeGkXk2531E0cQkeayNPxYaEcnBS8LDNIpsA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dboqTmTuQBvSx3biA99wweVEOWZn2z4P/uhDpQ037E/yJVzWofbR/MY7KPFSxoR6kqaEDe0CPxuiIqMhMCnxXDmIxkJW+OSmSz3ttyIAWNS4/1m31+Nt01bc7eyYCPoXBAUhvEMik9k4mJYON7Ar1bGa9vH6zbhxDKb43nR8BYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KIP94U7/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KIP94U7/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A528E1F000FF;
	Thu, 17 Sep 2026 02:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789612519;
	bh=L1+17U7y4f24tuNF6EL0YiQf0V5vPNU3EowMaAmyPP4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KIP94U7/Rvjsau52CmWXseM6S7beHDIbWWY12pTNeVy7DZZ9QKBcTGnj1gPuMEe68
	 OJJ6saIXYDdFkyvfJCyQl67voa5bTAi11ksytHzCeAIaV3A341AM1WL4DOuYUMhiE+
	 8P4+0Vpa2A2FL+zbKO/BlA2/pYHJBDXqrJ6YfjL+kpal2GNWcfW6mP4XrbCWu3WM7s
	 v1WM5KpoZ5VMf5AGjKoZLGThYgmcCSj4oCaSSvlnAPVr9GkMf0UPGhxbmPxUrTiol8
	 kIWBr7Ke5q3oPLDGehYqf3PV4T/NsJKCyi8yykg2/2kEusVeB/i0vEii6gHZGs9+Aa
	 e1iiSqINg4cIA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH bluetooth-next 2/3] dt-bindings: net: bluetooth: Add
 AIC8800D80
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yanli Yang" <yanli.yang@bedmex.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <178954773705.2.9742714830438825480@bedmex.com>
References: <178954773705.2.3446471521233620446@bedmex.com>
 <178954773705.2.9742714830438825480@bedmex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 02:35:19 +0000
Message-Id: <20260917023519.A528E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: schema validation failure due to scalar const on reg a=
rray
--

commit 5a068ab01e12921fd595c8f96d78f55f50333071
Author: Yanli Yang <yanli.yang@bedmex.com>
Subject: dt-bindings: net: bluetooth: Add AIC8800D80

This commit describes the AIC8800D80 Bluetooth SDIO firmware-loading functi=
on
and UART HCI interface. It links the UART node to its SDIO firmware provider
using the aic,firmware-sdio phandle and includes an example configuration.

> diff --git a/Documentation/devicetree/bindings/net/bluetooth/aic,aic8800d=
80-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/aic,aic8800d80=
-bt.yaml
> new file mode 100644
> index 0000000000000..6fabb226cf15c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/bluetooth/aic,aic8800d80-bt.y=
aml
[ ... ]
> +allOf:
> +  - $ref: bluetooth-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          const: aic,aic8800d80-bt-sdio
> +    then:
> +      properties:
> +        reg:
> +          const: 1

[Severity: Low]
Does this scalar constraint cause a schema validation failure?

In the allOf.if.then.properties.reg block for the SDIO variant, the reg
property is constrained with a scalar integer const: 1. The reg property
in Device Tree schemas is intrinsically evaluated by dt-schema as a
matrix/array of integers (e.g., reg =3D <1> becomes [[1]]).

Because of this, JSON Schema validation compares the array [[1]] against
the scalar 1, resulting in a type mismatch and validation failure when
running make dt_binding_check against the example or valid device trees.

> +        max-speed: false
> +        aic,firmware-sdio: false
> +      required:
> +        - reg
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/178954773705.2.3446=
471521233620446@bedmex.com?part=3D2
