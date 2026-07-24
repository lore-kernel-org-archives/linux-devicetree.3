Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2E93B19AB
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784890095; cv=none; b=sPkZeULN9bcvudE+h0tOCVGglpwgBL9b+NUOiQYhjavgI29mDvAsOqR+rODtuNH+KQOIHdIHa5WQEUpoNVvxXXwJVODRJDRHyXCrR1/1AlOElhQIzHJn9SNRTRqb0J+IRFiadRJn4IBqQgObxlnS4hBYWlqvg53dws6iQhUcLWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784890095; c=relaxed/simple;
	bh=JWm2L9KRJpmlqD2F0n+rKRtD8QbbmT+1gn2V5rtDe3E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bTWhEzuHPSG/uD/kcRiL+RfdHvcLt0L6rMPFGOKJ1U19X31x3rXc7kus+gEPgm5126ZYb/EYwUWSwl6t/KXQc/hjv2NoD0ZrEYccaEgCficXHIJObWkb4RrII7ToJDvMJrK7IDqJ8TpIf1XbWW2OdIPFB/vFokLIB1K0mElNWqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gz2zlgvN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gz2zlgvN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BBF1F000E9;
	Fri, 24 Jul 2026 10:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784890094;
	bh=cUC1LyP7VZZiuwp8XZC94pZemUamjDdYTzhWEjqOjI0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gz2zlgvNJWWKnpPENLAeBMpkya48h2SrIJE0sjJpOa37Xnc8sF7NtUM+KMFQ++HgL
	 1Hhx+1QMEPBFj+HMm4FiYuzdz2duM96gIEO+K/AhthYMjraInh1VlDgpgatFBLsevP
	 1uauZmlhJSnQIY4FN2nVdc6erNoACq0fJ6KQdPuOxLLwQc8iPSqxFxkeDkv/m/N3Gu
	 s6zDefhbcDne9LyzVeTtsDVZvvoXcptwl4qvdTwvNNzpmHPzRCvtYRSvXWDkucUQqB
	 zaHdxd3AWKiNU1D9XQEJc1vdnFgbJ5mct05euf5AnV0jl+yLZfAx3V5vLufmm6OTmd
	 fxnHToTaOBXgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,nord-pas: Document
 Nord PAS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724103848.233804-3-shengchao.guo@oss.qualcomm.com>
References: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
 <20260724103848.233804-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:48:13 +0000
Message-Id: <20260724104813.E0BBF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The schema fails to enforce the 3 power domains (CX, MX, NSP) re=
quired for CDSP variants.
- [Low] The `#define IPCC_MPROC_ADSP0` macro in the example lacks a value, =
resulting in malformed cell arrays after C preprocessing.
--

--- Patch [2]: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,nord-pas: Docum=
ent Nord PAS ---
commit de7d4d143ab4797af6353c2a43b42cf33e30c7ad
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

dt-bindings: remoteproc: qcom,nord-pas: Document Nord PAS

Add a dedicated binding for the Qualcomm Nord SoC PAS devices: ADSP
and CDSPs. Nord ADSP uses CX and MX power domains while the CDSPs
add an NSP domain on top of that.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.y=
aml b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
> new file mode 100644
> index 0000000000000..c1d60ca6c63cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
> @@ -0,0 +1,167 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,nord-pas.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - qcom,nord-adsp-pas
> +      - qcom,nord-cdsp0-pas
> +      - qcom,nord-cdsp1-pas
> +      - qcom,nord-cdsp2-pas
> +      - qcom,nord-cdsp3-pas
> +
> +  power-domains:
> +    minItems: 2
> +    items:
> +      - description: CX power domain
> +      - description: MX power domain
> +      - description: NSP power domain

[ ... ]

> +allOf:
> +  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,nord-adsp-pas
> +    then:
> +      properties:
> +        power-domains:
> +          maxItems: 2
> +        power-domain-names:
> +          maxItems: 2

[Severity: Medium]
Since the global power-domains property defines minItems: 2, doesn't this
allow CDSP variants to incorrectly pass schema validation if they omit the
NSP power domain?

Should there be a corresponding constraint enforcing minItems: 3 for the CD=
SP
variants?

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +    #define IPCC_MPROC_ADSP0

[ ... ]

> +        glink-edge {
> +            interrupts-extended =3D <&ipcc IPCC_MPROC_ADSP0
> +                                         IPCC_MPROC_SIGNAL_GLINK_QMP
> +                                         IRQ_TYPE_EDGE_RISING>;
> +            mboxes =3D <&ipcc IPCC_MPROC_ADSP0 IPCC_MPROC_SIGNAL_GLINK_Q=
MP>;

[Severity: Low]
Because the IPCC_MPROC_ADSP0 macro defined above lacks an assigned numeric
value, won't it be replaced with an empty string during C preprocessing?

Could this cause the interrupts-extended and mboxes arrays to silently drop=
 a
required cell?

> +
> +            label =3D "adsp";
> +            qcom,remote-pid =3D <2>;
> +
> +            /* ... */
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724103848.2338=
04-1-shengchao.guo@oss.qualcomm.com?part=3D2
