Received: from out28-103.mail.aliyun.com (out28-103.mail.aliyun.com [115.124.28.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA51E3A256B
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778672154; cv=none; b=PezLdU06MSDQTzKjXdNPudtDu99lPWbxvsiyZURjcppxU2G3DrklVLa73Q+Xn6TCmI02IuM6HeaHi0aTwIDftoWZQHWnaya+dc+ayKGwghhaqt92bBBztLoYVC8/81eCUPN0MfrPmcEMbK4oA8L0IbIKU66xYVWb6+w1TW4utfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778672154; c=relaxed/simple;
	bh=cczrszFC/OLzgBHMxCR7oORa1mmu2y63YgK6AEIPU7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvpTKEeyCEEOZ1H6UM8d7nXYAnJmdTSN0wOXS1nqE1GA8qhNuNafcDrZYi44uJxsDCAptDaMPG0VrPiy9P3e3VLZH2KHINM180uVc/Xuwi1iZKP8rB4woHa9vzkoRgMlwmLG7V9QncBOBS9OUHtXkfl4Zf4YBy1DysB64UbA73g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=oyutkwyW; arc=none smtp.client-ip=115.124.28.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="oyutkwyW"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1778672144; h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
	bh=M8zeVEfjBDW34iL0F6fTCPJeNaBBq8G+h0BQnTdBWZk=;
	b=oyutkwyWnU6kcPdF4IS4j1TTOGsWAzF1Ns/ETcPeTh9sVXwhYM5v0twZ8qgFuY9iIWjF2ZYJCEDfkHiDM0+p/fblz6vOT4OEr/ZYhMCPPDEmSdRSli7tBtOZZOXuXfjYpg7ADdDhIuDSssbvQeiBETiLT5HpGnv+gZIikAMTXpGeUi8roA65zbSs2wFD1Aexv8DNn3vW5LUMaiQc0KAaf39S0s84C6N6Sq345afKyGL9V+6P8/uD2my9GThn4x2CYaqYW2YBhpjHneLttqBHHpcJrtb4oRGuow7siycKawBFLsvwkaI5zg1OWu8jSf287TqMFVKXYEFBtGWPZOqI1g==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.08028814|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_regular_dialog|0.0345328-0.00169345-0.963774;FP=7875452850044925897|13|1|10|0|-1|-1|-1;HT=maildocker-contentspam033032023038;MF=syyang@lontium.com;NM=1;PH=DS;RN=1;RT=1;SR=0;TI=SMTPD_---.hWKpeO._1778672142;
Received: from mail-ot1-f43.google.com(mailfrom:syyang@lontium.com fp:SMTPD_---.hWKpeO._1778672142 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 13 May 2026 19:35:42 +0800
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7dcd89701acso6281612a34.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:35:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+3Sv9YVHE/TIbGy9yajBFuDjT5rbIhI+Ci+lX74bOsfQ8n89Dp2Vd+jocwOB/8o2rfPgK4w05uZj8v@vger.kernel.org
X-Gm-Message-State: AOJu0YyInF1JPZJdEPq3jdnfpsXcWJkWsQ3i4VaAYlUHDwz3ePBGlseV
	mmV75D9XZOQMYhWgL4icUFHBmKZraDXK5fkd7uJ39GQ9TrIYQvnHxUq3mjFmFYunwrjYjiU8mFs
	M11Y0hPxQfnfZJPRcvCJd9Wm50JFEW3I=
X-Received: by 2002:a05:6820:1606:b0:69b:3a3c:1e4c with SMTP id
 006d021491bc7-69b7ab67b96mr1189462eaf.50.1778672140987; Wed, 13 May 2026
 04:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508142500.4922-1-syyang@lontium.com> <CAFQXuNYq5QYAXRzcUBnyvVh5ofPBVYONCs1dM6qPgK0BDja5Ow@mail.gmail.com>
 <vly3gbft3k76mrcztcn6vxuqadz647hsaz2q7qpmpofowofodb@nnxrr2cdueru>
 <CAFQXuNZKoahwq0zoWg860Z-amTKEefBFuen2fDG1htKjzE7ymw@mail.gmail.com>
 <0636aa3c-5240-44a7-a551-4740956ba5cd@oss.qualcomm.com> <CAFQXuNb8w-+xEYeDSxaqK-2hxdu5ADo_Vtvy4iVBzSgNzRmSuw@mail.gmail.com>
 <b951a99a-bddf-4fe7-8ed0-4861d93aaf4e@oss.qualcomm.com>
In-Reply-To: <b951a99a-bddf-4fe7-8ed0-4861d93aaf4e@oss.qualcomm.com>
From: Sunyun Yang <syyang@lontium.com>
Date: Wed, 13 May 2026 19:35:28 +0800
X-Gmail-Original-Message-ID: <CAFQXuNYwdbqTzEop0WtVyCEnKaOWLV72yCBHtN3H+jcXnV8U0A@mail.gmail.com>
X-Gm-Features: AVHnY4LfMuOH_31yB6a3LxhFungtv4P-uelzOpALQfnP9pmpiZSY5RfdsqScGcA
Message-ID: <CAFQXuNYwdbqTzEop0WtVyCEnKaOWLV72yCBHtN3H+jcXnV8U0A@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	maarten.lankhorst@linux.intel.com, rfoss@kernel.org, mripard@kernel.org, 
	Laurent.pinchart@ideasonboard.com, tzimmermann@suse.de, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com, rlyu@lontium.com, 
	xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
5=E6=9C=8813=E6=97=A5=E5=91=A8=E4=B8=89 19:23=E5=86=99=E9=81=93=EF=BC=9A
>
> On 13/05/2026 14:22, Sunyun Yang wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B45=E6=9C=8813=E6=97=A5=E5=91=A8=E4=B8=89 19:10=E5=86=99=E9=81=93=EF=BC=
=9A
> >>
> >> On 13/05/2026 14:07, Sunyun Yang wrote:
> >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B45=E6=9C=8813=E6=97=A5=E5=91=A8=E4=B8=89 18:24=E5=86=99=E9=81=93=EF=BC=
=9A
> >>>>
> >>>> On Mon, May 11, 2026 at 11:28:06AM +0800, Sunyun Yang wrote:
> >>>>> <syyang@lontium.com> =E4=BA=8E2026=E5=B9=B45=E6=9C=888=E6=97=A5=E5=
=91=A8=E4=BA=94 22:25=E5=86=99=E9=81=93=EF=BC=9A
> >>>>>>
> >>>>>> From: Sunyun Yang <syyang@lontium.com>
> >>>>>
> >>>>> Gentle ping.
> >>>>> Thanks.
> >>>>
> >>>> You've posted the bindings on May 8th. Please give maintainers some =
time
> >>>> to react. Not to mention that you posting the bindings 4 times in a =
row
> >>>> (once together with the driver and other 3 times separately) doesn't
> >>>> help maintainers.
> >>>>
> >>> Sorry, when I submitted the patch on May 8th, I received bounce
> >>> notifications from devicetree@vger.kernel.org and conor+dt@kernel.org=
,
> >>> which is why I sent the patch again.
> >>
> >> And some patch trackers will now have incomplete series, others will
> >> have duplicate entries, etc.
> >>
> >> In future please use `b4 --resend` to resend the whole series at once.
> >>
> >
> > Isn't it recommended not to use 'git send-email' ?
>
> The 'b4' tool is generally recommended over raw usage of 'git
> send-email'. It saves you from some of the troubles and catches several
> typical errors.
>
thanks.

Please ignore patch v6. Due to some issues with the driver, i will
send patch v7.
(Sashiko AI:   When built into the kernel, probe executes before the
root filesystem is
mounted, which would cause this to fail with -ENOENT. Because the error
is propagated without returning -EPROBE_DEFER, the subsystem might not
retry the probe later.)

Please let the maintainers handle patch v7.

> --
> With best wishes
> Dmitry
