Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07525349CC
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 21:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791928006; cv=pass; b=KRLZLqcI2wXjekJ3xBaU/5Wx3bYmi1pZWqpnYL5CS9ptiGt4ifHYD6IMddxRLVrV/xZh+NLWJ6uzYQbsCPY/vHaKr4n9STwhAHFs7cMuPbJPf4CMKTYohR7gdpoU5LolCH0HIDkf0qbiECz1uuvvsJAi1gZQrg79hUsqNqMK4pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791928006; c=relaxed/simple;
	bh=wTbiDtQ3Q4NbSHIp3HtWK47X70vEoCGFPPZl59iLx1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CU1mYEFjU46+4eO3KhUAMpuDWVm+2Iy0B8JRV29w1vImIUwXJzckal8Vy4OueAO5x6PqesFOke4YqFv5ydk2a9uUHmnefwuRf52vVMbXjrv25wn6cCNSQnSafk+4T1cUo6Pj08EN3385+V+iwhsQobQsBCNrRo2ydeAdap4toKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Frct16Zl; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Frct16Zl"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2e7131b94eso316521266b.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791928003; cv=none;
        d=google.com; s=arc-20260327;
        b=rGEDuxIFfceqsYBtpUCy3aATy4c2+DLqXbiO9DYa8IBWVamABA2TS74CZSGtESgxwV
         FfpH+mW2hqFtBtSRMg2c1s+O+tbGYd3kN7WKzSoITgpw4zlol1V6hSx2taUfFA0bNRDb
         vVRqRA8FDvWXgxi2HFzKewS+xkg7ny/xKnAEjQtPThfI8bWmo4+XrxNuWqcb3F1pWVOC
         tSd32Of6KaOSAJFiDpv5d/6R4/0Cmm/oeoAmQAP3+FYfGLXI/fFyyBaUkf02Y3iAw3bO
         Fj6Xp4uuZC/OedWuQzgxkvA+XZSkvADzQxZMDH1kwye9sAVqCGMdJ3Jun2Cxlxpt/yo1
         EE/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AqZD4Ft9JyhRwT2DBarljuLbS5RYQ2WwnZPQWaQ6rj4=;
        fh=OlLNfxmcbfBJowzdNeUL7pfG9iRuroXpjQbAgIquNew=;
        b=UFmL+hcDwH4/fmixLG5A2Idsne/Fa1k64JjBzr29GJd7onJ6Yx6Hlb0hkjkCTkYlMz
         ykMi3tlq1p2wq8yCJHofGSV5X3W5SFSo0Zl90GajKAluDnE97J5fNSSLzThIXPepvd53
         9OLmzi6pePnwPjX6zCCf50EBLVK70xk4v7XqWEi+nX/dCzPQ3/e+Dya5G1jZC7k/c3g+
         Z5tKpBFflztODI//+hlXkcJepmOHgz9NmcuQ8KZ+GwNu7zlrcOHac55dRaiQxA17CC7Z
         1FPH7U6NkQSU1We7ZO0cNpC6xsgZc1Ec3gGX0KYYkRSesNV4yXGK8I5xix2dFDQEgg/P
         IzMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791928003; x=1792532803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AqZD4Ft9JyhRwT2DBarljuLbS5RYQ2WwnZPQWaQ6rj4=;
        b=Frct16Zlu3E4yvR3R4xRFb5bKlPZdJC94E6AAu4ruLx9L3BjlkWZcgdKXf2wrCcgQD
         mRbpxRv9Nt861zAnBPn/kV9etyomQG9NfmvWbNLtH2FfN3ijxypc/z9/Js0z5S7bNnN6
         tBN/ztVHbKFsMm3IGPxLqCA1jM/d5j2pWlcx+watj30JwZCIWTMOIyKEQ1LUnGk0ichg
         iSKO4G6TLVlrBS7liZ1VPh+gDniNKUCrL0A1RmItSNtPVwjsgih2IlPrfNymdoY+Avh/
         2iP6Z86IOhAD3lyeHyUsToQuqsn05+97naeJBD7Q8JlVC5hkn8ZUZJh1Z3o3G+SVGF2f
         YnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791928003; x=1792532803;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AqZD4Ft9JyhRwT2DBarljuLbS5RYQ2WwnZPQWaQ6rj4=;
        b=o5UpXoiSH0PcUxftzI7tr/qHP4uK2A19quj0JzBeH5oaT14SXj96NrO1huN6RArQRr
         aZOkD+jOSL/PBLW+UXQeFVLgVX4S+NrQSUimzirrZgNdTshLkZmTUwHNABYe0EHdIbmq
         kJZpoFcL1J0SRKm4M79eLau6cEyCouNqFaZDDLVkKZPkoC+6qO/3Lwu7FzqNxyrxfJV2
         Kj6u2dOKCyqxIfXZMg99y3rooqpm0/SK/l6cemxp37Mbc/S8BmNLQYYLIAeyB/am99/9
         8PcJXn2gcqfyeYbddaDgFg2uOEkeNgSmVKXT/Usnhq5eC3niS72C84WPE3800mdklw6B
         gtoA==
