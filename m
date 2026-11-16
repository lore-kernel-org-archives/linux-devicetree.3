Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794825084;
	b=dOyXDx/+50vPLIkn7veAT6WYZ26CH8fVu8N68m1VposM8EpDQMDK0mxvHioFNUpWWpBV
	 1WlWF2z7JGrVSvqobvba6njbgwJHnK+c2lqpx2fDuTMHHqPn03rW/wXXPikgjuT2IoAZJ
	 /LEjqyoGx1XI1xMn7/7yclwk3pbGSwqwDjqzWJEyNBP8jULzclRm0Xk1ILC9HyEKrVxnC
	 5M6Nybh/3OTCq+j8CiYjBEOZoJ6j41ggWS1Wm9iJ2WM/IzSppjUovkBXK/F8sDcu4DJcl
	 s0fIlmZ+uvTBKPO+v9hScNvf4V3EG8z1N5Rzrw2wSNZxlEQFHFkMfjopqa3Ub+g4HbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=on1qfLbYc0jQwqPKmmXQjUDE4j0AQGRCChaGNO7XJfw=;
	b=v45VdW7ss641RRvK/HPkSt0I7TEwEky9js41zbTQjqcMEyWIDtd7RFM/oQyRubxxfNtN
	 7NH1024jwoa37haonFlmL5OmHkTO2EzNO0ugaLQatZa5BiuUbJb/DFoA+4SV86fIgW9Hx
	 qx67qN+SBY3fKvFsJIwLFAadCpPQC1qAPZRPwu93ndBNVnX2Ci9/6JFT+X4NuqKPMe0Uc
	 fR8M/WVZQ3xPtNNzSicaCPynAZa5P1tI1KG5wVD1P50unpw/8NCA1yxgFqZPb2VT9pQSy
	 5J+e7bNpAPHXjpcHdN6r84SG9rXsGEfh6GIZ6nL7KzDHcKRRN0FG397Z9dxWq4Cgd1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DS84mFHy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6440606A333
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6440606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DS84mFHy
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53644b28706so24364821cf.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:31:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794825082; cv=none;
        d=google.com; s=arc-20260327;
        b=bhRSRMATwTqtLwARNRS9ZpyYgDEctgV6pIUackNj9xAtnysq8LI7yl/kgukYk18rAO
         RwJ1l8H1J8C7J6DX2DRDpjprdxhI00Y48P+BfW2AN3CWYSAJRTn6TJ9ZKgP/yTtqYYGI
         iYFRcRsEJmOL0Gk3cLlXrp98KBlIliNPsczPBY/u3C4LGbQ8sun7YAyYBedo/C/NapV4
         5anoj/mQ7JVWyb90FX3hcKs3CCXYNSk5NQLujDc5nnOk/fsZCaMeLn8fsge7f0g9Yq7O
         YK7vMv9KkGFFNmV0SbW9HaFIbKXenOBQBlYZIKYiK1mviF/U4snCtikHf+YuhqXPoKo4
         b7sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=on1qfLbYc0jQwqPKmmXQjUDE4j0AQGRCChaGNO7XJfw=;
        fh=5atlI6N4DqhDJ/kROOWZt6Ol/QVkwus/c/CVt4iaZ0I=;
        b=FueNQ+2wj9K2kzbj6QFHMcYVWXhc4LygxENggoxsEgZ17dmi8gI+INWt8ig6THzmML
         KEqwct91EO/O4DwbAjyYc8XnWp8l9Ct8L/SWTwvOgCbCS47J7DSJMEQhycHUXUMRqRED
         d+wZ9dWXPV7ddl+lP+161aaAW+Hp5GQR9iYdMUWHpqsMpM94BMNIVRxRhtHx9bWfXo/n
         qQpkO+x3Ba+JhdHt49HeZJX7bYBt4u8FE15gGhMndhTOEalh25nNLMeEy3m9QrpzMX8f
         +1IKyCh/C0UD1EF+ExxhX/Y/EinUrhO2SfK4WX+vWuMSKfSt4JOxMoaewM7+t6HNzMVf
         dxbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794825082; x=1795429882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=on1qfLbYc0jQwqPKmmXQjUDE4j0AQGRCChaGNO7XJfw=;
        b=DS84mFHyPaquzhMIFrPucSvrXaOGC6IvbD5KhwZAme4nzHxaKTAzGvTp622VH2+K2s
         AYADXW1kV+J6MtdUo0GcdDgAIbssjM2sPsJM8fn6NUVQrt32iy1kJz7XWduaGYz4yrob
         EEyykkTZbHTmncrPJd2hfclByO1RSE/NmaZyEG8dxKNJCgFaD2dmPitPbv9rqJaCsPWs
         H+UUIc3fyhTK4og2BNlpUvOD4hOhq0x1PuGHRYXzewnjoLgb3QU0RBUozfYV6jJm2XOv
         p4UAi/y/qFvYWoqlDGBs1VPsAme94LQkcl0Falj1U/tpYadVGPIwNQMgAFoCDS+jxPLn
         cybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825082; x=1795429882;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=on1qfLbYc0jQwqPKmmXQjUDE4j0AQGRCChaGNO7XJfw=;
        b=HtpZUFzRmSTT+AAT7RuZGpQLZT5qGWhKB/T5vMTGpqJ2awI6Leg/vo7ayLlCgKPjfE
         30eIkN6UfMtX6CyyvSK4h2HeUwD6Bgs6jaxUeq3xhScndqEKIVH8h19rwDqXbSuomkio
         SYPEuRCo3KKMAqDeUZAZaLHznA0Yap1aV/v/E9jIFk/dqtwwj59vxY1m85ZlC7r28cln
         Asc9iCGPb2lOJlWwiOmeuMDBlCVgqtWdiO47goDRkkObzGel/h5QrnnpvsBOzZA5SeUp
         HYTRzVPz1G4pZjPsLVq0BQUXdU6+DlMeaOHSXvTgq9ZjAh8Nc1YaASrbyFqojMeLZ3aV
         J9bQ==
