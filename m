Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC822AF1D
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 00:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778287006; cv=none; b=gfKGZfnZFFfKwxQp3zGVV1jLrF6FhmOJKDZ0VTRZza7s1gX9eRfAyo4fcTTsY5yOXKCyZ04SiY5+nPqY11MtHh7TBnpv9dcF/oFsfBtiQ3jCWe5I6FIBGzjLH7tnMv/wRGWo0wfKdNxIfJrW1yAy5cI6buGnuuiQxkWJe1oiGPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778287006; c=relaxed/simple;
	bh=HIDM5fgNWQ2wJKXAjezNdtMfvcWBFVzueWMGjdEz4/E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OTM+3sxmqL6OpnwEb8phRw0QwSPOriqk+6v88hWJPXjt4A715mO6VpXsCj7jNsxPndqow1b5eYVDQumJHoOgiZDA5CFJ87iShMJYzlfpsV1otA9Rxe1ff17bU1NUAQf6mqyxSx8Cz4M48bA0AfSCBXLjuXKhF3hXJrlql4c4Qfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpiYmKLm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpiYmKLm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7626C2BCB0;
	Sat,  9 May 2026 00:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778287006;
	bh=HIDM5fgNWQ2wJKXAjezNdtMfvcWBFVzueWMGjdEz4/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=EpiYmKLm6IC19LsAYAbXSXVkjnFfkZloVDI075eqx/eBuVC5aAUyAcbx5WZZr4+ir
	 K2N4Gwly62WSuWw4FGvM9ox5kJ5yjfPF2ojGwgTo+yrpiQPKJ8Fdi3+o+0eGLgJ+0E
	 ZKYsO8pzufD8/AGpWAU1zV1vFbl7vXFAogTAQ13fyfYfOpkMbJchfSVrCjitu8N32T
	 BgB7nATB26H4K5wb1ojM+UACRgk1upAzAi7mtM5xPCZwS03CBVAwppcRSQ/GWz8yb6
	 2bOqORUU4g1DBiXAwdvRXoHyTH16SLINSFoJgeR0kBZMitvPbDZX0R0TiRDwJRRhdv
	 2qfPzkqS/I9RQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: iio: dds: Add AD9832/AD9835 binding
Reply-To: sashiko@lists.linux.dev
To: "Hungyu Lin" <dennylin0707@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260509002810.78372-2-dennylin0707@gmail.com>
References: <20260509002810.78372-2-dennylin0707@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 00:36:45 +0000
Message-Id: <20260509003645.A7626C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The AD9832 and AD9835 require SPI Mode 2 (CPOL=3D1, CPHA=3D0), but=
 the binding does not enforce `spi-cpol` and the example omits it.
- [High] The driver will unconditionally fail to probe when instantiated vi=
a Device Tree because it strictly requires `platform_data`.
- [Low] The example uses a specific part number for the node name (`ad9832@=
0`) rather than a generic functional name.
--

commit 0760129b4a1ce54473ebad28ebda22535e9eedd6
Author: Hungyu Lin <dennylin0707@gmail.com>

dt-bindings: iio: dds: Add AD9832/AD9835 binding

This commit adds device tree binding documentation for the Analog Devices
AD9832 and AD9835 SPI-controlled direct digital synthesizers.

Since the binding introduces device tree support, does the driver need
updates to actually probe successfully when instantiated this way?

Looking at ad9832_probe(), it unconditionally returns -ENODEV if
dev_get_platdata() is NULL:

drivers/iio/dds/ad9832.c:ad9832_probe() {
    struct ad9832_platform_data *pdata =3D dev_get_platdata(&spi->dev);
   =20
    if (!pdata) {
        dev_dbg(&spi->dev, "no platform data?\n");
        return -ENODEV;
    }
    ...
}

When instantiated via device tree, platform data is typically NULL. Will
the driver fail to probe without additional patches to handle missing
platform data?

> diff --git a/Documentation/devicetree/bindings/iio/dds/adi,ad9832.yaml b/=
Documentation/devicetree/bindings/iio/dds/adi,ad9832.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dds/adi,ad9832.yaml
[ ... ]
> properties:
>   compatible:
>     enum:
>       - adi,ad9832
>       - adi,ad9835
>=20
>   reg:
>     maxItems: 1
>=20
>   spi-max-frequency:
>     maximum: 20000000

Does this binding need to specify spi-cpol?=20

The AD9832 hardware requires SPI Mode 2 (CPOL=3D1, CPHA=3D0) where the SPI
clock idles high. Since the driver doesn't set spi->mode in code and
relies on the device tree to configure polarity, omitting it might cause
the controller to default to Mode 0, which would cause communication to
fail.

Should spi-cpol: true be added to the properties and included in the
example?

[ ... ]
>     spi {
>       #address-cells =3D <1>;
>       #size-cells =3D <0>;
>=20
>       ad9832@0 {

This isn't a bug, but does this violate the device tree convention for
generic node names? Usually, node names describe the hardware's function
rather than the specific part number, such as generator@0 or frequency@0.

>         compatible =3D "adi,ad9832";
>         reg =3D <0>;
>         spi-max-frequency =3D <20000000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509002810.7837=
2-2-dennylin0707@gmail.com?part=3D1
