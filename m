Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6438E4302E1
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 22:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786055653; cv=none; b=j520/eVpxDNIPT+anybzEoaHOjT6+ZGM4hg6d65ef/DbCzd/Cgyz7+eSBNCg5DrmNE/tRoHkUkYh3gzjjpaf5kPJNhTng5L4dXqxBOKoq8TV7+drNPaHueveqlWANprUhEMobe/vTqS3jlsZb7at/KiVPj55OCfA/mbsqJyJT0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786055653; c=relaxed/simple;
	bh=ZBZm08QVpH0oqCZncL8xgf2SHX4iDj0+MP0kF7e4A3Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jaUHRjHq//V4hk4ilQ2g2WPbO9ghLK2QEyxgqseByGYkpaygUMeDqvxqU6ChAmLEbJvnbiS0cvPNG2MR/WessS01HRRJJsG+hIp9rGKrglHZYAcoa+PHNxiCeldhAMA43FZE/xmol4Ulpce23A0BLA/wB9GcsRFI9ZR/JYkrx6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GnCbnIn+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GnCbnIn+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520541F000E9;
	Thu,  6 Aug 2026 22:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786055650;
	bh=Mn9ZAA/aSOcuDVI3IMa+ukPpHlsyNhWM/EiAkXtH2wE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GnCbnIn+7u7MG4OfXrIHrZVxn35iqhlTXcq0FUX3QQMSJgMKqJ1iTrQ9X+Y5HZxTV
	 ah3hdXaCeq4lf3j83YMeTOjHg8Y8NMawyBXgD0q1+637vJFsFRs07YYYNkVl8kasWc
	 hDcf3AfehdkOwDgYr9Ox1EkQWFdfIeIBq8M5KoHdi4gU8F2PWv6MFQsQW9Gr7o/UWl
	 F+Vik84uiH2yt1mWXdcYMcLHl4lneZR1I+O1pd/HcN7k3VOwcv3EQfBMDJlWqazYtF
	 NZSkK2fczZ0JF5RvNOcu9kwpEJFW87hMGixR98oGvtARV71DhVTS70FdTDO0/KvzT1
	 F0OK8VJr1sT+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 36/37] dt-bindings: pinctrl: airoha: add support of
 an7563 pin controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806220615.4078303-37-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <20260806220615.4078303-37-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 22:34:09 +0000
Message-Id: <20260806223410.520541F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree binding example uses a deprecated integer assignmen=
t for the boolean `drive-open-drain` property.
--

--- Patch [36]: [PATCH v11 36/37] dt-bindings: pinctrl: airoha: add support=
 of an7563 pin controller ---
commit 19964a175dff853355fc62b6f1ae7edafb571f45
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

dt-bindings: pinctrl: airoha: add support of an7563 pin controller

This commit introduces the device tree binding schema for the Airoha
AN7563 SoC pin controller.

> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.=
yaml
> new file mode 100644
> index 0000000000000..6d186ebe4a41b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    pinctrl {
> +      compatible =3D "airoha,an7563-pinctrl";

[ ... ]

> +      pcie1-rst-pins {
> +        conf {
> +          pins =3D "pcie_reset1";
> +          drive-open-drain =3D <1>;

[Severity: Low]
This isn't a bug, but should this example use the standard boolean flag for=
mat?

According to the core pincfg-node schema, assigning a uint32 value like <1>
to drive-open-drain is deprecated. It could be written simply as
drive-open-drain; to avoid propagating deprecated syntax into downstream
device trees and triggering dt_binding_check warnings.

> +        };
> +      };

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806220615.4078=
303-1-mikhail.kshevetskiy@iopsys.eu?part=3D36
