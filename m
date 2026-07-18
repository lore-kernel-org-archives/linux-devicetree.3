Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF301A5B9E
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784377010; cv=none; b=lvm4eHJr+onjwdmXLA0tflNCDPSmrK9q57/rsKJX6D+PyFpfsXeFPS8aNOl+osdfS2KYqqKxUT+UayGYjbkElnuofCXtnTDVZqO7+mU/zut9245YXRTztzAO/YMZ2XislCf9c3uxASU+HZXdoxcYiDZpofKMAPTU1sbAEEnsL8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784377010; c=relaxed/simple;
	bh=3QOKPOL+WBjXDEDXQDlFSVG28bbZnUDIVBw+V8bE2Xc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qB8kTSRfz/3eghkGMOEfri0GvFCjo25X8RgE81mZoDzNU8onfFN78I/2UaOIX0YpQZADwoR5YIhaFNlEWzLcvyxvuGP9QmfbaQd3zoHiDoi2kNj9Hf0MoaIBpNzFIjHNA0OGhapfiqbCb2DHV/qoYC0uTNxXMk5uR9FEkizn3Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1vQoh16; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1vQoh16"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1714C1F000E9;
	Sat, 18 Jul 2026 12:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784377009;
	bh=q/wbcwWNjfvLyOLoxpg+CVgzZ155Yakr5QriKucJtLw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y1vQoh16PrFygeqb4R5YR3WX1yVu6yWaPOjOVhHoER36t6pghzR9Rdqcg2TzaKWjF
	 jrWXmal5owR3Ucf9NSa5GKzq3z8Pl9MBRHTI/ACnhI7523NRc1ghkzMH5txPCtiuv+
	 8yjcyhmL0pvFCShXRV9WnWM4SdcVZKKyE0SJCdVrLiqPKha97Ex0JGggI6Wa+fBAnN
	 3GyRXQB8Zkgv1QC5mUA4DDlKveH3oVA5s/uw2akJR3PvugsbvsN6LegI2qoi480w9s
	 lpdX1rKFImZbgSaS9ss1cNE68r5OUS532Hustea7L5rZYTya7qKP1d/ddMc3rvSf8d
	 dezcbKV4m1SNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: Add Kalambo CRD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikrishna Garmidi" <gopikrishna.garmidi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260718-b4-kalambo-crd-v1-3-a1069b5a2757@oss.qualcomm.com>
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-3-a1069b5a2757@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 12:16:48 +0000
Message-Id: <20260718121649.1714C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device tree leaves orphaned nodes for the physically absent =
PMIC 'D', leading to invalid SPMI device probing and thermal zone registrat=
ion.
--

--- Patch [3]: [PATCH 3/5] arm64: dts: qcom: Add Kalambo CRD ---
commit aaa6e566ef6b80e52c726e5cb734189e7e8ad2a3
Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

arm64: dts: qcom: Add Kalambo CRD

Introduce support for the CRD based on the Qualcomm Kalambo SoC.
It reuses the common CRD board description and drops the PMIC nodes
not present on this design.

> diff --git a/arch/arm64/boot/dts/qcom/kalambo-crd.dts b/arch/arm64/boot/d=
ts/qcom/kalambo-crd.dts
> new file mode 100644
> index 0000000000000..b4441807f4602
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "kalambo.dtsi"
> +#include "glymur-crd.dtsi"
> +
> +/delete-node/ &pmcx0102_d_e0;
> +/delete-node/ &pmcx0102_d0_thermal;

[Severity: Medium]
Are the deletions for the SPMI bus 1 endpoint and its thermal zone missing
here?

This drops the SPMI bus 0 endpoint for PMIC D, but seems to leave the bus 1
endpoint (&pmcx0102_d_e1) and its thermal zone (&pmcx0102_d1_thermal) activ=
e.
Since the PMIC is physically absent, attempting to probe the orphaned bus 1
device and poll the absent thermal sensor can cause SPMI bus timeouts,
deferred probes, and log spam from the thermal framework.

Should &pmcx0102_d_e1 and &pmcx0102_d1_thermal also be deleted in this bloc=
k?

> +/delete-node/ &pmh0104_i_e0;
> +/delete-node/ &pmh0104_i0_thermal;
> +/delete-node/ &pmh0104_j_e0;
> +/delete-node/ &pmh0104_j0_thermal;
> +
> +/ {
> +	model =3D "Qualcomm Technologies, Inc. Kalambo CRD";
> +	compatible =3D "qcom,kalambo-crd", "qcom,kalambo";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718-b4-kalambo=
-crd-v1-0-a1069b5a2757@oss.qualcomm.com?part=3D3
