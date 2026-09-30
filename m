Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A973ED3B4
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775787; cv=pass; b=fMyuerOepj+CA/zESBmLO2vnojNyAfh4IV3GFV63mWZbKj6GUT7935q0NSneim6RK+xIznnGha3IQ15vqY92Z29UIpHqSUNqvyYGzcQyMnugHNvzIDb4kN/VnWyPpZhGWPfiKgwQsLTYhTZ3egH82IO6zNt4uZg/ocrmDmRmJfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775787; c=relaxed/simple;
	bh=o5I/27GpSdmTg2EINSqokfF37ZbT3yOP+K6Ho5qDsgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOCgHmioh1IxFKNOFxV7qvT0VOkbwYm5f/EYz02OULzCOW60ilJ/aP/K4Pd19AgD7Kw4M+VsBk7BXIRGMo4mDO4bRUDty70Pg5GwttfqeaLGvMhbw8qPCSx1lkX6dLNWDzUSRLuYX9MHBSdsp9ab4WzLHYBSnqrzZa0KvI2khWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TsF8ogRb; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TsF8ogRb"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66f7f72a284so5418386d50.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790775772; cv=none;
        d=google.com; s=arc-20260327;
        b=fp6Z6wTTzp19amoEqe/UKL3jW7D0uO+OkAEqu2c0QufeLkWo82ppaCweSZD6DFquQ8
         Eqdb0I23N0rk3W34OkZGBvGzo2a6iQVrH0/I8pH+ROdi9Adb4WYSUfKXLvxAF/yANJ5Q
         YHm0eEWjw/zMZM/RxfWPaNfALTrtWl3ou0jWA+n9O4aULs3dWksuqXyxRn3iVzh4qfF+
         hmyxhtzO59KFFn7DKpZ3KqWYIbidp3DjTswfJGYneS9pOOT3XnELENuyS99LlEm+DHMv
         mrWgfN4weS2QONTE5hEnCGVogUS0BB0cCuM824ZtfcLnE36wQKsslkGh8r9uYC1aE2qw
         Iz7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DhCRdy2JCa2oSL6X3aWOWI051OiTlXnSfcThJ9UZLT0=;
        fh=SDUBv+gp1ZIAMzK35vROg8z659ML61cswgvzd536/qM=;
        b=hErprcDQNpgDD7kwrjqigKCcFNMP1F7azGEHpiMNsPhMzFwevAmtRwjcTxwGARkLYT
         dgTqHyg8ga+NeV09V0PYn19862Mg2wpf2YLsdzfBEMir8yHIm9/Qv8xUECywQRhBkzWf
         gUcjnXb9enNZmAYOgWeATlta9WhtK3tAwvUHV//VzxV5pdyUc2VwrdLbQB4v52mWSmKQ
         1WGPSCDwKzoyGYVFPzVZMRpRfFd2bOOKLHbHixspl9bVF7Kv9uWgo+zq3CN9Yq4UIizJ
         /ylPwHXgJVbgs8H8cdu58mfrz0E5X4ecydqMfmj3a6qHurmr5YY1BkgSelspjcABuT8f
         VRkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790775772; x=1791380572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DhCRdy2JCa2oSL6X3aWOWI051OiTlXnSfcThJ9UZLT0=;
        b=TsF8ogRbUjHybVa7hAoFyguOzJ1HmqEa3O1CIunQPgjghz+O+N2fK5o/+ZvbE5+fdh
         bkIgs9UmPiuuEfEU+b3tAfm3/y39EDSEAgOzbrvKz4OhdA3GkrPd5cOZagxyBVevyRhr
         gkcfIxS2PSHFOQR2ETHHqXA2t7e4Lmp7v/4wE5K0MeqnZBO0GeJ1RzqkAhvTgiAf5mz4
         6047U88oLspQW6UhC+y76V02MBhR1UDRkJIpNWjqANIxCQQmlrqwQ7CnRUearKtZ3CLO
         VK0LtVm1Y9j63kOHntdQDMVugaEBshQJOMxp34YKaJotfwMc0ysHTSLQmHnCqB1hMctk
         X+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775772; x=1791380572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DhCRdy2JCa2oSL6X3aWOWI051OiTlXnSfcThJ9UZLT0=;
        b=ficLk/d+3ebb2A/0VlZB72T8t290VByriTnvdVTAD8aWJrXlZql91wCkOtzppjS9fG
         DlfSo8TPWg6nhPykEP4N+JnSoKtxrJq+apDFAEH7mDFLnlZvzSi2897+S1SSnnXK7p3m
         91GMmSQrDFtS/hUwCJmT3yTX3KYUIsjh+t7V/jZiUX9sv3AIgJ9pulu39B6YC60XMXjC
         SsfCVjIrwEUSxd/nQ7Jy9+bx/CZeoXSxRUQIS2kLoVNiUKgvktT8+dxPb80itphCjkf4
         VudcvTu+AADUHXkU03l7utzo4k/i5UhuG5CyZFCEZVULl7+B24X+Pcw6j9GhdwsaG2+S
         xBNg==
X-Forwarded-Encrypted: i=1; AKwUvBxgnFTf7jl//DyqNdQjfAbX5VoChVbsU84YNSwcSzrWWN1CdFJy8lt1hFI0WtrcX0sJ2MqUr9JsAL1q@vger.kernel.org
X-Gm-Message-State: AFq9FYKIvRPiUsPlCr1ZBRVZe8I0RQkwIIaic2kkZSDmFG91JuRjcieq
	pP6mH8rwh2OCShEHWwr/OoYBuftptWN3aBjrmvvpSGrEuP/UIstbymT/EWNeNss2GCeKUCZ7cyF
	AoxzdaDUFiYNcEy95Wx49WWl5FuEGruT/gDrbzXF4Gg==
