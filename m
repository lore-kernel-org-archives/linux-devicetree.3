Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B095B3976A7
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784624232; cv=none; b=oEEQN911CLFiLy+RCF87lgu8Zp/BeDhv+L31UnhWftUmpyzrkPg9lFmYa+IwVjR0PPwQqGR5KvuQSFp+ffX60cVHCT/3f1KdIMaY+OdlMKwDT6jGANic2jjGubI0Sq1cQRjCzWFPgZQqG7MnU/Aiw2FICgrH/7mN/usE4gLeado=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784624232; c=relaxed/simple;
	bh=+qkmkTQNRlPIUkzZP/KyLzVeOaUgF09jbIYWDEKpmSo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MzLuSNal5g6eeSrK2MfpolkDvdblXzCFFi9redBLg91WQ0d8F/drW0j5eMNjiHYizsJvVCElFmWLjhDHsYoEWgaN5T00lIf33/B4H3aomhpR5FHXoFlkSxaPHESobxnTasXhMX/TCwyLMoVVW6LMaIf0kzbp1FA7IjmyxxaRw3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RxGLE/Ij; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RxGLE/Ij"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1391F000E9;
	Tue, 21 Jul 2026 08:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784624231;
	bh=I7Y8gLsHAD27XDgGL+BPNeUYxYJ6K437OMDfWWEcXxA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RxGLE/IjaQqB3KKP/lw0JamICaee1rejpVBJ6yW3Tq8nJnsX/1uxDEuXxm/mImII8
	 uOyj+s2NcD8WqL+RrH0Bm2QA2D4qcO3dGZfZaAeiyNZV9RuehzwPagWI5dhuDmbJEP
	 1Au5Sz8yvMd/6Ve4GsdhhjsyqkE2E2zKVrGSH3cyIVpoc6CRHrAhjKovm6Fwr27puv
	 DT62GZCtXbim6iR34lmZBKxPKgadJoVkoTC1l2Mggdj5xNfdwFvIxyrbRE6u1fkOo+
	 0uQM/b1m/0trL/QKWw/0WzlyCRcHQIqBhLqCLriy5iJatIMCDTclohdpWv7je+YEjs
	 9ouu/uOq9lMtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 power-domains constraints for Glymur and Kaanapali
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721084742.59571-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260721084742.59571-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 08:57:10 +0000
Message-Id: <20260721085711.1B1391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch inconsistently adds `qcom,glymur-adsp-pas` and `qcom,kaan=
apali-adsp-pas` to the `power-domains` conditional blocks while omitting `q=
com,hawi-adsp-pas` and `qcom,sm8750-adsp-pas`, and these explicit additions=
 are entirely redundant.
--

--- Patch [1]: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add power-=
domains constraints for Glymur and Kaanapali ---
commit 1990ca2fa6cf5b0b41c6756a9acb5db216ada304
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
dt-bindings: remoteproc: qcom,sm8550-pas: Add power-domains constraints for=
 Glymur and Kaanapali

This commit explicitly adds the Glymur and Kaanapali ADSP and CDSP variants=
 to
the power-domains conditional blocks in the schema.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas=
.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index 9f30a38152a38..9c1368de3c758 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -200,6 +200,8 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,glymur-adsp-pas
> +              - qcom,kaanapali-adsp-pas
[Severity: Low]
This isn't a bug, but since these SoC variants require the fallback compati=
ble
qcom,sm8550-adsp-pas in their compatible array, doesn't the contains: enum:
condition intrinsically match the fallback string?

Adding explicit matches for qcom,glymur-adsp-pas and qcom,kaanapali-adsp-pas
appears redundant, and leaves out other variants like qcom,hawi-adsp-pas
and qcom,sm8750-adsp-pas. Does this bloat the schema unnecessarily?

>                - qcom,sm8550-adsp-pas
>                - qcom,sm8650-adsp-pas
>                - qcom,x1e80100-adsp-pas

[ ... ]

> @@ -237,6 +239,8 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,glymur-cdsp-pas
> +              - qcom,kaanapali-cdsp-pas
[Severity: Low]
Similarly for the CDSP block, does explicitly listing these variants create
redundancy and inconsistency since the contains: enum: clause already match=
es
the required fallback strings?

>                - qcom,sm8550-cdsp-pas
>                - qcom,sm8650-cdsp-pas
>                - qcom,x1e80100-cdsp-pas

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721084742.5957=
1-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1
