Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC74522F0C
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115673; cv=none; b=tZShr2m56MG1XhuhBLtaO7ZBpzjdhQAYxQPNhIUwKxNUy/Wz1GfxRlyDtR9og2w1dc7Vn+u/qW1oVHtVCK1BW8zbaeRzdSVQk9B4oitpw6Dy5SZ+GrKo5hhSV/xQdmy6NffAkO059lmidE70CcswSeVRo9NcL5EDmMicutOgvtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115673; c=relaxed/simple;
	bh=OxHA0T/Lv11t3CfdwzPbdv9LmAwRAavxt1Nv0liKZWA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rRc7GAi78iK+covtlp00MxRinwSrx3L/rN4T1N2tz8u+mDvrZ2LnBcxzd1G1bzd2+fMl15qZ2tILtdwinxGcQ3FuItD7fnDEeqG9fQceO88kaFgXJ5rv/4CpdSaNO0ElXJK/xtLhKkDf99eic4nEWdrtB1jEGk9fd62EYjn9HIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2F1aDMD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2F1aDMD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617651F000FF;
	Tue, 22 Sep 2026 22:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790115663;
	bh=7j3+SSVd3R1oZySU0UdNGirRZsblqDTXLdMLI137s8s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U2F1aDMDhReJobYW2DUYEhlGly1ubr1NN7Y3QPtlVIdWwNq75sFwoqVkPqbGxOtRz
	 bejXJBCFosxyHAxSWjSrjv8ETBhGtchs+rJIpy8KhAoTr03Xew47Jrr9A6RicFOEQ/
	 xJBfAe2s8HZivpjBHNo2P2Fynw5wuw0VkvvXVD2+3rMIBnKLHBpFIKlpyI7TwlCTCE
	 IDdFZvXc7lQvAC+EMd60Scu1dktC/iCnW4GyynRDVF7j8c3+O+avRyFsaLBCAkkqoR
	 sZFBiytm+0pCLNwf+xWEzFNll6OROuWNFo+yumJzcsB39hpCkDyGUcAjD2bPLQaM+p
	 d23gEL6i4Eq3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: mfd: qcom,spmi-pmic: add
 compatibles for pm4124-codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <566b4bc1822bc86a5844cbe1b2fe91d05b5ee9e4.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <566b4bc1822bc86a5844cbe1b2fe91d05b5ee9e4.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 22:21:02 +0000
Message-Id: <20260922222103.617651F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: mfd: qcom,spmi-pmic: schema validation regression f=
or wcd codecs
- [Low] dt-bindings: mfd: qcom,spmi-pmic: typo in commit title (pm4124 vs p=
m4125)
--

commit aa39b4a36b271ce733e772eaf378517309e2b1c7
Author: Alexey Klimov <alexey.klimov@linaro.org>

dt-bindings: mfd: qcom,spmi-pmic: add compatibles for pm4124-codec

This commit adds the missing qcom,pm4125-codec compatible string to the
audio-codec node pattern properties in the mfd qcom,spmi-pmic schema to
support the audio codec on the Qualcomm Agatti SoC.

> dt-bindings: mfd: qcom,spmi-pmic: add compatibles for pm4124-codec

This isn't a bug, but there is a typo in the commit subject. The title refe=
rs
to pm4124-codec, while the commit body and the actual compatible string add=
ed
in the patch use qcom,pm4125-codec.

> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/=
Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> index f6534e9e9912e..d750da31ae3f5 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> @@ -148,7 +148,15 @@ patternProperties:
> =20
>    "^audio-codec@[0-9a-f]+$":
>      type: object
> -    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
> +    properties:
> +      compatible:
> +        contains:
> +          enum:
> +            - qcom,pm4125-codec
> +            - qcom,pm8916-wcd-analog-codec

[Severity: Medium]
Does replacing the $ref with a restricted enum block incorrectly limit the
allowed compatible strings? Devices using standalone compatibles like
qcom,pm8950-wcd-analog-codec or qcom,pm8953-wcd-analog-codec, which were
legally permitted by the child schema, will now fail validation against
qcom,spmi-pmic.yaml when running make dtbs_check.

> +
> +    required:
> +      - compatible

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790114902.gi=
t.srinivas.kandagatla@oss.qualcomm.com?part=3D2
