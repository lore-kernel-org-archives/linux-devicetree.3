Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B123DC4D0
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 11:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956855; cv=pass; b=NjNB0Nep9p98/MUQP5EG9NuBz1Tk2qrmTRGtfxtJ5jHr4iyMtyV68RQTJCDjNdW2Dr7J/rsOS1temyC32NmqMtuGZutwvFfuqSIQhdIAVhtTczpcm2D0VPwIc48s8Ns+b0gaVewc+h5WBkN1zoA6Lg1PNEJvAKuQynK4nvk9naE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956855; c=relaxed/simple;
	bh=fvcDsk+Dh9LbyHECz4bnznmrSq+OdCpbbeM5YLbTkds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GWxmycp4KkqszM/N8SQPNB+9X3tkjCFynZCU+caumrpTC8Vviq19YnJma9j/hIa2kW54uTA4+R35PCbDWAUm3N+hZMHAs1f/C7+L5CUm2h4d3k1QQmsYNYgiJEUobszHcEm/0zlVZztBNb3thpoei/7zXLgUfC9tFd9XXYkAAHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KeDrD7/y; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KeDrD7/y"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so6364824e87.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 04:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774956852; cv=none;
        d=google.com; s=arc-20240605;
        b=ZP8xx9R/4VIYWaRH1sj2B58BIstphPSKtSVe9Zzs907N8ztaanNx4r+Qr3v6VsJST+
         hLs/VyqnX55/QfXlxCEO+3ZW6/4iy5SmavDvCDs1KKhqvzM3xyXglwD6lL4ogWaI7uA6
         3C8/mcxU03xg6rpn4Vmzbpp3nmQ4PAs3rM2kYMLaLcnu8fDiEOLPxIU5IcrCDFRvmev5
         QiFkU4QoukbVfoAq/vRimW/QD/DQF9ozIJk1+E/NjQzM2O5wLO4eNYwv02c07n0wr25Y
         IE06kZITswSGNfCxj7FyFt48fX1O1NXfXpKVtmwubz6BC41fANA8HguKc0heo/UmlQ3C
         OnvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FGcYOF43Fmt+IF0mxxl7l+XSr0GQEhq288tkKBbNS6g=;
        fh=FO1tzfxGK4eh00z+H0c0K0WjekLur3a2ZcwS0/dxaPk=;
        b=Y9ZyCExKE11oLjlJv0Jx18ErxNQpWjZj9k6M1v9piwPB29xxpMvvDsQOSLfZITLNSK
         m7GuobGthW6qYjVvib8PGyapdoz/5Yrsvl8pSojEVEEdP5xVYDWE+1s+/eAt5eey3awn
         YuiixGVCfsCVNcSceUqF36CAt+oeryipbpir/llXzKLpsnS3qmeV9zcNjp8WuVCViuwM
         Vhub2dkkzowygUbA1o8g+7vY/obeV8iRazPsCGuI5zjDL3qFiZP8PrMwJ9xWY5+KXFsU
         89nn7gfvXUAEgQeiUrjM7nrg3oNM0yeDzwZEJ8BjiiNRl9Y/koLymkdUBxGm/cA0MBlO
         8uLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774956852; x=1775561652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGcYOF43Fmt+IF0mxxl7l+XSr0GQEhq288tkKBbNS6g=;
        b=KeDrD7/yI3/16ZEeMyZnj78MqSBCa/eNWnPEkeAYhLevO8maetOMhmPI1inSAE0K+j
         PE/CmpJAsbIIGb6mD5jZXCXs6onFAfWtTNpG1XB4E6Db/ppDhoIR0KNIvqC9HW81QAaP
         rJjsi6XhRTS3+eCW0VXhjIK/bj7BEg7wYhkeegw3eu3FNMYiiAKDxpxSFUQwiSRcS6ei
         XfyqZeCSDDVGL9/5nUN81RQpi96adVxov9hulCN/b4xQm2nhzhbE+/jqcXZ5xmEBKXBC
         msWwnM1xSSv53465TfU0cJMV3IutPU1jtY9DKfI1QcygSd2ODudvJc7RIFJ6PEDG8zPR
         bWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774956852; x=1775561652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FGcYOF43Fmt+IF0mxxl7l+XSr0GQEhq288tkKBbNS6g=;
        b=IOrD83fAPpdpWgpqT3rcraCbmgFnBEESVQIvlzG6Hn7KRqn81D1yEERWdkkYLRPGjp
         dnkpZBcUb/Isb2srEI9LXIy0TE0ywS0b5MyHa9yajJsq4D+zTlceSToK5G0LAcgbBSa6
         41Ww713jYRGm41U8jsHMV8f2Dhf5M7rBXPOpY+6uFUaPiD9YPSQf5sgpUQqDhykpVxb8
         UHYmNo0SEajQK44to7cT2V4oMKA9DofIBdmjm2X1ciK+JerzJJ/9x+RcYX9UzZ+EYDW5
         6kt5y1OV25lzpIaUFSt/PpPtp0mN9W50IKOpxtQIcRXFdEACAsgur4Tw5LvplRHYNQ+t
         GvHA==
