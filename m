Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8215D390239
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 15:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361483; cv=none; b=IDzRqcRGcVlXy3ot6AINtZscZGbWTwq9tqzqsu3NbxArCxPrD0i1gU2GBtmeEWA2EgAmRSZ9+5NDbb9H6x4jE3lnt968sxG1xKgsHizTVXmzYauKI+s3ijUfcQhUKa5nOVjnzONJDd7FHvucpJTCCvRtfzia3plQTTjXTL+adBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361483; c=relaxed/simple;
	bh=RfMkuzo12Au4wn6go5HZ3UIFXjkDw3mqANSy++GuLhk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ehaEoqhTvxmM753e7CKphhQRBCkigGiVyq1nuGC9dV3/sQry6xUoD69R1UkuV59AOydIv0O7WpQYsce00mJfv+63NBntYuLi8WcAOXZRnFn8svADuxKFGPcfo/R1H4f9MCjhnvAcal7l9PMbV1JxC8Qnm1JMIJOD+fQ9Xo+uTcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Upn52aG1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Upn52aG1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756D31F00A3A;
	Wed,  2 Sep 2026 15:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788361480;
	bh=sxkfdOvfqSEQoJS5M8xkBhpL+OFUJ/t27w2005+PkvE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Upn52aG1qJND3BPQtX6lxMWcGryY+KLNFdMGBZcYT7a414u9ztpGy2k3VbtGhpoTQ
	 f9fpSxHMjs8SqdcMF4f2mLQo9oHPpt5AoWEjH27ld87POCGJC7KYCTW2nMzmYCKujD
	 rRhbEUdAWN4UJM6HUkFqG1QkqpFro45tSScxsTv4iiPJ4aOFlUFR0F0nVDDB0JNqIs
	 pgks7NNrVGS5Xx2E2biDFnItKiPZj6xztWmPkkNIq1omACC2jqReyWXflJUPCaoOBM
	 50zpEu4oBflMFGJM+SwtGkqXzql19uvrJ/RubKxvCwL1gd6zX95RfXkQHb9DkKvd45
	 qQAfJ4E1wvLNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 05/10] arm64: dts: rockchip: rk3568: add
 XPCS and fixed-clock nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, olteanv@gmail.com, wsa+renesas@sang-engineering.com
In-Reply-To: <20260901150111.141037-6-coiaprant@gmail.com>
References: <20260901150111.141037-1-coiaprant@gmail.com>
 <20260901150111.141037-6-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 15:04:39 +0000
Message-Id: <20260902150439.756D31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Low] DT Schema Validation Failure: Disabled 'xpcs' node lacks required p=
roperties
- [Low] DT Schema Validation Failure: 'status' property in 'pcs-mii' subnod=
es
- [Low] Missing Hardware Reset Property in XPCS node
- [Low] Incorrect Clock Modeling: Fake fixed-clock nodes for hardware clocks
--

commit eff2669bff2081bb72b25ba5712b66df2f70b9bf
Author: Coia Prant <coiaprant@gmail.com>
arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes

This commit adds the XPCS device node and its associated pcs-mii sub-nodes
to the RK3568 device tree. It also introduces two fixed-clock nodes to serve
as reference clocks for the GMACs.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3568.dtsi
> index 3bc653f027f1f..989e164c0eb39 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
[ ... ]
> +	xpcs: pcs@fda00000 {
> +		compatible =3D "rockchip,rk3568-xpcs";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		reg =3D <0x0 0xfda00000 0x0 0x200000>;
> +		clocks =3D <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
> +		clock-names =3D "csr", "eee";
> +		power-domains =3D <&power RK3568_PD_PIPE>;
> +		status =3D "disabled";

[Severity: Low]
Will this cause make dtbs_check to emit validation warnings for boards that
include rk3568.dtsi without overriding the xpcs node? The
rockchip,rk3568-xpcs binding schema unconditionally requires phys and
phy-names at the root level, even when the node is disabled.

[Severity: Low]
Does the xpcs node accurately represent the hardware without a resets
property? The RK3568 hardware provides dedicated resets (like SRST_XPCS)
for this block. Omitting the resets property might leave the hardware
description incomplete, even if the current Linux driver does not actively
use it.

> +
> +		xpcs_mii0: pcs-mii@0 {
> +			reg =3D <0>;
> +			status =3D "disabled";

[Severity: Low]
Is the status property permitted in these pcs-mii subnodes? The
rockchip-dwxpcs.yaml schema uses additionalProperties: false for the
^pcs-mii@[0-3]$ pattern and does not explicitly allow the status property.
This might trigger another validation warning during make dtbs_check.

> +		};
[ ... ]
> +
> +	xpcs_gmac0_clk: xpcs-gmac0-clock {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <125000000>;

[Severity: Low]
Does modeling these 125 MHz reference clocks as standalone fixed-clock nodes
mask the true hardware dependency? Since these clocks are actually generated
by the XPCS/Combo PHY block, using dummy board-level clocks could hide the
real topology from the device tree, even if a power management race is
currently avoided by a device link in the MAC driver.

> +		clock-output-names =3D "clk_gmac0_xpcs_mii";
> +		#clock-cells =3D <0>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901150111.1410=
37-1-coiaprant@gmail.com?part=3D5
