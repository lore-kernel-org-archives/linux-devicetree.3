Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FD24657C2
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 08:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758557; cv=pass; b=oq3uw30gdrLlfzKo3IYe75YKt2tJRVk2/Dca4l28T4Wpd1k1qW68/4h5Ztq2+0gojItsLd1XOWXvhbfRIiWYG9it+6iS3hFB65zVtxXAm8I/Z0ncsH2/A+0SEiCaC0LNmdMisJpIrYrH+61TM0tw+e2RGCAkVEJVQxiCv81n/FY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758557; c=relaxed/simple;
	bh=abErfC33CbNFbY3oc3pdHalPqdAnCa9dxRZNa7+VFeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y6BOH5p0M7zRy3j5aTck9Hym5MDzytwSybny5xmLii7BCvEqxMkX1gmStOiFbMAEVDqmCdD4AEc+7A5zw2GKtvIKBeI3N1cZN1MLbT11BuGvIomT5MORYpLyzazzZ4jt4aogIGrHvIkLpzPcsDNEjoXz+pMsMTiDaU2JweRmGsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJBA48UW; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJBA48UW"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bffc8105eso1140735eec.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 01:55:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790758554; cv=none;
        d=google.com; s=arc-20260327;
        b=qDylZfcnDzIq+00KsRmUe0um4lFahv/wQdrSIm1JG2+CWGzdrfaj+RFwf7jW1PZy29
         JoMsMGDCyYUkUwaDbWUeAAn2VfvtpCj4XeP1h4b40jE9sGeOJABj69uo/QLVQF76GBi+
         vy+xtPItZVup9IXh25upKvCUkb+h69l5YydHNmRQW3Y8svfsxmAfSQfrvF4xtFoQeLVI
         vntSjl9QEk9JWsvTIZg8vTQFIxLq6hNph79yiVXrlp8J00TuGxjEO2DL+0Jh+nf7XZHi
         M2ZJoCQTNYb444377h6uefRNMoHTqTaQYmWTuIthjIMmBYqk62c7pzIgMzmPmBm64BeS
         aRJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tK3QynNJMVX6fk91fIN3QptmwfowFv6iOT0xBS9VT+c=;
        fh=qZvy4CK8MohChyCLTCUQXIAjSmO1xCcbgeYV0rkl11c=;
        b=RzTFcDX33Oekncoqwxl1ESQ0lq5j2DUQydeXYLaTN8QNNIzSKtz8iM7jCkVZ5AeaNT
         q1rxp2pDqpCzsAl/1qnhZ7Gb1NH2g+2p4QK60wfu8Ups5rRepvzc9xoQRYnWqEV2a309
         tmcy5XSEiJbFBFNbSZ/GRxMBx/Ch3IhHiELhS6u8+7omJrS6IF5TcpGl+BNwmIP9pbNb
         Wfa2HZzGLfa9oh4sbhSr+0TmZBKe7L/qF7zZZOlntF7+0l5AgCF7ARJFLtH/ds+BavRs
         qGjliKNnGsr4xO5R1cyREF1rXNFwZ2PLmar4gYTmpyqSqsqqQXBsJoHiKgpRIiVmTmto
         SEhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790758554; x=1791363354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tK3QynNJMVX6fk91fIN3QptmwfowFv6iOT0xBS9VT+c=;
        b=KJBA48UWipxI48Q02C+mBfABDC5msOfOaSv8aX2fdI1HML8vVRGO61y1NxPD57HAHd
         HfSDziq0Tzzdnpr5Q7wM2lgbckJGdbnB/VQ050HFMN5mE8NKtHQaCbBIZUT30bfEzWev
         XQzeeNJa/hQnMjKtlIfvKt8u1mKWLLnvwBfZ2Z38MV406DE5rObDrEjv3j+P6Yb7Ge15
         YvuC0/XjeMzmC7HKIQZ5G8whr/AEd3EJcWcjvFIv5qQND08/NWWr7ZUObQGaNV7na0tG
         SDbqSGBiCjMKV70FUKvRqOiTdlavlF54TJdum4IAqkDO+98ubxSKPhsxI9d7CFpRfKib
         gotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758554; x=1791363354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tK3QynNJMVX6fk91fIN3QptmwfowFv6iOT0xBS9VT+c=;
        b=F3O8ag8dx2sc2TcBIYg3jRrMBu1hlWAojP6Sq0B0uwa58YFporhPlB0oOworrIFk4+
         nnxBluW/C+VPBXrwMzYMut2AkxlAyw6JUzRdiIA4yZYByjErviANKzzjr8vRuqlY6FiX
         LpPJSCxaCfOKfcr7IUjFQu5ID77L28oVzTioKAv2GdRfSukFM1KhqjpQz+uzZQ7o7uLW
         eF+sJmF+9JPj0eWicZDWSJ2hs1Mkx5+dlvYgNkaATgMgF/to1V0PE6Oe4iN83U4tN5nI
         ismHuajHO6Ghr2nXeAMcNi4uGozpXZypLsoPNFaifPqjGVufz5WRe1cluITjvSrtp35E
         iUnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWr9GleSAIHOdIo20cshgsahZoClGwtJHaJPwI9V6/dicjvC5rEKiZ5vkSi3mjfIdGW9B37B0ifVK4@vger.kernel.org
