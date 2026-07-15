Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F38325701
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784097929; cv=none; b=kMTeFJzwEQKmThLI3R3HwAlsNrBpZt+EIVCq5lPDEpEy0uALEIX32Mui5boRILR+81eSPlmbqrEsDoR4omgib2M5EOcdbbLy/piZ6OzkqFdNytJLQFHHZSnseBdWuug3Xbg7hvKdZVHNAuU5sD4UWfsq4CNMv3GjA+1XbrRjKxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784097929; c=relaxed/simple;
	bh=dvB1ku2ih9N+hjXliA2dkGafHTZPyHGIiCoZ6VV4Jww=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d+vAEiQ2aIV5B3SBoxL55Q40jcLSu6sQiG1AsS3Og9fnPRe8G9FdGyNbENIiyZ3qZYq+foZGJl84uh3nqb+enrz6rPnVeRwAPs4vNTzW7sLnt6o9Ff+jWDK63vkAFxDhsX0FWUaECWEEKbLwj6hop4OVKFn9G+zs6UlXLZSnzjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A74U19e1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A74U19e1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3FF1F000E9;
	Wed, 15 Jul 2026 06:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784097928;
	bh=5TvmqIpdkwF7WoetwylVrCPOs3by5RB6hCKuAaseWEA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A74U19e1x38WjGTcTvjUXY3e/098asdUcTN4/zYdFdk5cATr8nW19tQGWC8Jrt948
	 V/rvHclJPCuM6weOGPtkGXAqsNl6W4HYmnNGMj8RfO8HQhkwjFYOeKuda2UdoDSHaH
	 gzNpty2MfzP8j4fihWIePGhBNsyQGNvXyZx3DkA943nCjlc1GDwRNg4uIM+hi5mBiR
	 Myslt0PrzN1cDNU9/HI9Gs5adgiTXxFqHCGrfdgWMsA+lq2zHyjOWd6vGGPPqYgtK8
	 cfizrZz4nLggLYV7wfKqQQOO+PlExrIQNEun2Dyf/bMf5wrN5JNi6kXL0MJskCheno
	 5oV08Tzp6JqsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: adc: add maxim,max40080
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Popa" <stefan.popa@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715063652.368501-2-stefan.popa@analog.com>
References: <20260715063652.368501-1-stefan.popa@analog.com>
 <20260715063652.368501-2-stefan.popa@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 06:45:27 +0000
Message-Id: <20260715064528.1E3FF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `shunt-resistor-micro-ohms` property is missing from the `re=
quired` list, allowing incomplete hardware descriptions to pass validation.
--

--- Patch [1]: [PATCH v3 1/2] dt-bindings: iio: adc: add maxim,max40080 ---
commit 102dd7d43e2e646eee1b098788f579fc92431947
Author: Stefan Popa <stefan.popa@analog.com>

dt-bindings: iio: adc: add maxim,max40080

This commit adds device tree bindings for the Maxim MAX40080 bidirectional
current-sense amplifier. It defines the required and optional properties for
the device, including an integrated 12-bit ADC and an I2C/SMBus interface.

> diff --git a/Documentation/devicetree/bindings/iio/adc/maxim,max40080.yam=
l b/Documentation/devicetree/bindings/iio/adc/maxim,max40080.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/maxim,max40080.yaml

[ ... ]

> +  shunt-resistor-micro-ohms:
> +    description:
> +      Value of the current-sense shunt resistor connected between the IN=
+ and
> +      IN- inputs. Used to scale the reported current.
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply

[Severity: Medium]
Should shunt-resistor-micro-ohms be added to this required list?

Without this property, the schema will silently pass incomplete hardware
descriptions during a dt_binding_check run. A current-sense amplifier
requires a shunt resistor value to correctly scale the measured voltage
drop into a current measurement.

> +
> +additionalProperties: false

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715063652.3685=
01-1-stefan.popa@analog.com?part=3D1
