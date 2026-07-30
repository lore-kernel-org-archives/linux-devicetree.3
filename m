Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C05E3F9A15
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405190; cv=none; b=DOPgB2k5yJi0NsP0ZgTlVAadMDSrk12HjLkfUujSfbz+dTePyREdHTYeqLZdV/ZtCOnH2t5He8Jki7deYYxsek0bwXVdo5PjjsdmWhoNL2/PnTJyJO/n1RoAl2tpzuQgkjgWJ3hWOXpFVBisbPymu23kCHDVMJt4aVPKGNRKJwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405190; c=relaxed/simple;
	bh=XbGTrmA40a6T5kyyU/HkgOp2oMCxuKbGseIOuZV9q1M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GPvPpiLt+vC2sdbGXbtVP7RlcDdpDD5qkm1NzBNnRLQiV1QZ5GlHThhz95v+AJ4ptWF5XCk/5qFwA+5PFE3SmMwBtaWeZi9PQ4ibztdXhIw4gtQ4F2Hvm4hR6ofslxacpN103sJN+oZkehXaKsrJtwrQwYHafOBpLUjycZDb5rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIzAdCYu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIzAdCYu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D27F1F000E9;
	Thu, 30 Jul 2026 09:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785405188;
	bh=xBQ33JxPx5+g5mmX36W920GU1XVfvl4gkayUcbyQ7uY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IIzAdCYupap8+onZ6iW1c1PIMwA8khr2YVNb+3jDnDX18APWBcxW/5QcQiv8IEFuP
	 mDy1DPU42PTHU0pJECw+GtFYR7G9WkDm5D0K6PMpIaqsAw6LIJinhmjCoObzaGiTy5
	 rof1l8y9DF5yBhc9Rls6Tm6BuuEEhvAjN3qD29RqHHt13uVOGnJs6/fSLyBIaJZvWL
	 KgL1ddOHDmlLJgR3/Lirt/tKL5yfVBNorUr+Ca2dIkCmHQsS5ms4lEJV0XqP2VLhvA
	 aXiA016IIGmu33XrpOG4B0z8ddNBdVJ+rr0pZdtK/S4Eh/8VgBza6g3/NiXpqgAc57
	 ITE+mN+TxgWMg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/3] dt-bindings: soc: qcom: add
 xiaomi,taoyao-pmic-glink compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Zaikin" <zstaseg@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260730093502.689505-2-zstaseg@gmail.com>
References: <20260730093502.689505-1-zstaseg@gmail.com>
 <20260730093502.689505-2-zstaseg@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 09:53:07 +0000
Message-Id: <20260730095308.0D27F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema change enforces an incorrect, truncated fallback chai=
n that skips the intermediate SoC compatible string.
--

--- Patch [1]: [RFC PATCH 1/3] dt-bindings: soc: qcom: add xiaomi,taoyao-pm=
ic-glink compatible ---
commit 52fb33657926ca90fb558df9e2cd09cb2c215e6e
Author: Stanislav Zaikin <zstaseg@gmail.com>

dt-bindings: soc: qcom: add xiaomi,taoyao-pmic-glink compatible

This commit adds the xiaomi,taoyao-pmic-glink compatible string for the
Xiaomi 12 Lite 5G. This allows its battery manager to be matched to a
device-specific variant in qcom_battmgr.

> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.y=
aml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> index 16ad4f5698fc3..8ca057c4e3e61 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> @@ -41,6 +41,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,sm7325-pmic-glink
> +              - xiaomi,taoyao-pmic-glink
>            - const: qcom,qcm6490-pmic-glink
>            - const: qcom,pmic-glink

[Severity: Medium]
Does this schema change enforce an incorrect, truncated fallback chain that
skips the intermediate SoC compatible string?

By grouping the board-specific string (xiaomi,taoyao-pmic-glink) in an enum
alongside the SoC string (qcom,sm7325-pmic-glink), the schema restricts the
compatible list to exactly 3 items. This forces device tree authors to omit
the SoC-level fallback (qcom,sm7325-pmic-glink) in order to pass dtbs_check.

Should this instead be defined with a 4-item list so the board compatible
can properly fall back to the sm7325 SoC compatible before falling back to
the generic qcm6490 and pmic-glink ones?

>        - items:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730093502.6895=
05-1-zstaseg@gmail.com?part=3D1
