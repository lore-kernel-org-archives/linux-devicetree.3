Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B54495030
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 19:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734011; cv=pass; b=t+y6zQNZg8Qyr8WMX3+XE7K6tefzbYPThT/xySgSzI4pV3t1/RTxlnjGykeFkdUlrHXNo8jJDWQCy/FQYvzqUk2Ptuq8fDiBLmUEtwzpRk77p/3pGItVDGVcEMqA190dEaqEM8furXOZhntWYFQiS9VvvehgCpH7fgkCs4rkH9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734011; c=relaxed/simple;
	bh=8UBhrC8HpfupIaiQ3+TwvErJNXgqZnEQxZ8thuF/WZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PBMDnL2k8acpF8V8Ir9feGNNiSp3YS0xz0GuwSxl74SBgpmITyn9MUJluWldkINKD4Eoe+ov8FcmfxpJrrnHe8BKAiqZ0ErZBNuR8a9r+4L+oAs/JUGTtsBqTTxkmQq2BjbpD/PHieOyGoCMaFYppG9uJnYxuCy3Wwvbn97qWXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZvQ2UWp; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZvQ2UWp"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c9bb9d2fbso10584771fa.2
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786734008; cv=none;
        d=google.com; s=arc-20260327;
        b=mi5b6PDk2d8rW7dzgjGL4ZTQsJeAVigXvCb7VkeSG/uqENU07zwY1sXmLCsPlDqjNm
         p1v0Ipmk5ejWq+Vt3YLuL53szAHE5qaxgOoA8oBErnxnQl5ym2NLhcyIXjpj0K2UTFfH
         TEMotRnE5oc91FQqxVryNVHLZ1jsxHAZrosYckUKqoSvspdakvv1nt1QpnmI/0ciVbud
         Cpstolebrbo8b0drAC4OJGD+f7gYE7+kXZVZnq4ewT+HKWudTp0pqICmVQenjCS4WeM/
         +x2N8qpim80WMtq/zaB9m0if0VYhJOSln4OCi9qfMMP7mg23RSb0RWd0/5cg2gC13ZDh
         YTtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rIcL3osXcruiiQ2/mmC3QiYhtHMgSVCol/+yb35Iqlk=;
        fh=PZfvRGeI771WY0OhKxtgdrAUSv3VQrQrBNQTkJi7/Ac=;
        b=TFvHMuTLdbXmrf6CEdwaMeL2E1xt7JXR2SAna/hkUIOO/WwOlIsPfehyypQ4aUDhGU
         ucGWBxOVWMknql54uv+Wt4BThoG1s6YC/CSagJ9O12yo8AhsETZ7kkXTDEf/Jus6HxX6
         V0t0jvtUF7BCR5Ay36GgNvoJKgZNMdWBCN9sOOY1cnpQA+LnVeycWlxzE9buaeKvLYxp
         nFICVHI2WfwJhe2sFU+g/XRrX8pAJ5OStof3Xts5Xl6KzmOTZ2GfRSzSks9Gm/Bsn63z
         I/govbZVgYzKQkvwFdbzoZTIiPk/Evgxlt6HKB2dMcRAmk+KBt6yeHNh2SuiZVcDvTO0
         nYwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786734008; x=1787338808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rIcL3osXcruiiQ2/mmC3QiYhtHMgSVCol/+yb35Iqlk=;
        b=hZvQ2UWpAQh5qfAD2DG/55wnJLouRvAM0LR6hwf9A2Sr7a25sJv1gWS+et6t3M1Fl4
         MmUmDxTf7/gAlch+Gdn19G9KA/dvGmMZUPO1FUwd1tB4gnb0WeLbv7XtxIDzzzz1I/ml
         7vlhWEWeFiqDZbS6DQ3TdMx4qIONZWeB8Eq+lkl0BXrg69SIZBnJLbJIKQYDL8NkW3vL
         3rM/JyvRijRpBT8LlhRNU+pSdXSwgDP6JL3k/+3eGZoeyhQj86RPBSA3Hg0TEGFzukqS
         PTdRyimAA9ICiSe0gJ+px/jQVC/9nk0dHsZfay3TqgKl/XKjY2c4sAhVw3yyKW3tqzzg
         SYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786734008; x=1787338808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIcL3osXcruiiQ2/mmC3QiYhtHMgSVCol/+yb35Iqlk=;
        b=W5G5+fiOcbRU0aAXxQldCrBHNRHrmq57bEel+wbLfnp4YwHiLX8cvAPWZWpzrGL2nK
         q2Jynj6hz5xQfAcgxIBhlTpY73+PujHUnrJYZ2RN+KhlEtpnpIXip7sMA9PKUMfWa9U/
         fCBL8lzf2QlkWoquxwbFX5+zXbiiz9wiZkpEiZbDwzuQOgQokekkRJ3M1Ts78+uT9JUk
         GmC3qJeyltG2MERb7DlSbXVOiuF+DEDWmTpwFSSSj0/ssrGhc13tw0ViMEFl0q0QaC+d
         MGMmyR1muMCK0yuD/HT7PWbbWYvwbKuuCCnRuXTpK5sv8G4KHIgFqd6rmKHioRBCQ6Fa
         r7Bw==
