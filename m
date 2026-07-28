Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A55D30C146
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 16:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785254442; cv=none; b=pzH9cUrtY4No0PQqT+WXpuPpDV80axlWpuU6HbiFL8alANUxf5OFciPwg7gaJk2Mr6Z1vul42gU3EroU6WzSxHlzLaeNkPKjY9BzDFn9OSPCx+KwI152kgyoA/ZYkD450PAZ5lXzKcCV6pBVH6D2wJ/Qnw2O6LBX0+D26zD3Giw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785254442; c=relaxed/simple;
	bh=xRLMRX8Fi6kOnu80CnBQI+bAKGK0YWWwIxouBmhMwYc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lCUKSEb2seC9rsdhv/4E/cYrbqCzbEG3Dqn0HtHIbjWETWqsyB4fy5Yzo36pTrLQa8hYMcxCSESpqJjvdpGJLyvpcI162OwP6utxml9M1haTCLrkvIFiDZBSdh1Y/tPgNJH3GVOof0OMqCJkzYcjc9fcreaWc5TkkH5vFvZenFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sc2Oebl/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sc2Oebl/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B651F000E9;
	Tue, 28 Jul 2026 16:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785254441;
	bh=gj+23EWc5lTytP7P+KPGgUbDKCkDKCl085ewmD74KOU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sc2Oebl/tXZDGBKYrNZ0E110xsQsuRLR+hGnreQQ7cLao5xjQdh3bLGhq5j01C0Zr
	 XaGUHKqqrN84T4JOahwamTr39pCw+4nApT99KRfnZM7qg9Jxsy4DbTGsMPoqMmfVvb
	 2ZFWP2nRODlg/xewJ97hjJVGLw5ZMo+flhFLzMdCu8X9s0NhUCy4qMh1wyOJKvhCei
	 gYYrStf9FEuQd4Jk7bqEM4d7fJzTx8h9jMrke/N97D/enwZW2cKxNbeslYHHdRb3HC
	 IXjSF5Mu+SJAXoiZy11kSs2IkSn/1b+HrBzWfMN2nmiiRYKVxiLNI9W57jL3KCZoI0
	 jjJRJXstDnEMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: Add header file for ADC5 Gen3
 channel macros
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-adc5_gen3_dt-v4-1-355f0edece77@oss.qualcomm.com>
References: <20260728-adc5_gen3_dt-v4-0-355f0edece77@oss.qualcomm.com>
 <20260728-adc5_gen3_dt-v4-1-355f0edece77@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 16:00:40 +0000
Message-Id: <20260728160041.11B651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Device tree binding header is improperly placed in an architectu=
re-specific directory instead of `include/dt-bindings/`.
- [Medium] Function-like macros share exact names with object-like macros u=
sed in the driver, causing preprocessor namespace collisions.
--

--- Patch [1]: [PATCH v4 1/4] arm64: dts: qcom: Add header file for ADC5 Ge=
n3 channel macros ---
commit 59d21969abff768469fefb21430c2e819299df4b
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

arm64: dts: qcom: Add header file for ADC5 Gen3 channel macros
   =20
This commit adds macro definitions for virtual channels (combining the
ADC channel number and PMIC SID number) to be used in the devicetree by
clients of the ADC5 GEN3 device.

> diff --git a/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h b/arch/arm64/boot/=
dts/qcom/qcom-adc5-gen3.h
> new file mode 100644
> index 0000000000000..aa8e54d7e786a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h
> @@ -0,0 +1,88 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __DTS_ARM64_QCOM_ADC5_GEN3_H__

[Severity: Medium]
Should this device tree binding header be placed in include/dt-bindings/
instead of arch/arm64/boot/dts/qcom/?

Headers that define hardware channel IDs form the ABI between the devicetree
and the operating system drivers. Placing this in an architecture-specific
directory makes it inaccessible to C drivers or other architectures.

Moving it to include/dt-bindings/ would allow it to be shared universally a=
nd
parsed by standard DT schema validation tools. The include guard also appea=
rs
to couple the file unnecessarily to ARM64.

> +#define __DTS_ARM64_QCOM_ADC5_GEN3_H__
> +
> +/* ADC channels for PMIC5 Gen3 */
> +
> +#define VIRT_CHAN(sid, chan)			((sid) << 8 | (chan))
> +
> +#define ADC5_GEN3_REF_GND(sid)			VIRT_CHAN(sid, 0x00)

[Severity: Medium]
Will this function-like macro collide with the object-like macros already
used in the driver?

The corresponding IIO ADC driver already uses identically named object-like
macros, such as #define ADC5_GEN3_REF_GND 0x00.

If the C driver includes this header to avoid duplicating channel
definitions, using the exact same identifier for both a function-like macro
and an object-like macro will trigger preprocessor redefinition errors.

Could the base channel IDs be defined as object-like constants, and a
distinctly named helper macro be provided to construct the virtual channel?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-adc5_gen3_=
dt-v4-0-355f0edece77@oss.qualcomm.com?part=3D1
