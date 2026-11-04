Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807076;
	b=f5CJyY/TWEvaBFExy5tF4cASmLQFBb+kvunmUensEN4jdSGZrBLru7BtpUR6bU5c1Z+I
	 W4u5/S0aztl6krXcOZJFoC4kGguyJ/LzYHHz1Ui1V4aq7PqtjTIi90U/lpx7ndfVGxqdt
	 2nx/Z1rtsUabu/rQJiXP2nRRIs+lRhrbu5aBxZTSWWtkOuX4tKcGxlsl6yYBk5L4Z4uuc
	 DCVVtpTzQiXR8h3zfc6v2iS8kZLD8GOAcXqtJA7cVn6N3mKmDmLto9tri9h8X7lQ439oA
	 mVPneYewwcFcM430eseuGLR/O0LDmQmUex97v/bnRPfNWwdebdKEa4CP5AgWT2DB1jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807076;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MVrGC/vh6AjwzeEgxhdDEmq9Yd19TF4VAyD1VQRViDM=;
	b=J3mg+gnRJxBmxX5/kQk06nUCvAHqz2FiZo01snNxGiZ7/XocfQ8NAuXMJZ9o5hdctAYc
	 //CuZD3kpcs5855Og5hEl4SonwQkym2YxnFdB/+QBpAm13na7zPXECbqZIUORcs2uNsBX
	 i25yNHbwLdQTu8p6vjkrm6ZqPL/poJ2HrGRnxKeqLm4W/D3o2xfbGJ3yUE9OZ15qrPGzy
	 yV8/hpdW+rCSX2AEvTMcgirtdqIjze4L7L/3SFebFFPNuKf71Bb9VbtOPcRvB1f/ns+kM
	 9jINsfGBGlH6DESJeo6jam19Y3GhbtQ11CkgnqwiqBGTYDRwJ7VTJehhipfFQNNnSpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PUHjam8K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C94B606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 15:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PUHjam8K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98991F00919;
	Wed,  4 Nov 2026 15:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793807076;
	bh=MVrGC/vh6AjwzeEgxhdDEmq9Yd19TF4VAyD1VQRViDM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PUHjam8KZRx1DtC5aarciYdeqMwMpTnciyKE06Pj+X87NpaD9hZeC4cNY8OVQGzo7
	 9x3HE2h96/2C8f0wdLwvk3RFJePV+3d2IT7cp/O4W1NKOc8FvPs5T2nA2eTPJSNuuf
	 A28+LUyqSASRxGbFX0J4n8+b0FQOLukvN7IW/VH67R6P+gQgSJy1Xq3G6RygIJTShy
	 xPh3WmwpVz7aMbBm6/TlXX2rJasgXcpipApaOytOGMpXNQo6G9TSuG69C8nW3zG+pN
	 F8SjkZfC0Co4MVWKRBjnKwIXQH9d6cpz2EOe2gMlE4LKpLfibRporXhX7Nf0CMwjgV
	 XzC46dDNmQEmQ==
Message-ID: <sashiko-outbox-197531@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay
 for AM67A-BeagleY-AI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Swamil Jain" <s-jain1@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-v1_beagley-ai-lincolntech-lcd185-v1-1-f5daddbbd0a8@ti.com>
References: <20261104-v1_beagley-ai-lincolntech-lcd185-v1-1-f5daddbbd0a8@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 15:44:35 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arm64: dts: ti: unresolved phandles in lcd185 overlay break fdto=
verlay build
--

commit 269a825ad2aa2e4a87e4c7338cb6737365bec27a
Author: Swamil Jain <s-jain1@ti.com>

arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay for AM67A-BeagleY-AI

This commit adds a device tree overlay and Makefile build rules for the
Lincoln Technology Solutions LCD185-101CT Dual-Link LVDS OLDI panel and
Goodix GT928 touchscreen on the AM67A-BeagleY-AI board.

> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Mak=
efile
> index da654153a35ba..f7c0b514b3301 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile

[ ... ]

