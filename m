Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD0634F483
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779708404; cv=none; b=I9m8nU7m/ppPJGG1jnQ29Ilk7xigaAGshnjHabYXbqU1eYVgrNp8/w6iSTcehjNahYRv8eQtGHQYCB4TH9ZxVjxMB2xOATHU6KRGSaDX+qLtD3oC3xjJp6Y9Kj7zTB03QEoXuLFc2Yc/rmFrgeF1abFC4sY1ktJLPBnecUUvq2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779708404; c=relaxed/simple;
	bh=UUoRW/Hop2OXGZDRIeAM0s9A16dTI0hTlhnVLX04O3o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=amF7SyZdt7qoVOWP+6ANxRyDDP7hx1PsR5oX1HFlA5QmfMfsxXvzRkHUQhL1N89jPYZ+Ne1gmOKfCJX2wy2yFFqx3Nj97s6vP7bXbVh78Jsi1qYVuCIupFghwCr/tkxTfPhPWiM2YqmSGYnPKvCZY5p6uTQ5xZBErKBG1iZpWkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5qJXvGl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5qJXvGl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26661F000E9;
	Mon, 25 May 2026 11:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779708403;
	bh=o9DI3xxVLHI1AELzhS+zXRR2NLf6jNi17IP6CBraxK4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O5qJXvGliitDgB+kYDCZPVExO0bLjZQ51hP1rremxEUhN6NNcTfCVOnA0gYeWKwWp
	 QNx5inJmxf0YsjZ4zLbl8iO/o1yteDXhwb/MSeQeawArWQeiXlb01Nj6YxyyyufeSp
	 jbx+GH36pRtZD/yQDQuoboGeRlUkf1H5ZdTK0ZelgyUsrXSQ5ELmq/FMDeug8KTjJC
	 5sj+R4OczyoKqCaf8QNsTpHkzQwASrPVQGnkvoGxpjsFrBnVa/KMa0cqHrmcN1Hdxh
	 gin8eHlvTt0oXF76Ksfp+0rz/1nyYGFDXyGWhZCXoRtnBKftBC0L0q6f81eSG52kVF
	 3aCc25NtihdwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/7] dt-bindings: clock: qcom: Add support for CAMCC
 for Eliza
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-3-a1d125619a5a@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-3-a1d125619a5a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 11:26:42 +0000
Message-Id: <20260525112642.F26661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unconditionally requiring `#power-domain-cells` and `#reset-cell=
s` for a clock controller variant that does not provide these capabilities.
--

commit 7c558a65c3468c306300eff35cc0bf8097addb20
Author: Taniya Das <taniya.das@oss.qualcomm.com>

dt-bindings: clock: qcom: Add support for CAMCC for Eliza

This commit adds the compatible strings and headers for the Eliza camera and
camera BIST clock controllers to the Milos camcc binding. It also adds
#power-domain-cells to the required properties.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yam=
l b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
> index f63149ecf3e1b..57c596314ffca 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml

[ ... ]

> @@ -28,6 +35,7 @@ properties:
>  required:
>    - compatible
>    - clocks
> +  - '#power-domain-cells'
> =20
>  allOf:
>    - $ref: qcom,gcc.yaml#

[Severity: Medium]
Should #power-domain-cells be conditionally required instead of being appli=
ed
unconditionally to all compatibles?

Looking at the included qcom,eliza-cambistmclkcc.h header, it does not defi=
ne
any power domains or resets. However, unconditionally adding
#power-domain-cells here, along with the inheritance from qcom,gcc.yaml#
(which requires #reset-cells), forces the qcom,eliza-cambistmclkcc node to
provide these properties.

Could this unconditional requirement force device tree nodes to include dum=
my
properties just to pass schema validation?

Would it be better to restrict these required properties to qcom,milos-camcc
and qcom,eliza-camcc using an if-then conditional block, or split the BIST
MCLK CC into a separate schema?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-eliza_mm_c=
c_v2-v5-0-a1d125619a5a@oss.qualcomm.com?part=3D3
