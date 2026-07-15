Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B84942BC5F
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116367; cv=none; b=FuDL5zF2DNFg2UmzBNRnxaPl4h8URAqSQ3uTPZA5JECsflduJH4HCWIGvV3odsdHCCiOEyClGKa19EsfFCIrl/tbk29rSlLWmew5jgWvr1O5rnt1X9DdzQcTGcE5NMGb/HG8q4mlqzIWXtMrRfr/P92dVZlZWLYUkfh/q/wgRLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116367; c=relaxed/simple;
	bh=P4hx4RGtxpe4CvFnSjHokO7fLuUIKwuiL1MXOoI59S4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a94kxbPC/Nk91OLA5jHfCoZZjZM1osFmFOnvJ/4QTZ6Gz6Pj8Rw9taXA5XOf8UWtYE1VaMav2o9q46dkVPkNAp9BmnDOqB2DfgmotT0U1XXbEUZgVQHZ6KxnH2i81C5cdpPK+PUBGMQyHAwE6MurgZXaWTL2SRHPNDeMx/qHSyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hMRX1BCP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hMRX1BCP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A815A1F000E9;
	Wed, 15 Jul 2026 11:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784116366;
	bh=KsC1jq/v15FueWTxmiEOMoAk18FDsaykdG7QEXzZesk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hMRX1BCP58ASxkqz3bmNnbrn7uGQ+pTtwOUV23AcGtJh5Saxz/4dxtJiB+oqRlSi6
	 LgYt/gZLQkF940YuE7n24T7ZSQZisn2UhlNw4TbS7QUCZ4g9YQy/7i7WgMepwdkHFP
	 ybnbX7G0SNEu6ebxqKm9ZUC+pJNG9Z7+dzJQw4Sb7iU15vv4MNgOkp0NvZhazHMmKh
	 Xy9r5ag1tFeYkkbczKEfDqE5uBTcBJyhNyCHVdSaBPoyo9VmZeCkoUCsMG9guJqu7b
	 sRMUqkn+yjoft6GWLezd4f8YbDQveTkSwchUrjzsUchI9JclITKaQpVAAK4Wo218U7
	 rfsDNzLlC6vMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/5] dt-bindings: iio: adc: microchip,mcp3911: Add
 spi-device-addr
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260715-ad5529r-driver-v6-3-cfdf8b9f5ee3@analog.com>
References: <20260715-ad5529r-driver-v6-0-cfdf8b9f5ee3@analog.com>
 <20260715-ad5529r-driver-v6-3-cfdf8b9f5ee3@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 11:52:45 +0000
Message-Id: <20260715115245.A815A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Driver code fails to parse the newly introduced `spi-device-addr=
` devicetree property.
- [Low] The `spi-device-addr` property definition omits the default fallbac=
k value that was explicitly documented for the deprecated property.
--

--- Patch [3]: [PATCH v6 3/5] dt-bindings: iio: adc: microchip,mcp3911: Add=
 spi-device-addr ---
commit 477e23e3dcd5151c9814b58cb6b94b490d963f05
Author: Janani Sunil <janani.sunil@analog.com>

dt-bindings: iio: adc: microchip,mcp3911: Add spi-device-addr

This commit adds the generic spi-device-addr property to the binding
schema and marks the vendor-specific microchip,device-addr property
as deprecated.

> diff --git a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.=
yaml b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
> index 3a69ec60edb91..4a60df06bd357 100644
> --- a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
> @@ -57,6 +57,12 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [0, 1, 2, 3]
>      default: 0
> +    deprecated: true
> +
> +  spi-device-addr:
> +    maxItems: 1
> +    items:
> +      enum: [0, 1, 2, 3]

[Severity: Low]
Is it intentional to omit the default fallback value here?

The deprecated property explicitly documents a default value of 0, but this
new definition omits it. This causes the schema to lose information about
the fallback behavior when the address property is omitted. Should it
include default: [0]?

[ ... ]

> @@ -86,7 +92,7 @@ examples:
>          interrupts =3D <15 2>;
>          reset-gpios =3D <&gpio1 10 GPIO_ACTIVE_LOW>;
>          spi-max-frequency =3D <20000000>;
> -        microchip,device-addr =3D <0>;
> +        spi-device-addr =3D <0>;

[Severity: Medium]
Will the driver fail to communicate with the hardware if a device tree uses
this newly recommended property?

The devicetree example explicitly advertises the new spi-device-addr
property, but looking at drivers/iio/adc/mcp3911.c:mcp3911_probe(), the
driver only attempts to read the older properties:

	ret =3D device_property_read_u32(dev, "microchip,device-addr", &adc->dev_a=
ddr);
	if (ret)
		device_property_read_u32(dev, "device-addr", &adc->dev_addr);

Similarly, in drivers/iio/adc/mcp3564.c:mcp3564_config(), the driver only
attempts to read the deprecated vendor property:

	device_property_read_u32(dev, "microchip,hw-device-address", &tmp);

Because the driver code does not parse spi-device-addr, it seems it will
silently fall back to the default address if a device tree provides the
new property instead of the deprecated ones.

>          vref-supply =3D <&vref_reg>;
>          clocks =3D <&xtal>;
>        };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-ad5529r-dr=
iver-v6-0-cfdf8b9f5ee3@analog.com?part=3D3
