Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792972720;
	b=YhNUvhSHQtj9f/tsi22HtWq7/UUn+OWrXq+GvjE+bLFwi0cZhSI0xhBfoQonwEfxMeVb
	 UoonxWHIXMyUWiuTHVqwtEGi5WMdL+quvZQay+98PpUjH/opAV267lS3rxahVmagdasL/
	 /EXeDqwr8z7vsx5/t87S9RBRU+/9hasZX6ZqKs2qszlzYWLDzOx3bXPp6zxJJR28WPI/d
	 i0dIXh63/RQ1otAhq+oiS4pp6iVg+QNT3Zt/SB0MCYIwxpeuUyK2p5dw+I+M4KbP3k0XD
	 E95YTC7KK2FSURuQ8B3MT8SMUhHNDGFKhhTl1rtK7QQsC6rsDX1APezFXbe5b03tbJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792972720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ikb9/V5iAlmy8zH9iEswyqh7X1ACy082GM3v+SCnybM=;
	b=h3N27lE95HLjZb5Fxce/vYXzhvRF2yQ7Rf1SjZn97vpAEcXX5W9jC+59ynqzREBzMePV
	 B3FA0XLZUdLniUr104lhioc3rZ0FQ2OSveKQG2VQoh5F2mEfxPgXworo4qF+aRNlis5c2
	 9a2j4odWtagmbiMAtjTybdiyMgJw99tDZPFcjTD/0H7i+x/tbJrcP+ezbYDpgCYtqErvf
	 tSOQ7rBz+eE7y9olSKGhEO1YSsw0O28hkdz6aBPDbPmW8L5H9L4KvUlscw9gAiD36/SkR
	 ZMjQzXjvqBr0ZDtn0pfPGwEXWuA8yVDk1aHLWAFle5roxq1NcVwT3xP4sNmToYYH9Zg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EDrhXzT7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C84606A31D
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 23:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4C84606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EDrhXzT7
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eaaa9b1591so1617996e0c.3
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 16:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792972719; cv=none;
        d=google.com; s=arc-20260327;
        b=q1KE4low3w4a+SXzDm8JtMcbpUcCqs3y5mFcizEjWdq73cZzl5OlnJU9ExbbEZqsYY
         qLlo3qJXmNDPUex+gXoUm5/PbDvnH26RTRd5G2beGZENG8ie5FvusEJPS6dGWfgKEmQG
         NO2r1THitX2CgSVkPohABfaNy52WX7dMsbbtkF0qhg/uTXhStjB2X3rwvgpupHbCpm47
         hBCFz5hAEd1MXsRkk6L5KJ1q5+JI2sVM/wdMbRqjluDhSkpgvJetHo6UQdz7cOiWzC9Q
         QlW4RM5CY2XiN2YpQZoCDkVz9U0va0Tf5sfXFvNcEgTAQejuMumxB+Z4+j6pAK/6PSBq
         TqCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ikb9/V5iAlmy8zH9iEswyqh7X1ACy082GM3v+SCnybM=;
        fh=mG6lCjwC2Ad5xe7yHa1qwEmBzhCvhkP3nQlU7nywd+I=;
        b=AyYjxubQQzKS/avPZHBRz1YUka3GMe/b3PmDr2r2yq9P8zMMSSfC3VKqjGSc9i1D+r
         OzTUiFMljxiWdEO+McGLOTNDpzZJ91FJ5LkSU3ag0up3e64xYW2gLlsg321jYji1PBdA
         8AwvOI8SniPA/pXuZ0Y2dA5tmRtoVcJSPViJMDtbmkxml0XK7KR3gQaYt0kRmXfEiFES
         AR40DwmjQHT/domZFo9iOJjVwjf2ltzSSw2KlIquTiPzwNGDoBKy7AYoXEnFyFrtOvi3
         YugIPCYSnNfgnj3FKfjOriwkJX9dhqeosjw3zrixqB9KXNDwSE06OpA+COXUTvoyRMwj
         JkDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792972719; x=1793577519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ikb9/V5iAlmy8zH9iEswyqh7X1ACy082GM3v+SCnybM=;
        b=EDrhXzT7KdENUM58hiSpxESTOCelFNMcfDPmHPHvjsV/L8svxWU/td3+1P5fh3FdBm
         qzI8wgway/GaLAukbVs8tlOVnvmpEn3tVxGJISSyHYt3XkKMOSgjAneA0ts+Pwfr2jvI
         W1yRLMsGoLCYuLPeeHOu7rluuE3KOHvcHczXbLtKGjki3FL4/tavIX4aIzmSYWw3/PDu
         fhzmDPcotaJvE/CQDOVzBzFXc3asUE2V8xISf99v2LYU74eQOwVIYxLJ6G6qpUpkiK4+
         c6Zh4V15hzt6+Wg7udzURAOK1CWXdAAgDnxBfLlGezdOvuVckN/MEkwKM2o2Nr2CJUaX
         RciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792972719; x=1793577519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikb9/V5iAlmy8zH9iEswyqh7X1ACy082GM3v+SCnybM=;
        b=VTaJVwBAwoXcwuIpELhuf2mvyN7DZLnXJNB6sn++PglWNJ3ywcpD2FOrMGQqMI1F0f
         IAqNL/R6RMmHAdgwX0tvfxsNWc1hc/k3i9VgEkGzgbWHQKLSuvrHHEGTXCOz/9X8Z+bx
         5wiAAdaAFrals3P2hROcYqIqpVuJ1E3O+KyJwyExdjYlIh72FVWWjwySfJlZx5wEquBW
         rV+6cTc/a9CSbcRMpGd3mpBlRjlOW/By3e2Hvnl6d9pFKWQOgugDOKkkpWUv8aAaMxh9
         KAYb+Ocq0MgOIA7Bz3z/3mc/3bk1QnDhjk6H85UqhsJcuJn/pdnze467603lB9++Mvsu
         d8CQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQtj1PCaYhgasa8qpOGkaMwsEQfYv7y9B1sfzN1VQ7Obpz/pOI2S6rbpxS5pj7f8GJUu5f23WKny1N@vger.kernel.org
