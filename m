Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690194;
	b=nZN8ZhlOQ2Dp4ScSmBofJknYcDegzlk+M92k57yp5XEvd3EMVJgCClbnRyzzLgZ2FR1R
	 2v85j/1VaTJQsewO1Zn97AwTnPexoSZREtcx/Y9vUZ5yAqPlfTg3SffOvMXErTrR3noDN
	 aMEZIwG7Qz12446yLQ4HiM3x+q+O4NtXXIZAtCVYF5P9vzBM5C+F+zrzC2PSwJsfv0R8H
	 q+xd4OA46/g6QmqNrb4mOG4ZLiVUFw5xVRWNZlhjVCq7LWQNduezVyL8dCINL8BP9b6j4
	 qrvjPKpwfMjvxkwFz1PDlc6ZWcBSWoF6chZ3Jzbthtt6n5zTiKyhtJwbWaIEtegKxkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690194;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=n2gJ4sD41uTH00NZ3mpn1mrUv9pUW3hdigzbmKMQ4mo=;
	b=Rz3eLbG4If+Qlzy+NUyRtL5/THEh7BXWYIaaH62yOIzQQVc6gC0fbUymlIceiSOh8e00
	 XDmyhN0FaJD5Bhf7LZ5vx8YP94Dhv5i1rjTW0U9shHubSNM74dvXFboOvq04PbL57+Rkl
	 bc4FkzMfXNwcLxKg1IODhgR/31kfHcx+dyYTtigkmLd5usKMfamUEFQj09iEUQMaTiYT9
	 cIQkhjP2hm7ci5mKCf37gj95fA1jefZ4xkMBV+36pyRIm12upE65bMRwG8eKqkJyFNSGJ
	 3ozl1lCDoJYJG7ScHmMPJLtay0yF/PHQfyfLUFfKzXgfa/O6wqV8LmAgaiy9HMLNfWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mrHh6gNr;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80914606A31C;
	Thu, 26 Nov 2026 10:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80914606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mrHh6gNr
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 09325C2B9C7;
	Thu, 26 Nov 2026 10:50:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B248B60237;
	Thu, 26 Nov 2026 10:49:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2B0411E6B2E5;
	Thu, 26 Nov 2026 11:49:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795690186; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=n2gJ4sD41uTH00NZ3mpn1mrUv9pUW3hdigzbmKMQ4mo=;
	b=mrHh6gNruUe/EEnCdTwpBn9QYJSujVkcRgIAM+O6i3EJ+3Xp2JOKEme4BtCN4SgCu6f9dV
	Ii56otDJ1+Eu5X0uxUtAQuwRhL8+/MOCs9sBaij6DJfVa7bgN+DsVFN1lUwHR2fbs/7dIK
	Vp5zW/yuW8wi31CvuQ9X2F4j8ZEhB2j6t6FRTYEYmNSgXwTGb1RJzEht35VFaldjI0WjTR
	quY9aKRPLk4E09mwKvUxWTGHKJqk+MvALdUFHZd+FGKd+Ednb6O0olvG7CEkFXC8IMqB/S
	lQg4IN9tOu+RSFWkaypo7GiQh9BpRPCT8hoo6qfkCWxj7DIArFIQCQHB5kZX8A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  filipp.dunsky@gmail.com,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: Add Cortina CS7542 NAND
 controller
In-Reply-To: <20261123-b4-cs7542-nand-v2-1-9d9f08608534@gmail.com> (Fil Dunsky
	via's message of "Mon, 23 Nov 2026 23:27:06 +0300")
References: <20261123-b4-cs7542-nand-v2-0-9d9f08608534@gmail.com>
	<20261123-b4-cs7542-nand-v2-1-9d9f08608534@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 11:49:41 +0100
Message-ID: <87pkvryiii.fsf@bootlin.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 23/11/2026 at 23:27:06 +03, Fil Dunsky via B4 Relay <devnull+filipp.duns=
ky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Describe the flash register bank and the single 8-bit NAND target used
> on CS7542. Specify the ROM-compatible Hamming ECC configuration and
> allow standard NAND partition descriptions. Firmware supplies the bus
> timing.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---
>  .../bindings/mtd/cortina,cs7542-nand.yaml          | 66 ++++++++++++++++=
++++++
>  1 file changed, 66 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mtd/cortina,cs7542-nand.ya=
ml b/Documentation/devicetree/bindings/mtd/cortina,cs7542-nand.yaml
> new file mode 100644
> index 000000000..c9ab9d4d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/cortina,cs7542-nand.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/cortina,cs7542-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cortina Systems CS7542 NAND controller
> +
> +maintainers:
> +  - Fil Dunsky <filipp.dunsky@gmail.com>
> +
> +description:
> +  The flash controller supports programmed I/O transfers and a hardware
> +  Hamming ECC engine. Firmware initializes the NAND bus timing.
> +
> +allOf:
> +  - $ref: nand-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: cortina,cs7542-nand
> +
> +  reg:
> +    maxItems: 1

No clock, interrupt, dma, reset... nothing?

> +
> +patternProperties:
> +  "^nand@[0-9a-f]$":
> +    type: object
> +    $ref: raw-nand-chip.yaml#
> +    properties:
> +      reg:
> +        const: 0

Does the controller really supports a single CS?

I am not talking about the driver.

> +      nand-bus-width:
> +        const: 8

Already defaults to 8, most of the time we just don't define it
further. I don't know what is best here.

> +      nand-ecc-mode:
> +        const: hw
> +      nand-ecc-algo:
> +        const: hamming
> +      nand-ecc-step-size:
> +        const: 256
> +      nand-ecc-strength:
> +        const: 1

This is not a limitation of your controller and these properties are
only relevant if you want to overwrite what the NAND requested. You may
have software ECC engine support. Also, a step size of 256 today is
quite uncommon, are you sure?

Miqu=C3=A8l
