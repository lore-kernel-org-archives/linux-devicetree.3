Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CA81514F8
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 20:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788121884; cv=none; b=VMDZQbPlSylTlGaVpu8VnlK+xj3ak6ORFGRl8q3jLROKbRJMD7lIbhnUVVyW/Nikn8rKDgUDuY69YhS6qvRR4yqBrGVyRF+8xoYsx1g77i0v40csi41pHnhHgxVEvzqtWLFVcdoAEd64OSk/0ty0HbLj+7OZ1KSau70TMp31fPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788121884; c=relaxed/simple;
	bh=p/mJ3ETGKPLHHj5Pba9Js4bMygVCVxlhAyyNjvqL9as=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EndkaseOTcJzNQT50wOVCqA0YBK0OtbkdKrU2mmIL3YAP+Pj0fvIEXp3baR6Gejqpb/rzA1YdExYPGi04up9IDXdQoFC4gsYcqthXDlohpfAjNpRQ8vNjSu3hdMPA/62Q0gTa27giR4TqOa8FrdqdDcGikBmM7mO80Q7UGYZPWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ipz5owGh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ipz5owGh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5F11F000E9;
	Sun, 30 Aug 2026 20:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788121883;
	bh=einqyBRLgf5sVejCtrGi2pqlnCnqBmVk9fXJsuxtUEA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ipz5owGhFAaXNprqyW7DlU/8VkAs24f4oiu6JrKkyt5rO8Ue2cwoQnAtvs27PVVnQ
	 f8gqB5XiY9lmur8q2nr2hZwRUE6brbncXsh9BeCsxxe4yyMz3dRbEVOzq884Q4zTlf
	 9D6pIuUREP6Zx39lBuvDjg2qHAA+FJ1tF34RWasgwKoK3BEn+zVpPVQFIbOyd/NqJU
	 UM0xFptZlaVF9rJ/m2zdFpMfoIJvfNraP8LQg73F1aKp6iMn7WPbLlCjMRfLcyn3VN
	 voLujXqz4FI/v27GXXi44EGzQNDi1xC3TIpj509hBhLtgBnUiM44Ki+a/yCibex1CN
	 DZplRpYDmhnjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/19] dt-bindings: thunderbolt: Add Apple
 USB4/Thunderbolt ACIO block
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-5-44bc9348683c@kernel.org>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-5-44bc9348683c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 20:31:22 +0000
Message-Id: <20260830203122.EE5F11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The schema strictly hardcodes a single IOMMU child node at `iommu@a=
80000` and uses `additionalProperties: false`, which will likely break vali=
dation for T6030, T6031, and T8122 variants.
- [Low] The schema violates device tree binding rules by using `additionalP=
roperties: false` alongside an `allOf: - $ref` block.
--

commit 15e396e79f7b850555d7dbc50421194161e71868
Author: Sven Peter <sven@kernel.org>

dt-bindings: thunderbolt: Add Apple USB4/Thunderbolt ACIO block

This commit introduces a device tree binding for the Apple Silicon
USB4/Thunderbolt host router (ACIO). It describes the co-processor, the USB4
router, and its adapters, including child nodes for the Native Host Interfa=
ce
(NHI) and its DART IOMMU.

> diff --git a/Documentation/devicetree/bindings/thunderbolt/apple,t8103-us=
b4-acio.yaml b/Documentation/devicetree/bindings/thunderbolt/apple,t8103-us=
b4-acio.yaml
> new file mode 100644
> index 0000000000000..38496ce31d20e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thunderbolt/apple,t8103-usb4-acio=
.yaml

[ ... ]

> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports

[ ... ]

> +  iommu@a80000:
> +    $ref: /schemas/iommu/apple,dart.yaml#
> +    description: DART IOMMU exposed by ACIO and used for DMA from the NHI

[Severity: Low]
Will this hardcoded child node prevent the use of multiple DART instances on
variants like T6030?

The T6030 NHI requires 24 streams, but an Apple DART supports a maximum of =
16
streams. This implies T6030 must instantiate multiple DART nodes inside the
ACIO block. Combined with additionalProperties: false below, the schema
will reject valid device trees that define extra iommu child nodes for these
variants.

> +
> +  nhi@f00000:
> +    $ref: /schemas/thunderbolt/apple,t8103-usb4-nhi.yaml#
> +    description: Native Host Interface exposed by ACIO
> +
> +required:

[ ... ]

> +  - iommu@a80000
> +  - nhi@f00000
> +
> +allOf:
> +  - $ref: /schemas/usb/usb-switch.yaml#
> +
> +additionalProperties: false

[Severity: Low]
Will this property combination trigger dt-doc-validate linter errors?

According to device tree binding rules, if a schema references another sche=
ma
using allOf: - $ref, then unevaluatedProperties: false must be used instead
of additionalProperties: false.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830-b4-apple-s=
oc-tbt-v1-0-44bc9348683c@kernel.org?part=3D5
