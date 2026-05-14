Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117741519B4
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778734047; cv=none; b=L3mYJjtaCXtaG4iF+LMObpdR8xYPme2a8F+YHkwBAeQSdaZyIudy0GSAqzQXYhGrF7g+YLv54v5zLYi31NOVOnAgdW3JUhI11/cUHZoj7UgxBldKHKrYXmLnGm2uxqKioot21JDH6wVFHv8Bj7P+eg0mGbwWIJlpsuXcwyqp3/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778734047; c=relaxed/simple;
	bh=goa5AomLDKDFWr3qtgXgZK03TbphBjNDlJIfBlTPy8I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xzmy5M4JE4W3fE5VtknrJ02ebmO7XL3VZRUpvzKXRzUBE/rx+cmoep7B2yAM++psq9PWO9NBP5VnVDgcuNdJaGi2dOIWuOP2yFglL0c0hPzO0vmMRnHiCyLC1QoMV9ahpeThc3/8zwIQM0SfVe+h2w5p8OiOAmHPTrPcE+XLFZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sagEsKC5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sagEsKC5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57297C2BCB7;
	Thu, 14 May 2026 04:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778734046;
	bh=goa5AomLDKDFWr3qtgXgZK03TbphBjNDlJIfBlTPy8I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=sagEsKC5SmS2jRPAEVXR12ZzZc+xsy80Hr1r7Pf1gTCayARVrq3O8SC6yet4ID/9f
	 MMDXbKRp6nZ1vCqhBzVEdog5Ik2E3cYrNrOFsfGanG7k+/Ty8rsUb60GX57Tw8YNrT
	 MRk6qthnrmmFkfRn+roCslY7ac8OKTZRql2Ln6T8i/mO9N72fb4tRHiJecZKOshFBh
	 bUr6H2KXY3BHsGzwoscygd1/UDVcI624hPsOyUvNYkjmrUOsKsUB4rQuoJe8fyDW4O
	 pT6Y4eapP0IUZjUEddCAWUzVrfD4bNzid9HU3vkwZfbeDNXlA8cp62MtuIYV/fkjMj
	 cliL5Kb69Tehw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] dt-bindings: i2c: convert davinci i2c to dt-schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chaitanya Sabnis" <chaitanya.msabnis@gmail.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513123758.4955-1-chaitanya.msabnis@gmail.com>
References: <20260513123758.4955-1-chaitanya.msabnis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 04:47:25 +0000
Message-Id: <20260514044726.57297C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Omitting the 'clock-frequency' property from the device tree cause=
s a deterministic division-by-zero crash in the driver.
--

commit 75f02e0195256a57df4b6d329b0206def30928b6
Author: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>

dt-bindings: i2c: convert davinci i2c to dt-schema

This commit converts the Texas Instruments DaVinci and Keystone I2C
controller bindings from legacy text format to modern dt-schema (YAML).
It also makes the interrupts property required and adds definitions for
SoC-specific hardware features.

> diff --git a/Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml b/=
Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml
> new file mode 100644
> index 0000000000000..dd7a7ffa02d54
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks

Should clock-frequency be included in the required list here?

Omitting the clock-frequency property from the device tree causes a
regression resulting in a division-by-zero crash in the driver.

When clock-frequency is omitted, davinci_i2c_probe() falls back to
DAVINCI_I2C_DEFAULT_BUS_FREQ (100) and calculates dev->bus_freq:

drivers/i2c/busses/i2c-davinci.c:davinci_i2c_probe() {
    ...
    dev->bus_freq =3D prop / 1000;
    ...
}

Due to integer truncation, dev->bus_freq becomes 0. The driver then calls
i2c_davinci_calc_clk_dividers(), which divides by dev->bus_freq:

drivers/i2c/busses/i2c-davinci.c:i2c_davinci_calc_clk_dividers() {
    ...
    clk =3D ((input_clock / (psc + 1)) / (dev->bus_freq * 1000));
    ...
}

This executes a division by zero during device probe. Either the C driver's
fallback logic must be corrected, or clock-frequency must be explicitly
required in the schema to prevent this regression.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513123758.4955=
-1-chaitanya.msabnis@gmail.com?part=3D1
