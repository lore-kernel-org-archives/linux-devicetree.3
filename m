Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298D62853E9
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935925; cv=none; b=XHY2Tgc00M5wfbo+w03RL/38Bfsqs5a85fuhpo8h3OK5pzE70OTCSYjz7dvobOBI6VTy3naFyBcAopFEpW1WtgEr5qBlrn0y7dD9438+Efynv6wkR7ZsMY73UaDxlEMviI78X6e5thMtzC14S/9zlLRjYlybcGQyReOAnv80ijk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935925; c=relaxed/simple;
	bh=4ak9VUGWhof7u6+EFPoWm/Dd1NWo8NR21r9awTqFNE4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DgnrUQ0shZtzv1pdRrhyvTK67UeykoPVbGF6WHHB6osSFaUAKOgb+hq2X44DQd0IyE+jIJoICjWVfgu5A6UZnk09BlKKk3XFAIMdorueEx7H3vymzUyW3uwY/s0x9/nVbXFkefH0svGI8A6M+gXpHj5Z/Bj/nEx0wiaJbwoq9h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KczyeP22; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KczyeP22"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 451FC1F000E9;
	Wed,  5 Aug 2026 13:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785935923;
	bh=WqipLmIeDNknN8mFSv4yi81PREFBA4c/vEowk7/wmm0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KczyeP22ymBne+LtHY4IIv2bSI+ZmnM9DVVjZxvsB6ylNPLL2ar/7RIUTeqSlMemR
	 2qYTtuPR+ffipxqb7NcWKS93ElYZ+R5nWLpMQL5DTVOYSNA2xluqmlcIe0i8Olzs7I
	 hnYcsIM10QhWqRILBDdzT3DNZwCEWbY6EqEYhT/+HG/6aQ2dezvo9oGS4+osGc9WM8
	 QIOOdtOfwsA5Lby8i4i/Wrkac4XRKy+M1HxLpX6w312lKP/5c5v4Gv0xNUtmpsslT4
	 gUbnFN/XcSK3Xe3i080ikJ6n/rtx1IJFz94LQ0xTxjmB+EeA7pwuTbtXwIVWMjS/9l
	 a+4ZasYwbbf1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/12] ARM: dts: aspeed: anacapa: Add EVT1 devicetree
 and point wrapper to it
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <u8813345@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805-anacapa-devlop-phase-devicetree-v4-2-5d67e0efa6c5@gmail.com>
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
 <20260805-anacapa-devlop-phase-devicetree-v4-2-5d67e0efa6c5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 13:18:42 +0000
Message-Id: <20260805131843.451FC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The wrapper Device Tree file includes a `.dts` file directly ins=
tead of a `.dtsi` and drops the generic board compatible string.
- [Low] The commit message ends with an incomplete sentence.
--

--- Patch [2]: [PATCH v4 02/12] ARM: dts: aspeed: anacapa: Add EVT1 devicet=
ree and point wrapper to it ---
commit 0f5bca30c4e664b3bfec688906a2d297fbe5f884
Author: Colin Huang <u8813345@gmail.com>

ARM: dts: aspeed: anacapa: Add EVT1 devicetree and point wrapper to it

This commit introduces an EVT1 development-phase devicetree for the Facebook
Anacapa BMC. It updates the top-level wrapper DTS to include the EVT1
hardware revision file.

> A dedicated EVT1 DTS is added for revision-specific hardware while
> keeping a single, Anacapa entrypoint used by the build and deployment
> flow. The top-level aspeed-bmc-facebook-anacapa.dts

[Severity: Low]
This isn't a bug, but it looks like this sentence ends abruptly. Could the
rest of the thought be included in the commit message?

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> index 1fddf3a5d1383..209eef65cedbc 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> @@ -1,1079 +1,4 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> =20
> -/dts-v1/;
> -#include "aspeed-g6.dtsi"
> -#include <dt-bindings/gpio/aspeed-gpio.h>
> -#include <dt-bindings/i2c/i2c.h>
> +#include "aspeed-bmc-facebook-anacapa-evt1.dts"
> =20
> -/ {
> -	model =3D "Facebook Anacapa BMC";
> -	compatible =3D "facebook,anacapa-bmc", "aspeed,ast2600";

[Severity: Medium]
Does this change unintentionally break the device tree ABI for bootloaders =
or
userspace tooling that might rely on the generic compatible string?

By including a .dts file directly instead of a shared .dtsi and replacing t=
he
wrapper's contents entirely, the generic "facebook,anacapa-bmc" compatible
string is dropped. The resulting device tree blob will now only present the
"facebook,anacapa-bmc-evt1" string, which might cause downstream failures if
environments expect the generic identifier. Device tree conventions also
typically recommend keeping shared components in .dtsi files rather than
including another top-level .dts.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-anacapa-de=
vlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com?part=3D2
