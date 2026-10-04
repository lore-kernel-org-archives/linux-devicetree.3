Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC893439F73
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 13:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122299; cv=pass; b=aTMhsnAmRZ6aw5Zlo7+pV/RfVAFTxB3wfNS2FEqee5Vd1NSR1c5hVvyArRQRm587hOomnTEZKLd5uxiDDRTZKp9zY3FYGmW9S+rORlFWXyE++NyBbW5sea24GDIM8o2WW+lCxMmR1EOKyeEB5VrU99h0ygLsa36pSNvu9HAG1Zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122299; c=relaxed/simple;
	bh=WEaQ6XiqVtg2tmigVy5JhaPpL6oItqqeQ0+x0LG+yaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oKb/t7MNvn3LfyIUDHBL3RA/b+JUCt+cy2I4kMh5MR+5JmoWGA6ppFSePKsB9FbHYLebDPnZYj9zd1t3kQ8g4sZmsJ88V3KIb/+OSHDE5VjYUgeAW9UaMdUjrIRINSEPpPmfscGvKEFZWnaNjD3HuWax5XojgNU3VjdOWMrzEV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tiH6Tam3; arc=pass smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tiH6Tam3"
Received: by mail-yx2-f39.google.com with SMTP id 00721157ae682-8ad0c8eac08so5269387b3.1
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 06:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791122296; cv=none;
        d=google.com; s=arc-20260327;
        b=KqwpNKJ8vG9ZwEwJUnwfd7BpoWxuvcCI8OW8fa3CfyKzwKnUR4EdnHeo8twnmWvCkB
         AzO2tBn17jPzFUbi/4HbLWqRVFLRQexIHEdWRJYtxBAHLMv+sC0xT2kMUZa8aduUWw3g
         OUR3SmwX5qi9TEltIUcrPnGRJGMyIqbBg/1Hnlhm00T0wvSHmJZeSyoh08yUUR6vGE9K
         3QyFUKGAuOPpEsG6f3iAX5n3vLkVy34I2P80xcDpBPkP2GqUpPYuWZuR23oTXGLqBV6s
         ZkfTU8XfuzFVi2M+FqOS9AbVJr7LtTvpZuPfd8mztFdobKHuB8Vhr4Yb4eM4BVS84y2E
         sEUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sc47DcnOG4SbqUBdnELdeiSnIhxnStqddXLb/q6F8OA=;
        fh=yBRFASHFRvhz3EKEjm1obN0KoAV6jfOcpYU4uZEmTxE=;
        b=c1dT5oKLlY2FWg7PJh3jWQpZkfElrGB7BUJJCKoK9oAUwfvdeRVcCjQdqrXKCA9ZL1
         PmBKA3PiqQjq5P3PppXwIDHdfhtSFm6y92dDY0D37aSQi8UVZHImCPtOmPVjI7/JyvSf
         znZcIjXJAP/yuCjLxQD0sTcGta6xQi3p9Ai9a4a4GUx6JZDtm7Cnp1tf1Vpb00LqtSwo
         G8H5E4YCmuuC+FXXAs6xydTM9ZdEtdt5WOJnufoiA3Jahso4CAbHxids+QSVlivpkX/j
         fHbXQdMvfi55iR6xpBi9SzWNiYNhlz+2cfDT7/l0PC1Ffn194W+/yiFEX5DhonyZsw1+
         B0KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791122296; x=1791727096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sc47DcnOG4SbqUBdnELdeiSnIhxnStqddXLb/q6F8OA=;
        b=tiH6Tam3uTd2FiXGSp4cxy7BQT2SyfuRaZ2ny0fStEJfjXUAfxIDYl47qa3HDFdivA
         7ptVHFPAq0PEDn6+SxhA+luVp46kSo+f+m86prEP/wUCnjmL5nS0GZY1DNx5EdmIMKoy
         dUTTItSPg3XFyhJca9mxAl2hSH4xLIN+/RwupcrP8r+k1Asmuc17I6Y3O/eJ/r5cmObt
         P3ai1msSZCVD/MhY4AfciVOn72dvDsR2VZb2o8Gus4wOlwv5UI62ft2xOoNbJN4ILCK9
         KowIRK5QzV1LmRwSqx2t0niwkcmMoJqsmlE4XT5bH+ODeig7tDD0UPn0+IE9arsW+VPE
         FIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791122296; x=1791727096;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sc47DcnOG4SbqUBdnELdeiSnIhxnStqddXLb/q6F8OA=;
        b=BkzMMVUGKwvWRJUHbhZvHWu0KpwK4W2r+HbvJ+5bNdEtdCzI9mi0bigorSPrYhIfv9
         5zc8siooMOjtnnG85yxyOky3eB+4WrQ9/y1GIeFr4DrMKAPRuvCopRLDkQOK+NECmDwV
         DEDn5ZPVKgWqB7CJ1GG8ceeJ+UQfWBGo1nYEPh/XYJJ4Mm9HQbRZScEKO10DjmaiorQm
         K7o95ed8vN7jN/24SjKlLPgx9WJenj3ea8SuQCepqIAQ8kdzyKnv7OQD37KaiSivYCv8
         3eom5WBWOgG30qOCHgD8yQd45UYwtsXBrtIWwHXSn2pee6/IZIZkVPd0VfBYcsMzaBWk
         b7eQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiO5/gYqdKhPbaaVPhRsMcfvvyQebdSAVhlCuvHuzRzWb9T+0RZuVv5iWhnLZjs1pXn6vroD00A/O6@vger.kernel.org
