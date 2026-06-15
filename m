Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FEE40BCB4
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781543022; cv=none; b=qDjzEmTsXxCsFwRovPvKm6WZSfoJ4f5a5N779zWSkCMYOCg7fPltXLO2X2zp6Ot3YwLvyK93n+UY8p+FhpKvToNyJqpWX60gF0mT1tPPkeTLS9vdHTJS1pGwdvaY43VcKI4kxJ46V05pu1f10VC6WYYticSSCovkSxUzhFyKfbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781543022; c=relaxed/simple;
	bh=LRrxQ3jyskwe6wyuNbh7qsTS+wJSNMit9t+AcxXo0Kc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hvdQWFJzXLM1lD9jLOnispQbjIvqr8nBFDUd16mWXbzBKEojulfTETATlmHpFwG+Vw8MHkoUTWZQJC8p2JA8x8o36T96q00Zr/GmljkRne0oGf0clJMdJbXM3pLoTqc3BlVU86kk2CWxYLcL64d6PXNNelKmUiAPpttejzhCY94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXBCWTMO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXBCWTMO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C7B1F000E9;
	Mon, 15 Jun 2026 17:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781543021;
	bh=ZxPaPunlc0F8dGJ/Fo3QQ7+C5pwYdodLRWLXSkI7CXU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jXBCWTMOnQh/1LZ0A+Ezs6pybCZmLUEe8g3SAamWkubZx0L64voied8FGnnOEO1PX
	 mlXayfXIf+05S11I30wmb76kgz6GfO+Ehjage2axXWrqFX5jIO4NYs4QyCyr9cGzBv
	 cAqXxCXBvKWuagKW11xgLj01WxsmYCwkaLQDemL+xP/0QAwgU8wtpKR1oY1rPq5SXL
	 S3tFLiW497u87a8xZMxpQ5o28skB8WmKbVtxjD2RUOhf4VNkUyxY46kqvU8B4LZrhS
	 /chdLj60txFH2UQQD8+ZQ/Zp6yZx/hMj/GwxDj7NPNowsy3JsNZxCgSvhjSN/TTJjg
	 ocr1X6PjmX36Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: clock: qcom: sm8550-gcc: Add
 missing power-domains property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-2-6b5752dd4747@linaro.org>
References: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-2-6b5752dd4747@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 17:03:40 +0000
Message-Id: <20260615170341.39C7B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The devicetree binding example fails to compile because it uses the=
 macro `RPMHPD_CX` without including its defining header.
--

commit 8ab50c22b4edbee1a4ec4ab581c1e5e14181a614
Author: Neil Armstrong <neil.armstrong@linaro.org>

dt-bindings: clock: qcom: sm8550-gcc: Add missing power-domains property

This commit adds the missing power-domains property to the SM8550 GCC clocks
binding so that GCC votes on provided GDSCs can be propagated to the CX dom=
ain.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml=
 b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
[ ... ]
> @@ -55,6 +60,7 @@ examples:
>                 <&ufs_mem_phy 1>,
>                 <&ufs_mem_phy 2>,
>                 <&usb_1_qmpphy>;
> +      power-domains =3D <&rpmhpd RPMHPD_CX>;

[Severity: Low]
Does this example fail dt_binding_check because the RPMHPD_CX macro is used
without including <dt-bindings/power/qcom,rpmhpd.h>?

Without the header inclusion, the C preprocessor will not expand the macro,
which usually results in dtc throwing a syntax error when parsing the raw
string during schema validation.

>        #clock-cells =3D <1>;
>        #reset-cells =3D <1>;
>        #power-domain-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-topic-sm8x=
50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org?part=3D2
