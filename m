Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5147C407593
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817241; cv=pass; b=EhImvNsgUpDCv9q5fF7jwyFPIpl/VZC0hoNK3PwNVUdzslNPPc4MafUmw9devMwYCWNklEHWLQsVZONYc2eVAp5m3ZZvivImd5hqhMOE6CVVSxyA6ITlLw5Zx+WoxlOFKDbfxY0BuvlVJGEiGhczEo5ktVv7Q/+TA46Ls+XksDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817241; c=relaxed/simple;
	bh=K+HL82sdn8WpJwBs+rWv0fMtNuA2tpi9GtQEa2+Vvik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjaGPtfH527N7c72VUD0NCUJAYu5R2EFJWw7OPj4APhAXHrBmzqfDUtavQCQqYA6ASSBrw198iXvdJAG1m9UOmDj6LhHbA43Q2dZle4SGcC0hY4qgTb6GQEAYtrVr80zj/Q/LU2qAR9JGiBj2M9snlgTORg82gF+A9K+4pXbvL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egJ1lzeo; arc=pass smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egJ1lzeo"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9617940274bso1502449241.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:40:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779817239; cv=none;
        d=google.com; s=arc-20240605;
        b=HhyGxQPTP41g3QzSnelEfNs0NUQH1Qm+msS7BWgqUvxx6mtWMsgkrs1JTklkgaFqPL
         L7BwS9u/uA9KY/9GjkeNpezzqBiaYBlxAcsn1dZio5X7KJC/PkjOEmqC8w/X5x2R9D+g
         /0hHAjboB9WUbZtWWAbEsn2YXJHsIw33QBM8e0ACOnBLlEUtcuVu/aPAMEUN/Rhua+6H
         oRUahwAoQusJHfuyJQaeKxVFXv//5lANQlji9e7JbjPJOHuPa+Z9Icu9mflsfcfyUr/v
         hpQw5f/epUBzry2NbiYEz+pAEyVS1km8YDlDl57g5eV9W18B0efEG7zWILAElsOaYiYF
         1w1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sB+mjSu/pqVnN5kPDqiN9QaioGX3lZ6RIksWWTXTj0o=;
        fh=2DD+KyTisSEP9+X4QhKLQtXDUlz7JEuynFK/G/FSe3s=;
        b=CXII8ndFIJwTPGhm3XBZQDGS7H2Jy8Vp8otI7oS2hi+wDeElvSEwV5spZMTVH04Kmb
         RLHmWaR6lFJjmWyEPs5ubKF2UWYPCQu3v+PtG7P1qgmI42jigGnQHcYe3lwc1Qi8kIl5
         SezvG72KqJZkwzC9OzNAnkpV8hQj8eszmG/OoqHaCyNNuPHOFddqkrGIyM5YhYFj1sp6
         T/vQPnX15IzadXk1luc6U6yi7nj9QUh8jKOWz7+lC9cTAZYV45oG+y5aJW8DOM+eh22v
         9aqTScBYxxj6JJ7mwtcEkBGrehslT6ju9Qwv8tyS0MsqNAhdN9amhP6gZbKGZGuUIEyC
         ShEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779817239; x=1780422039; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sB+mjSu/pqVnN5kPDqiN9QaioGX3lZ6RIksWWTXTj0o=;
        b=egJ1lzeoNWvx94uz2pPQUlvgZCVM8BuzuhO+mpRzrcyOsvtFCk6NF/wDV00pS0SkWU
         n9y7ZptvmqSC+43bkhqnMDwTEkyiuugVX6X4H5hYrHJ799WnMG4dC2tcRvl8eg3vCpa3
         7hjpJPmnjasmZGRPcWUy73RFT/Md66Hoitdn36PRc87hcsEstW9pKcFKG3h+aY0xdPb8
         FHP9vsflbF70+nsV6l6ekPof6kx3nuGYU+drdbicZWcs9a/+TSYtO18xrDg6EpnXEL7/
         liEdr1W8nmi29PgkvY9BPWb0XrSObXhHGtzanYgvZr6Z4N36a0139YzfunFqH1khi54C
         /90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779817239; x=1780422039;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sB+mjSu/pqVnN5kPDqiN9QaioGX3lZ6RIksWWTXTj0o=;
        b=o0TDcdSZQmLZ+tgj2bwcr5jcyDjtyoZNdilbYS+cnXkQXNY6GiZ9AfClYNxm8VmjVm
         MRBGl83B4vLAXUZjd1DrwdJS8q6A1jeNUBwgOTyxyPYWNj5VbYEVcumdRd0cAwbDbQtc
         rFJ4l6fE1zicVBihS+wWdBgxtsTa+UhnU7wPjKp2ACG06+9BXOcMm0kST+mi/aQ+U6zR
         RjKfEoBwP+FXjHT3K5A4D296ptp6MQC/lFrQl1KUqeZyWRoP4TYVPplMUHK7IlMLUKty
         xcmEiH5Ntg9aMs45EgIy+2q8LouVeelvecbQ41inH53MgBGfmxCsYa4bnoqq2/JrVzPZ
         2WgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9QYvXI2yDm3WpR9IHXNEYROhok+ZE8ER2DtvFjL7ikJf/pXxH137/LHZ25OgRYxyixxag9WhlEFCie@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9SRYbnPEl5+Upoqv06iqOpNN9OIN3Nngr/wEKZVeX0tySio/D
	LyUu2UIe/Q/iE4x1ee9edMIPmZmFAyESia/OqeNGZOputtBa+oqyyrAEC/n/W+mVYGip0Qx6slX
	Tsx7JgZNbbavRTkgS/ywFvTuRjQqkU6o=
