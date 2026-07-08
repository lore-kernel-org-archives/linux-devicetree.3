Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B373A8750
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 04:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783484769; cv=pass; b=QbTQvvHNCvqcHOb2NiZ71kLqV9F5iwmdFECnwiS8jIYBO8t5GwLoCdTJZaKZw7OMLJIMWYxAnGdPRwTh8P+HpPKG45JwMqkmLbKvAvU5aS+Q0dLOOKDJROKsrYzNSGURIWvyMx0l9iXXKfp1AambOgXv8epwImWZLa6Eie9EcfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783484769; c=relaxed/simple;
	bh=D2K6Gs/SGHqAkH7SsYRGxQRhWxfPmqeGz9Tb0hfAwas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9DcUUeugPpKhd2oiwGTKCFfUDuzJ8yhltPWsiwyiZLB9jmdnHBYd4m3XoZVSOrtULOSvO5ReVM4GXXaNzljJ/XsD4JbWWQYwhI4yN38LfD6lQwsUcbGONXmQ8VJBKkuPdmP3ravCg1Rg/dT/ia1qSNPq9T5/+g74qbJYjOtkko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=asdpohgg; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="asdpohgg"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6676fc59e59so262675d50.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 21:26:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783484766; cv=none;
        d=google.com; s=arc-20260327;
        b=rdUzP76B565yauEGDYE5iwbFL4H/1gXNrbghv6xqG3jEPozVCDikzvMqhXSvhPhX9Y
         93KvGHD8MPrTy4HmFnG885sseDIkrE6XptvtHqY5BkjSMCbI7tEL3xyW2KB3wUGvi+VA
         JoFzn32jc4O9s9zsdXHRn1PZHXQ4I/ldfsmfZYRK7PK1rc9G8czed1XVV5p74p4WD3ea
         Ks9AswcJlZK6d4iVslzBWDBueFiiwfap0DLu9gZZl6iSk2BjAdCMd4V+rURp9Hl1pVcI
         Y2Xz9DKHxkZYRMZ4wH2faA8oLbPalBPMsxiri0VjEnvsobv0ACGY0GE5Wm94vh25FLD4
         UqTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9TWqEVDO1Px1PCZICb5KMgjoiJimA/1tHVt9yLna+xE=;
        fh=Il47gtDCHKM81xFeICPIVOj63I6fWYpmyyfoqcH2eN4=;
        b=j5ykSrNVCGU0Q76SXEb3FgEn7nLnh4C2SFMvF8fi7vfuq9lS8gYe6S0ib4/CgOMwUW
         fujEtiWqfDElyVI3343YBZgMkkG3lE8zJN6ZL8nNqK1pL0SzpbMmUozHefui4Mc0n8n2
         3iwxdvHi03VOFu5yOmkDrEg6tmEUnOCw2Hzvt2eAVmANknKIv2/5+oG3Cck3l4Z3U1OW
         Hko/5mPh+mZd86puS9yUtjqDGuWIcWzyFTGh8aOOlkJ6l4ESLBrMQWpLIdw7WtHainNA
         GJ5KgprM9tuEoJRRoUToy8CBA0WHR6hv4/br8ZVgGwwLXnBvzmmw6INm5m8G7i+QTscP
         AvAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783484766; x=1784089566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9TWqEVDO1Px1PCZICb5KMgjoiJimA/1tHVt9yLna+xE=;
        b=asdpohggVD+u3+Fk0fZ8+iymSHtA4PsvEu++Ex7+EbeVcdwj8JNHsVJiDTyO2wjzLL
         Frd6qmlhLdOeIMb+hoZcWqGpQmc+ICfhkoRlUo1NdhyMl5zeoKZdVhmilkTOu0fdQJ8I
         0aH/32faxfmZJS5uuTaPcl0nHsHRqXMFLU1jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783484766; x=1784089566;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9TWqEVDO1Px1PCZICb5KMgjoiJimA/1tHVt9yLna+xE=;
        b=raTwaMcFvRSzZ3dh94AnSUFaSieZMHK2VnjkhoL8nKBH4hNSPlgoUtrWuuAy0Vyifj
         +ipCZ0LOg2nzTDxJu25rVUm5giHUgl/Vy0WRhYa4ipxg1dlM9U5doH3inZExFLivGNE5
         DzgeLv+hKps94zm3P+ZMB3F+qyH2jB51Lq5GaUMDBLO+wq5e/eQ3hnNCiXuT1kYU09JT
         weL5jXbf2XguGQWNgPJEQ2PZyqH+PtRkBQCRuwDF0inSo6Y2OGrcKz4D7xRzw3FmQaX2
         CBQHxj8To5/X6T7wDY64tFOVrEJRiqr+qJwViQT6PK1rdKAV2i1R6hifZuHP2iRm1Hfc
         TeDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rol8emt/q6cUrcb9VihZVAboUVLzTHYoOUAhLoiBkEK16pP+vZJYbfOf9eeZldfY5vdIDlZRgVlFPAC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Dmjy7nF1E3qgqcdV1bz+AxNz+RYVf0TxiDbYqnkp8hRyvFPk
	+VW3axZQ4AxNGcrw7MZyjv82grrt+KO84SKFIR9yjpj4UzOf7ekM/MPS/+ss7YsSRoE+rqUXW6w
	5Q+yXfRNgTDFF1nEn/balWKjoA0oUPmuXApXq4a/U
