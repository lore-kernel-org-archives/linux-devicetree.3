Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4766244E64F
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 12:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834983; cv=none; b=MA4Nh2/FuSkFxY1SZM4qUaD/2ehB4jeTZBLp8eZCepcZypZjbv5W7j/p3gsQvNH79gR50neSvO21wWbKnJtgvLb6JUZAA9oZX0h6gzBVBE59IyITe2DJpS7fnPnyqrNV+aL0bBP4oUs5DeO0xaDPoq3ePfoFwlJsSbjLJQiLwEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834983; c=relaxed/simple;
	bh=F7TRTWfZ42hqEM3QtSa1J7R4+L8/JvzLsY3vD/m7H3w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rzZ294NFOOhY/oZEPZu88wSraFrVXWbEfJ2hvGh9uBEZWa7Q2iZZO9GJHORlfoK7/H4WLtkY26i+Ff8dnJR2b9axHORhwuYf8gxJKt0tGvmGvPcFlplgfjp6Hjcz4G1CqRYhAi0PovgsjJcRHV1hvrjKU+hmgbcfqJ77cypOLdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9WucC2T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9WucC2T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316241F00A3E;
	Thu, 27 Aug 2026 12:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787834949;
	bh=rhLu0hT2foiRZMxAwJzmsjbnm62+DhB3DXnQKSP3wA0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f9WucC2T8Iwe9fHI/xsNqKzAk9po+YaNs4S06NfQH/STNzIRV7eGRTq3IqaC5XxNc
	 OCeri5ZPjQ5dA/h/wwyUdIiIFEvsAtpc47rbZDmYXtx0pqCeMH/wsRapTVvHz94FER
	 buG6pHkJr+zwmyMigJuE5W17s3tmuSGK8EYSBgrG4q0J19h+byOtWZmmHKwA97/lD6
	 Rc89Gmj2A8Qlcmz9twmcRo1Bv/jzcoyrFiWLIWDg7rM7RCAUtHshJuUQIckUKOIHtH
	 7a5EXtZp/sBeQfTv4fSL5KaSghzfQXkMI2FR0EK74qeyI8oV7QCKFlyHj0S5RFUoVw
	 d0OtN5jKh22Fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: dp83867: add binding for
 output-impedance
Reply-To: sashiko-reviews@lists.linux.dev
To: "Steffen Trumtrar" <s.trumtrar@pengutronix.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260826-v7-2-topic-dp83867-v2-2-a97b4cec6e93@pengutronix.de>
References: <20260826-v7-2-topic-dp83867-v2-0-a97b4cec6e93@pengutronix.de>
 <20260826-v7-2-topic-dp83867-v2-2-a97b4cec6e93@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 12:49:08 +0000
Message-Id: <20260827124909.316241F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The property `ti,output-impedance-ohms` expects a register value=
 (0-31) instead of an actual resistance in ohms, violating standard devicet=
ree unit suffix rules.
--

commit baf7480d85f53a0dc882f36f231a4b891961b193
Author: Steffen Trumtrar <s.trumtrar@pengutronix.de>

dt-bindings: dp83867: add binding for output-impedance

This commit adds a new devicetree binding, ti,output-impedance-ohms, to all=
ow
specifying the output impedance for the DP83867 PHY via a fixed value. The
existing boolean values for minimum and maximum still take precedence over =
the
new value.

> diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.yaml b/Docu=
mentation/devicetree/bindings/net/ti,dp83867.yaml
> --- a/Documentation/devicetree/bindings/net/ti,dp83867.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
> @@ -38,6 +38,16 @@ properties:
>      items:
>        - const: io_impedance_ctrl
> =20
> +  ti,output-impedance-ohms:
> +    description: |
> +      MAC Interface Impedance control to set the programmable output imp=
edance.
> +      Valid range is 0x00 to 0x1f (32 steps).
> +      - 0x1f =3D 35 ohms (minimum impedance)
> +      - 0x00 =3D 70 ohms (maximum impedance)
> +      - Step size varies with process.
> +    minimum: 0
> +    maximum: 31

[Severity: Medium]
Does the property name ti,output-impedance-ohms violate devicetree unit suf=
fix
conventions by accepting raw register values (0-31) instead of actual ohms?

According to standard devicetree property rules, the -ohms suffix dictates
that the value must be specified in Ohms. However, the schema restricts this
property to raw register step values (0 to 31, where 31 configures 35 ohms
and 0 configures 70 ohms).

This mismatch could actively mislead devicetree authors. A developer might
provide a value like 35 which will be rejected by the schema as it exceeds
the maximum of 31, or dangerously configure 31 believing it sets 31 ohms,
but actually configuring 35 ohms.

Could this property be renamed to omit the -ohms suffix, or could the driver
and binding be updated to accept the actual resistance in ohms?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-v7-2-topic=
-dp83867-v2-0-a97b4cec6e93@pengutronix.de?part=3D2
