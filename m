Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357173803D2
	for <devicetree@vger.kernel.org>; Sat,  2 May 2026 12:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777726575; cv=pass; b=nXdDwiO0wGqPnSsgsWMn2r9QzAPETndkeddbWVe40XnCmFhFnlB99G5jG0EiD6K9fDSsSzAWKn7HsxE6PYqqIAUXWBKWTggfgdOrtWavFycZb0klKGlnvJDLqZnxffOZxk0t4wEUvQsqqDuvXrelosW0Wo/uuvLrio5q2fNSkqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777726575; c=relaxed/simple;
	bh=inxHJ4hNpFRRZqlUmBHzDKjh6vCBzL3rqVbm4R6BHQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t6IcdOv2fXq4q4oBj7JyzckxVLUTrEhWlGfIk97k3rlZVVhQuOS3rPKHXUXZe4eP427YPBGmibBugkxVMX98X7Pr2HrKnoDBHFzv+BrklyYO5KYpZPvH59CyBmAGGdT3tOJf0Vnr1wqRE1OMuAXAetpqPstky7TzubTd5rDa4kI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hbv8Vg9L; arc=pass smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hbv8Vg9L"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso781584e0c.0
        for <devicetree@vger.kernel.org>; Sat, 02 May 2026 05:56:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777726572; cv=none;
        d=google.com; s=arc-20240605;
        b=QBx5stHWxLmK1nNc0kdL7UBT2Q9U2e+jtu9ER14xsz3ZKVWrzdEZd7i/UKpOCmFzPq
         nmOvHhFFLWe3qroFy3QpPgXqGNqMQ7P4ksFQtbK+FSSlCXHnaBaiRfxEvIEssnIcjc11
         CzxaENvhMHxCO5pW44H9Zr0TdX7NZNd9pYNxE1uRRgMC8tnS82abDUE/2KqWkQsIV2bZ
         qpkbrsi30E95aQnfTxXX21yahK8SPB/v8hJ4yDjV3tZlwb8uiupWiMn4EMmpwbreNWjC
         Xy+G+CrzUV4i8sng4Mn2KV6GJaH5neKE/z7bYXyulue3Z+vteOBlijmX8bI7tA56o00U
         B6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rQ/9hJH4xIefWRJxKO3VdMr8VIxS31cte1uAKqxVPuc=;
        fh=bZPOL9VqN9H/VA1ai8b5osFBEQkgGWOy3g71P+CLxAY=;
        b=IV8mNljQnerSBJErLQ4KkCgn8hk144Mk4DvvQgpoOW+0X6P3iWnJs54NGqNboYE1mq
         bsJKDgHWPPldRXPelvmRkuEWIcCmeO0OicAgc79qYYHP+3xQenDBgDpSRiSBONmTT/fF
         AoB9ppSCSJ7Z0GvXN1Uh3SE8UkaOWyghIlduEWrgXNkv2ecJ4o6duJNIveo2qSdCjNWk
         fWUJhsiuDntnrPBOzH7wX9hlZa2+tuA6R+TROCpNM3Z+GmadXlTpNdGI+/YPHpsaxCpx
         fSTakSCUD+VwTkYRfV/jWBh+2G5joDNCAM0ui9Qq4PcO01DTjU76Hy1Nf8/ZOkJu7yjd
         X8Tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777726572; x=1778331372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQ/9hJH4xIefWRJxKO3VdMr8VIxS31cte1uAKqxVPuc=;
        b=Hbv8Vg9Lq7VSIjcBxIfMDTYRPS7vkuu4RsKlrkO4CDhdLpNsOorAwXct8Jqj1CPJFZ
         CJqRoi8uQ6YhDwX6as/MgTwlkG8GJC8BtimCt4G2Yb8RgDTshs3k6h6LGHWfZCYu7qua
         TziLpunQQemiLuZ+atsVurWWpZ6Gj9uxPw9wTwn8qID6n1+0O1uj6Mr7EhfsCbZuXjzQ
         TstBOkS10Qa7GalntzfBmsZ+6IagDBO0ae5r3xYRQTIIhseMlsm8J8NynmaK0wqVJ8T2
         algLW+CxwI5Xh4K91ZmPWY3yz8BD/ezwSw7ogh10n1kT8UrT3EBH12I3tEH9arOKc177
         +RbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777726572; x=1778331372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rQ/9hJH4xIefWRJxKO3VdMr8VIxS31cte1uAKqxVPuc=;
        b=WfaQhvdLSxkJsm9ZdpClfttoLYVVcuPmDT2zgh1G3XJreWjTJ7nJGtY+9gup0oD+yI
         q3dY2HXONwSm5h4N9wRHuI9jfcEtc/tfG5Vf3sv+SzqdeWeadBld8R2iK7i0D9ckhfDo
         ScyI94KYiCe3Jm8DUnydvt0mPmoaMnC4JjZuDWEBJ0c8HrbzPmsyV+i74qJGCehH+XkJ
         8gRMh+fOfZDhVcdFAWOxc92ncR9+/YeSwERmVeP4G1Kq3PdrrxGUVvaz8wvxpwnAvz05
         9Bn9PdzQEQPIUQGAHEmDhT0CUvoDg1fdWOj/2UbuHQDR514Zi1AdrUlGFxwZ7v9EUGOd
         FPoQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Gzyl/CgWjp8/JFEUcWqVqIQe69q9tjuEmeLyEPSPzXj+26rVeqqHYNM3UED8GuS14M2ixfLep+QiE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ExFeseDidev6YnFHsXJk6kYK75qZFx7Y9XI22/lwYHg+ZtRg
	LNLu5R/7wcmh2eEQK5KKYA+zFblR4F3QZk4utg2eKzHdkeYsMQyvSTEaYRCz8almttCYHFO+90B
	nb8F32H1XaUy+nX3K/uBbpkinzEtUAnc=
