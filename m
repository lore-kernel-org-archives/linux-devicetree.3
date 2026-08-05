Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A423EB81E
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935174; cv=none; b=JPUSVk2gx5jGT0VBDpwkwmAL3x22hkJb9UOVWaz7Onacp8vkPmfGPM3uS08z1FmrtV8Bi9PTjbtORPUJRkvTwX3l1pBp8m06tGOWpkK6niHQpmP9iV0dvT4Fz9O1ixKs+Rv3wslKGKSJsnR39ZOyRbyAbmAvQQNcE3txnBe+1Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935174; c=relaxed/simple;
	bh=2TFsp1sep6lcvRfqtXI3bbyFhRsR0+BV9SSJ740s2gs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IOGqtuU63izqaHDbxfEproJ47UKhITdnSQ9pb5FnidfIn3pMD3LZWiYQuw7tgx9pQbOW+h9kYisJFaYbHZROd0fqbPswxjAZlIm3fdBk6tyAHFyKcDPBcbyro/vz4UTl/7F8iEruzkzAsYdmxFUf7GHiYwDLNewiHU3S5de4n44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IWmDme+i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IWmDme+i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 585CB1F000E9;
	Wed,  5 Aug 2026 13:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785935172;
	bh=ER4M01/GtJSlxlxxVFDqckqpeqUhJVL/T1MoaHyjGOo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IWmDme+ird+2tEDtpeDGMXrJZzAZM+I1rLBi4HJchYsX6bauXrXE88RnhCecJ94Is
	 lg1MqhGu4oEIxv0IokBr9oRQY9bBXGzW4I+WdIG3zEC6gqwjamU8PYGrVvVM2XCfVd
	 XkGCRz5Uu+psbOKXT3SX3QVKE2Acy64k98dUF5u0kE5D31lYIQX7ImZCXCNSAkbBAJ
	 17tuBkfbq6+CnPenuJKLkIWOfzd9rZ8L4bG1fM85ksOE8+l6tG68CNzzrlf4tnoB7O
	 MhTyBXuTCkaN0JgjyZiP3xp9fp+M17xRJCvkhEfG6HTc/pqDxmD6kKrKTvbMynVEFQ
	 c7ghDzPg9KYhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 36/36] dt-bindings: pinctrl: airoha: add support of
 an7563 pin controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805123408.3767648-37-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-37-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 13:06:11 +0000
Message-Id: <20260805130612.585CB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree example uses a deprecated integer syntax for the `d=
rive-open-drain` property.
--

--- Patch [36]: [PATCH v10 36/36] dt-bindings: pinctrl: airoha: add support=
 of an7563 pin controller ---
commit 083c48588a39707f2654e880799e2efa014bed0b
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

dt-bindings: pinctrl: airoha: add support of an7563 pin controller

This patch adds the device tree binding schema for the Airoha AN7563 SoC
pin controller. It defines pin multiplexing and configuration properties,
including an example node configuration.

> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.=
yaml
> new file mode 100644
> index 0000000000000..e626d34661285
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    pinctrl {
> +      compatible =3D "airoha,an7563-pinctrl";
> +
> +      interrupt-parent =3D <&gic>;
> +      interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +
> +      gpio-controller;
> +      #gpio-cells =3D <2>;
> +
> +      interrupt-controller;
> +      #interrupt-cells =3D <2>;
> +
> +      pcie1-rst-pins {
> +        conf {
> +          pins =3D "pcie_reset1";
> +          drive-open-drain =3D <1>;

[Severity: Low]
Does this example use a deprecated integer syntax for the drive-open-drain
property?

The schema defines drive-open-drain as a boolean flag. Using the integer
syntax <1> will trigger dt-validate warnings. Would it be better to write
this as just "drive-open-drain;"?

> +        };
> +      };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805123408.3767=
648-1-mikhail.kshevetskiy@iopsys.eu?part=3D36
