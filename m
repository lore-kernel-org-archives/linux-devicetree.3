Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795797654;
	b=BuA/3mkva9TQnGAgCW7DrYW0qJOhp3WNA+2gY5odKLg9lfM/wBURhXESSHMXgPJwv66o
	 yM4LLCcB3vX96F2D1CXRKiCB+9VVL+muFyyYbCrnR6Qo8lUWpl/W3uDMZx9WfZR3hIQZA
	 qcngIwhX51k5m+v9KwmwZeUvMknKMxw5kWdNop0O25ZdkKTP2MA0+jKiIKMXjMqjfUSO+
	 w0kRhBC6thygtOsR40/aYkzlPCpD25NsoHdJCtLGeoBViozLv4uKE3zPEhyTsA5jnVhGi
	 097662Okko60iywVQCgSSC4yMkJWG8NMjVEumFD2vdKuiUlb1m5HQ6xRJdD5UISNVfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IPle5l7CKPa/6OPjdxH6qQiH/tYsSSvVtMd6mjA4rsg=;
	b=conVzgMmbY80niWtMdbGGnxYxKM7g16VABJubwuJMZyqaxLQTaASxAJdIQQQSTYMP2vT
	 OwZqrhAhIoyIrCkpTJAkLEX5fS0ZiCq1xbaFZF31v2vxnMZ9wFJqh+7ILJzLMZ6YkVRV6
	 XhJEHnBN7yiCYwfOScf5+yy3ppSq9cClbCxxrdg06ReEj9BGrjyTXiw88vbGGDTN5/SFQ
	 rSInqHrWjzKwZ6WkLNGmLMZThvBFmO76DlFSiuQQFiykzLumbwTQf1aHHunPJ2vDvtrLa
	 RUwSZXCSzZManlaSzilARaCTk11l3bcTzhq8LWRoKl1tshPjsiQY0ICdQpC5784p2aQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXpGyVUU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB37606A33D
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 16:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CB37606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXpGyVUU
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-943e8d35f74so804278985a.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:40:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795797647; cv=none;
        d=google.com; s=arc-20260327;
        b=krI+PLdSverQH8eKCtznJmo1tlbEltc0nJ4nkS6YcQKJW1oPM0RSjesikIWLHmPGjm
         IginmBNsydw2q4jZI4HnMP0OeYE4ICH/Gj8oF6Ot8tLS4GcrxDVjFBGci220BrWQQ3Nm
         p6l8owSMT5n6ZvgC4fpHvq0t1nZxcqP7qch1RPaWL62EN6SoedLRA+zv8YXKcdWgQX9j
         ofM73B5SPhkmiyoD+o0qq7eqRpZ//mHj7bu8XFjro+xt3kFrZrCyXEOgAk1Jjqm2qWA0
         8kdWIsDWkb9P8KHSf4AUHvBvvgp60RAO2RyiPktzw3NFD7qAjQjZG65nVzR5L/SDiuin
         Lt4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IPle5l7CKPa/6OPjdxH6qQiH/tYsSSvVtMd6mjA4rsg=;
        fh=XN6JW6CKLV2f684uKhTiFUBA1WGGUYWAgI+aUkjTBxQ=;
        b=BTDY8nGB0G2UWAlMrUpUGDo9TRG28DIjJRD3AwAvR/Qfxs4zuC+8o8vkg8vvN9zGdl
         XsZAYMFAZskNAUhgwbI0Qt+EAFbBI3gH3WR6auUNfIeqQTB7ckXn2Y/4iJp7XaTYplbc
         4QcJwGPbueVqL8+nme7cX1NzcWgn4jnh+Wy4pDfESUsklkcq4spW4fsU2ooGNRPxexV3
         uWCmib+dmVah2dmdqYmiC87JikSRbgxnqsDeMFHfLq+YQgpshzxHr1nva5IUWZrQ5Mki
         z/7PkNZaZRtNI7h2Tu8GX6oNCdxSXxFqDV/tjd72DC6OY0hhfQFfX1xuY7U/1qfFQ4t9
         1wmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797647; x=1796402447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IPle5l7CKPa/6OPjdxH6qQiH/tYsSSvVtMd6mjA4rsg=;
        b=uXpGyVUU+HT9/mcL1vE5JHKOo8nLBz/gaz5KEYZt/mIPeLtFYLgQkFSNcnvX+KiV0d
         EWzuPZ5DghT0s9dbZY+pdaalvx+Q/M2KO76wP5hUbSkXqpI4gxU8wF2py84L90CLac2b
         a4uQcF+UTl9SH2PT8Zp/90Pk7IJEv+uErh1HgwPSJjnifwCDM7VhJrpWeZ1JGpsAQ9AP
         Ar2PPJ/k9A2Dd7fcfZ8vy5Rq4FG+GGpN8kxw0WxtW17yklKlDaQnB4oMFT3zYnJx7GAa
         O6/yRfvw1NIJa/NvHiTdF8tMNrLWE/7SpAGbBt+sMm/PL6BhjTwvzJr88SnAxUrK5+zR
         hnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797647; x=1796402447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPle5l7CKPa/6OPjdxH6qQiH/tYsSSvVtMd6mjA4rsg=;
        b=FhrKmgAP3Z0E+tYt8sE72Q6gOuK8cQkxYf1e7D5+P74G+SpoqCXTJ1hjHB9MhHliCq
         UFetqPOszPjvs22mmA4f4Q3/UkPhCkq82R9RWEsS87uiOLRHuVSwyiJ2Et7TF0ddawow
         cxGs3fGbWlUOeU6dqds8ZOci8DdpafkJs6SaTz8/VLd/MpQFyXo+FmBK7lnnKo8nOzRH
         QHjs9H/YnnZ2fmBfCVzGknCm7UiJxrF0tkoXbEe9sE5eQp1UnhjniboVJTgghiZb5stT
         ebkta/Kk2k/T1/UdkIrOzMkVjpZhhJlznTTqw98PJ7RKeLYQuKIFvSEN81fMW3ibB2HZ
         kEkA==
