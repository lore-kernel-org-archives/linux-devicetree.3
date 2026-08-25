Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76EB37B40C
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 20:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787690525; cv=none; b=j50ww1TPOcb9vYyOLm2tBdVmrU66o7T6irtoI+++ZpMqxHbhEq8iP8s5wr/ibXXuryaCJoO7Qf1tFrYN76exVI3jGSseHol1P9WCH4ToKQRP3x1wlr4wVKipFIMZkYp7BV//wrnLDk1NqL9PFJJml3LZFMlkZu6ab9ByiUn77iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787690525; c=relaxed/simple;
	bh=QYXTNMWsa4aW50YIvMT3O+OJHBKMqdLgCMCUz3ynYCc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zb77zL1SLmudKZtWp9jVzDb7N+Kw2pMLNgMyf+gRx9tdN4KNWIOj025I1IyPnxDlyZpzem9D+3mlP3qYeyfNcVS7CvSGbs5NAIhhPS2ujfkoJtFUwMCkX9O/dbGSoXknwefSrJACzrHKYc3wZ4b65LGhFcT7XFA/D8pWMVkT41M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezO6dWSp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezO6dWSp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E52B1F000E9;
	Tue, 25 Aug 2026 20:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787690524;
	bh=vIejWWkayefwMR9VcStBGVbkhe11EkIfFxpffqstCVM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ezO6dWSp/sleVJnTzTz54r3FMSpRgxmZNU8q1+AXhOIh8o6OoCev3w1U2MVJbVQFG
	 L+o3ODZ5/PZ6yuTSNz9z6pYyGcenrG50AkjEp6FzQyD/cEWWtUCD+tcq3ReM2Lg5ew
	 FXfP9tkb2nIeEKmE9R9aDXVXLx2BZe0O2461zf0AO9l/TRGYvwyMhWMdbH23yTD2tL
	 A51yBa4S0AbFttKSxUhTGcN31lAFQacJ3DF3TOMPjdyjdJQl/Sp0/ffQ/VXw5WsWwq
	 jZmTf+zRn+pn1lkAlnRbT0tFFTpyD91ej4DtFmz+bba2nxe/6woLrSBz9x6KOuU9xi
	 BnawXcOfwVVbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: renesas,rcar-i2c: allow 6 DMA
 channels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260825203251.2118-2-wsa+renesas@sang-engineering.com>
References: <20260825203251.2118-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 20:42:03 +0000
Message-Id: <20260825204204.0E52B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Globally increasing maxItems for 'dmas' and 'dma-names' to 6 all=
ows invalid device trees for older hardware generations (Gen3/Gen4) to sile=
ntly pass schema validation.
--

commit 25b051c331e08902e326728248cc79cc367f0460
Author: Wolfram Sang <wsa+renesas@sang-engineering.com>

dt-bindings: i2c: renesas,rcar-i2c: allow 6 DMA channels

This commit increases the maximum number of DMA channels for the Renesas=20
R-Car I2C controller from 4 to 6 to accommodate Gen5 hardware.

> diff --git a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml =
b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> index c4ace5585e1e2..bfe55e20f1251 100644
> --- a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> @@ -77,14 +77,14 @@ properties:
> =20
>    dmas:
>      minItems: 2
> -    maxItems: 4
> +    maxItems: 6

[Severity: Medium]
Doesn't globally increasing maxItems to 6 allow invalid device trees for ol=
der
hardware generations (Gen3/Gen4) to silently pass schema validation?

According to the device tree subsystem guidelines, stricter constraints for
older generations must be preserved using if-then conditional blocks when n=
ew
hardware variants relax limits. Otherwise, dt_binding_check will incorrectly
accept up to 6 DMA channels for older hardware that only supports 4.

>      description:
>        Must contain a list of pairs of references to DMA specifiers, one =
for
>        transmission, and one for reception.
> =20
>    dma-names:
>      minItems: 2
> -    maxItems: 4
> +    maxItems: 6

[Severity: Medium]
Does this also need a conditional block to protect earlier hardware?

Similar to the dmas property above, globally relaxing the maxItems limit for
dma-names without adding an if-then conditional constraint removes the
4-channel constraint for Gen3/Gen4 hardware.

>      items:
>        enum:
>          - tx

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825203251.2118=
-2-wsa+renesas@sang-engineering.com?part=3D1
