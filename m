Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E0A1A5B9E
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784377038; cv=none; b=YiEo3bQRguDxGFyDB+UhhrmgFLc1ohw1ZxQvaH7XY/ckL89Ax1gQxtwKMAtIwz5dOxBQrjsSJpD+DJ8NBjmfAUWpWIBG4qcuv57PD+ccGOP9By6CNq7SmaYNf+6rwXvhGDPBchEllsZiZdWe3k2q8NftEHzxiKPzETFPsNPA2lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784377038; c=relaxed/simple;
	bh=zTcOGKOB9JmDkfL1EW/6hCA4XYZ3w/Xj11BKLfWa6DU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P6GglsBlL5yuSifiyQ2YbJbbiyse2z5yeyDj9uDAoASuQaBZRlL8oFimSrYqEO9uFqEDkKfOIZ5BZcW9zt8vYq1F/qfL2Tu3b17wv0dVEHYdeSsNdX/jvh1F0EzwaTzJ5+LvF1IvH5TCs5eADmMaVVf9UTqxaZ78dwMKSPeqn6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ac0sxYVi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ac0sxYVi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77AD31F000E9;
	Sat, 18 Jul 2026 12:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784377036;
	bh=+DrYsj4IrLqQYUIlFVaQiJG2atPub9XGna77Clhm/JE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ac0sxYViXbBgorRvCLIxrimd/636iVkikOgwnFlrRfrcm7tkrof9iexiovMPx1BhN
	 BxXLeYVzWMZi8dRuQOgrOx++1lt9f8nbPqFEm9Acv/Hibt7rjKlu/v4VWwDsRlvV9c
	 d4MbuRI2bt/7ACFZkYWVJOzyL39iH4p5XDBQs/KbKQ5myscRn2+7w1TUyhpvDwPTRQ
	 TeZ7oJqfUo8O7VSM9Q6PhSelZ9ItmkRP/bASQTsShNvafyJKJ86ZvTemK9i0GCZScb
	 58Bn0fGs/D+DkbDQpxuz26oVw/ZgaKxE11FrbZ4a8PBK134rKxbGDcPssruMgcGUqw
	 LomAPNJ3wCvFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: Add Kalambo SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikrishna Garmidi" <gopikrishna.garmidi@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260718-b4-kalambo-crd-v1-2-a1069b5a2757@oss.qualcomm.com>
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-2-a1069b5a2757@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 12:17:16 +0000
Message-Id: <20260718121716.77AD31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The bandwidth monitor (`bwmon_cluster0`) for the removed CPU clust=
er 0 is neither disabled nor removed.
- [High] Thermal sensors (`tsens0`) and thermal zones monitoring the remove=
d CPU cluster 0 are left active.
- [Medium] Incomplete update of SCMI SCP low-priority shared memory registe=
r windows creates an asymmetric channel configuration.
--

--- Patch [2]: [PATCH 2/5] arm64: dts: qcom: Add Kalambo SoC ---
commit c5f01045fbad11461a4f9c8629b706f4e0af8944
Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

arm64: dts: qcom: Add Kalambo SoC

Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
with CPU cluster 0 removed, leaving it with just cluster 1. As a result,
the PDP mailbox and SCP low-priority register windows are updated to
match the reduced CPU complex. Everything else should work as-is.

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/kalambo.dtsi b/arch/arm64/boot/dts/=
qcom/kalambo.dtsi
> new file mode 100644
> index 0000000000000..a56ff68b57b47
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include "mahua.dtsi"
> +
> +/delete-node/ &cluster0_pd;
> +/delete-node/ &cpu_map_cluster0;

[Severity: High]
Since cluster 0 is removed, does the bandwidth monitor (bwmon_cluster0) also
need to be disabled?

The qcom,glymur-cpu-bwmon driver automatically probes bwmon_cluster0 during
boot. If left active, it will attempt to map and access MMIO registers at
0x0100c400 for a physical cluster that no longer exists in the SoC, which
can result in a hardware/bus fault (SError) and system crash.

Looking at glymur.dtsi, the node cannot be safely deleted with /delete-node/
because it houses the cpu_bwmon_opp_table used by the remaining clusters:

		bwmon_cluster0: pmu@100c400 {
			compatible =3D "qcom,glymur-cpu-bwmon", "qcom,sdm845-bwmon";

Should this be explicitly marked with status =3D "disabled" instead?

[Severity: High]
Similarly, should the thermal sensors (tsens0) and the thermal zones
monitoring cluster 0 be explicitly removed?

The thermal framework will initialize and poll the active cpu-0-*-thermal
zones, which attempt to read from tsens0 registers corresponding to the
absent cluster 0. This can also trigger an SError crashing the system or
cause fatal thermal subsystem errors.

For example, glymur.dtsi defines these zones:

		cpu-0-0-0-thermal {
			thermal-sensors =3D <&tsens0 1>;

Should &tsens0 and the un-labeled cluster 0 thermal zones inside
&thermal_zones be deleted?

> +/delete-node/ &cpu0;
> +/delete-node/ &cpu1;
> +/delete-node/ &cpu2;
> +/delete-node/ &cpu3;
> +/delete-node/ &cpu4;
> +/delete-node/ &cpu5;
> +/delete-node/ &cpu_pd0;
> +/delete-node/ &cpu_pd1;
> +/delete-node/ &cpu_pd2;
> +/delete-node/ &cpu_pd3;
> +/delete-node/ &cpu_pd4;
> +/delete-node/ &cpu_pd5;
> +
> +&pdp0_mbox {
> +	reg =3D <0 0x17610000 0 0x8000>, <0 0x1a980000 0 0x8000>;
> +};
> +
> +&cpu_scp_lpri1 {
> +	reg =3D <0x180 0x60>;
> +};

[Severity: Medium]
Does the TX window (cpu_scp_lpri0) need to be updated to match the
reduced CPU complex as well?

The commit shrinks the RX window size (cpu_scp_lpri1) from 0x180 to 0x60,
but misses the TX window, which remains oversized at 0x180:

			cpu_scp_lpri0: scp-sram-section@0 {
				compatible =3D "arm,scmi-shmem";
				reg =3D <0x0 0x180>;
			};

If the system firmware expects both windows to be symmetrically shrunk and
contiguous, this asymmetric configuration might cause SCMI initialization to
fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718-b4-kalambo=
-crd-v1-0-a1069b5a2757@oss.qualcomm.com?part=3D2
