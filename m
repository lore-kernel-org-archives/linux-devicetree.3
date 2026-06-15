Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C5338D3E3
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 19:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781550158; cv=none; b=rL1FRNDcBmLe3PVxiEhiYDsseQSAo7hGPdOZh3dTRpwi/WdhjHCQcHw43Tol++ksBL0oA4oGGGmUobZfG9guB7SyNscM1DiHfdMnTuamqRP/ZtgzgynpZKDR1q93BXNNAaXlDhVu/iHdCctjOg/l6AEzLWNxLql3mwKnqmg5LYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781550158; c=relaxed/simple;
	bh=9m0van6LUr60zVEd+QnaGzCY8fGv2OtcQzGnCuUf0gw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pn+bJ79fvQPjboWSYexsmJSbR98Rs+nWfRyeY7bZCjPrZQDLr1y32ecGaj/0vLNIkKp307yyXPTnnSrLr4HEusu84Aihtq6kSRu6VE1vZvba2RW/M3AABwxJXm3YBfOfPNsKU2C+ntIT5O8Rq3iaFs/q2RnrJvB5JwqCojGjd6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CKohpoMz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CKohpoMz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ACED1F000E9;
	Mon, 15 Jun 2026 19:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781550157;
	bh=5tUGSeRM5tJn3vtS00caH64Omrgvt6Wk0SXtxlhrNOI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CKohpoMzUl7EKZpZ6euIPNw5+GYwyuHQaeGlLKe1eLFt3EtHojATxNPOWj00Jf93b
	 EbHyQuCw9h1ASyKj3dAjPbvayNmObL+WdQHx6DBvgPT3Sp+2VZoBcxiPS5LsGgkhIz
	 PnxaoMOSqhvx60uz36g5FB+RizhlFWguzmvXnTSTEyXqiWwfDJbNut8Ar4geL5AEuE
	 jDDpOEqEI9n/v9w8J0PLL9+w9G5LZYVIyCWEutHZ17fVlc1TupYy+hzn1kdvGftFsN
	 v5Q/WxFOAPP/vwqWGLIumPNaTFelBjq8Z8SfstgsIR5FEsiHFOCSehMkj8nUGEChx5
	 CD7Mvgz4FMT9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: qcom: gcc-sm8450: Add
 missing power-domains property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-1-6b5752dd4747@linaro.org>
References: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-1-6b5752dd4747@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 19:02:36 +0000
Message-Id: <20260615190237.0ACED1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `#include <dt-bindings/power/qcom,rpmhpd.h>` in the DT bind=
ing example block leads to `make dt_binding_check` syntax error.
--

commit d4a5f7a86b8e17c69572dda7a1449210ed6871bc
Author: Neil Armstrong <neil.armstrong@linaro.org>

dt-bindings: clock: qcom: gcc-sm8450: Add missing power-domains property

This commit adds the missing power-domains property to the SM8450 GCC clock
binding schema. It declares CX as a power domain of the GCC so that votes on
provided GDSCs can be correctly propagated to CX.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml=
 b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
> index 3169ac05e1d8a..7e3713cfd4985 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml

[ ... ]

> @@ -66,6 +71,7 @@ examples:
>        reg =3D <0x00100000 0x001f4200>;
>        clocks =3D <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>;
>        clock-names =3D "bi_tcxo", "sleep_clk";
> +      power-domains =3D <&rpmhpd RPMHPD_CX>;

[Severity: Low]
Does this example need an include for dt-bindings/power/qcom,rpmhpd.h added
to the file so the RPMHPD_CX macro is properly defined?

Without the header, the C preprocessor cannot expand the macro. When the
generated device tree source is passed to dtc during make dt_binding_check,
the unexpanded token will cause a syntax error and break the validation bui=
ld.

>        #clock-cells =3D <1>;
>        #reset-cells =3D <1>;
>        #power-domain-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-topic-sm8x=
50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org?part=3D1
