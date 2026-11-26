Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721108;
	b=iGCtv1lAB5CO6AMbQuqMa9JnhzbM4EEZ2JB9k7PSk/55LSmkxpsaAHMBtBHkNriPZ61L
	 tJCcXJDLngcK8AkvYNU80AbYWzY6KQXHJoyUAOrF08imcjcU35IrcSqpc6JW0feWRCUB5
	 nLz4dRM07lyPaX/IwjkGcbQ2E73JM8gVXdoqwkxtqQ9V65bDaYZgnjcSDj6WuEomRw5O/
	 lMlqvrX/HW87yfHx4KeIsmJk7I5Ut5fxSykJVgmCIuBBNwgIisyvUpetnriV8ZC1jlyP8
	 OdgEimSux4H8kpIoy7hs6xfRddRH5AKu9xOTV1W0pjPwGUadzlqVP11Yl9Gu9Y4Tq8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721108;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8neFM4IZWctrSKbLLCGkv0TlKkdzfM0Qrkc2za2vGOE=;
	b=tGiEECUj2LtF5m1rMM+JzZmVazVeKaMGLutiRx6MZXFg/xZg8VSELP0qyv0VWe47hSDs
	 Zaxb2m1gkMGJt7NxYkIZW7zV/CRZTxBulaIBZaenvnUVYwkWx482wJjJpg3JzlS10oMm1
	 Xh26D2HZ+zCs6Z4BTkt1TsSFf5qQvmdHnSoA2yVWX1fdI7cjX3ncFHZ5cocRNDl17puL+
	 OU/TB8UQrPLGK4TIJCrCDAD13zwhs0jWo2qH9Dw96NDxW2f7TyVw19P74DQOxJuDuFu9e
	 ildy4w7ErkjRwqqRReEhWjWm9OdySQFs5SWxkuMB8Bqmm8R/lV1G1jZYbjqTxC5+QTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bj/AWI8I";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00139606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bj/AWI8I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E71D1F000D1;
	Thu, 26 Nov 2026 19:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795721107;
	bh=8neFM4IZWctrSKbLLCGkv0TlKkdzfM0Qrkc2za2vGOE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bj/AWI8I0upm4jaOjs5ykSt8pwKPG0xDPUl8iBSlAB9m5eZqscYwOp6EhERjUpKLx
	 uDC4h8/6QLSQxIi7vPxxYtrZDjYSbriQzftq5/xMgVRsAyrz8pLx6EpeXjkzSaddhu
	 acGydyL7ytsbwI7Ls7E08IizayJjBCUlsPIEqASnzbj0uyc7s39rNJCyg7YFdUI0J6
	 bbHZOxwMLRjKKI7tGYGrd3z589SPSfLz8U+wO9sPiR6h9N+7p5lLoqfTEaJS8P1qIc
	 p9ItD4aSyh2r6ePxUb7KkBZIonluagAJMdo6DT63jdSQRoFy+DvJJrUEfmUsimXvpz
	 LDcsASGdG67FQ==
Message-ID: <sashiko-outbox-236089@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: power: supply: bq27xxx: Add BQ27Z558
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prachoday Sutar" <prachodaysutar7@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126191906.25708-1-prachodaysutar7@gmail.com>
References: <20261126191906.25708-1-prachodaysutar7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 19:25:06 +0000
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
- [High] dt-bindings: power: supply: bq27xxx: NULL deref in
  bq27xxx_battery_i2c_probe()
--

commit 54d1a3afdd53a67243b18d9017c27b2cdf3485cd
Author: Prachoday Sutar <prachodaysutar7@gmail.com>

dt-bindings: power: supply: bq27xxx: Add BQ27Z558

This commit adds the "ti,bq27z558" compatible string to the bq27xxx fuel
gauge device tree binding with "ti,bq27z561" as a fallback.

> diff --git a/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml =
b/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
> index be0f1f7292c8f..28b04732e08d9 100644
> --- a/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
> @@ -18,40 +18,44 @@ description: |
> =20
>  properties:
>    compatible:

[ ... ]

> +      - items:
> +          - const: ti,bq27z558
> +          - const: ti,bq27z561
> =20
>    reg:
>      maxItems: 1

[Severity: High]
Does binding via the "ti,bq27z561" fallback trigger a NULL pointer
dereference in bq27xxx_battery_i2c_probe()?

When the I2C core creates the client from Device Tree,
of_i2c_get_board_info() -> of_alias_from_compatible() populates
client->name from the first compatible string ("bq27z558").  During probe,
bq27xxx_battery_i2c_of_match_table matches the "ti,bq27z561" fallback, but
its entries do not set .data:

drivers/power/supply/bq27xxx_battery_i2c.c:bq27xxx_battery_i2c_probe() {
	const struct i2c_device_id *id =3D i2c_client_get_device_id(client);
	...
	name =3D devm_kasprintf(&client->dev, GFP_KERNEL, "%s-%ld", id->name, num);
	...
	di->chip =3D id->driver_data;
}

Because "bq27z558" is not in bq27xxx_i2c_id_table,
i2c_client_get_device_id(client) returns NULL and probe crashes
dereferencing id->name and id->driver_data.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126191906.2570=
8-1-prachodaysutar7@gmail.com?part=3D1
