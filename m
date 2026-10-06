Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8221F4A2071
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 18:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311372; cv=none; b=blm7pbC+5hsPDPb8L0UtBqK+MVmsbxPe0hX562zhR8x2iryUR8gSPd1ssZs2HcoLM25mRCjMOETOqGJ1HiYArGZ1/7Bxb4sB71MF1k1aehw0LvCXdKjcJ1mNZWDe71TgkCzlEc9n6EehXzIJCjmFxXj+YZE0fUuyId93z9xqt2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311372; c=relaxed/simple;
	bh=BDa9ZJ9xBLiaRUOioBmnK1atNjxy8UObcdRA0rk33go=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=nygww3x7BxkTA2DuDBkOHxdKb0qncMafHRbrhw9kTwZqz5ZiG4CxL3NBSPPnRNfBiDgTCgfbTIv9qaWDEdNKVK6rI8YzKZsj5o6VAEUH+XuEBoTBEENx3Y6mXQ5Sy/QkBRgMIJBY0YA6GBWpMURn85x6NQ7rjyc4W/XTe7vG/og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Orq1RLKt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Orq1RLKt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F601F0089B;
	Tue,  6 Oct 2026 18:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791311369;
	bh=W/ZdxLHnVC8X4YnIZOGrqAh4fCPWY3K1MLVM9hU1K8g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Orq1RLKteUl+Y4HWDPF7RoFJuax4uJShzrQrOABaL1GbF8trIaThT4Dv4myqLk/ZX
	 dawYuDtYYfJzR41296peALdbZnHMfsZA/orJObRT9kg7at+XAvn3N0cIaCheQsdjO+
	 vd9YrRC0QcjxjRxJk7gZuZ0bG7bQabzfe2gDs5pMl0ImAueRwNaCgZIC9hgtvCUFXz
	 yrlEAa/FIRbgQZNLbVVC6N76ElE1hWNRrVR2zOwO6AdfAKV5nn10t1xjqNFy2lCc0B
	 CtGVpJkbVx6VP4LuOJnqL+GwvA8MvtPAUSqlSnW1LXmYRud0yCctSt7Z4Uor9LRYcQ
	 iKG1XGjw23rZA==
Message-ID: <sashiko-outbox-162344@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/13] dt-bindings: iio: adc: adi,ad4134: Document
 SPI connection mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <6afeb3fcb39f73edde5f39f6f37a1ecea5523319.1791309733.git.marcelo.schmitt@analog.com>
References: <cover.1791309733.git.marcelo.schmitt@analog.com>
 <6afeb3fcb39f73edde5f39f6f37a1ecea5523319.1791309733.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 18:29:28 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: invalid and incomplete constraints for spi-rx-bus-width
--

commit a58d6d0037332b8cd9f5b3717ec4b6ddd8e36734
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

dt-bindings: iio: adc: adi,ad4134: Document SPI connection mode

This commit updates the AD4134 device tree bindings to document different S=
PI=20
connection modes. It introduces the adi,spi-mode and #daisy-chained-devices=
=20
properties along with corresponding constraints for different wiring=20
configurations.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
> index ea6d7e0264190..970e7adb2405b 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
[ ... ]
> @@ -141,13 +161,36 @@ required:
>    - clocks
>    - clock-names
> =20
> -oneOf:
> -  - required:
> -      - ldoin-supply
> -  - required:
> -      - avdd1v8-supply
> -      - dvdd1v8-supply
> -      - clkvdd-supply
> +allOf:
> +  - oneOf:
> +      - required:
> +          - ldoin-supply
> +      - required:
> +          - avdd1v8-supply
> +          - dvdd1v8-supply
> +          - clkvdd-supply
> +
> +  - oneOf:
> +      - required: ['adi,spi-mode', '#daisy-chained-devices']

[Severity: Low]
Neither chain configuration includes spi-rx-bus-width in the required list.

Since JSON Schema property constraints only evaluate when the property is=20
present, omitting spi-rx-bus-width from a chain node bypasses the hardware=
=20
constraint.=20

Should spi-rx-bus-width be added to the required lists so the SPI controlle=
r=20
doesn't silently initialize with a single receive lane?

> +        properties:
> +          adi,spi-mode:
> +            const: one-channel-chain
> +          spi-rx-bus-width:
> +            const: 1

[Severity: Low]
Because the core SPI bindings define spi-rx-bus-width as a uint32-array,=20
evaluating a device tree value (such as <1>, parsed internally as the JSON=
=20
array [1]) against a scalar causes a strict type mismatch.=20

Could this falsely reject valid configurations during dt_binding_check?

> +      - required: ['adi,spi-mode', '#daisy-chained-devices']
> +        properties:
> +          adi,spi-mode:
> +            const: two-channel-chain
> +          spi-rx-bus-width:
> +            items:
> +              - const: 1
> +              - const: 1

[Severity: Low]
This array items constraint validates the first two lanes, but it lacks bou=
nds=20
checks.=20

Does this need minItems: 2 and maxItems: 2 to properly restrict the overall=
=20
length of the array?

> +      - properties:
> +          '#daisy-chained-devices': false
> +          adi,spi-mode:
> +            enum:
> +              - no-cs
> +              - 4-wire

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791309733.gi=
t.marcelo.schmitt@analog.com?part=3D8
