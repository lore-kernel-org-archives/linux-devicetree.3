Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0676F346E4A
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 21:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778794634; cv=none; b=RYiPGvW+3tDlvOssnsxS3SbSznQep2meqclDpxx74NjCfNl65whsF/KqmWnMKD7sAWlItX/VllpYlcMPi06Lw1Hyn735eLMcAdRq3zWPYuE4HDMlQH+ANdNVoiENFZCTVKoGESHYKuaDRT4uXqJFuMF1oFLlOa0JwtbSFOJcK/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778794634; c=relaxed/simple;
	bh=aKgFbkut7PleVQSxtD6l9bxw2kqzJFRpUZutow088uw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qz2tBDEjh7X5eTmkFTHV9UiRzs42UXoCgZWep5FkANSHXtfnAQzCPsEA7hMd3FMzQXNmRloNuTTG9Opf2mCfhgl1ruixY3eJEEl6AMngQgYf+X8qWRv2+Zmfku/oGTp+UG/8Ca4iXe2yTIZnnYYog4GMEn8DfBkv2NZmvAEfsnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KlCXAxaL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KlCXAxaL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D47FC2BCB3;
	Thu, 14 May 2026 21:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778794633;
	bh=aKgFbkut7PleVQSxtD6l9bxw2kqzJFRpUZutow088uw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=KlCXAxaLVlBB3VUyZpQBHFFyfGB2d+PvylsQ9jTNgOCxPZbiHQpEiJQfLCkRsqvlg
	 OAhyLXXK7movN1xxQERxvaFLQKSXZksa0oz7mxPAim9iSUqDjp5OZQcpRUmCzP/Csu
	 MD5Wkews3jfl7sfrPTL7pNmEqXEWS3G1AUcCRNbKcDfHWTK28YqSH8jvG3WcFkqyyP
	 93qT/TPMq9x96Gc0u1I2Zp6oL3kuaGdx3cGhoC7y6p5FqlqpjdvqsZiO94mIyIBbY9
	 TrJZspHbSQk61sPFPxqjGk69XogmKxc7EIWxrw3VF/9Thmen0JiLvPgF/JsLh/Ah5b
	 yZIB5ZNlEiUNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/17] dt-bindings: timer: arm,arch_timer: Fix
 requirements for interrupt description
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marc Zyngier" <maz@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260514150945.3917510-5-maz@kernel.org>
References: <20260514150945.3917510-5-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 21:37:07 +0000
Message-Id: <20260514213713.5D47FC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] The schema permits omitting the EL3 secure timer but fails to =
make `interrupt-names` a required property, which allows configurations tha=
t fatally misroute interrupts and hang the system.
- [Medium] The static `items` array with `minItems: 2` structurally fails t=
o enforce the stated architectural rules and causes positional misalignment=
 for valid configurations.
- [Medium] The commit incorrectly asserts that the EL1 virtual timer IRQ is=
 'always required', which misrepresents ARMv7 hardware and contradicts exis=
ting device trees.
--

commit 01733bbba71a7bef01e5c0820740d8ab21f684f8
Author: Marc Zyngier <maz@kernel.org>

dt-bindings: timer: arm,arch_timer: Fix requirements for interrupt descript=
ion

This commit updates the arm,arch_timer binding to clarify the requirements
for timer interrupts based on the implemented architecture. It raises the
minimum number of interrupts to two and uses architectural terminology.

> Follow the architecture by making it explicit that:
> - the EL1 secure timer irq is required if EL3 is implemented
> - the EL1 physical timer irq is always required
> - the EL1 virtual timer irq is always required

Is this description architecturally accurate for ARMv7?

In ARMv7, Virtualization Extensions are optional, so hardware lacking these
extensions does not implement a virtual timer. Existing device trees, such
as arch/arm/boot/dts/rockchip/rv1108.dtsi, accurately reflect this by
providing exactly two physical interrupts (secure and non-secure) and
completely omitting the virtual timer.

Establishing the EL1 virtual timer as always required seems to contradict
these valid hardware configurations.

> diff --git a/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml =
b/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
> --- a/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml

[ ... ]

> @@ -33,13 +28,13 @@ properties:
>            - const: arm,armv7-timer
> =20
>    interrupts:
> -    minItems: 1
> +    minItems: 2
>      items:
> -      - description: secure timer irq
> -      - description: non-secure timer irq
> -      - description: virtual timer irq
> -      - description: hypervisor timer irq
> -      - description: hypervisor virtual timer irq
> +      - description: EL1 secure physical timer irq, if EL3 is implemented
> +      - description: EL1 non-secure physical timer irq
> +      - description: EL1 virtual timer irq

Will this static array structure cause positional misalignment and fail to
enforce the stated requirements?

JSON Schema array validation evaluates strictly by index. If a platform
lacks EL3 and correctly omits the secure timer IRQ, its first provided
interrupt (the non-secure physical timer) shifts to index 0. The schema
would then incorrectly validate it against the secure physical timer
description.

Additionally, because the EL1 virtual timer is listed as the 3rd item,
minItems: 2 only enforces the presence of the first two items. A device
with EL3 that erroneously omits the virtual timer would silently pass
validation.

Should this be restructured using a oneOf block to define the specific
valid sequences?

Since this patch explicitly documents that the secure timer can be omitted,
does this create an issue where missing interrupt-names can lead to a
system hang?

If a device tree provides the two required interrupts (physical and virtual)
and omits interrupt-names, it will pass schema validation with minItems: 2.
However, drivers/clocksource/arm_arch_timer.c maps interrupts by strict
index if interrupt-names is absent (0 to secure, 1 to non-secure).

This causes the driver to incorrectly map the virtual IRQ as the non-secure
physical interrupt. The system will then request the virtual IRQ from the
GIC but program the physical timer registers, causing unhandled physical
interrupts and a system hang on boot due to missing timer ticks.

Should interrupt-names be made a required property to prevent this valid
schema from causing a runtime misconfiguration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514150945.3917=
510-1-maz@kernel.org?part=3D4
