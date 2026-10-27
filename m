Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=144.76.98.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793139047;
	b=HgSDIR8GYgkkHQ+O4GMBX4V/LLuKQ9i8fSanAfZ5dhneLjkJFwd4UG1SW3+dtBCOD2RV
	 hNkMlAm6U6KAoYUAQ2B+2ES71L8YVgUb4J9cqzdSlhvV1zDJepyks7535ux41USgoBU0X
	 7FXVrMc2jM3rum6ZQOYBxXlRcTynrNo8oPBeGU/VzavrwlnZ6YBwbYQBEWXsDa7wxfpcI
	 eS4FJul3JUKsYUyBCj/2PR/YRrtjhW5sMmSZaJuGehUTazSknSB4dErkqk79C3DLDNWJB
	 kK7ac0PNajzds+4mBArqqfUy0SpmTvJzwTfbsjR+VShCzW+da4wrG2RLGWfTMzDeYKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139047;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wzA/VJ9i+i6DJvVJgSV/qqezvPTQqdtwC5bPnK70sno=;
	b=0pLRRxTn3a2U6uv1fjy9j5qAxcA3cwHTsTzrlb6oaaBHgym6xtPVuF4EgfliBHOI0pBf
	 r7OvyoTZgi0OJtzgdmlwKHyc2Oje8TgPzWs6fw7IBBa6ACaNsm65QVPlPIBym7M29/QEM
	 nRscAVyE8EMRtuoH6wjhHVU1SWU7Pz6Z+WfMRLuwv4NX48gcRA0lRf7EPIjrPDeeLv7To
	 PTN3ZNZMgxl4yzGTFEA5mDqfw9tU9vGNA2goPlu+JmfpLrCD2GjdOdlS/+MfKuB1uW1vT
	 UP4lPcnYXMfYTAYym7xX2lZSae9oBxbmrFCBgpWsLQhzKW8LmpGwoQY8a1ZR3o5uazA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rojer.me;
	spf=pass smtp.mailfrom=rojer.me;
	dkim=pass header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=DHD9ZAWd;
	arc=none smtp.remote-ip=144.76.98.110
