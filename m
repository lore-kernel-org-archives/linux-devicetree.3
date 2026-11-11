Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367388;
	b=2a9OYccsT5zvMPEp7Ydi9ZGekKaWLfvGhQ7CKk1BKKOksTue3Nl8bGcVZCNOHotdndpo
	 ETPBmazPrqQFXKrfHTKRswNmNEBNGcdcoRrgaI+HDd2pKj0CtM+gltYcQrgozKihTTDa9
	 9TJM5BzvbHXgq1dgSzpV0QlEYPGDEVSB+Uwb6Oo9sFHEcsY+K72vzkSzZyIM/v61D97+3
	 A45jMn485X6HFDiVKvYw3BTlBtB9l9kiyRmXMf6DNHYYWh2jHbJ3WY+v/gT9NPu/FGdQA
	 G+0ag417C2pJVhXpSX4pr3gxFoTGPr9WBVQ0N84ASIo7St2GVVIcXxUQUdYAjlZO1QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367388;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8QjKzR1VguJw8D/MKsLYUOGbt7zIGd8HDj92xIUMoGk=;
	b=ScnSWN/DcdmyYQpQIgfksMVdnYVDWhkqz/2b5JUJik5MHkYgDkPiRr7Pg4NKeKTPXxrb
	 CcovwUDKnjkbIa0XpwyvQrqFKsMFR3/7iV7X8fo7HaavzWSKemec3Y8OlY0jKmmv9UzYy
	 tyVbidzgev4U3RKOtnsjA9SQdY1DLMMqqOfSYAXqqxY0UG4YnSBapa9XqJW1kXFYhadxS
	 k9OyPEPTw6GweZ4a99t3wbgrWt5iKNJnkYB7MrAdwloMQGVOfrl0BnFNqRoHjfEXDPF4I
	 kgiT+XSffTdTEnbW0irlD8qFpuXUyeH02pEmaJGm9R3vD4RcbG4stC93LUFo2QERNoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Luxxnqso;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725B4606A333
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Luxxnqso
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADFB1F0089F;
	Wed, 11 Nov 2026 03:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794367388;
	bh=8QjKzR1VguJw8D/MKsLYUOGbt7zIGd8HDj92xIUMoGk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LuxxnqsoZ7zHyXAvgGxiXaEeQuRtsZHdqDn8Z7nA9gn1KSYOuj+XR1djPT7D5jhYE
	 eTepCO8zhEStyQXppLXih70DR6usI53+0gjIWI1pY/aHgkkA9NcHS+A5u4a0yqq26U
	 BNinVqcmHQBQqI7D/doXhnin4m8LNdgOtHxLfrJBUwyvba788kEABuQDkTUX3d46dc
	 rbCURUKQR7Pjx5Nbz39LMP4EtqMwGAxxz4zw4fAkqBzZJhYALHRN5BUO2zzz2yTHFo
	 rEUMT0LmaGRSCj0Z2PoM4TCsC6AV8QwXheP8xQ4sGg+1OM9lPbUn7IsmWJZTHMBjis
	 CnO0YZW/zQV+w==
Message-ID: <sashiko-outbox-208174@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Yang" <hongliang.yang@cixtech.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261111030937.2954646-2-hongliang.yang@cixtech.com>
References: <20261111030937.2954646-1-hongliang.yang@cixtech.com>
 <20261111030937.2954646-2-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:23:07 +0000
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

commit 2ddbb23ac4fa77b6667ad1996ba778aaeb0d7a6c
Author: Hongliang Yang <hongliang.yang@cixtech.com>

dt-bindings: phy: Add CIX Sky1 USB3 PHY

This commit adds the Device Tree binding schema for the CIX Sky1 USB3
SuperSpeed PHY.

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
As reported by Krzysztof Kozlowski on v6 [1], should #phy-cells be 1 so
that each USB3 controller consumer node can specify which of the two PHY
lanes it is wired to?

The hardware block contains two independent SuperSpeed lanes with separate
per-lane register sets and lane-disable controls serving two distinct USB3
controllers. Constraining #phy-cells to 0 omits which controller connects
to which lane from the Device Tree ABI, preventing per-lane control,
power management, or tuning without breaking the binding.

In addition, the description justifies #phy-cells =3D <0> by citing Linux
driver reference counting of phy_init() and phy_exit(), whereas bindings
should describe the hardware rather than driver implementation details.

[1] https://lore.kernel.org/r/20261105-kind-macaque-of-enhancement-ee0365@q=
uoll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111030937.2954=
646-1-hongliang.yang@cixtech.com?part=3D1
