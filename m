Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090513D5235;
	Tue, 28 Apr 2026 07:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777361094; cv=none; b=tXojO81jW+tfmLoVKAd6FegORDoUbOwUS5w78hTFsxQllBXHN+JLFs7Q2AJPLYTb7nx0v+I5nLMyTScxGNo2hC9/oGSbeRfJVvPl9tsqZ15IzdX3Oa8XqPwq7Vn3kngwrA5vppamnkJNI2pj5xiF0Tuf5CA5tiD3GF3hg1u7z9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777361094; c=relaxed/simple;
	bh=JEUI7Kpbf9kidBFbwFNwwe2VTy3l4UnYMoclK8HYANk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4140OtopQjGIb36LPpd+0qG1BEVyS6rJ6ZbROZtkVDtlnVrvo5UiuDMk6hUcxCbS8X5JElez00nsEgZ/fLM7ZBFxoNkhhTuf1AWmfxEfQDv8kvkBcN7uQBtLtrccPgwYnjwGdxeEGLTXEEj2/ILc+5t60n4RhBcp2WhmAs54Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kutlfhoh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kutlfhoh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2702EC2BCAF;
	Tue, 28 Apr 2026 07:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777361093;
	bh=JEUI7Kpbf9kidBFbwFNwwe2VTy3l4UnYMoclK8HYANk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KutlfhohFmCTm9Fnd282ZpSVBohkKsbtxvfzZ/VbGKH+WOFaB+GlAHa2DUo2ObUNo
	 7Pt3MUQWKPxhGV5+3Wp7ZsWf9TyEqT09xVGXLqCz0ZkiAmaIhgguBJC24WqKsPMUK7
	 HgqOsCZncEDJ6B57J2rg1HUgrYxJU8Oezle7S9DsE89yQ86YaGuuC8+3MWvEHpKIYi
	 vQHLCYmHuymMHN4Nn2B4v22CO0VoSl00gbRxJViDZppuPtPlZb75/sDjf6Xcyb7wR8
	 zmB907PbeJY8TMNS04Y1chKGzntEfTu1cj44TLnGx5yUdC/PAzyk+Qk3YDFTCkIK3G
	 65oI0Z43XUuVA==
Date: Tue, 28 Apr 2026 09:24:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: Add device tree for Nord SoC series
Message-ID: <20260428-dangerous-garnet-collie-dacccf@quoll>
References: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
 <20260427023455.236410-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427023455.236410-2-shengchao.guo@oss.qualcomm.com>

On Mon, Apr 27, 2026 at 10:34:52AM +0800, Shawn Guo wrote:
> Add base device tree include (nord.dtsi) for the Nord SoC series
> describing the core hardware components:
> 
>  - 18 Oryon (qcom,oryon-1-5) cores in three clusters, with PSCI-based
>    power management and CPU/cluster idle states
>  - ARM GICv3 interrupt controller with ITS
>  - TLMM GPIO/pinctrl controller
>  - 8 TSENS thermal sensors with thermal zones
>  - 3 APPS SMMU-500 instances
>  - 3 QUPv3 GENI SE QUP blocks
>  - PDP SCMI channel and mailbox
>  - Watchdog, TRNG and TCSR
>  - Reserved memory, CMD-DB and firmware SCM
>  - PSCI and architected timers
> 
> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord.dtsi | 4511 ++++++++++++++++++++++++++++
>  1 file changed, 4511 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> new file mode 100644
> index 000000000000..00d189cfed8c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -0,0 +1,4511 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	interrupt-parent = <&intc>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "qcom,oryon-1-5";

I asked you to send this binding WITH the user, because they go via
the same tree. I see the user, but no binding for it in the patchset.

Best regards,
Krzysztof

