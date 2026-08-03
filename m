Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2542BEFEF
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 04:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785731047; cv=none; b=K8u8rie+4ce2Hu53teM66Ws/GLtSpgoJEX7YfJKeksbzv2bcz5C3mjXywx8WYT4Ux5Yc82cAPgiN0j/dOXifrw42kMKKvuhb3LH/LTUOm+WMZ+Hl6g5DT71DgeybIaCmZ1thUa2ju7YynCxpaCaxQnos/k83eOFnBXgrJ8+j8VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785731047; c=relaxed/simple;
	bh=3X3KBaqne6C3rRHANNqhJicBtqF+LJFeKJP2hHnNlws=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sBlzwNxj+WPLYvabrYgcvOAmdf5rxG2BIyiw4yYKTo3Ep9Zjz++oxcYlaypfqKDNq4Y/Cld5VHsRY9r2pXJgCOozurXTLmFFA08v8GVaD1Bqt36mI2xh+TYDwENX5yTRSFdnXBXJELrHenkF+XJ/NTuragkG3ySM99znO65t0pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cv4tktj6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cv4tktj6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8566E1F000E9;
	Mon,  3 Aug 2026 04:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785731045;
	bh=FyWfX4nwA0S6cHItt1NysYCNLyw2jIcTplxA2Y3rf7E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cv4tktj6XQ2rZJFJUK7FFoK27kD6h+EekkNv/Hey+cu5AdZY6r4nYtQ29o+RKdOUj
	 L947S0YWPkOX68E33kZBU+6Hq1BtVEnBdwH8QHQkn9trepLSdEQmGuCm/q3MAlUwG8
	 yz2m3andZLKKm+xIAyyW70XFCX98uGORFi7/muijEZFXJiFSQR40JQA1EHbOeh1EdY
	 RP+xINOMIP6IpY1UxMMMm1AGkZGWYXqbKEXdEcZIh0boPud+FZnOAkoeYTchMG0rme
	 u5vr25id4EQBuro7g04uyMeyEmxlfIz8V2s00gQoufdrJUey6fnEfCd2kf4zDRjvKv
	 GbYO3dQS3lcOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding
 for non-MP controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-glymur-usb-binding-fixes-v1-1-9ce334777387@oss.qualcomm.com>
References: <20260803-glymur-usb-binding-fixes-v1-1-9ce334777387@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 04:24:05 +0000
Message-Id: <20260803042405.8566E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Moving `qcom,glymur-dwc3` to a different conditional block enfor=
ces a strict interrupt order that breaks schema validation for existing dev=
ice tree nodes.
--

--- Patch [1]: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding=
 for non-MP controllers ---
commit 8b1e476813d3e646db74155c4e3c7dfd5ec0b74b
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding for non-MP controllers

Glymur DRD capable controllers have HS Phy interrupt. Fix the binding to
indicate the same.

> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/=
Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> index d410aeaf92fb6..100a287ea46c9 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> @@ -524,7 +524,6 @@ allOf:
>          compatible:
>            contains:
>              enum:
> -              - qcom,glymur-dwc3
>                - qcom,milos-dwc3
>                - qcom,x1e80100-dwc3
>      then:
> @@ -547,6 +546,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,eliza-dwc3
> +              - qcom,glymur-dwc3

[Severity: Medium]
Will this break dtbs_check for existing in-tree device trees?

Moving qcom,glymur-dwc3 to this block enforces a strict interrupt array
structure where "hs_phy_irq" is required at index 2 (the 3rd item). However,
looking at existing nodes like usb_0 in arch/arm64/boot/dts/qcom/glymur.dts=
i:

			interrupt-names =3D "dwc_usb3",
					  "pwr_event",
					  "dp_hs_phy_irq",
					  "dm_hs_phy_irq",
					  "ss_phy_irq";

This node provides "dp_hs_phy_irq" at index 2 instead.

Additionally, the usb_hs node provides "hs_phy_irq" at the wrong index (4
instead of 2):

			interrupt-names =3D "dwc_usb3",
					  "pwr_event",
					  "dp_hs_phy_irq",
					  "dm_hs_phy_irq",
					  "hs_phy_irq";

Could we use a oneOf construction or similar to remain backward compatible =
and
avoid validation regressions for existing nodes?

>                - qcom,ipq4019-dwc3
>                - qcom,ipq8064-dwc3
>                - qcom,kaanapali-dwc3

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-glymur-usb=
-binding-fixes-v1-1-9ce334777387@oss.qualcomm.com?part=3D1
