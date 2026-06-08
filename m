Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C84B3C3458
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927615; cv=none; b=sb9M0XtF01q+OspXt4IGeHVcENEKzjiEhybIecYlT/pipKkhkCrILTdog1/5PyI1voS7+KxhCRUVXHTOV+cyxYLMhwFyCV4NYECXTmsAmaYVP757vPGPFLmp3jiG62tvM2tLfBTyWfwDAd9/PkSiJCsnq9aOOCKXOH38LIFBRZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927615; c=relaxed/simple;
	bh=eDQbnTM8drDsJpaUTo81fJUJnsMMJu0ru+rUhfgHy+k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C7cFzG5bPZ0R/zqyRGGEtM5expnPEGTk5U5uaHO68TEKGNV4MJ8pKyJZ1u7+qPoMG4UHW96yXVM4EMwzC1g0Giazf65ujQXFa0r8fzd3eBIQQY00PVQR8rUqJc7WN86j6c2sfjJE0HgCbIbR++DZ3TecPPJ6oDxQ1Fr2nnDLgiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lyx7gDbw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lyx7gDbw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8DE1F00893;
	Mon,  8 Jun 2026 14:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780927611;
	bh=GG2Pnf3yvxLytSc9QcNR5Vt8ECDcgRo2fH9XbjstVW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lyx7gDbwnGpfq2b5shP2nVc2UlypRxzZmyQnN1P5lrA8jvfAf6cu889KMa3TcspYV
	 RohoWdAzw+no70sZoVNiehwKxciu+tsRClCr2CKfulvzh2qM3pLH1kxl0DjuIOm0IJ
	 gx9k8d38EOvBYHGtujrYt+/GZ6ts/6t/E93qQeNPoBnC/j84Yl+d/O0q3nd4EKjBUk
	 awz/08eIhmNuYM16OuM2uOKhZdmsRZXaIc6aD2S8Epu2m6CGYG6RqPAif1n6+LYSrY
	 nFq+xr2NTvsKDC58kqbao7sQAWUtZB7i5yHpxS1C9croYVCvMRU590h3KtDP4JFkKf
	 LAipK1QzhAq3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: syscon: Disallow simple-bus
 with syscon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v2-1-0203e6c249dc@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v2-1-0203e6c249dc@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 14:06:50 +0000
Message-Id: <20260608140650.CF8DE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] DT Binding Violation: Undocumented Compatibles and Validation Br=
eakage
--

commit 73d2cc9a54e99039c48884fc1ade73467dc1c67d
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: mfd: syscon: Disallow simple-bus with syscon

This commit adds a schema rule to disallow the combination of syscon and
simple-bus compatibles. It creates exceptions for existing upstream device
trees that already use this pattern. It also introduces new compatibles for
several TI platforms to bypass this restriction without a dedicated schema.

> diff --git a/Documentation/devicetree/bindings/mfd/syscon-common.yaml b/D=
ocumentation/devicetree/bindings/mfd/syscon-common.yaml
> index 14a08e7bc8bdd..315357da146ea 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon-common.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
> @@ -57,6 +57,38 @@ allOf:
>            minItems: 3
>            maxItems: 5
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: simple-bus
> +    then:
> +      # simple-bus conflicts with syscon - if a device is a system contr=
oller
> +      # with miscellaneous registers, then it has at least one dedicated
> +      # function thus it is not a simple bus. Allow existing exceptions.
> +      if:
> +        properties:
> +          compatible:
> +            not:
> +              contains:
> +                # This list CANNOT grow
> +                enum:
> +                  - cznic,turris1x-cpld
> +                  - img,pistachio-cr-periph
> +                  - ti,am3352-scm-conf
> +                  - ti,am4372-scm-conf

[Severity: Medium]
Does this cause make dtbs_check to report undocumented compatible warnings
for the newly added TI platforms?

Since these new compatibles are introduced in this exclusion list but are
not defined under a standard properties compatible block in syscon.yaml
or another dedicated schema, it appears the tooling will fail to extract
them. Will this lead to schema validation skipping hardware-specific
constraints for these TI platforms?

> +                  - ti,dm814-scm-conf
> +                  - ti,dm8168-scm-conf
> +                  - ti,dra7-scm-conf
> +                  - ti,omap2-scm-conf
> +                  - ti,omap3-scm-conf
> +                  - ti,omap4-sysc-padconf-global
> +                  - ti,omap5-scm-conf
> +                  - ti,omap5-scm-wkup-conf
> +      then:
> +        required:
> +          - incorrect-usage-of-simple-bus-and-syscon

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-n-dt-bindi=
ngs-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com?part=3D1
