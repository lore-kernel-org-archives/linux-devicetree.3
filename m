Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8843BCD16
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 08:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782894558; cv=none; b=V4XDKO1cb+NT4uqPJwuXgwaqnihVyiQlhffiMPr1IcZ0KsQB9I8aK9p3gHN8zxniHvihggUuxkDe0WnTaRwVsvLlK0pccsARL8nw0TIf6+6i0KgextK8NyiXVyiq8fG+CE2OoWbsMlIwL/65zxGE3KItcbZGSKYdvLaqwIfLuAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782894558; c=relaxed/simple;
	bh=eeDXusIZddq+CQB72SLmyryNqqrvgT5yx5SidlZfqM0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d1WA5u7owVC+em4OUeIqcrjowfQ4+vo6x9Zk1sXcjwY+6HEjpzqCyAzE+tnj6Ba4q2pKYkRB9V/hmqilhFOxVlA77SROvFjZXgO5iVW6TNK9mHh8g/BUdZ+0jF98StiQ5zxSzV87XDvznzZZk/2NZKCeY/djVTMyHB9bbDPGlAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYAXJTFW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYAXJTFW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A892A1F00A3A;
	Wed,  1 Jul 2026 08:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782894556;
	bh=iD8+NcfHxhginBxkyof8jCVBT4qLeGPx8t7YTVgmSVw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CYAXJTFWn3de9mEH+cyhZJruJXCM45nqx5FABo3m2ItFu07Zm00WOH7DjUvjuIscn
	 2gLcemOX5moIzt28JX2uIokjNHJAUZkjNoKF/9SmC03eZtXjTgqBuOT2oGRDKZFipd
	 /f854SN0Cjqoq6R7gVsNKaWczO4gl+WLM1S6cxILzCdjrmWZr3kXOyibtrQExnOOMy
	 U2GyV1Ei2/M7kAJQ1jPPEXCc+LJ1/1wd4ZbJHvXjaadRCq7AosmE6VPpA+aE0EhX1S
	 rUHxijseRDZ52kubSNu0BMHKmityWgasQVglTr5twC7+1b43Pp4PFiDDEEOuVSieet
	 U94ge518iTZfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support
 for eMMC via overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Monish Chunara" <monish.chunara@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260701081715.2580329-4-monish.chunara@oss.qualcomm.com>
References: <20260701081715.2580329-1-monish.chunara@oss.qualcomm.com>
 <20260701081715.2580329-4-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 08:29:16 +0000
Message-Id: <20260701082916.A892A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Duplicate regulator node creation and label shadowing in overlay.
- [Low] Redundant device tree overlay duplicating base configuration.

Pre-existing issues:
- [High] Conflicting device tree properties silently disable SD card functi=
onality.
--

commit c17f3092c8fef709ae2384b75b1582cdb37b5837
Author: Monish Chunara <monish.chunara@oss.qualcomm.com>

arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
   =20
Enable the SDHCI controller for eMMC functionality on the Monaco EVK
using a device tree overlay.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 0b60626369190..a341d6dab6150 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -71,6 +71,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D monaco-evk-ifp-mezzanine.d=
tb
>  monaco-evk-sd-card-dtbs :=3D monaco-evk.dtb monaco-evk-sd-card.dtbo

[Severity: High]
This is a pre-existing issue, but does applying the monaco-evk-sd-card.dtso
overlay break SD card functionality by conflicting with the base device tre=
e?

The base device tree monaco-evk.dts defaults to eMMC and hardcodes no-sd and
non-removable for sdhc_1.

The monaco-evk-sd-card.dtso overlay adds no-mmc and cd-gpios, but doesn't
explicitly delete the base boolean properties using /delete-property/.

Because overlays don't overwrite or delete boolean properties without that
directive, the merged node would retain both no-sd and no-mmc, which could
completely disable media scanning.

>  dtb-$(CONFIG_ARCH_QCOM) +=3D monaco-evk-sd-card.dtb
> =20
> +monaco-evk-emmc-dtbs :=3D monaco-evk.dtb monaco-evk-emmc.dtbo
> +dtb-$(CONFIG_ARCH_QCOM) +=3D monaco-evk-emmc.dtb
> +

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso b/arch/arm64/b=
oot/dts/qcom/monaco-evk-emmc.dtso
> new file mode 100644
> index 0000000000000..cb2566ac6923c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +        vreg_s2s: regulator-vreg-s2s {

[Severity: Medium]
Does this create a duplicate phantom node instead of merging with the inten=
ded
base regulator?

The base device tree monaco-evk.dts defines a fixed regulator node named
vreg-s2s. This overlay defines a new fixed regulator node named
regulator-vreg-s2s and assigns it the same label vreg_s2s.

Because the node names differ, the dtc overlay compiler won't merge them.
This could create a second phantom node at the root (/regulator-vreg-s2s).

Will local phandle references to <&vreg_s2s> in this overlay resolve to the
new phantom node instead of generating a fixup to the correct base board
regulator resource?

> +                compatible =3D "regulator-fixed";
> +                regulator-name =3D "regulator-s2s";
> +
> +                regulator-min-microvolt =3D <1800000>;
> +                regulator-max-microvolt =3D <1800000>;
> +        };
> +};
> +
> +&sdhc_1 {

[Severity: Low]
Does this overlay duplicate properties that are already fully configured in
the base device tree?

The base board DT monaco-evk.dts already sets up sdhc_1 for eMMC with
properties such as no-sd, no-sdio, non-removable, vmmc-supply, and
vqmmc-supply.

Since this overlay redefines all of these exact properties, does it offer n=
ew
functionality beyond supports-cqe, or should the base board DT instead leave
the controller unconfigured for media types so overlays can correctly apply
the specific parameters?

> +	vmmc-supply =3D <&vreg_l8a>;
> +	vqmmc-supply =3D <&vreg_s2s>;
> +
> +	supports-cqe;
> +
> +	pinctrl-0 =3D <&sdc1_state_on>;
> +	pinctrl-1 =3D <&sdc1_state_off>;
> +
> +	pinctrl-names =3D "default", "sleep";
> +
> +	non-removable;
> +
> +	bus-width =3D <8>;
> +	no-sd;
> +	no-sdio;
> +
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701081715.2580=
329-1-monish.chunara@oss.qualcomm.com?part=3D3