X-Forwarded-Encrypted: i=1; AHgh+RqAnvA7m2jO9yBgfBg2IMVkLvmPKHAThJhJ9htetFhY5I2yaHbZXjFqfn1z9Sa9HaC0vT1dF1X/SNQc@vger.kernel.org
X-Gm-Message-State: AOJu0YwqOpYiw22Gy2pN2IsQPViwSGusDF5ot7Dmlg32uMlyoH/O+q/q
	+hyJEAdMGzs8GGdRSAEnAYT5S4vq7pAvwmcguwYmCT98YhrUXhiBSbim9IczlZWu67MRBVxOwrw
	GaYEHw8poZvbwHT3aOlc5ktYbUa5o7Dhw9g==
X-Gm-Gg: AR+sD10vbEM/LPwY0lTkzlzCoOFfxES8jviZXo2gZ3PNMfW83/DXxVlmWJjDqCi0BTg
	TMDohswjkpw/7cOFSSo9VOdf/hBRDQungkWU+ckUB3P0P9pY0V8jmaVNttqNgqXDiOTLNdsUD7N
	9TNnqzIGI9cO40rH6w8wrMY1sbGBA0BH07Z6weO/DxQe4g8n8D5GQqQ9RiR7gT9FmHNjD95Pdw3
	nE+SQBbAiw1XDywBCDtroeTbUDVScUxnNCrkWmCGDg7Hxo7iVZH5sPxn31FoJFTapTKojmxSeZ3
	xXo0SE4EBqWkreZNRdKHTXHkFw6QmYIDeQuE9TZjlfXoHbxBHDiRtx4vK0cRIO1emh2FrJ54/P4
	th8TNWMek4GImS6cDYAaq5My0febzGNhLTRMtKieQ
X-Received: by 2002:a05:651c:2121:b0:39f:ef56:65dd with SMTP id
 38308e7fff4ca-3a1324cbb22mr7387531fa.24.1786734007812; Fri, 14 Aug 2026
 12:00:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com>
 <20260808-rp-qcs8550-v1-3-a5a365ba3dc5@gmail.com> <pgup5kvjyhz7l7rucduzlqj7hmle2lrcvso6ge34up5am3uukg@3jocblne3lvi>
