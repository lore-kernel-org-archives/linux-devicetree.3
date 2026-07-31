Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4673B1ED1
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 17:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785519363; cv=none; b=pXlfVdlkIw9Awsh+utZIOfxFzkg7w/M2GjC3ZRVRPOVX+ZPvjRTxxxdtzRvxjR43wTD6kaVfrKdAKYU4xznCTsoc5mX2g+u9C6cBss0F+ebu8SaKmfjGM3CGFNgpVicPkhpuSRXtEjj+hJPibZVHsuiCVluaGVX8zRmlwdTfGyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785519363; c=relaxed/simple;
	bh=wefGE0Vvveu/voCJEwgvSOPvj7PJjZKYnZNI0t4cCZY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ylxe0ABM6dJjv5GI5YWBEgOXrsSf566M6r+nc6lPR1QEmykgpenH3nVv/jRWmEohN1yztoECjKV4C/4+9E6iX3xmFklJsmRYk/Fjk1N6ntvelu3aABWU5ZekXzg16EryFXIUBU16YH5Xa1WlTJjeE6d+f9TLLLfyjVxe0YrDHV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PrxjWne9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PrxjWne9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3241F00AC4;
	Fri, 31 Jul 2026 17:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785519362;
	bh=6f3NHvoBZHY+aQBkPXofZBUYqWJ+ZAyrBUp0xuaxeV4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PrxjWne9yS0bFpx5qCTeUKX4usskqpVGNY5ng3ldFvR4TmKJPtsQaRrvGFWrYQlp9
	 FUjQhSqoRE4AOtQ/KjzK2YEwObLPdNpE1BcI60Icx9BZGZFGddvHFmmV9iod0FPR1t
	 uDrx7JuNrnsWR+hGAaMqwAOByitGOkxxDJcKa+KMmbiXw6tILeawMstYWHkKGWeK63
	 gWFl8KAf5Xnpyk6ycd41UGDLplU3qhrQAKghQnkflmwMeBv04YzKmrHcX9nUZyNvNS
	 HZmxd0OZpHfqXhW2UmfQAjEXwQcstUxJMpRszKIVWHScgq9dCtpCQAG12aYLguM10X
	 dmQprmVtjLP2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: dpll: zl3073x: ZL30643 is
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-for-upstream-zl30643-v2-1-0ea0bbd03755@free.fr>
References: <20260730-for-upstream-zl30643-v2-0-0ea0bbd03755@free.fr>
 <20260730-for-upstream-zl30643-v2-1-0ea0bbd03755@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 17:36:01 +0000
Message-Id: <20260731173601.AC3241F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The DT binding adds a fallback string for the ZL30643 device, bu=
t the corresponding driver strictly checks the hardware chip ID against a h=
ardcoded whitelist, causing probe to deterministically fail for the new har=
dware.
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: dpll: zl3073x: ZL30643 is compat=
ible ---
commit f6998893262610471dd1ffc9397a1a575b09a8ed
Author: Vincent Jardin <vjardin@free.fr>

dt-bindings: dpll: zl3073x: ZL30643 is compatible

The Microchip ZL30643 (chip ID 0x0E3B) is a member of the ZL3064x line card
timing family. It is register compatible with the 3-channel ZL30733
(chip ID 0x0E95), so it is added with a fallback compatible string.

> diff --git a/Documentation/devicetree/bindings/dpll/microchip,zl30731.yam=
l b/Documentation/devicetree/bindings/dpll/microchip,zl30731.yaml
> index fa5a8f8e390cd..17983e6c35975 100644
> --- a/Documentation/devicetree/bindings/dpll/microchip,zl30731.yaml
> +++ b/Documentation/devicetree/bindings/dpll/microchip,zl30731.yaml
[ ... ]
>    compatible:
> -    enum:
> -      - microchip,zl30731
> -      - microchip,zl30732
> -      - microchip,zl30733
> -      - microchip,zl30734
> -      - microchip,zl30735
> +    oneOf:
> +      - enum:
> +          - microchip,zl30731
> +          - microchip,zl30732
> +          - microchip,zl30733
> +          - microchip,zl30734
> +          - microchip,zl30735
> +      - items:
> +          - const: microchip,zl30643
> +          - const: microchip,zl30733

[Severity: Medium]
Will this device fail to probe because its chip ID is missing from the
driver's whitelist?

The commit message indicates the ZL30643 has chip ID 0x0E3B. However, in
drivers/dpll/zl3073x/core.c, zl3073x_dev_probe() explicitly validates the
read hardware ID against zl3073x_chip_ids:

drivers/dpll/zl3073x/core.c:zl3073x_dev_probe() {
	...
	rc =3D zl3073x_read_u16(zldev, ZL_REG_ID, &id);
	...
	/* Detect chip variant */
	for (i =3D 0; i < ARRAY_SIZE(zl3073x_chip_ids); i++) {
		if (zl3073x_chip_ids[i].id =3D=3D id)
			break;
	}

	if (i =3D=3D ARRAY_SIZE(zl3073x_chip_ids))
		return dev_err_probe(zldev->dev, -ENODEV,
				     "Unknown chip ID: 0x%04x\n", id);
	...
}

Since 0x0E3B is not present in zl3073x_chip_ids, it appears the fallback
compatibility will still result in the driver returning -ENODEV and
aborting the probe.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-for-upstre=
am-zl30643-v2-0-0ea0bbd03755@free.fr?part=3D1
