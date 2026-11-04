Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801615;
	b=MAl5GbbG6ZQ0XGo4F1IYgDwQRK3qSGPE3VjsFfHaoKqYhSX8JaB0e227/zlPmmU42IgW
	 /iPnYtrCsm376Mrga8fhMHTJ5Tx52PiwlasKbEXDJlQA6o9IthDYiQellahGHy+RwW2bG
	 BHTlaToTqSmf2wXBJRFtKixHKlFgn5vFRVEtujmX36sSamrLiooFdAP3ahU94t3ZpHm6u
	 3jB9whrhXQxWQgV/WJxk3Kc76KzojLyi5q6n1HHcvFxMKojHEQy0S6dFcI2UVQT/tS40V
	 UR7KmLXkXRySc1lQf1ODf0uhmG5Zp76ef0lTDoxqSP+IABzm8REV1I8YbrHTcmmm6Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801615;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=c6a767/UZmFqeqicph2FjLmatlUG4Khixey5lXqULRc=;
	b=2znAuaxMIdOi+jXcGqeK2h6aiTzV5OdhABYCbA+S78zOQHS7sXOCzJ834rbBvigRoJpG
	 L/IB2ZLOsUOFIBetr5VO2X9fH+oFXPZPYqTPgjCWDSMwqOKZqeOGvUfZwiGRcmtLAfZHF
	 4ZhWVl4LQ8W4NB4kAX8ntGveWBwWlpvONL+7pjVc8vUAVYUq4QHCgO6TnN5dQF6my613O
	 YBetrZo5iUDfVehvjEmirM9h66tSt38cHAdmsD4BvfBQjzgM5psh2ah3S6yf5f9il4g+u
	 PNVYYRMPcuJokr70dQ2M4Ggk/iST2CnwkTF7hbfnn1i+8HDx47/BkyLfWm2dYGb1hMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L7/aAmnB";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259C5606A330
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L7/aAmnB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905ED1F00A15;
	Wed,  4 Nov 2026 14:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801614;
	bh=c6a767/UZmFqeqicph2FjLmatlUG4Khixey5lXqULRc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L7/aAmnB/kLhYkjW3sC2kXWbbUHHeT25esznN50GuMVJU5MnFiyvEErqMoUGuz4Ok
	 i9EDdAdWeaqNxJRXagX9cCsvei5VrpOPxQGFzAECkEWk20SPBmrEsGE+FYcz4gDF1y
	 H8mvNVYGNuIw5NbxIu0gnNwKcHCLajGWEvduURytFtb2ComMW99RM1N/YYAX5upXYd
	 Mg3y29p6D54NjUvZvyb3deskWKCGo+uuh2tKADPrS1SF0dEzNXa6f8WM8LxNkFP6sy
	 GO+i6ZbHkfhnAbMTIfEdN+2vb0QPlLUUlE/LblIa3q6JRYu53twZhmabac3CSibxC+
	 kQsxHKm2ub8ZA==
Message-ID: <sashiko-outbox-197413@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: remoteproc: Move iommus constraint
 to SoC-specific bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-shikra-el2-v4-1-97e7019debff@oss.qualcomm.com>
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
 <20261104-shikra-el2-v4-1-97e7019debff@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 14:13:34 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: remoteproc: qcom,sm8550-pas: missing iommus for Gly=
mur PAS
- [Low] dt-bindings: remoteproc: duplicated iommus rules and unwieldy condi=
tionals
--

commit 95697c560209b6d85ebaddcbbc163e85e3f0686b
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings

This commit removes the common iommus maxItems: 1 constraint from
qcom,pas-common.yaml and adds per-SoC iommus constraints to
qcom,sa8775p-pas.yaml, qcom,sm8150-pas.yaml, and qcom,sm8550-pas.yaml.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pa=
s.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
> index dda2d144b7206..711c2f723b179 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
> @@ -106,6 +106,8 @@ allOf:
>            items:
>              - const: lcx
>              - const: lmx
> +        iommus:
> +          maxItems: 1
> =20
>    - if:
>        properties:
> @@ -126,6 +128,8 @@ allOf:
>              - const: cx
>              - const: mxc
>              - const: nsp
> +        iommus:
> +          maxItems: 1
> =20
>    - if:
>        properties:
> @@ -144,6 +148,8 @@ allOf:
>            items:
>              - const: cx
>              - const: mxc
> +        iommus:
> +          maxItems: 1

[Severity: Low]
This isn't a bug, but since every compatible in
Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml matches =
one
of these three allOf branches (covering qcom,sa8775p-adsp-pas,
qcom,sa8775p-cdsp0-pas, qcom,sa8775p-cdsp1-pas, qcom,sa8775p-gpdsp0-pas, and
qcom,sa8775p-gpdsp1-pas), could iommus with maxItems: 1 be defined once und=
er
the top-level properties block instead of duplicating it across all three
allOf branches?

Also, in Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml =
and
Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml, adding m=
ore
per-compatible if-then blocks into allOf makes those single binding schemas
increasingly unwieldy as variant differences grow. Would it make sense to
split divergent variants into separate schema documents rather than piling =
on
more conditionals?

[ ... ]

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas=
.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index 99e9aeeb4f62c..dd81ecdb8dc49 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -317,6 +317,18 @@ allOf:
>              - const: mx
>              - const: nsp
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,x1e80100-adsp-pas
> +              - qcom,x1e80100-cdsp-pas
> +    then:
> +      properties:
> +        iommus:
> +          maxItems: 1

[Severity: Medium]
Does removing iommus from
Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml while only
allowing iommus for qcom,x1e80100-adsp-pas and qcom,x1e80100-cdsp-pas here
cause dtbs_check regressions for Glymur?

Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml also cove=
rs
qcom,glymur-adsp-pas and qcom,glymur-cdsp-pas and sets unevaluatedPropertie=
s:
false. In arch/arm64/boot/dts/qcom/glymur.dtsi, both remoteproc_adsp and
remoteproc_cdsp specify iommus:

    remoteproc_adsp: remoteproc@6800000 {
        compatible =3D "qcom,glymur-adsp-pas", "qcom,sm8550-adsp-pas";
        reg =3D <0x0 0x06800000 0x0 0x10000>;

        iommus =3D <&apps_smmu 0x1000 0x0>;
        ...
    };

    remoteproc_cdsp: remoteproc@32300000 {
        compatible =3D "qcom,glymur-cdsp-pas", "qcom,sm8550-cdsp-pas";
        reg =3D <0x0 0x32300000 0x0 0x10000>;

        iommus =3D <&apps_smmu 0x2400 0x400>;
        ...
    };

Should qcom,glymur-adsp-pas and qcom,glymur-cdsp-pas also be included in th=
is
conditional so iommus remains evaluated on those nodes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-shikra-el2=
-v4-0-97e7019debff@oss.qualcomm.com?part=3D1
