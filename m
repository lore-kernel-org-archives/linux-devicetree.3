Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E671442B316
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976079; cv=none; b=qP3mvWrShbO4HQ4rHgGUDFjsoLU6WbDW2eQngIfKiq/KZnsfeUq9Qjhbi+uuMQ9kEdcclO+M1WWGb33LzCVziVGnSvjOfPxVDGMpuGN3FjNaGLpNpunVT2kYKp7+c6eO68jNjMKjy/9b7ifzuO9XrvhJ3Mc+x/ftOSNHIXJyqpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976079; c=relaxed/simple;
	bh=OlQSh5XJtAAHP2eL8hgvhUogDWJ9Dor2odr8kc3OCks=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ioMlHCwHbMGRukwbohsB73DBr9/ZSKVagggIAPC8XQze0Kf3oIT0GD8LsE0G52rOV2/dGcCqaQ63hgDvBDL6yw6UsDCuqCHw+9/JJAHqlYdN3YNQyLX2gbksQ6ZYiQ+mJ8bA9M/8H20tl+iksZdl9ABSsk3lqKQAhKfVc3xPjg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rt6YkaRm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rt6YkaRm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3384F1F00893;
	Mon, 21 Sep 2026 07:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789976077;
	bh=3H/f0Dfkv8TH/d+vO1Om65Up65+b+QMLc1Xostnlin0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rt6YkaRm+V6ojKbVxzs1Bn0MNM0Qx8jKusTCGrq/fLT/kz81wsgxQRD7AlkfKde8s
	 4Yq07tKnDXBlBTYVlU5ZHFp/8kCSbH/6sVhoLILcGOCtoma4mR0HVmUFREHjEWZwXm
	 rTgTp5dQ3M/6LdXyHTWEz5Jbel+j7tp/FE0+4LU/giVtadZuhvBKGrdYTOwEu4Wjx5
	 Y+ZKLNR6/ZV1RpGl7xD/6Zz6jAeAy9pnrD/LQ4WdIoM2uMPRgPlmUNLVOQV9TGq5LS
	 nRBHKHmrYk5svAI/JGkmgxSK+ftOZsv5HundP854aq+1+8YFTm2snXHoAsrWkITLAO
	 a7H7MIMo/hR0g==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v3 2/3] Bluetooth: dt-bindings: Add AIC8800D80
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yanli Yang" <yanli.yang@bedmex.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <aff45beb52d4bcc99b0fdcb862b7b984ad737d92.1789974593.git.yanli.yang@bedmex.com>
References: <cover.1789974593.git.yanli.yang@bedmex.com>
 <aff45beb52d4bcc99b0fdcb862b7b984ad737d92.1789974593.git.yanli.yang@bedmex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 07:34:36 +0000
Message-Id: <20260921073437.3384F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: unsatisfiable constraint on reg property causes valida=
tion failure
--

commit c2a5ac7736c6234041d0e5fd1d5e6d9742fc0653
Author: Yanli Yang <yanli.yang@bedmex.com>

Bluetooth: dt-bindings: Add AIC8800D80

This commit adds the device tree binding for the AIC8800D80 Bluetooth SDIO
and UART HCI interface. It describes the firmware-loading function and links
the UART node to the SDIO firmware provider. It also updates the MAINTAINERS
file.

> diff --git a/Documentation/devicetree/bindings/net/bluetooth/aic,aic8800d=
80-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/aic,aic8800d80=
-bt.yaml
> new file mode 100644
> index 0000000000000..9c04ba62ecefd
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
> +          items:
> +            - const: 1

[Severity: Low]
Does this constraint on the reg property cause a validation failure?

In dt-schema, the reg property is always decoded as a matrix (an array of
arrays), even for single-cell values. For example, reg =3D <1> in the provi=
ded
example is parsed internally as [[1]].

Because JSON Schema evaluates this by checking if the first element of the
outer array exactly matches the literal integer 1, this constraint is
impossible to satisfy and causes make dt_binding_check to unconditionally
fail.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789974593.gi=
t.yanli.yang@bedmex.com?part=3D2
