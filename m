Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7937143D503
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770160; cv=none; b=F3lQFIW439oRRe2J95/CK82xFLgGgAQIJT6jPn5gQ/XsURIlg9WcidfAo+n9AHYF78gFZfRbqcyQj3+UFNj2zBM6oqsSDQLP3CjcKUPHWhgy4yHrwwBA7tbinG0+Bl5vDb3K1bfD2pFk10p/gp8zr7F63W8Fnx9TH+lQye2UhAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770160; c=relaxed/simple;
	bh=TFdmya8hBWBrchTy4xaUWisoPLj7FICCuleNudVlL3s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jWWkz2Ay/jhvISII89Kt/XWSQrqHn/0LO6LbHJaT6GjIDFXNC3byVl5IDl01mfi2S9UXqryenbemGi0MpuAdppBqcdzIV4BWcFztpQxTsrljqUAUrnOPuvsm0XhusGHcKdyghj31x8cxNUo4HH6N2SKTjz2Da40DHnPwY8HF9Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XU55JZL3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XU55JZL3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04EB51F00A3A;
	Mon,  7 Sep 2026 08:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788770158;
	bh=i2ckFEPg3qST1oQDtDm/IvLUzLRx751Dc4qMJokHa3k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XU55JZL3D5ezNmBhoQlSXHRo/HaZwdFHzOhZ/JoMyFm3SReKedPGsZR8PAj5ZmmrD
	 q9sdIfc9qV2facj3CuPb3WKGqTXjnIim61YZp6bRM5e8Q4XNfloFSEJmZ+J+hqARfT
	 F5d9iP7ik79viOyuIL1sNAe3YguPyv51qFOJ961MSIlJymcdNbvAVKx2QKdsGBrBcp
	 LuWnqoENSWFsACDG3Kg08NwRJkZfk24aQUpOuQf0OKwmzgD7XPT76GDH50ULvc0Ygj
	 9y6/SdRFIiAHj22+Ck17BU0pv1m9bGjy14ps8P2xefhzcUx+CC7mPWQy4H9DvrEntm
	 i/4SGCvvfJepA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: usb: add Altera Agilex5 DWC3
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ng Ho Yin" <adrian.ho.yin.ng@altera.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <19d22389b795bd0883dc481f045a293b400f1ea3.1788757821.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788757821.git.adrian.ho.yin.ng@altera.com>
 <19d22389b795bd0883dc481f045a293b400f1ea3.1788757821.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 08:35:57 +0000
Message-Id: <20260907083558.04EB51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema incorrectly uses `additionalProperties: false` instea=
d of `unevaluatedProperties: false`, which negates inherited schemas and fo=
rces redundant property declarations.
--

commit 9d62a972209f1de97f540bff2202c5f7fd9c1a48
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

dt-bindings: usb: add Altera Agilex5 DWC3 controller

Add a binding for the Altera Agilex5 SoC integration of the Synopsys DWC3
USB controller, covering clocks, resets, PHYs, and optional IOMMU support.

> diff --git a/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml=
 b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
> new file mode 100644
> index 0000000000000..9970d7c9d6fae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
[ ... ]
> +  reset-names:
> +    items:
> +      - const: core
> +      - const: ecc
> +
> +  dr_mode: true
> +
> +  maximum-speed: true
> +
> +  snps,dis_u2_susphy_quirk: true
> +
> +  snps,dis_u3_susphy_quirk: true

[Severity: Medium]
Are these property declarations necessary?

These dummy redeclarations appear to be a workaround for the
additionalProperties restriction below. Once unevaluatedProperties: false is
used instead, these can be safely removed as they will be properly inherited
from the common schema.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - phys
> +  - phy-names
> +  - resets
> +  - reset-names
> +
> +additionalProperties: false

[Severity: Medium]
Does this incorrectly reject standard properties inherited from
snps,dwc3-common.yaml?

Using additionalProperties: false instead of unevaluatedProperties: false
strictly restricts properties to only those defined in this file. This brea=
ks
schema inheritance, meaning any standard DWC3 properties not explicitly
redefined here will cause dt_binding_check to fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788757821.gi=
t.adrian.ho.yin.ng@altera.com?part=3D1