In-Reply-To: <pgup5kvjyhz7l7rucduzlqj7hmle2lrcvso6ge34up5am3uukg@3jocblne3lvi>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 14 Aug 2026 13:59:55 -0500
X-Gm-Features: AUfX_mxdr9Sak4hscLfEQL-AM1RV-cvbPThBZrgyITfD6EmLr55pvDtGjrDohKE
Message-ID: <CALHNRZ9c_+ahDALiQos+H7nWOz7HK8dOfWg3_vnkX+k4=vSp4A@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Retroid Pocket 6
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 2:06=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Aug 08, 2026 at 12:37:57PM -0500, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > The Retroid Pocket 6 is a high-performance Android-based handheld gamin=
g
> > console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring =
a
> > 5.5-inch AMOLED touchscreen.
> >
> > This is based on the support by ROCKNIX, however their history does not
> > show who the original author was, so direct attributation cannot be
> > given.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
> >  .../boot/dts/qcom/qcs8550-retroidpocket-rp6.dts    | 122 +++++++++++++=
++++++++
> >  2 files changed, 123 insertions(+)
> >
> > +
> > +     vdd_disp_1v8: vdd-disp-1v8-regulator {
>
> regulator-foo

I see these are inconsistent, I missed that when pulling the support
in. However, looking at the associated AYN series, all regulators are
named foo-regulator. Using regulator-foo would make that inconsistent,
is that really desired?

> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vdd_disp_1v8";
> > +
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <1800000>;
> > +
> > +             gpio =3D <&tlmm 70 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +
> > +     vdd_disp_2v8: vdd-disp-2v8-regulator {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vdd_disp_2v8";
> > +
> > +             regulator-min-microvolt =3D <2800000>;
> > +             regulator-max-microvolt =3D <2800000>;
> > +
> > +             gpio =3D <&tlmm 142 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +
> > +     ts_avdd_3v0: regulator-ts-avdd-3v0 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "ts_avdd_3v0";
> > +
> > +             regulator-min-microvolt =3D <3000000>;
> > +             regulator-max-microvolt =3D <3000000>;
> > +
> > +             gpio =3D <&tlmm 144 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +
> > +     ts_vddio_1v8: regulator-ts-vddio-1v8 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "ts_vddio_1v8";
> > +
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <1800000>;
> > +
> > +             gpio =3D <&tlmm 102 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +};
> > +
> > +&mdss_dsi1 {
>
> Out of place.

Oops.

> > +     status =3D "disabled";
>
> Isn't this a default? If so, no need to repeat it.

qcs8550-ayntec-common.dtsi enables this because most of the variants
have a panel on this connector. So as one of the odd ones out, this
needs turned back off.

> > +};
> > +
> > +&i2c_hub_3 {
> > +     clock-frequency =3D <100000>;
> > +
> > +     status =3D "okay";
> > +
> > +     touchscreen@38 {
> > +             compatible =3D "focaltech,ft5426";
> > +             reg =3D <0x38>;
> > +
> > +             interrupt-parent =3D <&tlmm>;
> > +             interrupts =3D <15 IRQ_TYPE_EDGE_FALLING>;
> > +             reset-gpios =3D <&tlmm 14 GPIO_ACTIVE_LOW>;
> > +
> > +             vcc-supply =3D <&ts_avdd_3v0>;
> > +             iovcc-supply =3D <&ts_vddio_1v8>;
> > +
> > +             pinctrl-0 =3D <&ts_p_rst_default &ts_p_int_default>;
> > +             pinctrl-1 =3D <&ts_p_rst_sleep &ts_p_int_sleep>;
> > +             pinctrl-names =3D "default", "sleep";
> > +
> > +             touchscreen-size-x =3D <1080>;
> > +             touchscreen-size-y =3D <1920>;
> > +             touchscreen-swapped-x-y;
> > +     };
> > +};
> > +
> > +&pmk8550_pwm {
> > +     status =3D "okay";
> > +};
> > +
> > +&remoteproc_adsp {
> > +     firmware-name =3D "qcom/sm8550/retroidpocket/rp6/adsp.mbn",
> > +                     "qcom/sm8550/retroidpocket/rp6/adsp_dtb.mbn";
> > +
> > +     status =3D "okay";
> > +};
> > +
> > +&spk_amp_l {
> > +     firmware-name =3D "qcom/sm8550/retroidpocket/rp6/aw883xx_acf.bin"=
;
> > +};
> > +
> > +&spk_amp_r {
> > +     firmware-name =3D "qcom/sm8550/retroidpocket/rp6/aw883xx_acf.bin"=
;
> > +};
> >
> > --
> > 2.54.0
> >
> >
>
> --
> With best wishes
> Dmitry

Aaron