X-Gm-Gg: Acq92OFN5MsIpSBBNd+lj4LPA0qp6IemJoLYs7MBP5D8yNdfTE6igAbT47udxwFPO/C
	QQrTUtCGuQXTweJmpI1ow9A3n6ApgbKC3hfN6SWvpCYPcrr+7XItpjrrbARIynikM6Luv6lXRPk
	VuzGYr5zn3VmEPcPshqcF4JXfyOBZ4SJPCzgw0ENn8XAblcNGc2vKztHsgMtrkdk2PKXKVHX340
	9s9AVBsZQFzmoHsA6zkWx+DiGJhDSyeQ8qZ48kkcfSbLyNdVm4HXMvrsrhVxSyULUTKMxuK4KhI
	p7fF3i8=
X-Received: by 2002:a05:6102:3f86:b0:602:8c16:b24c with SMTP id
 ada2fe7eead31-67c7c0765aemr9185857137.19.1779817239074; Tue, 26 May 2026
 10:40:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com>
 <177818605997.73000.9692910497119100760.b4-ty@kernel.org> <CAHuF_Zr0Z+rP72fLts5Ar56XyY8VMROzE0wQ_S5iyO+A4YoMSw@mail.gmail.com>
In-Reply-To: <CAHuF_Zr0Z+rP72fLts5Ar56XyY8VMROzE0wQ_S5iyO+A4YoMSw@mail.gmail.com>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Tue, 26 May 2026 20:40:27 +0300
X-Gm-Features: AVHnY4K0YHv_VhlqTQcjH1BYoi9vYxYTC8vhg9AZJCVfVLC71VCaUv3jbXuBfa8
Message-ID: <CAHuF_ZoirJ7PdLxQcY2NC-Gay6wv=m=eVZBDLFXrRYnszo8Wew@mail.gmail.com>
Subject: Re: (subset) [PATCH v4 0/3] Add support for the Samsung S6E8FCO DSI
 and M1906F9 display panel
To: Bjorn Andersson <andersson@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Kaustabh Chakraborty <kauschluss@disroot.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hello Bjorn, just a reminder about this, I don't want the wrong
compatible getting into a release

On Wed, 13 May 2026 at 15:09, Yedaya Katsman <yedaya.ka@gmail.com> wrote:
>
> On Thu, 7 May 2026 at 23:35, Bjorn Andersson <andersson@kernel.org> wrote:
> >
> >
> > On Sat, 14 Mar 2026 23:46:20 +0200, Yedaya Katsman wrote:
> > > This adds a driver to support the Samsung S6E8FCO DSI controller with the
> > > M1906F9 display panel found in Xiaomi Mi A3 (xiaomi-laurel). The driver is
> > > generated using linux-mdss-dsi-panel-driver-generator[0].
> > >
> > > The mdss reset dependency makes the screen work more reliably.
> > >
> > > [0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> > > Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add panel
> >       commit: 493cb869874cd301c370adf9a3f9577942c4f0f1
>
> Thanks for applying, but notice that this is an old version, the last
> version is v7:
> https://lore.kernel.org/all/20260320-panel-patches-v7-3-3eaefc4b3878@gmail.com/
> The compatible string was fixed in v5, and other patches in the series
> were applied with the new version.
>
> The difference is in the compatible, 's6e8fc0' with a zero instead of an O.
>
> > Best regards,
> > --
> > Bjorn Andersson <andersson@kernel.org>
