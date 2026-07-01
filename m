Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523203749E9
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925072; cv=none; b=ZPKEvDENs4oDdm4JYMqT7rak1g5iep80w+wWXhZt8NuZciihZ0Lu98iawZOqa7+RTrN+/5qPVK36e7/pnwB1VQ2MJlxpre3BN+tUQS4xlv1ar7Js3hCEy8zd2+PDf7IMgHPhSI3E9XPCBCqqLuJhECg1EHbEr1g27DAPKjE8cAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925072; c=relaxed/simple;
	bh=Bajf3/ydFl2VeLBtD5Kt0sJOcToQ3VVgb2V5YHJqiMk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kLlUqTz0CQQfi8Fh0lhjh0xoR/8WqyuXZcr3FDcF8PgDOu7LsTN7+XfMkAdsCBqXlBgice9lic4xuR02w2gdgphvCfP1hsqWlk/zQB9bp1Fm3qoBzvz3utsA29mgtAn5XfEmyBvDomu7d7WeRPKcuNDCe7gys6VbOk3VzrZ5O+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OzDJ0GmS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OzDJ0GmS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF511F00A3A;
	Wed,  1 Jul 2026 16:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925071;
	bh=ELp8dT36Ov29Q8f/rGrN7OIbe/5aMF7wky/XmPklAXA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OzDJ0GmSaruoYAn8rGl/jZAmvwy64Z7XsUPoHmu9SAqGNJlkuePjM6NmJPoxLrLgc
	 w5ajePqibD4hM9Cx8HS5Ad11pS9AI2i7Xur28FCqqnHibNFynjA1iqQjcAYu/tUPt7
	 tMJPwJE8X7pe9L31fDIunc4WcHIBKuS39gIm4lsBEiCDrrj4xm4RY3+ycS28tsX831
	 CIEeh+Y73DHhbHTB/BD6A3s1bNA+Iggb9jsYMpXNIzwdNgAJflVOsvLpot9bZiIfCN
	 yo5lJgbQnml88Ep/aQ3MmJY5coVR1bmVuQmDgVFghpgBzqd7STWWUP4lvLl8yBRg0k
	 JbcBZGFhxa9tQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: phy: qcs615-qmp-usb3dp: Add support
 for Shikra SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>
Cc: olteanv@gmail.com, neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org
In-Reply-To: <20260701165051.4122259-3-krishna.kurapati@oss.qualcomm.com>
References: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
 <20260701165051.4122259-3-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 16:57:50 +0000
Message-Id: <20260701165750.9AF511F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The YAML schema fails to enforce the mandatory 3 resets for the =
Shikra SoC, allowing incomplete device tree nodes to pass validation.
--

commit dd87f88551c8d0851ff72a007e5d3d25aa1a3fc0
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

dt-bindings: phy: qcs615-qmp-usb3dp: Add support for Shikra SoC

Declare the USB-C QMP PHY present on the Qualcomm Shikra SoC. Shikra uses
3 resets to be programmed before initialising the phy. Also, add remote
endpoints and orientation switch support for getting Type-C orientation
information.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp=
-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-ph=
y.yaml
> index efb465c71c1b5..ae3f0dda3bca2 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.ya=
ml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.ya=
ml

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,shikra-qmp-usb3-dp-phy
> +    then:
> +      properties:
> +        resets:
> +          maxItems: 3
> +        reset-names:
> +          items:
> +            - const: phy_phy
> +            - const: dp_phy
> +            - const: phy

[Severity: Medium]
Does this schema accurately enforce the 3 mandatory resets for the Shikra S=
oC?

The base schema sets minItems to 2 for both resets and reset-names. Because
this conditional block only specifies maxItems: 3 and lists the items witho=
ut
overriding minItems to 3, the schema will evaluate with minItems: 2 for
Shikra.

Could this allow incomplete device tree nodes missing the required third
reset to silently pass validation during a dt_binding_check run?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701165051.4122=
259-1-krishna.kurapati@oss.qualcomm.com?part=3D2
