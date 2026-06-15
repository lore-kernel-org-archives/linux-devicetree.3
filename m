Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E6F30B535
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781519898; cv=none; b=GGU7Eed+XbruGEcui9HbKtUUKDYRolKGuAqVuAQf0Bk65jzVP0lQld8smbcZGpIeg6V9rJfLeRraGZ17aWbRDVpv6Wox/Hi/05fT7/qI5bq/qZvyE6E+CbijPjBX2Ck32BZDpLxqJBQV10h28Jt8SW0jJ3VLmSx7hLifcQi7gZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781519898; c=relaxed/simple;
	bh=8EAq9zGqyxkMlQji2jT5t9DuN0ac+jap38+O+BZ53Js=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JSUEdUn8Cn+XQ+yf/AJPWh/lc4arbT7LvuyGRc92+Fd80ATvUo3X1CF54StZX/8zveffqiDOkOF02pBmg8e/CDTHSaXQ82OL9Qd3xctNI2RSGrrz/nLr+gGO9QQyZOVtZeZKwX4wjDoITlZyVFrJb5oJtWeEuM/ZC878RgUUpbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=euRR8cX0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="euRR8cX0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D2E1F000E9;
	Mon, 15 Jun 2026 10:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781519897;
	bh=0bebpC6jtPJzSoOPJBkBlyWIpJRnrZKL+UpidTuiu4U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=euRR8cX0H3h6wxwmf2Z4ZM9KoZ7TKOUJFAu4GvPFJhN+55Vvm0DnisWPvd7J0BZbu
	 FyWvyZPyjTwOySv/gXG/lqJISZD8g/q4+4LUhUrbESjpEbzefFmdDZzsNXlzXsn88i
	 2zcWewlA1flK2iGPE8i+lwb2Fsy/vbDwt6LuAZtKVCcNb28VFdAoHB/Rhz1N6cLeDt
	 BlS81fkzp3rCTYDGQ3KaoTM1WJQoe3cUQJU16QCI9XsIEu0lXcNDPtn3fkUiyf14x9
	 cEjhPyP0QjOI0oHsO2oQoLmcV2NLX4ibVTcVZzeO5qFBT8eKgMSQEZ7gx5JN1RgHbr
	 fs3GJStj1vbXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: serial: maxim,max310x: describe
 per-channel rs485 subnodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tapio Reijonen" <tapio.reijonen@vaisala.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260615-b4-max310x-rs485-dt-v3-2-7e79f064bdd7@vaisala.com>
References: <20260615-b4-max310x-rs485-dt-v3-2-7e79f064bdd7@vaisala.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 10:38:16 +0000
Message-Id: <20260615103817.43D2E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Schema backward compatibility break for legacy multi-channel dev=
ice trees by removing $refs to serial/rs485 schemas at the chip level.
--

commit d832a7d0f42d71a0c331f81efe607eabea305da1
Author: Tapio Reijonen <tapio.reijonen@vaisala.com>

dt-bindings: serial: maxim,max310x: describe per-channel rs485 subnodes

This commit splits the binding for the MAX310x UART family, introducing
per-channel child nodes for multi-channel parts while keeping single-channel
parts as serial nodes. It removes the top-level serial and RS-485 references
and conditionally maps them based on the compatible string.

> diff --git a/Documentation/devicetree/bindings/serial/maxim,max310x.yaml =
b/Documentation/devicetree/bindings/serial/maxim,max310x.yaml
> index 889eeaca64a02..e598dda4d13f5 100644
> --- a/Documentation/devicetree/bindings/serial/maxim,max310x.yaml
> +++ b/Documentation/devicetree/bindings/serial/maxim,max310x.yaml
[ ... ]
> @@ -49,8 +56,55 @@ required:
> =20
>  allOf:
>    - $ref: /schemas/spi/spi-peripheral-props.yaml#
> -  - $ref: /schemas/serial/serial.yaml#
> -  - $ref: /schemas/serial/rs485.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - maxim,max3107
> +              - maxim,max3108
> +    then:
> +      allOf:
> +        - $ref: /schemas/serial/serial.yaml#
> +        - $ref: /schemas/serial/rs485.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - maxim,max3109
> +              - maxim,max14830
> +    then:
> +      properties:

[Severity: Medium]
The commit message notes that existing users are unaffected because the dri=
ver
still reads chip-level RS-485 for single-channel and legacy device trees.

However, does this change break schema validation for legacy multi-channel
device trees?

By removing the top-level references to serial.yaml and rs485.yaml for
multi-channel parts, and because the binding uses unevaluatedProperties: fa=
lse
at the top level, any legacy multi-channel device trees that still declare
serial or RS-485 properties at the chip level will now trigger unevaluated
property validation errors during dtbs_check.

Could we retain the top-level references for multi-channel parts, perhaps w=
ith
a deprecation note, to preserve ABI backward compatibility for existing dev=
ice
trees?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-b4-max310x=
-rs485-dt-v3-0-7e79f064bdd7@vaisala.com?part=3D2
