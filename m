Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475166;
	b=LE9QTxeh6dIDQhJgtjP6ebXJz5W3rsSrbUEv/5cyIgMP1hkpzrFHklJM7JpX8rP3CkHb
	 Mt6f52jg9rn3WXNukVDz3l/+lVsxn5h/iOONA4XaXeINlSiMCzYx0ujifjGtJHKuiH9uC
	 6qixY41BnXanB83bbWcP4OsYiUJYWcppiRI8xOY2VYvnYg8OEGAz/F1x/hIJV3RzE5Jxf
	 q7wPJS8fsZHViIul2SEo9r3P/niWKaa0JZZSp7BgtTcUAFexQcfU7h7q28u+Z1HkIKAxP
	 bm+Zvo/kT2yD2MdimcB3WM9Xt0wm6DXKEV+oYfBfGKAZOMJKxpIOyNeod2JvDK5s6VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475166;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dC3UN5nQ0VVQelkT4iy17nz3pU/SY/d79wQNA1v+0cE=;
	b=1th6XpJt+sJ+QkQq7Ygnn+/R2Jqu9phqQ+HSIR/XzkjQ/1pXPPzHTUtq//smDp7PukRN
	 R2eHmyW7T/73ywMj4O9+6MjM6kfxKebS2gW+GwexmyploAOBe38qV1d1yLvVucXXxJoav
	 g2aHYI7Dhg4pG0mrj8NPQA7kWfukbSjgLwctQcmxct+MpBNVh4DzgkUksgIyAdWmQMj/q
	 wl/P+UGElPwmo6PapzfNkkEdluTbuIkNecdkyxuP6vTAt5jI/Ws4UQiqa0S5s/mH0qdFN
	 c+xQKPChyLsVvIc7vqYdM4S+66d3GNKg0iCUiNV5XF1oO3hpcIcw3hm8Q8+v6tFxSiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kvJm3gBa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147DF606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kvJm3gBa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760421F00A05;
	Thu, 12 Nov 2026 09:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475165;
	bh=dC3UN5nQ0VVQelkT4iy17nz3pU/SY/d79wQNA1v+0cE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kvJm3gBa3cYuwQFLuc/w94vvr9LZucx8XMZxyAgqkJjoysWmzwyrBilKH9PyVKYri
	 iAE9R9VE9pslJx9T3QosGh2+n4ImpUsYyAa5JQkku/w8czCmXTlSFZNO0ocMbOQWFK
	 qWJra5LcCEb3ooFA9g/BJFt5SjmWH6953e19TfOppOq5RZAtC1EYPaedbJdB5+owD2
	 hUesHWYlJer0HnuyRHg5vGWL7025r/agbxP3iosbc+mhiYq8Y7aUxm2UeW3YZ5+sen
	 Gu7NzqHlbnu94GR9v6FlMmSX7TbEgzEZWhp7HJ1wh7YH9cxAw0K5DMU/nYokruMWTw
	 2rt01kpR3GjqQ==
Message-ID: <sashiko-outbox-210862@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: soc: ti: Document the
 ti,tda54-mcu-scm-conf
Reply-To: sashiko-reviews@lists.linux.dev
To: "Moteen Shah" <m-shah@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112091027.1601122-2-m-shah@ti.com>
References: <20261112091027.1601122-1-m-shah@ti.com>
 <20261112091027.1601122-2-m-shah@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 09:19:25 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dt-bindings: soc: ti: unresolved maintainer objection to
  ti,proxy-id
--

commit 5a8bd1f31bfabd409d005d1090df37a55a89dc38
Author: Moteen Shah <m-shah@ti.com>

dt-bindings: soc: ti: Document the ti,tda54-mcu-scm-conf

This commit adds a Device Tree binding schema for the Texas Instruments
TDA54 MCU domain System Control Module configuration register region and
its clock gates.

> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-co=
nf.yaml b/Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.ya=
ml
> new file mode 100644
> index 0000000000000..111cbb739b5f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml

[ ... ]

> +  ti,proxy-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 7
> +    description:
> +      Proxy region (0-7) through which this node's clients access
> +      claimable registers and their fault status registers.
> +
> +  "#clock-cells":
> +    const: 1
> +    description:
> +      The cell selects the ePWM time-base clock gate. Values 0 to 12 sel=
ect
> +      ehrpwm_tbclk0 to ehrpwm_tbclk12, i.e. the gate for ePWM instance N=
 is
> +      specifier N.
> +
> +required:
> +  - compatible
> +  - reg
> +  - ti,proxy-id

[Severity: Medium]
As reported by Krzysztof Kozlowski on v2 [1], is the custom ti,proxy-id
property needed here instead of the standard access-controllers binding?

For a single device where the full 0x20000 region covering all 8 proxies
is mapped from reg, the proxy selection does not describe a board-level
hardware difference, and gating register access per host or VM instance
duplicates Documentation/devicetree/bindings/access-controllers/access-cont=
rollers.yaml.

[1] https://lore.kernel.org/r/20261028-inventive-screeching-bettong-9f4240@=
quoll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112091027.1601=
122-1-m-shah@ti.com?part=3D1
