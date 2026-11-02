Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639383;
	b=yuXJBU39d/o00rq8CO4zm3Kyax+yCNTFGDegUwYgJWzb0gRAdN/3bgrTmRzmoGwB/UKo
	 R0mB2GVu0yVh+nBSqEoz+eM2LPeCD+3uVnBhWDfdBCs2ZS4+bpI7NTIJtj0yJCWT06Rpc
	 /ZuJRwQROP2+P8mg9pE6yA20sv97BX/olTJ4B3RMsgD0tqh1ELS1o5hL7ZHmj4pWxYAQX
	 NZKwUqQMv5SdITfvqqjTFdP3adohcEpx+9G/Gl+ZJ5QVaLlH2Aesfw9HWupRzk0kvabzq
	 zWsqkq0GHFwiQg8GIJ7RoJpCHwz05R/10uUFfus2NJrN5QgYaSXlMBZ2WIVzcZGobAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639383;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=otKF2cYYxM+h7FWoF9erA+DgzqIPCnvETxdH+ON+xN0=;
	b=44P6Dy4UXaljutbgG+bpM16p2Ts5WSjCf2t01Tbewjq4dwEzpnrHQf50PpdTodBo4H3q
	 Afy5yy21EvBGoSJinOjcG0swA4Hf2Bgl8EY1WzZK28oK1Qlhs5POS8ZpTCc3j2wrUdmWr
	 cp1g/Tq0oIIwRuIfqZLz0ugBIwQyaAWrnjkQWkmvqoM+kGyIn5jJeUzUbYx4v7gPSzQxK
	 PRvQrXovlgokNc+udkd7IbuzCeiZ6hKTBHj6vlqE+iPcuyA5ZX26oVC7KKhyli/eHN+0Y
	 kgWfqu6OdEhY6wzsG5ik09YXRhJDiuOH0L4G1ZAQcbr8V7vOcIcBCx/fvjCFnZ525dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MXDhpczS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72104606A90F
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MXDhpczS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18F21F00A16;
	Mon,  2 Nov 2026 17:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793639383;
	bh=otKF2cYYxM+h7FWoF9erA+DgzqIPCnvETxdH+ON+xN0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MXDhpczS3HY6bFawU/cvd3XBRkH2LquvZr3Cq8lErllriCKeREEOjhNAqpIQexXEI
	 0l/FCpFKx1ehVEyovp9WivET1jwayZMfmV7beabo+RWZqoCEIQS22jeOowsHBuhLWN
	 4GzW3lY6Fb5mnOe0CrvrrjmD0rxOyUgjLBOWQPvMrc6q/KY9QOhtrCs/Ca+r/6nHZ5
	 c197UWXGXXYsLwfIZrS7Qh4OUaoLjDhfwFZkufWLvEYAJ1pBW+8b3UIJSU4qvg1g47
	 iv2pobtA3m6+e957P6gv6r0HambavjSDgicbheqUvR/NcxTPx/4XbEGkD0yu1DylyP
	 +c63VFVviB43A==
Message-ID: <sashiko-outbox-193804@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: interrupt-controller: add Mobileye
 EyeQ5 PCIe MSI controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-eyeq5_msi-v2-1-4aa3d3608064@bootlin.com>
References: <20261102-eyeq5_msi-v2-0-4aa3d3608064@bootlin.com>
 <20261102-eyeq5_msi-v2-1-4aa3d3608064@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 17:09:42 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: interrupt-controller: eyeq5-msi: drop bogus #interr=
upt-cells
- [Low] dt-bindings: interrupt-controller: eyeq5-msi: drop software label p=
roperty
--

commit 9aaa3be0c94345e12c3b93b0a3ada8acf3fb0a25
Author: Gregory CLEMENT <gregory.clement@bootlin.com>

dt-bindings: interrupt-controller: add Mobileye EyeQ5 PCIe MSI controller

This commit adds the devicetree binding schema for the Mobileye EyeQ5
PCIe MSI controller.

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mobil=
eye,eyeq5-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller=
/mobileye,eyeq5-msi.yaml
> new file mode 100644
> index 0000000000000..b86698e4f82c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mobileye,eye=
q5-msi.yaml
> @@ -0,0 +1,90 @@

[ ... ]

> +properties:
> +  compatible:
> +    const: mobileye,eyeq5-msi
> +
> +  reg:
> +    items:
> +      - description: GCSR block of the PCIe port
> +      - description: MSI vector control block
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1

[Severity: Medium]
Should interrupt-controller and '#interrupt-cells' be dropped from
properties and required in mobileye,eyeq5-msi.yaml?

According to the description, this hardware block only snoops message
signaled interrupt write transactions from a peripheral port and signals
its parent interrupt controller when a vector is pending. Consumers
reference this node exclusively via msi-parent with '#msi-cells' set to 0,
and it has no wired interrupt inputs.

Consistently, the driver in drivers/irqchip/irq-eyeq5-msi.c only registers
a parent domain via msi_create_parent_irq_domain() using
eyeq_msi_domain_ops (.alloc, .free, and .select =3D
msi_lib_irq_domain_select) and implements no .translate or .xlate callback
for wired interrupt specifiers.

Requiring interrupt-controller and '#interrupt-cells' set to 1 exposes an
undocumented 1-cell interrupt specifier for a controller that cannot serve
as an interrupt-parent, whereas chaining to a parent interrupt is an
operating system driver detail (compare with altr,msi-controller.yaml,
fsl,ls-msi.yaml, and fsl,mu-msi.yaml).

> +
> +  msi-controller: true
> +
> +  '#msi-cells':
> +    const: 0
> +
> +  label:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: Name of the MSI domain. If omitted, the node name is us=
ed.

[Severity: Low]
Is the label property appropriate for mobileye,eyeq5-msi.yaml?

In devicetree bindings, label is intended for human-identifiable physical
labels on a board or enclosure (such as external ports, leds, or buttons),
whereas an irqdomain name and driver fallback behavior are kernel software
concepts. In drivers/irqchip/irq-eyeq5-msi.c, this property is only used
to print a boot message in pr_info(), and no other binding under
Documentation/devicetree/bindings/interrupt-controller/ defines label.

Additionally, if label were ever kept, its string type is already defined
by core dtschema common properties, making the explicit $ref to
/schemas/types.yaml#/definitions/string redundant.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-eyeq5_msi-=
v2-0-4aa3d3608064@bootlin.com?part=3D1
