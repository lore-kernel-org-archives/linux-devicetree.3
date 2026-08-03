Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4748B4302E6
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 18:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781287; cv=none; b=ITdneLuj6laXZ3UKw/eVq3MMj/Ncuh9ojIPFDnKPOa6PPHXIh2hqBEdABmUGVVwDlph+dO8nxkqdbcd8PW9nsjzshHfPPqXWqfn3lkGvxzpGWClLzvsTCvzDlqsXRGjAKRxrm5PCwz7yPcp3V96ax5Q/U7diQKvP/+aXWWoj7L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781287; c=relaxed/simple;
	bh=nLNsi6HjFBN5vRHFDl4G3Ltv2LVHPME4BT9A9TCCAn0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l3dziWij1+A6ptR0Qo1qBdhFmyJ8PYNoNj9+MoukFEl1rXPTFY4usLrer0gVvbEa7rio+BLEBblPB+pCWuEGgWQje0YKSbHG1uv6c4eEPnB4TBogJnrSFR2YLal/BErU9bZDM0QwnciEIMXxvV2uar7t59thEej2ytEzPiHmPus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/h1rgd0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/h1rgd0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980F41F000E9;
	Mon,  3 Aug 2026 18:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785781286;
	bh=fAvNz2dM9s988pS4XAVnMfmRokgSw8yypfBJgfkvKgY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d/h1rgd0/eSMjnUMFUUF4ytX7x+fGjnhcNpKmYcqBZAx/K8DDtcvHzzIna2VLJeyM
	 B/Gvn9hJZJwiDGpV2SUNQv/hv3i3EpX6A7SDrhdqWCwmuvEqwh2wSOeBqmlSGyxKqr
	 65pVnvNpUZWxKi9KHi11paP16vRaYEXHsFRSeWNKZU1YsDUcCYyOF1zFF5Yz7FZNfv
	 62AO/H+p8gC0XRW86LecqK7K1HbyqY4N0nXFdPceouhjr8DdoLy1nt8ZuLCu/xGFlF
	 zRnMwy8eFFuss2yYi0kEMTi4qYSriUvGk7AzFhpq7ioCuUtzzUha/c4tVPnTADl3iL
	 CzjXBjvNrOvcQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Make
 SDX75, Hawi and Maili MPSS fallback to SM8650
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com>
References: <20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 18:21:24 +0000
Message-Id: <20260803182125.980F41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removing `qcom,sdx75-mpss-pas` from the standalone enum and enfo=
rcing a fallback breaks schema validation for existing DTBs and the in-tree=
 DTS.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Make S=
DX75, Hawi and Maili MPSS fallback to SM8650 ---
commit 47a9ace0c12a078f309c8a844f59ffd712d4d63a
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

dt-bindings: remoteproc: qcom,sm8550-pas: Make SDX75, Hawi and Maili MPSS f=
allback to SM8650

SDX75, Hawi and Maili MPSS are compatible with the SM8650 MPSS as
they share the same set of interrupts, memory regions and power domains.
Rather than describing them as standalone compatibles, model them as
fallbacks to qcom,sm8650-mpss-pas.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas=
.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -18,9 +18,6 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,eliza-cdsp-pas
> -          - qcom,hawi-mpss-pas
> -          - qcom,maili-mpss-pas
> -          - qcom,sdx75-mpss-pas
>            - qcom,sm8550-adsp-pas

[ ... ]

> @@ -49,6 +46,12 @@ properties:
>        - items:
>            - const: qcom,sm8750-cdsp-pas
>            - const: qcom,sm8650-cdsp-pas
> +      - items:
> +          - enum:
> +              - qcom,hawi-mpss-pas
> +              - qcom,maili-mpss-pas
> +              - qcom,sdx75-mpss-pas
> +          - const: qcom,sm8650-mpss-pas

[Severity: Medium]
Does removing the standalone compatible strings and enforcing them only as=
=20
part of a 2-item array break backward compatibility for existing device tre=
es?

If older device trees, such as arch/arm64/boot/dts/qcom/sdx75.dtsi, use=20
qcom,sdx75-mpss-pas without the newly required fallback, will they start=20
failing dtbs_check validation?

> =20
>    reg:
>      maxItems: 1

[ ... ]

> @@ -205,11 +208,9 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          enum:
> -            - qcom,hawi-mpss-pas
> -            - qcom,maili-mpss-pas
> -            - qcom,sdx75-mpss-pas
> -            - qcom,sm8650-mpss-pas
> +          contains:
> +            enum:
> +              - qcom,sm8650-mpss-pas
>      then:
>        properties:
>          interrupts:

[Severity: Medium]
Since older device trees might not include the fallback string, does
removing the standalone compatible strings from these allOf conditional=20
blocks mean those device trees will silently bypass validation for=20
interrupts, power-domains, and memory-regions constraints?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803180021.2036=
8-1-mukesh.ojha@oss.qualcomm.com?part=3D1
