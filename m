Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DE7329E7E
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 15:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215318; cv=none; b=OX+26zQQUyIdTkaiD7s4X+nwWMEnOD7yrN3HjBzfj6oq1pCePm4ux3X1hSi9KSkPaCuzYSNvQ4tO7LJpC+oJlBB+QQxx+UpdMssN063KShdixxZnTjOzSwDnEIOeS3M3brZhz2RZGHk0JjppG1Wvr6wdJMcJzdRkcgsPWgTd2/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215318; c=relaxed/simple;
	bh=OGMzEMEG3WfNwxZwGGOgjcZAQegRGVI8o42Jzlh86FQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eGNzjQ3lu12nEDwri6wPTpR+BGKG4DzjhsQvN5H1Th56YQoWhFHGLOSdfy5GFfJiFx9DDk6JKtO2s95pzbjWAsqcKHZhF9T6bxkLJAcyhGzwiYlvh3JTehKzTSWuLn+z1cO09b6fkwkDG0x0jitQOuUtFXYnq0QIBZu8MfmakRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djbPzk3Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djbPzk3Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0A01F000E9;
	Thu, 16 Jul 2026 15:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784215316;
	bh=0uJAqNPqRN9zFKpe4rToI06McO8LVIzTQsp8TngAvRA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=djbPzk3Q5ANtO9OSlKcgBDhmNNKFMoVzXq1Vme86QZ5xjiW4m+A76OYSZbemSVHnK
	 wCZGPflDbJFmy21Drj6iPAigv3ev/nH9vA8vlSBJdhqYDg7AiFGVvaZY2DCqrEQsPG
	 x9HCsao9m9Y+pN6SRvThiPhup5Xcyb58/L/Z2QR2iBNs6GsAQniM0yPRT7LK790xxY
	 jvVcokrIeElM+jn3Ej/XLoCVMX8jcO/6oZ9CPacQiz5tOojpgnwJUOgsXNW3k2XCfN
	 oRcEC3BmF8lz89djONHD8LT8uU3eNVhdNsT6sIkkAVwWx7XoIwT4iI10LnpPD6dG7o
	 txajBWOD1kkFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: Document MT8196 MediaTek
 PCI-Express Gen4 S-PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org
In-Reply-To: <20260716151333.77254-2-angelogioacchino.delregno@collabora.com>
References: <20260716151333.77254-1-angelogioacchino.delregno@collabora.com>
 <20260716151333.77254-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 15:21:55 +0000
Message-Id: <20260716152156.2D0A01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing upper bound (`maxItems`) for the `reg` property array.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: phy: Document MT8196 MediaTek PCI-E=
xpress Gen4 S-PHY ---
commit 46cb0bc5744a1aaeece570f9d383cc948bbcab79
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

dt-bindings: phy: Document MT8196 MediaTek PCI-Express Gen4 S-PHY

This commit introduces the device tree binding documentation for the
PCI-Express Gen4 S-PHY found in newer MediaTek SoCs like the MT8196. It
details the required properties, nvmem cells, and power domains for this
hardware.

> diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-s=
phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.=
yaml
> new file mode 100644
> index 0000000000000..2b61882c402c2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: mediatek,mt8196-pcie-sphy
> +
> +  reg:
> +    minItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: sif
> +      - const: ckm

[Severity: Low]
Is an upper bound missing for the reg property array here?

The schema defines minItems: 2 but omits maxItems. Since reg-names explicit=
ly
defines exactly two items, should reg include maxItems: 2 as well to fully
bound the array and prevent potential dt_binding_check validation warnings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716151333.7725=
4-1-angelogioacchino.delregno@collabora.com?part=3D1
