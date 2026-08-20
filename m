Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B8F44065B
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 22:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787264295; cv=none; b=CaI65jYR2ewr1FvhkZrN8tIl68Bnc/efI/6tVEUGNWP1slPWWJL0A1Hp4d6hPj0LW8C7VDLUINyCMu4O8ZjQH5FhK/RDzDz9OCtjA0oqHuSepTRnpvHXWjrBm86OMwRHXKTiexSJtuFwekzeZF9io/bcHujFGUMloR8MOvK14WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787264295; c=relaxed/simple;
	bh=UpdOXARBlS99dvbk6NbpuEDvY4i3S7H5K41eRhK/oIE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QQ/6PLvkQWshpiJpX21vMx85tvPGyjVV0E1XWn0u/yVJTz65E9wk1j5jwo/FnVotYq0cBVGfu2WhJ+tcNPRpOBOGQuBagB+WFfSiVp1zF7lVmG1WmvEcd2iTH/CRZQZM6Kn/Cu5DGzyZ4RbPsyBulyF7HLlMoeZb0dpCb7YWtwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRocboIP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRocboIP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00A61F00A3F;
	Thu, 20 Aug 2026 22:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787264294;
	bh=ISCqEonBptew+R9SKSaNV6OmLUtIT9EtY9XcfYRoqs0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nRocboIPJynob92iSJN/HzhAEeTik+ZlrK/tucqYbkbch28MKjss8hnxlhedS4POv
	 QBVco1TvtVZpGQwFeTk2p4iVufrb7RbEGuos+hBpezwrcj/8wC+AK4yXPQNi7OaZ09
	 S5SbkiIUh5B4YXEpw/qK8ca5keyuFQsr0n87Z9En3BbvXKLEMn3uvHxg39fhFQT2ww
	 1sjLnIShUIG6mDTUyEJxTV70/wA+nxvgYMRmiuvT3EZsvEBhIPV3W8jTQUQD0wBSVb
	 XcZbI+iH7LW+mmswam5HBsKEIxMHPfY69p2ZNK2aTONk/Tp47rJZjO3EL3/NKSycfr
	 52YH0m+rO3CEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: ti: k3-am62p5-sk: add out-band-wakeup
 property to m_can devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kendall Willis" <k-willis@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260820-smth-v1-3-e1738a38d58e@ti.com>
References: <20260820-smth-v1-0-e1738a38d58e@ti.com>
 <20260820-smth-v1-3-e1738a38d58e@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 22:18:13 +0000
Message-Id: <20260820221813.E00A61F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `out-band-wakeup` property is added to the device tree but i=
s neither parsed by any kernel C code nor documented in device tree binding=
s, rendering it functionally inert.
--

--- Patch [3]: [PATCH 3/4] arm64: dts: ti: k3-am62p5-sk: add out-band-wakeu=
p property to m_can devices ---
commit 4ca80a2e891d70e706f8bb44ea395ee00e41e9dc
Author: Kendall Willis <k-willis@ti.com>

arm64: dts: ti: k3-am62p5-sk: add out-band-wakeup property to m_can devices

This commit adds the out-band-wakeup property to the mcu_mcan0 and mcu_mcan1
nodes in the k3-am62p5-sk device tree. The intent is to enable the
out_band_wakeup flag during suspend so the devices can serve as wakeup
sources from deep low-power states.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dt=
s/ti/k3-am62p5-sk.dts
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
[ ... ]
> @@ -815,6 +815,7 @@ &epwm1 {
>  };
> =20
>  &mcu_mcan0 {
> +	out-band-wakeup;

[Severity: Medium]
Is this property parsed by any driver code in the kernel?

The commit message indicates this allows the out_band_wakeup flag to be
enabled during suspend, but there does not appear to be any C code that
actually parses the out-band-wakeup property from the device tree to apply
this flag.

Without driver support to parse this, the property will remain inert. Does
this rely on a separate driver patch that is missing from this series?

Additionally, is this property documented in the device tree bindings? If
not, it will trigger dtbs_check validation errors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-smth-v1-0-=
e1738a38d58e@ti.com?part=3D3
