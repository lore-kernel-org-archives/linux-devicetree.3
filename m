Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689E52010EE
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 23:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783122144; cv=none; b=GU9LIHNp1einKJJB0uNjxQfVLqlflowEzOttGTTY/M6BT6K3W42uqPI8IOlUMUKwaGGFyj1WvuAPfyfWMbJ9SQsWWlDNOr+v1edhnw/pZghI1Z75/aWM9Aoojz23/K/LK6eKMMLH0w7WhufKiXLWphINi/IvspXa3LkliGHslBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783122144; c=relaxed/simple;
	bh=As2HAU5PuUJGendqz7wx3wFpfm0bI/OBSJZ7047wzOM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SwyOs3XzBDR6EGSd4Sg25AML5CLw6QGPiYQPKWdFwJjczyWwTtgHsU1QdyJu0+WmCf4e3C9BcOX1u4/64FEAtAzZ3Kthxl2+PAQPJQcbKSwHfxeSurk+4ofPGmR8EtnDA2nKeHwh3i6J2fGzqy2X+mCTUcpfAOvEVkCDHPVPrlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2J3/49S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2J3/49S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECFB1F000E9;
	Fri,  3 Jul 2026 23:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783122142;
	bh=OREPypUrPgy4y2miTeLz+RdBIlQ2Bblm2hWF7JX0EKo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D2J3/49StCzrp9LNOYpdmmjaUhYUmzy+QAzQRkzf8syH25cDfWLG9oatvKgNVpKIJ
	 m1xA8eWzsIj0GgCHMXvHIBwkysRTIXKZ/UqetguH+dPq7Obj4bmpq03Ks9BXbBcBA3
	 C3VOpfOp5trQvIkWucfDcXZ/Wz8wTlgOYEWRQtj/lBltKfVmcHrBVS0o54ChbSmdMD
	 uMyq2fWLOrNzllRKiwUv+JXgfQT7dMfMx88xRxP3gKaPFFIwxDfY9sunTv3Bx8ghUE
	 nxCVe/nNEo68HEx8CJurS/nKYWbZ+012cCxqUekJItRSaVRPd5uskIZgKpkEN9tllJ
	 dZJwNScivYz2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 01/36] dt-bindings: phy: rockchip-usbdp: add
 improved ports scheme
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-1-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
 <20260703-rockchip-usbdp-cleanup-v10-1-a392711ca8a9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 23:42:22 +0000
Message-Id: <20260703234222.7ECFB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Typo in the deprecation keyword ('depreated' instead of 'deprecated=
').
--

commit 80cbcd5498584cd573a979a5b4e236da93d09776
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

dt-bindings: phy: rockchip-usbdp: add improved ports scheme

This commit introduces a proper port scheme to the Rockchip USBDP PHY bindi=
ng
to support USB-C DP AltMode, replacing an undocumented scheme. It deprecates
the single port node in favor of a ports node containing multiple specific
endpoints. The new design roughly follows the Qualcomm QMP USB4-USB3-DP PHY
controller binding while adding an additional port for the USB-C SBU mux.

> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yam=
l b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
> index 8b7059d5b1826..35d6717b9cc9e 100644
> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
> @@ -110,10 +110,34 @@ properties:
> =20
>    port:
>      $ref: /schemas/graph.yaml#/properties/port
> +    depreated: true
        ^^^^^^^^^

[Severity: Low]
This isn't a bug, but there is a typo here ("depreated" instead of
"deprecated").

>      description:
>        A port node to link the PHY to a TypeC controller for the purpose =
of
>        handling orientation switching.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-rockchip-u=
sbdp-cleanup-v10-0-a392711ca8a9@collabora.com?part=3D1
