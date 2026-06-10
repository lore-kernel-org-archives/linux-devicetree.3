Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B20392824
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082210; cv=none; b=pEZhGUDvOKWzMX2ozVkZbdUhgp1/E1s/pla2nTxYkJEX4HRzaDyvoRn7sGXGtQHUcNNgDm6Aj/ZxOQx6fkWYr5/5q08wsGyEgzPmkZNqQmVd30frZ5WctF4oToCm6SVIgl2Lh38WJrYV5NJ1iZ/40XsIYH9yhl2IE0BSKMePRug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082210; c=relaxed/simple;
	bh=3iAAe/6aJe1Xje0Ymloo8orL1n3hc9DeX/woZ+TmZL4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UAuxnSQIOqHHep9Cg3WYFrujHMwN/NAGunjy+u/F65zU4e6Me95ZJXot0ZnLXG9FTrtFRWsEan7hrJMMZJuZAaLHIBiakyVz9jFI50A4JGTCl78M8jLHFNw2ErLvV3gyimyFTaG+Uv5IB830z0Vl7AYRfTMsED1Gj4v7yAGXI/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOvAoTL7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOvAoTL7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57EBF1F00898;
	Wed, 10 Jun 2026 09:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781082209;
	bh=iNT6C9HZrkXBdI2Uu+Mm4lE+WsUGnaoIiNpiUuS79B4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bOvAoTL79QCCuMpMwhInWsVl0Q9Z2K74ho8Xdeca7er09lkyAgnKuhPhFd3cnhX9S
	 OfE+nvdJNILUvBjYFUhgW4bvBz5/MoMARLXm3z+cNJoFGUsblGYem2iohOvFcihmtM
	 Zr+mEN+H6Y9ZxLOWtEZwUfQUR829fSxfqwa/bMRwXmA83lrH0JAPlQ9Gq/N4qXj+LQ
	 RDEvYI6K8LuUz2ZLJB0/1J/qkomICsurrQh/XHtvaSrnr+iFoBvoMORpBphCqUgoI2
	 fE6Mb6quUZVnwjZYK9YX4V6vkBULkqkdNzhBcI/I2zPD/Yan4evpxRtI4uliW/Jaw7
	 zwzQho8hXEDcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 14/16] arm64: dts: mediatek: mt8195-cherry: Add M.2
 E-key slot
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260610084053.2059858-15-wenst@chromium.org>
References: <20260610084053.2059858-15-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 09:03:28 +0000
Message-Id: <20260610090329.57EBF1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Deletion of the `wifi@0` child node removes the `wakeup-source` =
property, breaking default Wake-on-WLAN (WOWLAN) capability.
--

commit f79abe85df05e70cd87af21f7a5b924157250109
Author: Chen-Yu Tsai <wenst@chromium.org>

arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot

The commit adds an M.2 E-key slot representation for the Mt8195 Cherry
design. It wires up PCIe, USB, and auxiliary signals, replacing the older
PCIe wifi node and power supply properties.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8195-cherry.dtsi
> index ef7afc436aefc..c95a54de35672 100644
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
[Severity: Medium]
Does this removal break default Wake-on-WLAN (WOWLAN) capability?

The mt7921 Wi-Fi driver specifically checks for the wakeup-source property
on its Device Tree node during probe to call device_init_wakeup() and
enable Wake-on-WLAN by default.

By replacing the wifi@0 node with an OF graph port endpoint, the PCI core
will no longer match the PCI device to an OF node, making dev->of_node NULL.
This means the driver will not detect the property and could silently leave
default WOWLAN disabled.

> +		port {
> +			pcie1_ep: endpoint {
> +				remote-endpoint =3D <&wifi_ep>;
> +			};
>  		};
>  	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610084053.2059=
858-1-wenst@chromium.org?part=3D14
