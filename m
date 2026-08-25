Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB813F58FF
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787655550; cv=none; b=kCBQUSs34sGwBTaCAZaTAsh8sG5E23syqRy7+ji8o7PA8BEzcQhLCgNLAIyaQiRZcJaXc0lgBBBAEBzrdB/VEsLgMErQ/Gnhq+B5SISrBKqeR3GqTiH2UxSc9VTT7gco9dZpgt2tTC81jDCQ8rc8x1q2Xw9XFvoV5+2bRP7zHCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787655550; c=relaxed/simple;
	bh=iZ9P2yNt7846OU6V2LP6saVOSvrr+N6AO/Su/mpbXWo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z0StMe0Q9V17Svf6ktk5xBxMiZ0I5zU015ig2TExxItFrTPb/n5eXukDPBf6tgcMyqb7ytM1MGoh+NjA9YvYef+86Z+yul3wCyeVMPMBmCfpzGy0e6A0ZHRKh5K28UUUd/hcYLLAvDCwWB/ZaewobEF6NQuKlg/Vb/mnP4rqUoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GGyMOZpp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GGyMOZpp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5AF81F00A3A;
	Tue, 25 Aug 2026 10:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787655548;
	bh=F2WepNQfM8+D3D4/3fZ6VdrX7fFKYE5oKsHPU1hUToY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GGyMOZpp/XCZK/nL8Sd0gyXNE+tKDUaDwzbL15SX1olOz1/RmdDbMHuOWmBD4ivFc
	 pXSx3GZR37KYqvyUNqZ0iNFQIIcwpikfi9Z5mKD236KQy5XsAI3ana1xi8vcwat+u0
	 id8ahwLngMh6+TLGINETF7APzn5yB8M2RtcDpb94wU7GWsn2kzoPkDEH4e+MthWOMZ
	 2Guv+PDjpMgUmMOrZycUguiBNPs3OgyfXfmaW4deCE4s6Ct4BoieFQrI/yLR+EYZc0
	 /avISLy5bylLMhqYBpC3HazOeK8V32BqqH2R9AL2WtP6MY3KZ4j9Vr2vWtwj5FWpLw
	 1PiweTGkSErrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 03/12] ARM: dts: aspeed: anacapa: Add EVT2 devicetree
 inheriting EVT1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <u8813345@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260825-anacapa-devlop-phase-devicetree-v6-3-9059a2a279ce@gmail.com>
References: <20260825-anacapa-devlop-phase-devicetree-v6-0-9059a2a279ce@gmail.com>
 <20260825-anacapa-devlop-phase-devicetree-v6-3-9059a2a279ce@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 10:59:07 +0000
Message-Id: <20260825105907.C5AF81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Redundant redefinition of inherited properties in the `evt2.dts` fi=
le.
--

--- Patch [3]: [PATCH v6 03/12] ARM: dts: aspeed: anacapa: Add EVT2 devicet=
ree inheriting EVT1 ---
commit 6b89a922e36e90ce204fd77dd1e9b16cb96a0684
Author: Colin Huang <u8813345@gmail.com>

ARM: dts: aspeed: anacapa: Add EVT2 devicetree inheriting EVT1

Add a development-phase devicetree for the Facebook Anacapa BMC EVT2
hardware revision and update the Anacapa wrapper DTS to reference it.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dt=
s b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
> new file mode 100644
> index 0000000000000..075ac39f369f7
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
> @@ -0,0 +1,178 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +/dts-v1/;
> +#include "aspeed-bmc-facebook-anacapa-evt1.dts"
> +
> +/ {
> +	compatible =3D "facebook,anacapa-bmc-evt2", "aspeed,ast2600";
> +	model =3D "Facebook Anacapa BMC";

[Severity: Low]
This isn't a bug, but since this file includes
aspeed-bmc-facebook-anacapa-evt1.dts, is redefining the model string here
redundant? It appears to be identical to the inherited value from evt1.dts.

> +};
> +
> +&sgpiom0 {
> +	bus-frequency =3D <2000000>;

[Severity: Low]
This isn't a bug, but does redefining bus-frequency create a minor
maintainability hazard? This property seems to exactly match the one
inherited from the evt1.dts file.

[ ... ]

> +	"AMC_FAIL", "HPM_CPLD_RISCV_RST",
> +	"S0_ON", "";
> +
> +	ngpios =3D <128>;
> +
> +	status =3D "okay";

[Severity: Low]
This isn't a bug, but are ngpios and status also redundantly redefined?=20
These exactly match the properties already inherited via Devicetree's node
merging from evt1.dts.

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-anacapa-de=
vlop-phase-devicetree-v6-0-9059a2a279ce@gmail.com?part=3D3
