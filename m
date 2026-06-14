Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB41371041
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 08:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781424767; cv=none; b=JYArElPmNz96T2VgFHWwsWkYuEEhT2RDrMril3Q+ajHr+bxEWyCdmAhMVOK6EGVkbp573UtCLwVxQYe6W5M+VQWtKKncfz4kaZ4NHEOhV70EDlbdIjuIMimj9uenbY8PmOoZkYsFyPcTO/82TzWbAPWyImyUHZX8jdqY6A5Ul5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781424767; c=relaxed/simple;
	bh=C9QFcVT57r5iXdbmULjIHXtkRDFVc7R72WHGDqxK6ng=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NEy8/5UIt3riCrj+azUTVNkEFB+JWoGRr2dmTpm29Z4Z7ComtmjSIHzJetZQlSoJ5syFjZ5WzMSihy3S6gHjTy1ffbYgn4X4TcHh8dKzYCSAkaqUMVTMAv9Xyyj9NbgDxYxMcQKFpKZ0eSNFR6D/HpfCkBmgAQQnHrYLLqHE57Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IHz6NKtT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHz6NKtT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2AD81F000E9;
	Sun, 14 Jun 2026 08:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781424765;
	bh=Ae00WZ67fyNRpYZV8XiblT0h+xUPBvTzdrGmmC7/09k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IHz6NKtTvOcV1xOKTVV7kjFGU52ONWORCmkyLOLqinGK4/doZ3JYnX1jLpUXg48lB
	 ZBFVgR0G9M/sT1Ix1us1PpqYLug5dnQwJaOxQAz+Bgmg6/sglYjXnz/50ThtNmtWEP
	 VkLCUWz/QPdGaTR9q5XCGHspygK1D7joEo92YH98dk5AI7RRabe+mdXuZzv5WaMSkp
	 SlIa+TTo0VwOZ9EcOzvvTccRlBEliCidJ8uR9r6Xzb8He3EOJEkCZpshMhukPv/b0e
	 QJcY3pUND/55MVKRVFW080fWvLXOlogTWvaxhKqf+kSMmUzWWtl5fi83VUK6h/h0lv
	 2ZEguR+C7wO/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: Add header file for ADC5 Gen3
 channel macros
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260614-adc5_gen3_dt-v2-1-32ec576c5865@oss.qualcomm.com>
References: <20260614-adc5_gen3_dt-v2-1-32ec576c5865@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 14 Jun 2026 08:12:44 +0000
Message-Id: <20260614081244.C2AD81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Devicetree binding headers for shared hardware components must be p=
laced in `include/dt-bindings/`, not architecture-specific directories.
--

commit 7bed566fe71218ad2ab3cd2babe147ee1d601536
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

arm64: dts: qcom: Add header file for ADC5 Gen3 channel macros

This commit adds macro definitions for ADC5 Gen3 virtual channels to be
used in devicetrees and ADC channel reg properties.

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
> +#define __DTS_ARM64_QCOM_ADC5_GEN3_H__
> +
> +/* ADC channels for PMIC5 Gen3 */
> +
> +#define VIRT_CHAN(sid, chan)			((sid) << 8 | (chan))

[Severity: Low]
Should this header be placed in include/dt-bindings/ instead of an
architecture-specific directory?

Devicetree binding headers defining ABI constants for reg values typically
reside in include/dt-bindings/ like include/dt-bindings/iio/adc/. Placing
the header in arch/arm64/boot/dts/qcom/ prevents cross-architecture sharing
and can break dt_binding_check validation, as the schema tooling expects to
include these headers from the standard dt-bindings location.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614-adc5_gen3_=
dt-v2-0-32ec576c5865@oss.qualcomm.com?part=3D1