X-Gm-Gg: AeBDieunP8axinQKQYsFzJ5xLZMVvmCd6sJKmkD9IeKIaXNSzZeFVHkF0miIaXboDz8
	f+hY/FG2pcZWcT+4u8fKsecAjveISYqC81b/RyuqusH+JXuwU+txhxklMX65gv7O+9ezOZjKaUC
	VdO/G/IexoBvp/WWT8SdWOfwgWV5AFUI+bbBvAgQ4vLVv60lNfrdfdI8sEvJwx6WXwWuYFFtZkx
	+Yfl2JegInA2IXgGj9uF+hvfWEmTNbnDe2UctmBX5TQ60vPYgWP1hB3NiH4JPIVMgJ2OXmeHBM/
	Q2jhrflzKwP63Ig3yg==
X-Received: by 2002:a05:6102:2c86:b0:60f:928f:bf98 with SMTP id
 ada2fe7eead31-62d86a1e1f0mr1004752137.17.1777726571912; Sat, 02 May 2026
 05:56:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-5-mitltlatltl@gmail.com> <db441eb6-195e-4018-a84d-77b2d1531243@linaro.org>
In-Reply-To: <db441eb6-195e-4018-a84d-77b2d1531243@linaro.org>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 2 May 2026 20:55:19 +0800
X-Gm-Features: AVHnY4JEamCgQAP8597TEs_qCW9Vb36Gn6E1ihfX1x2hcEUZDfZo_fx-C5F4roI
Message-ID: <CAH2e8h4TYEMhjP9Vx7yYpKHAOR627Ovy2QZMT574oZPVDJX1oA@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc8280xp: gaokun3: describe rear
 camera module information as musch as possible
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Martin Kepplinger-Novakovic <martink@posteo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Martin Kepplinger <martin.kepplinger@puri.sm>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 7:00=E2=80=AFPM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> On 4/25/26 13:53, Pengyu Luo wrote:
> > The rear sensor is S5K3L6, describing it but dropping compatible
> > string, since there is no upstream driver. A funcitonal downstream
> > driver is in comment.
> >
> > The VCM is dw9714, describe it.
> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> > Please take this patch as a RFC, I am not sure, how much I am allowed
> > to add without a sensor driver.
> > ---
> >   .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 129 +++++++++++++++++=
-
> >   1 file changed, 123 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arc=
h/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> > index 39e559e91289..76b1ecb3819d 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> > @@ -22,12 +22,18 @@
> >   #include "sc8280xp.dtsi"
> >   #include "sc8280xp-pmics.dtsi"
> >
> > +/* remove due to gpio pins collision, skip 2nd instance won't break th=
ings */
> > +/delete-node/ &cci1_i2c1;
> > +/delete-node/ &cci1_i2c1_default;
> > +/delete-node/ &cci1_i2c1_sleep;
>
> Instead of removal 'cci1_default' and 'cci1_sleep' nodes shall be rewritt=
en
> by excluding 'cci1_i2c1_default' and 'cci1_i2c1_sleep' from them.
>

