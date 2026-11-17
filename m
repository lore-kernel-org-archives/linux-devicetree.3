Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883930;
	b=AKGwoY8EDYz3TEk9auMj2RTtCqlU+3WJHZpnxheu0RrEzpNUlUyNv9daV5oXN/HDUsjr
	 /3WdiT+SY+HExp4vsojVPpHCxu0IJ0L7FQ3dhgdOyJhEa8LL7tqZLR8Qm0DE6ji39fXF7
	 61f8gikzFIaclD23GPTEviCJAtcIrNgITGTj3ouKd0HKQv1wn4d7r6KeVkV04PXTLkTTn
	 SgJDLuiN3Co8q5Kz9nD6D0TyHkHp+OHwdUfKtKVtSe5gdWgdGS6q0AXqfcZMStg/CUKjH
	 uxCojWfOp4gpK3GIqKwVJn2FAcpeSoXfdbwTKMjrE5/c+rVvxsD4dSq8KzfXHQGHn9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883930;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qq/tiHdgbGvoi14diuTvjCXYv+VWfbbS/T65lFWDJCw=;
	b=HiHDqSrARbov0eT3jaVdaJxV+/lrWorL8QjuOJ9o/+e+H3NHzJ/86gHTgiuFLGfLSteP
	 a2POFU8D3YW8X99O7JOs3sLyIHMsvINyCOwjrhTCGvpyz3oRdCR02d23S+egXEUu1G4V4
	 tjK1F0jI3j66HoVja8pxO7x03BlKhiMm97/KWDFl6r7CLtVUFXDyBm+SiLCpEj39CLlOZ
	 RhCvciKvPs6tqvpOGVuSCyx5d/M+zcYYI1eq06FeFBYa7DzxAr4NpOV7qiUMtN+8LrDb0
	 LL2RF2BE19ZPt9qG0BcfTRBg575lNj63X//ct90LkCvh+oZLmtvbQmHi3vVxYWpOTZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KcVtcIgV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7371606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 02:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KcVtcIgV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 163851F000C4;
	Tue, 17 Nov 2026 02:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794883930;
	bh=qq/tiHdgbGvoi14diuTvjCXYv+VWfbbS/T65lFWDJCw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KcVtcIgVgRlvNSDQFKHwERo8S49R1pGsJKGekUysWSAPtrH/NxK3rfm+O5tm6Pry7
	 rBcIe61Qy4EaIZfiFwsw4yU3JDCFmSm1pD4VfmzGD9eoSqGwb6QvVvxAeBvOU71DGl
	 zNrVHUfPPFQaTgdv5732D+xsYCXJKHcoUFM1zZpw6oWJGmIVrHJMmcj+tzYVYPhF8F
	 4E1XTWM8JL7AHvrAuyzZZBy/npxFqtYsGbqEV/zorjAU1B+k1FBjpLu/7nfujzkzTk
	 KmBFmZgfWSe54LOrxzuvsc1D48aER0G8LLfbKtXl3/l7W9SvOYTbiozT4ArrUaXqNH
	 gZdfmRUJHsPAw==
Message-ID: <sashiko-outbox-218097@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Yang" <hongliang.yang@cixtech.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261117022858.2210212-2-hongliang.yang@cixtech.com>
References: <20261117022858.2210212-1-hongliang.yang@cixtech.com>
 <20261117022858.2210212-2-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 02:52:09 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: phy: cix,sky1-usb3-phy uses #phy-cells =3D 0 for
  two-lane PHY
--

commit c8a29919e01294d52dd3eac0bc1ce8854b5d00a0
Author: Hongliang Yang <hongliang.yang@cixtech.com>

dt-bindings: phy: Add CIX Sky1 USB3 PHY

This commit adds the Device Tree binding schema for the CIX Sky1 USB3
SuperSpeedPlus PHY and updates MAINTAINERS.

> diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml=
 b/Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
> new file mode 100644
> index 0000000000000..205140bf84e7c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/cix,sky1-usb3-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CIX Sky1 USB3 PHY
> +
> +maintainers:
> +  - Hongliang Yang <hongliang.yang@cixtech.com>
> +
> +description: |
> +  The CIX Sky1 USB3 PHY provides the SuperSpeed lanes of the USB3 Type-A
> +  ports of the SoC.
> +
> +  Both lanes are programmed through one register block and share the
> +  same clocks and resets, so the node is a single PHY provider with
> +  #phy-cells =3D <0> that all consumers reference. The driver reference
> +  counts phy_init() and phy_exit(), so the block is set up once for all
> +  its consumers.
> +
> +properties:
> +  compatible:
> +    const: cix,sky1-usb3-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0

[Severity: Low]
As reported by Krzysztof Kozlowski on v6 [1], shouldn't #phy-cells be 1
instead of 0 so that each USB3 controller consumer node can specify which
of the two PHY lanes it is connected to?

The hardware block has two distinct lanes with separate per-lane register
sets serving two independent USB3 controllers. Locking #phy-cells to 0
omits the per-lane routing from the Device Tree ABI and prevents any
future per-lane control or tuning without breaking the binding. Also, the
description references Linux driver internals (phy_init() and phy_exit()
reference counting) rather than strictly describing the hardware.

[1] https://lore.kernel.org/r/20261105-kind-macaque-of-enhancement-ee0365@q=
uoll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117022858.2210=
212-1-hongliang.yang@cixtech.com?part=3D1
