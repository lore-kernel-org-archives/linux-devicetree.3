Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7978C3F7A9E
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782722920; cv=pass; b=T/JTF/H8UaqRGIfGfkp8aCwt9MOfJjDW4LFGyskTkpsa19WxjvAB96c6tw4dwh44+0F6W03y6Nd/8QIMgcJiBNyJEagLH7LmmLBAT2jh1hqKHoOOmejbbS6lifPNgAKnvAwGaIs3OjjLyNavHR/ONs7zOyUl00+8SNU9cAmEfe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782722920; c=relaxed/simple;
	bh=vlj9kY1XGfqdtCgT3fZ5VL5CEwYNVtFcBJZbVqediMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RIILe9Y8r7InuNBtj+i8Sx6sfhmbusRmvJPAfh1o1twFsFvvNtlYTd4Ll8SJq0776+CCvZ+AeVANXw8DaXAxdKeTDoZ3ZmS79odCyp7zCSq3UNtpOjfXWDd3AlyANi50eo6z+FUa2T0KJ/IsNwha9zfrBkoBPwPGpYr/xWcAQYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ng7b0ekZ; arc=pass smtp.client-ip=209.85.210.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ng7b0ekZ"
Received: by mail-ot1-f65.google.com with SMTP id 46e09a7af769-7e94cd6f99aso3500376a34.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 01:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782722917; cv=none;
        d=google.com; s=arc-20260327;
        b=cA39tOEwpp+LV1mjvj1ezHvuNGzgP4UkJxYCcU084sPIpRmJhxdmF1bmhfLONb/MdR
         LoQP0lx0KG5Puv0t/V+PxSa9iMmLIiR3XCtO9A8Izrb87N4SBJZgIKNBj2i0lmyJVUcW
         PsKEt5XPDfQj5/Ddwf7jhpgF/xXgwKR3SGY5WG5szOvuQ76VkInJASowAY4jbWuhngCk
         abbrcnWfzIXL/TobAmKcPoztDdAoYB+osEy+uv7IB0wZpPbTaoUqLyBq58mS4I6l1lLd
         eUzQIrgnoDsa8hRyVl2ZaW7zpY5iziyLpVT8PLoQXglks4hfUMvk2VTDw6wzNirPfS7d
         JunA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aUFVwir31Lt9p8bnST+2MesNqx8N4BFQ0O5QuspoUJc=;
        fh=Y+2TKyPDrkTbFB0vU9c/lmUzEWg1mqC1WVwuewVZX5s=;
        b=XUHCTXl/sCbAwaJiAaTUPSuthHJ+Tgmk+yMT03w/cySQMRiDoAYiUAk7YQO17kwqbW
         vZx7HpBVEDmoRHYjaxASOBwF7Bj1ApuY7q/NE2z0GyQaftKHbVGIXC3kAWZ1vI5op85u
         SdHVKMWXJc37u2sdEnAAIRO1HZdzwvtd9yhRwUR/BxZyfblFWwkDtc9OtJXY2ce0weV1
         JKUlvFaijTDldtU2kKmYq+BepVtLIhbCSPeiPRoBt6py8RVzvW8m6fwJVw63n5S1lmvh
         opd//V82czOfFcFu4pBZOha3WG/NToDKsTZuqREELnlY3yfsmZtwlMvlTHu2F2er8GoZ
         aiTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782722917; x=1783327717; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUFVwir31Lt9p8bnST+2MesNqx8N4BFQ0O5QuspoUJc=;
        b=ng7b0ekZVAGD3S+9QXiLEeiODCWqMGwMVK86QdlhWCTWlqdf0Ao7gt2cCmlbTgPpAo
         e7lzy+C/sfLB1zTgBBcBYWr2hLcKzi8Di/64SK2T5ob0FIJvsaaw4lJWggi5q4e1QXU/
         FnXsuom7xC55PLfyIFINBEaEbx0Q9czAF4yCWh83Bel3kQtbMkG4Ear9AcDb74QWk7kD
         xdcZ+ePqHZy8MCOtf9YQVW/CXnJHHUELWvN0+rH6Z9S2kQwNkZvRqYUYQe/5ktqNyjcT
         m4cvJFHufgOkNUNE5PFufoZWob469NX5ukAa24LaXUTXUhNS9jRmUdEMd6VFbLIJrITE
         dr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782722917; x=1783327717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aUFVwir31Lt9p8bnST+2MesNqx8N4BFQ0O5QuspoUJc=;
        b=Ri4+/mSByMACToSNeLvyoiy3JcitxT/hTPyvI7xcellScbEYeuz8S23bTV4tXh52E6
         J6Si5fjSAxM8l2IPpn7gQvznSbnKDjZqU9hm36sd18rdb13X9ePOeB+gAQK57NBxv7lV
         wY2EhNhJCHqkVgG+7DVx3FsZpCLs59jZqeVB/pGgBDs3emgcEaY93bkDw7KZFc2jaE7F
         66Yw5On/dfh25ME/uTH5qUftmE98YzSvNCb7DOqqmAg2i6QEgSH9RQbnMuUPcS5j+nzT
         VwWnXeUQazhqU8k58/rYjZyvPcBRKHgWSA7HVL88IaRUcJQZ+RHUT5sxTK0DKv2jrUX5
         ll6w==
