Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86084CCDC5
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 12:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265735; cv=none; b=eoXLuOIzKA8PZqGzA+a4wwhy64usFC7roCv9cChApjOiqv6p/yITw1kBkmDpp8EeP4U2Q/9SpHUVv+hJqgnPSdfkR5mwLza8XS//2iVwozkNrIugLLJhpBs+UrsgBUs9fZ94Az1COPG+jFG6BJOtnnOAfSdw2r0pjOAR++9E6vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265735; c=relaxed/simple;
	bh=FApTRMvkisXmlyJI7Ok7Ur2cdWz1WDMw/DV6nWDiUpg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bKbu+erXaf2IiVLggyVO34i8LSvA9G0wOL8nncx1ZdUpiNKfUkQ885nm2/6AMb/FnpwHgmA0M+TRR4TabUKy1FRqcnFwNoW9588kIed0GYG04ESETY13pZVKTMvy6R764OInhC2jiaCIa/8ieYhJ/A+L6U61kAh04/e1W+XLcqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bazrE6sy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bazrE6sy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E641F000E9;
	Tue,  1 Sep 2026 12:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788265733;
	bh=8t7xpcaTpBWulVMOPMvyQXj8Skb0PK83HMLWF+XAhgo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bazrE6sySSmMZcWfk/ArrXyibMYSq6s5nlNHN0fl7ItpIZJeLNTm8BpjVIaVzRmMZ
	 wHETqpFbpR0EI5ITJeK+3V61eXTJgNN80tmFqMTfIO0Hd35vxlN7OGkMb9U/+1zzTe
	 +fOf/LXcWL+Abp/XwC1l55mmiyU+E6/CZJiZA6D2qKp4Ocgj9+77lzdmNGeBF5Y5rw
	 K7I0oobh95QhQITGGgJgfLFbKZfyXKazaPI2/BfgW201bqb/rNRxqYB3dCj8fE74zc
	 sNadSPGBF9H9/J6Yhzz0kl+DXQbnazZ9mipPd2eflxnkBKekQdMDBolCtXwc07PG7u
	 nJdzg0gU7MZ8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 02/11] ARM: dts: aspeed: anacapa: Add EVT2 devicetree
 inheriting EVT1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <u8813345@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901-anacapa-devlop-phase-devicetree-v7-2-0bd71d2e0105@gmail.com>
References: <20260901-anacapa-devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com>
 <20260901-anacapa-devlop-phase-devicetree-v7-2-0bd71d2e0105@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 12:28:52 +0000
Message-Id: <20260901122853.23E641F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect GPIO line name mapping due to a likely copy-paste erro=
r in the B-block of sgpiom0.
--

commit aa80bc774dd824dd074a3ccff2eaf0de685d5eb4
Author: Colin Huang <u8813345@gmail.com>

ARM: dts: aspeed: anacapa: Add EVT2 devicetree inheriting EVT1

This commit adds a development-phase devicetree for the Facebook Anacapa BMC
EVT2 hardware revision. It updates the Anacapa wrapper DTS to reference this
new EVT2 file instead of EVT1.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dt=
si b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
> new file mode 100644
> index 0000000000000..be7f17ad5f8ec
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
> @@ -0,0 +1,168 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +/dts-v1/;
> +#include "aspeed-bmc-facebook-anacapa-evt1.dtsi"
> +
> +&sgpiom0 {
> +	gpio-line-names =3D

[ ... ]

> +	/* B0-B7 line 16-31 */
> +	"Channel0_leakage_EAM3", "FM_CPU_FPGA_JTAG_MUX_SEL",
> +	"Channel1_leakage_EAM0", "FM_SCM_JTAG_MUX_SEL",
> +	"Channel2_leakage_Manifold1", "FM_BRIDGE_JTAG_MUX_SEL",
> +	"Channel5_leakage_present_EAM1", "FM_CPU0_NMI_SYNC_FLOOD_N",

[Severity: Medium]
Does this code break the sequence of ChannelX_leakage pins?

It places a _present signal here instead of in the D or C blocks, which
strongly suggests a copy-paste error overwriting what should have been
Channel3_leakage.

If this is an unintended copy-paste error in the B-block of sgpiom0,
userspace tools monitoring hardware could read the wrong physical pin for
Channel 5's presence and fail to read Channel 3's leakage entirely,
breaking hardware monitoring logic.

> +	"Channel4_leakage_Manifold2", "BMC_AINIC0_WP_R2_L",
> +	"Channel5_leakage_EAM1", "BMC_AINIC1_WP_R2_L",
> +	"Channel6_leakage_CPU_DIMM", "CPLD_BUF_R_AGPIO330",
> +	"Channel7_leakage_EAM2", "CPLD_BUF_R_AGPIO331",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-anacapa-de=
vlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com?part=3D2
