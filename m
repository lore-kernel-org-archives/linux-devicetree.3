Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B82349CCB
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779478785; cv=none; b=bAYv51YIy4bOb5//hqaz0g1jfj1I2fWnBK3gJZ7R1y3uhPvpXZV+G+T32reGLNmXCrS+RD9goleg7q5IbKJkXt0rPsCHxbDLsD48wCpe5CSlH/RW77hz0746ldbHq9KxWuon1LkU3WqVKjun2IyRA20yQqRTTs7PQayvvyDoJ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779478785; c=relaxed/simple;
	bh=SDwlX2tRJiOYnYUpF56esWTMRGDoEHq1TMkAhh73Zjg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OjlKdrRurqBZYmDi3us3RJu6sMHawKbJybAri1cWapiNR+8nHjjvwOLCnoe7wbNastWLZV5FslZjl3+nAl2RGjEN0s2yW6RWuHHDH5JLJfasymkQF94YwYyWhq81kyVuiqoe5IzPugWf8zhqPZTX7ZbgngdNwN8c3bODhYEblQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngomBUqZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngomBUqZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660811F000E9;
	Fri, 22 May 2026 19:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779478784;
	bh=FJ1RnWOdPsO+HzyStJwnpYjnLxxCs8J71dBVx2Om484=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ngomBUqZFBcPMrgKUJ08WvSxtBRJLy7qcgKrM0/DS0iXt+l00rQyP8oK3a+np41aF
	 4AUUouG112nCiYCuo+6vqwq3Va+4OWA/caBpKyEq4mEnywr/WOVbIO0LAxCKF7JELt
	 loNToJtV84788iNzSZmt0yRLPKAGEUuTD0En+aVolXumYYlo6d+NQ+RvQuH5SuMd+K
	 ssBBokiMnJUt914/LaNXwjy3hXi/fTdQoyJXOh77FOoSOHIttrzqDI6naB0bv5BXWT
	 6ZapCn1GTwIL8g1k4a6UuhEsg2ED8EJbQQTZ6wa30qY4NAvATrHjcRZ7j7Qcn0Z3eV
	 B3galgDDIAgrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: Add Shikra EVK boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: vkoul@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org
In-Reply-To: <20260522-shikra-dt-v3-5-80ffde8a3dc4@oss.qualcomm.com>
References: <20260522-shikra-dt-v3-5-80ffde8a3dc4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 19:39:43 +0000
Message-Id: <20260522193943.660811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The device tree file shikra-cqs-evk.dts incorrectly includes the C=
QM SoM device tree (shikra-cqm-som.dtsi) instead of the expected CQS SoM de=
vice tree (shikra-cqs-som.dtsi).
--

commit cb9ff9c76f4ee019113138237f57794fa621d71f
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

arm64: dts: qcom: Add Shikra EVK boards

This commit adds device trees for the Shikra EVK platform, combining
Shikra SoM variants with a common carrier board. It introduces three EVK
boards: CQM (retail with modem), CQS (retail without modem), and IQS
(industrial without modem).

[ ... ]

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

[Severity: High]
The commit message states that shikra-cqs-evk.dts pairs with the CQ2390S
SoM (retail, without modem). Does this file include the incorrect SoM dtsi?

Including shikra-cqm-som.dtsi here seems like it would pull in the hardware
description of the modem-enabled CQM SoM instead of the expected CQS varian=
t.

Could this cause boot issues or lead to loading drivers for hardware that
isn't actually present on the CQS board?

> +#include "shikra-evk.dtsi"
> +
> +/ {
> +	model =3D "Qualcomm Technologies, Inc. Shikra CQS EVK";
> +	compatible =3D "qcom,shikra-cqs-evk", "qcom,shikra-cqs-som", "qcom,shik=
ra";

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-shikra-dt-=
v3-0-80ffde8a3dc4@oss.qualcomm.com?part=3D5
