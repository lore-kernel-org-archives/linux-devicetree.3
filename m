Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01B03FE36D;
	Tue, 24 Mar 2026 14:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774361952; cv=none; b=DYmc82i1Oja3cuprRN+N3pA9BIjFx1f/MUJJBdu3qTuneaupHb/93WLrjfHjJpOcI+QaPxq6Dqe5ri6gDIXyH02kjqfNTmWeQ+vPYK3A2tnSWkrde3kEecPDTBdYaZrZ3anyLu95b9cqq1eP0hp7hAKiy5lMEqR31gJNEONmuoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774361952; c=relaxed/simple;
	bh=NVMFqWZ66HTaLu2uEV3KpTXD0joIZ6qd2vkx/1OKN/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OP6nROevIx9Nnh8g2lZDvge/Mxpyz/kFWq5EHFRu2d43ieNFzulm40zTcqUx1bvoeGnei34o/uP8mTisGT4fInkgb3ZTFkhwj+rzvRqV3Mq/Og7ID7CD2TSWSiETy0mLMNDOji0CVbONdIfTt3xPZbug876rSaSdN98vocpDHRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=M9T0AEfP; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="M9T0AEfP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Tj72oMxFPd8BDjOQIhw3pFVHq+x9Q3/gFhunxx6AeaU=; b=M9T0AEfPSQjpFAicz9fDQ/X1bO
	Fdz87jpmyW3A+DWWP4PuV0SmiqTeE8igeNuGGkXWPLsHGzry54rBX9U4aFMqJr7kNnc3MbXep3F0P
	E95WrLW7NwR4wGu0ndWSlnvqIu4WwVhusiJRD3SvFjWgQP+P3dYbj7CsEzKqTlNBYByPcOZg87iNi
	nOEG6iL0erSUfi/DkWxxNn9B1X0of9KxCLRswaxaWJcNfPF1sWy/z0EqWjAfXquEECX6DDAPeaoNS
	w/u7m8go2vKekYRq0S86LarASuVTtLK8bTdedEQKOUfURzLNQqDZQYRcAj0IE1YmXs9/DXqOwricK
	wkQVCvMg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Pedro Alves <pta2002@pta2002.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pedro Alves <pta2002@pta2002.com>
Subject:
 Re: [PATCH RESEND v2] arm64: dts: rockchip: configure hdmirx in Rock 5 ITX
Date: Tue, 24 Mar 2026 15:18:55 +0100
Message-ID: <3407927.44csPzL39Z@phil>
In-Reply-To: <20260323-radxa-r5-itx-hdmirx-v2-1-c52501909577@pta2002.com>
References: <20260323-radxa-r5-itx-hdmirx-v2-1-c52501909577@pta2002.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 23. M=C3=A4rz 2026, 10:25:33 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Pedro Alves:
> The Radxa Rock 5 ITX board exposes an HDMI input exactly the same way as
> the Rock 5B, but this was not reflected in its DTS.
>=20
> Change the rk3588-rock-5-itx to configure and enable the hdmi_receiver
> and hdmi_receiver_cma nodes.
>=20
> The hot-plug detection (HPD) pin keeps the hdmirx_det name rather than
> the hdmirx_hpd name used in other boards since that is what matches the
> official schematics (HDMIIRX_DET_L).
>=20
> The configurations were confirmed to be identical on the downstream
> Radxa kernel, and this has been tested to work on a Rock 5 ITX board
> running kernel 6.19.3.
>=20
> Signed-off-by: Pedro Alves <pta2002@pta2002.com>
> ---
> Tested with the following commands:
>=20
> v4l2-ctl --verbose -d /dev/video4 \
>   --set-fmt-video=3Dwidth=3D3840,height=3D2160,pixelformat=3D'BGR3' \
>   --stream-mmap=3D4 --stream-skip=3D3 --stream-count=3D20 \
>   --stream-to=3Dhdmiin.raw --stream-poll
>=20
> ffmpeg -f rawvideo -vcodec rawvideo -s 3840x2160 -r 30 -pix_fmt bgr24 \
>   -i hdmiin.raw output.mp4
> ---
> Changes in v2:
> - Updated dts spacing to match coding style
> - Reverted pin naming to hdmirx_det to match schematics
>   - Didn't end up changing other boards to match. There are quite a few
>     others, so I'll probably send a separate patch for that.
>=20
> - Link to v1: https://lore.kernel.org/r/20260304-radxa-r5-itx-hdmirx-v1-1=
=2Df77bf1f7ce03@pta2002.com
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/ar=
m64/boot/dts/rockchip/rk3588-rock-5-itx.dts
> index 172aeabba72a..8e0eead7d223 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
> @@ -349,6 +349,18 @@ &hdmi1_sound {
>  	status =3D "okay";
>  };
> =20
> +&hdmi_receiver_cma {
> +	status =3D "okay";
> +};
> +
> +&hdmi_receiver {
> +	pinctrl-0 =3D <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_r=
x_sda &hdmirx_det>;
> +	pinctrl-names =3D "default";
> +	hpd-gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;

as said before, please also add a pinctrl setting for this pin.

gpio1_c6 is not part of the main hdmirx set of pins, hence needs an
additional pinctrl entry to configure it as gpio and possibly set any
additional pull settings.

And yes the pinctrl-driver does "implcitly" set the gpio-mode when
a gpio is requested, but our more modern approach is to always have
a real pinctrl entry even for gpios.


Heiko