X-Gm-Gg: AfdE7cmUDAQ6M3genmCkhA34v0mdNzxM9MIE8Pt2XneGabfKZz2JyIfYcjnTTxB2iWU
	v6PIgQz5MSzBu81vGkA/HWFTgwa/nMbYjP1HPKs+r8KKYFffJBm1dUC4E0DMzyzcAgRsgiTJrP4
	iZ2VRAVwWODx/j9vMYKI9iawGl6l5lOx1xxf9mNElnv8Xtypz6jRhKxLlGomAW5+lA2BNLuk0ev
	58uQwUZKQzeW6nD0xVKtZK+eypyvaFe+C4SqXCFxLQa1zYfPvlVE1jfLaapKv1QP9hXWt4ymt1p
	y2FoDLEonGwU9mdXRHBL6r4CHXs=
X-Received: by 2002:a05:690e:1916:b0:662:dcc4:c6bb with SMTP id
 956f58d0204a3-6679f0909a2mr589124d50.37.1783484766428; Tue, 07 Jul 2026
 21:26:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707104427.3409290-1-wenst@chromium.org> <176dd24c-c3cf-4ab9-8497-594ed65d10ec@collabora.com>
 <CAGXv+5F86JU9+LPSy8PtuCPrdhBnvcA=PX1d++Yh3u7mK_Jxmw@mail.gmail.com> <94c10212-9c27-4875-8a88-78bfb67fb382@collabora.com>
In-Reply-To: <94c10212-9c27-4875-8a88-78bfb67fb382@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 8 Jul 2026 12:25:55 +0800
X-Gm-Features: AVVi8CdMjcjDEO3nU05c3hnTSzfBa4pXETiFq-WswvUgQmZHYpqwsoBeVo-3znY
Message-ID: <CAGXv+5EsWVbLtUP6b75fvkDVSqUDoAOA1t3hPO4cA9sAA02=WA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 7:24=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/7/26 13:08, Chen-Yu Tsai wrote:
> > On Tue, Jul 7, 2026 at 7:05=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> On 7/7/26 12:44, Chen-Yu Tsai wrote:
> >>> The Geralt design uses a MT6319 PMIC to power the big cores and LPDDR=
4X
> >>> DRAM.
> >>>
> >>> Add a device node for it and hook up all the supplies.
> >>>
> >>> This change requires a firmware fix for the SPMI bus to read back
> >>> correctly. The required firmware version is 15842.175.0. This is
> >>> included in ChromeOS releases R150-16700.22.0 (available in Beta
> >>> channel as of writing or stable channel in mid-July) or
> >>> R151-16721.0.0 and later.
> >>>
> >>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >>
> >> This is a big problem then.
> >>
> >> I take it as if the firmware fix is not in place, probing the CPU powe=
r supplies
> >> will fail, with all the consequences.
> >
> > That's right.
> >
> >> This means that with this, we're breaking all Geralt machines with old=
er firmware,
> >> which is not acceptable...
> >>
> >> ...so this needs a different solution, or strong reasons to make me un=
derstand that
> >> I'm wrong, if I'm wrong.
> >
> > We can drop the CPU supplies (they don't matter since cpufreq is hardwa=
re
> > driven) and just add the regulators. How does that sound? If the firmwa=
re
> > isn't updated, the PMIC will fail to probe, but since nothing is using =
it,
> > the system will continue to work (with some annoying error messages).
> >
>
> That'd be wrong, but less wrong than not having anything described...

Yeah. As I said, it doesn't affect usability.

> ...I wonder if, at this point, you could set the SPMI node to status =3D =
"fail" and
> have the *new* firmware override that to "ok".
>
> That's the only reasonable way to go forward, IMO.

I'm afraid it is unlikely to get a firmware release to fix a non-critical
issue. We were fortunate that there was an actual critical issue being
fixed that allowed me to merge the small fix for the SPMI controller.

I think it would be great if everyone could update their OS and firmware,
but I understand that some devices never get updates, such as those in
board farms that never boot into ChromeOS.


ChenYu

