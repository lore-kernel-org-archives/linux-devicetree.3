Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D3336DA0D
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993961; cv=none; b=AOIOOrpQK1RNoSvkZ60GaUODGWCCzBMrPP3hRlR1pXw+PR3bamHb8C8WOFo7AgNSUyqq/MTr38QqUJe85r5iLiks/z2vBrtUXCtWjp7oYHf12NNQ8Jy6WzhuiiNhbppl9yQbEFt5EV+qCDruQU8c9WarMrI9nFYPseHPWekUFzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993961; c=relaxed/simple;
	bh=7mNGey6krLF3B3j7Q8hoONEp+Js7VjV12oIfpqjdSjw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=faRJbQeRctrWDV5e2Cim1SJmfgmLybzhpuAmyQ1imYq5+vrRtWroWLIoZB7F9YmOVgATjeCrDTMt5wfcNfKlRL8QjQJJZcm9zkWwwnR0CNQe+hMsXWr40HRvrvUzzNZb9yUJF43+YFNmm99Izm6uBkyQfKxXcJvpWzQHALepT/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6XF9GBl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6XF9GBl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483881F000C4;
	Wed, 14 Oct 2026 16:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791993955;
	bh=wNe4xef+Fd8j1XBFkACRZmiTbBAJw76i77kagDJPSvA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H6XF9GBl15/KOQ/pg2F8n1stwHzvugU8KTd6t4x6iL9gW2ZPAL++9AvhrcC1A4GJO
	 FXzmkWcbwrHQwU4dopLuEt4ac9kCq1mUGcHImpEY1/htn5C6p0rHY48dvVo+bdtUhN
	 ho+tJ4dkzClCT1CLG+rXXg1uyR1u0xzu/Wh/9yriZTAK+9ZLNzZ+1/HLpSfKzHg5e7
	 hEwaXiG/QpIn+5M+efq+6dJ2C82uGJ0SZdBJnIt0ubFII32Oun4+1Y91pmghGBnQWu
	 3xA9n/nMzyeCCMnXB3uLWKpXR5pG3uIGC0v0r2OdsxWvDMDKyxCvcDCU/2nmJRH0V6
	 u5jkz/ZD3FOoA==
Message-ID: <sashiko-outbox-171513@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: cache: qcom,llcc: allow optional
 second interrupt for LCP/SRP ECC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Faiyaz Mohammed" <faiyaz.mohammed@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-master-v1-1-aba3cfcfbac9@oss.qualcomm.com>
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
 <20261014-master-v1-1-aba3cfcfbac9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 16:05:54 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing maxItems constraint for legacy interrupts
--

commit 50febfa0c04f4bae15f676db2e6662c8855b0e3c
Author: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>

dt-bindings: cache: qcom,llcc: allow optional second interrupt for LCP/SRP =
ECC

QCM2390 (Shikra) has an LCP/SRP block that signals DDR DRAM ECC errors
on a dedicated interrupt line separate from the existing TRP/DRP cache
ECC interrupt. This commit allows an optional second interrupt in the
LLCC binding and enforces both are present for qcom,shikra-llcc.

> diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Doc=
umentation/devicetree/bindings/cache/qcom,llcc.yaml
> index 2141e5d4de63b..3546cf7c25195 100644
> --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> @@ -64,7 +64,17 @@ properties:
>      maxItems: 18
> =20
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: TRP/DRP LLCC cache ECC (ddrss_apps_interrupt[2])
> +      - description: LCP/SRP DDR DRAM ECC (ddrss_apps_interrupt[1]), pre=
sent
> +          on platforms with an LCP/SRP block such as QCM2390

[Severity: Low]
Does this implicitly raise the maximum number of interrupts to 2 for all
compatible strings?

Since maxItems: 1 was removed globally, a device tree for older hardware=20
could erroneously define two interrupts without failing schema validation.

> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: llcc-ecc
> +      - const: llcc-lcp-ecc
> =20
>    memory-region:
>      maxItems: 1

[ ... ]

> @@ -234,6 +244,20 @@ allOf:
>              - const: llcc1_base
>              - const: llcc_broadcast_base
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,shikra-llcc
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 2
> +        interrupt-names:
> +          minItems: 2
> +      required:
> +        - interrupt-names
> +

[Severity: Low]
Should there be an else clause here to restrict legacy platforms back to
maxItems: 1 for interrupts and interrupt-names?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-master-v1-=
0-aba3cfcfbac9@oss.qualcomm.com?part=3D1