X-Forwarded-Encrypted: i=1; AFNElJ9lSDGqB1v8rpcZ8XqhvFNw7M5yagWL4kmNRFBt9dqd9RBu06/uy10ytvw2xXYboJTwGKDk/RRTwFtu@vger.kernel.org
X-Gm-Message-State: AOJu0YwY54E1HKUqDQVzIiiHWi9EQL11dpMIfsp4lu/ggTPVKw8tRue8
	LO77dDZQDAey/t9DaT3GxL88Yq4AwZc3R8fI29MdKiFJXHXjI+r+D59puxsBokA0LrhPGE/M4S4
	BQ5utRD3LUQGf+KZtgurhyAKa4PVbe7Q=
X-Gm-Gg: AfdE7ckmex5sGYdPF79Y5a9YgRLTnyLD1Aq0QNSwt2sNYRSK5vtfYseYnvhsNA7YJq0
	mdExQoFxQfeG63DgXEPb6+S6y8TSYURSm3urmzDBK1yuPfxKlPjsRZSF5LQvCuiEr163eOIZ+7p
	wjGuQQr/srW36tbveso2xj4OuMO/E6wLH7RpSJMxXDe+EMce9Dm1a28Jsb8PCoe7r4+RSfD/6ER
	dDEtedK39BzbrRGTXlXCd7Klnryh+GzardFVesp0kUhrv7UjNnpsHUefduwztf+gw09CRJIWaY3
	UaXyor73OrE=
X-Received: by 2002:a05:6830:4902:b0:7e9:b4d0:539c with SMTP id
 46e09a7af769-7e9b4d05cb4mr7597336a34.29.1782722917221; Mon, 29 Jun 2026
 01:48:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260627225755.1710837-2-coiaprant@gmail.com> <20260627225755.1710837-6-coiaprant@gmail.com>
 <20260627230820.8C6AA1F000E9@smtp.kernel.org>
In-Reply-To: <20260627230820.8C6AA1F000E9@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Mon, 29 Jun 2026 16:48:24 +0800
X-Gm-Features: AVVi8CfuknIVpEUVONl1MaX488tBt0lHnX7_3hgzJaRxPHZonPlvSzmvsY1S_nE
Message-ID: <CALj3r0iZzrJUiEa4E8jftrZYcPxik7JoCXSt-zSh5c-6jzaQHQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add devicetree for the
 Graperain G3568 v2
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B46=E6=9C=8828=E6=97=A5=E5=91=
=A8=E6=97=A5 07:08=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [Medium] Incorrect `press-threshold-microvolt` values in `adc-keys` use=
 boundary midpoints instead of nominal voltages, causing the MENU button to=
 misregister as ESC.
> - [Medium] The WiFi SDIO interface specifies `keep-power-in-suspend`, but=
 its I/O voltage supply (`vcc_1v8`) is configured to turn off in suspend, b=
reaking Wake-on-WLAN.
> - [Medium] The AP6356S Bluetooth UART is missing hardware flow control pr=
operties and the required Bluetooth child node.
> - [Low] The deprecated `gpio` property is used instead of `gpios` in fixe=
d regulator nodes.
> --
>
> commit 13181564cb78799e1d57eb0995588d8e839f22a5
> Author: Coia Prant <coiaprant@gmail.com>
> arm64: dts: rockchip: Add devicetree for the Graperain G3568 v2
>
> This patch introduces the device tree for the Graperain G3568 v2, an RK35=
68
> based development board. It configures the hardware peripherals including
> ethernet, storage, wireless, and power regulators.
>
> Link: https://image.chukouplus.com/upload/C_153/product_file/20211022/6da=
ddec9e400458816dd4c57ba807fc3.pdf
> Link: https://blog.gov.cooking/archives/research-graperain-g3568-v2-and-f=
lash.html
>
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts=
 b/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
