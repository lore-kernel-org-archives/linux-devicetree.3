Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8FB3C13EF
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 13:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086204; cv=none; b=LvMG3dve1kb7UmIDFK5SF3C0KYT2AjPyKgvqy48eQNb/W5asG0csBLTtRuJByf24e+dLlBbaeEBWtUGQ+rN2G5KFUtHX1lz3Z0H8wlLcQSd+W4V+r5qjK9uiptuA4T7PRQunOTPwfbwkEk1W5YT82LN+esGDnmFMcYZFhkvvIm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086204; c=relaxed/simple;
	bh=0Y1XP+tmRiW64xdCSUOQVZtu1YU1ZTKBFfQeXQu9zHg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EEuwuOghdr3wZ6427e89YCjl5Y/pPOqt4gvbCkj4POw/8d/O1ugh6jkB2SPQCSeC435Oypxnk/VJBlnkMYVBi9RfMA37qYyAcPVpebu7Hq2SXcb6ykmXPY31wDdakbcnhrIwaNxg+SEVa0+NK7fyW39CeGSf9ffyHbsTXpsJUR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2QDwZZV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2QDwZZV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7451F000E9;
	Fri,  3 Jul 2026 13:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783086202;
	bh=APNXRrG8/MaR3kk1Jep/FbXzYeDQ5nUe/cL8ZICvWDw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P2QDwZZVL2M89UdSiedqrGwT0WqWInEnGUcKHD/V3LM25SQpzAdkl2txdQsqpZBwT
	 1w1MohgjSE5+A0BZ5St4039AI4k7NM12lGLI8QaQ4mCtG3open5piT8xyt6/r2JFyd
	 JdRN2WZxWI6/r9oqD+vyzmkSfXH2awE0/FLnPyCeNWtJKIw5h6sAmuhLHK6V4OLztv
	 1r2JwOafnVQYs2CAnHQ1Bb7fNHB9Uz++gYI/WG0Ksvh8igsDUjFxMqpAAStzUcndR8
	 Mr1pRwj+DcITGKucOR6e9sV+Ek+bZVLSMMaf435ilozBB5sHQ0GZAKXZLfTSmSRDW4
	 3YdqQiLTnQk0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/12] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260703-qe-pic-gpios-v1-4-6c3e706e27dc@bootlin.com>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-4-6c3e706e27dc@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 13:43:21 +0000
Message-Id: <20260703134322.4D7451F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema introduces the optional `interrupt-map` capability bu=
t fails to conditionally require `#address-cells` and `#interrupt-cells` wh=
en `interrupt-map` is present.
--

commit 31293f4013500ab5fb7afbb5070f5cfad4b4d8a9
Author: Paul Louvel <paul.louvel@bootlin.com>

dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO

This commit adds interrupt-controller and nexus properties to the QE GPIO
binding to support signaling state changes on GPIO pins. It uses an
interrupt-map to route these to the parent QE PIC interrupt domain.

> diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-=
bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-ban=
k.yaml
> index 1af99339ff404..0c849a5698f4b 100644
> --- a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.ya=
ml
> +++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.ya=
ml
[ ... ]
> @@ -27,6 +27,17 @@ properties:
>    "#gpio-cells":
>      const: 2
> =20
> +  "#address-cells":
> +    const: 0
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  interrupt-map:
> +    description: |
> +      Specifies the mapping of GPIO lines to the parent interrupt contro=
ller, as the
> +      GPIO controller does not do interrupt handling itself.

[Severity: Medium]
Should the schema conditionally require #address-cells and #interrupt-cells=
=20
when the interrupt-map property is present?

If a device tree includes interrupt-map to enable GPIO interrupts but omits
#address-cells, the validation will incorrectly pass. Later at runtime,
of_irq_parse_raw() will traverse up the tree and inherit #address-cells from
the parent node (typically 1 for a bus).

This misaligns the expected parsing of the interrupt-map array by reading a
child address cell instead of 0 cells, which corrupts the interrupt mapping.

Adding a dependencies definition for interrupt-map could ensure these
cell-count properties are enforced when the mapping is used.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-qe-pic-gpi=
os-v1-0-6c3e706e27dc@bootlin.com?part=3D4
