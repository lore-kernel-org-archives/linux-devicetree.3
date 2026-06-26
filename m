Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223BB1684BE
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 01:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782437017; cv=none; b=KZstqTBziik3Tdkj4L9HwEu8MpzfdqNB469YoKQtxn+S+s42MRJIbOz0rO7izwnm/ZecixexQG7iYRT83VM5lkeKa6LLlfDrucl+IEBciMD2eRqVqpmvxAEFfL2VPOcoKuQNeClhccbKMnPEZfQBFkVBRDdInWLXVuNsBl/k3aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782437017; c=relaxed/simple;
	bh=jjRsh6GlNZeSlZdy0EnJQKbEp1IR6RDIrthSfs7NMmk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D/EQRtiukwnpGAqi4NRXmKOeiVLpDqsLr9javHHOpwH+4HT+mEr6UKUG/f/Yzq1WYSmW6DINWXUWV04kmhLomkoq4uOyHYUxiWpJg6Y/Xyb9lD/VGbBZoZQWeGFKnk/XE6bLLAKWYGgeMnbToGT5KLi6JSaYx2nqPgNaKweXCAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cci9efty; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cci9efty"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742BA1F000E9;
	Fri, 26 Jun 2026 01:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782437015;
	bh=/VwXRsrWNLwmWPLhLuDU+ohZUnMkSwdntbZdUTyz3Pw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cci9eftytQRb9osDJ60JdJz7iiLJk7vd1Je//7N2LAyQj29f2IBCr1Vfy3bIBF6U0
	 TBJvjgmcNJLg7sJRbO3fAAhp0ynXhoqWqCiVVUTu6OYu1rtKwACes3dxqSogOsNPQ8
	 4V2FusKM3MbckCEHW1v90JZDWEv3JFRrgDzOvT156b4cfTZpcGQeQYvbNzuss0ri21
	 cWfYTL84U5BUnqLCB9Wk/li6YBuUxYTdU/wKxaQQCi8u06qR7hAWy4v/5jObNNtcjW
	 6c4GVMJVb5VbHsK8IGf2XZjHfvqFC4wf2+KF9VCtMq2p4/Okr76L7Z+FuzP3Z3AQ1P
	 7E/LHk2pWanvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge SE70 carrier
 board DTS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiqi Li" <lijq9@lenovo.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260626010950.459899-3-lijq9@lenovo.com>
References: <20260626010950.459899-1-lijq9@lenovo.com>
 <20260626010950.459899-3-lijq9@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 01:23:34 +0000
Message-Id: <20260626012335.742BA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Peripheral overrides and configuration nodes are incorrectly place=
d at the root of the device tree, failing to override the actual bus childr=
en.
- [High] The `fixed-regulators` container lacks the `compatible =3D "simple=
-bus"` property, preventing its children from probing.
- [High] The `cd-inverted` property combined with `GPIO_ACTIVE_LOW` causes =
a double-inversion of the SD card detect signal.
- [Medium] Use of downstream Linux-for-Tegra (L4T) device tree properties t=
hat are invalid in mainline.
- [Low] Device tree node names use underscores instead of hyphens.
- [Low] Mismatch between inline code comment and regulator voltage configur=
ation.
--

commit ce1b543209b572c99dba284d418dec1c8ce39718
Author: Jiqi Li <lijq9@lenovo.com>

arm64: tegra: Add Lenovo ThinkEdge SE70 carrier board DTS

ThinkEdge SE70 is a fanless industrial edge gateway built around
NVIDIA Tegra194 Xavier NX SOM. This patch adds a standalone device
tree file describing core carrier board peripherals:
- Custom 40-pin header pinmux configuration
- External SD card slot with dedicated 3.3V fixed regulator

No fan, PWM, tachometer, extra camera/spi peripherals are present
on this passively cooled platform, so unused nodes are explicitly
disabled following mainline device tree best practices.

Static verification passed: dt_binding_check and dtbs compilation
complete without errors.

[ ... ]

> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dt=
s b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
> new file mode 100644
> index 0000000000000..075e057c90954
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
> @@ -0,0 +1,167 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "tegra194-p3668-0001.dtsi"
> +#include "tegra194-p3509-0000.dtsi"
> +
> +/ {
> +	model =3D "Lenovo ThinkEdge SE70";
> +	compatible =3D "lenovo,thinkedge-se70", "nvidia,p3509-0000+p3668-0001",=
 "nvidia,tegra194";
> +
> +	chosen {
> +		bootargs =3D "console=3DttyTCU0,115200";
> +	};
> +
> +	/* Fixed 2.3V regulator for external SD card slot */
[Severity: Low]
Is this comment accurate? It mentions a 2.3V regulator, but the configurati=
on
properties below (regulator-min-microvolt and regulator-max-microvolt) enfo=
rce
3.3V.

> +	fixed-regulators {
[Severity: High]
Does this fixed-regulators container need a compatible =3D "simple-bus" pro=
perty?
Without a recognized bus compatible string, of_platform_populate() won't
recurse into this node at boot. This would prevent the ap2306gn_3v3_sd child
regulator from probing, causing the SDHCI controller requesting it to fail =
with
-EPROBE_DEFER.

> +		ap2306gn_3v3_sd: ap2306gn_3v3_sd {
[Severity: Low]
Should this node name use hyphens instead of underscores (e.g.,
ap2306gn-3v3-sd) to comply with Devicetree specification naming rules and a=
void
node_name_chars warnings during compilation?

> +			compatible =3D "regulator-fixed";
> +			regulator-name =3D "ap2306gn-3v3-sd";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;

[ ... ]

> +	/* Custom pinmux configurations for 40-pin expansion header */
> +	pinmux@c302000 {
[Severity: High]
Are these peripheral and pinmux configuration nodes incorrectly placed at t=
he
root level of the device tree (/ {}) rather than being children of the SoC =
bus?
Placing nodes like pinmux@..., i2c@..., and sdhci@... directly under the ro=
ot
creates disconnected dummy nodes instead of overriding the actual bus-attac=
hed
controllers, causing these intended configurations to be completely ignored.

> +		status =3D "okay";
> +		touch_clk_pcc4 {

[ ... ]

> +	pinmux@2430028 {
> +		status =3D "okay";
> +		soc_gpio41_pq5 {
> +			nvidia,pins =3D "soc_gpio41_pq5";
> +			nvidia,function =3D "rsvd2";
> +			nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +			nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +			nvidia,lpdr =3D <TEGRA_PIN_DISABLE>;
> +			nvidia,io-high-voltage =3D <TEGRA_PIN_DISABLE>;
[Severity: Medium]
Are nvidia,lpdr and nvidia,io-high-voltage downstream Linux-for-Tegra (L4T)
properties? They don't appear to exist in the mainline devicetree bindings,
which means they will be ignored by upstream drivers and fail dt_binding_ch=
eck
schema validation.

> +		};
> +	};

[ ... ]

> +	/* SDMMC3 for external user SD card slot with dedicated 3.3V power */
> +	sdhci@3440000 {
[Severity: High]
Similar to the pinmux nodes above, is this sdhci node placed as a direct ch=
ild
of the root (/ {}) instead of the SoC bus? This creates a new orphaned node
rather than overriding the actual bus-attached SDHCI controller.

> +		uhs-mask =3D <0x78>;
> +		mmc-ocr-mask =3D <0x0>;
[Severity: Medium]
Are uhs-mask and mmc-ocr-mask valid mainline properties? Like the pinmux
properties above, these appear to be downstream L4T properties that will fa=
il
dt_binding_check schema validation.

> +		cd-inverted;
> +		cd-gpios =3D <&gpio_aon TEGRA194_AON_GPIO(CC, 4) GPIO_ACTIVE_LOW>;
[Severity: High]
Does combining the cd-inverted property with GPIO_ACTIVE_LOW in cd-gpios ca=
use
a logical double inversion of the SD card detect signal? The GPIO subsystem
will invert the active-low physical signal, and then the MMC core will inve=
rt
that result again due to cd-inverted. This could mean an inserted card is s=
een
as removed and vice versa, breaking card hotplugging.

> +		nvidia,cd-wakeup-capable;
[Severity: Medium]
Is nvidia,cd-wakeup-capable another downstream property unsupported in
mainline?

> +		vmmc-supply =3D <&ap2306gn_3v3_sd>;
> +		status =3D "okay";
> +	};

[ ... ]

> +	pwm@32f0000 {
> +		status =3D "disabled";
> +	};
> +	generic_pwm_tachometer {
[Severity: Low]
Should this node name use hyphens instead of underscores (e.g.,
generic-pwm-tachometer) to avoid devicetree specification violations and
node_name_chars warnings?

> +		status =3D "disabled";
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626010950.4598=
99-1-lijq9@lenovo.com?part=3D2
