Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70AE3783B5
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 01:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785979721; cv=pass; b=lefhgNikqJ33S4YXM/G36atfgOjK0UD6IvMxBqBdTklnzb4G8swtuQOH33YH86xeHxo1iZDPlkAQwGKNh7ll7cO7I5xb3r6CZhPXYnKxZycImLsf6GoMEwklGWt7oZVFb6RiihQEMQooRPeOl+lWf25IqCmNxJGrxpyiOtcf11c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785979721; c=relaxed/simple;
	bh=yo8evkMojxMVckjP1gDBAO39OsFlfMPJ9XhfjhA5mDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mLrGf1LVJ8iJ+i+zrPJ26RO0g5CT/N0TDiZLoF+VNnBrCqWl0IHSqH8UoONz9Tu9Jw/Jh7vHM/NAERkr0YdVm8YlRah8UcXIVsljnGZPzxCpRibAsiiOWbBzVbDRePAVDgW3cAOnXWmbnvrQqO8o9U3x1EREbAA7RIUyAP98EHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6w6y0P4; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6w6y0P4"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97727c2064fso1110916241.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 18:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785979719; cv=none;
        d=google.com; s=arc-20260327;
        b=C0FMcSiVxMa/Cbv+SUvddRZKDk7Ot6Kz5sjIl1sMied4Yc2PdW43IY9wsUiErndp+d
         A2wSGFGyXYRddmkySgY//VQuwvyzmJsI8rtw0LEKP18f9wmdkdaE00QEtgtNQTTfv/Nv
         5IgiyNfjYlLmwa4m7538EOSBWVtWn5gvehLsS0+q8Jo6dNGmwGf1VKEOkqWKjbhlLBYf
         7Nt+2IP8t8swlSdYgpj3r5t4Kp9uLuHm69I8zzyd7rN0m04ybTu99FXAVm/4kzqL6miE
         GkV4a5OPdgKrMf0QAfzFfgeTd0nVJ9+GTyTyRMHFmjxzZwHr/T14ta9lHHtbCoDJQYUF
         Csng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=edLN34k9foZMVhZcUUtF6FHiGZ8AVNOJWI7MIXQI8QA=;
        fh=S4YjKxp1QqmWHGWb2CkcM7+hmpU8gZy7PNqzFnthSOk=;
        b=NHNNs6WjI6wzyg/MJNowpPYv54HzndKgM+FZDPx72TG8jPSgkn8+ALvh7Io7H5dGyC
         40TfRj9s9B8aW2v3UePH2EObBIOFYEKF8xbd0v/xxKwf6Q8na3WKVPursirFeojv+bLA
         +FqAaV4RlXyP3bf4dFXDjUfPayrmfQn80AXR1XPFT2Jadstj3ItlyBF1PITZHmlNg8Mx
         dqz1Xco6s0k/FGYTHIuTIGd9LEb6l1A5PKdo4PM1wzHHf7ZAqW4M6HA+JzT5GZoiTHrV
         kGNu4l5pVo4Ee2RF87MImtu2/B63ykPhtcLE0olDT5s5iROU72MlR+x8jKfcWbwRBomi
         L0cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785979719; x=1786584519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=edLN34k9foZMVhZcUUtF6FHiGZ8AVNOJWI7MIXQI8QA=;
        b=V6w6y0P4hhlnODGlqL1PZdS7WJRrft3CAqqNpW+ygV1nUltbuMwjweEjzSmHw7hzFT
         CzbKiaO0J9jQ+cJt54buCxPooaNoF05oGA5/cXkOz45+dM4qm4aLqp7kluBMMEoqnvU8
         k2H48FkP6ogjHn5mBrpFNU4b4KxwWeE7vbuvU9yVMPlrqoIByOceCz9e5ZDk3T+nA+/O
         5v3M6z+oyFo9wRgxFra0qYi6d3ZY8b75YO1ap9I9vyzzBES8PpPsPx6xSgm52CdmMMRp
         R6wCmwKMNXxhSnI8DJSOMw+sOu6EF0Xxt7q9g7EIpas8B+ouBBFFtbDNYh79PCPqHes5
         wcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785979719; x=1786584519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=edLN34k9foZMVhZcUUtF6FHiGZ8AVNOJWI7MIXQI8QA=;
        b=OpdVfi8vaLWnbdSAbLEE+x+8xOQl7S/JpC2l2qk8Jun5N/K5gMDnLwq0hZc1LQAOqs
         sjEWPN7jDFJ+kTDuWUyMbDeAbJ7sGczeIpXA6A2GW8I9EGjq1n7SRpVhWVkNgyaKRVHj
         tZXi84ceBCIG93tBnq0ZhRuw30x/d02ADhc40tSEkB9itrBTnU1txZlw8M8Q8MeXdQYO
         /ZedIXKs6nMQx3PgR2cg2eQFqfRbJEQkByRgs/2Dpx2SEsRheBr5+MCnY3HBzSYRnoeH
         5DAgYY8XA0TBpGGgO7tYKhF+v7hZQLWr5EKNw+9dHp+MmJIa3gvxoivD/rU6WlgjEx04
         Ii2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqK/UH21/Q+dLd9alw2vhH665VYKIG8inAlbHQChcJCoy3+X0Abbj2D87aYCvbepBr8RWHCl5SFCTqX@vger.kernel.org
