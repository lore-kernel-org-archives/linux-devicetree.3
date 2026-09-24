Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9235346E59
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239607; cv=none; b=dE6Q5/CBrUl798Gv3C9525bdXcDkSlTu8BjVYOUlDMnscf4aH+w9XQKlB8ORdgDdLU9Zfxm5TVintlGnu6Z0IIFMmoOU+PQEHJHF4uTo9ooBhALBfJbOEegUTTSg8qjY1pJ9KZsn3/eeqxGFIuGlHmI9m1D6NMZ39EbSKlEayOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239607; c=relaxed/simple;
	bh=KnGr+4C+EVy2HYEHdZT7Bb3gFtvapvr4fl+rVmyhW6s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b7Bong57qI/5H+vYrkjQdBIHA7IGjgCm1z3pTDeZZqg0fgue3n5zjUYv6khAtMfY8078VOb1njP2vuWjbZblQWyYxdl+3mKX6ILEMxwsAIPw1ZhxrsUT3od+2eoCK7ZD2iH8/jaxO4F5XSHcvtTx2GLbIgWGMpBRJ5IK4hQElng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpuA5Sfl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpuA5Sfl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489AD1F00893;
	Thu, 24 Sep 2026 08:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790239606;
	bh=XbzuODEB0Bu2IbaiLku6BLr76ZQyHP8jRO4GifzsK40=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EpuA5SflKCUlSxvABYw5yEPOYaEWt4cN6o9EfrDABiRz77Y8b+wy4/AqgM22hxdXj
	 3jgbJuTGyTqYNS4d32qkcl5g25bLTFzJad/QGMbNXU6O4D2JMWcKIxQQB/wLvu2fPg
	 hAT5MDNdsxc2qRFOWtpmRmDOTsBYQ8jdikrjLCFY9xy20lvxar7wF7SeaCORCU1IMw
	 fL2yv4YU2E6zs7bDmPY6DXdyr7+Q6eJBoznSmH9Z8aq1dFUbwe04oUSdaDaZzOdmp0
	 zCmVi+ReW8itoRt8EC5YI8XDzAcmE2Y1xAl1jK6VJw+ogLGE7NH25otZcOIPG/gWAC
	 IzWOfVP2EtzTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i2c: add Amlogic A9 I2C controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260924-a9-i2c-v1-1-b8ad9b46f4a8@amlogic.com>
References: <20260924-a9-i2c-v1-0-b8ad9b46f4a8@amlogic.com>
 <20260924-a9-i2c-v1-1-b8ad9b46f4a8@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 08:46:45 +0000
Message-Id: <20260924084646.489AD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: i2c: amlogic: misspelled maintainer email addresses
- [Low] dt-bindings: i2c: amlogic: invalid GIC interrupt type in example
--

commit 1ce7d70f157b5cc3e10c7e75c64287c2dbe2c1bb
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

dt-bindings: i2c: add Amlogic A9 I2C controller
   =20
Add a Device Tree binding for the I2C controller found on the
Amlogic A9 SoC.

> diff --git a/Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml b/=
Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml
> new file mode 100644
> index 0000000000000..681241a526806
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/amlogic,a9-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic A9 I2C Controller
> +
> +maintainers:
> +  - Xianwei Zhao <xianwei.zhaol@amlogic.com>
> +  - Junyi Zhao <junyi.zhaol@amlogic.com>

[Severity: Low]
This isn't a functional bug, but are these email addresses misspelled?

The trailing 'l' in 'zhaol' causes emails to bounce when contributors
use get_maintainer.pl to CC the maintainers on patches modifying this
binding.

[ ... ]

> +examples:
> +  - |
> +    i2c@3a4400 {
> +        compatible =3D "amlogic,a9-i2c";
> +        reg =3D <0x3a4400 0x3c>;
> +        interrupts =3D <1 164 1>;

[Severity: Low]
Is this GIC interrupt specifier in the examples block correct?

The first cell value of 1 designates a GIC_PPI (Per-Processor Interrupt),
which is limited to the range 0-15. A value of 164 is highly invalid for a
PPI.

Since I2C controllers are typically shared peripherals, should this be 0
(GIC_SPI) instead?

Developers copy-pasting the example will create invalid device trees that
fail at runtime or during dtc validation.

> +        clocks =3D <&clkc_periphs 11>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        eeprom@52 {
> +            compatible =3D "atmel,24c32";
> +            reg =3D <0x52>;
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-a9-i2c-v1-=
0-b8ad9b46f4a8@amlogic.com?part=3D1
