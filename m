Received: from mail-ej2-f0.google.com (mail-ej2-f0.google.com [74.125.228.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C473A4CA297
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 20:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784146787; cv=pass; b=ZXHmUVPPXAzuA9Gllx2R3eoM11E2r+t5Q0pvsFtD4vE8GvTX1x1P2fHuEQIxuuaBPRaZFsVuuezdPM8GIAeXR9/hURLujJsU3tfduiUrmERp9RfK+C1FEb1Uhqa7bSbxYTNMqQazdi5pcPZrH7zsZfFP4eiGf5Z1uuWdodjXdDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784146787; c=relaxed/simple;
	bh=Q5ccYVWvR+5jgS+UYin62kxL9TLl/TrtAkaA8NvL9HI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOHRBhr6xWoxpwaA5mfeFOaxBWlqTB3NLCiVZVQ7oG9wSS6/UF8JzNEl1yB5gp7u5qaY75QLzklUH0svLPAI0IppUFBs+repaxPGpVGvGE2V1WVBSRFrAlrSUXdWeIY0JUolMv/x4YYUAwSfSWoLZDOuLPRFB6UO11MJr88NMmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWI9kHzr; arc=pass smtp.client-ip=74.125.228.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWI9kHzr"
Received: by mail-ej2-f0.google.com with SMTP id a640c23a62f3a-c15e57b7128so369910066b.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784146784; cv=none;
        d=google.com; s=arc-20260327;
        b=ksRRCZi1w2U0BTWWikkxQo+LksNn9eXtkWUh1HN07yMtqn7ZJHQAs0eKNS94jHQUUF
         gnlSSxgFXuuQ3afph7gX1SdKp7aNPfa3EensYutqHoMtZbwbBCWPY1fWSW3R94/TPk5K
         sjPiD+qo2j5wIIIOfnfOSWyboS68tgWMlcvM+Fq185K8+W4maY7cC6f44nTx0sfh7L3h
         aD8WA1df6F+EVfZRXJOkwd5pJXWXMTO6e6RdHshQa+PPB9pvw/Yv2CIvdnW8Wr62pDQy
         B84pGS7cwCHeeTOihhnl30ANm6dTJ2B0CCoSada+FCUgPLazw3wXLPeLI+0wlvNsIh5k
         FjLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nubd27NNIvTV4B3FNhrgAkY1uJlNnIcqTLmtlT2/89o=;
        fh=kBCixsxyFohOzVmkbn6hnHWjOCq6kI4ekOBjFJ31IXo=;
        b=PEN6INpc8Vn+GF1/LqzRFQUYNS0z8NOvpRSbWPMX0i9EEB4CBkm8hfC21MDqOL0FRW
         qTcHESlL+il5J2cU66Tff0XYsPc8ua3RKFE4hv0jgEaDQCZ8J32mDt8L35uC9i7heow6
         VUo7uuU94QLK/3J8o5RnHrBbBj7o/68BP2liQJEs6U4Lh4KER9/pnW76FEL0Z9cdfKoc
         o+eP8w+A7eLhFguiilJUoDSuLO3t6ucJ2JU2pkEOhShhJMswb/JakwmrgJ+eb7mT4czV
         MGhEFqb1NhTgqqDgSua649kQC7iGbWuckCLD2m7ZyW5jniqciBSsjlUbqtTGkratwGI4
         WkwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784146784; x=1784751584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nubd27NNIvTV4B3FNhrgAkY1uJlNnIcqTLmtlT2/89o=;
        b=kWI9kHzrM/6ARXj/3umIu8wW0uJ0GeF19DS13y5Pho9Khg1YFY0Wxm4wlJLJq+K6WY
         r9aBkLpooge0Wd5ymHUAQGaJNxdi/p/Zxs3YwQIKtZA0lhCIXEuEjZUmZ8uMsr2AGkqh
         jjxaKHSUy0CypKtfvrQGsSBgrnJYfOmunif4DVtu3TNpcN+uMtdAaujYx554ta/pjf73
         dM2YJHghbRwLmt/OSsMiXVhXMR281/orUEQG0OniklOgBn8+wJg6ngf947ccqNJq/awR
         ZglKex3NwHOo7BAPDUwKR4W/AdfILIzSnKesjaYJ10dMgta8jhfdRi3aojhRohLLZbdI
         jZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784146784; x=1784751584;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nubd27NNIvTV4B3FNhrgAkY1uJlNnIcqTLmtlT2/89o=;
        b=Dr+0HDOUCGieIZt5qC7swnt5y1LAyohn5bwgLLhbgvdQDzmN7ma5aCk7EsOGshUkjC
         6Kexji5TW4CsuKZQJ/oRcvZCHTqmM+dXXhYKN/CdMlO0ZnYfOUuCSVgK6iGrCww67Qb9
         ot6hRVhqsDVLMf81bUeZXKwmVlRdk4CxgdCkLILOJczjZ2KhRA2h6Uo7OKkpjd/WIxiO
         4LgC4yvuomTBgbtT6rkPWpzPRTIXLZn4Cq18BeIDoj3cYrpWUlGf66ygM/auCUF06QwH
         Nt8qrc7k9kyswiFR0PVmyKvpyVEgp53TzBmMQkY9KSmNyQYybSdWt/jlj49xCVgW4yu9
         E1yg==
X-Forwarded-Encrypted: i=1; AHgh+RrstEmKu6PPOBw8TvUe5g4LIuQl7DYIS9/9T3duIrLyFkxZxheSzvTuszkPkAJjRX9t/Cq/5JzhSDle@vger.kernel.org
X-Gm-Message-State: AOJu0YzHLi9VQJwvAzmQXmhtBo3H/v5ULk0beLnxt6XYpk10J9cJy4Bx
	7LOhIRlQBFqYesdBnFsJzX+X9MCvIx5LtvrLv1J/6OtDVvAeur43qmuHjQPc0YBGWGvjLhSomWF
	dS52CG2s46fhCDS9tBsTiyMv9vDPD/ck=
X-Gm-Gg: AfdE7ckcXY7SVNJRre2OSSE0IM+rU2ftgCwNIKgV+0a/mGnBhG8OnapMKvS3uB+iyc8
	vMiCMuND8glWgjpXCJ/ntdQiYV8irIjXNPVmVXn2rfgt8ffpj65/VtdeX7BwuVs3go5mLbfCUQc
	KXcxYNb2GIb6JUyoaJ45qK+uYd8FzLDImjxyPqavDB/9Gac3w+GiNh6m4x+5KjXe0O/gR7TC6E1
	toaSLZh/rQYNc1ybVuzbBtc1WetckH3sr/uS3ZFIwtZXXhQAK8Y5uw+ZLplb08on+JEQRzcsuU=
X-Received: by 2002:a17:907:9484:b0:c16:1227:e3d8 with SMTP id
 a640c23a62f3a-c16790fa355mr278084266b.13.1784146783933; Wed, 15 Jul 2026
 13:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-7-coiaprant@gmail.com>
 <20260715191453.DEE731F000E9@smtp.kernel.org>
In-Reply-To: <20260715191453.DEE731F000E9@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 16 Jul 2026 04:19:32 +0800
X-Gm-Features: AUfX_my5g85fDayigq-hMxxzbVtYHNZXP8Ax7QFobz0v3NSrNqtAVYC0ELzRnTI
Message-ID: <CALj3r0ge83r9kmcDbnhvsEyD983Q7_oNcFTrd2iSFdvOsHTFdQ@mail.gmail.com>
Subject: Re: [RFC PATCH 06/10] net: pcs: xpcs: improve SGMII AN state handling
 for Rockchip RK3568
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, 
	robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review.

> [ ... ]
>
> > @@ -884,7 +889,7 @@ static int xpcs_config_aneg_c37_1000basex(struct dw=
_xpcs *xpcs,
> >
> >       if (neg_mode =3D=3D PHYLINK_PCS_NEG_INBAND_ENABLED) {
> >               ret =3D xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
> > -                              mdio_ctrl | BMCR_ANENABLE);
> > +                              mdio_ctrl | BMCR_ANENABLE | BMCR_ANRESTA=
RT);
>
> [Severity: Medium]
> The commit message mentions improving SGMII AN state handling, but this
> adds BMCR_ANRESTART to the 1000BASE-X configuration path in
> xpcs_config_aneg_c37_1000basex(). Was this unintentional, or should the
> commit message be updated to mention this behavior change for 1000BASE-X?

You are correct. This was unintentional. The `BMCR_ANRESTART` change in
`xpcs_config_aneg_c37_1000basex()` is a mistake that was introduced
during development and should not be there. I will remove it in v2.

The SGMII path (`xpcs_config_aneg_c37_sgmii()`) is the one that actually
needs this change, and that is what I have tested on the Photonicat board.
The 1000BASE-X path was not tested and the change was not intended.

> [ ... ]
>
> > @@ -1086,7 +1094,24 @@ static int xpcs_get_state_c37_sgmii(struct dw_xp=
cs *xpcs,
> >                       state->duplex =3D DUPLEX_FULL;
> >               else
> >                       state->duplex =3D DUPLEX_HALF;
> > -     } else if (ret =3D=3D DW_VR_MII_AN_STS_C37_ANCMPLT_INTR) {
> > +
> > +             return 0;
> > +     }
> > +
> > +     /* Clear AN complete status or interrupt */
> > +     if (state->an_complete)
> > +             xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0=
);
>
> [Severity: High]
> Can clearing the interrupt here lead to a permanently stalled link on
> Wangxun platforms if the subsequent xpcs_read() fails?
>
> The original code cleared DW_VR_MII_AN_INTR_STS at the very end of the
> DW_VR_MII_AN_STS_C37_ANCMPLT_INTR block, after successfully reading
> MII_BMCR and MII_ADVERTISE.
>
> By moving the interrupt clear here:
>
>     if (state->an_complete)
>         xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
>
> If a transient MDIO error occurs during the subsequent MII_BMCR read:
>
>     speed =3D xpcs_read(xpcs, MDIO_MMD_VEND2, MII_BMCR);
>     if (speed < 0)
>         return speed;
>
> The function will exit with an error and the link will remain down, but t=
he
> AN complete status has already been cleared. Will this prevent the Wangxu=
n
> initialization block from running on the next poll and leave the link
> stuck?

No, this is safe. The `ret` value used to determine whether to enter the
Wangxun-specific path is read from the register before the clear operation.
The clear only affects the hardware register, not the stack variable. So
Wangxun's `if (ret =3D=3D DW_VR_MII_AN_STS_C37_ANCMPLT_INTR)` block will st=
ill
be reached correctly.

If the subsequent MDIO read fails, the function will return the error and
the link state will remain down. Since the hardware interrupt status has
already been cleared, the next poll will not see `state->an_complete` set
again, so the Wangxun block will not be entered until a new AN event
occurs. This is actually the intended behavior =E2=80=94 the interrupt is o=
nly
valid for the current AN event and should not be processed more than once.

Therefore, the change does not introduce a regression on Wangxun platforms.

I will remove the 1000BASE-X change in v2 and keep only the SGMII-related
fixes.