> > new file mode 100644
> > index 0000000000000..221992d6c6003
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
> > @@ -0,0 +1,894 @@
>
> [ ... ]
>
> > +     adc-keys {
> > +             compatible =3D "adc-keys";
> > +             io-channels =3D <&saradc 0>;
> > +             io-channel-names =3D "buttons";
> > +             keyup-threshold-microvolt =3D <1800000>;
> > +             poll-interval =3D <100>;
> > +
> > +             button-esc {
> > +                     label =3D "esc";
> > +                     linux,code =3D <KEY_ESC>;
> > +                     press-threshold-microvolt =3D <1250000>;
> > +             };
> > +
> > +             button-menu {
> > +                     label =3D "menu";
> > +                     linux,code =3D <KEY_MENU>;
> > +                     press-threshold-microvolt =3D <1600000>;
>
> [Severity: Medium]
> Will this cause the menu button to misregister as esc?
>
> The adc-keys driver uses a nearest-neighbor algorithm to match the ADC
> reading to the button. Since the commit message indicates the nominal
> voltages are 1.1V for ESC and 1.4V for MENU, an ADC reading of 1.4V from
> pressing MENU is closer to the ESC threshold of 1.25V (0.15V difference)
> than the MENU threshold of 1.6V (0.2V difference).
>
> Could we use the exact expected nominal voltages here instead of the
> boundary midpoints?
>
> [ ... ]
>
> > +     vcc5v0_usb_host: regulator-vcc5v0-usb-host {
> > +             compatible =3D "regulator-fixed";
> > +             enable-active-high;
> > +             gpio =3D <&gpio0 RK_PA6 GPIO_ACTIVE_HIGH>;
>
> [Severity: Low]
> Is this using the deprecated gpio property?
>
> The standard regulator-fixed binding expects gpios instead of gpio, which
> can cause device tree schema validation warnings.
>
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&vcc5v0_usb_host_en>;
> > +             regulator-name =3D "vcc5v0_usb_host";
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             vin-supply =3D <&vcc5v0_usb>;
> > +     };
> > +
> > +     vcc5v0_usb_otg: regulator-vcc5v0-usb-otg {
> > +             compatible =3D "regulator-fixed";
> > +             enable-active-high;
> > +             gpio =3D <&gpio0 RK_PA5 GPIO_ACTIVE_HIGH>;
>
> [Severity: Low]
> Would it be better to use the gpios property here as well to match the
> regulator-fixed device tree binding schema?
>
> [ ... ]
>
> > +/* used for AP6356S WiFi */
> > +&sdmmc2 {
> > +     bus-width =3D <4>;
> > +     cap-sd-highspeed;
> > +     cap-sdio-irq;
> > +     keep-power-in-suspend;
> > +     mmc-pwrseq =3D <&sdio_pwrseq>;
> > +     non-removable;
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&sdmmc2m0_bus4 &sdmmc2m0_cmd &sdmmc2m0_clk>;
> > +     sd-uhs-sdr104;
> > +     vmmc-supply =3D <&vcc3v3_sys>;
> > +     vqmmc-supply =3D <&vcc_1v8>;
>
> [Severity: Medium]
> Will this configuration break Wake-on-WLAN and SDIO communication on resu=
me?
>
> This node specifies keep-power-in-suspend, but the vqmmc-supply is set to
> vcc_1v8. Looking at the vcc_1v8 regulator definition (DCDC_REG5) earlier =
in
> the file, it is configured with regulator-off-in-suspend.
>
> Cutting power to the SDIO I/O domain during suspend violates the power
> sequencing for keep-power-in-suspend and prevents out-of-band wake interr=
upts
> from signaling the host.
>
> [ ... ]
>
> > +/* used for WiFi/BT AP6356S */
> > +&uart8 {
> > +     pinctrl-0 =3D <&uart8m0_xfer &uart8m0_ctsn>;
> > +     status =3D "okay";
> > +};
>
> [Severity: Medium]
> Does this Bluetooth UART configuration need hardware flow control and a
> device child node?
>
> High-speed Bluetooth modules like the AP6356S generally rely on RTS/CTS t=
o
> prevent buffer overflows, but the uart-has-rtscts property and the
> uart8m0_rtsn pin configuration are missing here.
>
> Additionally, without a bluetooth child node (such as compatible =3D
> "brcm,bcm4345c5"), the kernel's HCI UART driver might not be able to prob=
e
> and initialize the module automatically.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260627225755.17=
10837-2-coiaprant@gmail.com?part=3D3

Thanks for the thorough review.

Here are my responses to the issues raised:

1. ADC Keys threshold (Medium)

The current threshold values (1.25V for ESC and 1.6V for MENU) are intentio=
nally
set to midpoints, as the adc-keys driver uses a nearest-neighbor algorithm =
to
match ADC readings. These midpoints provide the largest decision margin and
minimize the risk of mis=E2=80=91detection. I have verified the functionali=
ty with
evtest, and the buttons are correctly recognized. Therefore, I will keep th=
is
configuration unchanged.

2. GPIO property in fixed regulators (Low)

This is correct that gpios is the preferred property now, and gpio is
deprecated.
Since this board and the X3568 v4 share almost identical hardware, I plan t=
o
address this for both boards in a separate, follow=E2=80=91up patch series =
to ensure
consistency.

3. SDIO vqmmc-supply and regulator-off-in-suspend (Medium)

This is a valid concern. The configuration conflict between
keep-power-in-suspend
and regulator-off-in-suspend is indeed problematic. However, this same patt=
ern
appears in many existing RK3568 board files and appears to be a historical
mistake that has been copied across multiple devices. I believe this should=
 be
fixed systematically at the platform level rather than on a per=E2=80=91boa=
rd basis.
Should we submit a separate patch series to clean up this issue for all RK3=
568?

4. Bluetooth UART flow control and child node (Medium)

Agreed that hardware flow control (uart-has-rtscts) and a Bluetooth child n=
ode
are required for proper operation. Since this is a common requirement
for similar board
 (X3568 v4), I will address this in a separate follow=E2=80=91up patch seri=
es
to improve consistency
 across the platform.

If there are no more questions, I will submit PATCH v2.

Thanks.

Best,
Coia
