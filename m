Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671821;
	b=vCT4MM/3aP1wTOddB5150a16IquIRvnOSu1vGchFJePVKQHCtkbfK0Sn6v6mYzkmirZS
	 F1HlCsWpLOef7iKSBOYiS/5jOqnUAOzXk7g7nupj6NJ77QlFpG2qEq6grkTG0jJkMJb9K
	 QgWguhjPuHcds812E/wmgfs386d6HzoSaB3aXzpgaL1gvnBAP2iAGtXEDRPT3Kxpgukc6
	 uoIcX49tOMiAktV8jDecbHUXkre1HNQq5PMMkkHtCZC/Ft5dvtEK3KHeGz1p48YLsi0Fr
	 hywqHtUbHedFe8MCtRdR7ZlYoYs0/XTkGncZG3gdh9R2qCdb2GgIarZ0dNqOANWqgTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671821;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RIdBdhJ75KmMg8/6wy3jTWLMxE7IBjEX0YQreojB6mM=;
	b=d4hfEd1zQ7V3mfn+28vW+WM4tsPdpqFfRTS72fu1lngXzEUy4ZlUGpHWeXjHA9yoQS28
	 hnjTdQi39C/BXvnbAIbHQFYycgryMbVap9zr/iGsIpcknkRfogfQaVw9P3E/eyT0XlRgx
	 TZonwUWugpUV6wrgJdIsrgl09aZrzyuXKnraBnOmYEwi7Dc4bmkYiXPOWVY4/a92CQOdM
	 ddrOiKq5MYlukkIhXCn9+p9XwVuaiDnyNrwjVRUqXYzLkMrLEPtb6khZIXDdq1MQ92mkS
	 WOajgxU3svVG/HsOswd1UEeZbi2qlFO+SxbCv6Uq9Q+iFJAl0YWuWMU24/NV79EOq5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eqBgETWr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D674B606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eqBgETWr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB521F000C6;
	Thu, 26 Nov 2026 05:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795671821;
	bh=RIdBdhJ75KmMg8/6wy3jTWLMxE7IBjEX0YQreojB6mM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eqBgETWrlYQk9CNL5B1M2kxa3m5oysV41/q9cX0RgAo9mzXVovyT1kao6qxK56DND
	 f0slX4VJjwIdqj+zvvVVujWD+UOsXk1qE6RMy/tTQK+vcInNpzkrQwJJPKFOERVHQ+
	 YeFYbm75zwyqxJ1X/g14uDsUMbolGo7DCyNgOQsf4v1CKUPnrlMmV2wBkNpEU1vMx9
	 SfI3MFXxEg77ct0M7zP3eJVmowrfn7jSyQRQDxsRkfD4rkgkBH7kX/vkg6UGUvrp6b
	 YbMuTkKQfYBseUrG+w9yrua4N0QIU8PJYqgUHRbMgS48v0icP2ONeAm+SV+czlHHT2
	 DTAfzvtrPufjw==
Message-ID: <sashiko-outbox-234804@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikrishna Garmidi" <gopikrishna.garmidi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-mahua-surface-laptop-v3-1-875b9c63d4e2@oss.qualcomm.com>
References: <20261125-mahua-surface-laptop-v3-1-875b9c63d4e2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 05:43:40 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] arm64: dts: qcom: SAM compatible mismatch breaks
  ssam_platform_hub_probe()
- [Medium] arm64: dts: qcom: duplicate CoB PMIC includes and stale
  regulator overrides
--

commit 5ca42311513062b6586cdd08dce26ed93bc509a5
Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

arm64: dts: qcom: Add Microsoft Surface Laptop 8th Edition

This commit adds the device tree for the Mahua-based Microsoft Surface
Laptop 13.8" 8th Edition.