X-Gm-Message-State: APuU4Z9elpZe9ZD7Vxrj3MzO2RhJVRtUX4v9v8FRR56U5+JSrIKNY7Lp
	5URnrxRfD+f4PL7YTNtz+p8iq+sjD5Cm0sxtM8hnyMgXOcAsw7o8XjxEyN5KgeDGA3+nF+R0KNS
	0MORiVPMDOXVqRWHq9FxHekgTFGt69U4=
X-Gm-Gg: AYBFou3ZTLlWcldtgzbudQLJTtihBjf/UffFdivW2FtDtPF9CyWsdzkJFnffdee31rU
	Mqpghrlv9poiAc7IpI65HJaKscqjZr9r+APy5ePmHDsItqSoBxqtV3Ya52+AMG5LJsNcZ73cjhE
	hN3odZQpNk0ZOYZONEfOh90JVVS6oV2VKz6F/+QWsut38321Cm+OsKu1SjHZx5omfor0QHJ/jOA
	2Za1spYUVVOifm7mH8dHLgR1kZWhAN8tBDHfyIlGEY1/HMEgb4YxOlK4mOO6eCPJLzm7KvR1U3i
	CJI2pmMkkGJFSOgsFJPMvoE9rVM7sVCbMNWWuTgc2H0/HuKtOrP96FD8stXnjb22ODFYIaWqYb/
	IBHSCihwGQbcTYaous1X70R/KNeyJyzwSeQwHlRPHv2cl7YxZmEhlyTcozLXQoDh+5ely2UI=
X-Received: by 2002:a05:622a:4d99:b0:536:990e:b4c6 with SMTP id
 d75a77b69052e-55ac7b550e6mr150515241cf.35.1794825082365; Mon, 16 Nov 2026
 02:31:22 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
 <20261112-sdhi_rzg3l-v1-3-ca30b209615d@bp.renesas.com> <sashiko-outbox-211747@kernel.org>
