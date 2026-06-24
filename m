Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01B92EEE60
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 09:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782294851; cv=none; b=IFoOwhXeI/Em1rK86pGoeEcZ+HtrjoLr7aSwhwCjU13q9VFrg4vxAR9jCYU2Uf7ZL5IvUkSUL811T4UXjx2JHEV+wglJYPmWIhpC5C53Yf7M4Ld2tO1oA6SivMMnhcnEE5GCYPSNcnFFeef7oS7V8bDn9jKcXqEDzAmCrczCLTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782294851; c=relaxed/simple;
	bh=eVDRxQPKbs97eeEwtjYWEAAlvqe20ApkrnO+SPDU76U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jkY85/AtJ9WVHCk6mZuDn17x6nvMRZXBcw1ZMlwh2bHZpRHBShqDRErZjomJadD0sySn7Gvo0sRbeUfDy4MCjNm8UhVzqO5B0hcziDxREjsjqsN+9Fu/AkWzBIOtpljsBq5w8+8GoeS0vPAa/rrtQlLt8Um3PEg7Pb1z7+yc4no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWjBzUMK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWjBzUMK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BA11F000E9;
	Wed, 24 Jun 2026 09:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782294850;
	bh=Ip7Ev9/32vnF3Df2OoIg2GeKZgjOZ/J+X10MPgZrNH8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XWjBzUMKL9ovr99Heu+elw3jCXHq6Ck3z13V3oL72GfifpR4/T5pk5gMLub2q8bSJ
	 5M7NqZElYkSuyGvUerf6aIecprG/IRLQNF/lF+2n7ozM0FaBwwrCaP2bvnOP9zKkP3
	 JyZSg858SHiD9Xg0ESOcGXkbRgY3onFnoxwpHp+8Hi3ACFnBXz5VMCe6bsbT3FB3Md
	 syGbRbc3V641ccHsWUK+ixyMTNJjx9twON+8yTvKdBoa27ZXj9Io+rfSjCmvRAxLCO
	 as10izJwWGkl8fBnLahTArWSAtyHVBoJgvfEWMfXF5UPP+9tys00/NN3VYCLtE6gGy
	 1h+uVdiASohjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom,coresight-tnoc: allow
 arm,primecell-periphid
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260624-fix-tracenoc-probe-issue-v2-1-786520f62f21@oss.qualcomm.com>
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-1-786520f62f21@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 09:54:09 +0000
Message-Id: <20260624095410.28BA11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Setting `additionalProperties: true` completely disables strict =
schema validation for undefined properties, allowing misspelled or undocume=
nted properties to silently pass.
--

commit 6e8606766f1fd41047be4a5d6a3178b5f3fd67e9
Author: Jie Gan <jie.gan@oss.qualcomm.com>

dt-bindings: arm: qcom,coresight-tnoc: allow arm,primecell-periphid

This commit updates the qcom,coresight-tnoc binding to reference
primecell.yaml. It changes additionalProperties to true to allow
the arm,primecell-periphid property along with other common properties.

> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.ya=
ml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
[ ... ]
> @@ -78,7 +81,7 @@ required:
>    - in-ports
>    - out-ports
> =20
> -additionalProperties: false
> +additionalProperties: true

[Severity: Medium]
Does setting additionalProperties to true completely disable strict schema
validation for this node?=20

It looks like this change will cause misspelled properties to silently pass
during make dt_binding_check. When adding a $ref in an allOf block, should
unevaluatedProperties: false be used instead? That would allow the inherited
primecell.yaml properties to pass while still rejecting any undefined or
typoed properties.

> =20
>  examples:
>    - |

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624-fix-tracen=
oc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com?part=3D1
