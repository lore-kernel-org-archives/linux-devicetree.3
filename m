Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C411F3AC0C9
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 20:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899113; cv=none; b=HGaPOaJAUnghC6uAKYCwFOwNyepFXG4TZBC8F4eG1GE9l1wLwyMjdEsuoVF0hQ3Wm5ZrNq9WujdfKd6BksXhWt3/lWdrmiAPalKYsShLqFO2xOS/t6lBITfTOx/oYHnZSecAB8WqM4oZp6OgnPkRKKv/DJSLCZdziKS8hZja464=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899113; c=relaxed/simple;
	bh=gcTZWkkpwaNyBQVGYpg9/MH+tzevp1RKCVsuoqgIG2Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BPEvMsObPubS1m6jeQWrbiC5NNRGMrz420uT42xugs/1HLu/3vltgqard9HS7w7+ECoQJDPqBfoSC3uH/PsnZzWZAvQPRdHwQuTGIH/1n5FJabxzNVULfDVxPYRYrSS4OWruAjvJ+CHtkWeJFizLwkxyDIzAhib1A7XDFR7p2L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDHOqzzU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDHOqzzU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3432B1F00A3D;
	Tue,  8 Sep 2026 20:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899112;
	bh=qYZLjcvEgIEsulTa+FNPJhtY74BB0px9ODZ/+ln+8zg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kDHOqzzUO3Jv7vfCm04FBzB3HyHzasnQr58wP+iAEwi0dlXAix+4pW4f9Of69pwui
	 YYihzWSuoVt3KKsS0EKrU3GM5s7jXic94lpUASd285i6TEJDac0pRm4oampbLkEy0i
	 0/RKfpXu6huU1Bsy1nouwUZd5iOGtWumSrS4+9KtewTdc9x09ZwtYqxbXBcIPhw6Te
	 FQknZTNrtyf+8BsFu5yUPQrZkDcsT3oNP7A7K6WKq+tVCAmfj+boLF/pHsxvTPqvyn
	 EtyO5mrr16YTcd1YnbQmf2YR7MYLr4puQRP9lr1wGSgvnGOGcsbsFKAm/YtBsmfPo5
	 zsIFSeFOncr2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 3/9] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908-shikra_ethernet-v2-3-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
 <20260908-shikra_ethernet-v2-3-bbe3389d0652@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 20:25:11 +0000
Message-Id: <20260908202512.3432B1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing array length constraints (`minItems` / `maxItems`) on `cloc=
k-names` in conditional blocks allows mismatched `clocks` and `clock-names`=
 lengths to pass schema validation.
--

commit 53e47f10606b15f76c5e6798405fb948136930d0
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

dt-bindings: net: qcom,ethqos: add qcom,shikra-ethqos compatible
   =20
Shikra's EMAC requires two additional clocks for NOC interconnect
access. This commit adds qcom,shikra-ethqos to the compatible enum
and an if/else block for clock constraints.

> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Doc=
umentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 423959cb928d9..ad2cc706fa740 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
[ ... ]
> @@ -92,6 +99,41 @@ required:
>    - clock-names
>    - reg-names
> =20
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,shikra-ethqos
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6
> +        clock-names:
> +          items:
> +            - const: stmmaceth

[Severity: Low]
Is a minItems: 6 constraint missing for clock-names in this block?

Without it, this property inherits the top-level minItems: 4, which means
a device tree node with 6 clocks but only 4 clock-names could silently
pass dtbs_check schema validation.

> +            - const: pclk
> +            - const: ptp_ref
> +            - const: rgmii
> +            - const: axi-noc
> +            - const: pcie-tile-axi-noc
> +      required:
> +        - operating-points-v2
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +        clock-names:
> +          items:
> +            - const: stmmaceth

[Severity: Low]
Does this block also need a maxItems: 4 constraint for clock-names?

Without it, clock-names can match up to the top-level definition's 6
elements for the older compatibles, allowing mismatched clocks and
clock-names array lengths to silently pass schema validation.

> +            - const: pclk
> +            - const: ptp_ref
> +            - enum:
> +                - rgmii
> +                - phyaux

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-shikra_eth=
ernet-v2-0-bbe3389d0652@oss.qualcomm.com?part=3D3
