Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686294746C6
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547005; cv=none; b=mSdcR++zqLESWSG+LxopJjN+4D+kGp7TgzghjkDrypt3N8goBoe2CXU5li6Nrj0iOEVJBiZW6mFRWjrSBkAGQrb0toWK07K16ltXIWC4AhwpVLjsLv2YUAh9d0mTbf3xfg/vGYWQJiRUuWkHV0OY3I9FeyhGoNp0t3UfqeY34eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547005; c=relaxed/simple;
	bh=cJGUvxuBvkvus+isxMm/59uGxo9Sd9dm1J91H+05iPE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kNe4qRZPPoCNvVSVHsmxlXo5Awo/+dE6fGM2yzBNCpmuzOmO436oNSHUvC53yKVenl3gJf6kjxXrNlp8/TDMxiDnbHn7wryWpAmRQNGyDbAhhr0/Ya5SSIT1sv9kADdBEECtGbNsNWe42FmgJNtGNnWl9TpjvEZsrk5h9SO+83I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjaR+LIw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjaR+LIw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09AA51F000FF;
	Wed, 16 Sep 2026 08:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789547000;
	bh=iHIT9LOpZL8vL950XTOcQ1d/4YBL6X2PLfOgHJfihdo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OjaR+LIw5OSdN8dDXbAd9HjqKtr9LwdISXEEpNMhOBCiAzXFVjKz0LvWU0iaMMggo
	 FcbFl5z2+/5+5jg1v/5scfEmFosOnY/G146vegA5OiZLRTcALSLZQeCaYoUKt1NwuR
	 K5sqEstmdFYGfwGsfUoZ9S100IKLZuGJg5NMdav6eVFp9teHUT6rY0xdPDHWLxCZ44
	 JJ78as/V4dXhNV0Nk0ojVtflixUrFSGGfPiJ7/Guo5+VuVCTvVAeZo4A+y0hzpB7DT
	 ck15PrZb+OTyqxcgG7g+do9Hs/w5xMQKQujSCgy2Yneyu2AkBrA/OwRmcZJTJFTh8a
	 rvNheG2kcr9PQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 14/15] arm64: dts: mediatek: mt8195-cherry: Add M.2
 E-key slot
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260916075745.3549953-15-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
 <20260916075745.3549953-15-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 08:23:19 +0000
Message-Id: <20260916082320.09AA51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] pci: implicit loss of WoWLAN support due to wifi@0 node removal
--

commit 5f7e95ba7e04fe3e98237e1ef5a8952a18138c2e
Author: Chen-Yu Tsai <wenst@chromium.org>

arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot

This commit adds the proper representation for the M.2 E-key slot on the Mt=
8195
Cherry design, which is used for WiFi/BT combo cards. It replaces the exist=
ing
PCIe wifi node and moves the associated supply properties.

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
Does removing the wifi@0 node and its wakeup-source property silently disab=
le
Wake-on-WLAN support for the MT7921 PCIe driver?

The MT7921 PCIe driver (drivers/net/wireless/mediatek/mt76/mt7921/pci.c)
relies on dev->mt76.dev->of_node to check for this property and enable
Wake-on-WLAN via device_init_wakeup().

Because the PCI device node is removed and replaced only with an OF graph
port inside the root port pcie@0, the PCI core (pci_set_of_node) will no
longer find a matching child node to assign to pdev->dev.of_node.

Consequently, it appears the driver will fail to read wakeup-source, which
could cause a functional regression in power management.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916075745.3549=
953-1-wenst@chromium.org?part=3D14
