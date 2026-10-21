Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792548556;
	b=OLFP53c5ywcnSt7ECXpe+Cn+a1Ao4Z/eIpCax0NCC2bHaKKzhL0N6ZfYGi0th+N6P14W
	 T1pR06xymgzsq3ZqdxPxt91FMC20b1dEpRUSv69NeugBsZvYQNLnFGpyoW89ToHuupUxO
	 xt5VTH3YgzVg1ZhHwewD19EE/KXElibECfEH8trOwXqPSopfsctr0jw5nICEvkO8ZMJJ7
	 a/7huom8H2yQ0AAaUBzC8xcNANJ2hAX/cYPZJmKZC+9mXPWjGTqjfPQH+MG1+SMqHy/Nx
	 ensBlcxbye29fyGSASfIHdzeM+SsZ2AWKoLfohDJreM6NM1taUY3/kiay3ooP7YmBIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548556;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2Z2u/LqbanJ5eYp4UBxlkBsIw3VqDZJVfvk0OUOhg+A=;
	b=G4PkmEYV24X3z39pscXsvNBmDdWnRRkBbLpZ9MPLMj6QiW5GzmjColzjlHxIdE1OkslN
	 /O6KMaMo5gyatx0tx4oY3Qwjdprn3CLhz7oDLhgzJILPC3GJIE7Ln3b1Ly0d0YiH30oYL
	 vQ9N6KURxHwcMThax2dhaX4mtzpmf1NwfixokGU8RX+cH1OcCs0wPo2ASvfcOQInvRk9B
	 chSqeCYAEUdJio3eriWVsmSvfUdcLP3kRXhKXPUk66cOfOB0kNc5nGdkmPajb08iKYFbM
	 Hwf8Q3yr6IaKYa412tlLct2lzTSV5Hf9SwJd7381+dvSR3rsIhA2+Q2Cxx6Zq+nW3vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KIo9GO2H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A42606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KIo9GO2H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A291F000C9;
	Wed, 21 Oct 2026 02:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792548555;
	bh=2Z2u/LqbanJ5eYp4UBxlkBsIw3VqDZJVfvk0OUOhg+A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KIo9GO2HIReJM42hhTsMiEIo9KI/jQk7nS8EWMZSYhzxTPM0HBMV37JGufgxlbRMe
	 3IFDR8G5pfcT/GoweALuYKQqsTgQ5aT4RNXpCXfZXn8pRC2znNtGGJZp9p3dvetrzc
	 gqOCpuPkFb32TWLxZFq63rURdM+DOhP53E0IQltnd+9LCJHXnZmlTSNsaaa9jQLYSX
	 UXZQ0r5PnOlpoCA555qaw/aVIF5JteCNq132nyTwke0R1huKSU1fYb4czI+XHsCjdF
	 BBibt3bWq5dh/K5rZk7ElZguhw6xu0XdASepdpKmsKg2rUwa6wQTk8bi2VyygPqbBV
	 kZj9B7FqShKLQ==
Message-ID: <sashiko-outbox-179687@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/9] spi: restrict CS logical values to a contiguous
 sequence
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonathan Santos" <Jonathan.Santos@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <dd50e45bff4b59ad656f94fffecca28a49f1d2d3.1792435248.git.Jonathan.Santos@analog.com>
References: <cover.1792435248.git.Jonathan.Santos@analog.com>
 <dd50e45bff4b59ad656f94fffecca28a49f1d2d3.1792435248.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 02:09:14 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] spi: __spi_add_device() contiguous CS check breaks non-consecutive=
 multi-CS
--

commit fa819c18d6f789f30ff9ec769f0b81bb8ee9ca8a
Author: Jonathan Santos <Jonathan.Santos@analog.com>

spi: restrict CS logical values to a contiguous sequence

This commit adds a check in __spi_add_device() requiring chip-select values
for multi-CS SPI devices to form a consecutive ascending sequence, returning
-EINVAL otherwise.

> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 7a0406ec200e1..2b2eeaa4c15d4 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -902,6 +902,16 @@ static int __spi_add_device(struct spi_device *spi, =
struct spi_device *parent)
>  	for (idx =3D spi->num_chipselect; idx < SPI_DEVICE_CS_CNT_MAX; idx++)
>  		spi_set_chipselect(spi, idx, SPI_INVALID_CS);
> =20
> +	/* Restrict CS logical values to a contiguous sequence */
> +	for (idx =3D 1; idx < spi->num_chipselect; idx++) {
> +		if (spi_get_chipselect(spi, idx) !=3D spi_get_chipselect(spi, idx - 1)=
 + 1) {
> +			dev_err(dev, "cs%d is not consecutive with cs%d\n",
> +				spi_get_chipselect(spi, idx),
> +				spi_get_chipselect(spi, idx - 1));
> +			return -EINVAL;
> +		}
> +	}
> +

[Severity: High]
In drivers/spi/spi.c, idx (0 .. spi->num_chipselect - 1) is the logical CS
index, whereas spi_get_chipselect(spi, idx) returns spi->chip_select[idx],
which is the physical controller CS number mapped to that logical index, as
noted above SPI_INVALID_CS:

/*
 * Zero(0) is a valid physical CS value and can be located at any
 * logical CS in the spi->chip_select[].

During DeviceTree registration, of_register_spi_devices() ->
of_register_spi_device() -> of_spi_parse_dt() populates spi->chip_select[]
from the DT reg array before calling spi_add_device() -> __spi_add_device():

	spi->num_chipselect =3D rc;
	for (idx =3D 0; idx < rc; idx++)
		spi_set_chipselect(spi, idx, cs[idx]);

By checking spi_get_chipselect(spi, idx) !=3D spi_get_chipselect(spi, idx -=
 1)
+ 1, __spi_add_device() requires the physical CS numbers in
spi->chip_select[] to be strictly consecutive and ascending.

For example, arch/arm/boot/dts/nxp/imx/imx53-ppd.dts defines spidev0 with
descending physical chip selects:

	spidev0: spi@1 {
		compatible =3D "ge,achc", "nxp,kinetis-k20";
		reg =3D <1>, <0>;
		vdd-supply =3D <&reg_3v3>;
		vdda-supply =3D <&reg_3v3>;
		clocks =3D <&achc_24M>;
		reset-gpios =3D <&gpio3 6 GPIO_ACTIVE_LOW>;
	};

Per Documentation/devicetree/bindings/misc/ge-achc.yaml, reg entry 0 is the
control interface (on CS 1) and reg entry 1 is the firmware programming
interface (on CS 0), which drivers/misc/gehc-achc.c registers in
gehc_achc_probe() via spi_new_ancillary_device():

	ret =3D of_property_read_u32_index(spi->dev.of_node, "reg", 1, &ezport_reg=
);
	if (ret)
		return dev_err_probe(&spi->dev, ret, "missing second reg entry!\n");

	achc->ezport =3D spi_new_ancillary_device(spi, ezport_reg);

With this check in __spi_add_device(), spi_get_chipselect(spi, 1) is 0 while
spi_get_chipselect(spi, 0) + 1 is 2, causing __spi_add_device() to fail with
-EINVAL before gehc_achc_probe() can run.

Won't this cause a regression for imx53-ppd.dts as well as any other
multi-CS SPI peripheral wired to non-consecutive or descending physical
controller chip-select lines (such as reg =3D <1>, <0> or reg =3D <0>, <2>)?

>  	/* Set the bus ID string */
>  	spi_dev_set_name(spi);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792435248.gi=
t.Jonathan.Santos@analog.com?part=3D4
