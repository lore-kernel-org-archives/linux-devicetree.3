Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D4A3C4B8E
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219902; cv=none; b=qZX2VtLlLnrxNQo30pzq5RmNVby0umycwEvw3r2KW6MVqHbOP/MnfOCxJ0hTMrMdpLYrgfjgrUL+Jwch7I6KvcNjnJw7/h2UXvU1Y/B+uo0IfYrIGq2YVv/5WF+H1DJFcx5+LFKwRBjGViT8Y9Xl72hk7P+qUNbYgmKjpilDuiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219902; c=relaxed/simple;
	bh=UNOY0FleUmkc7wIvK46VCJaIJMKTinRalRLWJ2GXelc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IhnQ4fqyFpm6u/939nt7K9tUxO+WClbG0isjL0VqS0cBfK+QsEoCPXWodEbHk3y0dJcm4EYMI0PZeviduBbU99naVSOq7gU3hAqx8C+gyTXtpees4sDtnQ4ECB16aTB0VXJjNY8vcXGIwq7vF4MC1mc84SvKc1+itkKE9hKMDLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+RWhNbS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+RWhNbS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B17B1F000E9;
	Mon, 31 Aug 2026 23:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788219900;
	bh=VuydwHWJwErTcZpZd68EszVVgWMX8ZAfz600qalhQS8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k+RWhNbShhz0xCJ+iFK9Ipb8L7PQcUIWxgfJYuKOdmwViUgE2Jzbaz9E9AZzD1vuS
	 YPdRYiECZ0PGlaqfsmhoQNa5uiMZRyhettZdUuj+ndhAUaPdfgCYvg6f80sa3afDQ2
	 Ge9EQSWqRKRNrpeoHbaBqyKzkZf5edS4zci0oMRvBrQCOJulYj6hQp8I39jEmhjds0
	 1QsGxSJSBaQw4tPdJSugGHws38XMrep5q1mMWLWNB5l+cjgieaSTZ9+LHve3WYShdU
	 Uwh4Dh9eTyg/60m0HNNma3nrP0Bvm+OAVEEhFkmDEuLrLAENp2PSzCKaC1hqeV2tMD
	 8DWmP+kM+PC1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] spi: dt-bindings: ti,davinci-spi: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901-ti-davinci-spi-v4-2-92e9c0b2e1d4@gmail.com>
References: <20260901-ti-davinci-spi-v4-0-92e9c0b2e1d4@gmail.com>
 <20260901-ti-davinci-spi-v4-2-92e9c0b2e1d4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 23:44:59 +0000
Message-Id: <20260831234500.6B17B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema uses `const: ti,keystone-spi` within the `if` block c=
hecking the `compatible` property. Because `compatible` is parsed and evalu=
ated as an array of strings by dt-schema, comparing it directly to a scalar=
 string using `const` will always evaluate to false. This silently bypasses=
 the schema constraint, allowing device tree nodes with `ti,keystone-spi` t=
o pass validation even when they omit the required `power-domains` property=
 (as demonstrated by the first example in the schema, which lacks `power-do=
mains`). The correct match operator is `contains: const: ti,keystone-spi`.
--

commit 1f217c9462f9b9ccc473fed6ad4bc95248f60b00
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

spi: dt-bindings: ti,davinci-spi: Convert to DT schema

This commit converts the TI DaVinci/Keystone SPI controller binding
from text format to DT schema. It creates a separate peripheral schema
for the ti,spi-wdelay property and adds missing DMA properties.

> diff --git a/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml b/=
Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml
> new file mode 100644
> index 0000000000000..672d03d2492b3
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
Does this const check correctly evaluate the compatible property?

Since compatible is parsed and evaluated as an array of strings by
dt-schema, comparing it directly to a scalar string using const will
always silently evaluate to false. This bypasses the schema constraint
and allows device tree nodes with ti,keystone-spi to pass validation
even when they omit the required power-domains property.

Should this match against the array by using contains:
        compatible:
          contains:
            const: ti,keystone-spi
instead?

> +    then:
> +      required:
> +        - power-domains
> +
> +unevaluatedProperties: false

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-ti-davinci=
-spi-v4-0-92e9c0b2e1d4@gmail.com?part=3D2
