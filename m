Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F9E4908A7
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 11:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350360; cv=none; b=mPl/Zc8Ef62WCPnJxbHQgdmQ4Z2JMFVLbDg71hTfUKzPYW2drrT37igj5WM/OGwF8B/nmtLJXaNcoaKhXbxjd7ot+1IaczgQZQvW0hkvjx8BHvwvcK57uGcUReVpeLcuNHjOnQ4nBe2/WTWGTnL1/sLArN5PNTtzsTRhdgI1IpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350360; c=relaxed/simple;
	bh=o1HLrh0wsr6gknUJF+GVB48RoDWIsnRMvntEPqV/ejo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HrihK0VSzbpF68ESMyBCr74x/5daMVNHFH6KFe6bMORm6G9ctXO4NZZ5phyReZQzOYgGOv+CBa65BkW1aGZjiZeLZ4AZtNMQAQUz9idX7ODpMr8GonTGM2auXp5OYNeQDaug5R+7WlRkS3I60Rf7zRWmKcxvBZ7vPmavwL8EHGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZ5wBFSG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZ5wBFSG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FF11F000E9;
	Wed,  2 Sep 2026 11:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788350345;
	bh=kFwysOXEZq1xRuHaxSy9/MdWYZggJlsQmDi/DcKt0UU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LZ5wBFSGRUrx5Luhd9JO5Ej3H44AnmrN/ODY0TA0ESJmDwwJ4wsXQHu/eX75fS3IY
	 anZCDLKpVWNtdL8Lg+FuTgATdsT2s8W9VWZA1SSxLUpG/5amqt3pGg10bouTRjrwub
	 V9dcPpOZ3MshNSORVQ6aml8KfJF6m+/88TzvdqCEeX2szx2sume7Y1AKlBObPATLMc
	 Rc0GPSh7FP36d7bCaQI3dQx34G3mI5+Gq+BP8rv21dqMS/V5sOo47Tvu7lEr46blor
	 2kiJ9vXVv5NQjJUBXWzsFEdmvxfejDYztnec2KSp5mgun0ZiZVwVqqEt4bGpP+xrkB
	 zfqupEQlCwnVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: add
 dsi panel dt overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902-rzg2-sr-boards-v4-7-4a456a422fee@solid-run.com>
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
 <20260902-rzg2-sr-boards-v4-7-4a456a422fee@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 11:59:04 +0000
Message-Id: <20260902115905.28FF11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The device tree overlay intentionally misrepresents the reset GP=
IO polarity to work around a Linux driver bug.
- [Medium] The panel node omits the exact hardware compatible string, using=
 only a fallback compatible string from a different vendor's panel.
- [Low] Missing 'reg' property in node 'port@1'.
--

commit 8ad6ab9479d146e186e59ea48122ed17c1b07e32
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: add dsi panel dt overlay

This commit adds a device tree overlay for the Winstar WJ70N3TYJHMNG0
1024x600 DSI panel used on the SolidRun Hummingboard IIoT. The overlay
enables the MIPI-DSI connector and configures the panel, touchscreen,
and backlight for supported RZ/G2L, RZ/G2LC, and RZ/V2L targets.

[ ... ]

> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-panel-ds=
i-WJ70N3TYJHMNG0.dtso b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot=
-panel-dsi-WJ70N3TYJHMNG0.dtso
> new file mode 100644
> index 0000000000000..e43a38d5330e6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-panel-dsi-WJ70N=
3TYJHMNG0.dtso
> @@ -0,0 +1,74 @@

[ ... ]

> +&dsi {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	status =3D "okay";
> +
> +	panel@0 {
> +		/* This is a Winstar panel, but the ronbo panel uses same controls. */
> +		compatible =3D "ronbo,rb070d30";

[Severity: Medium]
Is it possible to include the exact hardware compatible string for the Wins=
tar
WJ70N3TYJHMNG0 panel before the fallback?

Core Devicetree principles require the compatible property to identify the
specific hardware part first, followed by any fallback identifiers. Providi=
ng
only the fallback string masks the true hardware identity. This might make =
it
difficult for the OS to apply future device-specific quirks or optimizations
without modifying the DT.

> +		reg =3D <0>;
> +		/* reset is active-low but driver inverts it internally */
> +		reset-gpios =3D <&tca6408_u48 1 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Does this property intentionally misrepresent the physical hardware state
(active-low reset) as active-high to accommodate a defect in the driver log=
ic?

The device tree is intended to describe hardware accurately and
OS-independently. Encoding a software workaround into the hardware descript=
ion
couples the DT to a specific buggy version of the Linux panel driver. This
breaks compatibility with other operating systems and will cause the panel =
to
break in Linux if the driver is ever fixed to properly handle standard reset
semantics.

> +		backlight =3D <&dsi_backlight>;
> +		power-gpios =3D <&tca6408_u48 2 GPIO_ACTIVE_HIGH>;
> +		shlr-gpios =3D <&tca6408_u48 4 GPIO_ACTIVE_LOW>;
> +		updn-gpios =3D <&tca6408_u48 5 GPIO_ACTIVE_HIGH>;
> +		vcc-lcd-supply =3D <&reg_dsi_panel>;
> +
> +		port {
> +			dsi_in_panel: endpoint {
> +				remote-endpoint =3D <&mipi_dsi_out>;
> +			};
> +		};
> +	};
> +
> +	ports {
> +		port@1 {

[Severity: Low]
Is this node missing a 'reg =3D <1>;' property?

The Device Tree specification requires that any node with a unit address (e=
.g.,
@1) must have a matching reg property. Missing this property causes the Dev=
ice
Tree Compiler (dtc) to emit a unit_address_vs_reg warning during the build.

> +			mipi_dsi_out: endpoint {
> +				data-lanes =3D <1 2 3 4>;
> +				remote-endpoint =3D <&dsi_in_panel>;
> +			};
> +		};
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-rzg2-sr-bo=
ards-v4-0-4a456a422fee@solid-run.com?part=3D7
