Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B79B2F7F1D
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 19:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783450956; cv=none; b=UYr1Anh0u4+wc0OGmomWrABG5JTDKY7J7VIy3MOPeEVa7GGvGCXhNX3aDq8N9JejsjguDdaZmfokjNFVmaR5KPFnXvFheNmx06olgD//EF28P8LaigT4slgREdt8tpD6841pdIpcn9LJ09os2Dznp7IZagf2zxt8NSuN3JMbh8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783450956; c=relaxed/simple;
	bh=pBmhv52fyWHgbSBWdBvZitDB9EPq6Rj5L83OcMziSkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XASHKBnCan4pZyr6dsg51tiAMNe7Rum0JOTmhLwpgrG9Hk2WXwbHzrEiHzyrEhbjSuPdb5JVsuOBaZn105sSN5+qY8An6aCjMuyJMMRaElIHSxOaseaVgYt7+Il8tfhNgf8rfy/Ed1kS+SnMhvFXSzlwkqN5G1lYrslWVqc0E5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=IcdSnAl0; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="IcdSnAl0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=0VgqZk2+M4O8X70VgHeDWO5bVKrL7Qb344B9KtlXxf0=; b=IcdSnAl0GWmvivyH9PIGEfrrG/
	m+vhRS1GrEpSZnu3BwWkB0bW+kHnF1uCU4b0j8snGm8yeWJwaeo0EXqHRVrD4/uIgY/kP4qrDHYJW
	HWkGEbBSUPSeC+wC/4zOZBwpAgngtskkQx142Op/JWy93GHP3lNc7cP0NYr1gXG7IAn+qZGAOY/j1
	T18dIjxuFJjTQZVAHJsccGj9xEZWnFUxizEVjfQEzdosal+0NkZaGJ1ofZNrZVZMU+fHObcoIgpDy
	7GAorD5oPsPWJ8hdqKSvzTUEeqvi/65SFE+RxQQddNqr5h5pKFzbCC1XunfOZ+gExBV0Gt5sTpODv
	XNwL81ZQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Brian Mayer <bleemayer@gmail.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH v2] arm64: dts: rockchip: add HYM8563 RTC to Radxa CM5 IO board
Date: Tue, 07 Jul 2026 21:02:30 +0200
Message-ID: <48203626.fMDQidcC6G@phil>
In-Reply-To: <20260705181920.8633-1-bleemayer@gmail.com>
References:
 <2960762.AiC22s8V5E@diego> <20260705181920.8633-1-bleemayer@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Brian,

I've applied the change with some changes.
Please the comments below in mind for future patches, but there is no
need to send another version:


Am Sonntag, 5. Juli 2026, 20:19:19 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Brian Mayer:
> Hello again, to clarify: I tested the v1 patch in my radxa cm5, but since
> this v2 only contains name changes I didn't test. I added the missing
> agent tag and am sending the patch inline. Thanks.
>=20
> The Radxa CM5 IO carrier has a Haoyu HYM8563 real-time clock on I2C6 at
> address 0x51, with its interrupt line on GPIO0_B0 and a CR1220 backup
> battery holder. Without a device tree node, no /dev/rtc* appears even
> when CONFIG_RTC_DRV_HYM8563 is enabled.
>=20
> Describe the RTC, wire the interrupt pin with a pull-up, mark it as a
> wakeup source, and point the rtc0 alias at it so RTC_HCTOSYS/SYSTOHC use
> the external clock. Wiring matches Radxa's downstream board support and
> uses schematic names for the rtc_int_l pinctrl entry.

Please way less AI fluff. The patch content show that you're wiring up the
interrupt + pinctrl etc.

Also, please no personal "Hello again ...." in the actual commit message.
The text above is the text that ends up in the git log for your change,
so should be short and to the point.

I've shortened it to:
=2D----
Describe the Haoyu HYM8563 RTC connected to I2C6 on the Radxa CM5 IO
carrier including its interrupt line.
=2D----


> Assisted-by: Grok:grok-build
> Signed-off-by: Brian Mayer <bleemayer@gmail.com>
> ---

Personal comments, remarks etc should be here, below the 3 dashes and
above the diffstat. That way we can still read them, but they don't
end up in the git history.


>  .../dts/rockchip/rk3588s-radxa-cm5-io.dts     | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> Changes in v2:
> - Rename pinctrl to rtc_int_l / rtc-int-l to match schematics
> - Drop Tested-by (covered by Signed-off-by)
> - Add Assisted-by: Grok:grok-build
> - Send inline with git send-email (not as attachment)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts b/arch=
/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
> index af4a9bc01..d22db4d18 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
> @@ -19,6 +19,7 @@ / {
>  	aliases {
>  		ethernet0 =3D &gmac1;
>  		mmc1 =3D &sdmmc;
> +		rtc0 =3D &hym8563;
>  	};
> =20
>  	chosen {
> @@ -198,6 +199,18 @@ usbc0_dp_altmode_mux: endpoint {
>  			};
>  		};
>  	};
> +
> +	hym8563: rtc@51 {
> +		compatible =3D "haoyu,hym8563";
> +		reg =3D <0x51>;
> +		#clock-cells =3D <0>;
> +		clock-output-names =3D "hym8563";
> +		interrupt-parent =3D <&gpio0>;
> +		interrupts =3D <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&rtc_int_l>;
> +		wakeup-source;
> +	};
>  };
> =20
>  &i2s5_8ch {
> @@ -221,6 +234,12 @@ usbc0_int: usbc0-int {
>  		};
>  	};
> =20
> +	hym8563 {
> +		rtc_int_l: rtc-int-l {
> +			rockchip,pins =3D <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +

please sort nodes alphabetically (hdmi -> hym8563)
I did that when applying.


Thanks
Heiko


>  	hdmi {
>  		hdmi0_tx_on_h: hdmi0-tx-on-h {
>  			rockchip,pins =3D <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
>=20
> base-commit: 87320be9f0d24fce67631b7eef919f0b79c3e45c
>=20




