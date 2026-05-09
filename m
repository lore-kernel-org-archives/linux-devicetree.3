Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F712FD695
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 18:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778351310; cv=none; b=a513oK5JTeXPcmS0QIiEMQ1r62NMi/ZQx4xOXSXsm2aLn8Ui3e0xR9UQ6OqcfSSwgoJ/qaMg0ME5/qBMwfMHEGt6bwgNqFwl9AUbka7V2muTHW36CYGXhpYH6khNPQWc1meAkg5pjuyF60o1YRi3WxU7XNHtvorPY2JQvsfpBCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778351310; c=relaxed/simple;
	bh=v3hDIsVoYKBUHDLvAnoZqbEWF4Zyr3qf2LOBqaaQCTk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gYFwJ+YS9fLBvsXDIdlaYwR9ur7TFNu/W5R8E+S7w69ZHisiFH3gtUmg9NHygZYxwhrG4mnCbQg9ViZD3s9IoHniV6gm82W0S+49C6L/EGjS92wqC2ph3mA784eM8mSjzkhkZhnhjR5QEyOUH1lFdI8bimp7xsLNRLPobgr0soI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4COe5EL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4COe5EL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C25C2BCB2;
	Sat,  9 May 2026 18:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778351310;
	bh=v3hDIsVoYKBUHDLvAnoZqbEWF4Zyr3qf2LOBqaaQCTk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=S4COe5ELoEZmR6bWTDYCGenqVGAMAtcFnQJlEFzbK5d4zR1OgUhTbVGzjRIfBfbmm
	 2OWwEIhw/DKUWVC7o3lLE2SoHPKORzoS2SrL4JaXmAu9Uf8vUcgJl7phtH+KeTQwRs
	 MiUryH4sfqJ427dYbUJqhZkZOImyrdbLKtaw2xJ67/5e9EAJwqjUzQYXndmTYnyOKn
	 DSIipMPEOJ7BuFjlOgwrMDaQKEF+R1d2ld9BJaT2rloEUoj5JX77eZ4e/WxOPB5njV
	 kzCsWrco7ZHIbq28wNWF4ulS60wPsq+pqTTxPHCqGPT7hdAMuVIgHpqa73a5J0jSKB
	 R94CcThPED6Ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: rtc: epson,rx6110: Convert to DT Schema
Reply-To: sashiko@lists.linux.dev
To: "Udaya Kiran Challa" <challauday369@gmail.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260509181909.21871-1-challauday369@gmail.com>
References: <20260509181909.21871-1-challauday369@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 18:28:29 +0000
Message-Id: <20260509182830.40C25C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The use of `oneOf` in the `if` condition allows invalid configur=
ations with exactly two SPI properties to silently bypass validation.
--

commit 61c42b03c451c90501fbc1f5dfb0ec651bc79cc8
Author: Udaya Kiran Challa <challauday369@gmail.com>

dt-bindings: rtc: epson,rx6110: Convert to DT Schema

Convert the Epson RX6110 Real Time Clock devicetree binding
from the legacy text format to DT schema.

> diff --git a/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml b/Do=
cumentation/devicetree/bindings/rtc/epson,rx6110.yaml
> new file mode 100644
> index 0000000000000..09578de45d8db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +
> +if:
> +  oneOf:
> +    - required:
> +        - spi-cs-high
> +    - required:
> +        - spi-cpha
> +    - required:
> +        - spi-cpol

Does this oneOf condition allow invalid configurations with exactly two
SPI properties to silently bypass validation?

In JSON schema, oneOf requires exactly one of the subschemas to evaluate
to true. If a device tree node provides exactly two of the three SPI
properties (e.g., spi-cs-high and spi-cpha, but omitting spi-cpol), the
node satisfies two of the required conditions.

Because it matches two subschemas rather than one, the oneOf condition
evaluates to false. Consequently, the if condition fails, the then block
is skipped, and the schema successfully validates the incomplete node.

Would it be better to use anyOf here instead, to correctly trigger the
requirement that all three properties must be present if at least one is
provided?

> +
> +then:
> +  required:
> +    - spi-cs-high
> +    - spi-cpha
> +    - spi-cpol

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509181909.2187=
1-1-challauday369@gmail.com?part=3D1
