Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794631397;
	b=prgUqvGMgrYojUObFcgMBnCOLyML2sHAXi6eIKFcpOZBbuAbjYJfhPF0EHXiN9gg9oDj
	 bcOlWgp1kR7zlyoXFIv7gIhqVNIhonMF3moeJ36oVTyHG6Hx0h6DDpUsy7S1EKVcfc4Lv
	 s/M/3L2tz3oz4ZMzzn7iJ2JzRI6fp62KoRHimh1tWRuF2C4VorLwVfDrIxjSSADzjrdd9
	 M7Y5TGKKQqhTC7Va5DeScrM6rvA23smrS5URFCuKhraUAoOIbZZNzejC2oX5vkKHBOoZE
	 JaWPVnu0GItMhRiYv6anK4lFIff9fvZdpjnmHBZMYyAAsEJBt4fmCHaTDFYORHUsffA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794631397;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZDfgU/IT26c9o9RvJNsaDK069rj/tVeJkpFgDyq54VA=;
	b=Ymen0dIundgN47dmgs6+wZuETcbrBnGICmqve2uoNiubQtV3JFAyGlVxRpKAXbH10dJ0
	 31R4Udy2Bdfn3RgfmXu5yPJbi+okXyuvppapwJ/6hIQxUfaek8nU8mbHq6qR69hZZ18ch
	 5f1SwLrj1AhBK57Mxst3rvFoqwEPXuHEgDuolGcrycLHvfPMyCTdMf3uHqDv0a7pozDYn
	 zGcEBSnAV8MJZ9wd7d/adg4elkVpFldGquLHdffGBNbL44dVje9qOTSpWpUVac6A5k4DJ
	 qtpL2kWCOuGNAI0llro67PNHHn8Chpuqr9KBoO3DBYs0L/m5fPzx6m2idQXri3YgHzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fyjjli1+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1E4606A331
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 04:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fyjjli1+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD8C1F000C4;
	Sat, 14 Nov 2026 04:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794631396;
	bh=ZDfgU/IT26c9o9RvJNsaDK069rj/tVeJkpFgDyq54VA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fyjjli1+JHW/SsbQdkUpk6jzdUDTU1OBOPeQ9282AO3qkpLGe1mYxT2GwtNASSmKY
	 eY4v7XhF5TDHxaZIyYg99lvXUpcoODQORoLKT5kRwmuWhC/P99mGgUQwORv9zr8ysw
	 EbFup7mZCyUkLqo2Vx4wkAoYc8oKGTeXMY62iKI0DKF9y7OJArymWTyHpCYfmMvydF
	 oh6EkvS7CAgJdxus7ORl+ZKpcje7L7sC1lMqiaxU6JVaJk788oYvsV6X0geKMGH0LJ
	 7b7lYRXV67P7BQRyQ1w0XjuBAxsdf2Gk3Ggvnb7VC+eyTxm+ocoSL4liDOFF5DVrsj
	 COkrY4UAxMbFQ==
Message-ID: <sashiko-outbox-214144@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add ASUS Ascent QN10
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bjorn Andersson" <bjorn.andersson@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-qn10-v1-2-e09b2aa7ccbe@oss.qualcomm.com>
References: <20261113-qn10-v1-0-e09b2aa7ccbe@oss.qualcomm.com>
 <20261113-qn10-v1-2-e09b2aa7ccbe@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 04:43:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: qcom: glymur: unused ec_int_n_default node and
  header includes
--

commit 0ef1ffea3eda67a97118c03e5338af8067d89944
Author: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

arm64: dts: qcom: glymur: Add ASUS Ascent QN10

This commit adds the DeviceTree for the ASUS Ascent QN10 desktop based on
the Qualcomm Snapdragon X2 Elite (Glymur) platform.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-ascent-qn10.dts b/arch/=
arm64/boot/dts/qcom/glymur-asus-ascent-qn10.dts
> new file mode 100644
> index 0000000000000..d61caa2b50222
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-asus-ascent-qn10.dts
> @@ -0,0 +1,670 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include "glymur-cob.dtsi"
> +
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>

[ ... ]

> +&tlmm {
> +	gpio-reserved-ranges =3D <4 4>, /* EC Secure */
> +			       <10 2>, /* OOB UART */
> +			       <44 4>, /* TPM */
> +			       <65 1>, /* EC reset */
> +			       <100 1>; /* Board ID */
> +
> +	ec_int_n_default: ec-int-n-state {
> +		pins =3D "gpio66";
> +		function =3D "gpio";
> +		bias-disable;
> +	};

[Severity: Low]
Is ec_int_n_default needed here? Nothing in this file or the included
dtsi files references &ec_int_n_default. Also, neither
dt-bindings/clock/qcom,rpmh.h nor dt-bindings/pinctrl/qcom,pmic-gpio.h is
used in this file.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-qn10-v1-0-=
e09b2aa7ccbe@oss.qualcomm.com?part=3D2
