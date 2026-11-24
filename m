Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795545759;
	b=461px/8CZXdCmA6EjUTvgiwHI+CmzWkhgnyx4Fv60vTyj90WP7srEte3ps0AK7lJvFCK
	 2APYFKFa03Ibv7vBcdtHx8PMv4FKWSTdSKv097Wz11xg+1UXS6x5L2IRwBE6YF3tO1F80
	 tEOHH1XeqS+0VJA9LY5SlsCg09vnrkWGnQxe26Kg8++MgI5H9JO0iZz2xLhQyUgB9kCcS
	 SFXBoqQKANW7HArTIqiKBhivv46Wg1F1fhlGi5nKZCeGJs+06LqZGfm+iN8A5ULSmxJlW
	 uviNVrxw7mndwpbcqXGiVN2bnMfa+cV8ThmtttKmtXNjerg0vIDj6bs5B4BRwjw9lSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545759;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9BVzXZi6T0jdz+Nsjcv9rMLifj083D42MDCQZgBq4Qw=;
	b=nTyM4vbqYLuqc586iyXQ8cq36KgqO7Qe4vSOlVHMiyDT9fxIAMTyGjIGJ539WG8RHvTC
	 AkB/Jb/eYlIy03R7APsGK5IK2MDcDfwS9vuymiCCIJl1NwJSNDfcoCHBhpOSC5vFt7iPw
	 6MlQcBg6ZkStFB6ZHgnsQj7FYgMb8UX00DyfwwyIEYaBnhXwJ4opyMXspFCOtr/iV9C9W
	 UkAVwanTzG0ktk/3mO708kTXm0NTQLgJ3nu4z43k20Cbs/npAsT9AqFwtTi4xk5i23eTL
	 u6H6O6Inwg/mOX9DYHbDLkAv8DqupzmzJpGBLF3qHBHtiRRbMlaZbfUjua0Cj9aBnhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nqpPSG9F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AC1606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 18:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nqpPSG9F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7D21F000C6;
	Tue, 24 Nov 2026 18:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795545759;
	bh=9BVzXZi6T0jdz+Nsjcv9rMLifj083D42MDCQZgBq4Qw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nqpPSG9FZ1bU9EOkyFp1WHNq3ghptXrqHvgtfOBaX6S0TzyggNKYha/DZrLfFg1UP
	 X5Ifh6/icaSw00eRR6qSxvoUOVgsmLeNUzeU572WVQ0nI4XYyAC6PAXvrOa+bLuPom
	 gZfxB2ljBESWNpMVxfcTWgH4Z5pClGyX8F1lfl2ynF0McpNYWFS9VV42hblW4H/nKx
	 Gq5CwXpHkgV0lQu80z53yDR6jUZPnLqNycVDIqq5YPHOByHb7U0O+nqmuzo0e3cd2L
	 OXeDM8oduFMkxz8gQHcUI7y9M1b9gw1mFlrZdK6qyK+Ih+wEgvj7oPifNG0GnYwgzJ
	 hTcv/S0AmJ9Vw==
Message-ID: <sashiko-outbox-231845@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: Add Cortina CS7542 MDIO
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-b4-cs7542-mdio-v1-1-626d0a0e3b4d@gmail.com>
References: <20261123-b4-cs7542-mdio-v1-0-626d0a0e3b4d@gmail.com>
 <20261123-b4-cs7542-mdio-v1-1-626d0a0e3b4d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 18:42:38 +0000
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
- [Low] dt-bindings: net: cortina,cs7542-mdio encodes driver prescaler
  limitation
--

commit 16e4686a613308f65cd1e0ccf5ba35ade585a896
Author: Fil Dunsky <filipp.dunsky@gmail.com>

dt-bindings: net: Add Cortina CS7542 MDIO controller

This commit adds a Devicetree binding schema for the Cortina Systems CS7542
Clause 22 MDIO controller.

> diff --git a/Documentation/devicetree/bindings/net/cortina,cs7542-mdio.ya=
ml b/Documentation/devicetree/bindings/net/cortina,cs7542-mdio.yaml
> new file mode 100644
> index 0000000000000..77b5e2f09f423
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/cortina,cs7542-mdio.yaml
> @@ -0,0 +1,48 @@
[ ... ]
> +description:
> +  Clause 22 MDIO controller. Firmware configures the MDC prescaler before
> +  the operating system starts; the driver retains this setting.
> +
> +allOf:
> +  - $ref: mdio.yaml#
> +
> +properties:
> +  compatible:
> +    const: cortina,cs7542-mdio
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-frequency: false
> +  suppress-preamble: false

[Severity: Low]
Does setting clock-frequency: false and omitting clocks encode a current
driver limitation into the Devicetree binding?

Since the CS7542 MDIO block has a programmable MDC prescaler, the binding
should describe the hardware capabilities (including its input clock and
optional bus clock-frequency from mdio.yaml) rather than the driver's
reliance on firmware pre-initialization, so device trees describing the
clock configuration do not fail dtbs_check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-b4-cs7542-=
mdio-v1-0-626d0a0e3b4d@gmail.com?part=3D1
