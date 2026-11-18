Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795045543;
	b=dRjjt4DW62tgxS295Am9LjJzg8g17y9pBq/dcQF9ZNRbLR5tTL3+3XJy+BOi7Jmd9lvs
	 vpdhuVPktjN8aSRbOHDSvIBhBt3Aqz1L5DnBPjzJK3BE5tbe+mw7O6OTVNAG/NG6n/eEw
	 evQSZ+4mvMdNv6M0rL6i1nakU2LJDDtCw/bvLMLV6+Yb956Cg0uydejUguy3x+PNnXg2H
	 HUPLZXnZURqM1ybm2O8CowtbAKwOue/8I3V3TUexlWUhjSngG8EnoVtHDmHjQoIxDW+Lx
	 ja8Se8VFEPsFPV0+jzQvwNcrtXdZc89ZH031Z5LwGAOpttnjJSVSP3W9irS0EltG/Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045543;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SDq/7HeavZWLrUn2sveBygU/FnOm/anjslJbPK5KqIA=;
	b=gh4YErlD1vRO5lalECkIGxIfVYdfAvCbfsfnB3wnqJ62TKl2KyoKg7PaOfVcOF5HdXu4
	 F2MbxmAWiYvFRggh+R9TSuEjbFt8hTON7NrDsvCD9ssa41F55xj985+oxxcwRiYvTvdDh
	 FItng53s8DYcnjFAv2+lsgcVJjvQIQ7PCQUf3XZ+d/5GfP/5G9Dw8GwzSNGRGYXsu0NLh
	 7DnDkaX27AHsYZUMsa8zLtn8a/WeUsaxN8zIk8ZvCjdb7CdbGxFGU9qy46Bp4J/LaSUIZ
	 Fg9B+vnsVnaWxaqYO457FJ/vUDVBMSSP8mP0iDU1kEI6EAx/6RFO+KDlSYcPWVy3BVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="No/t7f+k";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3B4606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 23:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=No/t7f+k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB011F000C4;
	Wed, 18 Nov 2026 23:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795045543;
	bh=SDq/7HeavZWLrUn2sveBygU/FnOm/anjslJbPK5KqIA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=No/t7f+kl/9hmDn4DEiZcmPKBb9vRgGFBOdaux+blu5b1LM535ufCugf7PA3Zg7Oj
	 h23V5TFF6sUC0oWUCDhy71twKNfdwxmjc+eNEraQ9plXPfl5pMej1A2afQQdbiRgkk
	 jjRv0eI6NfHuUuwWmuaYtG5b7xoa0g06P2UFHakc57+2cGpWCJ8lrpXnHrbobtO3wa
	 /MqM5TV8WxWN2Kk28ejbER36k8TZZO5l+Asby3GQRsKVyC3JV7pKHnXfr22GT4ey1Z
	 k6yt5QarNNkmGy9184khwDO33ypEz9TV1V/A9HQb2HoIlXYIMCqJFbKaLm8ABjW8qn
	 yXKVDK4p3NwjA==
Message-ID: <sashiko-outbox-222209@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/15] dt-bindings: soc: xilinx: Add Versal AI Engine DT
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregory Williams" <gregory.williams@amd.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118233211.4121361-12-gregory.williams@amd.com>
References: <20261118233211.4121361-1-gregory.williams@amd.com>
 <20261118233211.4121361-12-gregory.williams@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 23:45:42 +0000
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
- [Medium] dt-bindings: soc: xilinx: xlnx,firmware-device-id duplicates
  power-domains
- [Low] dt-bindings: soc: xilinx: DTS example fails dt-check-style in
  strict mode
--

commit b6e53e2eec4c5f256b86a96092363aef4bc4fe16
Author: Gregory Williams <gregory.williams@amd.com>

dt-bindings: soc: xilinx: Add Versal AI Engine DT binding

This commit adds the Device Tree binding schema for the AMD Versal AI Engine
tile array processor.

> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.=
yaml b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
> new file mode 100644
> index 0000000000000..6c97b5f0fb036
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
> @@ -0,0 +1,61 @@

[ ... ]

> +  xlnx,firmware-device-id:
> +    description:
> +      Device identifier as defined by Versal firmware interface. This va=
lue is
> +      passed unchanged to firmware calls.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - xlnx,firmware-device-id
> +
> +additionalProperties: false

[Severity: Medium]
Should this binding use the standard power-domains property instead of a
custom xlnx,firmware-device-id property?

The value 0x18224072 in the example below is PM_DEV_AI from
arch/arm64/boot/dts/xilinx/xlnx-versal-power.h, which is the Versal firmware
power-domain node ID used by the xlnx,zynqmp-firmware power-domain provider
(drivers/pmdomain/xilinx/zynqmp-pm-domains.c).  Existing Versal drivers that
need the PM_DEV_* ID for firmware calls obtain it from power-domains (for
example, cqspi_of_get_pdata() in drivers/spi/spi-cadence-quadspi.c).
Omitting power-domains with additionalProperties: false also prevents DT
nodes from referencing the firmware power-domain provider.

> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      ai_engine: ai-engine@20000000000 {
> +        compatible =3D "xlnx,versal2-aieml";
> +        reg =3D <0x200 0x00 0x01 0x00>;
> +        clocks =3D <&aclk0>;
> +        clock-names =3D "aclk0";
> +        xlnx,firmware-device-id =3D <0x18224072>;
> +      };
> +    };

[Severity: Low]
This example triggers indent-unit-strict and unused-labels warnings under
scripts/dtc/dt-check-style --mode=3Dstrict because it uses 2-space indentat=
ion
instead of 4-space indentation and defines the unused label ai_engine.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118233211.4121=
361-1-gregory.williams@amd.com?part=3D11