X-Gm-Message-State: AFq9FYIT85vtLskx+RJoCAx/TZgiOmDX88FmuHCVB8S9cTFNLp8ATCI8
	TjcoksVZyEDxUm0rtyihLKRKrStAcd6hPAwX8nKxDxwdIXDgLXEWdUv3lUV4wCfPrE1fysGIedh
	lnwkvNDYmfBei+5Ng3wHTnz8Atzuobkm7AQkd
X-Gm-Gg: AYBFou0lgk2s5wRCqQJjSjvWFT1+rkprjYhWJyyokoXUGGUxlfD/8pcSX+HmA/QTC/o
	u5aRGbwtWQue32j779l8PZqgdn70to5efBAkTpnG5rWnvrGroNu1D0UWWl1Lv+YLnxRuB4LroqQ
	5n0UYUa1hLl0MJv1A1VfMiOjqVWXQXpNB8lV0DukVaEKKT9jyN3g8pnQToKnEEDrLgtnZdsoHyb
	tMhJa9EdXVM4BzojBEOWua3xx4pfCdoRDgEVZy7E05TzELuUeYaHWdQA0UgiH2RooQCz7hMspbD
	DXHpuct2dcXwrkhpbTnorVCYbJEbIWaSGavKVMZ+VFNADKfV0T6mf1i4uqKOF5wUWshgZcNvoM6
	Q+4vBqBcmCYq8xir4YoOC85ch349PT04DxqlAwUih72ztfb5PE9Bk35mcZZg0SAWMESHE
X-Received: by 2002:a05:6122:4b08:b0:5ea:ea07:b119 with SMTP id
 71dfb90a1353d-5ec232ecafcmr1748107e0c.16.1792972718622; Sun, 25 Oct 2026
 16:58:38 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-sunxi-orangepi-3-lts-v2-0-70b899252c6a@gmail.com>
 <20261022-sunxi-orangepi-3-lts-v2-2-70b899252c6a@gmail.com> <sashiko-outbox-181088@kernel.org>
