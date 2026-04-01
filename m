Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E6A3CBE65
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 10:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775040403; cv=pass; b=IlqV2G+Gyx5/Q6CH46FXJt5+7syFVV78goWlNWDVGWS//JOpv+f4jc+HkgX++mNOtAEKoQBHli9v1SejVrDk2Abw2wpg99MLOLc53jpclvavTZIT9ciO3ZLckvHaN5rpRBfLJeo2ReEmeeDECgi2LdEHxjlSGmQRNt5W+VP+QyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775040403; c=relaxed/simple;
	bh=40aqi1I55Vmq2m60iYFNVNuV+Shkhm9O7nHBPNLlR0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=grjTIGS6uhaRXMCRXLv3OlcBmGP/jXZl5osiagxnM36mNvH/UL6Jt56RzE6TIaY3xM7e/Hmod8NyECE3jfvxdqKE87vq0Gz69CmLoaYiQT0d9t3e6ewiad7ZfIcSTJnAJ6n1KWrWu6Ze33z8KKOd03S2LdXroZiG1oP9CRcBM1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=focpdnG0; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="focpdnG0"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso7171422e87.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 03:46:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775040400; cv=none;
        d=google.com; s=arc-20240605;
        b=VvPO5VAtZlGD/H4pM7NJvpNxofCzVTLl0tqUz9f+9l5E6rAPYfVWxETx4W/v7uL39h
         q5J1FZn/LvlNT5kvuaZCW+kDxFMdJMLxuc3MOa8a7kKjW3Edd7S1QTM+UX3MvBPvj9no
         pomMbrG5tDaop+nTfqGRJkzJiBqAPUIDr0LE9N/wvy35QdFhoKwm8LKjdNU6ppMYq/KR
         Mcd2aIJgdW5JawWW11gwly3YaGoDxH02GXIPcCfaKdgFx3rZE8+32c+lYaHV4vFLG5HQ
         3XLEiXQ9tC9BoPwPtlMkBGzGTIFouzIL8F1KmEE7w1GyoAUuVKPgP3MhfWfEcgaUgPuA
         xdOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gSozclW0x9vuMSqSBfuRXxbpTpkomr2e0lWVw9uMgPE=;
        fh=koP+M2aDSmA+YuA3f+NSe2gI8tTBYlc+c7IwKy8Ai1g=;
        b=Ru5rgZUto/JG68fPElNLLOc0fBhqV8HQUC5D8apoZUwS2/IXDR6xb95qN4cCESag18
         mqlh5ybstgGvK++0qs7t6fFr+mmLDfs6fSOBdH4UcGpOY8HN+xVum9CkOZGuSonutIFA
         gQWgOyG9txvgjFy1hB7czSQKr942fYtKFvUK+WKWL15Sa5MAbzcIHf71J4Mw99XPXIFB
         Jts9M7GjGz1HHRH76nEHvTrvZCGDVjK4t5oeudJBro55PZ+E3ZwNdcXE9YRJAxPwoUKp
         G918Z1w7DxXgPuqjVxXwoavsSJXVmGY0WSSxV1mAPob1hjUK3VAFOVA3uV2Sko7azZfc
         99ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775040400; x=1775645200; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSozclW0x9vuMSqSBfuRXxbpTpkomr2e0lWVw9uMgPE=;
        b=focpdnG0GNhSC5kPZtsCRM+qqdNyOoozw55topTHlqkT64idlswtImyxxhINAityZZ
         bcEtkg/HPSTytTw7A7MPNY4KkVmXLrzLkLNNTKPj37Twvjaz0onaXbAptuv2B9tBXsAm
         2WmpmwS0pSogb9M4YXD79tOwcd2o4l3CaB+9FpQ6EEUXLJpEW1fTksCZp8+MxDx6LzWn
         /DvY6EnxnogHltjx+1SbFhTNABu/66GEItPQ49kbEvm7oKb30fBNNsEW4HE5wkNotULc
         FLaFedn5Z7OazQsO17FVTAh0EzOKMFAMPfBNzn7W+Usd+sa5n4vjcA/biSE5Ua6XReIz
         Q5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775040400; x=1775645200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gSozclW0x9vuMSqSBfuRXxbpTpkomr2e0lWVw9uMgPE=;
        b=QDSlLn5V65yEn/AjSnkrp9CPX1GPegWOxFpgHnCrpIHbTBnzEGsV47XOGpNNd1jPKF
         ALN/QjrGI4yjOoToNuOL2f1qNPh+byvlhJMWaU1itqQdxt2nXbj2PbPQlU3FC/IbnFkR
         6W5BDkngplUlCuiNfUe1Ow8VRfZJ0D4P3sydq7mrc+6Guj+pB6XOMu5oOhu1HAUY4+wt
         YQTFHOlDExdGldCqtDne+bfhdef8O65wc/iPwV/UFajgwsemS0ApmsJ38QjnqqQTpPCR
         hcsIwPAxkx7b/r2TtrvTDyWX4haTbV1NJGkt8VQJyvP243erVf3lMIxlmkxaRz7xBOIb
         MeJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvWJaP9duhulG5pGTuIQp271890ynmfmQIV7NBpNZFshjDdkD6r1HK23kuM1i/hOHYuHLRFlKnh1qG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8r4wHLHA6JysERIp+giwRdDyzHty03AFzEg0bFt5St8RQWbEL
	lcDHD9sTXnN3OFlaMrKJzJOyFIRDKBc7pG4gViAlhyuI0EGwn1tJy/emC2F2tftXxwLaxh+5H0V
	EFEdAD7/1FrIgvLtPp48p0UW5b1C1FlJEPn4olIVh8Q==
