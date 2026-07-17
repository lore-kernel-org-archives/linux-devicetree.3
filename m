Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06ED248F73
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 19:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784314822; cv=none; b=ouqy4LaZ3RULOU2W2lJwzGDvEYm2aQDDVT5Iz3dsxXz/8jVBN8QblQP7XVpHS33pE4ExZcK+CcxQMMEFtZyEMV5bd6GbFdwAPEa+/0eQU5S9O3rYCYRQUTJh4/vIrP7VYeV4LvpVPkhiiF6N8JvtjfY68vvd6Tiq852etG93t1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784314822; c=relaxed/simple;
	bh=95llePwAOyh4m8A2Xctgkjukxidig9LzNwkYcl8NFSo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B1rPL6rBDeozYfxKvzJrFpBm7vZFr5ZFchS+1jQZNCn2NUxODb+DtHC9g54Y9NIV68L8+TpLw/vNyDGCW5F6l4hz/6IkpOraOwKgXEc0u9ml7fhzIGDb/m2EzLSV9iyCDheSxQIzKBW36jfirIZC4zwRnv6F88+xXVzobwW0fx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNFg+dbv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNFg+dbv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55AA31F000E9;
	Fri, 17 Jul 2026 19:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784314820;
	bh=8CxV3ZjX0r1q18xoUZ6iwdZT45EScRCVjvrXy+DJA7o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fNFg+dbv+dxzg5+xKVd810cSmmPYteIYuHfsiLOu/u6C9bjlaAnUgtetjWgUhw9GH
	 vq8kMpbL+d9CUYEgwnU3fLy4vptIQHy/3ti33LbJDKVugpnCbAftcV6UomED6NAiXZ
	 Zjh5sbk8qPJ0IAGdCHuw1XSfwOiXv80f0ZCYwULc/udM5ELOjL0gNr31pW5XRTJbdr
	 9DNVfMrOHYc36LCaJfg96qJIuZx86fBfrO7Plpd8JlXxyURIRz+emy1rVMf5v8HHJP
	 vMhTKZfjhqEERtl3NLcShdP+kZ6AAMSl1NlTLdzsTZzyYmdr+3glLb7/99Kc+L2mhO
	 GzSWrSWjzzCxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/17] spi: dt-bindings: add
 spi-max-post-config-frequency-hz property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717185116.2065505-2-s-k6@ti.com>
References: <20260717185116.2065505-1-s-k6@ti.com>
 <20260717185116.2065505-2-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 19:00:19 +0000
Message-Id: <20260717190020.55AA31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Redefining the standard `spi-max-frequency` property to mean a con=
servative initial rate breaks forward compatibility and changes established=
 DT semantics.
--

--- Patch [1]: [PATCH v5 01/17] spi: dt-bindings: add spi-max-post-config-f=
requency-hz property ---
commit 93cbfe3b6ec01682a84f7fad631a6f353ca37329
Author: Santhosh Kumar K <s-k6@ti.com>

spi: dt-bindings: add spi-max-post-config-frequency-hz property

This commit introduces a new generic device tree property,
spi-max-post-config-frequency-hz, for SPI peripherals. It redefines the
semantics of spi-max-frequency to represent a conservative pre-configuration
rate when both properties are present.

> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.y=
aml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> index 880a9f6245667..12211f8c9f7de 100644
> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> @@ -45,6 +45,11 @@ properties:
>      description:
>        Maximum SPI clocking speed of the device in Hz.
> =20
> +  spi-max-post-config-frequency-hz:
> +    description:
> +      Maximum SPI clock frequency in Hz achievable after controller-side
> +      configuration.
[Severity: High]
Could redefining the standard spi-max-frequency property to mean a
conservative initial rate break forward compatibility with older drivers or
alternative operating systems?

If older software parses a device tree using this new pattern, would it cla=
mp
the operational speed to the conservative pre-configuration rate, resulting
in a silent performance regression?

Would it be more robust to retain spi-max-frequency as the absolute maximum
limit and instead introduce a new property (such as spi-initial-frequency-h=
z)
for the pre-configuration limit? This would ensure older software continues
operating at maximum capability while allowing new software to safely
initialize.

Also, if the semantics of spi-max-frequency are changed, shouldn't its YAML
description be updated to reflect this conditional behavior?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717185116.2065=
505-1-s-k6@ti.com?part=3D1
