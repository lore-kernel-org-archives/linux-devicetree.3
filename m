Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2973C2782
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 11:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758963; cv=none; b=cWlc4y0BldqlM+zJWZ0F7MonMWJe54vARu5cOWLCQ0monOc4899BgYDA9vAulUgwRx78o/aY4Zy064P+bfaDjtk3qRhBZQFT8c42lPw5Hes+1Lvaxlw4fxgkAwT+gpCqB2QXmshVIVVG3hzmOYPGAHJUewJbNlMmPZcZRA2NG9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758963; c=relaxed/simple;
	bh=YuTTUf3EjoDTR3ToVyq6H4LtWo9imwHNIly1/E14Jk8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OZxxOhsGoDE1Q0v5/ZTVmC42Hf/OuSQC7QMSk0boQppG3BiqgjYq6Q9aPay6nREjtwxOQhO4fZIUQ//1m4sgWMmDFpaqTt8IQHDB30OaBLqLGk6FTziSQgxj2GaC7h8K4ggc4wnOjNqtfRe7VBc5uujCBxWn/gf3v+Z7kUa7CG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LjRIKife; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LjRIKife"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126F4C2BCB3;
	Thu, 14 May 2026 11:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778758963;
	bh=YuTTUf3EjoDTR3ToVyq6H4LtWo9imwHNIly1/E14Jk8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=LjRIKiferghIfKJsY0G5z65g8WqpaVJJ2TtpBzs/yrUvyCJwk2T2guAXqgmvyRyvQ
	 Rb6uHaoyT2A6bPr0Rb1eVQXFtQHZXMJwTkpVgvGAirm4fdgbanSzAcnbxDTcOENb0G
	 Po8rXc8L7ec51gKtqyJW1iFc6R3AJ6/zj3219aGAhb8gwsG1KvHsBk5lAzOyrjzb+z
	 ZeWX0lMKvyOcTUe4+lWP+pQnQkRccZN7GzoYiCh+ov75aT3alpBfkKNvFqBxMVcJgG
	 nR6c+DfPNEaQU8vrTkl+O6ei/uRCj/hk7tIU4MQPGjbtruubRETp1rM8PnoAXrFsXv
	 wx4FKthx9KfWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: timer: econet: Update EN751627 for
 multi-IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260514000601.3430262-2-cjd@cjdns.fr>
References: <20260514000601.3430262-2-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 11:42:42 +0000
Message-Id: <20260514114243.126F4C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Invalid fallback compatible string for incompatible hardware.
- [Medium] Outdated top-level binding description.
- [Low] Missing item descriptions for the new interrupts.
- [Low] Grammatical errors in the commit message.
--

commit 5cbd9643ff098f6fa9a3e82043e46dcf9b0a9953
Author: Caleb James DeLisle <cjd@cjdns.fr>

dt-bindings: timer: econet: Update EN751627 for multi-IRQ

This commit updates the en751627 timer hardware to use individual IRQs=20
per-timer rather than the shared percpu IRQ used by the en751221 family.

> The former uses a percpu IRQ for all timers while the
> later uses an individual IRQ numbers per-timer.

This isn't a bug, but there appear to be typos in the commit message.=20
Should it say "latter" instead of "later", and "individual IRQ numbers"=20
instead of "an individual IRQ numbers"?

> diff --git a/Documentation/devicetree/bindings/timer/econet,en751221-time=
r.yaml b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> index c1e7c2b6afde1..f338739e039c6 100644
> --- a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml

Does the top-level description in this file also need an update?=20

It still explicitly claims that the timer has a single interrupt line using=
 a=20
percpu-devid interrupt mechanism, which is no longer accurate for the entir=
e=20
binding.

[ ... ]
> @@ -52,21 +52,31 @@ allOf:
>            items:
>              - description: VPE timers 0 and 1
>              - description: VPE timers 2 and 3
> +        interrupts:
> +          description: An interrupt for each timer (one per VPE)
> +          minItems: 4

Could this include an items list detailing the specific purpose of each=20
of the four interrupts? Defining an items array for each interrupt (such as=
=20
Timer for VPE 0, VPE 1, etc.) would help ensure clarity for driver develope=
rs=20
and enforce a consistent definition order.

[ ... ]
>  examples:
>    - |
> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
>      timer@1fbf0400 {
>          compatible =3D "econet,en751627-timer", "econet,en751221-timer";

Is it safe to retain econet,en751221-timer as a fallback compatible string?

Device Tree fallback strings declare that an older OS can safely operate the
hardware using the fallback driver. Since econet,en751627-timer uses four
individual shared IRQs while econet,en751221-timer strictly uses a single
percpu IRQ, they appear to have fundamentally incompatible interrupt
topologies.

If an older kernel boots using the fallback, the legacy
timer-econet-en751221 driver will attempt to map the first shared IRQ as a
percpu IRQ via request_percpu_irq(). This will fail with -EINVAL, causing
the timer driver to fail to initialize and potentially leading to a boot
failure or system hang.

Should econet,en751627-timer be defined as a standalone compatible string
without the econet,en751221-timer fallback?

>          reg =3D <0x1fbf0400 0x100>, <0x1fbe0000 0x100>;
>          interrupt-parent =3D <&intc>;
> -        interrupts =3D <30>;
> +        interrupts =3D <GIC_SHARED 30 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SHARED 29 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SHARED 37 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SHARED 36 IRQ_TYPE_LEVEL_HIGH>;
>          clocks =3D <&hpt_clock>;
>      };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514000601.3430=
262-1-cjd@cjdns.fr?part=3D1
