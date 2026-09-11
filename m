Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BE6346E5E
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118017; cv=none; b=O3+xqx9JgQL9jDUFYBvBPPfw0EzNKtQ7kv++q8IyDboa/2PD9AL4ooxS1qiMujofXmGOok8MZpy9KJH7hEwo9bex/+UPsfHNY9UgMXUvB2CrBqrTj4iLU9lYYsiKjJIoJiAhIWjPXs0DMyq9hoa6mqOiVKIedUYKD71uAIFL6TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118017; c=relaxed/simple;
	bh=b/VjAV7SsXKM4xMLYudnpSLAbRNILzVim0nEXlRgvi8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FtR6fjz4UScTf3BOPs63/xoJUOLtuk0bCimJMh7XGX6shhAf8y/6ZpF8BSSWJX+y6hZdenEo1y1SgGWGgKF37NKX0NNeODil3DlJkD9k688xJUpjLDmIzmyPoZCcPBP9yMaLOW5H+OxE5njwrEYfB/QvyKXPRdadx9pXODWOupY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCbTeQkJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCbTeQkJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1481F000FF;
	Fri, 11 Sep 2026 09:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789118016;
	bh=8SBcFa9uJSBRdc6wsT0dmXwl0KiVlIeNTeu6ZV5D3BY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bCbTeQkJwa0CElVEfil309ymmrM24ktgStiLSb/6azhignQu2Cd8qcgLBWMalbyTi
	 xHOJ5hvi56WXccFn5VonPz+AB5Z2COyitvTDxhkjXNLx+kuuJQ9vWmLBdpAelbdMK4
	 EnVcZSunze1yKG+Ey9p2kREFdbm7tks1WQxQ/wr7C29yumr5oK2fKT1WKGZJ9Wcjf9
	 OykfuXwAHuxHEr/MfywyHCmab/NDqJTATY3aVDBdKcEgeUo9P3ml5pjeRKvxWpULH1
	 lOsDtG0MJKZoFpegwEieb9MMOLEOFslP/nieFBLkzGU8l/U9byzq5gXC6rxU7Zszx9
	 hYmdCt8qUsm5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: add Altera Agilex5 DWC3
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: adrian.ho.yin.ng@altera.com
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <0fbda23eb4a22a56e455b5e89125813af60ab0cc.1789114385.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
 <cover.1789114385.git.adrian.ho.yin.ng@altera.com>
 <0fbda23eb4a22a56e455b5e89125813af60ab0cc.1789114385.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 09:13:35 +0000
Message-Id: <20260911091335.AF1481F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The schema incorrectly uses `additionalProperties: false` while ref=
erencing a common schema (`snps,dwc3-common.yaml#`), breaking property inhe=
ritance and leading to redundant property declarations.
- [Low] Mandating software workaround quirks (`snps,dis_u2_susphy_quirk`, `=
snps,dis_u3_susphy_quirk`) in the `required` list.
--

commit dc0ed2c5f838c95fd4fbbcd46531a58ec24f6ca2
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

dt-bindings: usb: add Altera Agilex5 DWC3 controller

This commit adds a device tree binding for the Altera Agilex5 SoC integrati=
on
of the Synopsys DWC3 USB controller.

> diff --git a/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml=
 b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
> new file mode 100644
> index 0000000000000..610ddcb632e28
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
> +  - snps,dis_u2_susphy_quirk
> +  - snps,dis_u3_susphy_quirk

[Severity: Low]
Are these software workaround quirks strictly required for all hardware con=
figurations?

Quirks are meant to be optional software workarounds for specific boards or
silicon revisions. If every device matching altr,agilex5-dwc3 intrinsically
requires these suspend PHY quirks, shouldn't the driver apply them natively
in code when it matches the compatible string, rather than forcing device
tree authors to manually include these workaround flags in every node?

> +
> +additionalProperties: false

[Severity: Low]
Does this strict inheritance restriction cause the redundant definitions ab=
ove?

In JSON schema, additionalProperties: false ignores properties validated by
allOf $ref schemas like snps,dwc3-common.yaml. This appears to force
redundantly redefining standard properties like dr_mode, maximum-speed, and
the suspend PHY quirks as true in the local properties block just to pass
validation.

Could this be changed to unevaluatedProperties: false to allow removing the
redundant local declarations while properly inheriting the schema definitio=
ns?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789114385.gi=
t.adrian.ho.yin.ng@altera.com?part=3D1