In-Reply-To: <sashiko-outbox-181088@kernel.org>
From: Cristian Filipescu <filipescu.cristian@gmail.com>
Date: Sun, 25 Oct 2026 16:58:27 -0700
X-Gm-Features: AclHuK8RB7C1lose4hGybdb-vlgT7R9BOK8Q4taPUha9OJ1M6_c3vVkZYCkcIoI
Message-ID: <CAH87RzS2HTqRS=JjYiU=dRfvJp4nTiZCih-jy9CFyFB=ZnanYA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
To: sashiko-reviews@lists.linux.dev
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the report. Both issues are addressed in my local v3 draft.

The LEDs now default to green power on and red status off. Both also
use drive-strength 10, verified on the board.

PHY reset is now on the MDIO bus, with the explicit YT8531C PHY ID.
Five interface down/up cycles and three MAC unbind/rebind cycles
passed DHCP and ping, retaining the configured 125 MHz clock output.

I also tested 1.8 V eMMC DDR52 at 50 MHz and HS200 at 150 MHz.
Repeated reads and patterned writes passed in both modes, with zero
reported MMC errors and the original data restored and verified.

I'll allow more time for review before posting v3.

Regards,
Cristian Filipescu
------------------------------------

On Wed, Oct 21, 2026 at 11:21=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] arm64: dts: allwinner: per-PHY reset-gpios and c22 compatible br=
eak YT8531C
> - [Medium] arm64: dts: allwinner: orangepi-3-lts: swapped LED default-sta=
te values
> --
>
> commit e75611867d87d079b20765ad9c1ddf5482d2d71a
> Author: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
>
> This commit adds a device tree for the Allwinner H6-based Orange Pi 3 LTS
> board, describing its regulators, storage, wireless module, LEDs, USB por=
ts,
> HDMI, and Motorcomm YT8531C Gigabit Ethernet PHY.
>
> Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-3-jernej.s=
krabec@gmail.com/
>
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts=
 b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > new file mode 100644