X-Gm-Message-State: AFq9FYK1qYy3RBt3bJYC20ONh/DMsRpsh2K+Ie9pnjMu7Sl6XIa4XW1m
	bw9xI4n7nRnNzAExQX3oxzRRQtAOA8meq/wTZA6ruyJD5UM9X++wWlGlB4/hFumJa2lr3XrkNez
	ykKUO1Rmlf6QB8YW/BRo2jyLatHoR+Lg=
X-Gm-Gg: AYBFou1eNwxTI5KCf+9D7zo/drSMY9kou65zgOh14YWCwDz1t+7Zb+eLvwaQ91+e9ZR
	hOAexhHYx4cO16LFv6jk5WDtIFFbHGDCTfM+jhF8+9R7uM/ZZIpnE5EYPwFRX0b94tWLCT8aY7F
	aDvM8XdsIES8a3TiTLnVcKTKBVHx9wCGDchgFiWy7zj7qKskoX2vMzFH3BbxqxTPYOYaM6sGpVf
	3X5/xD8dmJOOyQ60+w1ttK+WY0xdpOlRPdgOt0NY512Dp0uqswcpi7k4BvYHZcY7nvH175UKHSS
	aynb5UzB/8OT5rLsKj0AGmCewmSXJGXgQL27NOYfJYzEyOHI+0jHMsu/0ecNZ+FV59l+4sl5Vsw
	vvX9ydcNCSXkt
X-Received: by 2002:a05:693c:66cc:10b0:33c:e9d:6d4b with SMTP id
 5a478bee46e88-34ce1a002femr1132397eec.41.1790758554481; Wed, 30 Sep 2026
 01:55:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-2-clamor95@gmail.com>
 <arzI6PXbGAgXs9Uh@orome>
