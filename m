Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EEC330641
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 11:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780314315; cv=none; b=SIyXP5WwTxEXERt1l7OzX5f3RlRONmVvJrE7qoHpzF4RwmkwOylMTowCP7GhvWqDluoBXFXZR8jkWrGwjp7i56IXAa/m8iwu06dj42Hr9YooRluHDBn7A29q9YYdljFbQU6gy0iHmiky16POac75LeeVFn2LO2fg6z7IurGsj9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780314315; c=relaxed/simple;
	bh=wuUDWn97Bz80V1qhEcSiYRexdpYJwXCdYgHHsNg3KHU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fax2ldh+SU0tCoqHCLKsuf4LEM7J9riWlAJ+IFasZ8nqsUsMkH6eRvBH6uc5mXTTWCUaQgCJ04zEAom3W7mz+yb3Na+bJ0bR7KD38yfsEJwGMH6MYZO7MR/ZFm6N7M+WcrGHF33LvRJfFmH0+PTg2ciSPZRXwaBnn86CT6gqXIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AGVCwPUI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AGVCwPUI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B581F00893;
	Mon,  1 Jun 2026 11:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780314314;
	bh=x3xURunXm1U1er1ps8k9hTm4HR9V6zGGCSrgwG3I5xw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AGVCwPUI11uKapgvQ8PzvFnXPxM/IM9fW7fJRgQUEKT7D7EKUMIa2d+gEumgwvLEi
	 0oE/O6Qb0F36HXJWnD0FP+kwxL4l0FKcxojCC3VBVNAZ1XjUc+I5qLtE18YeIGIydh
	 BBBHUX61b51XmIsX3G7BkYWzxCiCBF7pBxBqZ7S+cy4SyAggfBGln1Rb3N1luRNeQw
	 VyzbJOXfoYFqjFbQDj+gE1t2ByPYg4Viy3vlUEFmSWlr8XYbbOXHzz01oftOkYXy7U
	 WguwJjc79xmAihH/Fj7Rgl4InbyVYzB1FeyNKIBLA+jBy7kq2s7u4W7go71qG0NY77
	 24Wu+0SdAHNSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Enable application CPU
 cores via PSCI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601113919.8327-1-marek.vasut+renesas@mailbox.org>
References: <20260601113919.8327-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 11:45:13 +0000
Message-Id: <20260601114514.43B581F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `/psci` firmware node prevents PSCI initialization and sec=
ondary CPU bring-up.
--

commit 48b96f528db39732a93e926dab244c4a13787175
Author: Marek Vasut <marek.vasut+renesas@mailbox.org>

arm64: dts: renesas: r8a78000: Enable application CPU cores via PSCI

This commit adds the PSCI enable-method property to all 32 application CPU
cores in the r8a78000 device tree. This is intended to allow the OS to mana=
ge
the secondary CPUs using PSCI firmware.

> diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/=
dts/renesas/r8a78000.dtsi
> index 3e1c98903cea0..1ed98545990f2 100644
> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -143,6 +143,7 @@ a720_0: cpu@0 {
>  			compatible =3D "arm,cortex-a720ae";
>  			reg =3D <0x0 0x0>;
>  			device_type =3D "cpu";
> +			enable-method =3D "psci";

[Severity: High]
Does this device tree lack the required /psci firmware node?=20

Looking at the new enable-method properties, the CPUs are configured to use
PSCI, but there doesn't appear to be a corresponding psci node in the root=
=20
of the device tree.

During early boot, psci_dt_init() in drivers/firmware/psci/psci.c searches
for a node compatible with arm,psci or arm,psci-1.0. If the node is entirely
absent, psci_dt_init() returns -ENODEV and PSCI operations are not register=
ed.

Will this omission cause SMP initialization to fail, leaving the system
forced to run only on the primary boot CPU?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601113919.8327=
-1-marek.vasut+renesas@mailbox.org?part=3D1
