Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795770975;
	b=vPxCOif4W0KeQ7mygxJdw6XUMnXPP5zucrHzYZ0MImNd4CEEw3yCwmfesUwDTKT0H3gf
	 dsK10P5SpjqjITjyccpJbjI0M5FgDnPRuuKA7xMHb+/LfoShX/lM79w9mRxvYeyA9t34Z
	 YKQ4D4EkgQdOmNOeq6W50oldy+d9A2CZxVUfnFSHxWRN482tdxeVozwwkMeOaq5N41InJ
	 JOL6yizCmS/cC3DQCD6kroaYDnPuQwiCdEuk7WURZGHKessFfu098uKtZjUXP6Ea0WOwE
	 NUpk+WU40yMJKAGJQvUigM01PgGkvwAsEqzFAfvhnxD9RgBNJ8R/0y3Vs4np6k1Vhjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jDYeL2kmjUbEkqOkiCW9A93olbaNlYCSbdBnZUJhtCA=;
	b=s+EY8WDaElxdXsHKV+9BZT9WlxHwgEROm+jzS9A6LltTPitPv8dsaoNqc2W4Hg4rtlKa
	 Uj+k91uDAP+A7yNp5anZ+W3I/ZMza5feTGwyiO0pWeBonr786OmgSCBtvF4ycEya0ygkq
	 oMSz0go6Nu+PTB9XZubCcHbEAWqIm8iUmGhF7llIv/gXJ4J4SOvhXb1wnPAozLzeCdOno
	 Hs1bzvTZ/c6R/tnO9MjoBSOC5hGvCCDioA4bo4fIcKMHmfI6QKNvgkdecZQKSoeMklIX0
	 2pWnvh/UmD8ig2vTg75EKcCKgxtCeBqu/y4v4TXTt59D+CGoRzVIO4HaGuUjvTFuzVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jESfojEM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0495C606A32E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0495C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jESfojEM
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-385d8a00598so11668040eec.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:16:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795770973; cv=none;
        d=google.com; s=arc-20260327;
        b=j4NOey2bHpCkIuDr4g9gnngA202RTIqWY+urac6Qe6n8fejhWTiC+lB3S8KYt6xLqS
         VbV0Cy1a0DykltjvK6r+Yy/TFrLf3tEN2pbyFrMpaOHOYmsyUl77FfZuOOa7O5Y/pzcz
         GU4v3wLGvxcR4ogbYwf1VisbCXbJd66mHxMglfsN4J7XJLecGg69bnt3Hz7zCcXdWUd2
         MVHCOs5kPNuhCU88O4DtYS4PGamLux3frokL5BUpwh/UJ7koK9rRBKCLfhixcfM6Dryu
         EgTwtGrjpvaSIv3JgaBLbv4Yzi/tGLBwhsMXDRM5wirJf5/Ft6BDbLmMHwNzcWSdevQb
         L+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jDYeL2kmjUbEkqOkiCW9A93olbaNlYCSbdBnZUJhtCA=;
        fh=IbH/BB4qfhYK/Vg6Wx91FXxKy4C9r0e68FYMGeMOrZs=;
        b=IJ5pQaLD2zE4WPVPIfLA+jy1wMink7JYt1qq6/QnAezAFK3Gv7n/JoJzykXYWAVLBT
         t6XNSGnb+9TcTw7fTeZrf6pSpIj+HVaFAwLW3P3WyhrozxzjuM6x/QH3OlGEZNBEDjNu
         O1sESv9ubjludhfunjk9VeFgcJOYE/mSKa7bLnWbAb/8YLVDxDla9P9lUI95ZmOfhpBO
         dMPpReQW05vyYtnQreSPxWJBcKkVodyP5fMezkVtye5oFbgi3ZrHAkCSGREkE6ACsnd1
         ODNgKc84586i07oOnN2leLtIB2my8eESoUr2iCTREozADMfENIpSSdQ/NUozHV5emmSZ
         WWGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770973; x=1796375773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jDYeL2kmjUbEkqOkiCW9A93olbaNlYCSbdBnZUJhtCA=;
        b=jESfojEM1vh73R4wVT9eTNLUEJhRw4r22MGydlhWedCIJk9uJS3oyb2aLr6tLipXeY
         Phbv4MN9QzyHztsTTiaYFRsFKnhpwpwgrpYBrvIN60hMu0m7bZEtwoAjJI7GGoIJU8SO
         eH5YaMTTEjolXjlnCrTJb8oHK2FyQ4apqkRXsUkaCIzQO4zYkXWacKQ3pDj71WvCYHWY
         w5t8NQdurO5Z6T7gj+tX1uPDUkv5mRDvU2Lc5h94Urz9xzubLd4oXpFhE+DDl22BTVZQ
         jbxzsKlKg8Y2fsCGqXk+J3kOBSgGuGer3wrkCFv6MjR1W5iaAe3d/4Du6Q/jOsdrPuLu
         uZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770973; x=1796375773;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDYeL2kmjUbEkqOkiCW9A93olbaNlYCSbdBnZUJhtCA=;
        b=ut86OjcAMYvI3hQSbwLYZNFkNtrH5ylfVzyTfehZ7VJPvoOhzyVvXnWodIXqfzS9jA
         CF5Pk86uoZv+d12nYSQ9GymX3WsyyOFfUSRSrtM8PToAZ3jBDD1dgnHwBLaYwrD8kUO5
         68tcYECGDuldTlDEfo2q8lcAMwz28ggJ5djJ/qLh4LV6ql3wiPknJQSzKFggRfEq9g5m
         1JkrVQms5x3gpcEQDatIFy2FaVXBzLpBylHPZpQPCugZgg+OBjfVW0Gxlbv/HlyOdpt2
         53CzhvSH239shxU/vzXd0G3Zl8C6CYhh4LJYDr3rtmtkVjyTIeUMssK9QKQt9JZB+ZO3
         bonQ==