X-Gm-Gg: ATEYQzx3pesPUExswsjWsJQXNbcr8cDQhRCFdEK+zvbJlgB3WnRVo2ABNLXjuHSkeoy
	0rAQuJv5+aQjdRxYSgA5XcbCgy0lmsRKl7Lhd9X6TO5EqRF8ePg7KS9/1XFUdiAhRaPsDK/jJOP
	GgZEgvw5GdJQTWfiARDCj4jWPndIjMo6GGkSFLwWGvRSD3ryTKXYhyMU9YQLz7eOc9Tul55SyV9
	JAZ5CO72gX4jnzd6nFGM85BWwm6Do5GZCWhiUYjTwMpOyhr/KU7HxSexhwmTju7tnGbMvn1uTFq
	SKsp5kUx
X-Received: by 2002:a05:6512:1254:b0:5a2:c0b6:729e with SMTP id
 2adb3069b0e04-5a2c1ee82b3mr1132629e87.4.1775040399387; Wed, 01 Apr 2026
 03:46:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com> <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com> <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
 <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
In-Reply-To: <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 1 Apr 2026 12:46:01 +0200
X-Gm-Features: AQROBzANxupbHHkAqu8GJiUFFGG603SVUVTYVg4H2FBCM1h61nXzlIOx_SK4W6w
Message-ID: <CAPDyKFpm7ujNw51dVpPaHCwssjgYe1JVBEyrQ_1CsPbDJuW0Ww@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
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

On Tue, 31 Mar 2026 at 20:46, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Mar 31, 2026 at 01:33:35PM +0200, Ulf Hansson wrote:
> > On Mon, 30 Mar 2026 at 15:06, Dikshita Agarwal
> > <dikshita.agarwal@oss.qualcomm.com> wrote:
> > >
> > >
> > >
> > > On 3/30/2026 4:45 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Mar 30, 2026 at 10:55:02AM +0530, Dikshita Agarwal wrote:
> > > >>
> > > >>
> > > >> On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
> > > >>> On SM8250 most of the video clocks are powered by the MMCX domain=
, while
> > > >>> the PLL is powered on by the MX domain. Extend the driver to supp=
ort
> > > >>> scaling both power domains, while keeping compatibility with the
> > > >>> existing DTs, which define only the MX domain.
> > > >>>
> > > >>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of S=
M8250 SoC")
> > > >>> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > > >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.co=
m>
> > > >>> ---
> > > >>>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
> > > >>>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 ++++++=
+
> > > >>>  2 files changed, 8 insertions(+), 1 deletion(-)
> > > >>>
> > > >>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.=
c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > > >>> index df8e6bf9430e..aa71f7f53ee3 100644
> > > >>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > > >>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > > >>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_d=
ec[] =3D {
> > > >>>
> > > >>>  static const char * const sm8250_pmdomain_table[] =3D { "venus",=
 "vcodec0" };
> > > >>>
> > > >>> -static const char * const sm8250_opp_pd_table[] =3D { "mx" };
> > > >>> +static const char * const sm8250_opp_pd_table[] =3D { "mx", "mmc=
x" };
> > > >>>
> > > >>>  static const struct platform_clk_data sm8250_clk_table[] =3D {
> > > >>>     {IRIS_AXI_CLK,  "iface"        },
> > > >>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/driv=
ers/media/platform/qcom/iris/iris_probe.c
> > > >>> index 7b612ad37e4f..74ec81e3d622 100644
> > > >>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > > >>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> > > >>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris=
_core *core)
> > > >>>             return ret;
> > > >>>
> > > >>>     ret =3D  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_d=
ata, &core->opp_pmdomain_tbl);
> > > >>> +   /* backwards compatibility for incomplete ABI SM8250 */
> > > >>> +   if (ret =3D=3D -ENODEV &&
> > > >>> +       of_device_is_compatible(core->dev->of_node, "qcom,sm8250-=
venus")) {
> > > >>> +           iris_opp_pd_data.num_pd_names--;
> > > >>> +           ret =3D devm_pm_domain_attach_list(core->dev, &iris_o=
pp_pd_data,
> > > >>> +                                            &core->opp_pmdomain_=
tbl);
> > > >>> +   }
> > > >>>     if (ret < 0)
> > > >>>             return ret;
> > > >>>
> > > >>>
> > > >>
> > > >> Hitting below compilation error on latest kernel
> > > >>
> > > >> drivers/media/platform/qcom/iris/iris_probe.c: In function
> > > >> =E2=80=98iris_init_power_domains=E2=80=99:
> > > >> drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrem=
ent of
> > > >> read-only member =E2=80=98num_pd_names=E2=80=99
> > > >>    71 |                 iris_opp_pd_data.num_pd_names--;
> > > >
> > > > See commit 7ad7f43e568b ("pmdomain: de-constify fields struct
> > > > dev_pm_domain_attach_data")
> >
> > The intent was for this patch to be part of v7.0-rc1, but I failed
> > with my pull-request to Linus.
> >
> > Instead this will be part of v7.1-rc1, assuming everything goes as expe=
cted.
> >
> > Is it possible to drop/defer these changes until v7.2?
>
> It would be very sad.

Right.

Since it's my mistake, let me reconsider. If I rebase my branch and
share the necessary commit through an immutable branch that you can
pull in. Would that work for you?

Kind regards
Uffe
