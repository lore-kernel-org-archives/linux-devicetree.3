Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F008C3B19D9
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 06:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782888767; cv=none; b=HUDiffWjJ6eskKsLiF4Vheyw6cBwYEcgLuSzUulADpTMOW00T+6A4xlBRn0P2C4olMjeqJ5Nv+N+Q8VBy6uoQktNfpjkEcOmd+aeOmUhq5/hCRjGFHig7+8O1KvCn1g5aNCdj9YmAFDVrD3p6uVXBDMFGrmc4Ma3C3ex61kKsDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782888767; c=relaxed/simple;
	bh=HN9Trq46qgpVJBIhWeJlXc/tDDxY9PPtoUqHXN6Omd4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LDAmVEKF6MTS6upSzeAwRNRKC0ZGSteS3h2E0Q8vlWVBMZPwoarNy4IC2XAesEeJuTq/SFWby/8id7hDgeXs4lG5eCiHFLNQwT00ef5FZihHdIiAKB16nBynZObZn2jdU/tx4Mod0fAxnN1K3v1BiXHg4prioyxMMdhV1PPAyAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIrBWkTf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIrBWkTf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579BC1F000E9;
	Wed,  1 Jul 2026 06:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782888765;
	bh=mhhLel6IvW3q8o8hNYIIy/WJyJWZc7jO8v/g2vJcs4k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IIrBWkTfJFKdGOAvItnTEyxxcaT3Vf4vd/0xRVTJg3yP9rH+2DQqNDZO5T7Y2VasY
	 JrxQIUVGgogO4mBGENVblqKCd+l7881gtzIx8Cd5TYzRDVusEPMGHD2ioYAuw4eFVz
	 rUSc8lZOEgG2+JDyPrQlT840Xv+yAOykvuPsYCEwS44/7FWmxfx4Pvz09CS8N0wCQf
	 /cLkE6d7ENHKgA4kXGalt6362svT+t1G2eGvM0Q5vTFN04/XyptClEGqi8yPh0LreA
	 0T4Rnc5zELUlcHgXOpdLDTzKWdBzKlUJfgyRukGjgq8gBnk11tBGwjetJO2vIUlXKc
	 lrbNvaC+HSC7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: spi: Add spi,device-addr peripheral
 property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701-ad5529r-driver-v5-1-ed087900e642@analog.com>
References: <20260701-ad5529r-driver-v5-0-ed087900e642@analog.com>
 <20260701-ad5529r-driver-v5-1-ed087900e642@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 06:52:44 +0000
Message-Id: <20260701065245.579BC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Architectural misplacement of the `spi,device-addr` property and i=
ncorrect hardware modeling for shared chip selects.
- [Low] Invalid property name formatting (`spi,device-addr`) causing schema=
 validation failure.
--

commit a13113dfcdf0e6c76170858ecffc2c11d4c536cf
Author: Janani Sunil <janani.sunil@analog.com>

dt-bindings: spi: Add spi,device-addr peripheral property

Some SPI devices support sharing a single chip select across multiple
physical chips by encoding a device address in the SPI frame itself.
Add a generic spi,device-addr property to document this per-peripheral
address. This property belongs in channel or sub-device nodes of
peripherals that use this addressing scheme.

> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.y=
aml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> index 880a9f6245667..3774e80183555 100644
> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> @@ -142,6 +142,11 @@ properties:
>      minItems: 2
>      maxItems: 4
> =20
> +  spi,device-addr:

[Severity: Low]
Does this property name pass make dt_binding_check?

Since spi is not a registered vendor in vendor-prefixes.yaml, the comma
syntax typically causes a validation failure. Should this regression be fix=
ed
by using a hyphen instead for a subsystem generic property, such as
spi-device-addr?

[Severity: High]
Does this architectural approach correctly model the hardware?

By placing this property in spi-peripheral-props.yaml, it applies to direct
children of the SPI controller, yet the commit message notes it belongs in
channel or sub-device nodes.

Standard Device Tree architecture generally models a shared chip select bus=
 as a
parent node (with #address-cells and #size-cells) and the individual
chips as child nodes using the standard reg property.

Does using a custom addressing property on sub-channels bypass the standard
DT bus addressing model?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Device address used when multiple peripherals share a single chip =
select.
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-ad5529r-dr=
iver-v5-0-ed087900e642@analog.com?part=3D1