> > index 0000000000000..e6aa0b2e17ebe
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> [ ... ]
> > +     leds {
> > +             compatible =3D "gpio-leds";
> > +
> > +             led-0 {
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_RED>;
> > +                     gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 *=
/
> > +                     default-state =3D "on";
> > +             };
> > +
> > +             led-1 {
> > +                     function =3D LED_FUNCTION_POWER;
> > +                     color =3D <LED_COLOR_ID_GREEN>;
> > +                     gpios =3D <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 *=
/
> > +                     default-state =3D "off";
> > +             };
> > +     };
>
> [Severity: Medium]
> The commit message notes that the green PL7 LED is used as the power
> indicator. When gpio_led_probe() -> create_gpio_led() in
> drivers/leds/leds-gpio.c parses the leds node, led-0 (red PL4,
> LED_FUNCTION_STATUS) is turned on and led-1 (green PL7, LED_FUNCTION_POWE=
R)
> is turned off.
>
> When the LED functions were swapped relative to sun50i-h6-orangepi-3.dts,
> were the default-state values on led-0 and led-1 accidentally left unswap=
ped?
>
> > +
> > +     reg_gmac_3v3: gmac-3v3 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "gmac-3v3";
> > +             vin-supply =3D <&reg_vcc5v>;
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             startup-delay-us =3D <150000>;
> > +             enable-active-high;
> > +             gpio =3D <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
> > +     };
> [ ... ]
> > +&mdio {
> > +     ext_rgmii_phy: ethernet-phy@1 {
> > +             compatible =3D "ethernet-phy-ieee802.3-c22";
> > +             reg =3D <1>;
> > +
> > +             motorcomm,clk-out-frequency-hz =3D <125000000>;
> > +             rx-internal-delay-ps =3D <1950>;
> > +             tx-internal-delay-ps =3D <1950>;
> > +
> > +             reset-gpios =3D <&pio 3 14 GPIO_ACTIVE_LOW>; /* PD14 */
> > +             reset-assert-us =3D <15000>;
> > +             reset-deassert-us =3D <100000>;
> > +     };
> > +};
>
> [Severity: High]
> Will the YT8531C PHY fail to probe or lose its 125 MHz clock output with
> compatible =3D "ethernet-phy-ieee802.3-c22" and reset-gpios placed on the
> ethernet-phy@1 node?
>
> First, during MDIO bus registration:
>
>   sun8i_dwmac_init()
>     regulator_enable(gmac->regulator) /* enables reg_gmac_3v3 (PD6) */
>   stmmac_mdio_register()
>     of_mdiobus_register()
>       __of_mdiobus_parse_phys()
>         fwnode_mdiobus_register_phy()
>
> In drivers/net/mdio/fwnode_mdio.c:fwnode_mdiobus_register_phy():
>
>         is_c45 =3D fwnode_device_is_compatible(child, "ethernet-phy-ieee8=
02.3-c45");
>         if (is_c45 || fwnode_get_phy_id(child, &phy_id))
>                 phy =3D get_phy_device(bus, addr, is_c45);
>         else
>                 phy =3D phy_device_create(bus, addr, phy_id, 0, NULL);
>         if (IS_ERR(phy)) {
>                 rc =3D PTR_ERR(phy);
>                 goto clean_mii_ts;
>         }
>         ...
>         } else if (is_of_node(child)) {
>                 rc =3D fwnode_mdiobus_phy_device_register(bus, phy, child=
, addr);
>
> Because compatible is not "ethernet-phy-id4f51.e91b" (which is also requi=
red
> by Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml),
> fwnode_get_phy_id() fails and get_phy_device() -> get_phy_c22_id() reads
> MII_PHYSID1 and MII_PHYSID2 over MDIO before
> fwnode_mdiobus_phy_device_register() -> phy_device_register() registers a=
nd
> deasserts the per-PHY reset-gpios (PD14):
>
>   phy_device_register()
>     mdiobus_register_device()
>       mdio_device_register_reset()
>     phy_device_reset(phydev, 0)
>
> If PD14 is low when the kernel boots (for example, when U-Boot has not
> initialized Ethernet) or on driver rebind after phy_device_remove() asser=
ts
> reset, the PHY is still held in reset during get_phy_c22_id(), causing MD=
IO
> reads to return 0xffff and PHY registration to fail with -ENODEV.
>
> Second, because reset-gpios is attached to the PHY node rather than the M=
DIO
> bus, bringing the network interface down calls:
>
>   stmmac_release()
>     phylink_disconnect_phy()
>       phy_disconnect()
>         phy_detach()
>           phy_device_reset(phydev, 1)
>
> This asserts hardware reset on PD14, resetting YTPHY_SYNCE_CFG_REG back t=
o
> its 25 MHz default. When the interface is brought back up via stmmac_open=
()
> -> stmmac_init_phy() -> phylink_fwnode_phy_connect() -> phy_attach_direct=
()
> -> phy_init_hw(), PD14 is deasserted and yt8531_config_init() runs, but
> motorcomm,clk-out-frequency-hz is only applied once in yt8531_probe() in
> drivers/net/phy/motorcomm.c:
>
>         if (device_property_read_u32(dev, "motorcomm,clk-out-frequency-hz=
", &freq))
>                 freq =3D YTPHY_DTS_OUTPUT_CLK_DIS;
>         ...
>         return ytphy_modify_ext_with_lock(phydev, YTPHY_SYNCE_CFG_REG, ma=
sk,
>                                           val);
>
> Should ethernet-phy@1 use compatible =3D "ethernet-phy-id4f51.e91b" (or m=
ove
> the reset handling so the PHY is out of reset before ID reads and not har=
d
> reset across interface down/up cycles)?
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-sunxi-or=
angepi-3-lts-v2-0-70b899252c6a@gmail.com?part=3D2
