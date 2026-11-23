Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409909;
	b=s7jLLi/JvsNXfFqwZlmtvZp3vS+OsR3tQogjkxbiogGXNAcMHQHL1jFZegQvEVc2AwRo
	 S2wpTcPLZR2t9znNV2X2eeU31RUpOqJNIFdZPE6fiaR6eaD3uZyLiGxKMOwSXmHHnsFDC
	 vi3e2iITC70WRIFe0rVebJAdDL6aC6WueLrEG4rOKqt6MEWbkLnXVtEU8j1Lsw59EKacE
	 vPN9j5xFQbU0StHeNYRWpcMWXu6TotEU9TOGu3Xl8ywL4vGH8i7OOVywhda9gwADCL0hx
	 JqRj9uCkD0GYVQudUd5WACXJvofHHSt2ziNg+TPayKeCG12KBmDObY0JG1pcWZcJbtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409909;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ErjJv2K6xm9QqgJc1sHYA6FLYGoIneiOJt+feJDJcsY=;
	b=uvwaj9CzTh4l5z2etjshhQwg/T5V4OHToOdgRgFqX29aYhdoZLl0AhkknzWfJ9HPa3lC
	 3AYUbjdtM6R3wLZcD6zX+sbt7RyWkmOmMFkyl5U4dnKLS6wwQ5IEpvXHZe8WJgbDit17C
	 1y+0ECDk9v5M9TTfPircpezb+Ea+1ZaFYIgWOlFA44hFV8ya4YtGR57JOJPbIGgIIrCPX
	 zoeq6dPTw/LqYLjJXE9rWsp9vZK/egydU+eF+YbOtxwwko8n8ANLTAokPz47ievV9qgHF
	 /xOl+nywvhRiz37vOWahF0IKrljERI7ntsyd5iyaMQs/Q6ULaE1cWwuPr3i8+r20xzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LIt+JJm5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A021606A333
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 04:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LIt+JJm5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880031F000E6;
	Mon, 23 Nov 2026 04:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795409908;
	bh=ErjJv2K6xm9QqgJc1sHYA6FLYGoIneiOJt+feJDJcsY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LIt+JJm5tyHVKe20qnFdzfj3jMj5Qp3YGPnOpMRO2ggdtzbUPVxjfe48WayX8wcGW
	 DrC3DRjhoe8H8VO7VdQA8VPF6S5SAZuXyWZdX+PeeyaiZIbCT7Pd5lHaMFIKFjf9bI
	 Q/iuQuvOF/y189rpxVEQEsfak7yoq8jOnWhZiVNl22VJkymYRdz1ZH+pzKgYLYGtGi
	 TgzVLJD0GhGDH7drvWb2QI4r6b+gUc4xa21IsejSS6zmR2zGZGZqUs0O4t7L8L/Thu
	 8h2GPlb1lXKmjjaA7p0XZQowDRmg08lFaEviG7YPWmoksJdcR0WzM/8EYpyQHerkml
	 ZmzITKN2cvv2A==
Message-ID: <sashiko-outbox-228684@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: Add Cortina Systems CS7542 I2C
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-cs75xx-i2c-v6-1-2504375e4342@gmail.com>
References: <20261123-cs75xx-i2c-v6-0-2504375e4342@gmail.com>
 <20261123-cs75xx-i2c-v6-1-2504375e4342@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 04:58:28 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: i2c: interrupts listed before clocks in
  cortina,cs7542-i2c.yaml
--

commit 2fe89284bfed82e40564040b3c63c7382a98c845
Author: Fil Dunsky <filipp.dunsky@gmail.com>

dt-bindings: i2c: Add Cortina Systems CS7542 I2C controller

This commit adds the Device Tree binding schema for the Cortina Systems
CS75xx I2C ("Bi-Wire") controller.

> diff --git a/Documentation/devicetree/bindings/i2c/cortina,cs7542-i2c.yam=
l b/Documentation/devicetree/bindings/i2c/cortina,cs7542-i2c.yaml
> new file mode 100644
> index 0000000000000..095e24379a784
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/cortina,cs7542-i2c.yaml
> @@ -0,0 +1,56 @@

[ ... ]

> +properties:
> +  compatible:
> +    const: cortina,cs7542-i2c
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    maximum: 400000
> +    default: 100000
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c@f00700e8 {
> +        compatible =3D "cortina,cs7542-i2c";
> +        reg =3D <0xf00700e8 0x28>;
> +        interrupt-parent =3D <&intc>;
> +        interrupts =3D <11>;
> +        clocks =3D <&apb_clk>;

[Severity: Low]
This isn't a bug, but could clocks be placed before interrupts in propertie=
s,
required, and the example node to follow the standard DT binding property
ordering (compatible, reg, clocks, interrupts)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-cs75xx-i2c=
-v6-0-2504375e4342@gmail.com?part=3D1