Should we register an unused node?

> > +
> >   / {
> >       chassis-type =3D "tablet";
> >       model =3D "Matebook E Go";
> >       compatible =3D "huawei,gaokun3", "qcom,sc8280xp";
> >
> >       aliases {
> > +             i2c1 =3D &cci1_i2c0;
>
> Likely this I2C alias can be removed.
>
> >               i2c2 =3D &cci2_i2c1;
> >               i2c4 =3D &i2c4;
> >               i2c15 =3D &i2c15;
> > @@ -52,9 +58,17 @@ framebuffer0: framebuffer@c6200000 {
> >       leds {
> >               compatible =3D "gpio-leds";
> >
> > -             pinctrl-0 =3D <&cam_indicator_en>;
> > +             pinctrl-0 =3D <&cam_indicator_en>, <&camera_flash_en>;
> >               pinctrl-names =3D "default";
> >
> > +             camera_flash: led {
> > +                     function =3D LED_FUNCTION_FLASH;
> > +                     color =3D <LED_COLOR_ID_WHITE>;
> > +                     gpios =3D <&tlmm 93 GPIO_ACTIVE_HIGH>;
> > +                     linux,default-trigger =3D "none";
> > +                     default-state =3D "off";
> > +             };
> > +
> >               privacy_led: privacy-led {
> >                       function =3D LED_FUNCTION_INDICATOR;
> >                       color =3D <LED_COLOR_ID_WHITE>;
> > @@ -129,6 +143,18 @@ vreg_camf_1p2: regulator-camf-1p2 {
> >               pinctrl-names =3D "default";
> >       };
> >
> > +     vreg_camr: regulator-camr {
> > +             compatible =3D "regulator-fixed";
> > +
> > +             regulator-name =3D "vreg_camr";
> > +
> > +             gpio =3D <&tlmm 92 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +
> > +             pinctrl-0 =3D <&camr_reg_en>;
> > +             pinctrl-names =3D "default";
> > +     };
> > +
> >       vreg_misc_3p3: regulator-misc-3p3 {
> >               compatible =3D "regulator-fixed";
> >
> > @@ -387,8 +413,8 @@ vreg_l1b: ldo1 {
> >
> >               vreg_l2b: ldo2 {
> >                       regulator-name =3D "vreg_l2b";
> > -                     regulator-min-microvolt =3D <1904000>;
> > -                     regulator-max-microvolt =3D <1904000>;
> > +                     regulator-min-microvolt =3D <1800000>;
> > +                     regulator-max-microvolt =3D <2800000>;
> >                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> >               };
> >
> > @@ -433,10 +459,9 @@ vreg_l6b: ldo6 {
> >
> >               vreg_l7b: ldo7 {
> >                       regulator-name =3D "vreg_l7b";
> > -                     regulator-min-microvolt =3D <1800000>;
> > -                     regulator-max-microvolt =3D <1800000>;
> > +                     regulator-min-microvolt =3D <2800000>;
> > +                     regulator-max-microvolt =3D <2800000>;
> >                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> > -                     regulator-boot-on;
> >               };
>
> ldo2 and ldo7 changes shall be done in separate commits.
>

Ack

> >
> >               vreg_l9b: ldo9 {
> > @@ -622,6 +647,16 @@ &camss {
> >       status =3D "okay";
> >
> >       ports {
> > +             port@0 {
> > +                     csiphy0_ep: endpoint@0 {
> > +                             reg =3D <0>;
> > +
> > +                             clock-lanes =3D <7>;
>
> Please remove 'clock-lanes' property here.
>
> > +                             data-lanes =3D <0 1 2 3>;
> > +                             remote-endpoint =3D <&s5k3l6_ep>;
> > +                     };
> > +             };
> > +
> >               port@3 {
> >                       csiphy3_ep: endpoint@0 {
> >                               reg =3D <0>;
> > @@ -634,6 +669,58 @@ csiphy3_ep: endpoint@0 {
> >       };
> >   };
> >
> > +&cci1 {
> > +     status =3D "okay";
> > +};
> > +
> > +&cci1_i2c0 {
> > +     voice_coil_motor: vcm@c {
> > +             compatible =3D "dongwoon,dw9714";
> > +             reg =3D <0xc>;
> > +             vcc-supply =3D <&vreg_l7b>; /* FIXME: require l2c on firs=
t */
> > +     };
> > +
> > +     /*
> > +      * https://source.puri.sm/Librem5/linux/-/blob/pureos/latest/driv=
ers/media/i2c/s5k3l6xx.c
> > +      *
> > +      * This sensor has never been detected on Goakun3(2.69GHz)
> > +      */
> > +     camera_rear: camera@10 {
> > +             reg =3D <0x10>;
> > +
> > +             pinctrl-0 =3D <&camr_rgb_default>;
> > +             pinctrl-names =3D "default";
> > +
> > +             clocks =3D <&camcc CAMCC_MCLK4_CLK>;
> > +             clock-names =3D "mclk";
> > +             clock-frequency =3D <24000000>;
> > +
> > +             rstn-gpios =3D <&tlmm 7 GPIO_ACTIVE_LOW>;
> > +
> > +             vddio-supply =3D <&vreg_camr>;
> > +             vdda-supply =3D <&vreg_l2b>;
> > +             vddd-supply =3D <&vreg_l2c>;
> > +
> > +             /* &camera_flash can't be enabled directly for now */
> > +             leds =3D <&privacy_led>;
> > +             led-names =3D "privacy";
> > +
> > +             lens-focus =3D <&voice_coil_motor>;
> > +
> > +             orientation =3D <1>;
> > +             rotation =3D <180>;
> > +
> > +             port {
> > +                     s5k3l6_ep: endpoint {
> > +                             data-lanes =3D <1 2 3 4>;
> > +                             remote-endpoint =3D <&csiphy0_ep>;
> > +                     };
> > +             };
> > +     };
> > +
> > +     /* eeprom@50/51 */
> > +};
>
> I believe it is unacceptable to add device tree nodes like this one
> without a compatible property. While the motivation behind it is clear,
> unfortunately it has to be removed.
>

Ack

Best wishes,
Pengyu

> > +
> >   &cci2 {
> >       status =3D "okay";
> >   };
> > @@ -1423,6 +1510,13 @@ cam_indicator_en: cam-indicator-en-state {
> >               bias-disable;
> >       };
> >
> > +     camera_flash_en: camera-flash-en-state {
> > +             pins =3D "gpio93";
> > +             function =3D "gpio";
> > +             drive-strength =3D <2>;
> > +             bias-disable;
> > +     };
> > +
> >       camf_1p2_reg_en: camf-1p2-reg-en-state {
> >               pins =3D "gpio44";
> >               function =3D "gpio";
> > @@ -1446,6 +1540,29 @@ sc-rgb-xshut-n-pins {
> >               };
> >       };
> >
> > +     camr_reg_en: camr-reg-en-state {
> > +             pins =3D "gpio92";
> > +             function =3D "gpio";
> > +             drive-strength =3D <2>;
> > +             bias-disable;
> > +     };
> > +
> > +     camr_rgb_default: camr-rgb-default-state {
> > +             mclk-pins {
> > +                     pins =3D "gpio6";
> > +                     function =3D "cam_mclk";
> > +                     drive-strength =3D <6>;
> > +                     bias-disable;
> > +             };
>
> MCLK pad function shoul be a part of the change to sc8280xp.dtsi
>
> > +
> > +             sc-rgb-xshut-n-pins {
> > +                     pins =3D "gpio7";
> > +                     function =3D "gpio";
> > +                     drive-strength =3D <2>;
> > +                     bias-disable;
> > +             };
> > +     };
> > +
> >       i2c4_default: i2c4-default-state {
> >               pins =3D "gpio171", "gpio172";
> >               function =3D "qup4";
>
> --
> Best wishes,
> Vladimir
