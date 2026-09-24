Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0F9253B58
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790219970; cv=none; b=RjKrS7PRrtUe0SqivTqNRXzpKs1bwMnp9R/8fZzPgd9v9NoOkXMyRfeSDe+cuOo7iiZdDoGnALQ/I5vVoDxR43cKPoUou+xryW4My5YLhjkpgonsnI6sRYCO68kq8cpjinD0oic8dFfu6wJPy8UQMMptvL+/6RtTKLWva0msemE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790219970; c=relaxed/simple;
	bh=Svz3RD7HhJrFVPbxWHnrhBFifHWyWx5gP5JaNZWTsOU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b1GR8udArrRjhcuWuN+sfO7r7WXskc4r9trzYyeLoArqOr1oxw9Ve9MUTuJwk2d7FyHs03bcGL9HgVMYgEfXxelhGZ8dFYAedrZcLle/rT/gCZm7Elsw8ZN5CrFH6kWwTOmdZ2ZRi0A2OewSK0SCK3bLXIWR0vWJCeFFlg1SCWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCVShHTa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCVShHTa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEFC1F000FF;
	Thu, 24 Sep 2026 03:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790219969;
	bh=7WhwL1sqN3udfXN1kdB6U3QdSp5ucClJjUrIPOgty+Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OCVShHTazpt/84pquiJT4HMi8bejTGMmDfLd7hH/AEMzubq11397EQ/lYe6SFFkVS
	 EcVaCVNjNpCIz2Vh5jlBXl/L0ZEzi8/AaLC+sfZwPSAR2KmxPN60OYPRS/j/Sg/5uR
	 LTEZMibUCCfTEnYDSQKbyVOsITOErmlYtKcIMOY9CQUe75zuK8FHK0xvsXWu/oXCtW
	 xID92wJ/MPsrNdOI5i0SDaRQ9e8dMfIcWF2x7bNiKu+bdzZ20Iarqsp5JCTlLcBUFo
	 C0tSCU57bPCCumdCKJ76bmx7E2CBrKN1TfrX694GzxzoiZD75A/glThgNYhARvAf2V
	 c73ikkkb2oDrg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: spi: mediatek: add
 mediatek,spi-ipm-v59 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tim Kuo" <Tim.Kuo@mediatek.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260924031211.2199921-1-Tim.Kuo@mediatek.com>
References: <20260924031211.2199921-1-Tim.Kuo@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 03:19:28 +0000
Message-Id: <20260924031928.DEEFC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: spi: mediatek: placeholder mediatek,mtxxxx-spi used
--

commit fada8f8666ea668750d2860cbb190b105cbf5cde
Author: Tim Kuo <Tim.Kuo@mediatek.com>

dt-bindings: spi: mediatek: add mediatek,spi-ipm-v59 compatible

This commit adds a new compatible string "mediatek,spi-ipm-v59" for the IPM
v59 SPI IP, as it needs its own fallback compatible rather than reusing the
earlier "mediatek,spi-ipm" design.

> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.ya=
ml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> @@ -39,6 +39,10 @@ properties:
>                - mediatek,mt7988-spi-single
>                - mediatek,mt8188-spi-ipm
>            - const: mediatek,spi-ipm
> +      - items:
> +          - enum:
> +              - mediatek,mtxxxx-spi

[Severity: Medium]
Is "mediatek,mtxxxx-spi" meant to be replaced with a concrete SoC name?

Device tree bindings must document the actual hardware SoC variants. In
properties.compatible, this placeholder will cause actual device tree files
using the real SoC compatible string alongside the "mediatek,spi-ipm-v59"
fallback to fail dtbs_check validation, while incorrectly passing the
meaningless "mtxxxx" placeholder.

> +          - const: mediatek,spi-ipm-v59

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924031211.2199=
921-1-Tim.Kuo@mediatek.com?part=3D1
