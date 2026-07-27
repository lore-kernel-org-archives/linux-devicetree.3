Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009421FF7C5
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138644; cv=none; b=MzbsaMTCZhCAym65yEYJ1t4qVHNTLabHNSuTLKbtg1XexB70i3JbNEypmoMiNnf0q53wTxh5GKP/ewdYz+GN/+hBTxuQlOa1aBZRFXL1BJKoJ8HHITFXoruReertvrR/g2QwphCCAO1hNnx3qsUe8J26x71T5f4IrViPudkJL44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138644; c=relaxed/simple;
	bh=6jtwOs5aixlr0CJYSfXsHM/vj34A/mRriPezlivLfoo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U/s5nOFbddWV6tNBIOWORoFG8WT47LhhzXN5t4G291uipG5YOstnYe8A9/293bJ0/bCGZ6f8funi1Jur0HWktBk7EDVtEOZjYV1iKnIqWgiY4STY5xavuO7kCRhm9KCQlJKtbJdWCuTOH3sRb9cfv7IVVHSv+cWw7Cni0XvWyIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fH4R2Ork; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fH4R2Ork"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F741F000E9;
	Mon, 27 Jul 2026 07:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785138642;
	bh=zREkPUCyLw95i8iVsU3gMrIVY4tNdtW7Fjg51ui3gAU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fH4R2Orks6QBiDTobcdMx1vTp1F8WFCLqeisvzUuTUL9cTTjdK7YyJCc8DQkOYgkA
	 nd7ee68KQNFmQTfQ/PjOtu7tDLeoWEdaVIWCtr8SamghZxEYoZq8lBRJL0vVWo8gL4
	 /LmkaC2hDI6mJNzZfXxkhu2FuoN0c7jMTE9ELbVtnRYJdGvn9Ke6EV4M/CJAmWej5a
	 z5eKZmrcyoOydTSvle1OEqpdOSvrn1Yqq1Sl4RkMX3KLZpguMg/k4RWlIDAQMM2O1D
	 DDRElQrjQm6fkLov8hnE5hAqVvVxzVGlVyXfvcfEULBHYzqM30Wdfn23yDk19+IqTZ
	 6dTXyTh8b3oVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 01/34] dt-bindings: pinctrl: airoha: en7581: fix
 misprint in i2s function name
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727074234.3761170-2-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-2-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 07:50:41 +0000
Message-Id: <20260727075042.55F741F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Low] Incomplete fix: identical copy-paste misprint for 'i2s' function wa=
s missed in the sibling binding 'airoha,an7583-pinctrl.yaml'.
--

--- Patch [1]: [PATCH v7 01/34] dt-bindings: pinctrl: airoha: en7581: fix m=
isprint in i2s function name ---
commit 0749f859891dd657945c83f8003df4b6494d5a24
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

dt-bindings: pinctrl: airoha: en7581: fix misprint in i2s function name

This patch fixes a misprint in the EN7581 pinctrl binding where the "i2c"
pin function was defined twice, hiding the "i2s" pin function. The correcti=
on
aligns the binding with the actual pinctrl driver.

> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.=
yaml
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> @@ -166,7 +166,7 @@ patternProperties:
>            - if:
>                properties:
>                  function:
> -                  const: i2c
> +                  const: i2s

[Severity: Low]
This isn't a bug introduced by this patch, but does the same misprint exist
in the sibling binding for the AN7583?

Looking at Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.=
yaml
in the patternProperties:^mux(-|$):allOf block:

          - if:
              properties:
                function:
                  const: i2c
            then:
              properties:
                groups:
                  enum: [i2s]

Should this file also be updated alongside the EN7581 changes to prevent
schema validation from improperly failing when checking the i2c or i2s pin
functions on the AN7583 SoC?

>              then:
>                properties:
>                  groups:
>                    enum: [i2s]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074234.3761=
170-1-mikhail.kshevetskiy@iopsys.eu?part=3D1
