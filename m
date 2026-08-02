Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C04E1F8AC5
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 14:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785680743; cv=none; b=IUIb4C4qCpENqEmg+n4siP59HCkwKgZl1Z1qvB3gCe93MhqM2DMaQBcVYBHXLy1Duog/xZmWe7kJz2Zvmro/RUZiwaEtO1ajTKqSORGwwKIs8TlVDnqAx3cPK9TmmHnmmCff/MXpEiJ1i6xFgDzYBvTawhotNxXmKdp1XcRQaYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785680743; c=relaxed/simple;
	bh=RwTkkoo09rzXl1Rv1pIHKH7OlctYdIBL803jIMHs97U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O6AJWYeA0gtRLE/a5cKwfyN548Jy/R+i2lKIhgShQj/ecGS13s4eUUeSPZ1eGZkK7tk0D6INUYPU1UzqwhUJWXeJvMWm2+RKesU+USSUVCFSYN1iljeWLNcH/Qk7VbLbBD4Wgf2NN3JKrXU3g32zfv30VBw7tUdGOiBZog594ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PoEtBlY/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PoEtBlY/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395631F000E9;
	Sun,  2 Aug 2026 14:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785680742;
	bh=L+E1mF6rZDCHYzAMlcdWAOgrc1pmDLuOneN2jwhlMgo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PoEtBlY/+DIHBNcXSfyYq3KCNL5uCkUd5+JKKFmw0iPnp2kgLWgZo+d2WCtdhRaP7
	 QWii7p4Un5Huy8/5YNlYJUG/OddgchElYtbmnNdztIlRkxOTk7g1UE+7vtrUbhAheS
	 dnGMD0AkS1ZtHOWB/Lmm8ur4aB395wHPyaMu2C8nOdsXMHctTWr1LZ02AjazcgSIzd
	 Zi6br2rttZmuDYvj1IkwEVNl7TszWwPKrEZUNMdsYr/NSbPxhWGB1K/bz+FUBqWND3
	 wLeHoJNcoh6OMqtfJ4S9WJsYUvdiVdMlRf3ovqav8I0QbPPbhd1X4m7E7W7Kzs8NCb
	 M/ApS2kEr862g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/10] dt-bindings: phy: rockchip: naneng-combphy:
 add rockchip,sgmii-mac-sel property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: wsa+renesas@sang-engineering.com, neil.armstrong@linaro.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20260801142244.679437-4-coiaprant@gmail.com>
References: <20260801142244.679437-2-coiaprant@gmail.com>
 <20260801142244.679437-4-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 14:25:40 +0000
Message-Id: <20260802142541.395631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `rockchip,sgmii-mac-sel` property is defined in the device t=
ree bindings but is not implemented in any kernel driver.
--

--- Patch [2]: [PATCH v2 02/10] dt-bindings: phy: rockchip: naneng-combphy:=
 add rockchip,sgmii-mac-sel property ---
commit d067678ae28ccb1e1d1f20a8cb8013f22a387abc
Author: Coia Prant <coiaprant@gmail.com>

dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel prop=
erty

This commit adds the optional rockchip,sgmii-mac-sel property to the Rockch=
ip
Naneng combphy device tree binding. The property is intended to allow routi=
ng
the SGMII interface to either GMAC0 or GMAC1 via GRF registers.

> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-co=
mbphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-comb=
phy.yaml
> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.y=
aml
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.y=
aml
[ ... ]
> @@ -80,6 +80,15 @@ properties:
>      description:
>        Some additional pipe settings are accessed through GRF regs.
> =20
> +  rockchip,sgmii-mac-sel:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]

[Severity: Medium]
Is the driver implementation for this property missing from the series?

The device tree binding defines rockchip,sgmii-mac-sel, but it appears
no kernel driver currently parses this property or writes the corresponding
configuration to the GRF registers.

Without driver support, boards relying on this property to configure the MAC
will fail to route SGMII to GMAC0, leaving it at the default GMAC1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801142244.6794=
37-2-coiaprant@gmail.com?part=3D2
