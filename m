Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A35E345CD8;
	Mon,  1 Jun 2026 06:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780297193; cv=none; b=ON6nm/w0Gm7wMWO2ztuLYLQWzs08+Ej+xiTI+SPTAg6fgQgJWRzzPHoDMddSiGI07oglNRainrQjjzebIqFB4lkBw6hfgyr5jp9AltajFVc50w3EPPnJ6EHFy47Bdrg5T99fQsGz4Be9+wcdyhypgNOKZkgEbjwgtmULQEM1QjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780297193; c=relaxed/simple;
	bh=B0Pj6WT4oXE+nl+fmezXsKTRwJhBalayvj5k67U+TW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nZa4MABKy+1nFf1jlV5YTDYS5iFBDOSNwMwROg2KJBQYRxIbZg41+eqEJYLroyLbekOk8TJc0zofFS93dlJXuU8uOL4/E4Y1cSWuQ0Ipf8VUFga4Ke0lYVe2ea3bZu5Jo0HqCMZf9iLuhk3Zajg3f4hj+0j0AlkVhMq8HSfk8Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=AVod6Zd/; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="AVod6Zd/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=iTV5J9c1q6vU4HfXaFRAppoi5WMSCM3q+VMiSk/mHIo=; b=AVod6Zd/wLpW1zV3QJyTjcYH+k
	qKq2Ly5mppBJmHYvWHjO1a2PpnPcysbt8HekijajAh60PTW3cD9F7fH9SEz6sGqHyLI1HAm3lPxnK
	Ul8TQeyanb189L3nQiVI0hmjLEttTu8RSpz6IGjVTUkj9f2I8bs+pqnJ0x4vL/dU3j01TjM+1K6us
	VMWov7ANnX6p2ubsMCQI3z33e4jzgP4na4uq6W7xWz+YJ/7rZWuBSeirN08A+OcCOPrSWVocO91dq
	4pf+6XduOvybNiCCnisZD0mnRw1TLAUy4yG/igytrAEJWn4q18hTHmv30inxPMkoWy1cYw+BPUWwf
	tQAW8cFQ==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wTwEE-000DJL-1d;
	Mon, 01 Jun 2026 08:34:26 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wTwEK-000IYB-1G;
	Mon, 01 Jun 2026 08:34:32 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-phy@lists.infradead.org, Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tanjeff Moos <tanjeff.moos@westermo.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Subject:
 Re: [PATCH v2 phy-next 13/15] dt-bindings: phy: lynx-10g: initial document
Date: Mon, 01 Jun 2026 08:34:25 +0200
Message-ID: <2842502.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260529171509.1163787-14-vladimir.oltean@nxp.com>
References:
 <20260529171509.1163787-1-vladimir.oltean@nxp.com>
 <20260529171509.1163787-14-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28017/Sun May 31 08:27:13 2026)

Hi,

Am Freitag, 29. Mai 2026, 19:15:07 CEST schrieb Vladimir Oltean:
> Add a schema for the 10G Lynx SerDes. This is very similar to the modern
> form of the 28G Lynx SerDes, which is very much the intention.
>=20
> We allow both forms of #phy-cells =3D <1> in the top-level provider
> and #phy-cells =3D <0> in the per-lane provider for more flexibility to
> consumers, and because the kernel code is shared with the 28G Lynx which
> already has that support for compatibility reasons.
>=20
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Cc: devicetree@vger.kernel.org
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
>=20
> v1->v2:
> - move patch later in series, right before driver
> - deliberately ignoring this Sashiko feedback:
>   https://lore.kernel.org/linux-phy/20260529125017.ifqunh52gdzhthdg@skbuf/
> ---
>  .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 131 ++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Do=
cumentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> new file mode 100644
> index 000000000000..993f076bba4e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/fsl,lynx-10g.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale Lynx 10G SerDes PHY
> +
> +maintainers:
> +  - Vladimir Oltean <vladimir.oltean@nxp.com>
> +
> +description:
> +  The 10G Lynx is a multi-protocol SerDes block which handles networking=
, PCIe,
> +  SATA and other high-speed interfaces. It is present on most QorIQ and
> +  Layerscape SoCs. The register map is common, but the integration is
> +  SoC-specific, with the differences consisting in register endianness, =
the
> +  number of lanes, protocol converters available per lane and their loca=
tion in
> +  the PCCR registers. Some SoCs have multiple SerDes blocks and those di=
ffer in
> +  their protocol capabilities per lane.
> +
> +properties:
> +  compatible:
> +    description:
> +      There is intentionally no generic fsl,lynx-10g compatible string d=
ue to
> +      the hardware inability to report its capabilities, despite having a
> +      common register map.
> +    enum:
> +      - fsl,ls1028a-serdes
> +      - fsl,ls1046a-serdes1
> +      - fsl,ls1046a-serdes2
> +      - fsl,ls1088a-serdes1
> +      - fsl,ls1088a-serdes2
> +      - fsl,ls2088a-serdes1
> +      - fsl,ls2088a-serdes2

Silly question: What about LS1043A? AFAIK it has a single serdes block.

Best regards
Alexander

> +
> +  reg:
> +    maxItems: 1
> +
> +  big-endian: true
> +
> +  "#phy-cells":
> +    const: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^phy@[0-7]$":
> +    type: object
> +    description: SerDes lane (single RX/TX differential pair)
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 7
> +        description: Lane index as seen in register map
> +
> +      "#phy-cells":
> +        const: 0
> +
> +    required:
> +      - reg
> +      - "#phy-cells"
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,ls1028a-serdes
> +              - fsl,ls1046a-serdes1
> +              - fsl,ls1046a-serdes2
> +              - fsl,ls1088a-serdes1
> +              - fsl,ls1088a-serdes2
> +    then:
> +      patternProperties:
> +        "^phy@[0-7]$":
> +          properties:
> +            reg:
> +              minimum: 0
> +              maximum: 3
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      serdes@1ea0000 {
> +        compatible =3D "fsl,ls1028a-serdes";
> +        reg =3D <0x0 0x1ea0000 0x0 0xffff>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        #phy-cells =3D <1>;
> +
> +        phy@0 {
> +          reg =3D <0>;
> +          #phy-cells =3D <0>;
> +        };
> +
> +        phy@1 {
> +          reg =3D <1>;
> +          #phy-cells =3D <0>;
> +        };
> +
> +        phy@2 {
> +          reg =3D <2>;
> +          #phy-cells =3D <0>;
> +        };
> +
> +        phy@3 {
> +          reg =3D <3>;
> +          #phy-cells =3D <0>;
> +        };
> +      };
> +    };
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


