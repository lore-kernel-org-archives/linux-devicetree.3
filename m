Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACA13BE64C
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 22:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786917924; cv=none; b=uq70EXFypxyTtQxIi4PMYiEUg+FWuBI+iwkN27C6uoUKxPrRMCIzXh/khDtdxsh4vOGfTjt4QOReP9DLtRKyXUjREIfC1Sh4d/QugdnDJ4YF85FpV6y3k+sv/rE/bZjBNzixEfpaNigQ0f5DWyuJve9bywGaLfRDBdOOwCyJnAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786917924; c=relaxed/simple;
	bh=A7w9Eb0NlH1nPsmbhWuL8RtcvAnqotHNa0nKGt2RWsE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BzH4ngueyb9aMyxrSO+mupFXQGZupiNv6S26xnupX2/APCVyHWEb/qMCy2m0ZivJNeQQnLoos05vZ6M6r6GXA5p3AsTRl+m1m4rm4xxRxNPPSa9VQCeLz7o/Ui/1FtSgSMP/AsdLSbttQnVKsP/aBys9vp6GV8m0tnA7rWcf3gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZINT3yr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZINT3yr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD05A1F000E9;
	Sun, 16 Aug 2026 22:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786917923;
	bh=T7ySGHz5GcBA57wh9wIB78RqLGaanA8TRWtb2Mme/HM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HZINT3yrPbe1Hqw3DzUzfaB1D1ltFk8zU1SYgf2Btlv7wDXKkJDJLeYGKSHdeNfQ1
	 cpUfgicHpXk2y4W2NaA0g/pYisCmMNRouPVZeIlnv3Eyf24sT/nu+3OpwM4IltYspP
	 IMAV02AoZuGR0A2R69QuttRMRJOXFsRrJw1ks18+WGoQQ4rIJ/054mT4sfA2tWTyzg
	 ZL4Gjz0MWC8eJxZNGqDdmbsB6YN5TQjsvF23FygnLgkTOCBOjo/dnlWhMNPSvaKZnu
	 GCDxD+cXOYLdsE4THafG82rKmTWqxJ9VAxRPEBMIxrxngq9cPcUQQkqkkYFSA+mIOw
	 JD8m/hzPgKNwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: spi: ti,davinci-spi: convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817-ti-davinci-spi-v3-2-23844cfb5e6a@gmail.com>
References: <20260817-ti-davinci-spi-v3-0-23844cfb5e6a@gmail.com>
 <20260817-ti-davinci-spi-v3-2-23844cfb5e6a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 22:05:22 +0000
Message-Id: <20260816220522.DD05A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `if` condition matching `compatible` uses a scalar `const: t=
i,keystone-spi`, which is invalid for an array and will silently fail to ma=
tch, bypassing the conditional `power-domains` requirement.
--

--- Patch [2]: [PATCH v3 2/2] dt-bindings: spi: ti,davinci-spi: convert to =
DT schema ---
commit a5efe9443825ce2f7c099e64bba8a83549fd7607
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: spi: ti,davinci-spi: convert to DT schema

This commit converts the TI DaVinci/Keystone SPI controller binding from te=
xt
format to DT schema. It also creates a separate schema for peripheral
properties, adds missing dmas and dma-names properties, and introduces
constraints for the ti,spi-wdelay property.

> diff --git a/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml b/=
Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml
> new file mode 100644
> index 0000000000000..5bf74f3ca588f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml
[ ... ]
> +allOf:
> +  - $ref: spi-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          const: ti,keystone-spi

[Severity: Medium]
Will this condition correctly match the compatible string? Since the
compatible property is represented as a JSON array during evaluation, using=
 a
scalar const match will fail silently.

As a result, device trees missing the mandatory power-domains property for
Keystone 2 66AK2G SoCs will pass validation without errors. Should this be
updated to use contains: const: ti,keystone-spi instead?

> +    then:
> +      required:
> +        - power-domains
> +
> +unevaluatedProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-ti-davinci=
-spi-v3-0-23844cfb5e6a@gmail.com?part=3D2
