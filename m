Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837874949F1
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778862291; cv=none; b=Aocr+TBmdawbzD7vXyx+nUdCgqk04ytc1CcK3SMSXIy8TZvbhqWTJvFl9roH0A26bs82Qvir7qqoXbJAX6mX2eJ9e3Y7EWj3GZ9DzGb2XnK77r0oqtYfh/Em6sIQTuwM0N0lBF3KT2/t/i6QNS0swTKivTRNRlvjYQ9OgirNAZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778862291; c=relaxed/simple;
	bh=lFHPPgrB6ZZkiqLIgG2Bjz30En1SN0iOQYBidgL/HI8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZlFzxV11TKdq28OOYjZzIFeaWWnz4l88ARhFYXuNp/q6QHtsq77se6S1dCcs+lqWzNk99u+dilG8kYJ0hYfmNxYJddx+U292V7LcfQXFXK0k+VtcghzCRdtgmY/K1pbLoRA6PV146Hc5rlRORUUu3ML1wrgNNoTa4Cs+oYJTVys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5BkOxkh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5BkOxkh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A77C2BCB0;
	Fri, 15 May 2026 16:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778862291;
	bh=lFHPPgrB6ZZkiqLIgG2Bjz30En1SN0iOQYBidgL/HI8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=B5BkOxkhjfsGkv+jHvwNVSzrf5+5FbK267VH8fg72LXPkoxEJxn002bXSdwsBGny5
	 WU1KkMFzYbpVQvgPbVrdDJo53UTqEzo8S3GLUNO7FVFj8L3gGxsqueCQOa+FGIs+Ti
	 wR4wNwuXMko4+S7MN3N9rpfaTH/I1QM3ymlfmj5qnBb1glZ6wEdj/OEQxDXkiF622U
	 lWIZnacdEYq1sqVzabx0qKBPYTIdwZHBQKfv/xffG5GqFx1tPM2pc9LCNVHplIoghV
	 LFeJkoEmEx1ESpwDg4sFP7Z0nZvpesndInat/chtIZ313h6Kj96qvaLLyiKltwQUx7
	 0CSypyXbwPreg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: Add Eliza CQS SoM platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-eliza-dts-qcs-evk-v1-1-7169d78a33e1@oss.qualcomm.com>
References: <20260515-eliza-dts-qcs-evk-v1-1-7169d78a33e1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 16:24:50 +0000
Message-Id: <20260515162450.E0A77C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `&sdhc_1` node for the eMMC is missing the `bus-width =3D <8>;=
` property.
- [Low] The included file `pm7550ba-eliza.dtsi` does not exist in the sourc=
e tree.
--

commit 6e3e74db281e2d9041b4de6ba9def363654c871e
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: Add Eliza CQS SoM platform

This commit adds the Eliza CQS SoM DTSI so it can be included by the EVK
base board DTS. It describes the regulators and board clocks, and enables
eMMC support alongside the ADSP firmware and remoteproc.

> diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boo=
t/dts/qcom/eliza-cqs-som.dtsi
> new file mode 100644
> index 0000000000000..5e0f9c1698f88
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
> @@ -0,0 +1,388 @@
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

Are we missing a file in this patch series?

The pm7550ba-eliza.dtsi include does not appear to exist in the repository
or in the submitted patches, which will result in a build failure.

[ ... ]

> +&sdhc_1 {
> +	vmmc-supply =3D <&vreg_l12b>;
> +	vqmmc-supply =3D <&vreg_l1d>;
> +	pinctrl-0 =3D <&sdc1_default>;
> +	pinctrl-1 =3D <&sdc1_sleep>;
> +	pinctrl-names =3D "default", "sleep";
> +	mmc-hs400-1_8v;

Does this node require an explicit bus-width property for the eMMC?

The node enables mmc-hs400-1_8v, which strictly requires an 8-bit data bus.
Without setting bus-width =3D <8>, the MMC core will default to a 1-bit bus.

Could this prevent HS400 mode from functioning and degrade storage
performance?

> +	mmc-hs200-1_8v;
> +	non-removable;
> +	supports-cqe;
> +	no-sdio;
> +	no-sd;
> +
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-eliza-dts-=
qcs-evk-v1-0-7169d78a33e1@oss.qualcomm.com?part=3D1
