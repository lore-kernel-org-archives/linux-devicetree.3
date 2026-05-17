Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCDB3CC9F3
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779043475; cv=none; b=mqJ8pUnO5rrTLT3M1LFm6C6e0FqJ643WJKqQHYncEXydkbMcLb/uJWvkn9+AEOab3ZyNlCSnQbeTscBgkzNU1LerRpH2Ch40FMKDLUAXUiU7UqarJvAK25GZM3zon3WO54EbuQ9KHvDl4oUBeP3dDCalM0AacUypCZljagW9JEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779043475; c=relaxed/simple;
	bh=JDLBF6ZpVOg2uYeZxHeX/EQXcwfcACA1ORZpLu1BdIk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=szGohV0xA0hBxHmT5KuLHuSmmIFXKrn4HbH0lJzJf93sS0pr3kgl3XheJ8Qr/SfWEQyFgfDf2P7cJH5bFdrYPY6ei2aRXkdC3qsDHBCd567WUH7us54sSWfB0xVYgHAKG6nOnNlbeyHSJ3wu5PcPfTt5XanFCoAmHXKHH8EuHt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6R+5YP4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6R+5YP4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FE2C2BCB0;
	Sun, 17 May 2026 18:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779043474;
	bh=JDLBF6ZpVOg2uYeZxHeX/EQXcwfcACA1ORZpLu1BdIk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=H6R+5YP4oxKJwNO+we2i9/AoHFxidL+Q1lJFv56rssPkz+Q+t54JxNn+yiZmq1jaF
	 Kj76B4+tdviirXTcbrgDZnweatzRCSiAiBcNBysoe6Ujp3rRnFVLqMOuhOWqyCHIDV
	 TVznolj80m8h3hbKqx+yknzPzWuKvZNB2EoDGIJiY4qTFdj2hVt1MnjA5pQ126ZXWZ
	 x8QdqAwDLaVu0lAZ2FBA3eDe/9FcQN40qSmfxnNb6yHUEdezt4Q3efypVlSwhWBZev
	 ab/2rg+iO7YJHBOmk1AB1nJli8bFk9GKkmvPB5kozfaCaWWBkUUbduVnatTt2Z1kLe
	 EZUbpb93YOSjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/13] dt-bindings: iio: frequency: add ad9910
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260517-ad9910-iio-driver-v5-5-31599c88314a@analog.com>
References: <20260517-ad9910-iio-driver-v5-5-31599c88314a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 18:44:33 +0000
Message-Id: <20260517184434.71FE2C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The `#clock-cells` property is missing from the `required` list =
and the `examples` section.
- [Low] The `interrupt-names` property lacks strict array item ordering.
- [Low] The `reset-gpios` property is missing a `maxItems: 1` constraint.
--

commit 873abe87012e16a8a1194f7d05ae22b3bea1a586
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

dt-bindings: iio: frequency: add ad9910

This commit adds device tree bindings for the Analog Devices AD9910 Direct
Digital Synthesizer. It includes properties for SPI, clocks, DAC current,
interrupts, and various GPIOs.

> diff --git a/Documentation/devicetree/bindings/iio/frequency/adi,ad9910.y=
aml b/Documentation/devicetree/bindings/iio/frequency/adi,ad9910.yaml
> new file mode 100644
> index 0000000000000..5ab0db62dbf1f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/frequency/adi,ad9910.yaml
[ ... ]
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum: [ drover, ram_swp_ovr ]

Should this use a list of const items instead of an enum? An enum allows the
array elements to appear in any order or contain duplicates. Using a list
with const constraints such as items: [ { const: drover },
{ const: ram_swp_ovr } ] would enforce the strict hardware mapping.

[ ... ]
> +  reset-gpios:
> +    description:
> +      GPIOs controlling the Main Device reset.
> +
> +  io-reset-gpios:
> +    maxItems: 1

Does the reset-gpios property need a maxItems: 1 constraint? The description
mentions it controls the main device reset, but unlike the single-pin
io-reset-gpios property below it, it lacks this constraint.

[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - dvdd-io33-supply
> +  - avdd33-supply
> +  - dvdd18-supply
> +  - avdd18-supply

Since the device defines #clock-cells, should it be included in this
required list? Hardware with provider capabilities typically needs the
corresponding standard properties explicitly added to the required list.

[ ... ]
> +            adi,pll-enable;
> +            adi,charge-pump-current-microamp =3D <387>;
> +            adi,refclk-out-drive-strength =3D "disabled";
> +            output-range-microamp =3D <0 20070>;
> +        };
> +    };

Does the example node also need to include the #clock-cells property? To
ensure validation passes, the examples section generally needs to include
all required properties.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517-ad9910-iio=
-driver-v5-0-31599c88314a@analog.com?part=3D5