> @@ -370,6 +371,8 @@ k3-am67a-beagley-ai-csi0-imx219-dtbs :=3D k3-am67a-be=
agley-ai.dtb \
>  	k3-am67a-beagley-ai-csi0-imx219.dtbo
>  k3-am67a-beagley-ai-csi1-imx219-dtbs :=3D k3-am67a-beagley-ai.dtb \
>  	k3-am67a-beagley-ai-csi1-imx219.dtbo
> +k3-am67a-beagley-ai-lincolntech-lcd185-panel-dtbs :=3D k3-am67a-beagley-=
ai.dtb \
> +	k3-am67a-beagley-ai-lincolntech-lcd185-panel.dtbo
>  k3-am68-sk-base-board-csi2-dual-imx219-dtbs :=3D k3-am68-sk-base-board.d=
tb \
>  	k3-j721e-sk-csi2-dual-imx219.dtbo
>  k3-am68-sk-base-board-pcie1-ep-dtbs :=3D k3-am68-sk-base-board.dtb \
> @@ -490,6 +493,7 @@ dtb- +=3D k3-am625-beagleplay-csi2-ov5640.dtb \
>  	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
>  	k3-am67a-beagley-ai-csi0-imx219.dtb \
>  	k3-am67a-beagley-ai-csi1-imx219.dtb \
> +	k3-am67a-beagley-ai-lincolntech-lcd185-panel.dtb \
>  	k3-am68-phyboard-izar-lvds-ph128800t006.dtb \
>  	k3-am68-phyboard-izar-peb-av-15.dtb \
>  	k3-am68-phyboard-izar-pwm-fan.dtb \
> diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-lincolntech-lcd18=
5-panel.dtso b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-lincolntech-lcd18=
5-panel.dtso
> new file mode 100644
> index 0000000000000..8004c058bfb16
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-lincolntech-lcd185-panel=
.dtso
> @@ -0,0 +1,199 @@

[ ... ]

> +&dss0 {
> +	status =3D "okay";
> +
> +	ports {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		/* VP1: Output to OLDI */
> +		port@0 {
> +			reg =3D <0>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			dss0_dpi0_out0: endpoint@0 {
> +				reg =3D <0>;
> +				remote-endpoint =3D <&dss0_oldi0_in>;
> +			};
> +
> +			dss0_dpi0_out1: endpoint@1 {
> +				reg =3D <1>;
> +				remote-endpoint =3D <&dss0_oldi1_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&dss0_oldi0 {
> +	status =3D "okay";
> +	ti,companion-oldi =3D <&dss0_oldi1>;

[ ... ]

> +&dss0_oldi1 {
> +	status =3D "okay";
> +	ti,secondary-oldi;
> +	ti,companion-oldi =3D <&dss0_oldi0>;

[ ... ]

> +&main_i2c1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&main_i2c1_pins_default>;

[Severity: Medium]
Does building k3-am67a-beagley-ai-lincolntech-lcd185-panel.dtb succeed when
CONFIG_OF_ALL_DTBS is enabled?

In arch/arm64/boot/dts/ti/Makefile, adding
k3-am67a-beagley-ai-lincolntech-lcd185-panel-dtbs and adding
k3-am67a-beagley-ai-lincolntech-lcd185-panel.dtb to dtb- causes
scripts/Makefile.dtbs to invoke fdtoverlay to apply
k3-am67a-beagley-ai-lincolntech-lcd185-panel.dtbo onto
k3-am67a-beagley-ai.dtb.

However, the overlay references the labels dss0, dss0_oldi0, dss0_oldi1,
and main_i2c1_pins_default, none of which are defined in
arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts or its included J722S dtsi
files in the current tree.

Without the prerequisite BeagleY-AI display changes present in the base
device tree, wouldn't fdtoverlay fail with FDT_ERR_NOTFOUND and break the
build under CONFIG_OF_ALL_DTBS=3Dy or dtbs_check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-v1_beagley=
-ai-lincolntech-lcd185-v1-1-f5daddbbd0a8@ti.com?part=3D1