X-Forwarded-Encrypted: i=1; AL+hErGYcCwPWM/JkyPOK+FPjBQM+wPn7mpLvRsjHedZD2aPmEbERSrJbb/CG1WeC994yCt25vleS/dp/s+T@vger.kernel.org
X-Gm-Message-State: APuU4Z+tcunXBB29twhHYH77/7yUy1YfLIhrDtrHHdo0sZSLasTQSl0a
	yhHa5OmpiSAlY+nRBCHEBwxaWLcd7LCIKxKZNEgO0qgl8Igs8ugPQu6BA2UQr4rRmyhIRuVI3PW
	7Gezq/ODoXbzKUE8vzCLKiLgWQgkf39I=
X-Gm-Gg: AZFdTZdWUkIzCxppcBKkxX+fnWQ6zaBy480SdIhanxq2+wKOcfWgzqEH/z27zI+nBdi
	pAiotU8EPmAEgPPLBy9aToW3Yyz0MHr4mecAlV9glhBPhsWX5L0HD9AfmyHRC1Z1cloWHbUhjgB
	Igo0DBjRVXKTb9URCjILmGT6l2ncwuRcdxgenYvTOWaUnbZwceFI24nrp+ouSOcNhoebYtOTg0k
	DZWkezcn8lWh/oOIDSD+U0hCZaTqe0HtEY2Ad2OEtqGgcGUR6i5i1p3aH7dBlUzc6B47ARRIsb9
	s8WEDRkhzaXwL1bjaj8ca9p+L7dCjbSBlEwFlaIpvt2Dpp2s8Hj8LarvQNK1bfPDRIy3dp6wXEq
	a3Pu6StpaNpgsZ5ty3mxLHpdRk+HU39+D2J2nlAwy7xfQXG8/FAfp8DGx+E8/qJAiUsGE2y6TN9
	blZs5bWMaLb1ROJ3Xicxm1eQYNhR7QiQ==
X-Received: by 2002:a05:7300:cf87:b0:386:565b:4f9b with SMTP id
 5a478bee46e88-386565b529dmr18908380eec.36.1795770973084; Fri, 27 Nov 2026
 01:16:13 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <20261122081820.53199-7-clamor95@gmail.com>
 <CQmBXmddTJ6v1iTnbDfQLA@nvidia.com>
In-Reply-To: <CQmBXmddTJ6v1iTnbDfQLA@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 11:16:01 +0200
X-Gm-Features: Aa3M54qH8gYf5As35TKTatFm5o7bkTT2Je6sUBOdI-CDd1BicPTc8yLdRQYINpY
Message-ID: <CAPVz0n14uUMdQYb+v_cKMiXRudND9fgKpqQWmGUO65BcCuciUA@mail.gmail.com>
Subject: Re: [PATCH v8 06/12] drm/tegra: dc: Add elements required by Tegra
 MIPI DBI
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 06:5=
6 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Add DC register definitions with additional fields in preparation for
> > adding the 8-bit CPU interface (MIPI DBI).
>
> Maybe also mention that some whitespace cleanup has been done.
>

sure

> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/dc.h | 194 ++++++++++++++++++++++++++++++++++---
> >  1 file changed, 183 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
> > index 0cb0515968b35..e8913c5530a2d 100644
> > --- a/drivers/gpu/drm/tegra/dc.h
> > +++ b/drivers/gpu/drm/tegra/dc.h
> > @@ -272,14 +272,150 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
> >  #define  DC_COM_CRC_CONTROL_WAIT (1 << 1)
> >  #define  DC_COM_CRC_CONTROL_ENABLE (1 << 0)
> >  #define DC_COM_CRC_CHECKSUM                  0x301
> > -#define DC_COM_PIN_OUTPUT_ENABLE(x) (0x302 + (x))
> > -#define DC_COM_PIN_OUTPUT_POLARITY(x) (0x306 + (x))
> > -#define LVS_OUTPUT_POLARITY_LOW (1 << 28)
> > -#define LHS_OUTPUT_POLARITY_LOW (1 << 30)
> > -#define DC_COM_PIN_OUTPUT_DATA(x) (0x30a + (x))
> > -#define DC_COM_PIN_INPUT_ENABLE(x) (0x30e + (x))
> > -#define DC_COM_PIN_INPUT_DATA(x) (0x312 + (x))
> > -#define DC_COM_PIN_OUTPUT_SELECT(x) (0x314 + (x))
> > +
> > +#define DC_COM_PIN_OUTPUT_ENABLE(x)          (0x302 + (x))
> > +#define DC_COM_PIN_OUTPUT_POLARITY(x)                (0x306 + (x))
> > +#define LVS_OUTPUT_POLARITY_LOW                      BIT(28)
> > +#define LHS_OUTPUT_POLARITY_LOW                      BIT(30)
> > +#define DC_COM_PIN_OUTPUT_DATA(x)            (0x30a + (x))
> > +/* Pin unmask is 1 bit above position of the pin in the OUTPUT_DATA re=
gister */
> > +#define PIN_UNMASK(x)                                BIT((x) + 1)
> > +#define DC_COM_PIN_INPUT_ENABLE(x)           (0x30e + (x))
> > +
> > +/*
> > + * The definitions below describe pin positions in the DC_COM_PIN_OUTP=
UT_ENABLE(x),
> > + * DC_COM_PIN_OUTPUT_POLARITY(x), DC_COM_PIN_OUTPUT_DATA(x), and
> > + * DC_COM_PIN_INPUT_ENABLE(x) registers. The comment before each group=
 indicates
> > + * the index of the register (the x value).
> > + */
> > +
> > +/* 0 */
> > +#define PIN_LD0                                      0
> > +#define PIN_LD1                                      2
> > +#define PIN_LD2                                      4
> > +#define PIN_LD3                                      6
> > +#define PIN_LD4                                      8
> > +#define PIN_LD5                                      10
> > +#define PIN_LD6                                      12
> > +#define PIN_LD7                                      14
> > +#define PIN_LD8                                      16
> > +#define PIN_LD9                                      18
> > +#define PIN_LD10                             20
> > +#define PIN_LD11                             22
> > +#define PIN_LD12                             24
> > +#define PIN_LD13                             26
> > +#define PIN_LD14                             28
> > +#define PIN_LD15                             30
> > +
> > +/* 1 */
> > +#define PIN_LD16                             0
> > +#define PIN_LD17                             2
> > +#define PIN_LPW0                             16
> > +#define PIN_LPW1                             18
> > +#define PIN_LPW2                             20
> > +#define PIN_LSC0                             24
> > +#define PIN_LSC1                             26
> > +#define PIN_LVS                                      28
> > +#define PIN_LHS                                      30
> > +
> > +/* 2 */
> > +#define PIN_LHP0                             0
> > +#define PIN_LHP1                             2
> > +#define PIN_LHP2                             4
> > +#define PIN_LVP0                             8
> > +#define PIN_LVP1                             10
> > +#define PIN_LM0                                      16
> > +#define PIN_LM1                                      18
> > +#define PIN_LDI                                      20
> > +#define PIN_LPP                                      22
> > +
> > +/* 3 */
> > +#define PIN_LSCK                             0
> > +#define PIN_LSDA                             2
> > +#define PIN_LCSN                             4
> > +#define PIN_LDC                                      6
> > +#define PIN_LSPI                             8
> > +#define PIN_LSDI                             10
> > +
> > +#define DC_COM_PIN_INPUT_DATA(x)             (0x312 + (x))
> > +
> > +/*
> > + * DC_COM_PIN_OUTPUT_SELECT(x) is a set of 7 registers that allow sele=
cting
> > + * one of 7 functions for each pin using 3 bits. Clearing all bits set=
s
> > + * the pin to its primary function, while setting them to 1 configures=
 it
> > + * as a GPIO output. Other functions are unique to each pin. For detai=
ls,
> > + * check "23.7.17 DC_COM_PIN_OUTPUT_SELECT0_0" in the Tegra30 TRM.
> > + */
> > +#define DC_COM_PIN_OUTPUT_SELECT(x)          (0x314 + (x))
> > +#define PIN_OUTPUT_SELECT_MASK(x)            (0x7 << (x))
> > +#define PIN_OUTPUT_SELECT_PRIM(x)            (0 << (x))
> > +#define PIN_OUTPUT_SELECT_OUT(x)             (1 << (x))
> > +#define PIN_OUTPUT_SELECT_F2(x)                      (2 << (x))
> > +#define PIN_OUTPUT_SELECT_F3(x)                      (3 << (x))
> > +#define PIN_OUTPUT_SELECT_F4(x)                      (4 << (x))
> > +#define PIN_OUTPUT_SELECT_F5(x)                      (5 << (x))
> > +#define PIN_OUTPUT_SELECT_F6(x)                      (6 << (x))
> > +#define PIN_OUTPUT_SELECT_F7(x)                      (7 << (x))
> > +
> > +/*
> > + * The definitions below describe pin offset in the DC_COM_PIN_OUTPUT_=
SELECT(x)
> > + * registers. The comment before each group indicates the index of the=
 register
> > + * (the x value).
> > + */
> > +
> > +/* 0 */
> > +#define PIN_OUTPUT_SELECT_LD0                        0
> > +#define PIN_OUTPUT_SELECT_LD1                        4
> > +#define PIN_OUTPUT_SELECT_LD2                        8
> > +#define PIN_OUTPUT_SELECT_LD3                        12
> > +#define PIN_OUTPUT_SELECT_LD4                        16
> > +#define PIN_OUTPUT_SELECT_LD5                        20
> > +#define PIN_OUTPUT_SELECT_LD6                        24
> > +#define PIN_OUTPUT_SELECT_LD7                        28
> > +
> > +/* 1 */
> > +#define PIN_OUTPUT_SELECT_LD8                        0
> > +#define PIN_OUTPUT_SELECT_LD9                        4
> > +#define PIN_OUTPUT_SELECT_LD10                       8
> > +#define PIN_OUTPUT_SELECT_LD11                       12
> > +#define PIN_OUTPUT_SELECT_LD12                       16
> > +#define PIN_OUTPUT_SELECT_LD13                       20
> > +#define PIN_OUTPUT_SELECT_LD14                       24
> > +#define PIN_OUTPUT_SELECT_LD15                       28
> > +
> > +/* 2 */
> > +#define PIN_OUTPUT_SELECT_LD16                       0
> > +#define PIN_OUTPUT_SELECT_LD17                       4
> > +
> > +/* 3 */
> > +#define PIN_OUTPUT_SELECT_LPW0                       0
> > +#define PIN_OUTPUT_SELECT_LPW1                       4
> > +#define PIN_OUTPUT_SELECT_LPW2                       8
> > +#define PIN_OUTPUT_SELECT_LSC0                       16
> > +#define PIN_OUTPUT_SELECT_LSC1                       20
> > +#define PIN_OUTPUT_SELECT_LVS                        24
> > +#define PIN_OUTPUT_SELECT_LHS                        28
> > +
> > +/* 4 */
> > +#define PIN_OUTPUT_SELECT_LHP0                       0
> > +#define PIN_OUTPUT_SELECT_LHP1                       4
> > +#define PIN_OUTPUT_SELECT_LHP2                       8
> > +#define PIN_OUTPUT_SELECT_LVP0                       16
> > +#define PIN_OUTPUT_SELECT_LVP1                       20
> > +
> > +/* 5 */
> > +#define PIN_OUTPUT_SELECT_LM0                        0
> > +#define PIN_OUTPUT_SELECT_LM1                        4
> > +#define PIN_OUTPUT_SELECT_LDI                        8
> > +#define PIN_OUTPUT_SELECT_LPP                        12
> > +
> > +/* 6 */
> > +#define PIN_OUTPUT_SELECT_LSCK                       0
> > +#define PIN_OUTPUT_SELECT_LSDA                       4
> > +#define PIN_OUTPUT_SELECT_LCSN                       8
> > +#define PIN_OUTPUT_SELECT_LDC                        12
> > +#define PIN_OUTPUT_SELECT_LSPI                       16
> > +#define PIN_OUTPUT_SELECT_LSDI                       20
>
> It becomes apparent here that the PIN_* and PIN_OUTPUT_SELECT_* are kind
> of redundant as the pins are in the same order, the stride (and thus
> register indexing) is just different. Hence, I think it would be cleaner
> to have ..
>
> #define PIN_LD0         0
> #define PIN_LD1         1
> ...
>
> and then
>
> #define PIN_REGISTER_INDEX(pin)         ((pin) / 16)
> #define PIN_SHIFT(pin)                  (((pin) % 16) * 2)
>
> #define PIN_SELECT_REGISTER_INDEX(pin)  ((pin) / 8)
> #define PIN_SELECT_SHIFT(pin)           (((pin) % 8) * 4)
>
> This will also simplify the tegra_dbi_idx tables since they can just
> store the pin index, and the register index (and shift) can be
> calculated based on that.
>