X-Gm-Message-State: AOJu0YxALi9hmlAC55W8CJB7GI1FVlTLPonVWc96zk96VIX8ltgsx5g3
	D+Ou8TbSMlUk/nD4OkxL5U7/W9I/eVbU+8dP6pJ+Db4IcP01qvdFk6phq6Tx7opN5P1Q7EepCvs
	EhVIJmHjgfxx2tJdl+5QKtgnpOsGtlqk=
X-Gm-Gg: AR+sD12B3Ea3s6yt53L4InD7BcZ8rjuuzyQTEeO02lFWUpfdpCDFC5lAaYYLZvMAwUZ
	89RWwynykvrqRrHTYVu29kNLtsmt3+OyHo5Lceyce7cmTe2eVJ4U90A/F8V8uTb8v9wrKVKL+Oi
	VCqAaeIRZYX38GPpx6yj8A+EvhHkTO5LLjq6kqOVhXaDiHbteOy7XpK0vu57ygjzfjxLhnwdqUh
	8CCDrTqt/Ehe96oLN1/CTDEoLuTjMHOZ/dhPMK9I9D+wuFR1c94Dagw+yi/INpgW/1N+SJ0ABft
	ooS2vatUQXT20YhrA2X+db+cOQdhcyQPbRc0vQjGFgF/UArXZGEsk/toMNqS8HOPWWeOJPxgQhB
	2xIXiJJcuj7XClQJWq/fEwnWtxmXtj8LaLrTs33xa5I1ua6r89a2fEHOuxs/O0Fmq/nYKH6pjwG
	Om/6uWNoUZ6YAtyU9V+Eppw8JkcQgEdou0C3rC2sIV89S4GjA=
X-Received: by 2002:a05:6102:5689:b0:739:4fa1:50aa with SMTP id
 ada2fe7eead31-760e8f3596emr3241387137.14.1785979718818; Wed, 05 Aug 2026
 18:28:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
 <20260804-submit-acx00-of-dynamic-v1-v2-8-3eef49ff1d8c@gmail.com> <30bab755-3356-4d4a-a939-8488aa487874@lunn.ch>
In-Reply-To: <30bab755-3356-4d4a-a939-8488aa487874@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 5 Aug 2026 19:28:27 -0600
X-Gm-Features: AUfX_mwRHCzyF7gAfwi_ObKJnDFQfjNsCJSXem_hxMypqW9gycQbdES8PR3dd9k
Message-ID: <CADvTj4r5y7ME1jb1OxnvjXoQRhpnQq1L=QgdUE7ESNgS2jzTBA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 8/8] net: phy: add X-Powers AC200/AC300 EPHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lee Jones <lee@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 6:38=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +static int acx00_ephy_disable_eee(struct phy_device *phydev)
> > +{
> > +     int ret;
> > +
> > +     ret =3D phy_modify_paged(phydev, ACX00_PAGE_1,
> > +                            ACX00_PAGE1_INTELLIGENT_EEE_CONTROL_REG,
> > +                            ACX00_PAGE1_INTELLIGENT_EEE_ENABLE, 0);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return phy_clear_bits_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV,
> > +                               MDIO_EEE_100TX);
> > +}
>
>
> > +
> > +     /* Set the hardware default before phylib reads its EEE advertise=
ment. */
> > +     ret =3D acx00_ephy_disable_eee(phydev);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret,
> > +                                  "failed to disable EEE\n");
>
> If the PHY is capable of doing MAC based EEE, that should be the
> default.

AFAIU it's only capable of PHY based EEE

> Why clear MDIO_AN_EEE_ADV? This does not stop the user from
> re-enabling EEE for this link mode. phy_disable_eee_mode().

I think I was doing this since I was trying to align the driver defaults
with the vendor driver defaults which disable EEE entirely.

>
>         Andrew
