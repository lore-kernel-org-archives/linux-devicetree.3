Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF774D90D7
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 21:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535745; cv=none; b=dOVGHmVR6htQO8x971P1i3fe3aM73UisG2D5U1MXWpkrKtrRdl+JL+tOpl+D9qFuevqQJ978bkJWgRXI5Ft4nK5N0loBdhhFEEdc2WE5RFuqmpQZWvz+7ofj1Dd5KnjHD0rdnjzHN69RpdjgjxWy6Mvb494DJvXP98Z1RBMzhz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535745; c=relaxed/simple;
	bh=bMgmH0cX4uqze+aH3mSr3MnSC2EmLLaqnP9xWJUrBAk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Snt36UtfUx5xxRc0F963c5sAQi1qZm8mepftT8ZY9dhHoZMsbSwhUrBRjdBPlUiWlk1fCrRHnfYerZe8vSd1Ve+3BGxHGU9TFvlVOgvqW2wDi4YZ1pLlI1+6pQ/bTS5IliqOyFu3Wj8kZWOTBxKdXa0aFKzs0iE4YYc+WewY7yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXu+AQzi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXu+AQzi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D72C2BCB0;
	Mon, 11 May 2026 21:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778535744;
	bh=bMgmH0cX4uqze+aH3mSr3MnSC2EmLLaqnP9xWJUrBAk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=TXu+AQzimxrobmDD/HFg3fp6fuSD11g+SJAfwTPZYHFqdbaeqEO5+HDURZeOUh5j3
	 I0wZpdw0yTUObpqkiR2TG/4pUTkYPzGhCPLfyz+2dBCH5hprNIzc52vmPd9eujU1+5
	 UwcatnqnWVWixS+DoDE5Dilmptzoh+22FoFfFLwciu0d4MOXeDkgcLJgitVufUxNIz
	 Pswo4wrwjX0KH59r+mPJM9fbqWhFj+topoMks42sBtCGN2DdgQHsVa80ctwN6P9ink
	 Qi2Zn7JKS+rE4YDnxRXlw4XVviZizlkOZrq1tDRhtAz2bP/mN4YWPjYkHBTOE2Bbdl
	 DRKB/8e7ReBhQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/2] dt-bindings: iio: magnetometer: add Melexis
 MLX90393
Reply-To: sashiko@lists.linux.dev
To: "Nikhil Gautam" <nikhilgtr@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260510191010.155380-2-nikhilgtr@gmail.com>
References: <20260510191010.155380-2-nikhilgtr@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 21:42:23 +0000
Message-Id: <20260511214224.47D72C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The devicetree binding documents only the I2C interface for a de=
vice that supports both I2C and SPI, artificially restricting valid hardwar=
e descriptions.
- [Medium] Essential physical hardware connections, such as power supplies =
and interrupts, are omitted from the schema and actively forbidden by `addi=
tionalProperties: false`.
--

commit 8e952d4236837623faf2f1c5e7d285f977fcfe5a
Author: Nikhil Gautam <nikhilgtr@gmail.com>

dt-bindings: iio: magnetometer: add Melexis MLX90393

This commit adds devicetree bindings for the Melexis MLX90393 3-axis
magnetometer and temperature sensor. It currently documents the I2C
interface for the device.

> diff --git a/Documentation/devicetree/bindings/iio/magnetometer/melexis,m=
lx90393.yaml b/Documentation/devicetree/bindings/iio/magnetometer/melexis,m=
lx90393.yaml
> new file mode 100644
> index 0000000000000..b99629ff25855
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/magnetometer/melexis,mlx90393=
.yaml
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - melexis,mlx90393
> +
> +  reg:
> +    maxItems: 1

Are essential physical hardware connections, such as power supplies
(vdd-supply, vddio-supply) and optional interrupt pins missing here?

Because the schema enforces additionalProperties: false, any downstream boa=
rd
devicetree that accurately models these physical connections to regulators =
or
interrupt controllers will fail schema validation. Could these properties be
explicitly listed to permit complete hardware descriptions, even if the
current driver does not yet use them?

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

Does this artificially restrict valid hardware descriptions by omitting the
SPI interface?

The commit message and subsequent driver commit (iio: magnetometer: add
support for Melexis MLX90393) explicitly state that the MLX90393 hardware
supports both I2C and SPI interfaces. However, the schema enforces
additionalProperties: false without referencing standard SPI properties like
spi-max-frequency.

Consequently, any valid board devicetree that connects the device via an
SPI bus will fail dtbs_check validation. Should the binding describe the
hardware component's full capabilities rather than just the limits of the
initial driver implementation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510191010.1553=
80-1-nikhilgtr@gmail.com?part=3D1
