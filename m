Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801528;
	b=bneyCOC33E6tFz0l+9Rsdfcbe2XWnSAFVcAuFQYYOJMJmhl4knlKa+wjPWoEG5K2keW6
	 U3q1BYQBF86J6ABaOhtwoUaKgtJEGwiuA696OpfRWgd1AiIjAMs9MWtlKAf5iidyekeON
	 4JfoU/UZ4sOXlQYiLKNffy/AChQZk29MraYwcUK36UfuY7/e4BeZLHtUIBv2BKFO29PgB
	 TnPsyoDRNRGa+swC7dKn0RJ48ymENn7ImDAF4Eaqj3+zMVI8QT8XxN0bYYAR5Lm7uGxVk
	 gKzYdtt4+bzD4whkny1SkV0mUf8ffCk2gpuvUIbpVNomU+4Fjwn7sQ8GzUFnmnpBSpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801528;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qor9fvg14yWy1T970UWcjAUNihLz1l2CM/+lZGc0SBc=;
	b=2dV+COSz8B0wQILISo8vMLhgZD1qi1xLpS/qEvbCqj8o6BSXoeDY/MhZE5cAxyDuVOwP
	 FP+BcRpTcGBiwH80axZtnB7Xi1Fftln2Dcdgksea4VpjUCA3I/vSJ8SGu3KwaP9Wts2Zc
	 6BtyFW3/wuOICMM1+rDKFvux0ldJfZJPrfhwIeQ69HZlMHHyJ3AcqDgZ3vF50PHIFpigE
	 aI1+N8OonarYYaL5A2QFkTps/tj3tokUgjsYpQwk8hjm96W3yqF4DlGkCkfeMS+Aeoq/F
	 mkwpDUrRzPgQAAg/VpId+zDb0lhJy7eHDuET8BVCGPlj0De2oKDs6cE3BQ8B6WP8D3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZApF/dVh";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AE4606D806
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZApF/dVh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF261F000C1;
	Wed,  4 Nov 2026 14:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801528;
	bh=qor9fvg14yWy1T970UWcjAUNihLz1l2CM/+lZGc0SBc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZApF/dVhR5+IST65x3pQcfyJs0HAafvfZGey4zt6QOl49R8dkSTINsKr3cbCh5Wwv
	 OnQOx/xg8WofZ+qut7FYU+PMwZ01TCvbQcUknDE7FWh3BMcCxGILqrd2Iv7DuscmqD
	 S65IN9XZkS3e6cIINSsT9M8B3Y4lhMg4oWOgUy2rIjRZhWMS4RzKkMbYq6hNffehp4
	 dGYj97IxE9Hopcl6GGXJ732LtHYvY9R+AKrTOikOSrNYj6cDqpHFEoqql9jHF6/ffL
	 Je8yB2Nb8vieL2iPesM/2rdoi1VJDzFSEAM7+gm0weXdsRCsAmSib/34hY9EtRQprk
	 fqM2NUXcl8c1Q==
Message-ID: <sashiko-outbox-197408@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-shikra-el2-v4-2-97e7019debff@oss.qualcomm.com>
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
 <20261104-shikra-el2-v4-2-97e7019debff@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 14:12:07 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: remoteproc: shikra-pas: iommus applied to mpss-pas =
in allOf
--

commit 53aa8f92faa854bf45005817e5eaa528a79c90a8
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints

This commit adds iommus property constraints to the Shikra PAS remoteproc
binding schema for booting at EL2 without a hypervisor.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas=
.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> index 34a2f15e93616..8c8a7616d4787 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> @@ -112,6 +112,8 @@ allOf:
>            maxItems: 1
>          firmware-name:
>            maxItems: 1
> +        iommus:
> +          maxItems: 1
>          power-domains:
>            items:
>              - description: CX power domain
> @@ -134,6 +136,9 @@ allOf:
>            minItems: 2
>          firmware-name:
>            minItems: 2
> +        iommus:
> +          minItems: 3
> +          maxItems: 3

[Severity: Medium]
The commit message states that iommus constraints are added for
qcom,shikra-cdsp-pas and qcom,shikra-lpaicp-pas. However, in the allOf
section of Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yam=
l,
the first conditional block matches both qcom,shikra-cdsp-pas and
qcom,shikra-mpss-pas:

  - if:
      properties:
        compatible:
          enum:
            - qcom,shikra-cdsp-pas
            - qcom,shikra-mpss-pas
    then:
      properties:
        ...
        iommus:
          maxItems: 1

Does placing iommus in this shared conditional block unintentionally allow
iommus on qcom,shikra-mpss-pas?

Also, since commit 95697c560209 ("dt-bindings: remoteproc: qcom,pas-common:
Drop iommus") removed iommus from qcom,pas-common.yaml, iommus is no longer
declared in top-level properties. Should iommus be defined with its broadest
constraints (minItems: 1, maxItems: 3) in the top-level properties block and
then constrained per compatible in allOf (with maxItems: 1 for
qcom,shikra-cdsp-pas, minItems: 3 for qcom,shikra-lpaicp-pas, and
iommus: false for qcom,shikra-mpss-pas)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-shikra-el2=
-v4-0-97e7019debff@oss.qualcomm.com?part=3D2
