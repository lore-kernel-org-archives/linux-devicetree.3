Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5820135F609
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 05:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788587674; cv=none; b=bOkswhgMXUqheVuJlb5G8mn0qJ7xV4/KXYSGbZ0o+NBpZjIZNcaipWlV//uDzHUHLrYlskHPeYfg2ET5gyVcCbYwRCYFeBx/4NGgew8msvprPMgjZm0bvAKIU4LgeHt/Pvljzv/uqcvapwhQv9WdA//jZOKRPwXjyVzpMeon2J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788587674; c=relaxed/simple;
	bh=ZQ2vS+l57WsslsQOvAdalTXWtP6Z1U8h0cqLZXTqvVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptrysxn7+Eb7f/yXSKZ7KTP4sXlQ7GXE3xpVu662+GX98a1S86hBTGHeu9jN5AsKgvvqMdkZ5gy4a3jbW7UDUnvxdMGbd/A6fl156gzy+MKO2Cjj4S4s95/kNRHm2xC77XBjncoAVuLsstEYKbQeBJke7ngYsducxkv9g2C5bHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOn2+svG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOn2+svG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74561F00A3D
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 05:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788587672;
	bh=jxqzcQeIGie1cb4FNpKSX3iCMnz8YLMB5HRJHa4aZCY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bOn2+svGRmROLQtQOQ3lWibKq6ATbp2bWTFPwHkDOfltsuNU3h0n+m93nBI+TgiVG
	 aEz/g8z89LDhflQ6Fb9nKfQxDDpYVmfSvrXq1h3lwram48YgxiEAzBq4Vha6+yBXwq
	 WRBV567OXZyhXTrHVGR9W2MPixe49PVBY/V9dCrUOzqJdbfR2DMSN2RgDTgI0LbV7l
	 Dbslo25y+mqL3TVeDLfN9ImrP77d0e376fggTK8jzLBUxBYYvMCJIrdZbSn0hTNSQj
	 dCzo3BbzqFrrZ7fCp5CvoxULMfgD4PHzhvFpOilKPZMv/ugRT95DHEd1OqOdn2c6Gk
	 MyJmCKPnqzY5g==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so1477708e87.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 22:54:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxOLem3NwvYlRRv3qWqW1050Xprmnl8aT3VFPAt2gnK0E6TujGFneGyuXW8S5cP9wGEbenX4KFFpK4J@vger.kernel.org
X-Gm-Message-State: AFuF++lYDVqApK/7L8EzLr+jhK0XTNe4do4KGtXNEfNIHI+SuV2JlbcK
	+yI8dawT5P9zYOTuIMns9Nll7wdx8PYppvaraBg5OVlCpEY2TGrQNFlIRxteGhOy2JxMxrikO/p
	2zc2v3sBMiV+OVt61LmaBAgUcZSN4qFU=
X-Received: by 2002:a05:6512:1285:b0:5b6:4b1:f8bd with SMTP id
 2adb3069b0e04-5b616f5b5cbmr1782508e87.30.1788587671407; Fri, 04 Sep 2026
 22:54:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <CAD++jL=A5QWEfNXnmpKFMju8X1BQ8CsxMuqhia7mfMFbUaFfHg@mail.gmail.com> <aprT7A2w0TWrfcdn@SoMainline.org>
In-Reply-To: <aprT7A2w0TWrfcdn@SoMainline.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 07:54:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLmRi+f3BGGxXzkP1ubaP2J8Qfy-v0HAmQqzN1x=e6d3bw@mail.gmail.com>
X-Gm-Features: AcwNN1XAvRFezIXLk1kako-OF71HLCqFCnufftCArrQ1b1-qMTvV5mxqn8Q5HwI
Message-ID: <CAD++jLmRi+f3BGGxXzkP1ubaP2J8Qfy-v0HAmQqzN1x=e6d3bw@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] drm/panel: Add 5 DDIC panel drivers for 14 Sony phones
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
	David Airlie <airlied@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
	Martin Botka <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 4:34=E2=80=AFPM Marijn Suijten
<marijn.suijten@somainline.org> wrote:
> On 2026-09-03 00:22:41, Linus Walleij wrote:

> > > This is the second version of a largely reshaped series that brings 5
> > > new DDIC panel drivers (4 Samsung, 1 LGD) that are compatible with 14
> > > Sony phones:
> >
> > What's up with this series?
>
> This is repeatedly blocked on the request to factor out a generic Samsung=
 panel
> library.

OK so that's on me.

I don't want to hold back this important series over that, just go ahead
and rebase this on v7.3-rc1 and resend it and I will merge them.

Meanwhile, I shut up and code:
https://lore.kernel.org/dri-devel/20260903-drm-panels-sofef0-v1-0-9e841645b=
eba@kernel.org/

If you want to use these helpers, I can simply merge the patches because
there is an ACK. But it'd be great if you could take a look as well, sorry
for missing to add you on CC.

> And there have been many small comments left and right - including my own
> observations and self-review - that all need to get addressed.  Not a lot=
 of
> work, but they add up and it's easy enough to miss something which will m=
ake a
> reviewer "unhappy" ;)

Perfect is the enemy of good.

I often hold the stance that we should fix up minor nits in-tree rather
than at first merge.

Yours,
Linus Walleij
