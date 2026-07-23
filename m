Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D08418A5D
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784798171; cv=none; b=kjZFQsBGvMTvO/nvvT/mTQqHZLZ800vKgRVBHKGKfqNG/Ck64YNluNiOo8DDQPXyBVsaiAQAUA7TFXmliGacgsGncBQD+9wS2SKxYQVnktBq3qyEDXJHVSe6rTg4637mk4QifUFurHhG1LkSip3bIu4m/wGU7u8tvjzyD5eZMZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784798171; c=relaxed/simple;
	bh=MBQpaNnNV4uLoHtcjhBczxoLaV/yL485WAjgzsj/JZ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qjD5SZo3vXhrWHVYFFMyJzR69Z3OtX8zcVmPZM/rNON3fqOITjswP0FPazxxWZQppVX1C7HnYbYJekQibTTNAb8kVWn0YJPCpsTWDD33LD4UMrOIGURTe+G7wivwQ4MjAjxNUXXQNDDIfyLRu2t9LtA89x4T0cOTPAypO/fFGIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsMWqEr1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsMWqEr1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81DD1F000E9;
	Thu, 23 Jul 2026 09:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784798168;
	bh=PCeR5E4McLYO9t/ZJYqBjdaI9+oOwNSupS4xCPNuteg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WsMWqEr1HIGCOoI/lqQbhx64HRAwvcZ4VHjqnuqHbdODCgNusYqPrsffrKQRiMUwn
	 i84FBZnvjlSHJrFxGgDrHwisacy7XhsSYr9Qso2YVFc9uL+mOSdujZEH5z5mJ0CqWv
	 UFFDTprxGO3Roe6ZeVbKwdTmYoopSQle7rtx9mN94SwOOgKUQQmIZJ1uNOb9Sasztq
	 NIMduSkRbtkvf+gzXM5Fy/DQfcCkXXbup1POUfWfQHlatWc9Ru8PBWsfkC9ODrdqL2
	 bDUtVjM/xi5Gr+363/V7HBcJ6iLGDavLshTMd5vk5SVowoYpYUlkiSab5NVLWBnDlx
	 TZUMeySeR5xjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: ipq5210: Introduce RDP504
 variant specific DT file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260723-08-dts-v3-3-074eb131f382@oss.qualcomm.com>
References: <20260723-08-dts-v3-0-074eb131f382@oss.qualcomm.com>
 <20260723-08-dts-v3-3-074eb131f382@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 09:16:07 +0000
Message-Id: <20260723091607.D81DD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The eMMC and NAND variants of the IPQ5210 RDP504 board use ident=
ical `model` and `compatible` strings, making them indistinguishable to the=
 bootloader and userspace.
- [Low] The newly added device tree file `ipq5210-rdp504-nand.dts` is missi=
ng from the subsystem `Makefile`, meaning it will not be compiled.
--

--- Patch [3]: [PATCH v3 3/3] arm64: dts: qcom: ipq5210: Introduce RDP504 v=
ariant specific DT file ---
commit 063e69c2f98cf6d7bdbb548ab9f8b5c63c82cda2
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Introduce RDP504 variant specific DT file
   =20
Add two DT files, one for the default eMMC variant and one for the NAND
variant.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts b/arch/arm6=
4/boot/dts/qcom/ipq5210-rdp504-nand.dts
> new file mode 100644
> index 0000000000000..0902681669b4b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts

[Severity: Low]
Is a change to arch/arm64/boot/dts/qcom/Makefile missing from this patch?

Without adding this file to the Makefile (e.g., dtb-$(CONFIG_ARCH_QCOM) +=
=3D=20
ipq5210-rdp504-nand.dtb), the build system will silently ignore it and fail
to produce the DTB.

> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "ipq5210-rdp504-common.dtsi"
> +
> +/ {
> +	model =3D "Qualcomm Technologies, Inc. IPQ5210 RDP504";
> +	compatible =3D "qcom,ipq5210-rdp504", "qcom,ipq5210";

[Severity: Medium]
Both the NAND and eMMC variants use identical model and compatible strings.

Will this make it impossible for a bootloader or userspace to dynamically
distinguish between the two distinct hardware configurations?

If a generic bootloader relies on the compatible or model strings to match
hardware to a DTB, could this ambiguity cause the wrong DTB to be selected?

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boo=
t/dts/qcom/ipq5210-rdp504.dts
> new file mode 100644
> index 0000000000000..cd65826944e34
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "ipq5210-rdp504-common.dtsi"
> +
> +/ {
> +	model =3D "Qualcomm Technologies, Inc. IPQ5210 RDP504";
> +	compatible =3D "qcom,ipq5210-rdp504", "qcom,ipq5210";

[Severity: Medium]
Does this eMMC variant also need distinct model and compatible strings to
safely differentiate it from the NAND variant above?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-08-dts-v3-=
0-074eb131f382@oss.qualcomm.com?part=3D3
