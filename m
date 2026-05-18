Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F262231B80D
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779118155; cv=none; b=Va2woe365NMXjdJx+0PzbTULKnl/CErxSopTn2GFQKJTS5E8dYws3bv3nz2qHnwqYlLwP65L1A09MTR4WQVkcRFF2ee3An83bgNeLSduIqyIkP08IVlI8fWR2b1JjKB/kvOsmXuVCm4OoD6SD+2gTGrzDO1T8gc8qak+m4aTMJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779118155; c=relaxed/simple;
	bh=BWiHn6qfFoIzJ9YEeRS7pU4LLp8bIb9vRVRCTL0PMGY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oEQool6WTDOahw2FpOe4LlZ1ID6Yzy7icN1GwX43xTQNvvhgsPd1bCUiBjK0GPEFWU7PLBvHLVxEi349d1SPaSa3DWhU/J4MeBNbOrI/Gj2c4pV/TXZSYuudw9/CivNC+BbERL8nu/Duxj9oq2FCTKjwvPtHI17o/fw8feAEaiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oC7UmxiA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oC7UmxiA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B83C2BCB7;
	Mon, 18 May 2026 15:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779118154;
	bh=BWiHn6qfFoIzJ9YEeRS7pU4LLp8bIb9vRVRCTL0PMGY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=oC7UmxiAa33JhXMWELBBAqFjngwfBFJokeOwA/kzt5EC9r0hbv+g/aMWdPWi3tM3o
	 v5AAJoBGAeOXY15p/Dz5KGdqhZSmPGI2TN6NEOz41IcqQJsLYX9YE41zmyxSBqYRJh
	 R+NGkOub3PIM+gDShCpUr9qx8DuLSdU7IwZ4w0Q89uDBNF7+CJHPDae2or0osfxAmG
	 DyWgLBKI5vN0W9/BOM8li/wkRDyL83zF8fsSIJg0zkMhVbCvKzXyQk1nzdWW0ANx8D
	 +rIoiM+D7Hk4+id9N8++b0FMEO2Eec3aMi4P58g/PBTxybMESaTbDr0DGw5EcwvP3l
	 C772RE6hZWGtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/4] dt-bindings: iio: adc: Add ltc2378
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt1@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <cf404216011b6972519436c63fcc7c4e2c883c54.1779117444.git.marcelo.schmitt1@gmail.com>
References: <cf404216011b6972519436c63fcc7c4e2c883c54.1779117444.git.marcelo.schmitt1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 15:29:13 +0000
Message-Id: <20260518152913.D0B83C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The YAML schema incorrectly models fallback compatible strings b=
y grouping specific and fallback strings into a single-element list, reject=
ing actual fallback usage in the device tree.
- [Medium] `additionalProperties: false` is used instead of `unevaluatedPro=
perties: false` alongside a common schema reference, causing erroneous sche=
ma validation failures for valid SPI properties.
--

commit e7c5954ec798a9962f4a29e46b3240e39219ef7e
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

dt-bindings: iio: adc: Add ltc2378

This commit documents the device tree bindings for the Analog Devices LTC23=
78
and similar ADCs. It introduces a new YAML schema defining the compatible
strings, power supplies, interrupts, and SPI peripheral properties.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml b=
/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml
[ ... ]
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - adi,ltc2338-18
> +          - adi,ltc2369-18
> +          - adi,ltc2370-16
> +          - adi,ltc2379-18
> +          - adi,ltc2380-16
> +      - items:
> +          - enum:
> +              - adi,ltc2364-18
> +              - adi,ltc2364-16 # fallback compatible

Does this definition restrict the compatible property to an array of exactly
one string?

Grouping a specific variant and its fallback into a single enum under a
one-element items array natively rejects the standard device tree formatting
for a specific device paired with a fallback, such as:

compatible =3D "adi,ltc2364-18", "adi,ltc2364-16";

Should this list declare two discrete elements positionally instead, with t=
he
specific variant first, followed by a const for the fallback string? This
pattern repeats for the other fallback compatibles below.

[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +  - ovdd-supply
> +  - ref-supply
> +
> +additionalProperties: false

Does this introduce a regression where valid SPI peripheral properties are
erroneously rejected?

The binding includes a $ref to /schemas/spi/spi-peripheral-props.yaml# at
the top of the file, but concludes with additionalProperties: false. Since
additionalProperties only considers properties explicitly defined in this
specific properties block, device tree nodes using standard SPI properties
that are not manually redefined here (like spi-cpha or spi-cs-high) will
fail validation.

Should this be unevaluatedProperties: false instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779117444.gi=
t.marcelo.schmitt1@gmail.com?part=3D1