> Of course, avoid having the firmware adding the CPU supplies, because tha=
t would
> be rather sketchy then. Just "if spmi status fail found, change to ok".
>
> Cheers,
> Angelo
>
> >
> > ChenYu
> >
> >> Cheers,
> >> Angelo
> >>
> >>> ---
> >>>    .../boot/dts/mediatek/mt8188-geralt.dtsi      | 66 +++++++++++++++=
++++
> >>>    1 file changed, 66 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/a=
rm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >>> index f382f90c48f5..fea52c377d88 100644
> >>> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >>> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >>> @@ -4,6 +4,8 @@
> >>>     */
> >>>    /dts-v1/;
> >>>    #include <dt-bindings/gpio/gpio.h>
> >>> +#include <dt-bindings/spmi/spmi.h>
> >>> +
> >>>    #include "mt8188.dtsi"
> >>>    #include "mt6359.dtsi"
> >>>
> >>> @@ -241,6 +243,14 @@ &cpu5 {
> >>>        cpu-supply =3D <&mt6359_vcore_buck_reg>;
> >>>    };
> >>>
> >>> +&cpu6 {
> >>> +     cpu-supply =3D <&mt6319_buck1>;
> >>> +};
> >>> +
> >>> +&cpu7 {
> >>> +     cpu-supply =3D <&mt6319_buck1>;
> >>> +};
> >>> +
> >>>    /*
> >>>     * Geralt is the reference design and doesn't have target TDP.
> >>>     * Ciri is (currently) the only device following Geralt, and its
> >>> @@ -1156,6 +1166,14 @@ pins-bus {
> >>>                };
> >>>        };
> >>>
> >>> +     spmi_pins: spmi-pins {
> >>> +             pins-bus {
> >>> +                     pinmux =3D <PINMUX_GPIO175__FUNC_B0_SPMI_M_SCL>=
,
> >>> +                              <PINMUX_GPIO176__FUNC_B0_SPMI_M_SDA>;
> >>> +                     bias-disable;
> >>> +             };
> >>> +     };
> >>> +
> >>>        uart0_pins: uart0-pins {
> >>>                pins-bus {
> >>>                        pinmux =3D <PINMUX_GPIO31__FUNC_O_UTXD0>,
> >>> @@ -1267,6 +1285,54 @@ &spi2 {
> >>>        status =3D "okay";
> >>>    };
> >>>
> >>> +&spmi {
> >>> +     pinctrl-names =3D "default";
> >>> +     pinctrl-0 =3D <&spmi_pins>;
> >>> +     #address-cells =3D <2>;
> >>> +     #size-cells =3D <0>;
> >>> +     status =3D "okay";
> >>> +
> >>> +     pmic@6 {
> >>> +             compatible =3D "mediatek,mt6319-regulator", "mediatek,m=
t6315-regulator";
> >>> +             reg =3D <0x6 SPMI_USID>;
> >>> +             pvdd1-supply =3D <&pp4200_s5>;
> >>> +             pvdd2-supply =3D <&pp4200_s5>;
> >>> +             pvdd3-supply =3D <&pp4200_s5>;
> >>> +             pvdd4-supply =3D <&pp4200_s5>;
> >>> +
> >>> +             regulators {
> >>> +                     mt6319_buck1: vbuck1 {
> >>> +                                     regulator-name =3D "ppvar_dvdd_=
proc_bc";
> >>> +                                     regulator-min-microvolt =3D <52=
0000>;
> >>> +                                     regulator-max-microvolt =3D <11=
55000>;
> >>> +                                     regulator-enable-ramp-delay =3D=
 <256>;
> >>> +                                     regulator-allowed-modes =3D <0 =
1 2>;
> >>> +                                     regulator-always-on;
> >>> +                     };
> >>> +
> >>> +                     /* vbuck2 is ganged with vbuck1 */
> >>> +
> >>> +                     mt6319_buck3: vbuck3 {
> >>> +                                     regulator-name =3D "pp1125_emi_=
vdd2";
> >>> +                                     regulator-min-microvolt =3D <10=
60000>;
> >>> +                                     regulator-max-microvolt =3D <11=
70000>;
> >>> +                                     regulator-enable-ramp-delay =3D=
 <256>;
> >>> +                                     regulator-allowed-modes =3D <0 =
1 2>;
> >>> +                                     regulator-always-on;
> >>> +                     };
> >>> +
> >>> +                     mt6319_buck4: vbuck4 {
> >>> +                                     regulator-name =3D "pp0600_emi_=
vddq";
> >>> +                                     regulator-min-microvolt =3D <57=
0000>;
> >>> +                                     regulator-max-microvolt =3D <65=
0000>;
> >>> +                                     regulator-enable-ramp-delay =3D=
 <256>;
> >>> +                                     regulator-allowed-modes =3D <0 =
1 2>;
> >>> +                                     regulator-always-on;
> >>> +                     };
> >>> +             };
> >>> +     };
> >>> +};
> >>> +
> >>>    &uart0 {
> >>>        pinctrl-names =3D "default";
> >>>        pinctrl-0 =3D <&uart0_pins>;
> >>