> diff --git a/arch/arm64/boot/dts/qcom/mahua-microsoft-surface-laptop-8-13=
p8.dts b/arch/arm64/boot/dts/qcom/mahua-microsoft-surface-laptop-8-13p8.dts
> new file mode 100644
> index 0000000000000..2f8c93d900df8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/mahua-microsoft-surface-laptop-8-13p8.dts
> @@ -0,0 +1,1146 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include "mahua.dtsi"
> +
> +#include "pmcx0102.dtsi"
> +#include "pmh0101.dtsi"
> +#include "pmh0110-glymur.dtsi"
> +#include "pmh0104-glymur.dtsi"
> +#include "pmk8850.dtsi"
> +#include "smb2370.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +/* PMICs tied to Glymur's cluster2 are absent on Mahua. */
> +/delete-node/ &pmcx0102_d_e0;
> +/delete-node/ &pmcx0102_d0_thermal;
> +/delete-node/ &pmh0104_i_e0;
> +/delete-node/ &pmh0104_i0_thermal;
> +/delete-node/ &pmh0104_j_e0;
> +/delete-node/ &pmh0104_j0_thermal;
> +
> +/ {
> +	model =3D "Microsoft Surface Laptop 8th Edition (13.8 inch)";
> +	compatible =3D "microsoft,surface-laptop-8-13p8", "qcom,mahua";

[Severity: High]
Does "microsoft,surface-laptop-8-13p8" match ssam_platform_hub_of_match in
drivers/platform/surface/surface_aggregator_registry.c?

Commit e93536b1fcf7 ("platform/surface: aggregator_registry: Add Surface
Laptop 8th Edition") registered the match entry with the v1 compatible
string:

drivers/platform/surface/surface_aggregator_registry.c:
	/* Surface Laptop 8th Edition (13.8") */
	{ .compatible =3D "microsoft,surface-laptop-8-13in", (void *)ssam_node_gro=
up_sl7 },

With the root compatible renamed to "microsoft,surface-laptop-8-13p8",
of_machine_get_match_data() in ssam_platform_hub_probe() returns NULL and
fails with -ENODEV, leaving the SAM keyboard, fan, and platform profile
devices unregistered.

[ ... ]

> +&apps_rsc {
> +	regulators-0 {
> +		compatible =3D "qcom,pmh0101-rpmh-regulators";
> +		qcom,pmic-id =3D "B_E0";

[ ... ]

> +		vreg_l4f_e0_0p3: ldo4 {
> +			regulator-name =3D "vreg_l4f_e0_0p3";
> +			regulator-min-microvolt =3D <1080000>;
> +			regulator-max-microvolt =3D <1200000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};

[Severity: Medium]
Should this board DT use the common CoB power grid from glymur-cob.dtsi
instead of re-including the PMIC dtsi files and redefining regulators-0
through regulators-4?

Since commit 6fdce1f4a17b ("arm64: dts: qcom: Consolidate Glymur CoB power
grid"), mahua.dtsi includes glymur-cob.dtsi, deletes the cluster2 PMIC
nodes, and wires the common on-SoC supplies (&tcsr, &lpass_vamacro,
&mdss_dp3_phy, &pcie4_phy, &pcie5_phy, the eUSB2 repeaters, and the USB
PHYs).  Redefining the regulator nodes here overrides the consolidated
glymur-cob.dtsi rail voltages with old CRD values (such as lowering
vreg_l7b0, vreg_l1c1..vreg_l4c1, vreg_l2f0..vreg_l3f0, and
vreg_l1h0..vreg_l2h0) and re-introduces F_E0 ldo4 (VDD_LPI_MX), which
commit b7ff5f19bb27 ("arm64: dts: qcom: glymur: Drop L4F0") dropped
because RPMH manages it as an ARC/RPMHPD.

Dropping the six PMIC #include directives, the duplicate /delete-node/
statements, and the duplicate on-SoC supply assignments, and extending
&rpmh_vregs_b_e0, &rpmh_vregs_f_e0, and &rpmh_vregs_f_e1 with only the
board-specific rails would avoid overriding the common CoB rail
constraints.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-mahua-surf=
ace-laptop-v3-1-875b9c63d4e2@oss.qualcomm.com?part=3D1
