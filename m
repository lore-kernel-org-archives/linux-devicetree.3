Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D6F23393A
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 14:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779979537; cv=none; b=ru4cnH6FwOnOMsl05SBe+J2j0bDjO65s9LKk/cHnBJWA1L+oa/pUWY707bmOoc+C1fkW0vx/C/8g3/UDVNS7/Twq6yjZK0S8bwOqC1seYNs7459jPEmqtaZGB6aHHZm09whuEtYu6Z5NlCcy7sZmt6NC4nRpF3f4t0kFqmmKC4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779979537; c=relaxed/simple;
	bh=O0QMZJLtL7ud7eG056Wwu+ozgio/4FO8GhX1Duibz8g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PB6v9JvVgzSeSjUbRiybUfT3f9ZgdZIF4HwmkvlxEN9ldIMPVpYgdCB0Qy56QBdCeivKkO3yyuELS/Ju8YagRmdkxavoto7P4EAds3eBEr79RDhfLi70W+zPRyabApeq2GkCroi5vLgHqfwbuX8MImdmrmYUZnrokzPJastR7dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBnPEGzy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBnPEGzy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BCEA1F000E9;
	Thu, 28 May 2026 14:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779979536;
	bh=0CCOUjHN9AgVfOZ/K8eQW9u4BPjvGllly5HxrE3cn1c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZBnPEGzy85hUxsZ+IVCYZJPT0M4Daf/PO+kH5p3PhpQ9HfrN4Y4Z7z3WTIYSXB8Bb
	 pZwqQFlZs70o/bYZehqUUj2fbRD4z+5grPch4mlZCVoU+WkDS+EXnOif9WoiK31UJQ
	 ha5SQDDXxR4iyaTsIgm0cuyE6/uWf5D7BTf04L9SwgzpfxgtS9dVwwz/ZrIDSBJk7W
	 gWgqVIuBNMPIeSaLpMLzT1AqimXvRRkOi8fvw+1RcjzAWa006EL2hAXIN+dM9qzstU
	 T4pxfblwTxio0oZ4GaJBTpu6BVzHNYgkAofwjpIsEO2qEqgM5cG/Y22Ea5IXWMeOSj
	 J4eRAFnZ0Dt6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/5] dt-bindings: timer: econet: Update EN751627 for
 multi-IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260528140046.2897674-3-cjd@cjdns.fr>
References: <20260528140046.2897674-3-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 14:45:35 +0000
Message-Id: <20260528144536.4BCEA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The commit modifies the `compatible` property to remove the fallba=
ck and strictly require 4 interrupts for the `econet,en751627-timer`, break=
ing backwards compatibility with existing device trees.
--

commit 4d76d221e102e3fd0badbb607f955a94dc92884a
Author: Caleb James DeLisle <cjd@cjdns.fr>

dt-bindings: timer: econet: Update EN751627 for multi-IRQ

This commit updates the device tree binding for the EN751627 timer. It=20
modifies the binding to require an individual IRQ number per timer instead=
=20
of a single shared percpu IRQ.

> diff --git a/Documentation/devicetree/bindings/timer/econet,en751221-time=
r.yaml b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> --- a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
[ ... ]
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

[ ... ]

> @@ -52,21 +51,31 @@ allOf:
>            items:
>              - description: VPE timers 0 and 1
>              - description: VPE timers 2 and 3
> +        interrupts:
> +          description: An interrupt for each timer (one per VPE)
> +          minItems: 4

[Severity: High]
Does this change break backwards compatibility with existing device trees?

The previous schema allowed compatible =3D "econet,en751627-timer",
"econet,en751221-timer" with a single interrupt.=20

Modifying the compatible property to an enum without the fallback and enfor=
cing
minItems: 4 for interrupts on the en751627-timer means any existing device =
tree
using the old schema will now fail validation.

Can this cause boot regressions on previously functioning deployed systems =
if
an updated driver expects 4 interrupts and attempts to index into an
uninitialized IRQ array?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528140046.2897=
674-1-cjd@cjdns.fr?part=3D2
