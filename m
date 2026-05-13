Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D947E2DC783
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 03:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778642582; cv=none; b=M7Se86ujSzmZdfsCdkhEmXFmGDQyiFVLhfnINiHVK343+TRibvCVTyPG1AbDzX84WndnPQqCyNPoIFXbHaqg+pBHn/d+cp7UwgY1ktphEt2Mx1U3jZLtONp8alNT2+rSVb6u6zZppka+oA1PIQy4zfzB+rTW9JyhQPhlKc3niYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778642582; c=relaxed/simple;
	bh=I+E3i/HNs+jwfxdaCAm11H6EBQXC9twqqS1WOwm2Cpg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=THLRjz7CGVB5En1VCysfTWkbfoXx+WNSKT1qNhLI0bV0A8v/VMWMdEP1GEUSsXmw1+pMLlLRz2s3RfvFUEGXUKRtBMsi9cQFEdVqTvXzSrwjWv7myfcdSdRpPMdK8HLrRpAHUG6xWCXhdK5TaSi1jDC4RlRrT4ONR8mie0/Zkrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tlGUrZ8f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tlGUrZ8f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34EDEC2BCB0;
	Wed, 13 May 2026 03:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778642582;
	bh=I+E3i/HNs+jwfxdaCAm11H6EBQXC9twqqS1WOwm2Cpg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=tlGUrZ8fanS+JE6thq9MK7r7dqs8CbYoe2AU3XnA7mkQbPzjyLTWeO1d2gk1lmLmf
	 Ls+s0qfUPjiwNDseWX4RN64f7EakDogKV4GQmTZSFdy5Gkkt4T229Gsp4635DeFdN7
	 YpdXNr9llLSnOBPL6bCwE1tq662SKYvVSqXURLygJYMC+YFxUYuKOSjYTkDS0MoI2k
	 3oj7docltzbxHjTu5F0MFDNziKnpvzQf+/QFWOZP5JTqas7+wCfIEzvCwhZ6ogsFNn
	 j3ekOpxksgxYwiT5KyiSMiEVlyKJIU26ALx65vIUPF1VTY66OfcZZUhkOLrRQF2khF
	 hdTate7PcEa0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: i2c: convert davinci i2c to dt-schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chaitanya Sabnis" <chaitanya.msabnis@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260512024851.4792-1-chaitanya.msabnis@gmail.com>
References: <20260512024851.4792-1-chaitanya.msabnis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 03:23:01 +0000
Message-Id: <20260513032302.34EDEC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The dt-schema conversion drops the mandatory requirement for the=
 `power-domains` property on Keystone 2 66AK2G SoCs.
- [Medium] Typo in the maintainer's email address in the YAML schema.
--

commit 15717022cbf5ba5c5c00abf42db38f66896bb215
Author: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Subject: dt-bindings: i2c: convert davinci i2c to dt-schema

This commit converts the Texas Instruments DaVinci and Keystone I2C control=
ler
bindings from legacy text format to YAML. It makes the interrupts property
required and defines the ti,has-pfunc and power-domains properties.

Closes: https://lore.kernel.org/oe-kbuild-all/202605120133.lQ1F3qlY-lkp@int=
el.com/

> diff --git a/Documentation/devicetree/bindings/i2c/i2c-davinci.txt b/Docu=
mentation/devicetree/bindings/i2c/i2c-davinci.txt
> deleted file mode 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-davinci.txt
> +++ /dev/null

[ ... ]

> -SoC-specific Required Properties:
> -
> -The following are mandatory properties for Keystone 2 66AK2G SoCs only:
> -
> -- power-domains:	Should contain a phandle to a PM domain provider node

[ ... ]

> diff --git a/Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml b/=
Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/ti,davinci-i2c.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/ti,davinci-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments DaVinci/Keystone I2C
> +
> +maintainers:
> +  - Chaitanya Sabnis <chaitanya.msabni@gmail.com>

This isn't a bug, but there's a typo in the email address. The address is
missing the trailing 's' compared to your author email.

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false

Does this conversion drop the mandatory requirement for the power-domains
property on Keystone 2 66AK2G SoCs?

The original text binding explicitly documented that power-domains is
mandatory for the ti,keystone-i2c compatible string. Should there be an all=
Of
conditional block added here to ensure incomplete device trees missing this
requirement do not silently pass schema validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512024851.4792=
-1-chaitanya.msabnis@gmail.com?part=3D1
