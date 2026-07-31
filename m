Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D3F242D84
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785479432; cv=none; b=abAOISKhgauznWUA70hnn+kDZM3lgZYWxbuOxrL4lTZqhm8RUbBjdWmNWxxbGfgAVCKhPBPl+I0ubb4KgFuuz43C6txyGbVQG31E30i76rO9vGfaiqFiof22OIosWyzIzRyNBzpHqhutK60D/jlARQQZuqEuFPx+K/V04c5elTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785479432; c=relaxed/simple;
	bh=aQU03v/n9+WRXsMmDNO+2ULbbJCYhYfqnJN1Y0nivZw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cu3G7cXNDc5IxRFVnKNagd3AZB7D493Ldat1p4GydqQDgoUWRpSoblOHn4TVG7rPjnmT0sbUsTV23O8gj/nct32MW2qkIOd3A2Hh0z2tyRfTOIqZA9h903GNdV4G/S4Zh5yM3TgHN+LXw1B3/6yef7flSY6GKS6kOgGlXYPg+n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Amzhp4bR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Amzhp4bR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29201F000E9;
	Fri, 31 Jul 2026 06:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785479430;
	bh=26AtKj7QCta96Arz+brgjMIsteoaidxs9AOU8vZJuiY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Amzhp4bRlHILEWOgU8AEFUxsHEt4B2iVtgebDAw7Vt/+c0IbRANlMK/YFMQmiz5Rl
	 YMxtQK5wdR3rcwwOlji8uDNAV/4ceQeXplsHudLzU/RtOQKJ+v06EVj1ut0MPxnOOM
	 Pwukx0tdEpQvTxSZtK7eCNggnxt9Bks5K+qTCXwd2xgA5Nz/pe4O88WVucmuIgH2Yl
	 oThDOsctamoSbRDPXYCoqUiuXD468peLb69Y+hoQGsE2Zfrx1/wv8bZXpeCeksLV9o
	 wKWAt6CZ5Cp9JhR3ExVsC/RUTnSYEAMAgcB2ZcQ1QBHUihZByqB+3z0nd7a76deB5m
	 YW8UQVLHXLYCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/5] arm64: dts: qcom: Add Kalambo SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikrishna Garmidi" <gopikrishna.garmidi@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-b4-kalambo-crd-v4-2-e458f8b08114@oss.qualcomm.com>
References: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
 <20260730-b4-kalambo-crd-v4-2-e458f8b08114@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 06:30:30 +0000
Message-Id: <20260731063030.A29201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incomplete Hardware Removal / Dangling Nodes. The Kalambo SoC remo=
ves CPU cluster 0 (cpu0-cpu5) but leaves behind active device tree nodes fo=
r its strictly coupled hardware (thermal sensors, thermal zones, and bandwi=
dth monitors), risking boot-time SError aborts or immediate thermal shutdow=
ns.
- [High] Logic Error / Missing PDC Mappings. The `qcom,pdc-ranges` override=
 incorrectly drops mappings for multiple PDC pins, notably dropping the map=
ping for pins 98-107 entirely, breaking interrupt routing for any devices u=
sing them.
--

--- Patch [2]: [PATCH v4 2/5] arm64: dts: qcom: Add Kalambo SoC ---
commit 18e3f8e4f00722e5bec6b9cf7a1f1246aa57611c
Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

arm64: dts: qcom: Add Kalambo SoC

Introduce support for the Qualcomm Kalambo SoC derived from Mahua.
It removes CPU cluster 0 and re-adds the surviving cluster as cluster0.
The update also overrides the imem size, PDP mailbox addresses, and PDC pin=
s.

> diff --git a/arch/arm64/boot/dts/qcom/kalambo.dtsi b/arch/arm64/boot/dts/=
qcom/kalambo.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
> @@ -0,0 +1,112 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include "mahua.dtsi"
> +
> +/delete-node/ &cluster0_pd;
> +/delete-node/ &cpu_map;
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
> +/delete-node/ &cpu_scp_lpri1;

[Severity: High]
Should the coupled thermal sensors (tsens0, tsens1), thermal zones, and
bandwidth monitors (bwmon_cluster0) for cluster 0 be deleted here as well?

If the kernel probes these active nodes for unpowered or unfused hardware,
could it cause synchronous external aborts (SError) and kernel panics
during boot?

Alternatively, could it trigger an immediate thermal shutdown if the
dangling thermal zones return max values?

[ ... ]

> +&pdc {
> +	qcom,pdc-ranges =3D <0 745 38>,
> +			  <40 785 11>,
> +			  <51 527 4>,
> +			  <57 533 10>,
> +			  <70 546 4>,
> +			  <75 551 18>,
> +			  <108 619 1>,
> +			  <111 622 19>,
> +			  <130 717 12>,
> +			  <142 251 5>,
> +			  <147 796 16>,
> +			  <171 4104 36>;
> +};

[Severity: High]
Does this qcom,pdc-ranges override unintentionally drop mappings for pins
98-107?

The commit message mentions splitting the range starting at pin 108 to skip
pins 109 and 110. A standard split of an original <98 609 32> range would
yield <98 609 11> (pins 98-108) and <111 622 19> (pins 111-129).

By starting the new range at <108 619 1>, it appears to silently omit pins
98-107. Is it expected to drop these pins, along with several other ranges
(38-39, 55-56, 67-69, 74, 93-97) compared to the base dtsi?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-b4-kalambo=
-crd-v4-0-e458f8b08114@oss.qualcomm.com?part=3D2
