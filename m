Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578756;
	b=KedQgAn8LNSuQjo1fLFtcT+kDWSeBoqh1egRIPu27jpqt2hpizgFGy6M9H5E6lg5VDMe
	 YMYtCcw7L4htc+SaEWzRVDEL2N80NsCMm5OsxsdsQcngvNexEi94GefusbGpR54kehb4d
	 0m8Xuz0+zbyb0wlY3K/+Uvu+zUF0ijzou+TUtUEyCtWnrXSbX6qg/BOITzN2nd0FqOHw/
	 4x9uaHwXZgIARtAAUwtAflR0Q6wvubqmE133T6zU/K2X8FUfvY55llwOvS8yl7Yj35hoX
	 h25dGAD6cmraBHLJtEFPa4f15Pr6HJeEZUx01VGD1TVVw0XrcbZO6IDjYFvUm7QWJ0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578756;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=A9JU3+ZINrTICOD4MNu6hjXwjGs62/QFFfia9fmGE+o=;
	b=xssP351Q/Vnp8JF7CluNo2jWIp+SSoBSajSqNV0rwSW6xG8EdIOyfajF7SeC7BgNyN6T
	 Rsi2XvslrrvbJ7DzCJ02+Ly+lawuyseMAg4q8/ADPrmGsD0F86hASmFp7nK9ZhYtIyfa7
	 WswmTvtGofeP7gJ4sAh+UEGj84SkgTTkuV5hCu8Z0eeCm0I+X5nExOXYqBoOTWom/NQcJ
	 fBIGYcWIiLkHNLCfle6hRPKTzHGGP4tLKzQMWbmwjm1sfbl40Pxm0iJ+IobqECVct6S42
	 NaIuKwqPvzqMWIFpPTRjVLxg1i9A9cnL+IAn5kjVbXoPl4lRa5ZfBW3NL9fWtf2pBNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WogCzbYB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CEC606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WogCzbYB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0721F1F000C0;
	Wed, 25 Nov 2026 03:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795578755;
	bh=A9JU3+ZINrTICOD4MNu6hjXwjGs62/QFFfia9fmGE+o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WogCzbYBIXRgjtypWfQ+OuGyPFsf9YNeLy7d6WV3rsTMkw716KE2fJOl+WNdZmzLT
	 jyMPlxaP3bgc5IH+3fhgLBZ03cqnW05dhMgg+U9oSjuZNtG5ta66L+tsr3O2zmFA6D
	 AwrhnuC8RP1MiggE/TO5yN08au1gpkdD0JuSb2QtYRu5j8yEJmmAyIzB53nCfMFb3r
	 phb/ynwdA8MHjqih5spGpn128lvmLRDRBliqY2gii+jNCRFz6/gJ2za0dSwPRIy+zb
	 zx3xEvlj5Gqy9XZ/23ik0f9wEz8GAGPI0z1GqvJoPOd1zHDVA5xbgKVkZfHH3gbxEW
	 ESkRSfRERiT3w==
Message-ID: <sashiko-outbox-232523@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: display: add CIX Sky1 DisplayPort
 transmitter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Liu" <Luo.Liu@cixtech.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125033238.3436046-2-Luo.Liu@cixtech.com>
References: <20261125033238.3436046-1-Luo.Liu@cixtech.com>
 <20261125033238.3436046-2-Luo.Liu@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 03:52:34 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] dt-bindings: display: cix,sky1-dp: missing output port and
  aux-bus in schema
- [Low] dt-bindings: display: cix,sky1-dp: unused labels in DTS example
--

commit f212999ac361089d7da2601c852a0ab9252b18bc
Author: Luo Liu <Luo.Liu@cixtech.com>

dt-bindings: display: add CIX Sky1 DisplayPort transmitter

This commit adds a Device Tree binding schema for the Trilinear
DisplayPort transmitter integrated on CIX Sky1 SoCs.

> diff --git a/Documentation/devicetree/bindings/display/cix,sky1-dp.yaml b=
/Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
> new file mode 100644
> index 0000000000000..5095d5daf51ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
> @@ -0,0 +1,102 @@

[ ... ]

> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      Video input from the Mali D71 display pipeline (Komeda) that drives
> +      this controller. The link to the sink is through phys (USB-C combo=
 PHY
> +      or the native DP PHY), not a second OF graph port on the DPTX.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - resets
> +  - phys
> +  - port
> +
> +additionalProperties: false

[Severity: Medium]
Should this schema define ports (with port@0 for input and port@1 for
output) and aux-bus instead of a single unnumbered port?

The phys property only references the local SoC PHY provider and does
not describe the downstream display sink or AUX channel topology.
Allowing only a single input port with additionalProperties: false
prevents board device trees from connecting downstream DP connectors,
eDP panels under aux-bus, or USB-C display graph endpoints without a
later ABI-breaking change from port to ports.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    dp0: dp@14064000 {
> +        compatible =3D "cix,sky1-usbdp";
> +        reg =3D <0x14064000 0x4000>,
> +              <0x14050000 0x400>;
> +        reg-names =3D "dp", "rcsu";
> +        clocks =3D <&dpc0_apb>, <&dpc0_vid0>, <&dpc0_vid1>;
> +        clock-names =3D "apb", "vid0", "vid1";
> +        interrupts =3D <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
> +        resets =3D <&dpc0_rst>;
> +        phys =3D <&usbc0_dp_phy>;
> +
> +        port {
> +            dp0_0_in: endpoint {
> +                remote-endpoint =3D <&dpu0_pipe0_out>;
> +            };
> +        };
> +    };

[Severity: Low]
Can the dp0 and dp0_0_in labels be dropped from the example?  Neither is
referenced, which triggers unused-labels warnings when running
scripts/dtc/dt-check-style --mode=3Dstrict.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125033238.3436=
046-1-Luo.Liu@cixtech.com?part=3D1
