Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C1842588C
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784211881; cv=none; b=iJ7WGI9+U2ydyXJrBzeV7ACJm+37dtIdQygdZK5zQ09CAa/s89V3DqdBO+X898N3LRb6JtzOUAZNKzfZGG575BxdBCKejmHghCnhZq+QvKhHZleYsibQehIPsF+nbIz48YV21AQcF/eYslEjy8X/eTbQLseSblnBV3fU7UEeIR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784211881; c=relaxed/simple;
	bh=cYt28NEdcGJ/UQ8bZ+ole6VeKahukUHERQpJ/bYlHH4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eOmTuqujF6fQjG2aq5cPCL8/83CV9yjUqn4BvnF22t65SYXHZzGIhAd7+5sCRqYiahD6PUPrCit3zt4cRvhLv52QtZTFRqVYyuHFj80E/lnWwH8LCtDSmHbQ0NyKTi80KEwcQpFgY15fDwZaFPKirtDGiOlHjSo3GaUXVO9HvDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBHtbd4t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBHtbd4t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955E41F00A3D;
	Thu, 16 Jul 2026 14:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784211878;
	bh=gBX9PAUWIJhmz6dBwaw+uby8fl5a+sTJHaDvMT8Xc30=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dBHtbd4tF7aKAjts0O2WfrAkA1ti8KT7c/5TwDUx/OrgF+A3VYnsmQwfgL76FhDD0
	 8+XHrO+eSeVxelWKFUEKrfH7UM/7p9ZNhMtPSs/voLchW0vb1cnuVc4u0sK2x6fToz
	 xajr7itXjgzJcjvRtNQU9AbIjFy0tnyf0k5Nl2GD0/LKQcl2EiALtsS0oaaDOt5exD
	 u6Ze8j6KPZA+XNb683g7b3IKbyu04jJumLyWP68/Adlf0/6vI1GHNs+a2NOfgsB1Km
	 ZoxbiFHL6yNx0Bz9VgyvOXDigZsppa42D8SQ2962d2MlIzoCSiOm46gLeO+2b+eDsj
	 G5mlcjRxAnn5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260716095101.2498464-3-gahing@gahingwoo.com>
References: <20260716095101.2498464-1-gahing@gahingwoo.com>
 <20260716095101.2498464-3-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 14:24:38 +0000
Message-Id: <20260716142438.955E41F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The DisplayPort controller (`dp`) is not enabled and not routed =
to the VOP2, breaking the advertised Type-C DP alt-mode.
- [Medium] The `sai6` CPU DAI node is not enabled, which prevents the HDMI =
sound card from probing.
--

--- Patch [2]: [PATCH v3 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-=
IO ---
commit 6aa295a8cc84993de39b6dae02d2c7333d9385bb
Author: Jiaxing Hu <gahing@gahingwoo.com>

arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
   =20
This commit adds device tree files for the ArmSoM CM5, an RK3576 compute
module, and its CM5-IO carrier board. It configures peripherals such as
the RK806 PMIC, GMAC0, eMMC, HDMI, USB, and an M.2 PCIe slot.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts b/arch=
/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
[ ... ]
> @@ -174,6 +174,10 @@ hdmi_out_con: endpoint {
>  	};
>  };
> =20
> +&hdmi_sound {
> +	status =3D "okay";
> +};

[Severity: Medium]
Will the HDMI sound card fail to probe without the sai6 CPU DAI enabled?

Since hdmi_sound relies on sai6 as its CPU endpoint (defined in the base
SoC dtsi), leaving &sai6 disabled in this board file might prevent ALSA
from registering the sound card, resulting in broken HDMI audio.

> +
>  &hdptxphy {
>  	status =3D "okay";
>  };
[ ... ]
> @@ -317,6 +321,21 @@ &usb_drd1_dwc3 {
>  	status =3D "okay";
>  };
> =20
> +&usbdp_phy {
> +	status =3D "okay";
> +	mode-switch;
> +	orientation-switch;
> +	sbu1-dc-gpios =3D <&gpio4 RK_PC4 GPIO_ACTIVE_HIGH>;
> +	sbu2-dc-gpios =3D <&gpio4 RK_PC5 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Does the DisplayPort controller also need to be enabled for DP alt-mode to
function properly?

The usbdp_phy is configured for mode switching here, but the corresponding
&dp node and its VOP2 display pipeline endpoint appear to be missing or
disabled. Without the controller generating video data, will the Type-C
port fail to output a video signal?

> +
> +	port {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716095101.2498=
464-1-gahing@gahingwoo.com?part=3D2
