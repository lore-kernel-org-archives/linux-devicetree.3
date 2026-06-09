Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96BD3ED3CF
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992731; cv=none; b=aq81jGcILzPpRjcLUij6O2e34U2NQXOhU7Fss9NaL/RtFhfk76Y25EoN1vx3qOzIGJ1jzXju7OOEv9utzOPZBtnPY9Bpl7jRpub5eksV/ExNwjYPAjd8pH0ptH4kqCTl4TmwXKdwzY1X+2KZCmLhQ7Glmaw7G28Ug2vJhR+U+hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992731; c=relaxed/simple;
	bh=WfhzaYDh+coHnmVdglW1QG5VsKn0NOQHAZiOFbMI10g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EhTqt0MmxhOvJoOV2KN0bVnWnqGc1bbbRB44n5WYOy8wtQtQikSYQtJsW+LsQ2AurZzrlreEIIxeWH7aVnRUKPpQjb0cb0pIzfp5RN6YHxiaPkAxBzrFnpogFRQYQXVju/J5+spzu+RM/HgnNkH8LV8do8O1OQVwq9xqodEuCio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1bfHzgt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1bfHzgt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097C91F00898;
	Tue,  9 Jun 2026 08:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780992730;
	bh=efS1TadNvY0fGKhRQTnoLSLI98umOyJMWicU26by+Zg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c1bfHzgtwP5SaC5BqHRfkYfwXgMesJEFwsiCq5CXzYtLet2UQxiPAgBmDFdsms5iB
	 0cPN5sJIbzPPjaRPDx3kTVOWelxtoqJzi8b5XfcF/Pt7r/rr0zdXYGnsWBWzS3mhQu
	 yjE1Hh6DUxCUx8ZTfGbAb3t42gkE6sRGRAo6GindU6KqNNQHwLsZapOkGm/DQaXCBF
	 CQbAtwAHZhBpn6x/u4uZP8y+Nquy0/Y90J4aMoMGAVwjtMuFKTkTq+4RkntMacNNNl
	 u59LR1yvxvYhhylRxedgOp416cnIkM9PJjD+5P0j1EkQYnB1fEUWUEtTvuy9zfuHlq
	 kkdlC5QAJ770w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Add Eliza CQS SoM platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609-eliza-dts-qcs-evk-v3-2-b4e9b033a6dc@oss.qualcomm.com>
References: <20260609-eliza-dts-qcs-evk-v3-2-b4e9b033a6dc@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 08:12:08 +0000
Message-Id: <20260609081210.097C91F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The device tree source includes `pm7550ba-eliza.dtsi`, which does n=
ot exist in the source tree, causing a C preprocessor failure during compil=
ation.
- [Low] References to device tree labels `&sdhc_1`, `&sdc1_default`, `&sdc1=
_sleep`, and `&remoteproc_adsp` lack definitions in the base SoC device tre=
e (`eliza.dtsi`).
--

commit 49ba8d899e255d89a8013a6ccd6b518c9f069ea6
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: Add Eliza CQS SoM platform

This commit adds the Eliza CQS System-on-Module DTSI file. It describes
the regulators, board clocks, eMMC support, and ADSP firmware.

> diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boo=
t/dts/qcom/eliza-cqs-som.dtsi
> new file mode 100644
> index 0000000000000..33f4cd2822724
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
> @@ -0,0 +1,394 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "eliza.dtsi"
> +#include "pm7550ba-eliza.dtsi"

[Severity: Low]
Is pm7550ba-eliza.dtsi missing from the tree? It doesn't appear to be added
in this commit or present in the baseline, which causes a preprocessor
failure during compilation.

[ ... ]

> +&remoteproc_adsp {
> +	firmware-name =3D "qcom/eliza/adsp.mbn",
> +			"qcom/eliza/adsp_dtb.mbn";
> +
> +	status =3D "okay";
> +};

[Severity: Low]
Is the &remoteproc_adsp label defined in the base eliza.dtsi? Compiling
this device tree fails with a reference to a non-existent node or label.

> +
> +&sdhc_1 {
> +	vmmc-supply =3D <&vreg_l12b>;
> +	vqmmc-supply =3D <&vreg_l1d>;
> +	pinctrl-0 =3D <&sdc1_default>;
> +	pinctrl-1 =3D <&sdc1_sleep>;
> +	pinctrl-names =3D "default", "sleep";

[Severity: Low]
Are the labels &sdhc_1, &sdc1_default, and &sdc1_sleep defined? They appear
to be missing from eliza.dtsi and the included files, leading to a build
failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-eliza-dts-=
qcs-evk-v3-0-b4e9b033a6dc@oss.qualcomm.com?part=3D2
