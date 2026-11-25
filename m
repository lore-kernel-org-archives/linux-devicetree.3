Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571031;
	b=vWhW46Sf/qfs/lhYyWNknAxCu2EkkW9bEsC9QpSYHppoxXALC0JT5KYoduXjZytY/iEc
	 A/7TbiQUVvXQ+ETe5mY7z2BmwQAUhDPJxQkQtvk4ddxuU8Pi/++Yu9VeBEAE8VPBqHZTU
	 8lDNfrnP5yajZWLMPjUZYrGqzFvCraG+2FFRvHqG9HMigff3SCHSwWvIWMpdXzCHsd9Ko
	 n91TZBd1loGzJ11lu2TWIEDalioR6RbqXQYIi05vsmDw7i1OJOwZO5a7O4APnl9LQmEMB
	 EGI9qu90jteqVnMqcj2oQwdh2KBzI7hIrhzBUdRE821M6j+BnbquefO4BABFGDPBkMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571031;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Knxp34eW0jHX+e8TM6o0Supiklc5BVyTPimFBOsysPY=;
	b=L+PHsGOym7VRtPAQKb89BZhFnotTLPzBGYCFiVRW9oqwiyvcK8bMgBQSvx8zHVbwJBa+
	 TEds1gq55xkkLMFAGd59O0YqAa21jPzI2pSVsZCoZMca/CWyaAHMmpYJ4PWCUjEvr4iOD
	 eRv/ZIZeLJ3KNg0pHxZbkLrDgDmaiABRJLLnSdVlSAU3WpacSyHt8f3BWhNBbAPS2B+Dx
	 UvuwY8hnYTm+wX5bSN8yj6RzF9ehApBGSTTJP0kb+gnf5W9wIXPGCA6emQMe9p28w+o5P
	 a8K/T8hMHXcuOyo+ymFitqUQz1a/Y6c0NJlKZfmZWm8FXuEEqXYhJ0dGIHL5o3sx4Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Stx4NpXM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C32D606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 01:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Stx4NpXM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663B41F000CF;
	Wed, 25 Nov 2026 01:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795571030;
	bh=Knxp34eW0jHX+e8TM6o0Supiklc5BVyTPimFBOsysPY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Stx4NpXMe6TGlB1uaKBxYDZT7vNeQ+RJTQku7sRmfriZqQA8bOtrHxD9pGoGPx+VT
	 RY5BWm/vulztiliVQ4eglacxWFC2GNaXDlPEeatosMCKk4U/JiHzTEOLkzEJ/vDz6r
	 dXA7+HNEO2MQC7wUKgJaGv3hkrpWXYzRVZNFo7P9AVN2N5b+zQ6nbjXr0XUfzXPI8R
	 R9ZxG/vaFvt+3NK/801qZ7ij3/DtpSvLZ/kiHl7ACB2QRmZNH1+SmrVPbbjUfPMC5Z
	 gsbKgbTTGZVfzBRx+XP785/sq1S2YUowIYtDYrWtcIseuzrj3CsM8XxEGHry2fuB7Z
	 DNiFOx4IEYOGw==
Message-ID: <sashiko-outbox-232333@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: timer: Add SpacemiT K1 timer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-spacemit-soc-timer-v3-1-e6390f3ae4a6@linux.spacemit.com>
References: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
 <20261125-spacemit-soc-timer-v3-1-e6390f3ae4a6@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:43:49 +0000
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
- [Low] dt-bindings: timer: interrupts listed before clocks in
  spacemit,k1-timer.yaml
--

commit 16e785f5241b621458eff707f48ab8e02a62ce8d
Author: Troy Mitchell <troy.mitchell@linux.spacemit.com>

dt-bindings: timer: Add SpacemiT K1 timer

This commit adds a Device Tree binding schema for the SpacemiT K1 and K3
timer block.

> diff --git a/Documentation/devicetree/bindings/timer/spacemit,k1-timer.ya=
ml b/Documentation/devicetree/bindings/timer/spacemit,k1-timer.yaml
> new file mode 100644
> index 0000000000000..b71785b8aa947
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/spacemit,k1-timer.yaml
> @@ -0,0 +1,71 @@

[ ... ]

> +properties:
> +  compatible:
> +    oneOf:
> +      - const: spacemit,k1-timer
> +      - items:
> +          - const: spacemit,k3-timer
> +          - const: spacemit,k1-timer
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: Counter 0 interrupt
> +      - description: Counter 1 interrupt
> +      - description: Counter 2 interrupt
> +
> +  clocks:
> +    items:
> +      - description: Functional clock
> +      - description: APB bus clock
> +
> +  clock-names:
> +    items:
> +      - const: func
> +      - const: bus
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/spacemit,k1-syscon.h>
> +
> +    timer@d4014000 {
> +        compatible =3D "spacemit,k1-timer";
> +        reg =3D <0xd4014000 0x100>;
> +        interrupts =3D <23>;
> +        clocks =3D <&syscon_apbc CLK_TIMERS1>,
> +                 <&syscon_apbc CLK_TIMERS1_BUS>;
> +        clock-names =3D "func", "bus";
> +        resets =3D <&syscon_apbc RESET_TIMERS1>;
> +    };

[Severity: Low]
This isn't a bug, but in DT binding schemas and example nodes, clocks and
clock-names come before interrupts (following the standard compatible, reg,
clocks, clock-names, interrupts order) in properties, required, and
examples.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-spacemit-s=
oc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com?part=3D1