X-Forwarded-Encrypted: i=1; AL+hErGjOS2roaaLb4NmCQafWoVls/+LPOQxCLzpsMu7m0oKrIFTR9QZNpKojbsg03PshND69bT740xJT/xy@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ik9tJ82q6hG9fbFvNiSZu5Vr/1XdG3jllGGT3AHgMmHWZiJEj
	VGmRyZubxbuHSPI6zRvGcOmzAdd+SGu5tq2II45CvbQUKW/yCkh3JpXojqDFoAHkYWnelD+IIoD
	1cQOa6bwSXRvrYJ0SFe4+t96PJqWO0WU=
X-Gm-Gg: AZFdTZfacjFdogSbK07vCmgVLW942DfcZUMrrOk5mgsUS74wpGMww1gk30u0YLKwwUa
	kQk4oqlpolq9mGR4/14hh4gDGYPbAghOsnAVrLdPvEotd3dzCLhkFu1iKQ7eieaptSiEVcgoXLM
	FMc0SBrJH+4WdJYuoLy8VtXIaDJuW+R1fKa/TrbhqKQ1qW/1xs67dc7Yos0uqPoLk1tFIoOvPd5
	p7n3DkjLV9uMPv+p+DQELDyzRE749LMqHJ9N6u0M3d3n56w00JI+rcskYg8/xxGMvd1WWneW9ts
	bwFovIKV6u6vtVVWo8akcYWx/zbRsFBDltNELk0I9UwZvIt06Qi0gjQu3LEvWcs51xRQ5g3SreZ
	tEDlGRO/ngDISI7GZaFcDSVaBoxZr+zl9OdwVnIR7D7ApaRnR7auVYNUsajkwL7oyHNKahsG2P6
	hUEOnoMXXL3IYJ
