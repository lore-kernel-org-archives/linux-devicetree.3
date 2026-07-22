Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9254C30C631
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784707902; cv=none; b=M7mpcAtbJVDSBUAx06Qwl6yFyNIh4LlJ4S0ZQwDIzaDblchTUFcLGEdd9VPXhz08uxGS08zDHCanlm6L5I9TN9+GwE1UjPR5DhsshKzrI5enMl5qAaaZ1TSKcUKY7Lon5sZSnp6AuQ0laUFFA1enQqdY4VQMHLKR6iUuz8DQ/lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784707902; c=relaxed/simple;
	bh=bUeqTUQ6er6iNZzMy/4JR+3J2Xhyc7RN45GSzwo7lwg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uJ/iF6PoinMm7/0psgrkG8lBbvGDnwYzQsI5P7Huu4tHPcMwgGo7zYYpDTBxOsketpXDEEXGHUBTdsNQUA66fEvVNY7X1yXUAA4ed8AkVZPV2kKhngRHGCtDqRm6THACqlT72ShVSukSIRxM6527sVF0uw0FBQajHAuaWqfh3Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9BFDtvy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9BFDtvy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293021F000E9;
	Wed, 22 Jul 2026 08:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784707899;
	bh=MeQKQ5JEQ1TjrVWAdJROzU7xA/0hSV4dKdRgNEp7B7k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a9BFDtvy8tHiiV4PHlAJt+azuw9015aV1xTzd892zoFW6vVAIonM+k1OoGXheUdvA
	 uS4mzZZKalS8IjydO3kRJkBi6cxNCGaYo8CKsNvkz+fjIl4W/6XE5OW7R2EahxyQc2
	 Nve2Ewedxr0xDs+ATnnEi7AN0ju/Wt8pC6UwAmCLqouXSDaR5tVyP7ZN4xAU9mi7Gg
	 vdsYXftzvSIvvWPAs4mvjJfWB89Vl1K1oFJK1zWDAq3U7uguiazXhCi+fk1BhYW/pf
	 KpDI2u5zHPOVR83pizVwXAGzfqyS8B3gx4OaSz79TqGkh/PTBWS5rfrxHR4u8a0vZv
	 4qswYRg5UGjXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/7] dt-bindings: iio: dac: Add AD5529R
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-ad5529r-driver-v7-6-7781cd74ad75@analog.com>
References: <20260722-ad5529r-driver-v7-0-7781cd74ad75@analog.com>
 <20260722-ad5529r-driver-v7-6-7781cd74ad75@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 08:11:38 +0000
Message-Id: <20260722081139.293021F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The child node schema uses `additionalProperties: false` alongside =
a `$ref`, which incorrectly blocks valid properties from the referenced sch=
ema.
--

--- Patch [6]: [PATCH v7 6/7] dt-bindings: iio: dac: Add AD5529R ---
commit 7d0649d467110abde25b98986887b22fbe5ea358
Author: Janani Sunil <janani.sunil@analog.com>
Subject: dt-bindings: iio: dac: Add AD5529R

This commit introduces device tree bindings for the Analog Devices AD5529R,=
 a
16-channel, 12-bit or 16-bit high voltage DAC. The bindings specify power
supplies, SPI interface parameters, GPIOs for reset and clear, and individu=
al
channel configurations.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml b=
/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml
[ ... ]
> +patternProperties:
> +  "^channel@([0-9a-f]{1,2})$":
> +    $ref: dac.yaml
> +    type: object
> +    description: Child nodes for individual channel configuration
[ ... ]
> +    required:
> +      - reg
> +
> +    additionalProperties: false

[Severity: Low]
Will using additionalProperties: false here block properties evaluated by t=
he
$ref to dac.yaml?=20

Standard DAC properties like label might fail validation during dtbs_check
when added to channel nodes.=20

Should this be changed to unevaluatedProperties: false instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-ad5529r-dr=
iver-v7-0-7781cd74ad75@analog.com?part=3D6
