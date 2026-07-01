Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1823B42EB;
	Wed,  1 Jul 2026 07:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890978; cv=none; b=rxoXwRhXtGGCOzUEqvqWKJTin+mXTfg1HYsR/5Mq0fVx3s1X+N71CbZdyIGqxPf2XzKfhmZeRexLmwTP0oWkBvkVFvDWZQlMcemlmSyaOkWuk42qpZbEBtYw5MgJxDybSAZTeuWVH7tu4XpVvIGlMnr4JOzRLvkDlVAjksWUR5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890978; c=relaxed/simple;
	bh=Cyq2HZXkk5lT5/DTeH89v5V71oCHf/Iytel8Y7jQheU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pj5lDR8oSadUBpLY3R4eS5x8IzYwFt9isjb4IiJv27q39Bii5mHEtbhPxUt1HXOkztli+ekONEBwXCxF+ywZaPb8uxq0ZaWYMv0hcVtkYmRFhJgXTdzKvPJIeG8YzoamGEl022aFlq9UrHSHlMYLJxQtx2Xhqg8lJ8e0BFU+cmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMDFig+9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMDFig+9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59621F000E9;
	Wed,  1 Jul 2026 07:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782890977;
	bh=uK5uRqNOcaWAtQFL8ul8j7o0WwrQEuYId8Tdiyh34Ck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aMDFig+9OG+LdrGx5fswuoNnrmm+9DG6UPziEbs6CyAvGmNtEnQtBwNqh4rE7iZoi
	 xd4y+7dvoAHK0zAyznwCpQhyOdG3SzAkNsifEHtrxb6stRUkRhyhkiu9xt0Zj//ktZ
	 Cng/2VapxwypTaV4C3Vr544L8qcaISAGkdJ7iy+Qi/WXEQCHWdCx2u5PeSFMEQxOVa
	 rzZsF1kBf7kczQcLEJpkUuM76lYXGZFz9Fz6K9l53YXUGQYO0nk7w/U9OorUI/ZiKG
	 MXbY6Em2ho7vqhdRwNwKyioUNaX2nlHQ6Ef7OJm6g2cpRIFsNvovc4vJksq0Wavy3Y
	 Zr2Uvo5Z99cew==
Date: Wed, 1 Jul 2026 09:29:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add base HAMOA-IOT-COME board
Message-ID: <20260701-uptight-piquant-raccoon-abceb4@quoll>
References: <20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com>
 <20260630071022.3256-3-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630071022.3256-3-yuanjie.yang@oss.qualcomm.com>

On Tue, Jun 30, 2026 at 03:10:12PM +0800, Yuanjie Yang wrote:
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/hamoa-iot-come-sip.dtsi     |   9 ++
>  .../boot/dts/qcom/hamoa-iot-come-som.dtsi     |  38 ++++++
>  arch/arm64/boot/dts/qcom/hamoa-iot-come.dts   | 108 ++++++++++++++++++
>  4 files changed, 156 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come-som.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6f33c4e2f09c..549287e3eeba 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-come.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
>  
>  hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi
> new file mode 100644
> index 000000000000..935af96c2b85
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi

What is the point of this file?

> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include "hamoa-iot-som.dtsi"
> +
> +/ {
> +};

It is completely empty.

Best regards,
Krzysztof

