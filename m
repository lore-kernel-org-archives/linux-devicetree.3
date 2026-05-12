Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2918314A6B
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778552155; cv=none; b=kDgmB0+mewzgrN+qtyvGncu6hWZps0elCQNB2ryL2qw9CkUOVpSuI+m+Di66fXaVt0Xke5ROJVWr2/eruygTfWNOdMZfv7plxsOK0QfC6LsJM4Y2+jSK79nHlSs35Lq4EtuXzDzaN/R0LQ/l4L0L/UO5htO9KmdK1BqndRKCzjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778552155; c=relaxed/simple;
	bh=BBlc+zGlcNXpE4i2WLTcytr5vQFGoLv9Ei0/KW3pCcU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KNGV981PmfWKUnNdji+9ZToE7tJjQzrBt8Raaf1VveO61nP84Up8QJViB0V+h3rBufSoIglYgPb9xFt9p837S29gg97v/liy8m5Nl/ZsIfZB0BbNk8U2R/KaEMxQ6QfBWkav/HMG7zFgJ8KHzwNngla9Oc6V1XgEjGDvIKVhbFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UhTF0SaB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UhTF0SaB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 188C6C2BCF5;
	Tue, 12 May 2026 02:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778552155;
	bh=BBlc+zGlcNXpE4i2WLTcytr5vQFGoLv9Ei0/KW3pCcU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UhTF0SaBTukvSEzJUn6x3EOvyi7Eq4jFRi6f/RcA53luGJ6n07KCwcYZPmCZsxYMv
	 4NYK+iVXPf67vgDCk7g00/Lk/76yYdpW0rYghDcB4PiokBsD+xxF5H6oAG2t5rRwZp
	 9YzRNGW4RQ29luNJuG4DcDgC1TcSClAJMNaWxyD/n+ZrCRmZK+QBkViY/evAeh/W3B
	 XXfEPeVC/eL3vYc8JOIma1dNm696tfje6huIUUXEX1J1tXnFy/l3CLQK2jZGPt8ecQ
	 9FDNLX2D6fpVUdaZmtxn9DZm3l1uAr+9Scx6BcP5XqTJTy4ux7BM7dl1keCO+cSCqa
	 w0DeWoSCRNb0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 4/5] dt-bindings: mfd: Add binding for MediaTek
 MT6363 series SPMI PMIC
Reply-To: sashiko@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260511101355.122478-5-angelogioacchino.delregno@collabora.com>
References: <20260511101355.122478-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 02:15:54 +0000
Message-Id: <20260512021555.188C6C2BCF5@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding provides interrupt controller capabilities but fails=
 to list `interrupt-controller` and `#interrupt-cells` as required properti=
es.
--

commit cec0b2a5ba52ef89e1723a3c01379c0aecebc8fa
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

dt-bindings: mfd: Add binding for MediaTek MT6363 series SPMI PMIC

This commit adds a device tree binding for the MediaTek MT6363 and MT6373
multi-function PMICs connected over SPMI. These PMICs are found on board
designs using newer MediaTek SoCs.

> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml b=
/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
> new file mode 100644
> index 0000000000000..ee90d16053e93
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml

[ ... ]

> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 3
> +
> +patternProperties:

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'
> +  - '#size-cells'

Should interrupt-controller and #interrupt-cells be included in this
required list?

The binding provides interrupt controller capabilities but omits the
corresponding standard properties from the required block.

> +
> +additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511101355.1224=
78-1-angelogioacchino.delregno@collabora.com?part=3D4
