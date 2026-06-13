Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47546387581
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 07:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781334809; cv=none; b=SEjGjOF3y+mzDqKdXdrNIAjua/1Ji3C2tHMs5GD90rxiwz9ceTPy5HIcPiuw6XHmRqWBmEAV5lbp6hoFXW+Jaab8aL6qFv/42lKg40Sh1Ps9DPVqjYfDDgYMsa2L0aPTJedESOdmf+Dt5Qip47+/5tkSmjavGYFeCGrR4d96Do4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781334809; c=relaxed/simple;
	bh=wNKb3Mw+r/xk/Vzw4O9tR/9Yu9JJhZw/1yXq6RjT7L4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qgpNuNLCREKv4U+C/q9FBstShQSaeHnHtvGfEZYC/QKJfDIvwBP+0cOgvvHoNLUZ6hx1lSXzd+O44FJA4ErCTcPm/7BODDgFGqlj38/H7ycLxGI3AHXY65Nn05oWvW99ZHhBpM22SURYfEsHe0HLSZ+ae3EQ59dksCoI1CX4UtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PkJqiRnD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PkJqiRnD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3101F000E9;
	Sat, 13 Jun 2026 07:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781334807;
	bh=mpxYQDc3c6q57NRKIe0so6yDPzCGD16D0NSVJmBqKdI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PkJqiRnDqBZSIJwNlzYolfaK9z7BJpT7aRxCk6XYDKgoI/oX7XZz+kiTK7n4HgqqZ
	 9yVL+PFrNd+uYCdfDK9IpAohX0NdBPRYCQsxU4PJGV/maIrQORGXXjEWDXK1FXkUCj
	 LK3jSv7yghOo6KVuzX2N8rAfO5Vq4H1GCmt7UWfs0O/7+p/4s1IsUrXJjyeHPForI5
	 HvqcQY230V9xqTJ6MlNddA6Pf69P/CtEGQxa28UpeZOFNXPdTDXF0A+/EYtIyAHOMs
	 fRmDDMdTPVnoBKgrPDvTnxBr1VwLwkEUMdj9RpVz//D6P/hwDcg/jHQ41YDuWEeCjo
	 TFqhOwbuJEAbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: pwm: st,pwm: convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charan Pedumuru" <charan.pedumuru@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260613-st-pwm-v1-1-458c2c89709a@gmail.com>
References: <20260613-st-pwm-v1-1-458c2c89709a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 13 Jun 2026 07:13:27 +0000
Message-Id: <20260613071327.BE3101F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `interrupts` property is unconditionally required by the dri=
ver but omitted from the YAML schema's required list.
--

commit b16a62dff3236ec8b123a99775f6c90dbfd9912f
Author: Charan Pedumuru <charan.pedumuru@gmail.com>

dt-bindings: pwm: st,pwm: convert to DT schema

Convert STMicroelectronics STiH41x PWM/Capture controller binding
to DT schema.

> diff --git a/Documentation/devicetree/bindings/pwm/pwm-st.txt b/Documenta=
tion/devicetree/bindings/pwm/pwm-st.txt
> deleted file mode 100644
> index 19fce774cafad..0000000000000
> --- a/Documentation/devicetree/bindings/pwm/pwm-st.txt
> +++ /dev/null

[ ... ]

> -Required parameters:

[ ... ]

> -- interrupts:		IRQ for the Capture device

[ ... ]

> diff --git a/Documentation/devicetree/bindings/pwm/st,pwm.yaml b/Document=
ation/devicetree/bindings/pwm/st,pwm.yaml
> new file mode 100644
> index 0000000000000..2c10f54b5caf3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/st,pwm.yaml

[ ... ]

> +required:
> +  - reg
> +  - compatible
> +  - "#pwm-cells"
> +  - pinctrl-names
> +  - clock-names
> +  - clocks

[Severity: Medium]
Should interrupts be included in this required list?

The original text binding listed interrupts under the required parameters,
and the driver unconditionally requests it during probe:

drivers/pwm/pwm-sti.c:sti_pwm_probe() {
    ...
    irq =3D platform_get_irq(pdev, 0);
    if (irq < 0)
        return irq;

    ret =3D devm_request_irq(&pdev->dev, irq, sti_pwm_interrupt, 0,
                           pdev->name, pc);
    ...
}

Without interrupts in the required list, incomplete device trees will pass
schema validation but fail deterministically at runtime.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260613-st-pwm-v1-=
1-458c2c89709a@gmail.com?part=3D1
