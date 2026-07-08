Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B1D430301
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 18:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783534416; cv=none; b=soZEn3394JpddB8eoM6ZQhiOSnrQqgnG82dCB+50aQUgxcVZuPWenZC85wWqI39PeTUGuROIofXGPuTEYYh8BJA6wD5O7aPcaKrDTMud01Pevf8znUn3wsznOFa+1hVhvesyUCJznHhsyc90DiwW0EMn91YHh7zm8NMONAreteA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783534416; c=relaxed/simple;
	bh=j+tdasRAAiYy3ubifPN4tktaFb4c39n7qH/aCewoOjc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WdVZVeoQf6L38ygqiYWcR4BFoY5DG5As42+k4ccN0w5DdNhlrG9Wu5Jgwp42OYCHxB5RHbIYI3kaOEgvCnsY38p7dQFyfR4Ii1zSVBTGsCyYmYG50qeqV5Cp2/hwwChBx3/PLhKZWOAvqq9xwSrCWD3YHySvYEkyXjh9U3oKZDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YF/7X9oQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YF/7X9oQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC13E1F000E9;
	Wed,  8 Jul 2026 18:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783534413;
	bh=hyrQw3S6KWR30UeuY9vOr0BxfUyo7k+UXz+zdavEt9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YF/7X9oQBrjqcLU+7qtYYT3EtiBq8aYy+9miiqwoVbP/2QzLw27W7ANXOtRmGWmZO
	 a82g59NZMMVM+3bP/ZfbgoMmS3n8zEZBp2ux2OltlyjupbQNjHdkwzJiRsqc+PXqU9
	 HKW27iTIpUn1sjg/uWv/a637oiBOkRE/e/R9mcRWVG0Q3yWr5t47cCu4wU90d1g9MG
	 B1DfJ5PgrkqxoM7GYnV4FGzel9jnSdVfbvJeSsE1HrGm9gf5LJlCqW+Pctm8nfToZs
	 V2pcW2U5VNTbGOIgXuBXF7LMUenpdPSaH5MK40ro+gjRMq9dGASeprma41eqwSiZCZ
	 zauNciMw3B5Vg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: crypto: rockchip: Add RK356x/RK3588
 crypto engine binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dawid Olesinski" <dawidro@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708175837.1718437-2-dawidro@gmail.com>
References: <20260708175837.1718437-1-dawidro@gmail.com>
 <20260708175837.1718437-2-dawidro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 18:13:32 +0000
Message-Id: <20260708181332.CC13E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The YAML binding artificially restricts the `resets` property to=
 a single item (`maxItems: 1`), which prevents the complete representation =
of the hardware's reset lines on both RK3568 and RK3588.
--

--- Patch [1]: [PATCH v2 1/4] dt-bindings: crypto: rockchip: Add RK356x/RK3=
588 crypto engine binding ---
commit d3ca14a283793e220819f2a5573b09896dfccc6d
Author: Dawid Olesinski <dawidro@gmail.com>

dt-bindings: crypto: rockchip: Add RK356x/RK3588 crypto engine binding

Add a YAML device tree binding for the Rockchip second-generation (V2)
cryptographic hardware accelerator present on the RK3568 and RK3588 SoCs.
The binding covers the rockchip,rk3568-crypto and rockchip,rk3588-crypto
compatible strings.

> diff --git a/Documentation/devicetree/bindings/crypto/rockchip,rk3588-cry=
pto.yaml b/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.=
yaml
> new file mode 100644
> index 0000000000000..fc09f21b06549
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
[ ... ]
> +  clocks:
> +    items:
> +      - description: Core clock for the crypto IP internal logic
> +      - description: AXI interconnect clock interface
> +      - description: AHB interface clock
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: aclk
> +      - const: hclk
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: core

[Severity: Medium]
Since the hardware block has AXI and AHB interfaces that require correspond=
ing
clocks, should the binding also accommodate reset lines for AXI and AHB (e.=
g.,
SCMI_SRST_A_CRYPTO and SCMI_SRST_H_CRYPTO on the RK3588)?

Restricting resets to maxItems: 1 prevents a complete device tree node from
accurately describing the hardware's AXI and AHB resets alongside the core
reset, which would cause schema validation failures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708175837.1718=
437-1-dawidro@gmail.com?part=3D1
