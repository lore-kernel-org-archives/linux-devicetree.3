Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CE42D8DCA
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005712; cv=none; b=EJAF/hLyb/KuYzWMcrCXpPRCjIGoBYjbqMzQ/ynSwqGJr6vQ/Ukqp5pCgEFlb9JfFCwSLxCBhwTZXSbBgsu+vCdkLHQexav8XgGfk+0go2AGgDRU9moqUA7O5QlzGR2dHPRWntUFRmZBAH47oSbsh8lhfM3OLM7GX9RJJAZp0/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005712; c=relaxed/simple;
	bh=4aQ2D0RQ+7xqPwCI0eQAkuWk7RU9nw04s/cVf7FseYc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dwGXnbZbdC3WBPMAR2wIzg7DLI2xOmJ+kCUYlfcbDAEjZ2jvSSn/wQVixMnUQsleZqrMaZaLKkgiXTM/lPVqc3UTjs/8yNviHW44YfgV+0eEJDbBlhet6I3GKpARe+wT5kNYbpfzfIVICFx41tDzb+nzB4cJMdM+iW62E4Xhi/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oaxW/Zzy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oaxW/Zzy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9631F000E9;
	Tue, 14 Jul 2026 05:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784005711;
	bh=8A3TnL2t3AjYhFfmejW/i+BbvPPCudMdU+r75VLvq/Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oaxW/ZzyYOVXF+vZNcJmN3zG+EuHK0iXJeVPog/oybwaVdPHlpumExvSIfrfI6/e0
	 4+hCzMavijAboxkz0LEOb4PZjbjydfWFEAQADgMkrU9oYTP0POXdeL5conuAvfWOUv
	 Gr5N9BBOti7RX3jhsC72VsAEkySrFiLHq2BufASyyvVKowyz8kFiK1ltCOYs6MZq7u
	 0J+y25bo0YvAlq384Jm40MKT/1zm8bX1epksA48VmP62ndihXDLH5J+2o32ADaj9Fa
	 YZWFGHL1+CHc0G8+PjLuxjNDgMGxqvMx8Ef+T5IqbmmVj3a3IQmRc6YwTycS8ka5gX
	 +oG8p256X4LeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/7] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260713-tcsr_qref_0714-v9-2-373670ab15f9@oss.qualcomm.com>
References: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
 <20260713-tcsr_qref_0714-v9-2-373670ab15f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 05:08:30 +0000
Message-Id: <20260714050831.0E9631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Consumer supply properties for Mahua are incorrectly named after=
 the external provider regulators rather than the consumer's internal hardw=
are block.
--

--- Patch [2]: [PATCH v9 2/7] dt-bindings: clock: qcom,glymur-tcsr: Add mah=
ua support ---
commit 6be182ccdfcaa98dff1b1eb3997c0618159a4ce8
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

dt-bindings: clock: qcom,glymur-tcsr: Add mahua support

This commit adds device tree binding support for the qcom,mahua-tcsr
hardware variant. It notes that Mahua features a single QREF block fed
by refgen4, which is in turn supplied by the vdda-refgen3-1p2 and
vdda-refgen3-0p9 regulators.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yam=
l b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> --- a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml

[ ... ]

> @@ -82,6 +83,25 @@ allOf:
>          - vdda-refgen3-1p2-supply
>          - vdda-refgen4-0p9-supply
>          - vdda-refgen4-1p2-supply
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,mahua-tcsr
> +    then:
> +      required:
> +        - vdda-qrefrpt0-0p9-supply
> +        - vdda-qrefrpt1-0p9-supply
> +        - vdda-qrefrpt2-0p9-supply
> +        - vdda-qrefrpt3-0p9-supply
> +        - vdda-qrefrpt4-0p9-supply
> +        - vdda-qrefrpt5-0p9-supply
> +        - vdda-qrefrx1-0p9-supply
> +        - vdda-qrefrx2-0p9-supply
> +        - vdda-qrefrx3-0p9-supply
> +        - vdda-qreftx1-0p9-supply
> +        - vdda-refgen3-0p9-supply
> +        - vdda-refgen3-1p2-supply

[Severity: Medium]
Should these supply properties be named after the consumer's internal
hardware block (refgen4) rather than the external provider regulators?

The commit message notes that Mahua has a single QREF block fed by refgen4
only. Since device tree supply properties are typically named after the
consumer's input pins or blocks rather than the board-level supply rails,
would it be more appropriate to name these vdda-refgen4-0p9-supply and
vdda-refgen4-1p2-supply to keep the ABI independent of the external
regulator names?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-tcsr_qref_=
0714-v9-0-373670ab15f9@oss.qualcomm.com?part=3D2
