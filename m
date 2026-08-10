Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3C537CD5A
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362882; cv=none; b=ta44RJe/jTR5eJCIPT6X72pP/cxGVXF11zNJWS329xVS5NY5XnQ0RH2EiXV7tfZIX4npu5JDy43k5zvmtBRK5XYB4c2ixHZYXCnXpYdj0bjESdv0MgpAJr5+MaxXmxdXMHq3M4QOpfhkuNGYFpzkhgfVEVBpez4VZVy+ofVw6no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362882; c=relaxed/simple;
	bh=rCJpyqU/BYUlYhJ7lcjzGnZ/vAQfe6AyLmLq2goNqWU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k/qZSXE6tzphPd0CGGoHl79BL/OMWl3mzqnuNXnwt2LdEwCvap7iRfQOjjPgFK/jSL7JSB1fE5BeyzUTM7I46pp+WQxMDR+sv7UWYW4Wgv6xexNI23Kks8hxHUbTltA9wjUJOSfOYxxEpHdGq5mVmCKWpI1PKc+ezSvrDyxQkVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HM1px1RJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HM1px1RJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4171F1F000E9;
	Mon, 10 Aug 2026 11:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786362880;
	bh=cHbZvRTjryn/fP7GhyJVcTH2NL3cBlPasG6rVMDicgM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HM1px1RJ4HICGPFyJtGDzJ/oBixBgNxe3LVuFw9HH+gFhPCPJRvFMEvkQyJIbrJI3
	 CCbtdME8ORGJZxAhn4Wqh3mOmnHJhBEAIHbIIxy1CvRQGM9BBNH5i+zBGP4Q/h0PzI
	 alDxW7jYaI2PE6SmrdVI57olApXrzL6KRT76IhrhpTpkhXVdIaNkCFZGI+wEEnR/em
	 iLtQm+0l6YmQPU8LQvYLJyBhchv1oLFYnYKX8R+sC8+Qr5ZQ16hOUpWRbuKr1iM6Rz
	 6fmsUhChWCKSjJLXSMBGFvZZyBj83aOfDFT/1R9v1zDFIcOOvKFnEww/rEFyg8Kw5H
	 5+jQOfJlreuZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/10] dt-bindings: phy: qcom,ipq806x-usb-phy-ss: add
 MSM8974 SS PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: olteanv@gmail.com, conor+dt@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, vkoul@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260810-msm8974-usb3-v1-3-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-3-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 11:54:39 +0000
Message-Id: <20260810115440.4171F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The schema unconditionally applies IPQ806x hardware defaults to the=
 newly introduced MSM8974 variant, contradicting the commit message claim t=
hat the parameters differ.
--

--- Patch [3]: [PATCH 03/10] dt-bindings: phy: qcom,ipq806x-usb-phy-ss: add=
 MSM8974 SS PHY ---
commit c3a8fb6b674551444c17885768e8da57eb5bdf84
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

dt-bindings: phy: qcom,ipq806x-usb-phy-ss: add MSM8974 SS PHY

This commit adds the msm8974 compatible string to the ipq806x dwc3
superspeed phy device tree binding. It notes that while the hardware layout
is identical, the parameters differ from those specified for ipq806x.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-s=
s.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
> index 6cf5c6c06072c..29cb43cf73481 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
> @@ -16,7 +16,9 @@ description:
> =20
>  properties:
>    compatible:
> -    const: qcom,ipq806x-usb-phy-ss
> +    oneOf:
> +      - const: qcom,ipq806x-usb-phy-ss
> +      - const: qcom,msm8974-usb-phy-ss

[Severity: Low]
The commit message states that the hardware-specific parameters differ from
those specified for ipq806x. However, will dt-schema validation now
incorrectly interpret omitted optional properties on msm8974 nodes as having
the ipq806x defaults?

For example, the schema currently defines global defaults:

  qcom,rx-eq:
    $ref: /schemas/types.yaml#/definitions/uint32
    description: Override value for rx_eq.
    default: 4

Should there be a conditional block to ensure these defaults are scoped
strictly to the qcom,ipq806x-usb-phy-ss compatible, or should the differing
msm8974 defaults be explicitly specified?

> =20
>    "#phy-cells":
>      const: 0

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-msm8974-us=
b3-v1-0-1a47e1185524@oss.qualcomm.com?part=3D3