X-Gm-Gg: AYBFou0gu2fbdCDANtEmmyzlq0OaWgEF2ne9C5R6YKWSxwrF6LbOHQaqMnJAV8L9Def
	tUEb9J2aA4eeTcUtrFtqTms+jQR/tuV2Cd6mIUpVR70TycEyvaILAjOtb6HGsJUyYOdOn73zZ4X
	yP4INLpxS1ey+JL+Y+pWFw1hS/gZ1g7bqOhPoVEqX29VAoa6nNsQtKR+UBC3vrlUmKEJPaLWA8u
	JryXFQM5aYO0bjQ/vXVWqeHXaxEMdUVS3Y1CnmPr/Sz7EiLkKUrhCVldWTZIfFIu7P6DZphlNMc
	z16+LohReGu1OZdWsyQLqv99USa9kQcj3gJvxit6Z/K9iiz7a+BwNizMGFVGYjZnZmD82MaA7bA
	=
X-Received: by 2002:a05:690e:4888:20b0:671:464a:46e7 with SMTP id
 956f58d0204a3-676834802cfmr493380d50.28.1790775772498; Wed, 30 Sep 2026
 06:42:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-2-c042266b9eeb@linaro.org> <5r6xd4iiwnv2v5ji7xeddihlqstmtajvw5ixmntlwxxmcvo7y6@zueqflvz3lr5>
In-Reply-To: <5r6xd4iiwnv2v5ji7xeddihlqstmtajvw5ixmntlwxxmcvo7y6@zueqflvz3lr5>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 30 Sep 2026 21:42:41 +0800
X-Gm-Features: AclHuK8pN-tKG1Z4oDPKCBz_In7b0hfp5ejCHcZi1g56pqmcGmYpl4iWM_GNAmM
Message-ID: <CABymUCP5Gs5Zx9C39RHj+1_mU7aLou9sfgZO=7yS=+fVPWHeLg@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
9=E6=9C=8830=E6=97=A5=E5=91=A8=E4=B8=89 00:03=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jul 27, 2026 at 04:08:41PM +0800, Jun Nie wrote:
> > Some panels require multiple slice to be sent in a single DSC packet. A=
nd
> > this feature is a must for specific panels, such as Sharp ls026b3sa06. =
Add
> > a dsc_slice_per_pkt member into struct drm_dsc_config and support the
> > feature in msm mdss driver.
> >
> > Co-developed-by: Jonathan Marek <jonathan@marek.ca>
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 27 ++++++++++++---------------
> >  include/drm/display/drm_dsc.h      |  7 +++++++
> >  2 files changed, 19 insertions(+), 15 deletions(-)
> >
> > @@ -1719,8 +1709,14 @@ static int dsi_host_attach(struct mipi_dsi_host =
*host,
> >       msm_host->lanes =3D dsi->lanes;
> >       msm_host->format =3D dsi->format;
> >       msm_host->mode_flags =3D dsi->mode_flags;
> > -     if (dsi->dsc)
> > +     if (dsi->dsc) {
> >               msm_host->dsc =3D dsi->dsc;
> > +             /* for backwards compatibility, assume 1 if not set */
> > +             msm_host->dsc_slice_per_pkt =3D dsi->dsc->dsc_slice_per_p=
kt ?: 1;
> > +     } else {
> > +             msm_host->dsc =3D NULL;
> > +             msm_host->dsc_slice_per_pkt =3D 0;
> > +     }
>
> Why do you need the else branch? Isn't it already NULL / 0 by default?

AI bot review comments reminding a case that panel device may be switched
to another panel. Not sure whether it is possible in real world. Just add t=
his
for safe.
>
> >
> >       if (msm_host->format =3D=3D MIPI_DSI_FMT_RGB101010) {
> >               if (!msm_dsi_host_version_geq(msm_host, MSM_DSI_VER_MAJOR=
_6G,
> > @@ -1757,6 +1753,7 @@ static int dsi_host_detach(struct mipi_dsi_host *=
host,
> >       struct msm_dsi_host *msm_host =3D to_msm_dsi_host(host);
> >
> >       dsi_dev_detach(msm_host->pdev);
> > +     msm_host->dsc =3D NULL;
>
> If you are fixing something, it should come as a separate commit.

The same case as above.
>
> >
> >       DBG("id=3D%d", msm_host->id);
> >
> > diff --git a/include/drm/display/drm_dsc.h b/include/drm/display/drm_ds=
c.h
> > index bbbe7438473d3..c522ab3d71853 100644
> > --- a/include/drm/display/drm_dsc.h
> > +++ b/include/drm/display/drm_dsc.h
> > @@ -267,6 +267,13 @@ struct drm_dsc_config {
> >        * Offset adjustment for second line in Native 4:2:0 mode
> >        */
> >       u16 second_line_offset_adj;
> > +
> > +     /**
> > +      * @dsc_slice_per_pkt:
> > +      * Number of DSC slices to be sent in a single packet. This is no=
t
> > +      * part of DSC standard, and only used in some DSI panels so far.
> > +      */
> > +     unsigned int dsc_slice_per_pkt;
>
> If it's not a part of the standard, I think, it should not be a part of
> drm_dsc_config. In the end, drm_dsc_config is also being used by other
> parties, e.g. DP or HDMI. A year ago I saw a version of this patch,
> having this field in the struct mipi_dsi_device. I think it's a more
> correct place.

I will move to struct mipi_dsi_device in next version.
>
> --
> With best wishes
> Dmitry
