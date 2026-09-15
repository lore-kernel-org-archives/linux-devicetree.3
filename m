Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB10B265621
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467510; cv=none; b=J39brBDjfN7/B3jb5dDdkyUGwSrqZO8MuiviC4tlD/YCRO0ypDs0AGb3Hm5DyunKiIJheYfhWSRUTCwSUWCI1QoPr44DBK+hSvRdpBGbrJxp/87u+4wCtLqUwvc/a8NQmwNKbQ9OV8DJunE4tmSeqNBBUx8IL1QC7++oedjQt9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467510; c=relaxed/simple;
	bh=vReL69FPPbnsoqje8ZeEfGC4xx7KDh6qliZwk4mvW/E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FuNYFbTaV7woGEVDXf6t/6R5HysGoQL2C3NsmOcJKzatNiDLbK3T5JWdJP1RTbS+1GLDrAOpruAONtVZanje0ZDv2Gy+eJaym/TujTyL3BhxPMQbsDKljCfe7xYgY+MCKwE8R21Hh+PPtPCBWXiNRcB1todApnop8cSDT6xa9Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sw1iS5Rv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sw1iS5Rv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D552F1F000FF;
	Tue, 15 Sep 2026 10:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789467509;
	bh=ByhpDgIefluvieKsbyCL+AsvxJJwFJzyBIxtC7pQ2B4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sw1iS5Rv3gO3EWYwUUOwrO6eYWvI42jkT1iIXtjtLzArmzdjFwXK8nPJ+jwbRfO3i
	 lM4MMygkBKh7KxjzLIEYou74LiOvI4kIasAfVXoa/k+CJ8HyC8WmyT0wD1SoLflJgo
	 YEYyK5k/WH9btgNvXmDLArabVpRifS4c5XcrNlK0ZkdVKoXL/xQq5W3YfZ7htjU4iE
	 mghgFONe1QVqsXMDCkzGkp3PzHEAKasreoeyxAa2HQ9mh+jcLFJc9+c86lA+0w8SX9
	 aZ9LWv2+ixt7pjplFLU7h9oiPY09n+6XPgRZpDO0bF7eUhUnWcLCnUU5w6W+WN4GeB
	 eCzI3yy3DTevg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Document MT8196 MediaTek
 PCI-Express Gen4 S-PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, olteanv@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org
In-Reply-To: <20260915101022.23852-2-angelogioacchino.delregno@collabora.com>
References: <20260915101022.23852-1-angelogioacchino.delregno@collabora.com>
 <20260915101022.23852-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 10:18:28 +0000
Message-Id: <20260915101828.D552F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: strict array prevents 1-lane S-PHY nvmem configurat=
ion
--

commit c6841c20d82c1db99761e33c189c44960b8b5284
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

dt-bindings: phy: Document MT8196 MediaTek PCI-Express Gen4 S-PHY

This commit adds device tree bindings for the MediaTek PCI-Express Gen4 S-P=
HY
found in newer SoCs like the MT8196. The PHY supports link rates up to 16.0
GT/s per lane, up to two lanes, and both Root Complex and End Point modes.

> diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-s=
phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.=
yaml
> new file mode 100644
> index 0000000000000..3fd1bfbc3822f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml
[ ... ]
> +  nvmem-cell-names:
> +    items:
> +      - const: int-r
[ ... ]
> +      - const: tx-lanes-pmos
> +      - const: tx-lanes-nmos
> +      - const: tx-ln0-rswn
> +      - const: tx-ln1-rswn
> +      - const: cal-version

[Severity: Medium]
Does this rigid array structure prevent valid 1-lane S-PHY configurations f=
rom
passing schema validation?

Defining a device tree node for a 1-lane PHY typically involves omitting the
unused "tx-ln1-rswn" eFuse cell. However, because the items array enforces
strict positional constraints, omitting that entry shifts the index of the
global "cal-version" cell. This will cause dt_binding_check to fail for
legitimate 1-lane configurations.

Could the schema be adjusted to allow the second lane's eFuse cell to be
optional without breaking the expected position of "cal-version"? Otherwise,
it seems DT authors are forced to either drop calibration entirely or inclu=
de
irrelevant dummy eFuse references.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915101022.2385=
2-1-angelogioacchino.delregno@collabora.com?part=3D1
