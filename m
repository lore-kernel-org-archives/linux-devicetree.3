Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F1341A902
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 09:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528383; cv=none; b=F+zGTCd7dTV3jnHKKOLdgJO5u4y8kQ77H3WWF2DG+PX7aXcEyDuoqme9r1QivuOlfvbVfdenAFxPGxjapiAann69oJAWAw1TPj4In/H3rKVrkv/6O4CXwXmqzVnFK1m42RWXlY8oKPfDFlvUpUSWD7B5TOzAQFw6iDDgfCw0cVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528383; c=relaxed/simple;
	bh=Q0g8zGhYCK/dgZ4RNWHzeUbfl93JuzbSiyBWnsBfANU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TxdKJmghAtpQMsiL4gtrQmEQj3IuSmOzNNeNsNstR89auFCpNrR9jzCxXG2kdZYedzZfa5MZas653PALTcoAIP4RrjVri6VAGUYVSmj1bDtFKf0mTP+lst+iUIIALFZKZfR2AXsk8Ry0jH9wdBQEJcZUDxsIQdfw0p11uClWN84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5igFBKJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5igFBKJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72EC1F000E9;
	Wed, 12 Aug 2026 09:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786528382;
	bh=RO/FXaX+O4NGaSOknpyr6JjhToKSXRRbCGk8Oz6y5GQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i5igFBKJ2Cw6midt3gYJeh8yeiEDfz1Qkxeov45HE58HPB9Ubnd8ghY58f2ZuR3js
	 rMWe9LHOV8w8Bmt64OjHUu3v2pH8s7R79YNaH89P1FkEeM9kZHXevi1UOCQiYvZGiQ
	 hYHmc4BbdEFq6+lSXTtU3WOHxu8ZYKs3oaFfyiPFemYCQFCBtroehfLr+0B6HsE41V
	 rEGWEX0GX/OszEQADmevixtuZObTIs5JmNKaNA5MuPoHRNhUZFzEz+RagTLGCPODY7
	 kcpVozcRDgS0ZJ5nQ4plq2qgzjWbpoIPh2jyvRk3VAKPtBIHItEK5IdeUR/HedmOXL
	 5kAcQBtmUgeIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: pwm: Convert TI PWM Subsystem to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eduard Bostina" <egbostina@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260812094420.1057067-1-egbostina@gmail.com>
References: <20260812094420.1057067-1-egbostina@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 09:53:01 +0000
Message-Id: <20260812095301.C72EC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added YAML binding example contains child nodes (ECAP, EQ=
EP, and EHRPWM) that omit mandatory properties required by their respective=
 device tree schemas, which will cause `make dt_binding_check` to fail.
--

--- Patch [1]: [PATCH v2] dt-bindings: pwm: Convert TI PWM Subsystem to DT =
schema ---
commit 6e7740860be9339a28d4f050268b9aad56636a0b
Author: Eduard Bostina <egbostina@gmail.com>

dt-bindings: pwm: Convert TI PWM Subsystem to DT schema

Convert the Texas Instruments SoC PWM Subsystem bindings to DT schema.=20
During the conversion, a 'counter' node was added to the allowed child
nodes list to resolve dtbs_check warnings.

Link: https://lore.kernel.org/all/2026081109d-up2208.687731-1-egbostina@gma=
il.com/

> diff --git a/Documentation/devicetree/bindings/pwm/ti,am33xx-pwmss.yaml b=
/Documentation/devicetree/bindings/pwm/ti,am33xx-pwmss.yaml
> new file mode 100644
> index 0000000000000..e2b6ae326cb58
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/ti,am33xx-pwmss.yaml

[ ... ]

> +examples:
> +  - |
> +    pwm@48300000 {
> +        compatible =3D "ti,am33xx-pwmss";
> +        reg =3D <0x48300000 0x10>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        ranges =3D <0x48300100 0x48300100 0x80>,   /* ECAP */
> +                 <0x48300180 0x48300180 0x80>,   /* EQEP */
> +                 <0x48300200 0x48300200 0x80>;   /* EHRPWM */
> +
> +        pwm@48300100 {
> +            compatible =3D "ti,am3352-ecap";
> +            #pwm-cells =3D <3>;
> +            reg =3D <0x48300100 0x80>;
> +        };
> +
> +        counter@48300180 {
> +            compatible =3D "ti,am3352-eqep";
> +            reg =3D <0x48300180 0x80>;
> +        };
> +
> +        pwm@48300200 {
> +            compatible =3D "ti,am3352-ehrpwm";
> +            #pwm-cells =3D <3>;
> +            reg =3D <0x48300200 0x80>;
> +        };

[Severity: Low]
Will this example fail dt_binding_check validation?

These child nodes omit properties that are mandatory in their respective de=
vice
tree schemas. For instance, the ECAP and EHRPWM nodes are missing clocks and
clock-names, and the EQEP node is missing clocks and interrupts.

Since dt_binding_check cross-validates examples against all existing schema=
s,
omitting these required properties will likely trigger validation errors.

> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812094420.1057=
067-1-egbostina@gmail.com?part=3D1
