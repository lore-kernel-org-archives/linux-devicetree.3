Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA89C3749ED
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 13:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781874511; cv=none; b=cCLBG7my59TRDOg5Y5Q+O8QDZ2cu8n1aWdA/Ncl7AOmdCKRjo+cw6aBrbOTVS9TW3UmPlzehBOhfX7/9IAt0UPBeRieg4+WDoa9lpDI7iUs+O3A+xKB/EjNh8Q32w4AqRCyvI0nzelv1/8s1se30dEVVYbalsAI0LiYsTbfVKW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781874511; c=relaxed/simple;
	bh=og5ztn0kKhUGvRnA8OWdug0h+b2aDB5/m6imLVhobmw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hSD9XBw+S4IgDun0CxlOzl31rfsAoqh8t2yem/Z+JSnySPJYfuAkiU3K+t0ipA5lCw3kdZYjPydFUNxoI1YUNo2w+/iFKhMxX/Ein3vMc3jkZrTW/K0IVafP/edIgQePctyhyaLxcSNB/I/qHj+B0uhrY6ao+YlkC8zAh0LEB7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGYXa+Gw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGYXa+Gw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5CD1F000E9;
	Fri, 19 Jun 2026 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781874510;
	bh=hDYkYxT9rnFbwmjItIKE5ZJ24Y+lk1lJi64T0sWnw+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FGYXa+GwBkW5m7VtjjaNLH028RGoNgD+9ZwgXLFFo1C6SO+ST12HYSFeHUmZ1PQbN
	 oczpeWgrtUklIsMJTPL8jWeyxOjRi4oCI1JjwQenGG0LkYBhtmZUBNbicTDsQww09F
	 Ty8Pj5VFFkZLSr9VhNdZOAHxG0RjrD0nVgZWtARL4XCDTrIPLF6pAs25yft62P/Gd0
	 2jyMSD/XdUB6iIV8SINEgqFdKhIYUidwnf3T9Xiuj5yL0b28pk7N70BQDQf4Pb2kD4
	 xftn8ocHQlo71VDlqq+FTfKqFZrbWJNFciLbtZR3TOJvKLFR+4PPNAa8728jyuBKib
	 nkXDpseGhbMMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] dt-bindings: misc: convert lis302.txt to YAML
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jad Keskes" <inasj268@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260619125902.893742-1-inasj268@gmail.com>
References: <20260619125902.893742-1-inasj268@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 13:08:29 +0000
Message-Id: <20260619130830.5D5CD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The YAML schema incorrectly forbids the `Vdd-supply` and `Vdd_IO=
-supply` properties for the SPI variant and contains a redundant `select` b=
lock.
--

commit 124e32c58b0e195eb97adbc2880712f6df5eb1b2
Author: Jad Keskes <inasj268@gmail.com>

dt-bindings: misc: convert lis302.txt to YAML

This commit converts the old lis302.txt dt-binding to YAML format,
supporting the st,lis3lv02d, st,lis302dl-spi, st,lis331dlh, and
st,lis33de compatibles. It retains old property names as deprecated
to maintain backward compatibility with existing device trees.

> diff --git a/Documentation/devicetree/bindings/misc/st,lis3lv02d.yaml b/D=
ocumentation/devicetree/bindings/misc/st,lis3lv02d.yaml
> new file mode 100644
> index 0000000000000..c73371b754a1e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/st,lis3lv02d.yaml

[ ... ]

> +description:
> +  This binding describes the STMicroelectronics accelerometers supported=
 by
> +  the misc/lis3lv02d driver. This driver provides input (joystick) and
> +  hardware monitoring support, in contrast to the IIO st-accel driver wh=
ich
> +  also supports some of these devices.
> +  Refer to Documentation/devicetree/bindings/iio/st,st-sensors.yaml for =
the
> +  IIO binding.
> +
> +select:
> +  anyOf:
> +    - properties:
> +        compatible:
> +          contains:
> +            const: st,lis302dl-spi
> +    - properties:
> +        compatible:
> +          contains:
> +            const: st,lis331dlh
> +    - properties:
> +        compatible:
> +          contains:
> +            const: st,lis33de
> +    - properties:
> +        compatible:
> +          contains:
> +            const: st,lis3lv02d
> +  required:
> +    - compatible
> +
> +properties:

[Severity: Medium]
Is this explicit select block necessary? The dt-schema tooling
automatically selects bindings based on the top-level compatible
property definition, making this manual select block redundant.

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              const: st,lis302dl-spi
> +    then:
> +      required:
> +        - Vdd-supply
> +        - Vdd_IO-supply
> +    else:
> +      properties:
> +        Vdd-supply: false
> +        Vdd_IO-supply: false

[Severity: Medium]
Does setting these properties to false incorrectly enforce a hardware
abstraction violation? The physical chip requires power to operate
regardless of whether it uses the SPI bus or I2C. Device tree bindings
should describe the hardware, not the current limitations of the driver cod=
e.

> +      required:
> +        - spi-max-frequency
> +        - interrupts
> +
> +required:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619125902.8937=
42-1-inasj268@gmail.com?part=3D1