I will look into this. Thanks

> >
> >  #define DC_COM_PIN_MISC_CONTROL                      0x31b
> >  #define DC_COM_PIN_PM0_CONTROL                       0x31c
> > @@ -303,9 +439,15 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
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
> > @@ -456,6 +598,22 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
> >  #define DC_DISP_SHIFT_CLOCK_OPTIONS          0x431
> >  #define  SC1_H_QUALIFIER_NONE        (1 << 16)
> >  #define  SC0_H_QUALIFIER_NONE        (1 <<  0)
> > +#define  SC0_H_QUALIFIER(x)                  (((x) & 0x7) <<  0)
> > +#define  SC1_H_QUALIFIER(x)                  (((x) & 0x7) << 16)
> > +#define  SC_H_QUALIFIER_DISABLE                      0
> > +#define  SC_H_QUALIFIER_NONE                 1
> > +#define  SC_H_QUALIFIER_HACTIVE                      2
> > +#define  SC_H_QUALIFIER_EXT_HACTIVE          3
> > +#define  SC_H_QUALIFIER_HPULSE                       4
> > +#define  SC_H_QUALIFIER_EXT_HPULSE           5
> > +#define  SC0_V_QUALIFIER(x)                  (((x) & 0x7) <<  3)
> > +#define  SC1_V_QUALIFIER(x)                  (((x) & 0x7) <<  19)
> > +#define  SC_V_QUALIFIER_NONE                 0
> > +#define  SC_V_QUALIFIER_RSVD                 1
> > +#define  SC_V_QUALIFIER_VACTIVE                      2
> > +#define  SC_V_QUALIFIER_EXT_VACTIVE          3
> > +#define  SC_V_QUALIFIER_VPULSE                       4
> > +#define  SC_V_QUALIFIER_EXT_VPULSE           5
> >
> >  #define DC_DISP_DATA_ENABLE_OPTIONS          0x432
> >  #define DE_SELECT_ACTIVE_BLANK  (0 << 0)
> > @@ -493,6 +651,20 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
> >  #define DC_DISP_CURSOR_POSITION_NS           0x441
> >
> >  #define DC_DISP_INIT_SEQ_CONTROL             0x442
> > +#define SEND_INIT_SEQUENCE                   BIT(0)
> > +#define INIT_SEQUENCE_MODE_SPI                       BIT(1)
> > +#define INIT_SEQUENCE_MODE_PLCD                      0
> > +#define INIT_SEQ_DC_SIGNAL_SHIFT             4
> > +#define INIT_SEQ_DC_SIGNAL_MASK                      (0x7 << INIT_SEQ_=
DC_SIGNAL_SHIFT)
> > +#define NO_DC_SIGNAL                         0
> > +#define DC_SIGNAL_VSYNC                              1
> > +#define DC_SIGNAL_VPULSE0                    2
> > +#define DC_SIGNAL_VPULSE1                    3
> > +#define DC_SIGNAL_VPULSE2                    4
> > +#define DC_SIGNAL_VPULSE3                    5
> > +#define INIT_SEQ_DC_CONTROL_SHIFT            7
> > +#define FRAME_INIT_SEQ_CYCLES_SHIFT          8
> > +
> >  #define DC_DISP_SPI_INIT_SEQ_DATA_A          0x443
> >  #define DC_DISP_SPI_INIT_SEQ_DATA_B          0x444
> >  #define DC_DISP_SPI_INIT_SEQ_DATA_C          0x445
> > --
> > 2.53.0
> >
> >
>
>
>
>
