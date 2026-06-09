Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3C43624A5
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 15:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018219; cv=none; b=eVtEK799bKKQljiFoiairm2J6S4TtpTt0LBHwt7xrnHI2rpzUZ6PXQZ5ZlZvhPMuih/b+b/z4GfOVkTpzwaLzEcxPrMYwqQkFPGqo4E9Aj3TsntMFQuoatnKgOTPbVU18ibkl6epC23vdtbuUuPUhhH8LPicuwGYmzUVy0u2R6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018219; c=relaxed/simple;
	bh=myhw+vlZ6rGLjkHSGgn8hq8IiiMzVqR7opVwYfbmZes=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Hs2meHZGp4JTN+CvIqvyhZSC1vcebAgiy9QpBp1VRsocW0JH5Ev0Lm5TJ/i6OaJHVJcYfwyP3KwsJXsg8xHvGzB3XtAXLVTw5iiek5FEuWc9M4+bjOpdMyx+8qumKrdsTRxrONWCNwYcW0FuTQ7V+2fCxy9faJbvz3wXy7/ZgQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAd4fDog; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAd4fDog"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1CB21F00893;
	Tue,  9 Jun 2026 15:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781018218;
	bh=pdHZdB4glj3ixsaP/8nNiWIpY4FfnT1h3FPc86lPB28=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GAd4fDogZTf5jfZlhENQYbhiA6gNpjGc6Gy/iW3zCmqIpYByAYpdA3b0/mIm3tmBU
	 gO2ltGF+hrv2wNB6F/hmiEwHPEZdfzz+FO5bAkpNTn3R3mv6FMbHNj0tv8ccQZ6bCn
	 WkhXS3hFvzT5oc84SEiC7e6jYqz3A4/y8PWbsjl4PmnmpwqqviYW+w6fhb9cjjR8Pm
	 9Gc0q4V2q01fKvIyMKuCM0s0lmj24KkT48Idfzi3OrX5qb1BwsQYJavffY12jwwQgY
	 Hv/mBvEbWPoFcQtWBkXcaLB2fhY4cR52h8pMHoY95IXWIFw1fANuKc1T6iskBhiPSo
	 jwTSsqn6FGKlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/7] dt-bindings: clock: qcom: Add support for CAMCC
 for Eliza
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-3-17df09e5940c@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-3-17df09e5940c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 15:16:57 +0000
Message-Id: <20260609151657.C1CB21F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unconditional requirement of `#power-domain-cells` and `#reset-c=
ells` incorrectly forces the `qcom,eliza-cambistmclkcc` variant to advertis=
e itself as a power domain and reset provider.
--

commit 1b86ec5394cef411456da0c6a6314eebda1d7c44
Author: Taniya Das <taniya.das@oss.qualcomm.com>

dt-bindings: clock: qcom: Add support for CAMCC for Eliza
   =20
This commit adds the Eliza camera and camera BIST clock controllers
to the Milos camcc binding. It also adds #power-domain-cells to the
required properties list and introduces the device tree binding headers.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yam=
l b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
> --- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
[ ... ]
>  properties:
>    compatible:
> -    const: qcom,milos-camcc
> +    enum:
> +      - qcom,eliza-cambistmclkcc
> +      - qcom,eliza-camcc
> +      - qcom,milos-camcc
[ ... ]
>  required:
>    - compatible
>    - clocks
> +  - '#power-domain-cells'
> =20
>  allOf:
>    - $ref: qcom,gcc.yaml#

[Severity: Medium]
Does the BIST MCLK controller actually provide power domains and resets?

Looking at the new qcom,eliza-cambistmclkcc.h header, it only defines
clocks, with no power domains or resets. However, adding #power-domain-cells
to the unconditional required list forces the BIST controller to advertise
capabilities it does not have. Additionally, the unconditional reference
to qcom,gcc.yaml# forces #reset-cells to be required for all compatibles.

Would it be better to restrict #power-domain-cells and #reset-cells to
only the main camera clock controllers using an if-then conditional block,
or move qcom,eliza-cambistmclkcc to a separate binding file?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-b4-eliza_m=
m_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com?part=3D3