X-Forwarded-Encrypted: i=1; AJvYcCXlJTyMIBlmWVsssVdqQBrveqG7jiapunjp56fPu1ettIaFay2nzN+kjuR0mSFAQqBcwaDvcU1H0aTC@vger.kernel.org
X-Gm-Message-State: AOJu0YxmiOYlvtIi/XzBVSALNTljdPnjTrQ+fSokJ5VZgpkjHGqKfGl0
	DzCqoJj19oabQ2ErOD2dxtz+rlKsGnESB1nLiTUcCaqCifsBFCx58h5ocIoOOSZB8XKf7tFsJN5
	YvBTXfRKx9Q8lNBOtIFmZXp+6j7iyjScaUpjD2V9fAw==
X-Gm-Gg: ATEYQzzXQ9lANOb0ZEVdC+Vnv2m2nFqWlKV+ZPzuM6vndtuNQ9VZ7G1PUR48XUuImz7
	iOvpDgQwFCnb96x+Hn9UFEaPdyWKhaNP4DnZ9XcRHSXMsWafrSKV/vUb1+cTbPGDViFdEsbk6NT
	RrQDYeGcxIAqAaJNXYcdf+sbTsq4GfdvIicWNey/DallqGZSSAdFc66PkWwnOMNRn6D8Zcj/XZw
	/SucpSAhZtdcZJWDyd6SByUSwTNRugVstyAaPYEtmztXdBQUWQOraGArpafrFMU4os3xbFpSBGe
	6BqSC/oyj3ulyKaU/Yw=
X-Received: by 2002:a05:6512:31d6:b0:5a2:bda5:c4a3 with SMTP id
 2adb3069b0e04-5a2bda5c5cfmr730600e87.11.1774956851831; Tue, 31 Mar 2026
 04:34:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com> <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
In-Reply-To: <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 31 Mar 2026 13:33:35 +0200
X-Gm-Features: AQROBzB4ctl2c0yLSalbIIkWrD6Zd2w8t9cdNUGWWq81ZnkBTRFdQQbrOgG2lXI
Message-ID: <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dikshita Agarwal <dikshita@qti.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Mar 2026 at 15:06, Dikshita Agarwal
<dikshita.agarwal@oss.qualcomm.com> wrote:
>
>
>
> On 3/30/2026 4:45 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 30, 2026 at 10:55:02AM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
> >>> On SM8250 most of the video clocks are powered by the MMCX domain, wh=
ile
> >>> the PLL is powered on by the MX domain. Extend the driver to support
> >>> scaling both power domains, while keeping compatibility with the
> >>> existing DTs, which define only the MX domain.
> >>>
> >>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM825=
0 SoC")
> >>> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
> >>>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
> >>>  2 files changed, 8 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/=
drivers/media/platform/qcom/iris/iris_platform_gen1.c
> >>> index df8e6bf9430e..aa71f7f53ee3 100644
> >>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> >>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> >>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[]=
 =3D {
> >>>
> >>>  static const char * const sm8250_pmdomain_table[] =3D { "venus", "vc=
odec0" };
> >>>
> >>> -static const char * const sm8250_opp_pd_table[] =3D { "mx" };
> >>> +static const char * const sm8250_opp_pd_table[] =3D { "mx", "mmcx" }=
;
> >>>
> >>>  static const struct platform_clk_data sm8250_clk_table[] =3D {
> >>>     {IRIS_AXI_CLK,  "iface"        },
> >>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/=
media/platform/qcom/iris/iris_probe.c
> >>> index 7b612ad37e4f..74ec81e3d622 100644
> >>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> >>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> >>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_cor=
e *core)
> >>>             return ret;
> >>>
> >>>     ret =3D  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,=
 &core->opp_pmdomain_tbl);
> >>> +   /* backwards compatibility for incomplete ABI SM8250 */
> >>> +   if (ret =3D=3D -ENODEV &&
> >>> +       of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venu=
s")) {
> >>> +           iris_opp_pd_data.num_pd_names--;
> >>> +           ret =3D devm_pm_domain_attach_list(core->dev, &iris_opp_p=
d_data,
> >>> +                                            &core->opp_pmdomain_tbl)=
;
> >>> +   }
> >>>     if (ret < 0)
> >>>             return ret;
> >>>
> >>>
> >>
> >> Hitting below compilation error on latest kernel
> >>
> >> drivers/media/platform/qcom/iris/iris_probe.c: In function
> >> =E2=80=98iris_init_power_domains=E2=80=99:
> >> drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrement =
of
> >> read-only member =E2=80=98num_pd_names=E2=80=99
> >>    71 |                 iris_opp_pd_data.num_pd_names--;
> >
> > See commit 7ad7f43e568b ("pmdomain: de-constify fields struct
> > dev_pm_domain_attach_data")

The intent was for this patch to be part of v7.0-rc1, but I failed
with my pull-request to Linus.

Instead this will be part of v7.1-rc1, assuming everything goes as expected=
.

Is it possible to drop/defer these changes until v7.2?

Kind regards
Uffe
