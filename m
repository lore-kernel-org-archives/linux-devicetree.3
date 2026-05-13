Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC543128AB
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778646385; cv=none; b=lW304DdG8g+WmbLWrZo+SAYv4h03ZorRymJR48N3VVSDgujxfPVrG51NL71vmUzGqfVEeQeZZYXEfQej+ltJJBMKAbXqtH5asoJ9SLR9AmOVKnQGknFnGtpZe4hijjetXYO/99A/9yH5/ynyM0STtaOQRAvexug5dq8w3BsMLSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778646385; c=relaxed/simple;
	bh=0S7gxUmxUSwsvNbH2aTww2u8qVU44h8+3ekq9LliEYw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JTpa0NY9G5zfHvuZh6fcwJzVPXL7LjOfR6iokFTcPCtG4E5IP6A4EWsfoToRJh/sddA0bSLY3MTSQVu8vNP5hv3OsuaK1hRZfpBvHyOWTW4Hc6kUjQ9Q5ZF9jrU3TpC3YgII5V6xpBNaFwlCMa6u17n4AL98sBS/kzYp+TCOKF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gO6J+VDU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gO6J+VDU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEBA0C2BCB7;
	Wed, 13 May 2026 04:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778646385;
	bh=0S7gxUmxUSwsvNbH2aTww2u8qVU44h8+3ekq9LliEYw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=gO6J+VDUZtlXCLanbV2rIrR9vwqcGB/XRAc+GIz42sMXXrcWgYeExlIjy0uS7wtl/
	 /tKywL3K57KYY4vgWcx/ijg58RlW9mcvBwhagUdWUz7JD/zylJh6W4VyazcSqJM7Cg
	 wHhnO9IrhF9az+JSH4blwH7HPuyt3iLyqavS4S6Bp9W9GiuEpRrUbp66zTIj2n9Edm
	 ZTPxd0fLJRYH3656Osb94BethAnHDedEjTilqBW1kQfNKDHv+xYB60Lek6w4xlJ1Mc
	 /z+7sfgdImSinq8GaZdPZSrfJbwsLwDTx6bdfRs5TI7V7n+Sb29wjoEDffIPjwSCrZ
	 OwN6B1WdQfO7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] dt-bindings: gpio: realtek: Add
 realtek,rtd1625-gpio
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260512033317.1602537-6-eleanor.lin@realtek.com>
References: <20260512033317.1602537-6-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 04:26:24 +0000
Message-Id: <20260513042624.CEBA0C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing required properties for interrupt controller capabilitie=
s.
- [Low] Mismatch between the commit message description of register blocks =
and the `reg` property constraint.
--

commit e48cb449a1787cbc350f702042fd90d1f1e83047
Author: Tzuyi Chang <tychang@realtek.com>

dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio

This commit introduces device tree bindings for the Realtek DHC RTD1625 GPIO
controllers. It notes a per-pin register architecture and includes properti=
es
for configuring pins and handling interrupts.

> Add the device tree bindings for the Realtek DHC (Digital Home Center)
> RTD1625 GPIO controllers.
>=20
> The RTD1625 GPIO controller features a per-pin register architecture
> that differs significantly from previous generations. It utilizes
> separate register blocks for GPIO configuration and interrupt control.

The commit message states the controller utilizes separate register blocks
for GPIO configuration and interrupt control. However, the schema constrains
the reg property to maxItems: 1 and the example uses a single contiguous
block.=20

If these are truly separate memory regions, should the reg property be
updated to define multiple items? If they are internal register groups
within the same memory-mapped region, could the commit message be clarified
to reflect this?

> diff --git a/Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.=
yaml b/Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml
> new file mode 100644
> index 0000000000000..f13c910b73c69
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - gpio-ranges
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +additionalProperties: false

The binding defines interrupt-controller and #interrupt-cells properties
earlier in the file, and the example demonstrates their use.

Do these properties need to be included in this required list? Since the
hardware acts as an interrupt controller provider, adding them to the
required list would prevent incomplete device tree nodes from silently
passing schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512033317.1602=
537-1-eleanor.lin@realtek.com?part=3D5
