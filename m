Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B7B36B059
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615591; cv=none; b=iU/bFvQcqmetFmNXMaXVkIFN7AvvQq6KsOhVk0+/Lg3fuSTlV8myNCKn+3SuyP2MTGuFjj+TiOuN4z2uiKsI+WPaxUpHWvhK8Zsok2/hDmMSGytKJjPDv4BdtY+mZOk0WaGSBNWVoyWsLTOQhA6VoFeNMoA6DodI7Y22smRuwVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615591; c=relaxed/simple;
	bh=AOCb5daMzYh8r7izLLNKkTVzK0fH9eYC26/VS2vPBC8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t/pIOgGjoYxAna1TQx91eOD0IHMQOEhYQ4YzYrF5eED2IxqLsDjT12o0xBkA1xu9Dl2FMjQx3rUM5q2yNz5nI03N8sh1EkzeTzxhlrhwVAnMY6sGPh8ZNhjn2ONjiLW8YxoK/CvFCXTf66SPzmwp7Rr21D19ZmIavIeu1+RnbbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bl8FsHbd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bl8FsHbd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB4D1F000E9;
	Tue, 16 Jun 2026 13:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781615589;
	bh=5PxxwQGbFURJrgrNFrjQ92yL+bnQBpXsFPgLNIjxUY8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bl8FsHbduHrXy6gfokOXC+bsQl+00zfB7NoDWkl6UACWDCGoJOePPOA/1e41bpA05
	 AgO5hIIqY9MmLihiV/CwyOGMkmYkOCpjDCzltSut+hM+qP5Dh+apUfd1HYmqOq0B4/
	 kEJr/REySJbYHa94NJsbTuQ/0Z+7h6z1kJuD5+++hD3+ODXqM8Z64TLUyeoWAu/kQh
	 K4toQEr4oK+YfGvvKi+o3cO9dIwi5T+8yUuivNwgBlhpUGmTffRn7I9I0+UQD8xbKs
	 vz3sTlyjiNdUkt1ctwnJEh5uBE8h6Em5Di3ySclt8D7/CQB46cFFvoVt4Sts84+wWA
	 qn3Bo1NIsM3Jg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support
 for eMMC via overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Monish Chunara" <monish.chunara@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260616130347.3096034-4-monish.chunara@oss.qualcomm.com>
References: <20260616130347.3096034-4-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 13:13:08 +0000
Message-Id: <20260616131309.6BB4D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Device Tree resource duplication for the vreg_s2s regulator.

Pre-existing issues:
- [High] Incomplete base DT refactoring leaves mutually exclusive eMMC prop=
erties, breaking the SD card overlay.
--

commit 457596ee7fdadc67892c938f430cbd6d76fabaf4
Author: Monish Chunara <monish.chunara@oss.qualcomm.com>

arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
   =20
Enable the SDHCI controller for eMMC functionality on the Monaco EVK
using a device tree overlay.

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
> +                compatible =3D "regulator-fixed";
> +                regulator-name =3D "regulator-s2s";
> +
> +                regulator-min-microvolt =3D <1800000>;
> +                regulator-max-microvolt =3D <1800000>;
> +        };
> +};

[Severity: Medium]
Does this create a duplicate regulator node?

The base device tree in arch/arm64/boot/dts/qcom/monaco-evk.dts already
provisions this exact 1.8V fixed regulator as vreg-s2s with the vreg_s2s
label:

arch/arm64/boot/dts/qcom/monaco-evk.dts:
	vreg_s2s: vreg-s2s {
		compatible =3D "regulator-fixed";
		regulator-name =3D "vreg_s2s";

Since the node names differ, applying this overlay instantiates a duplicate
physical regulator node instead of referencing the existing one.

> +
> +&sdhc_1 {
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

[Severity: High]
This isn't a bug introduced by this patch, but this commit fails to address
it while supposedly completing the eMMC overlay separation.

The base device tree arch/arm64/boot/dts/qcom/monaco-evk.dts retains
hardcoded eMMC properties for sdhc_1:

arch/arm64/boot/dts/qcom/monaco-evk.dts:sdhc_1
	no-sd;
	no-sdio;
	non-removable;

Because overlays cannot easily delete properties, applying the previously
merged SD card overlay arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
inherits no-sd from the base DT while appending its own no-mmc. This causes
the MMC core to skip probing entirely, rendering the SD card controller
non-functional.

Should the base DT be stripped of these media-specific properties to proper=
ly
implement mutually exclusive overlays?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616130347.3096=
034-1-monish.chunara@oss.qualcomm.com?part=3D3