X-Received: by 2002:a05:620a:4556:b0:93e:c691:a1c with SMTP id
 af79cd13be357-949bab3d32emr4186387785a.76.1795797647019; Fri, 27 Nov 2026
 08:40:47 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
 <20261125123146.379057-8-hikmahgumelar@gmail.com> <eae86bfe27d119c6170b25de5a917df3@mainlining.org>
In-Reply-To: <eae86bfe27d119c6170b25de5a917df3@mainlining.org>
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
Date: Fri, 27 Nov 2026 23:40:34 +0700
X-Gm-Features: Aa3M54psm_9QUNpDWsKD_Jig5hkKXFvslF5p_cQzzBmVdpcTVqPaadJIGqde-h0
Message-ID: <CADA=zOMpnGjPuH63CdPKNMyVVmO7Rr7fB+EP=3MS4825kkgdtA@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable
 front and rear cameras
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	u.kleine-koenig@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Barnab=C3=A1s,

Thanks for the review and the notes on msm8953-xiaomi-tissot.dts.

- I will add the blank line before vreg_cam_avdd.
- Noted on OV5675 variants; for now this series focuses on S5K5E8 and
  OV12A10, and OV5675 can be a separate follow-up later.
- I had already moved vdd_l23-supply into the regulators node in newer
  revisions, and I will double-check its placement and parent supply
  against the board DTS.

Also, following review feedback, I am splitting this work into separate
series for s5k5e8, ov12a10, and the MSM8953/tissot changes.

Best regards,
Hikmah Gumelar

