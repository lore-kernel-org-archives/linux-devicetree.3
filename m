Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A2E46EF89
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 18:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787076596; cv=none; b=PG6NAch3DcSRu5FqVq0UGz+L4UnvXqSAcbKSpzUidi+0XU9/vW9l9sjRVsDcR1Vw+sbKtc91OjHd0Fn3c+gmQEg2PMo/2uESHblV5RD11rQgm6s4ciDkhTRAWt5dkVZNE2OfpVfKEFHDkis1NSZNuhlKfchRfKd5b2j7KIniKKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787076596; c=relaxed/simple;
	bh=33n0bqWsoeJPr5fTyzEHd+kVu1Xkmx9khHfyYVclu7M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cbTS2M+GpwmuX6GLb0+HPYL0sTIXmST3Pngd2Tr46OGOR1CnXmq2gr0vYKTOGWgrZLYAcf5hNtEH+R3mxcjkVtobJfP0kLlCCtUJw6Af6XYbXUswg6NtXuME+IgMJAIHLdoL/Jhk5SRRGmTQK8iC1aJX4hQrX+5WNV3+QfXMiyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dD13iSMK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dD13iSMK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5081F000E9;
	Tue, 18 Aug 2026 18:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787076595;
	bh=XrspOT3kAMO+8GqB1UFzC7wSWPeoNA3Un5PAh+gR3Ok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dD13iSMKhzLeM69z0bGn/31C9R9RIJLCypok/VrNMW5koYW5sJKMZjSuTs4w8/saV
	 MhpY4OQJAX408iceH2hA7O9uR5UWbcIKOrW+okPn2z3WN1KUy013X9wYi3E44oVsS/
	 eBXjJ4vftM2jg/loErTLiCLHaLEOw6WJ6ZUnuwFIEHCjLH0uw4+w/D/xui2z5DsWge
	 VEaxMs9Zc4wQ8K21uHtvQsdXL0+azYiRRAg6JhPF7QCwK3fmR57RqPoXQ2KWXGeLfT
	 r0ZignNZWmnS6owGQkfj15ApIg0kSnvb1kqwVtAEjpapE3ewuY/GOjpZ0y9WicXKvL
	 iPYwSUpMhWkXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: arm: ti,omap-mpu: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260818-ti-mpu-v1-1-5b1c71a34669@gmail.com>
References: <20260818-ti-mpu-v1-1-5b1c71a34669@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 18:09:54 +0000
Message-Id: <20260818180954.CC5081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `sram` property in the DT schema is missing a `maxItems: 1` con=
straint, allowing an unbounded number of phandles.
--

--- Patch [1]: [PATCH] dt-bindings: arm: ti,omap-mpu: Convert to DT schema =
---
commit 999724263c1ab03e517bff5216bcbf149a14a6a9
Author: Bhargav Joshi <j.bhargav.u@gmail.com>
Date:   Tue Aug 18 17:59:51 2026 +0000

dt-bindings: arm: ti,omap-mpu: Convert to DT schema

Convert TI OMAP Main Processor Unit MPU text to DT schema. This conversion
marks ti,hwmods as deprecated and preserves the existing pm-sram property
name to maintain backward compatibility.

> diff --git a/Documentation/devicetree/bindings/arm/ti/ti,omap-mpu.yaml b/=
Documentation/devicetree/bindings/arm/ti/ti,omap-mpu.yaml
> new file mode 100644
> index 0000000000000..abd8c64e8e9f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/ti/ti,omap-mpu.yaml
> @@ -0,0 +1,58 @@

[ ... ]

> +  ti,hwmods:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: Name of the hwmod associated with the MPU
> +    const: mpu
> +    deprecated: true
> +
> +  sram:
> +    description: ocmcram node
> +

[Severity: Low]
Does the sram property need a maxItems: 1 constraint here?

Without it, the device tree schema validator can allow an unbounded number =
of
phandles to be specified. Since the original binding indicated a single pha=
ndle
for the ocmcram node, adding maxItems: 1 would ensure dtbs_check correctly
rejects invalid device trees with multiple sram phandles.

> +  pm-sram:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-ti-mpu-v1-=
1-5b1c71a34669@gmail.com?part=3D1
