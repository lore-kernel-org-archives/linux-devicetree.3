Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AA134C134
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 07:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064313; cv=none; b=Hm5tFoyzm2YK9UO5w4ekjDxCqvBXiTcDZukOFbY6otesHzH5XMFKvr2nR3Iwy0Ip83HN86YrbmbrGsAtOVq9+yJNx+21DUhiPQ+7IXdeeHPp50DEp7V81IiXiRCy8cxWVyL/c7ZTgusd3AbCYOgaO17OuApxk2YDUZgQw522HJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064313; c=relaxed/simple;
	bh=ycJnmp8n0RdIwtiSDtjwcGlBwPDTvJHiGqdHT2+tlkE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iOD+whSxIMRApoUk3A6D1EXt+fr9GTjyRj2/DYyZWYHjNh5Y29h4uJxGMaYV9dKS7bRAm9whMBEo+FR7ePVcN3e51dmT5b6VPgdNInFZE6I3jkCgSMbi4QXLwx2Y+CJQIqBktQ439d0Kk9Ad9DC9VFJqRB1hjkq9ORI6bCGdj7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxDxtc5X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxDxtc5X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F0FC1F000E9;
	Fri,  3 Jul 2026 07:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783064312;
	bh=46rFckXo4ugi/CQmQl76/+Ga4vpAZgsxFH6Ma8VnwSg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PxDxtc5XGO0txc8FNp7vic5smAnNwrcb7iunpBcveiRgEV+OJT5M168kFcmTVL5n/
	 jRtaItIK2UgSKEzWYWxdn6b6oYGrV+U+FL5JIM0fh88hZdp78nAMqoE7X4cfh5BuKb
	 52zQ3ypeWtrr5sNVNKOh8ctZ0kAJkA7pOZO/T+xlY2R04h5nW9bAosIhFPiGxRkSxu
	 JPa430v2GFln1U5tkl6B1Y3Ay9EaIWB98PK3BW19iRzLWjMRvK2OruU99Q1OtRmqOD
	 Wvo4j1oJUKggQpuA4oAylCOQsx7EzhlDxA5MH4XLI/GHoBVXuw++AFKr2WuS7F+vWG
	 BTHXntqD8V5iQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl:
 qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ravi Hothi" <ravi.hothi@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260703073029.2588960-2-ravi.hothi@oss.qualcomm.com>
References: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
 <20260703073029.2588960-2-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 07:38:31 +0000
Message-Id: <20260703073832.2F0FC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch unintentionally deletes the `items` array from the `reg` =
property, resulting in the loss of descriptions for the register regions.
--

commit 6846a6f9be06779519b955a26fe5e15eef153d4f
Author: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl

Document compatible for Qualcomm Eliza SoC LPASS LPI pin controller.
Eliza only has a single reg entry instead of two, so the bindings are
updated to reflect the different register layouts.

> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-l=
pi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpas=
s-lpi-pinctrl.yaml
> index 73e84f1885911..5cb9addb975fa 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinc=
trl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinc=
trl.yaml
> @@ -15,12 +15,13 @@ description:
> =20
>  properties:
>    compatible:
> -    const: qcom,milos-lpass-lpi-pinctrl
> +    oneOf:
> +      - const: qcom,milos-lpass-lpi-pinctrl
> +      - const: qcom,eliza-lpass-lpi-pinctrl
> =20
>    reg:
> -    items:
> -      - description: LPASS LPI TLMM Control and Status registers
> -      - description: LPASS LPI MCC registers
> +    minItems: 1
> +    maxItems: 2

[Severity: Low]
Does this unintentionally remove the descriptions for the register regions?

By deleting the items array under the reg property, the semantic descriptio=
ns=20
that document the purpose of each register region are lost.=20

Would it be better to keep the items list intact and add minItems: 1 alongs=
ide
it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703073029.2588=
960-1-ravi.hothi@oss.qualcomm.com?part=3D1
