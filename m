Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DD73B8111
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784108723; cv=none; b=I4oYMeDFwvzHkVXBidOldDEIhMkhNRHU25Ru8lc1InVxqHL0oSHuPKMy5SW0eW9SXZazx56TitbKGbdTnZBGlYAn6eKSSnUW7Nea5ODKgjdu2PdlNXMxwtwX424hCURcL2s1DMItmemtsTL6PLV9gYzjok1FGXYgnlq5TqKC/0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784108723; c=relaxed/simple;
	bh=racWgEavXHeHhWx0vo2h16j6Gm6Dqlzp5KBYG2QDZ/k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BOGR9ePxZnoT+EdH7tawk4OYLoOYCg8NiPXCh3Ce5a5mqCr9kj/PfK1rS+xjS2HBbEnxTHruseAi9mafNTXWy/xlIq3Q+C9nSdDwYK3QPxUgMewQtJ+473BzO2oVjZewWakF3KkHFD8riARmu3up62B5Dh1c1eLaPHyjCaxKCiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8VCq7kb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8VCq7kb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18CDE1F00A3A;
	Wed, 15 Jul 2026 09:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784108715;
	bh=CqxjM0E7fppANwedhPGryxwHVsSNFRx5kIsNlKGkSno=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d8VCq7kbm+g4YZhr7/bCjJxYkyOEpJUyQ6Cwx9yHmfvvOSaHWJGM+dwM8rzxVogzX
	 Fkkn9/RTFBhLntvcE4SK/uakNdzfDm8yTaCS0xFzjcJwpJ63Mop+unZK24P6q1REl/
	 hiYsnNYkcZmtF20VXnkRcl0xs9I1X+aO0JeiABd7YEhRsejiwPNjPT718XdXLhHqlI
	 iEkPGUFgXJbCbbDbSFeTKg+gqMBJHOQ5F5W7zaOTqxbN90C/Sj5TNGxIQQnONzBSKc
	 kBj59J8u1JHGU4XQHvRsgfJai+u7CUFwNCxNnCJUPbbARpXmOX3AIst/Y0FTMUEpF7
	 hXoKqvexRCmEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 15/16] arm64: dts: mediatek: mt8195-cherry: Add M.2
 E-key slot
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715085348.3457359-16-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
 <20260715085348.3457359-16-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 09:45:14 +0000
Message-Id: <20260715094515.18CDE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removing the `wifi@0` node drops the `wakeup-source` property, b=
reaking default Wake-on-WLAN (WoWLAN) configuration.
--

--- Patch [15]: [PATCH v5 15/16] arm64: dts: mediatek: mt8195-cherry: Add M=
.2 E-key slot ---
commit a818c27444e50b0200c6065b8b79412ac5712494
Author: Chen-Yu Tsai <wenst@chromium.org>

arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot

This patch adds an M.2 E-key slot for WiFi/BT combo cards on the
Mt8195 Cherry design. It replaces the PCIe wifi node and its vpcie3v3-supply
property with the new pcie-m2-e-connector representation.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8195-cherry.dtsi
> index ef7afc436aefc..8d4cc30d91e44 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
[ ... ]
> @@ -791,14 +832,14 @@ pcie@0 {
>  		reg =3D <0 0 0 0 0>;
>  		device_type =3D "pci";
>  		num-lanes =3D <1>;
> -		vpcie3v3-supply =3D <&pp3300_wlan>;
>  		#address-cells =3D <3>;
>  		#size-cells =3D <2>;
>  		ranges;
> =20
> -		wifi@0 {
> -			reg =3D <0 0 0 0 0>;
> -			wakeup-source;
> +		port {
> +			pcie1_ep: endpoint {
> +				remote-endpoint =3D <&wifi_ep>;
> +			};
>  		};
>  	};
>  };

[Severity: Medium]
Does removing the wifi@0 node and its wakeup-source property break default
Wake-on-WLAN configuration?

The mt7921 PCIe Wi-Fi driver explicitly checks for this property during pro=
be:

drivers/net/wireless/mediatek/mt76/mt7921/pci.c:
    if (of_property_read_bool(dev->mt76.dev->of_node, "wakeup-source"))
        device_init_wakeup(..., true);

By completely replacing the wifi@0 child node with an OF graph port under
the PCIe root port, the PCI endpoint device loses its of_node instantiation
and the driver cannot find the wakeup-source property.

Should the port node be placed inside the wifi@0 node so the PCI device
retains its Device Tree bindings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715085348.3457=
359-1-wenst@chromium.org?part=3D15
