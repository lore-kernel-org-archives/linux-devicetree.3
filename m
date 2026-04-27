Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FA73B8958;
	Mon, 27 Apr 2026 12:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292876; cv=none; b=HpS+ksDUdw3PhsvhzmIjgE5dicsp/uB/3sg8sgfitLGvb83k6j6s3p6tkAWmBiSmufPp7kuZwp50qiue+fliCHs5ymkzBqHDu00LOElnLPOxrLxjVfubvOu8fmu+8CDyUS7Vs5BYjkYR/MKeBc+/oTZWgZ3fNEEtX3Eb2gCmO+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292876; c=relaxed/simple;
	bh=h9B+4bj51dtXhech01Knnumf791ZPM6CARmKroTi0Fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dtGXCWpMNNG5Nx24NtXEnxr6rb/KczwGz9l/jlEEo2SAoIDtC3QOfAePY2L6T3d5boZ+okngRDnfZt0SEp4601kMCsl93J/w+N9WZPGDSfCPNTVmvautasnC9XrRAVvL1oYDGiJRkg9D+g50FmJ7gkeQm4NbfooHsPk+pHnNVVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=WKY9HC5f; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="WKY9HC5f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=N2Cr26LAuCrqLg1Hny+ypX+Am0Ky/eMd+gY1trdJd7A=; b=WKY9HC5fsXD6rXYzZo+QcOk10U
	k8m2IYOWUqQDOsZAiYVzEUVY6pxyimRdVjBY4wUxFvAcx1pcMcUTUd0anXC8RU3u7QE3RF3EItV/h
	SmOqB8VhxjKBVPEMx8ksdH1kjrAi5UHETGvIV0NMc8ZwzzUvVVYrtK0dapBOG6I8kavnDNwkuqXCq
	MlvT3q6mxHAHGQxUxYgNucDi0ZKFMyOKaeJjaccwr/sFD1iQvk7EbdXFR4xzMu5bxuIeegxFrFNTf
	q6vlw9KMnJHdZ3eA3Nn1cnx2hvx4GOZayPlOkBiZP/SrBB3uduOHzXMkzoXM4X9ooaL+L4VC1rUMY
	QhPjRBqQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Gray Huang <gray.huang@wesion.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 nick@khadas.com, Gray Huang <gray.huang@wesion.com>
Subject:
 Re: [PATCH 6/6] arm64: dts: rockchip: Add Bluetooth support for Khadas Edge
 2L
Date: Mon, 27 Apr 2026 14:27:51 +0200
Message-ID: <3716011.atdPhlSkOF@phil>
In-Reply-To: <20260325054614.1497147-7-gray.huang@wesion.com>
References:
 <20260325054614.1497147-1-gray.huang@wesion.com>
 <20260325054614.1497147-7-gray.huang@wesion.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 25. M=C3=A4rz 2026, 06:46:14 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Gray Huang:
> Enable Bluetooth support for the Ampak AP6275P module on the
> Khadas Edge 2L. This involves enabling the UART5 interface for
> HCI communication and defining the required regulators and
> power-sequence pins.
>=20
> Signed-off-by: Gray Huang <gray.huang@wesion.com>
> ---
>  .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arc=
h/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> index 8ecd00f6645d..345dc4c981c1 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> @@ -560,6 +560,20 @@ usb_host_pwren: usb-host-pwren {
>  		};
>  	};
> =20
> +	bluetooth {
> +		bt_reg_on: bt-reg-on {
> +			rockchip,pins =3D <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +
> +		bt_wake_host: bt-wake-host {
> +			rockchip,pins =3D <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +
> +		host_wake_bt: host-wake-bt {
> +			rockchip,pins =3D <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};

same sorting problem with bluetooth between usb-foo and wifi-foo.

> +
>  	wifi {
>  		wifi_reg_on: wifi-reg-on {
>  			rockchip,pins =3D <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;

Heiko


