Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7626A4F3916
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893074; cv=none; b=sNWSFhK8zXRoxwVFXAQFbaH/5OXr1woCpuGuTYMYRfWVyU+LAGEteDqSVJxhxQmL9iT87w90RcK3ijZ5pdfRZvpIqPmPmNQnCUzJ/Iwe3YENv4cPWV8BfTuPrru5VLTWrREbjRKcRT6Isv2eHg3FyuaDOULNCniMZn9cBfp7d44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893074; c=relaxed/simple;
	bh=aYhbb6Ne6WKh9bdFFSKzhyBwZybrw9eUlMC7fcwpknk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=b7R+wN6E2kwgOPhq+BfbTVEc1oa9fpuYpCBUkY3MICT8enmxMec2p5IBmfN96T4Bj2LiBwrHecHEOquJRoBjxtLWy7XFC2ZHRRBfF0Ipr+mQU/OCkfiqGq0bN8IffC8aGw/eCciC51TjNXQWQzey/h/EnW+yFkrVbg1OhdHoTcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jWWyYfVq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jWWyYfVq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2F21F00893;
	Tue, 13 Oct 2026 12:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791893073;
	bh=95RxLRpyWnTNgw77lOuq8/G1QyQO+ueVVc2uJJs9uRw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jWWyYfVqC7+8xtmEDJtjE9OA/ZklZa1t6gj8sw+xLRyhzKL4ZSSnyb9by0kWH6KTQ
	 BASfp9g2FJCQiP84kJ0SmUVhkNAdvIN3l/SGCS9Xn6SAROTb6jyiacnN1s5HYLy5B4
	 c4yRAfHI8W9E4u34VjyazqEkYo0+ulz4XjMEu2WgMKIMmKDaCOH9oO5hl+M6vedggd
	 8HdGZqWTj+6IAtlwl2q2ngZhHrADlIXhgw5C9JIOfE264dV82SEg+B732kY0f4gfE0
	 7AhAMDVHCvSfgfJS0a1BemT9/oi6+5ovJ7mLAppwIQq+A9pH5V605yYDlNiXSjsEzC
	 cBZKaEvIvn/iw==
Message-ID: <sashiko-outbox-169669@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: iio: light: add as7343
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chang Yu" <marcus.yu.56@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013115639.167433-2-marcus.yu.56@gmail.com>
References: <20261013115639.167433-1-marcus.yu.56@gmail.com>
 <20261013115639.167433-2-marcus.yu.56@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 12:04:32 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: additionalProperties: false blocks referenced LED prop=
erties
--

commit 91a13bd8ef095a37fbdedc3e1a205c8195e990a3
Author: Chang Yu <marcus.yu.56@gmail.com>

dt-bindings: iio: light: add as7343

This commit adds a device tree binding schema for the AMS AS7343, a
14-channel multi-spectral sensor.

> diff --git a/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml =
b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
> new file mode 100644
> index 0000000000000..7fb10b0d4843b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +
> +additionalProperties: false
> +
> +allOf:
> +  - $ref: /schemas/leds/common.yaml#

[Severity: Low]
Will additionalProperties: false cause the schema validator to incorrectly
reject valid LED properties?=20

Because additionalProperties is set to false at the root level, only the
properties explicitly listed in the local properties dictionary are allowed.
When a device tree author adds standard LED properties (such as function,
color, or label) included by the /schemas/leds/common.yaml reference, they
will fail validation as unallowed additional properties.

Could we use unevaluatedProperties: false instead? This would allow the
properties defined in the externally referenced common LED schema to pass
validation correctly.

> +
> +examples:

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013115639.1674=
33-1-marcus.yu.56@gmail.com?part=3D1
