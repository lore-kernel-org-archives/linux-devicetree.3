Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483FA173
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 21:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785099718; cv=none; b=hjPVe0IiD3iBKsNmRpOcqWxLvx78WQxc0s0xO0hBsL0TX42yHFw6QcteYQvOdZ1xV5pQKBmMRF6wRlXGWlNMpQ4y2WxHZFRDJgU34E0VGmHE7PYNJXZdLzyxPaXeex9TSV3b0HviZuGs1bDvxLrP92Qf/8PageqhR5F47sL7vLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785099718; c=relaxed/simple;
	bh=3oHQ7v/671AQD1VmOVTCNRl7FjS+SgXQyZul6tMOpUM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mtIHXn+jWm/Tuj3lLuROj2mW/V+RGh5c3HHIsPubT7VjsIofsGlymXL5z2t/UawK6kdufhqSuQDTwpb1n2cKpy4yTlNSPFLjuqzZThslhuN/gnBYUteiuDjSkn632x4Fo30AQKXam2lsCzbhN3ELqvyEmpp09NfitJ/KzedRGDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkgkUPBo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkgkUPBo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AAC61F000E9;
	Sun, 26 Jul 2026 21:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785099716;
	bh=J6TDsiLrQXAfPZWcXytYVulrIEe3Vl44z9H2ySPpSwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RkgkUPBoKsy38LvpIzH1o0k6wlvK0feqhRwgdWYi8baDGnyJ+84n8/kggjDb5xVXC
	 KcY2hdryzVsAWKf2NmDixki7ejI7EJTObMq5VYL8W9mwUdJiHfjcgCpDtnIAG8w8bD
	 Nj0N3RgfjM+Einoy7C/K4Fd6LWAnD9cuM6fjk/kDHlu/AK7/hgHbARjEKASwWFTvZw
	 7teBAQ8VtqRvyfm/WoM8QZeDCQ7YLl3o4h5ThK7yR4lDct6vHTqaWlieK7P0ZJ9gFP
	 iQm5l6HhVaTj4R9aQtCutZuwkkXKrhVHGnA4/tzmsu88dIl05M+VTobhmvkE9AcoeT
	 Z1+Mn12hjvxcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: bus: brcm,bus-axi: Convert binding to YAML
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260726205518.6698-1-rosenp@gmail.com>
References: <20260726205518.6698-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 21:01:56 +0000
Message-Id: <20260726210156.8AAC61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] DT Example Compilation Failure due to missing includes and undefine=
d phandle.
- [Low] DT Schema Validation Failure & DTC Warning due to missing unit-addr=
ess in child node.
--

--- Patch [1]: [PATCH] dt-bindings: bus: brcm,bus-axi: Convert binding to Y=
AML ---
commit afe32a853f1abd5449035c850043c368de3892be
Author: Rosen Penev <rosenp@gmail.com>

dt-bindings: bus: brcm,bus-axi: Convert binding to YAML

Convert the Broadcom AXI bus (bcma) binding from legacy .txt format
to dt-schema YAML format. This resolves dtbs_check schema validation
warnings for the brcm,bus-axi compatible string across all BCM47xx
and BCM53xx ARM SoC board DTBs.

> diff --git a/Documentation/devicetree/bindings/bus/brcm,bus-axi.yaml b/Do=
cumentation/devicetree/bindings/bus/brcm,bus-axi.yaml
> new file mode 100644
> index 0000000000000..951aa139dd987
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/brcm,bus-axi.yaml

[ ... ]

> +examples:
> +  - |
> +    axi@18000000 {
> +        compatible =3D "brcm,bus-axi";
> +        reg =3D <0x18000000 0x1000>;
> +        ranges =3D <0x00000000 0x18000000 0x00100000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        #interrupt-cells =3D <1>;
> +        interrupt-map-mask =3D <0x000fffff 0xffff>;
> +        interrupt-map =3D
> +            /* Ethernet Controller 0 */
> +            <0x00024000 0 &gic GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> +            /* Ethernet Controller 1 */
> +            <0x00025000 0 &gic GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;

[Severity: Low]
Will this example fail to compile during make dt_binding_check?

The example uses macros like GIC_SPI and IRQ_TYPE_LEVEL_HIGH, but seems to =
be
missing the required includes:
#include <dt-bindings/interrupt-controller/arm-gic.h>
#include <dt-bindings/interrupt-controller/irq.h>

Additionally, is the &gic phandle defined anywhere in the example scope? If
not, it might cause a reference to non-existent node or label dtc error.

> +
> +        chipcommon {

[Severity: Low]
Does this child node need a unit address to pass schema validation?

The schema defines valid children using patternProperties: "@[0-9a-f]+$". S=
ince
this node contains a reg property, the Devicetree specification requires a
unit address (e.g., chipcommon@0). Without it, make dt_binding_check might
reject this as an undocumented property and emit a unit_address_vs_reg
warning.

> +            reg =3D <0x00000000 0x1000>;
> +            gpio-controller;
> +            #gpio-cells =3D <2>;
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726205518.6698=
-1-rosenp@gmail.com?part=3D1
