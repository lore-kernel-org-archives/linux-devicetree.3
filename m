Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909715;
	b=lnvTeQVp+dfh30ox6aAMoL4Pf8lcARfMz9tKZAd7xubpvPpXK/YuZ748Ug2sbTlSNstf
	 4pUWEwMqigt9abZZRBghL1IOL7xSbzXmyLlE8Wql5xYH9SaCD6iFeUETCvZZtScB/xp9y
	 UFk8p67vBoN2wWsIpTCNcYXVmDRXPAqnXmnfiADzDESS0p/ZLb5fqqk6iMbzQ9VMZAexw
	 bI41rXMuVZOniIqv+5x+T0lCWfk5O9YtUCBN4M8/cB711NYWA1gSp5UxpvliAKsMiCS1L
	 1pUYfp5RnggvRAZz1vrae34wR9Bd1nflsxwaFkMnrwC5CZnnOD48qmZX5uTAB5M/jJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909715;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9pVZ+jJ/bVXK+jdihsxOMCdIN2akcWxFqQ2yg1YWq48=;
	b=nhRZE83tVIGZIxNVvpOyKPx1af++aa7AcrcgdJLOP5Wq+qpKPGo3UcEcYKbnYJkg96mU
	 mAlw2F3x67G5J+ubn8mejxFPzX5muLZkoCOQLQrPF3wQUoinYROR9K34guv6TSO/RJHeq
	 6zzS2h99DYKet11wiK5JT4jI8KSZmym3bWcNy9o58yCN232WcI/QMjz4/3MZ+fetwSglP
	 bArNbX0xeHZxd+alxixXBngCGFpxQ7Kd2M5Nma0kHgeRavBUZJLkuhW0PoMpuloa2R9ww
	 4JDFMZqo+I0JmIFkkTIhn2QEz8vwiv9nmU/nvNKqwhPUVYz6TLrfikjm2YjC69hrZRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aYt9Fcdf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16482606A323
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aYt9Fcdf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1711F000C8;
	Tue, 17 Nov 2026 10:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794909714;
	bh=9pVZ+jJ/bVXK+jdihsxOMCdIN2akcWxFqQ2yg1YWq48=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aYt9Fcdf8Dg8jwftC9IYBNjdd2NDENoRuSN8TBkwy4hydQI0jBL76CrOmuLBrhJU3
	 Jr3KOLAYuzO9f1VLBFrO9u5KvZlcfAyEnr+A27BRTo4QSPY28B5NZBPbw3NZx+RvRF
	 ZHiURMEoc5/h+TAHYamIrT9o9oKrA5stk4H9IJ4oyKsFV2OEq3wln8km2ihw66ZCdJ
	 /fJlawj+E1HFQeP9uO3e6mrWsIyX8iZoFg56qf+maqEiTwBk2gIpR1AAqUY2LArANZ
	 NLqrme3/AO9RVgye5sVl6Jjr7IA/MjPpkxxKO1Kb6LbRJ8zkY39snzxzYDSx2Jz9Mj
	 9J0mTnTb016Sw==
Message-ID: <sashiko-outbox-218561@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 1/5] dt-bindings: timer: econet: Update EN751627 for
 multi-IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117095117.173316-2-cjd@cjdns.fr>
References: <20261117095117.173316-1-cjd@cjdns.fr>
 <20261117095117.173316-2-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 10:01:54 +0000
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
- [Low] dt-bindings: timer: econet: unwieldy per-compatible conditionals
  in schema
--

commit 03be033e22c76ce913aa7cba221851095ea46465
Author: Caleb James DeLisle <cjd@cjdns.fr>

dt-bindings: timer: econet: Update EN751627 for multi-IRQ

This commit updates the EcoNet HPT binding for EN751627 to drop the
econet,en751221-timer fallback compatible and require four per-VPE
interrupts instead of a single shared percpu-devid interrupt.

> diff --git a/Documentation/devicetree/bindings/timer/econet,en751221-time=
r.yaml b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> index c1e7c2b6afde1..ac25785ecfdf6 100644
> --- a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> @@ -12,24 +12,23 @@ maintainers:
>  description:
>    The EcoNet High Precision Timer (HPT) is a timer peripheral found in v=
arious
>    EcoNet SoCs, including the EN751221 and EN751627 families. It provides=
 per-VPE
> -  count/compare registers and a per-CPU control register, with a single =
interrupt
> -  line using a percpu-devid interrupt mechanism.
> +  count/compare registers and a per-CPU control register. On EN751221 it=
 uses a
> +  single interrupt line using a percpu-devid interrupt mechanism, and on
> +  EN751627 it uses an interrupt per VPE.
> =20
>  properties:
>    compatible:
> -    oneOf:
> -      - const: econet,en751221-timer
> -      - items:
> -          - const: econet,en751627-timer
> -          - const: econet,en751221-timer
> +    enum:
> +      - econet,en751221-timer
> +      - econet,en751627-timer
> =20
>    reg:
>      minItems: 1
>      maxItems: 2
> =20
>    interrupts:
> -    maxItems: 1
> -    description: A percpu-devid timer interrupt shared across CPUs.
> +    minItems: 1
> +    maxItems: 4
> =20
>    clocks:
>      maxItems: 1
> @@ -52,21 +51,31 @@ allOf:
>            items:
>              - description: VPE timers 0 and 1
>              - description: VPE timers 2 and 3
> +        interrupts:
> +          description: An interrupt for each timer (one per VPE)
> +          minItems: 4
>      else:
>        properties:
>          reg:
>            items:
>              - description: VPE timers 0 and 1
> +        interrupts:
> +          description: A percpu-devid timer interrupt shared across time=
rs
> +          maxItems: 1

[Severity: Low]
This isn't a bug, but once econet,en751627-timer drops the
econet,en751221-timer fallback and defines its own reg and interrupts
schemas in the if/else block, only clocks (maxItems: 1) remains shared
between the two variants.  Would it be cleaner to split
econet,en751627-timer into its own binding schema document rather than
defining most of the binding inside the conditional?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117095117.1733=
16-1-cjd@cjdns.fr?part=3D1
