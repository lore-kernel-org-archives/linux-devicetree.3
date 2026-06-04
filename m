Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6123CEB9D
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 12:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576977; cv=none; b=rRFRUHiKV2/N6J7Mc5oXzpmrlxjDzOtnVfE9h6Z9jVxjMNQo23b0cYpghVRC5b6H8Vd8wfDzaHKB3xuiWjzf/ULOcN4cF+5o+1ffLQERzNa68sdGbK0ACEu2e1i4iQPIhSRj3Xdnw5fHDphp9QGwAKULr8vZs+cu7/XNhtPpjlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576977; c=relaxed/simple;
	bh=VUDpeABM3/XVnIzPB4/sBPTW29yc5oBXa/zrVpJPebY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JIqX8+jhJNsuqEAYu0jaZ1Hrz8vZwJIClaF5yBH7HFnZvt4kbxqRffogWeVGCkXfgAp+5xiq1VN871f98hvgDjqDuHNo9aNJFpPmzG9yG6YLKpmLoxxUnooUESwrOgJxMjbLaO5VYcNJe7UCUp+Ynj5c9F4IDzLAVKr4TPaC6zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAOrChVy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAOrChVy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F8C1F00893;
	Thu,  4 Jun 2026 12:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780576976;
	bh=jD8qpfRVjwx0jAz7MGdrBNzskXrvc6kAcSzecnuB80U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nAOrChVyqMmG9A/O5Omi6+0F3K9Ifze4JGUYtspTFtnFIvPPyQVCFmqZEg4YXUiTh
	 uqA03c5uCtUWAqKXxMq9FfmUkqiT4qvd60AvUp111y/aAg3aydH0uiYRFaASD9S92m
	 oq6pd/N2skjjsBmzebkvl+VYLRSbFapF8hyRen1bI0cuELfTcNg7yWHrTj335Anlr6
	 eRNz8EaT/x84OOmo3VY0JsJN1HF8hpTDjx+F8MPGw+ZMhkng7Ix2FkqogTMxjUCXgs
	 0eJA/NnZKWJQzhToSGaI9blYDhVm/F/dgL23w9qx2JkGAhflxoAP9E1vH5DOIiCkYr
	 CHVWejSQghSPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: qcm2290: Add Shikra
 MDSS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260604-shikra-display-v2-1-b3c1b2b67edc@oss.qualcomm.com>
References: <20260604-shikra-display-v2-1-b3c1b2b67edc@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 12:42:55 +0000
Message-Id: <20260604124255.C5F8C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Unresolvable DT schema contradiction for Shikra DSI compatible s=
trings.
- [Medium] Missing schema conditional constraints for Shikra DSI controller.
--

commit a65ad60044f8d36574550891df31ee37428077f9
Author: Nabige Aala <nabige.aala@oss.qualcomm.com>

dt-bindings: display: msm: qcm2290: Add Shikra MDSS

Shikra SoC uses the same MDSS/DPU/DSI hardware as QCM2290 (DPU 6.5),
sharing the same register layout, DSI controller and 14nm DSI PHY.
Add qcom,shikra-mdss to the qcm2290-mdss binding compatible enum
rather than introducing a separate binding file.

> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-m=
ain.yaml
> index dbc0613e427ed..a2f3e91104af3 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.y=
aml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.y=
aml
> @@ -33,6 +33,7 @@ properties:
>                - qcom,sdm660-dsi-ctrl
>                - qcom,sdm670-dsi-ctrl
>                - qcom,sdm845-dsi-ctrl
> +              - qcom,shikra-dsi-ctrl

[Severity: Medium]
Should qcom,shikra-dsi-ctrl also be added to the allOf:if conditional
block that enforces clock constraints?

The QCM2290 and Shikra DSI controllers require 6 clocks and
assigned-clocks. While qcom,qcm2290-dsi-ctrl was already missing from
the clock validation block, omitting the newly added qcom,shikra-dsi-ctrl
allows incomplete device tree nodes for Shikra to silently pass validation
without providing the mandatory clocks.

>                - qcom,sm6115-dsi-ctrl
>                - qcom,sm6125-dsi-ctrl

[ ... ]

> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-m=
dss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.=
yaml
> index bb09ecd1a5b4f..7184b09a87749 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml

[ ... ]

> @@ -60,9 +79,14 @@ patternProperties:
> =20
>      properties:
>        compatible:
> -        items:
> -          - const: qcom,qcm2290-dsi-ctrl
> -          - const: qcom,mdss-dsi-ctrl
> +        oneOf:
> +          - items:
> +              - const: qcom,qcm2290-dsi-ctrl
> +              - const: qcom,mdss-dsi-ctrl
> +          - items:
> +              - const: qcom,shikra-dsi-ctrl
> +              - const: qcom,qcm2290-dsi-ctrl
> +              - const: qcom,mdss-dsi-ctrl

[Severity: Medium]
Does this create an unresolvable contradiction for Shikra device tree nodes
during schema validation?

These changes to qcom,qcm2290-mdss.yaml enforce a 3-item compatible string
array for Shikra. However, the earlier change adding qcom,shikra-dsi-ctrl to
dsi-controller-main.yaml places it in an enum block that strictly enforces
a 2-item array.

Could this mismatch prevent valid Shikra nodes from passing validation,
since any configuration valid for one schema will be rejected by the other?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-shikra-dis=
play-v2-0-b3c1b2b67edc@oss.qualcomm.com?part=3D1
