Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A25444C66A
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 15:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214519; cv=none; b=Uwl7+zv6PmzLdsqpPnLejWYMXVSZk6NNFIQG/ZyYpCWoC33pd26QKw2jIjxd0cmSM4BwCssFRZfyYTJMzglzUgYPvyElw2pVpLCShceWFVLIgrjET4qA8wAazNLTEtT/OeVy9YegUm7JaPKQWZ5oEeqzLnE6ISsImT65rRDqDnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214519; c=relaxed/simple;
	bh=5Wlk3C4fPzSe03Z4PLzVc/xs4+zaEnZvEB0pYwXTbzY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JxJ+65ZcJHdOEcsWMxIOMCSRVMmmuWXkr0r6OA8vR7lIWPZ5Fw0gwMIr6H2+XiU/3jI2PMbRLJuXR0aIKT6W+aDxquX7w3+r3/e+h1VRzFvrh6PrMX/toleXig1yEFSTnNnLnLkGqWDnQP7umDWxYLU1RBG2lehsaRmhxaItC18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnK++8B1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnK++8B1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07C41F000FF;
	Mon,  5 Oct 2026 15:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214517;
	bh=S+lLtqdUAlDmA/Z+AYL4d+VhGHS79dW+b/gkn7k7mF4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HnK++8B1d3ZnDrDOGiHA2q9pM3PGK0c3ZOOI1FRSSlpnB46qw7vQUX+Blg9MOMog6
	 79m3bA2Oe0qPDbuDHxtYr9E/7dIGxnHZbM0Fa3lH6kVU1OE++N5bbvo0xTuGjaRduA
	 h7NBiAUjjlIDiybIMGFvWzZ9yScaprzhUG8mMX9cqD3WJWbzSwUwLDDIc18K70wPbh
	 lda9OkQnTIqxsjQjan+dDi+GV/h67E4a1wDi1l6AAR8P5l0cM3H59VUfJmma3mNwUB
	 yCNcMWMLqkrt5XF+v9YvBNg7ZpcpTHfI41UCjyHW+CQnlpqxa0kSyDDwxpqHlf1GH1
	 PmEE3ia7gDD0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: power: domain-idle-state: Add
 system-state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maulik Shah" <maulik.shah@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261005-s2idle_state-v1-1-3c402c66f388@oss.qualcomm.com>
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-1-3c402c66f388@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 15:35:17 +0000
Message-Id: <20261005153517.A07C41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] dt-bindings: backwards compatibility broken by reusing domain-=
idle-state
--

commit 7783b35f06985a4e4112599684740ef1b9b25325
Author: Maulik Shah <maulik.shah@oss.qualcomm.com>

dt-bindings: power: domain-idle-state: Add system-state

Some domain idle states require system-wide coordination and are not
applicable while the platform is up and running. Add a boolean system-state
property to describe these states.

> diff --git a/Documentation/devicetree/bindings/power/domain-idle-state.ya=
ml b/Documentation/devicetree/bindings/power/domain-idle-state.yaml
> index 4dd4f59bbbec3..35dab3cd6aedc 100644
> --- a/Documentation/devicetree/bindings/power/domain-idle-state.yaml
> +++ b/Documentation/devicetree/bindings/power/domain-idle-state.yaml
> @@ -45,6 +45,12 @@ patternProperties:
>            state will yield power benefits, after overcoming the overhead=
 while
>            entering the idle state.
> =20
> +      system-state:
> +        description:
> +          When present, this state requires system-wide coordination and=
 is
> +          not applicable while the platform is up and running.
> +        type: boolean
> +

[Severity: Critical]
Does adding this property to nodes that still use the "domain-idle-state"
compatible string break backwards compatibility?

When an older kernel parses a Device Tree containing a system-only power
state, it traverses the domain-idle-states phandles and matches the
compatible =3D "domain-idle-state" string. Because older kernels do not
recognize the newly introduced system-state boolean property, they will
silently ignore it and incorrectly register the system-only state as a
regular runtime cpuidle state.

If the runtime governor selects this system-suspend state during normal
operation, the lack of system-wide coordination can cause the hardware to
hang or crash. Device Tree bindings form an ABI between firmware/bootloader
and the OS, meaning newer Device Trees must safely degrade on older kernels.

Could a new compatible string (e.g., compatible =3D "domain-system-state") =
or
a distinct linking property (e.g., domain-system-states) be introduced
instead, so older kernels naturally skip parsing it?

[ ... ]

> @@ -77,5 +83,13 @@ examples:
>          exit-latency-us =3D <40>;
>          min-residency-us =3D <80>;
>        };
> +
> +      domain_power_off: domain-power-off {
> +        compatible =3D "domain-idle-state";
> +        entry-latency-us =3D <100>;
> +        exit-latency-us =3D <200>;
> +        min-residency-us =3D <1000>;
> +        system-state;
> +      };
>      };
>  ...

[Severity: Critical]
Does this example demonstrate the compatibility issue? A state explicitly
restricted to system-wide coordination still uses the "domain-idle-state"
compatible string, which would render it structurally unsafe for older OS
releases to process.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-s2idle_sta=
te-v1-0-3c402c66f388@oss.qualcomm.com?part=3D1
