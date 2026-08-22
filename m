Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D646397E91
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 16:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787417145; cv=none; b=AU4OB1mqnlq4p3W0Y229Gf8mzRjaHeVyXNmyB8G65+iq3ym8ql+MYOQN318tRO11I9W4vkIDokOYFYG4MFAv5D7Jsj53KBnVeGSKdPA7YjVRvUbV9pa9AvB35bp3JD/Qf52fNi6msZm+fBnJpbwPQ6sR8I8vik2pQWsHe7YPoXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787417145; c=relaxed/simple;
	bh=CL/Et4OPXf2YufkiSsXjw/Njsx+qhli+NhnUYvd/klM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BXsRpKrBn0JftmER85z1ae/tfj2DvFczXxBfNXQ2hC8qALraB3FDsIatZbzA3zN2nhV23Nq6DIE+I/H7dKoDWKix/vAeDgsyulceG1D2cBz1xw/rqRZSvuLo6UDR52+iVXuU3NqgxF6FRI9ZHeLo5Y0BKRkQFwg0VpF5tnMXWck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFV6GXPD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFV6GXPD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA13A1F000E9;
	Sat, 22 Aug 2026 16:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787417143;
	bh=kZKAq+lu6L5miSh6YV1VL1hMdRQdCrVBRjKGOF9kJos=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EFV6GXPDkrpzMTs9Q1JlQepISVO8CHa8W4pVS0O87aTjmRavTrTE9hn27A0ghIlNz
	 /rOtJuIboAQ8gdXxjBxGc9o3YS9l17BWnQu4ZcAxhF7A36Jb3ybRXT9rUl3HyiRhVa
	 5zPs7riR7tkvQbtkCzGliGewo+34m9cIyZcEVMNXcS0Mc+9bwlZXZEwIOSxO/okaQv
	 Y0JILT6ZuO+W2FK1WO/wifLxSEMdsjQYwb4/Vjev8fuJhpmohYhKmsaJ4o5qp/A1YA
	 7PsOmt2joof98PUUzQrCcLkAIURfYA4XeaSypw2I5kxArRPEnChnJG1FXRoUgoc62E
	 //JrCvTyleMZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: pinctrl: ti,pinctrl-palmas: Convert to
 DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260822-ti-pinctrl-palmas-v3-1-f92cd3b773fd@gmail.com>
References: <20260822-ti-pinctrl-palmas-v3-1-f92cd3b773fd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Aug 2026 16:45:42 +0000
Message-Id: <20260822164542.CA13A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree example fails to compile due to an unresolved phand=
le reference (`<&palmas_pins_state>`), and the schema incorrectly uses `add=
itionalProperties: false` on the pinmux grouping node which rejects implici=
t `phandle` properties.
--

--- Patch [1]: [PATCH v3] dt-bindings: pinctrl: ti,pinctrl-palmas: Convert =
to DT schema ---
commit 5e382403a7463503a0f735f4070a541aa9a42807
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: pinctrl: ti,pinctrl-palmas: Convert to DT schema

Convert TI Palmas pin control text binding to DT schema. The legacy binding
allowed any subnode name. This restricts them to standard prefixes to preve=
nt
the validator from accidentally evaluating standard integer properties as c=
hild
nodes.

Link to v2: https://patch.msgid.link/20260822-ti-pinctrl-palmas-v2-1-501c9c=
670e4f@gmail.com
Link to v1: https://lore.kernel.org/r/20260822-ti-pinctrl-palmas-v1-1-a4d49=
e7f2dab@gmail.com

> diff --git a/Documentation/devicetree/bindings/pinctrl/ti,palmas-pinctrl.=
yaml b/Documentation/devicetree/bindings/pinctrl/ti,palmas-pinctrl.yaml
> new file mode 100644
> index 0000000000000..11c2d429633cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/ti,palmas-pinctrl.yaml
> @@ -0,0 +1,170 @@
[ ... ]
> +patternProperties:
> +  '^(pinmux|pins?-[a-z0-9-]+)$':
> +    type: object
> +    additionalProperties: false

[Severity: Low]
Will this additionalProperties: false cause schema validation failures if t=
he
node is referenced via a phandle label?

Using a label generates an implicit phandle property during dtc compilation,
which additionalProperties: false typically rejects.

[ ... ]
> +examples:
> +  - |
> +    pmic {
> +        pinctrl {
> +            compatible =3D "ti,tps65913-pinctrl";
> +            ti,palmas-enable-dvfs1;
> +            pinctrl-names =3D "default";
> +            pinctrl-0 =3D <&palmas_pins_state>;
> +
> +            pinmux {

[Severity: Low]
Does this example fail to compile with make dt_binding_check?

The pinctrl-0 property references &palmas_pins_state, but the
palmas_pins_state: label appears to be missing from the pinmux node here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260822-ti-pinctrl=
-palmas-v3-1-f92cd3b773fd@gmail.com?part=3D1
