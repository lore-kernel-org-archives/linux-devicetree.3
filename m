Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB041DE8BF
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935175; cv=none; b=FPl7uLjLU3i6TdEHrMjMUffmeaILFGVyLwZStSjsM9aUdV+pFJNzXgqns62niKiuwhJfFd+TAQd5mCHz0Uez7+Gft+f7BxBtKTsy7Zm1bdN9hitYIn3wol/rIS39u9naPgiEy9s9jCzum20JgnnCdUzy2bsDQRKeh9EPEu5LelE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935175; c=relaxed/simple;
	bh=QJO5Ck8CRxiBR5vGuESsLRPpM4HpxSmN6roiyTthWOw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T+hJxGNa/bsL7njbSnqPolrT94WiHwwMX4uLpA5bKu1/OPY/CYpvK9t1sfl+/5GamSq37OFPvv1/WNM6HKQEwfjtWnzxQjJOghwQYK3jy7RtJYasNtb2f+C7NqmVpsBQvwk5CJFt+SWAlckUlAEVIfhlmMLnH5oMZ/3ufV9Pkl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyMD2ExF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyMD2ExF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8ED1F00A3D;
	Wed,  5 Aug 2026 13:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785935174;
	bh=nLF5EBeOIfiK21IwaaV28ksu86QoUZIJsoJTGJTnvmA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FyMD2ExFtTskLP8Q67tzeOPnMhzgGLqjdwElzFUXm0CDiEgg3f60XdabqnO433rF0
	 F+LEPxWficWIT5KlYUfVybtTLOW/1lANqk3sx7NDlgz9r3pQJWkLgUyq4KTMp4k9y5
	 3yOw24NDseEpcVQT9+QpQudLNXmTdOy+d6SzIKnPy0NxAQyPrzopdanyfwDkgKhiHh
	 bIJTxB84PQAcRNffWN6vfKvuXjrHWe9Bvy39GIlD4wA8w/UBiZwXqADfBy/E8GFK6B
	 wmZUOPrrxsRkqA/dnbB1Iu2b+S9N7B7Px4wmTbjtCY9O9/GRiTB9ebPYi6+tTKHP9n
	 fG1ASNngeMXBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 34/36] dt-bindings: pinctrl: airoha: add support of
 en7523 pin controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260805123408.3767648-35-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-35-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 13:06:13 +0000
Message-Id: <20260805130613.DD8ED1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Missing label for phandle reference in device tree example
- [Low] Usage of deprecated integer assignment for `drive-open-drain` in ex=
ample
--

--- Patch [34]: [PATCH v10 34/36] dt-bindings: pinctrl: airoha: add support=
 of en7523 pin controller ---
commit 09684fda82523cf1b5b0d87b6f829c268435150a
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

dt-bindings: pinctrl: airoha: add support of en7523 pin controller

This patch adds device tree binding schema for Airoha EN7523 SoC pin
controller.

> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.=
yaml
> new file mode 100644
> index 0000000000000..599f80e94432b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    pinctrl {
> +      compatible =3D "airoha,en7523-pinctrl";
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
> +      gpio-ranges =3D <&pinctrl 0 12 30>;

[Severity: Low]
Will this example fail dt_binding_check compilation? The gpio-ranges
property references the &pinctrl phandle, but there is no pinctrl: label
defined on the root node in this example.

> +
> +      pcie1-rst-pins {
> +        conf {
> +          pins =3D "pcie_reset1";
> +          drive-open-drain =3D <1>;

[Severity: Low]
Does this use a deprecated integer assignment? The generic pincfg-node.yaml
schema typically expects the boolean flag drive-open-drain; rather than
assigning a value.

> +        };
> +      };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805123408.3767=
648-1-mikhail.kshevetskiy@iopsys.eu?part=3D34
