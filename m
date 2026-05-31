Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C51155C97
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 04:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780201385; cv=none; b=pi7LdmQUXwIHozyVXRaTPJfZoS0LfYMgQgUYMYjwFP99rsct9lKOWjs4cRNkCBboQSr5JBwG87X3+Dtvv17RGGDlAR7p3lDYFMBdqu1ffFbBewzLLcyafUKV10kaOEkuC6u0/pzfC2WJcx5dpgXOYC/8YeFNP9Ilzhu3wjZ6wfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780201385; c=relaxed/simple;
	bh=VMlVqFlV+Xk1D81up4k1MoBZB+wu4pSd8YsuDgRUSHw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tN/4FnfIAY9HCaLhKT+LjZLxGD6RcEmFywCoD0Y/U5AWoUaeb4rS+Ragv3DxgoccNzrzWJFsFzICGKZJQWseDe5tyKx7rsgzNwZ4iXxJBiuKjv46QyC/8dFEMuGgdCnCl3ph6Ri9dIAYSzd0HTlcZk4bQw8BwHfd70Qpo0CCw/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICz5srpI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICz5srpI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDEAF1F00893;
	Sun, 31 May 2026 04:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780201384;
	bh=hXCljz9USz0twqNto9saeTSaOKQ4mrSLG4A1uS9439E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ICz5srpIcw+7Mj8uLqegBbSU8Mbgjo1fOBMWsLkntVthCjAWRZ/PuqTv4YYaA/uR1
	 2n/VuC5KasYbsVI/ZoEB2L23kuaDOUIHd1ZbmbvjN0QZAym02gQJwTmJXDMdwNuZm+
	 PEZ2zbDB9wtqCt+DHui03vg4be6/JZlOpgnnjBRonJ/VYAyrLUGePIIXlFdhjU3P5Y
	 WLncFMSSUjAhdnYKey7lXgKPD4qPN4zX8ZHi5/VmU95klksHsWmfAPezqvrf2bGjiZ
	 9xbjGMQBLzZ1YUnk3iJ90YHukbe6ebkbENL4o1RIvTBEYpuJsFdoCwKQYKfP3r5U15
	 +b2WidoMW3lqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: qcom: add lcc-msm8660 LPASS
 clock IDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <be69409cac5f6b316a609e182e609f0ce6133bbe.1780197511.git.github.com@herrie.org>
References: <be69409cac5f6b316a609e182e609f0ce6133bbe.1780197511.git.github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 04:23:03 +0000
Message-Id: <20260531042303.DDEAF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The new `qcom,lcc-msm8660`, `qcom,lcc-msm8260`, and `qcom,lcc-apq80=
60` compatibles were not added to the legacy naming enumerations in `qcom-s=
oc.yaml`.
--

commit f40b14d3bc25d211dba1f4b6ea323fcbe8e84acb
Author: Herman van Hazendonk <github.com@herrie.org>

dt-bindings: clock: qcom: add lcc-msm8660 LPASS clock IDs

Add the dt-binding clock-ID header for the MSM8x60 family
(MSM8260/MSM8660/APQ8060) Low Power Audio SubSystem Clock Controller
(LCC). It mirrors the format and ID range of the existing LCC headers
for newer Qualcomm SoCs.

> diff --git a/include/dt-bindings/clock/qcom,lcc-msm8660.h b/include/dt-bi=
ndings/clock/qcom,lcc-msm8660.h
> new file mode 100644
> index 0000000000000..d5d9b0d71a78f
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,lcc-msm8660.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2014, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_LCC_MSM8660_H
> +#define _DT_BINDINGS_CLK_LCC_MSM8660_H
> +
> +/*
> + * MSM8x60 family (MSM8260/MSM8660/APQ8060) LPASS Clock Controller (LCC)
> + * clock IDs. These are compatible with MSM8960 LCC as MSM8x60 and
> + * MSM8960 share the same audio subsystem clock architecture.
> + */

[Severity: Low]
Since this series introduces new compatibles for the MSM8x60 family
(qcom,lcc-msm8660, qcom,lcc-msm8260, and qcom,lcc-apq8060), do these
legacy format strings also need to be added to the generic SoC naming
constraints allowlist?

Without adding them to Documentation/devicetree/bindings/arm/qcom-soc.yaml,
will device tree schema validation fail for boards using them? They match
the generic regex but aren't in the legacy permitted list:

Documentation/devicetree/bindings/arm/qcom-soc.yaml:
      - enum:
          - qcom,dsi-ctrl-6g-qcm2290
          - qcom,gpucc-sdm630
          - qcom,gpucc-sdm660
          - qcom,lcc-apq8064
          - qcom,lcc-ipq8064
          - qcom,lcc-mdm9615
          - qcom,lcc-msm8960

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780197511.gi=
t.github.com@herrie.org?part=3D2
