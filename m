Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5096D3F4DC8
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 12:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513614; cv=none; b=EkOpc4hW2bYiv9sRX450QbZutOqq5RMUMOeaHzQeM1LqgZpU7udhlHJ3zICDkj/Ae5V89anwknyBQlP7rdordBSyxi7ETTLy2+qbpY8uh9wNE1RqQUxnWeN0EhvZToeLQwfgO7wvhKmF3MofGILMet1tQut9cDSyWSXra3bwc10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513614; c=relaxed/simple;
	bh=tfndFENNcNmvPnzCIn+ql05RqMPs4d9sIuuI3NdqoQk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eAmKcwTLYGwU+bQFUrYoT4QgSAHohv0kden4g8cPf4PJDprxSP0CF0O2feDtGbwMCoTcCUxQOVvLT2jMKrZrAEPiauYdMCaXPeN783OlcgY2wN9XHvTysbex/UIVjmJZZtQb6TZNrjyoAutdMDIvIq5WhcJK1LXV4BhvYYLGK3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D45Ua00P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D45Ua00P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB6F1F00A3D;
	Wed,  8 Jul 2026 12:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783513613;
	bh=lmRsPf9VEqFuwdGL0N01ygoQ0sNBqVgckzefpy6MbHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D45Ua00PVrHaWvDFhewpeQ207QIm9Bgqf/DgwlOcV2fzIUYdkizGPqLCtEv3/z0ye
	 dzZqItSfuaZkfwWygiA9ZtpCLteCeSFtxPp1zxg51wqptLHEiwv86kKSydCoSznyOX
	 /ikOlMwEqPBPCA26NbZzWKjKjf77XJ3H0KukpA+LrtZCKSUGfeYMJ4Fmnz7sQShtu+
	 G9NL6Tvz/NM6s5A55jQd5ChSMncv4xB8jXXSPJBfA+w2SQnNTdeYv09/cXDL1vK/u+
	 owxSOPCSTLvBB8xu7FcY5YDjVyM5uJsHlIQor4RAgwqDxqMw381j8RtOoLHO4qwm9j
	 LDrHmiz413GSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: Add Shikra EVK boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260708-shikra-dt-v7-5-977b65a300c1@oss.qualcomm.com>
References: <20260708-shikra-dt-v7-0-977b65a300c1@oss.qualcomm.com>
 <20260708-shikra-dt-v7-5-977b65a300c1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 12:26:52 +0000
Message-Id: <20260708122652.8CB6F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The CQS EVK board incorrectly includes the SoM device tree for the =
CQM variant, logically coupling a modem-less platform to a modem-equipped p=
latform.
--

--- Patch [5]: [PATCH v7 5/5] arm64: dts: qcom: Add Shikra EVK boards ---
commit 4fcaf27e44972f2edd1677d38c5edd3906fd3d1a
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

arm64: dts: qcom: Add Shikra EVK boards

This commit adds device trees for the Shikra EVK platform, covering the
CQ2390M, CQ2390S, and IQ2390S SoM variants. It also introduces a common
carrier-board configuration shared across all variants.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-cqs-evk.dts
> new file mode 100644
> index 0000000000000..b3f19a64d7aed
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "shikra-cqm-som.dtsi"

[Severity: Low]
Is this the intended SoM include for the CQS EVK board?

This file appears to include the device tree for the CQM (with modem)
variant instead of the CQS variant. While it might currently only define sh=
ared
configurations, future CQM-specific additions could inadvertently propagate=
 to
the CQS platform.

Should this include a CQS-specific or shared base .dtsi instead?

> +#include "shikra-evk.dtsi"
> +
> +/ {
> +	model =3D "Qualcomm Technologies, Inc. Shikra CQS EVK";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-shikra-dt-=
v7-0-977b65a300c1@oss.qualcomm.com?part=3D5