Pada Jum, 27 Nov 2026 pukul 23.34 Barnab=C3=A1s Cz=C3=A9m=C3=A1n
<barnabas.czeman@mainlining.org> menulis:
>
> On 2026-11-25 13:31, Hikmah Gumelar wrote:
> > Enable CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision OV12A10
> >
> > rear and Samsung S5K5E8 front image sensors on the Xiaomi Mi A1.
> >
> > Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
> > ---
> >  .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 124 ++++++++++++++++++
> >  1 file changed, 124 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
> > b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
> > index fccb9c4360ca..87db6b18d191 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
> > +++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
> > @@ -74,6 +74,108 @@ vph_pwr: vph-pwr-regulator {
> >               regulator-always-on;
> >               regulator-boot-on;
> >       };
> nitpick: add an empty line here
> > +     vreg_cam_avdd: regulator-cam-avdd {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vreg_cam_avdd";
> > +             regulator-min-microvolt =3D <2800000>;
> > +             regulator-max-microvolt =3D <2800000>;
> > +             gpio =3D <&tlmm 62 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             pinctrl-0 =3D <&cam_vreg_avdd_default>;
> > +             pinctrl-names =3D "default";
> > +     };
> > +};
> > +
> > +&camss {
> > +     vdda-supply =3D <&pm8953_s3>;
> > +     status =3D "okay";
> > +
> > +     ports {
> > +             port@0 {
> > +                     reg =3D <0>;
> > +
> > +                     csiphy0_ep: endpoint {
> > +                             clock-lanes =3D <7>;
> > +                             data-lanes =3D <0 1 2 3>;
> > +                             remote-endpoint =3D <&rear_cam_ep>;
> > +                     };
> > +             };
> > +
> > +             port@2 {
> > +                     reg =3D <2>;
> > +
> > +                     csiphy2_ep: endpoint {
> > +                             clock-lanes =3D <7>;
> > +                             data-lanes =3D <0 1>;
> > +                             remote-endpoint =3D <&front_cam_ep>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&cci {
> > +     status =3D "okay";
> > +};
> > +
> > +&cci_i2c0 {
> > +     camera@10 {
> > +             compatible =3D "ovti,ov12a10";
> > +             reg =3D <0x10>;
> > +
> > +             clocks =3D <&gcc GCC_CAMSS_MCLK0_CLK>;
> > +             assigned-clocks =3D <&gcc GCC_CAMSS_MCLK0_CLK>;
> > +             assigned-clock-rates =3D <24000000>;
> > +             pinctrl-0 =3D <&cam_sensor_rear_default &camss_mclk0_defa=
ult>;
> > +             pinctrl-names =3D "default";
> > +
> > +             reset-gpios =3D <&tlmm 33 GPIO_ACTIVE_LOW>;
> > +             powerdown-gpios =3D <&tlmm 39 GPIO_ACTIVE_LOW>;
> > +
> > +             avdd-supply =3D <&vreg_cam_avdd>;
> > +             dvdd-supply =3D <&pm8953_l2>;
> > +             dovdd-supply =3D <&pm8953_l6>;
> > +
> > +             rotation =3D <270>;
> > +             orientation =3D <1>;
> > +
> > +             port {
> > +                     rear_cam_ep: endpoint {
> > +                             data-lanes =3D <1 2 3 4>;
> > +                             link-frequencies =3D /bits/ 64 <216000000=
>;
> > +                             remote-endpoint =3D <&csiphy0_ep>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&cci_i2c1 {
> > +     camera@2d {
> > +             compatible =3D "samsung,s5k5e8";
> xiaomi-tissot can come with ov5675 also.
> > +             reg =3D <0x2d>;
> > +
> > +             clocks =3D <&gcc GCC_CAMSS_MCLK1_CLK>;
> > +             assigned-clocks =3D <&gcc GCC_CAMSS_MCLK1_CLK>;
> > +             assigned-clock-rates =3D <24000000>;
> > +             pinctrl-0 =3D <&cam_sensor_front_default &camss_mclk1_def=
ault>;
> > +             pinctrl-names =3D "default";
> > +
> > +             reset-gpios =3D <&tlmm 129 GPIO_ACTIVE_LOW>;
> > +
> > +             avdd-supply =3D <&pm8953_l22>;
> > +             dvdd-supply =3D <&pm8953_l23>;
> > +             dovdd-supply =3D <&pm8953_l6>;
> > +
> > +             rotation =3D <90>;
> > +             orientation =3D <0>;
> > +
> > +             port {
> > +                     front_cam_ep: endpoint {
> > +                             data-lanes =3D <1 2>;
> > +                             link-frequencies =3D /bits/ 64 <418000000=
>;
> > +                             remote-endpoint =3D <&csiphy2_ep>;
> > +                     };
> > +             };
> > +     };
> >  };
> >
> >  &hsusb_phy {
> > @@ -154,6 +256,7 @@ &pmi8950_wled {
> >  };
> >
> >  &rpm_requests {
> > +     vdd_l23-supply =3D <&pm8953_s3>;
> It should be placed under vdd_l9_l10_l17_l18_l22-supply =3D <&vph_pwr>;
> >       regulators {
> >               compatible =3D "qcom,rpm-pm8953-regulators";
> >
> > @@ -302,6 +405,27 @@ gpio_hall_sensor_default: gpio-hall-sensor-state {
> >               bias-pull-up;
> >       };
> >
> > +     cam_sensor_front_default: cam-sensor-front-default-state {
> > +             pins =3D "gpio129";
> > +             function =3D "gpio";
> > +             drive-strength =3D <2>;
> > +             bias-disable;
> > +     };
> > +
> > +     cam_sensor_rear_default: cam-sensor-rear-default-state {
> > +             pins =3D "gpio33", "gpio39";
> > +             function =3D "gpio";
> > +             drive-strength =3D <2>;
> > +             bias-disable;
> > +     };
> > +
> > +     cam_vreg_avdd_default: cam-vreg-avdd-default-state {
> > +             pins =3D "gpio62";
> > +             function =3D "gpio";
> > +             drive-strength =3D <2>;
> > +             bias-disable;
> > +     };
> > +
> >       ts_int_default: ts-int-default-state {
> >               pins =3D "gpio65";
> >               function =3D "gpio";



--=20
Best regards,
Hikmah Gumelar
