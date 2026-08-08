Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D522EB0F
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 18:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786214735; cv=none; b=tA8092pDC6XPI2MUQQE56N2cyDoBpF63aVchzpKCtskapQXMnN7HhoQfAYYoi/uTRJ52hbJcY1gJwVXKM4/8aL/Q4mi9hXyYFVmN2fC5rZAyHaLJnJ4KBBV9tv2ZVa1u8wyTeJ0VTuvk2izvsSEElJMijuBI5qsNggToHVx8NJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786214735; c=relaxed/simple;
	bh=t93sa+0FgbOdA2OvAWLFH6EN4P0G7kVfvWdDPlMilLw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CaaRNaOMO4USrITvzbHfnEzKX/5ukSHubIDMj4mOu7SqhLfuxBNFPP3bvY/2/KiT8bnNWFnEzUTOiuex6QgImjQufnH7Wz4P9RH56UKbjCdYBhhltFBQdVh4OK9/zBo2vW3EvGbrxM9brZ8fNyyM0mbfxCgZWbRqnUEbYQLH5Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kAbskEHZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kAbskEHZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C37B1F000E9;
	Sat,  8 Aug 2026 18:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786214733;
	bh=N2OVBN3HnKWCq0ailY/NDgfQRbJz3qDjl7k8OikNk8g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kAbskEHZM7NZFPd7W3LsNSRGQ8dXfi4pAH3QNbR+z0uKiAoyDuwlxXmPFaZ/VLukJ
	 7bFQ9czoDtCBkCPOMWAOPO2nhX8c1+9kukOULg78roN2SiLmNJPIkVDz0t/JCw9OCi
	 w87Ohcrg+mK68/ahRdguG5cTaGWLOan9ewe2zJHw9XB/gysVb1hJbIvqYNV6p/Zo8C
	 6y0MT506YsECEoc8BZIP5509BQhuITfRYuWLPiVyLYEWRPcWuZ0g2PUCWuJpvjaNPw
	 D8liMZq56nuxDzWAOJqA1ubD2se0AMZFdJiJmqcHTMP3KqnSNVR8s/IjxnHNqxtdEP
	 pQxlbQiKi0Qhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/5] dt-bindings: sound: qcom,q6dsp-lpass-ports:
 Rename QAIF clock IDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260808181948.2489187-2-prasad.kumpatla@oss.qualcomm.com>
References: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
 <20260808181948.2489187-2-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 18:45:32 +0000
Message-Id: <20260808184533.5C37B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Renaming macro definitions in the dt-bindings header without updati=
ng corresponding driver usages breaks the kernel build.
--

--- Patch [1]: [PATCH v1 1/5] dt-bindings: sound: qcom,q6dsp-lpass-ports: R=
ename QAIF clock IDs ---
commit 24389528fddee532f4b72dd537118240033f4a3e
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

dt-bindings: sound: qcom,q6dsp-lpass-ports: Rename QAIF clock IDs

The patch renames the LAPSS_CLK_ID_QAIF_* macros to LPASS_CLK_ID_QAIF_*
in the dt-bindings header to fix a spelling typo in the prefix.

Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatl=
a@oss.qualcomm.com

> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include=
/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 2e879a3c09aef..3a99703dbc4a0 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h

[ ... ]

> -#define LAPSS_CLK_ID_QAIF_IF0_IBIT		71
> -#define LAPSS_CLK_ID_QAIF_IF0_EBIT		72
> -#define LAPSS_CLK_ID_QAIF_IF1_IBIT		73
> -#define LAPSS_CLK_ID_QAIF_IF1_EBIT		74
[ ... ]
> -#define LAPSS_CLK_ID_VA_QAIF_IF0_IBIT	97
> -#define LAPSS_CLK_ID_VA_QAIF_IF0_EBIT	98
> +#define LPASS_CLK_ID_QAIF_IF0_IBIT		71
> +#define LPASS_CLK_ID_QAIF_IF0_EBIT		72
> +#define LPASS_CLK_ID_QAIF_IF1_IBIT		73
> +#define LPASS_CLK_ID_QAIF_IF1_EBIT		74

[Severity: Low]
Does renaming these macros here without updating the dependent driver files
break the build?

Looking at q6prm_clks in sound/soc/qcom/qdsp6/q6prm-clocks.c, it appears
to still reference the old macro names:

sound/soc/qcom/qdsp6/q6prm-clocks.c:q6prm_clks() {
    ...
    Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_IBIT),
    Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_EBIT),
    ...
}

Because Q6PRM_CLK(id) concatenates Q6PRM_##id, the corresponding target mac=
ros
in sound/soc/qcom/qdsp6/q6prm.h also still use the LAPSS spelling:

sound/soc/qcom/qdsp6/q6prm.h:
#define Q6PRM_LAPSS_CLK_ID_QAIF_IF0_IBIT        0x500
#define Q6PRM_LAPSS_CLK_ID_QAIF_IF0_EBIT        0x501

Do these C headers and source files need to be updated in this same commit =
to
prevent undeclared identifier errors during compilation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808181948.2489=
187-1-prasad.kumpatla@oss.qualcomm.com?part=3D1
