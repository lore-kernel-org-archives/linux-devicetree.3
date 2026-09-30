Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3F93AF664
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769355; cv=none; b=Z8o04lJIn4mzKHzFNXYBe5pW8OGVS3QGYJu57Xql8tbEv5csMWioMe19W56dFR0XVYf8mT+E7WPlgIIUd1ngJDOQ+tvpsTLUV6Uij49UifAjjQJS8wnPZIC5IJrpS5FBxJyg3sAgHOsNTGw1CdfSDZeIW7JuSWB2ohmMl0b0P7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769355; c=relaxed/simple;
	bh=Fl49rOrmtDJTmiFWVtUDUlT5NbDXR3rlQ19LKksr76w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yh34F+/obn5Ho/qx6liTOcry8SX4oelmTz+NZxjQfqvRkWeFpSSrbNNonlN/q4vTaBuHEFBnRbtFvqzrnR4C072Wrq0it8Iv5ICNfM4MCBoc9ACltM/Ei6pHD8SOBVH8EMBRZwJ1+CXKw2oSR/8tZ7rn1vbDWSRyxS7xUzLz5kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ECacOHeQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ECacOHeQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3CA71F000FF;
	Wed, 30 Sep 2026 11:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790769354;
	bh=7E+pUPuKsSqWlRtwmmEIBu9Q79uHJ7v8bab1dqu1zHo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ECacOHeQIk74UcXPRSAy/tbJF6c+yMqQKegeWnbPPU2VfQ33XNY0qmKIzwpOuqXm9
	 MAOFp6CsI4Ood1uuPSwtYD9kWGrJLtk62cuEMxmATS1CE3v6wr72ikQLiYgtXfzECc
	 CU2Q+LEq8VoGmesCPZmUK12MMLC0+531rAraZZs0XV3gQ2SGjikVHR6lUHS4yt2Xec
	 /cIwZHKSPJzJ06f3urluLYXLWWtG5jgmcEJK12ZFGeKjv0yGgohZtHz5C5xeYfRT1B
	 gpFnxSGWfjuHStnx0bajRGZyZxLaD08OKqKCB4h6X+SnCXNStgwO3/4AcM5I66+oQn
	 kGY8GBEArYLJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: shikra: Add EL2 overlay for
 remoteproc SMMU mappings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260930-shikra-el2-v2-2-f0822be5aaee@oss.qualcomm.com>
References: <20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com>
 <20260930-shikra-el2-v2-2-f0822be5aaee@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 11:55:53 +0000
Message-Id: <20260930115553.C3CA71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing EL2 targets for camera EVK variants
- [Medium] Undocumented disablement of GPU zap shader in EL2 overlay
--

commit 07c9abdfac5fabfba8cfb72f094624db1d5cb41b
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

This commit introduces an EL2-specific DeviceTree overlay for Shikra boards.
It explicitly configures the firmware IOMMU streams for remote processors,
allowing Linux to boot directly at EL2 without a hypervisor.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 4e714251d5e6b..634914b8f229b 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
[ ... ]
> @@ -377,6 +388,7 @@ shikra-iqs-evk-imx577-camera-dtbs	:=3D shikra-iqs-evk=
.dtb shikra-iqs-evk-imx577-ca
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D shikra-cqm-evk-imx577-camera.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D shikra-cqs-evk-imx577-camera.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D shikra-iqs-evk-imx577-camera.dtb

[Severity: Medium]
The commit message states the overlay is applied to "all Shikra EVK variants
devices", but are we missing the EL2 targets for these camera variants?

Without adding targets like shikra-cqm-evk-imx577-camera-el2-dtbs, the came=
ra
variants cannot be built or booted natively at EL2.

> +
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sm4250-oneplus-billie2.dtb

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/shikra-el2.dtso b/arch/arm64/boot/d=
ts/qcom/shikra-el2.dtso
> new file mode 100644
> index 0000000000000..d2f3186bd47db
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Shikra specific modifications required to boot in EL2.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&gpu_zap_shader {
> +	status =3D "disabled";
> +};

[Severity: Medium]
Is it intended to disable the GPU zap shader in this overlay without
mentioning it in the commit message?

The commit message only describes adding remoteproc SMMU mappings. While
disabling the zap shader might be necessary for EL2 boot, this hardware
feature disablement is currently an undocumented side effect.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-shikra-el2=
-v2-0-f0822be5aaee@oss.qualcomm.com?part=3D2