X-Forwarded-Encrypted: i=1; AKwUvBzmsqIyvG6AxI2kH92pZfBJalZaBfjajGP+MvNwunA5W0FqQjgcSvoxocenLASk8RgX++f5yYh2j1aX@vger.kernel.org
X-Gm-Message-State: AFq9FYImmBjxIfwMi4KENq7cWm8M8vPFGk0kdcmS2kjp3Q3oQ1IVgivp
	76KRjlhm/OV6sWJfCUcXi+Sh2L1EyGsnYxS3a+OrTqml3nl3NwR7SOiUqkVWxT5s9unHjeBW+wC
	BxSXOn1r936K07OjAQM+wymLVtfBmqqY=
X-Gm-Gg: AYBFou1ieiMLYtsPnK7ESfK2GG5CemiQuim1LV8Ru06uL0Sa0iv/ckzV4wIv+KpZki3
	ZXjA3KUAYXKrVMouqA/P9JzQcec3rdJ/WHyxVNzwfYFL2q1xavOyH17LIjtW9Fr61vc8imoy3qW
	L7OSd7ebn0brxPxypqV02URJYdiAAWvb/Jqa7P054aV3wYEDOPViYUhSTWIu/nFTn3ll7605qMy
	1blSYrxV/NiDWBnnGw8UtP4zilexut5w8tseDR9CwooGHdblyF7UX1M/Bkkzbji1mtlzeF4Gj1W
	Q/71wJ/To1Wd75elcXwAJMiTy/gDJxyupYKj5UxYaL7o6fuoYuwQeg==
X-Received: by 2002:a17:907:3d51:b0:c2d:be57:f742 with SMTP id
 a640c23a62f3a-c31a71252famr1282278766b.32.1791928002700; Tue, 13 Oct 2026
 14:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-1-7188e7ea7a15@fairphone.com> <CAD=FV=WVAnohGm8kmaLpfchk_MxCiUB8EcyyWBxZqtnc+9YPcg@mail.gmail.com>
In-Reply-To: <CAD=FV=WVAnohGm8kmaLpfchk_MxCiUB8EcyyWBxZqtnc+9YPcg@mail.gmail.com>
From: Jasper K <jja2000@gmail.com>
Date: Tue, 13 Oct 2026 23:46:32 +0200
X-Gm-Features: AclHuK-NqYEpvDtDXhi9IVbRYKes3SwwvzbOhM7NId12OJB7ksYzqp34C_yrVg0
Message-ID: <CAErD6092tBte1je=9t0_NUwrU8uqHen_ffYMYXFBqMCJkTZRHg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/panel-edp: Add AUO B140HAN04.0 panel entry
To: Doug Anderson <dianders@chromium.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Op di 13 okt 2026 om 22:35 schreef Doug Anderson <dianders@chromium.org>:
>
> Hi,
>
> On Mon, Oct 12, 2026 at 11:11=E2=80=AFAM Luca Weiss <luca.weiss@fairphone=
.com> wrote:
> >
> > From: Jasper Korten <jja2000@gmail.com>
> >
> > Add an entry for the B140HAN04.0 eDP panel. It is found on the Samsung
> > Galaxy Book2 Go.
> >
> > $ edid-decode /sys/class/drm/card0-eDP-1/edid
> >
> > 00 ff ff ff ff ff ff 00 06 af a9 65 00 00 00 00
> > 28 20 01 04 a5 1f 11 78 02 9b 85 92 56 59 90 29
> > 20 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> > 01 01 01 01 01 01 14 37 80 b8 70 38 24 40 10 10
> > 3e 00 35 ae 10 00 00 18 00 00 00 0f 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
> > 55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> > 00 42 31 34 30 48 41 4e 30 34 2e 30 20 0a 00 ed
> >
> > Signed-off-by: Jasper Korten <jja2000@gmail.com>
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/=
panel-edp.c
> > index 2b455369ed70..73cdc2d37ab7 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -1986,6 +1986,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B11=
6XAN06.3"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B14=
0HAK02.7"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x643d, &delay_200_500_e50, "B14=
0HAN06.4"),
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x65a9, &delay_200_500_e50, "B14=
0HAN04.0"),
>
> I'd assume you don't have a datasheet here and that the timings are a
> bit of a guess. It's nice if you put that in the commit message, but I
> won't block it. Ideally you could reply here and let me know if you
> referred to a datasheet or just made a guess about the timings so if
> the question ever comes up later we can find the conversation based on
> the Link: tag...

The guess was based on the other entry of a panel with the exact same
name, but another ID (0x403d).
The link for when that got added can be found here:
https://patchwork.freedesktop.org/patch/msgid/20231107204611.3082200-4-hsin=
yi@chromium.org

There's some panel documentation around on panellook, but I'm not sure
if that matches the HW rev that's in these laptops,
nor if they actually contain the data I'd need for this panel entry.

This setup ended up working out, so that's why I left it like that.

Kindest Regards,

Jasper Korten

>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Pushed to drm-misc-next:
>
> [1/3] drm/panel-edp: Add AUO B140HAN04.0 panel entry
>       commit: 9125232bc2a5020710db1eadd21973757f740648
