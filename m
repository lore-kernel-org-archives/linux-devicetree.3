Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8D93DA7D9
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432112; cv=none; b=fMdd+Ni0Tj3rw8Zwtg/mANJcF1z8MR/BrKPHd3c3VcJ3My5pdw+2hKlMQAAGd/mgIcT0Y13Lm6J6kgVhCSkUaN7k1dDzsZeMDDkFXrRqCU3xdqpv+3RcwfFBsyUFqNpKE/o3T5s5S+jQbVo8cUM4jYJB/EezLCMx08NT/yZbTv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432112; c=relaxed/simple;
	bh=8mH68+Scu2g390ak659CtQP/MS0wylYm7eYKwzsPxyw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ha/WmPso9zUdHw9v115dlE8ulSWeeShEGMwWd9LBwY9CrMuweyl8T2HR2vZcXtNWFMkP09ljKzYp6UDEXlYt7oLkhq7yBR+6AwZH7ZmXK5ytIxRfIDhR5OjKcPVKwFZS45d17v6AhnSPN/DNhedD7mNeq/GIIOz3LehBBQquzxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDCy3XBX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDCy3XBX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28FE1F000E9;
	Tue,  7 Jul 2026 13:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783432111;
	bh=IvGvzpS/TlSPrBtb0HxYD3WPoCEADyvcfyaSzAQK3Ec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NDCy3XBX6pAY69EA3RMWgfifoG9Uqij0s+XUPEPL41aPHbcFfciFU4fCqQsjXd2qs
	 zV+d0NxW4mcc8mwkJlcbDfG1jeSLe71Xq3dbXqgPLIE+OYiQdW1K8mpguaOyMuhEtp
	 aVoVlz1S7VPFoPGAt78zpKt5+mmjC1NxoDIw7T3I4pGlDqLwgxv4XGwDVijcmNz+6U
	 ECEsZD+kLKlEook+Xwoku1lJf8+hcgMLizNt5db1BHoPssz55G65V/E0E7D6RbfY/W
	 3VtdWc/j3YNueUVwG5lE3mZZmcdtgWs59qupxbw07M1nkM1QwlZWAMsaqGtFt5HUVZ
	 bY+1O8uwgUQog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom-soc: Include Eliza,
 Kaanapali and others in SoC names
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707-dt-bindings-qcom-soc-naming-v2-1-1b7d695be2e1@oss.qualcomm.com>
References: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
 <20260707-dt-bindings-qcom-soc-naming-v2-1-1b7d695be2e1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 13:48:30 +0000
Message-Id: <20260707134830.F28FE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Schema validation regression for legacy SoC component node names
--

--- Patch [1]: [PATCH v2 1/4] dt-bindings: arm: qcom-soc: Include Eliza, Ka=
anapali and others in SoC names ---
commit 345707be3cd74ebefeb7a14bc7aebf31883f9f6b
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: arm: qcom-soc: Include Eliza, Kaanapali and others in SoC names

This commit updates the devicetree schema to allow proper compatible naming
styles with explicitly listed new Qualcomm SoC codenames (Eliza, Kaanapali,
Hawi, Mahua, Maili, Nord, and Shikra).

> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Docume=
ntation/devicetree/bindings/arm/qcom-soc.yaml
> index 27261039d56f6..fecf9dc05b67e 100644
> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> @@ -25,7 +25,7 @@ select:
>      compatible:
>        oneOf:
>          - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd=
[amx]|sm|x1[ep])[0-9]+.*$"
> -        - pattern: "^qcom,.*(glymur|milos).*$"
> +        - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|mil=
os|nord|shikra).*$"
>    required:
>      - compatible
> =20
> @@ -36,7 +36,7 @@ properties:
>        - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm=
|x1[ep])[0-9]+(pro)?-.*$"
>        - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
>        - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
> -      - pattern: "^qcom,(glymur|milos)-.*$"
> +      - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|n=
ord|shikra)-.*$"
> =20
>        # Legacy namings - variations of existing patterns/compatibles are=
 OK,
>        # but do not add completely new entries to these:

[Severity: Medium]
Will this cause a schema validation regression for legacy SoC component
node names?

Since the select.properties.compatible.oneOf block matches any compatible
containing the new codenames, legacy-style nodes like "qcom,scm-eliza" or
"qcom,apss-wdt-shikra" will be pulled into this schema for validation.

Because these new codenames were not also added to the explicitly allowed
legacy naming patterns in properties.compatible.oneOf (such as the
"qcom,scm-" or "qcom,[ak]pss-wdt-" patterns), dtbs_check will reject these
otherwise valid nodes. Should the legacy naming patterns be updated to
include the new codenames as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-dt-binding=
s-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com?part=3D1
