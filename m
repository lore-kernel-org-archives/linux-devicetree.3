Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B72B47126A
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 13:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836998; cv=none; b=aUPVE+gfAfttoUb3qZTnFnMGNqV0Z2ji1XpcRKZjcW/r0Rj0PbZSkGt312hfPl3RndJ+5g5ei6VTVlWhdyvBqKBZ6FaL1+bbCyLJHMhB86CIc3ZyJnpP4oT7jHPYo6TakmWw9BAY2/lAKU1nGnDJg+lxqwDcEQm27RqIbnri2AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836998; c=relaxed/simple;
	bh=D5D4Qvuw2J7F3KPWGJJ3lGNXwqBqQ5PCbq3gRqLQKuM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tPcIeeigZ880/1S363+yKyEu/W6LxBnLtHKkikOoHfN6bP3QqRVrV8E/kCdFrYuyhKgdC/vzxVfPY6RCZ1aaJrR3ET+YSMGC7NZHH7+vUZ2nXGkle1YZJ49M7P9Z7zZnzue3Bwen91tIfSMNZoc5B4mAcMHt10FUx5xm1Jt/asQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hebwfOWX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hebwfOWX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5231F00A3A;
	Thu, 27 Aug 2026 13:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787836994;
	bh=S+vtg+DIQfssWs98xvhGpRu8Li1wu1OsFzS1bFiuqdc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hebwfOWXISMD9hNZMcwbuCt57m/aJZ+ybKmOyk7o9qMZa3QaeCBw4/pFwBs26B+Qi
	 tia0PhxQCCoWIdNxQkdhqwyVMZx/sjRJ8pMxNE6u3W63c7AjyuMaMlLWolR6KoScBM
	 wkwxEl6ZgGxLTPpDkBWpgWZ8yu6CcKyfhFlxyr0MzU7iiI4Kyh0YfeWH2kHKZekdNw
	 AUtR0DdvFsZYH8FkS0eG3kL8I+FOmlgRUz/l08pyYm0ZoulotVF2z+V2uZfPi5FwXH
	 2+5vcF/7tWKmb8YLY5KQ09RHaGx/kfWK3i7LvHsIXiJxHkc6wHNGb12QraGYem83bT
	 b6gJCbmABs6ew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: phy: airoha: Document support for
 AN7583 Gen2 PCIe PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260827131551.26725-3-ansuelsmth@gmail.com>
References: <20260827131551.26725-1-ansuelsmth@gmail.com>
 <20260827131551.26725-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 13:23:13 +0000
Message-Id: <20260827132314.0D5231F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] The binding title incorrectly refers to 'AN7581' instead of 'AN7583=
'.
- [Low] The register sizes in the example are off-by-one, incorrectly using=
 the maximum offset instead of the byte count.
- [Low] The binding filename 'airoha,an7583-pcie-gen2-phy.yaml' does not ma=
tch the compatible string 'airoha,an7583-pcie-phy'.
--

commit a30f9e597cd1c12059c1c3ca3b0550d5e5800f4d
Author: Christian Marangi <ansuelsmth@gmail.com>
Subject: dt-bindings: phy: airoha: Document support for AN7583 Gen2 PCIe PHY

This commit documents support for the AN7583 Gen2 PCIe PHY, which is used
to make the Gen2 PCIe port work. It adds the required registers to configure
the PCIe PHY and provides a usage example.

> diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen=
2-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-=
phy.yaml
> new file mode 100644
> index 0000000000000..f31d838871fc1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.y=
aml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-gen2-phy.yaml#

[Severity: Low]
Should the filename (and consequently the $id path) match the defined
compatible string airoha,an7583-pcie-phy? The extraneous 'gen2-' in the
filename causes it to diverge from the compatible string, which typically
triggers a schema validation warning when running dt_binding_check.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN7581 SoC PCIe Gen2 PHY

[Severity: Low]
Does this title incorrectly refer to AN7581 instead of the intended target
AN7583?

[ ... ]

> +examples:
> +  - |
> +    phy@1fa5f000 {
> +        compatible =3D "airoha,an7583-pcie-phy";
> +        reg =3D <0x1fa5f000 0xff>,
> +              <0x1fa5e000 0x3ff>,
> +              <0x1fa5a000 0x8ff>;

[Severity: Low]
Are these register sizes in the example off-by-one? The sizes 0xff, 0x3ff,
and 0x8ff (255, 1023, and 2303 bytes) are not multiples of 4, meaning the
final byte of the last 32-bit register is excluded from the memory region.

A developer copying this example verbatim might create an invalid device
tree that could cause out-of-bounds accesses when the driver reads the final
register.

> +        reg-names =3D "ana", "pma", "dig";
> +
> +        phys =3D <&serdes_phy>;
> +
> +        #phy-cells =3D <0>;
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827131551.2672=
5-1-ansuelsmth@gmail.com?part=3D2