X-Gm-Message-State: AFq9FYJqWa2KsNoobG+rQNwON6zZja0heZMxGXXzPy1pEF4pfNSZxQGQ
	StxZ3+nJ5bJ6jpcbuuvGujfgcoFR5PB4iwnDtQQzckzJj4WwO/oHzVrR0Nat1ZfOVnxDe2IzxYs
	jAh8uSxtLFBdAHa4hduC1xSwmlzsD0pExTFW/4Yg3jw==
X-Gm-Gg: AYBFou0HJ07PlxWUPo8wPvzwmGAzs8dqPBN7e0a3ecEyeGKL7NxS+jGe9YVo9iYOUgT
	g9qXf7FJCyfF4eIvLpPihJqk/pjfUI4dfSTvb3Kx1MfgVnQzwk8BkhZctVVZA6Gm90Cx/UNzazD
	rbhy8ACglzviFN3wIyrJ/87FXqGojtt8iPq4/ywg88rwz3ULXW2+EZVEAGLbl7JuK+kwnxyxaui
	j5UfJEIgoqsS4OvEBqzXdSO7iR3J31Pqk0nNoaZPyiwvEtw8XzjAXSKiMqVDIUrHnUBWQ/E8kCG
	oD3G1itOY5KKhmiH0tJAZ1tC38znRhK42YOaT4OfD70R3aTDDPMS5CIKHcIE6w/f
X-Received: by 2002:a05:690c:c3ec:b0:8ac:b167:4877 with SMTP id
 00721157ae682-8ae39bbdff2mr22844037b3.36.1791122295720; Sun, 04 Oct 2026
 06:58:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-3-c042266b9eeb@linaro.org>
 <gu22hz3dnttzyu2eewpalgzxtocmlbfvnpwore36ufmyr3xtag@r5bbhafsn562>
 <CABymUCNtcgbcRNXdMUjVdnH_ybOxjFB31gd6AW-0HCFDSn9w4g@mail.gmail.com> <kgnrsnko7u4g6bpxudfo6yqubhd5gcyrdyovjfkohlgo63yrwn@xbgp7jgv6ns3>
In-Reply-To: <kgnrsnko7u4g6bpxudfo6yqubhd5gcyrdyovjfkohlgo63yrwn@xbgp7jgv6ns3>
From: Jun Nie <jun.nie@linaro.org>
Date: Sun, 4 Oct 2026 21:58:04 +0800
X-Gm-Features: AclHuK9hzkrn0hz5wdouvmEqGC_OxpKSvbDPHUzvFuTecXtty7kAzmgPFKXJfPw
Message-ID: <CABymUCMGT32A5gE+a3u7=-3scH_Nu7Amb22-FRfWiNrcEOnAgw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] drm/mipi-dsi: Add flag to support dual-panel configurations
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
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
10=E6=9C=881=E6=97=A5=E5=91=A8=E5=9B=9B 03:43=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Sep 30, 2026 at 09:52:48PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B49=E6=9C=8830=E6=97=A5=E5=91=A8=E4=B8=89 00:05=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Mon, Jul 27, 2026 at 04:08:42PM +0800, Jun Nie wrote:
> > > > Some devices treat two independent physical DSI panels as a single
> > > > logical panel from the CRTC's perspective. However, two separate DS=
I
> > > > hosts are still required to drive the panels individually.
> > > >
> > > > Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
> > > > allows a panel driver to inform the DSI host that it is part of a
> > > > dual-panel setup, enabling the host to coordinate both physical
> > > > displays as one.
> > > >
> > > > This change does not force individual panel driver to manage
> > > > system-level display topology if the driver does not intended to
> > > > support dual panel topology. Only the driver that set the flag to
> > > > true need to take care of panel topology.
> > > >
> > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > ---
> > > >  include/drm/drm_mipi_dsi.h | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > >
> > > Do you have a single MIPI DSI device, or are there two independent MI=
PI
> > > DSI devices? In the latter case, the flag is wrongly placed.
> >
> > Yes, there are 2 mipi devices, and 2 mipi hosts. This flag is used for
> > mipi device
> > to notify host they are one of dual panels, so that horizontal
> > configuration(width)
> > in mipi host can be handled correctly. Where do you suggest to put this=
 flag?
> > Thanks!
>
> Into the msm DSI structures. We already have several Qualcomm-specific
> flags. I'm thinking from the 'generic device' point of view. The
> 'dual_panel' doesn't mean anything if the device has more than two DSI
> hosts. You need to specify which hosts are mapped to L or R channels, etc=
.

How about to add below 3 members regarding multiple physical panels in
single logic panel. We have h*v panels in a panel wall. The index start fro=
m
0 when we iterate panel from left to right of the top array of panel wall. =
In
XR case, we have num_panel_h =3D 2;  num_panel_v =3D 1; and
panel_index =3D 0 for left channel, panel_index =3D 1 for right channel. Th=
e
original framebuffer is divided into width/num_panel_h and
height/num_panel_v for each panel's DSI link.

u32 num_panel_h;
u32 num_panel_v;
u32 panel_index;

>
> --
> With best wishes
> Dmitry