Received: from mail1.rojer.cloud (mail1.rojer.cloud [144.76.98.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E29606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 22:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4E29606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rojer.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rojer.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=DHD9ZAWd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rojer.me; s=main;
	t=1793139044; bh=y6y5Y1QJ5LEzAXEEvEIOfN3dlwUpLEs6mRHVPK5l9wg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DHD9ZAWdlMQrJGsXgSieQctSZjGbLjRTJGVuKaqNRfbMCMG3hh7BaG3ujAOt5CEfy
	 6Yx+Uavjq6OBz6FGstPmMHXQAewNBlpl8KZRtPYX2IMICMnNneZaUJ3AyshZe7hinu
	 d+X1rVLIuWlG9SGFnyA+f1vcXMVyPz03vzAACuI91HjDAyA3yiPF2mHNvbObd0zwHT
	 iCZhx4XCyAGYgQqNvmOXXwKpvdKRzH3lRDb1OGldppCMx6+LLtygtUdGt1EybQAl1t
	 QnQG1aMA27CxJ48y4mDJ4b1jZg/O9HR5Dj972fCsNGj3jwEZtEEOnsbJJj/73HalDD
	 EC55j9EgERK3Q==
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail1.rojer.cloud (Postfix) with ESMTPSA id 858EB1271C3
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 22:10:44 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6dd059478dcso328006eaf.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:10:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy9guCyM2br6TBRpHett8ytX5GSq9ygLAAO64zr/7IJV24lHuL5XLzbox9U7Vu8Vyg3eDtW/m6gR1g7@vger.kernel.org
X-Gm-Message-State: AFq9FYJA1XLk4vtzOWeL9i6yr8foO01b7RLadoOuPJ3efFG29jNDSK4V
	ph3qb60ea9FuPmvdpGWj0ArCSWYnBtK0tJ6VCu2KTkCeWkRgYpJjTN5ROHM+PsOn4ZgGz77urKK
	Pn7NIcLnMeNX9HHuS9IDwuFJtguC1qA==
X-Received: by 2002:a05:6820:1c88:b0:70a:c89b:d12d with SMTP id
 006d021491bc7-713eaf5ad71mr348646eaf.11.1793139043070; Tue, 27 Oct 2026
 15:10:43 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023235959.2988087-1-rojer@rojer.me> <20261023235959.2988087-3-rojer@rojer.me>
 <38baaf87-4d5c-48bc-a11f-a5b6c04c20a8@rock-chips.com>
In-Reply-To: <38baaf87-4d5c-48bc-a11f-a5b6c04c20a8@rock-chips.com>
From: "Deomid \"rojer\" Ryabkov" <rojer@rojer.me>
Date: Wed, 28 Oct 2026 00:10:31 +0200
X-Gmail-Original-Message-ID: <CABFmFwrWL1sej-=xCK-opxn3B9VVy=TaCyRQU43sw=6PY7bcmQ@mail.gmail.com>
X-Gm-Features: AclHuK9ygSoBB9eZyXuz1KFNk_TaXqdwq3xhUt4O0wFduajwOmgNHGsigYcfU5Q
Message-ID: <CABFmFwrWL1sej-=xCK-opxn3B9VVy=TaCyRQU43sw=6PY7bcmQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Enable SDIO Wi-Fi on NanoPi R2S Plus
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sergey Bostandzhyan <jin@mediatomb.cc>, 
	Jensen Huang <jensenhuang@friendlyarm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

agreed, it makes no sense here. will drop in v2, holding on for
feedback on patch 1.

On Tue, 27 Oct 2026 at 15:58, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>
> Hi Deomid
>
> =E5=9C=A8 2026/10/24 =E6=98=9F=E6=9C=9F=E5=85=AD 7:59, Deomid rojer Ryabk=
ov =E5=86=99=E9=81=93:
> > The NanoPi R2S Plus has an M.2 E-key slot wired to the sdmmc_ext
> > controller in 4-bit SDIO mode, where FriendlyElec fit an optional
> > Fn-Link 6222B-SRC (Realtek RTL8822CS) module:
> >
> >    - SDIO signalling at a fixed 1.8V (VCC_18)
> >    - WIFI_REG_ON on GPIO3_B0, 32kHz sleep clock from the RK805 CLKOUT2
> >
> > Enable the controller and add the power sequence. The SDIO pins need
> > 8mA drive strength for SDR104 tuning to succeed, as in the vendor
> > device tree [1]; with the SoC default of 4mA no sample phase works.
> >
> > On boards without the module the controller gives up after about 0.2s
> > ("mmc2: Failed to initialize a non-removable card"); nothing else is
> > affected.
> >
> > With the mmc core change for the module's CMD11 handling at a fixed
> > 1.8V [2], the module is tuned to SDR104 at 150 MHz and works with the
> > rtw88_8822cs driver; without it, it runs in high-speed mode at 50 MHz.
> >
> > [1] https://github.com/friendlyarm/kernel-rockchip/blob/9238df9d21e835b=
ba35c8ba5248784387936cb2e/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2-rev=
24.dts#L144-L172
> > [2] https://lore.kernel.org/linux-mmc/20261023232813.2983368-1-rojer@ro=
jer.me/
> > Signed-off-by: Deomid rojer Ryabkov <rojer@rojer.me>
> > ---
> >   .../dts/rockchip/rk3328-nanopi-r2s-plus.dts   | 56 ++++++++++++++++++=
+
> >   1 file changed, 56 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts b/=
arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
> > index 6ba4a74cb1f..db19a18ae45 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
> > @@ -17,6 +17,15 @@ / {
> >       aliases {
> >               mmc1 =3D &emmc;
> >       };
> > +
> > +     sdio_pwrseq: sdio-pwrseq {
> > +             compatible =3D "mmc-pwrseq-simple";
> > +             clocks =3D <&rk805 1>;
> > +             clock-names =3D "ext_clock";
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&wifi_reg_on_h>;
> > +             reset-gpios =3D <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
> > +     };
> >   };
> >
> >   &emmc {
> > @@ -34,3 +43,50 @@ &io_domains {
> >       vccio4-supply =3D <&vcc_io_33>;
> >       vccio6-supply =3D <&vcc_18>;
> >   };
> > +
> > +&pinctrl {
> > +     wifi {
> > +             wifi_reg_on_h: wifi-reg-on-h {
> > +                     rockchip,pins =3D <3 RK_PB0 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> > +             };
> > +     };
> > +};
> > +
> > +/*
> > + * SDR104 tuning fails with the default 4mA drive strength, use 8mA li=
ke the
> > + * vendor device tree.
> > + */
> > +&sdmmc0ext_bus4 {
> > +     rockchip,pins =3D
> > +             <3 RK_PA4 3 &pcfg_pull_up_8ma>,
> > +             <3 RK_PA5 3 &pcfg_pull_up_8ma>,
> > +             <3 RK_PA6 3 &pcfg_pull_up_8ma>,
> > +             <3 RK_PA7 3 &pcfg_pull_up_8ma>;
> > +};
> > +
> > +&sdmmc0ext_clk {
> > +     rockchip,pins =3D <3 RK_PA2 3 &pcfg_pull_none_8ma>;
> > +};
> > +
> > +&sdmmc0ext_cmd {
> > +     rockchip,pins =3D <3 RK_PA0 3 &pcfg_pull_up_8ma>;
> > +};
> > +
> > +/* Optional M.2 E-key SDIO Wi-Fi module (Fn-Link 6222B-SRC, RTL8822CS)=
 */
> > +&sdmmc_ext {
> > +     bus-width =3D <4>;
> > +     cap-sd-highspeed;
> > +     cap-sdio-irq;
> > +     disable-wp;
>
> Drop disable-wp.
>
> Otherwise,
>
> Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
>
> > +     keep-power-in-suspend;
> > +     mmc-pwrseq =3D <&sdio_pwrseq>;
> > +     no-mmc;
> > +     no-sd;
> > +     non-removable;
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&sdmmc0ext_clk &sdmmc0ext_cmd &sdmmc0ext_bus4>;
> > +     sd-uhs-sdr104;
> > +     vmmc-supply =3D <&vcc_io_33>;
> > +     vqmmc-supply =3D <&vcc_18>;
> > +     status =3D "okay";
> > +};
>


--=20
Deomid "rojer" Ryabkov
rojer@rojer.me
