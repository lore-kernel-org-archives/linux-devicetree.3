Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0561E3DDDA3
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785847995; cv=none; b=iR0KrSbiHQ+by3JyeOh/JR7I2zB6lPKdx6jxW8AP/D/z7wrg5Ih4KRuASoaWOokem+S9Pw22z3gbwTwDirAPaX9jEhvvGrO7EeIXg013fRxDDGbZpx41xtN4yKcIYRSus+kPPKPxaUZW6kbg2Q4bw4JFdDq0mJ36AmU1DYVW3xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785847995; c=relaxed/simple;
	bh=P1WCwejxStkEqgR3/5/6QDFc4RG3Xpqg0mXWqydokio=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D2kQIlmIVA5N4aplq/T3xxbGtnrmq85+yvROZ9X1EaETKB03ibYMSZ4tyncssUnQveKpWmEsfOFcUffEbtsa8OnkHDtP/6PH/45P4bqcM3g/nqRIY3ijgANlSvFhPexp2ANFjMuA56Ot1H2G+dp7h1+dri+HiQIK1nf6kb2fXdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwGBFw2g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwGBFw2g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129801F000E9;
	Tue,  4 Aug 2026 12:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785847991;
	bh=QzHVh89ysc7MmlSM47zzFT1VtMXQheGttHsxztzJayY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kwGBFw2gQ81ER8NknkjcQ/IKpCQyNvTqASoPeY0KsWE/SnMNN8kDsZfS9Ylx/L9M/
	 1q+6tdGEF50aI8IsZlxujrrUhbXmpGm9hRuU05aJzyxuLnq/PHm5Yru+s4fguJ65zO
	 3ulOwtfO6b6KRuIlIn1GnDBKmjnpOUGTWyJPTKO1JWD8BpKPRJm5DMAa65fZXPFGh+
	 qAJyxaDLuUJ+iU0v2ZWsQTQN8Qn4ArS9sw4OP6GvPhrFXJzIf7FjWG7oxugMT3CroB
	 uzxUuvN2quYLixLQL9BfdDLWGzj54nQGt9iDoh9xq9ad5dgfH+O2FPJUgtNUp7wHnw
	 0bAndZ7ZeTqag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 14/17] ARM: dts: microchip: sama7d65: add otpc node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804113338.261782-15-varshini.rajendran@microchip.com>
References: <20260804113338.261782-1-varshini.rajendran@microchip.com>
 <20260804113338.261782-15-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 12:53:08 +0000
Message-Id: <20260804125310.129801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unused dt-bindings header included in sama7d65.dtsi
--

--- Patch [14]: [PATCH v5 14/17] ARM: dts: microchip: sama7d65: add otpc no=
de ---
commit 2c133d1669c4d7c5ae4cff5a6ba5a348f2ab2163
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

ARM: dts: microchip: sama7d65: add otpc node
   =20
Add OTPC node along with temperature calibration cell.

> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dt=
s/microchip/sama7d65.dtsi
> index c35f27615bc49..aac2e22d96cb3 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -15,6 +15,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/mfd/at91-usart.h>
> +#include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>

[Severity: Low]
This isn't a bug, but is this include necessary? It looks like the temperat=
ure
calibration data node uses a direct FourCC TAG address instead of any macros
that might be provided by this header.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804113338.2617=
82-1-varshini.rajendran@microchip.com?part=3D14