In-Reply-To: <sashiko-outbox-211747@kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 10:31:11 +0000
X-Gm-Features: AclHuK-69tq2_5BrwcWip5r2r2C2Neh0RQqG5aAWyws3AaOyvcwgj8fZIJcAvcI
Message-ID: <CADT+UeCM2SEvcm8ELcFVDK_rHJuw=H4fC0=ArbJZcwBaeCQjvQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 7:09=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] arm64: dts: renesas: rzg3l-smarc-som: no-op UHS pinctrl
>   switch on sdhi2
> --
>
> commit fa36790e3b28d4844cd7f51756a420dcdb4538ff
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
>
> This commit adds pin control and device tree nodes to enable SDHI2 on the
> RZ/G3L SMARC EVK platform when the SW_SD2_EN macro is set.
>
> > diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/ar=
m64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > index f6f4eed9a2ea6..e8fc9cddf288f 100644
> > --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
>
> [ ... ]
>
> > @@ -330,6 +331,74 @@ sd0-data {
> >                       power-source =3D <1800>;
> >               };
> >       };
> > +
> > +     sdhi2_pins: sd2 {
> > +             sd2-cd {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(K, 0, 1)>; /* SD2_C=
D */
> > +             };
> > +
> > +             sd2-clk {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(H, 0, 1)>; /* SD2_C=
LK */
> > +                     power-source =3D <3300>;
> > +             };
> > +
> > +             sd2-cmd {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(H, 1, 1)>; /* SD2_C=
MD */
> > +                     input-enable;
> > +                     power-source =3D <3300>;
> > +             };
> > +
> > +             sd2-data {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(H, 2, 1)>, /* SD2_D=
AT0 */
> > +                              <RZG3L_PORT_PINMUX(H, 3, 1)>, /* SD2_DAT=
1 */
> > +                              <RZG3L_PORT_PINMUX(H, 4, 1)>, /* SD2_DAT=
2 */
> > +                              <RZG3L_PORT_PINMUX(H, 5, 1)>; /* SD2_DAT=
3 */
> > +                     input-enable;
> > +                     power-source =3D <3300>;
> > +             };
> > +
> > +             sd2-iovs {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(K, 1, 1)>; /* SD2_I=
OVS */
> > +             };
> > +
> > +             sd2-pwen {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_P=
WEN */
> > +             };
> > +     };
> > +
> > +     sdhi2_pins_uhs: sd2-uhs {
> > +             sd2-cd {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(K, 0, 1)>; /* SD2_C=
D */
> > +             };
> > +
> > +             sd2-clk {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(H, 0, 1)>; /* SD2_C=
LK */
> > +                     power-source =3D <1800>;
> > +             };
> > +
> > +             sd2-cmd {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(H, 1, 1)>; /* SD2_C=
MD */
> > +                     input-enable;
> > +                     power-source =3D <1800>;
> > +             };
> > +
> > +             sd2-data {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(H, 2, 1)>, /* SD2_D=
AT0 */
> > +                              <RZG3L_PORT_PINMUX(H, 3, 1)>, /* SD2_DAT=
1 */
> > +                              <RZG3L_PORT_PINMUX(H, 4, 1)>, /* SD2_DAT=
2 */
> > +                              <RZG3L_PORT_PINMUX(H, 5, 1)>; /* SD2_DAT=
3 */
> > +                     input-enable;
> > +                     power-source =3D <1800>;
> > +             };
> > +
> > +             sd2-iovs {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(K, 1, 1)>; /* SD2_I=
OVS */
> > +             };
> > +
> > +             sd2-pwen {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_P=
WEN */
> > +             };
> > +     };
> >  };
>
> [Severity: Medium]
> Does switching sdhi2 between sdhi2_pins and sdhi2_pins_uhs write any hard=
ware
> pinctrl registers for the sd2 pins?

yes, it configures POC registers and uses reset values for drive strength.
>
> sdhi2_pins and sdhi2_pins_uhs differ only by power-source (<3300> vs <180=
0>),
> and neither specifies drive-strength-microamp. In r9a08g046_variable_pin_=
cfg,
> those pins use software power-source tracking instead of a hardware
> power-output-control register:
>
> drivers/pinctrl/renesas/pinctrl-rzg2l.c:r9a08g046_variable_pin_cfg[] =3D =
{
>     ...
>         RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 0, RZG3L_MPXED_PIN_FUNCS(B)=
),
>         RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 1, RZG3L_MPXED_PIN_FUNCS(B)=
 | PIN_CFG_IEN),
>     ...
> };

 RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 0, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 1, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 2, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 3,
RZG2L_MPXED_COMMON_PIN_FUNCS(B) | PIN_CFG_IEN |
   PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 4, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 5, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),

RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 0, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 1, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 2, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 3, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 4, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 5, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),

AI reviews can be wrong. see the mismatch.

Cheers,
Biju