In-Reply-To: <arzI6PXbGAgXs9Uh@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 11:55:42 +0300
X-Gm-Features: AclHuK--O-LZ7t9iRpgmVS0LccEUwDL6n7PPlA0pa15dhw7HSbr4NELCXapQceg
Message-ID: <CAPVz0n3dOfmF6C5r0Z1t6ezzCoQEZh+V_oLGMFaUh1xHBMv+UA@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] drm/tegra: dc: Expand available registers layouts
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 11:35 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 10:05:30AM +0300, Svyatoslav Ryhel wrote:
> > Expand existing DC register definitions with additional fields in
> > preparation for adding the 8-bit CPU interface.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/dc.c |  3 ++-
> >  drivers/gpu/drm/tegra/dc.h | 54 ++++++++++++++++++++++++++++++++++----
> >  2 files changed, 51 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index b0bfa946e6979..5c67928bcabfa 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -2384,7 +2384,8 @@ static void tegra_crtc_atomic_enable(struct drm_c=
rtc *crtc,
> >
> >       if (dc->rgb) {
> >               /* XXX: parameterize? */
> > -             value =3D SC0_H_QUALIFIER_NONE | SC1_H_QUALIFIER_NONE;
> > +             value =3D SC0_H_QUALIFIER(SC_H_QUALIFIER_NONE) |
> > +                     SC1_H_QUALIFIER(SC_H_QUALIFIER_NONE);
> >               tegra_dc_writel(dc, value, DC_DISP_SHIFT_CLOCK_OPTIONS);
> >       }
> >
> > diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
> > index 0cb0515968b35..5679e1ca0c2a5 100644
> > --- a/drivers/gpu/drm/tegra/dc.h
> > +++ b/drivers/gpu/drm/tegra/dc.h
> > @@ -274,8 +274,11 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
> >  #define DC_COM_CRC_CHECKSUM                  0x301
> >  #define DC_COM_PIN_OUTPUT_ENABLE(x) (0x302 + (x))
> >  #define DC_COM_PIN_OUTPUT_POLARITY(x) (0x306 + (x))
> > +#define LSC0_OUTPUT_POLARITY_LOW BIT(24)
> >  #define LVS_OUTPUT_POLARITY_LOW (1 << 28)
> >  #define LHS_OUTPUT_POLARITY_LOW (1 << 30)
> > +#define LSPI_OUTPUT_POLARITY_LOW BIT(8)
> > +#define LDC_OUTPUT_SELECT_V_PULSE1 BIT(14)
> >  #define DC_COM_PIN_OUTPUT_DATA(x) (0x30a + (x))
> >  #define DC_COM_PIN_INPUT_ENABLE(x) (0x30e + (x))
> >  #define DC_COM_PIN_INPUT_DATA(x) (0x312 + (x))
> > @@ -303,9 +306,15 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
> >  #define  UNDERFLOW_REPORT_ENABLE (1 << 0)
> >
> >  #define DC_DISP_DISP_SIGNAL_OPTIONS0         0x400
> > -#define H_PULSE0_ENABLE (1 <<  8)
> > -#define H_PULSE1_ENABLE (1 << 10)
> > -#define H_PULSE2_ENABLE (1 << 12)
> > +#define H_PULSE0_ENABLE                              BIT(8)
> > +#define H_PULSE1_ENABLE                              BIT(10)
> > +#define H_PULSE2_ENABLE                              BIT(12)
> > +#define V_PULSE0_ENABLE                              BIT(16)
> > +#define V_PULSE1_ENABLE                              BIT(18)
> > +#define V_PULSE2_ENABLE                              BIT(19)
> > +#define V_PULSE3_ENABLE                              BIT(20)
> > +#define M0_ENABLE                            BIT(24)
> > +#define M1_ENABLE                            BIT(26)
> >
> >  #define DC_DISP_DISP_SIGNAL_OPTIONS1         0x401
> >
> > @@ -451,11 +460,30 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
> >  #define BASE_COLOR_SIZE_888    (  8 << 0)
> >  #define BASE_COLOR_SIZE_101010 ( 10 << 0)
> >  #define BASE_COLOR_SIZE_121212 ( 12 << 0)
> > +#define DISP_COLOR_SWAP_BGR  BIT(16)
> >  #define CMU_ENABLE_ENABLE      (1 << 20)
> >
> >  #define DC_DISP_SHIFT_CLOCK_OPTIONS          0x431
> > -#define  SC1_H_QUALIFIER_NONE        (1 << 16)
> > -#define  SC0_H_QUALIFIER_NONE        (1 <<  0)
> > +#define SC0_H_QUALIFIER(x)                   (((x) & 0x7) <<  0)
> > +#define SC1_H_QUALIFIER(x)                   (((x) & 0x7) << 16)
> > +enum {
> > +     SC_H_QUALIFIER_DISABLE,
> > +     SC_H_QUALIFIER_NONE,
> > +     SC_H_QUALIFIER_HACTIVE,
> > +     SC_H_QUALIFIER_EXT_HACTIVE,
> > +     SC_H_QUALIFIER_HPULSE,
> > +     SC_H_QUALIFIER_EXT_HPULSE,
> > +};
>
> Let's stick with regular defines for this, there's really no advantage
> in using enums for this and the other enums introduced by this patch.
>

Alright, noted. Thanks.

> Thierry
