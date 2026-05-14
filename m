Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39B83F4127
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 07:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778744875; cv=none; b=XrINM175HE7C2R2GXIJKq1t4svnXz6XJZ7MT8oiOxZpPyvcr2lpoV80f852CHWyXa0wD+BUFk2V9rI7j2ij4VNOBqmWHI7nAQT/Zwip9fzsNbWqibBTN+b7y6DvngvzLDEzLZVb4ynKnl0vQxuyI0+y1bDaQF274NaimlurXfYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778744875; c=relaxed/simple;
	bh=4ygkUXydDvfdzGsONSuS9fwxQVTKND9fd/m4hei/qzg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rtkNXaug6XsJyAS+RKo5zm9Km0YJPY9tiiW5tlnhhhp0j/BY9Y4KmniOpDuikee79i4joe14zG/FmzsZIgJvfx8OvNTmf+2Z7uXHGw47pjxLe4zQx3vks/mdktZICFnL1Dr4O1H+5GhrFdOQsveuKCfwLr/netfl3AximsK/Z2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SOoTdfCH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SOoTdfCH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED8CC2BCB7;
	Thu, 14 May 2026 07:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778744874;
	bh=4ygkUXydDvfdzGsONSuS9fwxQVTKND9fd/m4hei/qzg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=SOoTdfCHMzoHQ/AJK3jLp86kZNK9TXqfVwX+tw/0l4uA/a069GCucXxcbEyNrTqZy
	 xWLP0KEBilaKXuk1cMO6epXvc9YRUHF7aOWE7Tk8hGHW0bFAZtctuRHf/SQJTOnELb
	 wn5vw9mQJC1ldN/Xfzo969YVU+DthHeIQq0lpMTtMGVMYq168G9puKIdmG3ub2BzSD
	 ClqESKlYTp5/auodUo6pP6Z0QTZZdTbcDLBU4mYdgeQm9Wk+kkvY4BoxP9uFgEKwR+
	 qguOvStfkj6sZRxyrS6bcKKmm7fXO8ZMvUsJNRVP/M5CB9hR4Gwwegztgq+/s4cKcx
	 6QM8C1YV1HrtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/7] dt-bindings: clock: qcom: Add support for CAMCC
 for Eliza
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260513-eliza_mm_cc_v2-v4-3-e61b5434e8d9@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v4-3-e61b5434e8d9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 07:47:54 +0000
Message-Id: <20260514074754.8ED8CC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema incorrectly enforces the `#reset-cells` requirement f=
or the newly added `qcom,eliza-cambistmclkcc` variant, which is not a reset=
 provider.
--

commit a9d0f97a6a58cdea9469da3167d31dd8b62fa02f
Author: Taniya Das <taniya.das@oss.qualcomm.com>

dt-bindings: clock: qcom: Add support for CAMCC for Eliza

This commit adds compatible strings for the Eliza camera and camera BIST
clock controllers to the existing Milos camcc binding. It also introduces
the corresponding dt-binding headers.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yam=
l b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
> index f63149ecf3e1b..fe94dbeb80c60 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
> @@ -8,16 +8,23 @@ title: Qualcomm Camera Clock & Reset Controller on Milos
[ ... ]
>  properties:
>    compatible:
> -    const: qcom,milos-camcc
> +    enum:
> +      - qcom,eliza-cambistmclkcc
> +      - qcom,eliza-camcc
> +      - qcom,milos-camcc

Since qcom,milos-camcc.yaml already has an unconditional inheritance from
qcom,gcc.yaml:

Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml:
    allOf:
      - $ref: qcom,gcc.yaml#

the base schema enforces #reset-cells in its required list.

> diff --git a/include/dt-bindings/clock/qcom,eliza-cambistmclkcc.h b/inclu=
de/dt-bindings/clock/qcom,eliza-cambistmclkcc.h
> new file mode 100644
> index 0000000000000..7b8b285f18d27
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,eliza-cambistmclkcc.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_ELIZA_H
> +#define _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_ELIZA_H
> +
> +/* CAM_BIST_MCLK_CC clocks */
> +#define CAM_BIST_MCLK_CC_MCLK0_CLK				0
[ ... ]
> +#define CAM_BIST_MCLK_CC_SLEEP_CLK				19
> +#define CAM_BIST_MCLK_CC_SLEEP_CLK_SRC				20
> +
> +#endif

Looking at this newly added header, the BIST MCLK controller only provides
clocks and defines zero resets.

Forcing a pure clock provider to declare #reset-cells to pass schema
validation seems semantically incorrect. It might force developers to add
bogus properties to their device trees to circumvent validation errors,
which happened in the subsequent commit "arm64: dts: qcom: eliza: Add
support for MM clock controllers".

Would it make sense to use an if-then conditional block in the schema to
restrict the #reset-cells requirement to actual reset providers, or move
the BIST controller to a separate schema file?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-eliza_mm_c=
c_v2-v4-0-e61b5434e8d9@oss.qualcomm.com?part=3D3
