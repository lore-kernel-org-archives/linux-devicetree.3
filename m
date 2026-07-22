Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186AD43849A
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784710159; cv=none; b=UT9uTPu5jdOsGWNg+J4DHPiQ/Spt9t0P46oV3GWX47uA/sBYpWPzT84RG+QbRIpmIZu8tzuDQpIFjwhgvvSLkDQ7cApms9f1DOS3ExtVpwTRQX0sjtyyB8WygmZECUeMs4VchFQrhdJXSAeH2k4N3bSGM80Lm6LT9zTPlUu4dvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784710159; c=relaxed/simple;
	bh=MZ808CqOncrFR8SZ0BvR8CDmB0nZIohijR64tIky8Dg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B+VEhU/VmkI7sWNpzfMDxw+ECddoQDaA9bWvnwosncuGkCPOoDowvEzjqtleaek5Dc0ezT4USsvSSpoLGPoZtcCWCbhE3Yh3GjGEKmbbczMwsnFqQzvBELSZPKmTn/7NDxwqd5ggmEklYt116HyBYXxlhyinQOVA4YYGWsd3U98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mBq+Pu4A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mBq+Pu4A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CDCE1F000E9;
	Wed, 22 Jul 2026 08:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784710157;
	bh=iTi1zB2Ba4yP6MwLXStdIqWeLcDvvUCNaC5T4zE7te8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mBq+Pu4AYT0PxG9jgfQbS0J10xGQnBHMkTc9BPwnV5qv0dYyKuZQeCGxZdpiVljQc
	 pJYWJSNjP0txiprtsgjfwBFOeHQpYrGb6OygaN1hA2JxrXkYyXLSRHI6MRKOHHpelM
	 QFTZ2NsR7wXAVzH/HUyCsa1g+kp7Jk/4evIL4AdMlaPPMbpV/wEufqXekxj0hJFVcw
	 I18Rcf3OOHJeDEf0eroWBZhWv/W2T2ormwk50OSU/kGLyA8y8WcuUzo3VfPXbSCBLK
	 TZbLLC64EVxigVbH3GSwlLDPcr3kNWWKd/RfhTDvboY7B3Ix3Phv0UZY5KrfhtmmPi
	 FFpFUj/gvgRSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/2] dt-bindings: regmap: add common schema for
 no-sequential-read
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Leitner" <richard.leitner@linux.dev>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-regmap-single-read-v1-1-aaaf31591669@linux.dev>
References: <20260722-regmap-single-read-v1-0-aaaf31591669@linux.dev>
 <20260722-regmap-single-read-v1-1-aaaf31591669@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 08:49:17 +0000
Message-Id: <20260722084917.7CDCE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `maintainers` field in the newly introduced DT binding schema c=
ontains the placeholder 'TBD'. The device tree schema validation (`dtschema=
`) mandates that all items in the `maintainers` property must be valid name=
s and email addresses matching the format 'Name <email@example.com>'. This =
will cause `make dt_binding_check` to fail.
--

--- Patch [1]: [PATCH RFC 1/2] dt-bindings: regmap: add common schema for n=
o-sequential-read ---
commit 309f545ffe78e2e1263494a044512db6b6e61394
Author: Richard Leitner <richard.leitner@linux.dev>

dt-bindings: regmap: add common schema for no-sequential-read

This commit introduces a common regmap dt-binding schema with an optional
boolean property no-sequential-read. This describes hardware integrations
where reading multiple consecutive registers in a single operation is not
reliable and registers must be read individually.

> diff --git a/Documentation/devicetree/bindings/regmap/common.yaml b/Docum=
entation/devicetree/bindings/regmap/common.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regmap/common.yaml
> @@ -0,0 +1,26 @@
[ ... ]
> +title: Common register access constraints
> +
> +maintainers:
> +  - TBD

[Severity: Low]
Will this cause make dt_binding_check to fail?

Device tree schema validation mandates that all items in the maintainers
property must be valid names and email addresses matching the format
Name <email@example.com>. The placeholder TBD does not match this format
and will trigger a meta-schema validation error.

> +
> +description:
> +  Common properties describing register access constraints.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-regmap-sin=
gle-read-v1-0-aaaf31591669@linux.dev?part=3D1
