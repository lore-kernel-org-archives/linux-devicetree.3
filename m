Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EA43E4505
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091442; cv=none; b=BKOuf+MIUrsp1JCnAh84ReDlJUnc/UKrFnE9nOnpYnV+y/GDe7wZ5CDuY+xNggQP/e58zDchFSkwm3QyBXOVwCs9xlteTNvWv+Hl4ylAvAsIzMnAZbZP6j9KnAwpchj+IC8/n5YLixWdZ4sK2nU9SQLcF/LLqcaKSyicuFmjQ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091442; c=relaxed/simple;
	bh=BxVPRC2l2dt/u797CUS7H7awCrNeF/c3TGDvLjbwjCs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VAbXHaUMf7e916qoS3QReScdZK1ITZ69PYRczmUayKm/Xioc6mTpCf2tWIZ8H5LXqGr+RBvSXfHLGZo9P+evhPNXJF6ORbp6H4MYnjUb6NxEADmeHdeZvf+YJ2BMM9yEDURkx6ByYldP7pcxVVQMB6hhPjU+zO9urXh6VtZWlIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRjiv5Sk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRjiv5Sk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3F91F00893;
	Wed, 10 Jun 2026 11:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781091441;
	bh=bf324chqa8INaw8Izfb5VwFNFYvWZHn9WVdxWuyyUws=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hRjiv5SkFgsc8OjOQwdloBXFpVeSW/CjiiQhpIdLWMRA9Ek6RIkjCCLXTtKG/prtA
	 Qjh/a9taV2Xp5Aw6NZw4okk0cZlv1XHpSuGixEl+vZ0l13fgBNss2C+SLXBYPjZDsL
	 L7PDIeCTMnzxBhgNfCI0wlYMj0Dkofdx0ac73KeJhC054k0//5cJviK710pPyQjH57
	 +iFsntR1w25ZQpwRikOB6ImCeMi3Nbbsc16oquLDtSkwBZzGR1eSYEcXm8/WR1zMpA
	 AhGEcK7FCaeQPBw9sBfR1swrfmHcOuPjJSPZWSrZn/0/gHfr4Bj0ZIKBjpU94TD2HI
	 vtV8rwWQ8p8Og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: cortina-access: Add DTS for CA8289 SoC
 and Venus board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Li" <jason.lee651024@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610112821.3030099-5-jason.li@cortina-access.com>
References: <20260610112821.3030099-5-jason.li@cortina-access.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 11:37:20 +0000
Message-Id: <20260610113721.0B3F91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Use of discouraged `clock-frequency` property in the ARMv8 timer=
 node.
- [Low] Missing root `#address-cells` and `#size-cells` in SoC DTSI.
--

commit bb6d4b41e4c489bdce2ba3142178fa3654514276
Author: Jason Li <jason.lee651024@gmail.com>

arm64: dts: cortina-access: Add DTS for CA8289 SoC and Venus board

Add SoC DTSI for the Cortina-Access CA8289 (Venus) and a board DTS for
the Venus engineering board. The description covers the minimum set of
hardware nodes needed to boot a kernel with an INITRD rootfs.

> diff --git a/arch/arm64/boot/dts/cortina-access/ca8289-soc.dtsi b/arch/ar=
m64/boot/dts/cortina-access/ca8289-soc.dtsi
> new file mode 100644
> index 0000000000000..8e7ffcf4ccab4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/cortina-access/ca8289-soc.dtsi
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * dts file for Cortina Access CA8289 SoC
> + *
> + * Copyright (C) 2026, Cortina Access Inc.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {

[Severity: Low]
Should the root node of this DTSI include its own #address-cells and
#size-cells declarations?

While the top-level ca8289-engboard.dts provides these, defining several
top-level nodes (like gic, uart0, uart1) that use 64-bit addresses relies
on the board file to satisfy the DTSI's cell size requirements. Could
these be added to the DTSI root node so it remains self-contained?

> +	cpus {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <0>;

[ ... ]

> +	/* See Documentation/devicetree/bindings/timer/arm,arch_timer.yaml */
> +	timer {
> +		compatible =3D "arm,armv8-timer";
> +		interrupt-parent =3D <&gic>;
> +		interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +		clock-frequency =3D <25000000>;

[Severity: Medium]
Is this clock-frequency property strictly necessary for this new SoC?

For ARMv8 architectures, the system timer frequency should typically be
programmed into the CNTFRQ_EL0 register by the boot firmware (e.g., TF-A)
on all CPUs.

The devicetree clock-frequency property is generally treated as a workaround
for legacy firmware that cannot be modified. For new SoC ports, can the boot
firmware be updated to properly initialize CNTFRQ_EL0 instead?

> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610112821.3030=
099-1-jason.li@cortina-access.com?part=3D3
