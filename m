Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B01383304
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 03:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778556447; cv=none; b=Fx3xEOpGDvZH6B9A5lw54MkghBxfQJ14gnEIXHQoika2rtmLoghctpkF3xKm3bfmw4ES0kRX3whkQycZDI1j+i3JwDzzNyPUXZsUlLODyWkMKeolsHspY3SH4iIIKJwxNlmGVWzkRzjwDQgnmggfL1ELZHlv2GUETY0ojv04mic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778556447; c=relaxed/simple;
	bh=y3BqtVovnU1eQEjr2n+CaSfcW3FDdbSfqIwDtY9rPQw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XC4JpcE7FrstrdIXAk+v0i5ECLfJRhFdcpDrtH2CkWPIGbZOwOXISekqQx7Pu3JQIz3fQe3ym4W/lYiONwXu7IjqiePnemn2eP2KNCmaPkQkHQJLFMbnUPXc09joDsvy69sRqMnbRYzTEx9wnyNuIZAoKUrL1aClCkQ/md0RyD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CbvWwdLE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CbvWwdLE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C8EC2BCB0;
	Tue, 12 May 2026 03:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778556446;
	bh=y3BqtVovnU1eQEjr2n+CaSfcW3FDdbSfqIwDtY9rPQw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=CbvWwdLEweI2bC4rZI9cNcItMQyvO3vJPTpkPc5r5W5pA8d4fi2YJk5NoYsLfLNSK
	 +mD+TPwVp2j16rYXrAaI7jbJ8psowlmSu5txJBA42COE4EW1ZvXYHdl/9nOo8sI64T
	 +E7Lagj+CPmVytHuRcykc1TbxAAeO3VWv50vvvfc+gtcpImlsvBymCslcpzt1uzspa
	 sfMh3NDStu8EAXhew1O2Q7bdbn6oJmeN5aSAsTBkOiyJUI4EMJMsnSzx/geW0KM+R/
	 fz1cOv0kzSvuPevxBZ/ew+/3yjByIurGKWkm85ywjBwD8gz+yqUGqYF8stNO5KIy1a
	 v/AovMUcCOs2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 7/9 RESEND] ARM: tegra: tf600t: Configure panel
Reply-To: sashiko@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511074859.24930-8-clamor95@gmail.com>
References: <20260511074859.24930-8-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 03:27:26 +0000
Message-Id: <20260512032726.A0C8EC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Removal of `regulator-always-on` from a regulator named `vddio_ddr=
_1v2`.
- [Medium] Undocumented feature addition of camera and video input subsyste=
ms.
- [Low] Incomplete DT graph due to dangling camera endpoints.
--

commit 3e9ff009424216cb47835e1aa1d04e00f8c7e7e8
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ARM: tegra: tf600t: Configure panel

This commit configures the DSI panel used in the ASUS VivoTab TF600T. It
adds the necessary display nodes, modifies the vdd1 regulator to serve as
vio_panel, and adds a new vdd_panel regulator for the display.

> diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts b/arch/arm/=
boot/dts/nvidia/tegra30-asus-tf600t.dts
> index 9296e7970ce4e..8b68bfef8dee8 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts

[ ... ]

> @@ -55,6 +56,37 @@ linux,cma@80000000 {
>  	};
> =20
>  	host1x@50000000 {
> +		vi@54080000 {
> +			status =3D "okay";
> +
> +			csi@800 {
> +				status =3D "okay";
> +
> +				avdd-dsi-csi-supply =3D <&avdd_dsi_csi>;
> +			};
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +
> +					vi_ppa_input: endpoint {
> +						/* Link to the rear camera */
> +					};
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +
> +					vi_ppb_input: endpoint {
> +						/* Link to the front camera */
> +					};
> +				};
> +			};
> +		};

The commit message states the goal is to configure the DSI panel, but this
adds Video Input and CSI nodes for cameras. Should these camera subsystem
additions be split into a separate patch, or documented in the commit messa=
ge?

Also, do these endpoints need remote-endpoint properties linking them to the
actual sensor nodes? Without them, the OF graph appears incomplete and might
trigger warnings during device tree schema validation.

[ ... ]

> @@ -1123,11 +1171,10 @@ pmic-sleep-hog {
>  			};
> =20
>  			regulators {
> -				vdd_lcd: vdd1 {
> +				vio_panel: vdd1 {
>  					regulator-name =3D "vddio_ddr_1v2";
>  					regulator-min-microvolt =3D <1200000>;
>  					regulator-max-microvolt =3D <1200000>;
> -					regulator-always-on;
>  					regulator-boot-on;
>  					ti,regulator-ext-sleep-control =3D <8>;
>  				};

Does removing regulator-always-on from vddio_ddr_1v2 risk powering down sys=
tem
memory when the display panel is disabled?

If this regulator is shared with DDR, turning off the panel might cause a s=
ystem
crash.=20

If it is only used for the panel on this specific board, could the
regulator-name be updated to reflect that and avoid confusion?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511074859.2493=
0-1-clamor95@gmail.com?part=3D7
