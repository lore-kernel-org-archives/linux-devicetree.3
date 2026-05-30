Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69C32F83A0
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 14:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780150470; cv=none; b=qTADi24cBGj2fZiLky7D8Jq434BajebBy3a5wWX8asrnGJgzy870YcwUXh1i6fMzdiC6PeAsadHSIFu6mUIy40oMJq5iLy2luAQb4aiv88gG0rdby34DD5BsqkOtMLwDc3yNljvALHyqX45nmx8XrYeTTA9qJAc5uGabSW2R0As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780150470; c=relaxed/simple;
	bh=XkYW8wk7NpsERbAdUbN+dJ4476D7RNJJuMjQhy9Jf10=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E7KcznLuN0e/IAl1FpNvN90EsDl3HAhUcd/GVNUYacF1GZoevQtGn6Q0Ldio7xa+91eknbphmZ/W0FcPVId6NAWzyenMupNWPt1WOrCmAICMlAHD38pyqHdhn+3DmYn3OsB9UqzujZUaiqK8BV1Q05wjJUQ/HTIzGRCAxa2J9bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bz2HlhER; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bz2HlhER"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39A51F00893;
	Sat, 30 May 2026 14:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780150469;
	bh=/eiCSVLrThmNX9kypnk/+5rgFRVOqfYfUsr+Mx5apCY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bz2HlhER8ekbEJycxfnVZlN0HIsqjYoThS7fZC2z6aBoDD41aQk67bqUCeRqLO5sX
	 tqXbOne+heOFYNjdvPGJcx4XI5rX/pD60Q/mLoOiaSz2MDZEHznrD07bNBh6X0Rrr3
	 PKPVxFR5WS6HE6dHLBI8YGqDdxeiVGkiCumd0VjjE1s/lWT3wSqjn6kg0KtSGlZQ+5
	 6S3oF4Awg+fv6MrSi0DeWRHeuvGeiipWGYuSMXJ9F2lnBzniqFsiDk2p5xjSlUg97l
	 xaX2181VdTLRfJQLMinxvsTuEaAzeQJ8uRQhJ44XYL3j8f5y3jPxB1UoyBp9jm4l8W
	 HhoJuYHEpI8cA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: clock: qcom,gcc-msm8660: collision fixes +
 per-clock annotations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260530135731.185313-1-github.com@herrie.org>
References: <20260530135731.185313-1-github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 14:14:28 +0000
Message-Id: <20260530141428.F39A51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Critical ABI Breakage: The patch destroys Device Tree ABI back=
wards compatibility by shifting numeric IDs of over 150 existing clock bind=
ings. DT binding headers define the stable hardware-software ABI; changing =
these IDs invalidates existing compiled Device Tree Blobs (DTBs). The commi=
t claims to fix ID collisions, but the baseline values were already distinc=
t (e.g., `USB_HS1_H_CLK` and `USB_HS1_XCVR_SRC` were 110 and 111). By inser=
ting new clocks (like `CE2_P_CLK` at ID 78) and renumbering perceived "coll=
isions", the patch shifts all subsequent clocks. For example, `SDC1_H_CLK` =
shifted from 95 to 96, and `GSBI1_H_CLK` from 125 to 126.
--

commit 41cfc5d6ae5f24f8a2e508765d49af3a6921e1a7
Author: Herman van Hazendonk <github.com@herrie.org>

dt-bindings: clock: qcom,gcc-msm8660: collision fixes + per-clock annotatio=
ns

This commit adds trailing documentation comments to per-clock definitions a=
nd
attempts to fix perceived ID collisions. However, it alters the numeric
values of numerous existing clock definitions.

> diff --git a/include/dt-bindings/clock/qcom,gcc-msm8660.h b/include/dt-bi=
ndings/clock/qcom,gcc-msm8660.h
> index 4777c002711a1..354e9d8657b92 100644
> --- a/include/dt-bindings/clock/qcom,gcc-msm8660.h
> +++ b/include/dt-bindings/clock/qcom,gcc-msm8660.h

[ ... ]

> -#define CE1_H_CLK				76
> -#define CE2_H_CLK				77
> -#define SFPB_H_CLK_SRC				78
> -#define SFPB_H_CLK				79
> -#define SFAB_SFPB_M_H_CLK			80

[ ... ]

> +#define CE1_H_CLK                           76    /* header-only - CE1 (=
crypto engine 1) AHB */
> +#define CE2_H_CLK                           77    /* drv+dt - CE2 AHB */
> +#define CE2_P_CLK                           78    /* drv+dt legacy:HTC,S=
am,TP - CE2 APB */
> +#define SFPB_H_CLK_SRC                      79    /* header-only - SFPB =
AHB src */
> +/* header-only - SFPB (system peripheral bridge) AHB */
> +#define SFPB_H_CLK                          80

[Severity: Critical]
Does this cause a regression in DT ABI backwards compatibility by shifting
the numeric IDs of existing clock bindings?

It looks like inserting CE2_P_CLK at ID 78 shifts the values of subsequent
clocks. Device Tree bindings represent a stable ABI, and changing these IDs
means older compiled Device Tree Blobs (DTBs) running on this kernel will
request incorrect clocks.

[ ... ]

> -#define PMIC_SSBI2_CLK				94
> -#define SDC1_H_CLK				95
> -#define SDC2_H_CLK				96

[ ... ]

> +#define PMIC_SSBI2_CLK                      95    /* drv legacy:HTC,Sam,=
TP,Pre3 - PMIC SSBI2 */
> +#define SDC1_H_CLK                          96    /* drv+dt - eMMC1 AHB =
*/
> +#define SDC2_H_CLK                          97    /* drv+dt - eMMC2 AHB =
*/

[Severity: Critical]
Will this shift result in boot failures for older DTBs?

Because SDC1_H_CLK shifted from 95 to 96, a DTB requesting ID 95 will now
receive PMIC_SSBI2_CLK instead of SDC1_H_CLK.

When drivers attempt to access hardware registers without the correct clocks
enabled, it can trigger synchronous external aborts and system hangs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530135731.1853=
13-1-github.com@herrie.org?part=3D1
