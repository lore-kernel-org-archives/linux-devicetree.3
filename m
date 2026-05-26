Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1761A9F96
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 04:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779770658; cv=none; b=o/UcTrMZ2n0LDvRqGkHQ4vNLyfiIh24oTtb+8OwlXbBnm1gcD0h6ifZcj7wPF7oLNy7O9FTeavTzDE3htxbe0nppJq4f9U+ASjbUesXIJr7vRBbWUSmp38VcmzWy4OwT361+PuepeDYvFpBUb8+4MXBEhM2dcigW28LAQxje01A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779770658; c=relaxed/simple;
	bh=Nf0m8VQdZ0JIbQH3/83LrtREbOUThJo4Nf/6KQcxxIc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gd9zaUvd7k8kJ8smKywe/EmQyEL2uW9juDLcZXE7/5QjAihcyleiJKBqsx2EkOSm19er59RV1UdzXeGXY5t2iO5pvgUbrg0kAAL8KglumB2rIxyRtFHcA0UhtJCDRzCKyUhEXeKe7uDNnXXbp2sbUlVyN+XFZQf71U9jYRsvmjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FkkdguEa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FkkdguEa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F7E1F000E9;
	Tue, 26 May 2026 04:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779770657;
	bh=WRX586pGMN6xMcQnRFXa0ZI2Tb7BqINYXm94gHf0ePY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FkkdguEa45jVZxEACDCCAdA9K2sNkrr9OCQgfC3+yqmqADq5+8LcMk7kBTLKfLSWY
	 do6zwDPH/ije55wMJgoFZR06DMb2uNRRZRDNjkvnTwbKGmHTBx8XIzv6Ub0s2w1252
	 4kY+qft39dMkJAQmT1CABdTQ+xcK4Si17oPCoPGS/HhT5nTR9RNnqe16gJWKcZDn4k
	 EKoj00KhG+y3w5OJa41BFfba4L9gX47RBku364OoSrQQl6LTjCaaRrzafewmITr5jp
	 GdVyKuxnEwHCfdDL7BgvxeHCFO3tdP1c37iWL5ZhmnRMiiE+tZAUIbm/J42DAbkz5h
	 isBly3Xz5q3Vw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] dt-bindings: arm: qcom: Document SA8797P Ride
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260526034557.1669007-5-shengchao.guo@oss.qualcomm.com>
References: <20260526034557.1669007-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 04:44:16 +0000
Message-Id: <20260526044417.47F7E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The new compatible block for the SA8797P Ride board is inserted in =
the incorrect section within the schema file, violating the established gro=
uping order.
--

commit 83cce79db9a6915b8b40184fb1c89f108d45ab9f
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

dt-bindings: arm: qcom: Document SA8797P Ride board

This commit documents the Qualcomm SA8797P Ride board, which is an automoti=
ve
development board built on the SA8797P SoC (Nord series). It introduces a
compatible block with fallback strings for the board, SoC, and Nord base.

> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -303,6 +303,12 @@ properties:
>                - xiaomi,sagit
>            - const: qcom,msm8998
> =20
> +      - items:
> +          - enum:
> +              - qcom,sa8797p-ride
> +          - const: qcom,sa8797p
> +          - const: qcom,nord
> +

[Severity: Low]
This isn't a bug, but should this new compatible block be placed in the
Automotive/SA section instead?

The compatible list in this file is generally grouped alphabetically by SoC
family (such as APQ/MSM, IPQ, MDM, SA, SM, X). This insertion places the
SA8797P board immediately after the Mobile/MSM group (qcom,msm8998) and rig=
ht
before the Networking/IPQ group (8dev,jalapeno).=20

Could this be moved further down to sit alongside the other automotive SA
series SoCs, like qcom,sa8155p and qcom,sa8775p, to maintain the existing
file structure?

>        - items:
>            - enum:
>                - 8dev,jalapeno

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526034557.1669=
007-1-shengchao.guo@oss.qualcomm.com?part=3D4
