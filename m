Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CD537B002
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 19:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778268380; cv=none; b=pC9nE9FDZ9A+eBQBHadwc2R5Jxkd4+KvdJFfb3XVJDowlB0tEGG3LidznWAKPYMCzJ8Kf+16/DrhE+/yTbJEr4L732R/p2NiuSj0qbnKooGTpeKHWLXZMPIQVNSNG4BEY1SI9XAo2tztsuViZ48wfUUkDDVJ/7C3Bas+ZKVjs6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778268380; c=relaxed/simple;
	bh=oN7SNrgiwicqbruA/wOrE7hOEHoCSbpg8YaZDmVLyok=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EJXGNVsLTO1mZeacE6ZSASOM/dAzp2+6+7qZ+ZDVrvlODQZ+KpuQkTRAzojuPG8Onk6UI8Y90pJwgxSfMY7UC3oOnDivq3Q60RINsJVWdouHU9Es76BLwUkf5CbdraRCONmFkJaVab/7nZCpTHlWjFrCf7+p7Zexp8x8LdlpmnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NfE2hmps; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NfE2hmps"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8810C2BCB0;
	Fri,  8 May 2026 19:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778268380;
	bh=oN7SNrgiwicqbruA/wOrE7hOEHoCSbpg8YaZDmVLyok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=NfE2hmps9DG/WHkjLYbN3WqnqEOiosWBZLyJaOQxdr1EV4Rzkj7XNEknzCraQeHaF
	 aQByFLR1A5dYsWUMgmij8gg1mqsU5RBtxQZ/117DEgBzS/iYKYMqyTsNxEYXM+hfjx
	 OCerBuk1ZNk/ZmcwvdRLNe04NO/5hgBpPihATXRrUS1UaQROObyIG6HBKfsMPO/m56
	 UONRAIdMOQ0y7B9QuMdL2DuMB2MNYoXjUoK9JzcucFr1Mv9fmNIF+jTyPJ8xMmF4KA
	 GcV7SIQVofZ4tIFQ7ZV9g9mNkbCcRPhoLjiaXHStgSkEB1Af0MOeEBwp9EY/BmMPIY
	 yVraJxDlPW/Lw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: interrupt-controller: Add support for
 Amlogic A9 SoCs
Reply-To: sashiko@lists.linux.dev
To: "Xianwei Zhao via B4 Relay" <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260508-a9-gpio-irqchip-v1-2-9dc5f3e022e0@amlogic.com>
References: <20260508-a9-gpio-irqchip-v1-2-9dc5f3e022e0@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 19:26:19 +0000
Message-Id: <20260508192619.B8810C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Nesting an `if/then/else` block directly under an `else` keyword vi=
olates the standard dt-bindings schema architecture for handling multiple c=
onditionals.
- [Low] The schema description block was not updated to reflect the newly a=
dded hardware capabilities of up to 20 interrupt channels.
--

commit b693f66cbc7c3dca220bdaf6db2d2cc269158d23
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

dt-bindings: interrupt-controller: Add support for Amlogic A9 SoCs

This commit updates the Amlogic Meson GPIO interrupt controller binding to
support Amlogic A9 SoCs. It adds the new compatible strings and increases t=
he
maximum allowed channel interrupts to 20 for the new hardware variants.

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlog=
ic,meson-gpio-intc.yaml b/Documentation/devicetree/bindings/interrupt-contr=
oller/amlogic,meson-gpio-intc.yaml
> index d0fad930de9d9..d26671913e895 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meso=
n-gpio-intc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meso=
n-gpio-intc.yaml

[ ... ]

> @@ -56,7 +58,7 @@ properties:
>    amlogic,channel-interrupts:
>      description: Array with the upstream hwirq numbers
>      minItems: 2
> -    maxItems: 12
> +    maxItems: 20

Since the maximum number of channel interrupts is increased to 20 here, sho=
uld
the description block at the top of the schema file be updated as well?=20

It currently states the hardware is "essentially a 256 pads to 8 or 12 GIC
interrupt multiplexer".

[ ... ]

> @@ -76,9 +78,20 @@ then:
>      amlogic,channel-interrupts:
>        maxItems: 2
>  else:
> -  properties:
> -    amlogic,channel-interrupts:
> -      minItems: 8
> +  if:
> +    properties:
> +      compatible:
> +        contains:
> +          const: amlogic,a9-gpio-ao-intc

This isn't a bug, but does this structure follow the standard dt-bindings
schema architecture for handling multiple conditionals?

The bindings documentation typically suggests grouping multiple if schemas
under a top-level allOf array, rather than nesting an if block directly und=
er
an else keyword.

> +  then:
> +    properties:
> +      amlogic,channel-interrupts:
> +        minItems: 20
> +  else:
> +    properties:
> +      amlogic,channel-interrupts:
> +        minItems: 8
> +        maxItems: 12

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-a9-gpio-ir=
qchip-v1-0-9dc5f3e022e0@amlogic.com?part=3D2
