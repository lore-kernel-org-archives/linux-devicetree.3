Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C10851A121
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 16:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168049; cv=pass; b=IrVG61RsasyNbwTZksmL6+vPgQwxcAHoHtUh+IEWGrqzGADW30p76Rl9wH5yPzIzbieoP7jZ62zT4wKjg+2MrCqE3aCHTZmpLL4I9e+TBo9MCpHB5IHDUuGSs1N+L5JkNRF1IKznwI4/Kurhm6i5Q12GhBWKvUCWqA+sdmvbg3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168049; c=relaxed/simple;
	bh=7EREj28Pt4d+3/OFjKBkGafNy9R17eDiUOr72tTJcIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1YuwM23vp889Q/lSbZqywL9mlHGrhfl0V9fkOSK/bpuNmLSKU2JT1Rw3s1B+MtVDk/MQkw6L3+JT7DtJVIpND/SeM6PYbHkPRAa2z7nZH31y2rH7jAdluDAT/jO7IfuzL7PSsyYlh69qv/zg2LPa/3N+MQzJOZYTJjdB7Q6yqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kA0p/dGu; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kA0p/dGu"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3550c917fd3so69692eec.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:27:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792168044; cv=none;
        d=google.com; s=arc-20260327;
        b=bdKtcR6LPHBN69y72qtsAQUV1YUXAdiSU9VVkFI3iYjTlhXzEHuKGhsStwODSgiTAW
         tyKM2CQVh1Wc51ybxrGCgccLzbZPEhkUNxJj+9RirjQjDwnOljVwTLSnQyRry/VnV05S
         mRT9QcBbu2WlY9FDm1dYq5Bvxr1D1azYbOohX+a9I2wnjeOp70Dt08N+HP/cL2sQt3qV
         +J7Yw1qrUk8WFq+zK/VwlO1lmNfBgdjI7bYeh5GoSP/KOXdbhFbTGAi26VQUJdRhSSGs
         rtJG9pfD3pKemfP9m0kkICLAAtt9DYpc87YZf3DvHnfOEMG0V//ALZd9FPnn9HSRs7vI
         Ny2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FKkA/I1J3TnOXc1SCotCtaDkPFS5TVcFw8DzsF8Du/M=;
        fh=DZBV1zBZ0oQ0sglpAVZzVTOruVcKQf5X1Wh0ZquUBEE=;
        b=in3NpyULanhRe7IWOJOR1+PS26Q3vNXRjYZr3MgmBUbzpsRz7I81b5CiAm4rF4Hthi
         xr9pq55ObMjhblgIPG7ad1R4Y5bJ0tETUBYnELMxaavukMmz2TeXQnwJHFxTA/2tF2/B
         MiLhvePImJee8Px75+Mem272+QWV5vJ6p4FZonuf9iW/d1tOerX7axO7egQJ/Wg3gNCW
         xKQ7wr52hYMhRzZSPaaFZyfuQkrOvFufAm/R+z5uX/EvFapvaXhw6bPRuQLWT+7RiMo4
         eh93ycLn7QbuzEi0EVOd/BlkLDZ7gxUS/VTcnls7g/3pZxyDTPicqKYGICCXRIu0IB9H
         zs3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168044; x=1792772844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FKkA/I1J3TnOXc1SCotCtaDkPFS5TVcFw8DzsF8Du/M=;
        b=kA0p/dGunHRVQFYJZxY63SPffce00jnFtWKw6dFU1c8T+ICC30awMa4fiXZ8fEQV6p
         HfgIC/dD3PFkzcNQcaQ0EYk88IfXgQVWM7eGmWAL/MxrY+vkkmunKb2U3d8Qv8sDBS1A
         EFpQmv3q895Nvzo0g0Jdt50ZFVu4JdyiWv8iQotFzCHnkyEMMdQn8zV8zsWVwwL4wykn
         lNEx+RHNCeoiS22qfZFwDSUY3QmmF3LjiKmYnmqajqHDsnTyySLBUTVoujBgCArX9N/l
         IiInZQ5ZRG3tSwm6LJC4rO7snD4fp20OR24P0zUWrFa2Vy06kopeGhUoVIfu6iMEgonV
         uWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168044; x=1792772844;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKkA/I1J3TnOXc1SCotCtaDkPFS5TVcFw8DzsF8Du/M=;
        b=Boajfl4LlXKpn19pIVt83XfQ/5Cw3xWwpqS2LChvgggNd0PPtrDanUQh6lbM/Jk48M
         zRhLIisrwCRpIQkglW8BccECNgc/8r08mPw/o30Yl9bKF2rFhvou+Ui5N0p9NH3BUGHW
         zphxIieKgcsbXOeUimIvDe+O0eOF67lAZvIogsf+Cxc5Gb9nM9C9LkT1lJqhDIOISva4
         GZLOAmWMySbazLB0ziYFoPzV8SOW1Q//gJcIoSqg3n6+W4GcIv5ETWFWm4gs1lFYTFBw
         E5Hu2MS++RLz+oW/kid/3GMvTFGlsisbvW0eyA7sOP1kHT2GgeaGvutuWHQrNrcGg57w
         RZzA==
X-Forwarded-Encrypted: i=1; AKwUvBwDipIvS6bRL5CZIf+D54qaYdsZxNiNKbA3m3hMTA3FVLQ8PiUXGQ4ARSfOgL7mr//4FXu0AIOqPJrc@vger.kernel.org
X-Gm-Message-State: AFq9FYIXkJAe40PP6jfAlwKyADmNSY3mjp4Hf1+BQWNcLvwbLy0ZXL9X
	sJTXR+PhRn7M0pF4yUZVNAVrPkIZsjOh+OikUo02ZJ/b7zr7BLllDY6h1PlJlXHdOlHHjM06ZoV
	5hAFeOwj1m/Ti7goP7mAbGAAtoqrSWhc=
X-Gm-Gg: AYBFou3uZVH6nbe99H5PdDiFOEWNhIoqtAdRqJ5u3EJQFQ+CAeg71fSM0RfDoHOveRa
	yOzmcBP3bU4z0KHnojDq1s6UM9qNzGB6PP5IeFT9g+Mhzehqrluvrngc3NHEnDyttE6kHlXh1WK
	3P7ZQK8KUKuFVDMecZBL+S11dMSDuAXDZ94W8p4IoeqQlD+qENVs9pApnec5DrtONrXa9cnDp/5
	NDC43KrjBDVForj17KNmu5m0cIIeREsE4MN4saQT6U91ZS/yLca8F5PQbqkUmC4Df3zOHUwowjZ
	VkeGeGJIqyGNppI5kg5N8K0eyLDvDi1sBKqCVtp7X80hfxfIEiuWl+USAqx0ebO1FLzEuL6cV3K
	IOueGQR1Nleoz
X-Received: by 2002:a05:693c:638d:20b0:35b:cb8a:8d0e with SMTP id
 5a478bee46e88-361a18634c7mr341911eec.16.1792168043963; Fri, 16 Oct 2026
 09:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013180933.487013-1-clamor95@gmail.com> <20261013180933.487013-3-clamor95@gmail.com>
 <atJDFRXmgZ37GrCE@aspen.lan>
In-Reply-To: <atJDFRXmgZ37GrCE@aspen.lan>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 16 Oct 2026 19:27:10 +0300
X-Gm-Features: AclHuK965ULDwrtLzaPZLgAMgTCNPq5g0it--pZ3MwPKJFECiLPJTV2LEV8Gatw
Message-ID: <CAPVz0n1RVDz0MsMBccanpynh=Qn4x6Ar7rXRUVitav88i-hWYA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] mfd: aat2870: Derive brightness steps from max current
To: Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 16 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:3=
0 Daniel Thompson <danielt@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 13, 2026 at 09:09:31PM +0300, Svyatoslav Ryhel wrote:
> > @@ -69,10 +57,11 @@ static int aat2870_bl_update_status(struct backligh=
t_device *bd)
> >       dev_dbg(&bd->dev, "brightness=3D%d, power=3D%d, state=3D%d\n",
> >                bd->props.brightness, bd->props.power, bd->props.state);
> >
> > -     ret =3D aat2870->write(aat2870, AAT2870_BLM,
> > -                          (u8)aat2870_brightness(aat2870_bl, brightnes=
s));
> > -     if (ret < 0)
> > -             return ret;
> > +     if (brightness) {
> > +             ret =3D aat2870->write(aat2870, AAT2870_BLM, (u8)brightne=
ss - 1);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> >
> >       if (brightness =3D=3D 0) {
>
> I think this could be spelled "else" ;-)
>
> However, other than this this looks good. With that change applied:
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
>

Patch cuts part of code, this is the full context

if ((brightness < 0) || (bd->props.max_brightness < brightness)) {
        dev_err(&bd->dev, "invalid brightness, %d\n", brightness);
        return -EINVAL;
}

if (brightness) {
        ret =3D aat2870->write(aat2870, AAT2870_BLM, (u8)brightness - 1);
        if (ret < 0)
                return ret;
}

if (brightness =3D=3D 0) {
        ret =3D aat2870_bl_disable(aat2870_bl);
        if (ret < 0)
                return ret;
} else if (aat2870_bl->brightness =3D=3D 0) {
        ret =3D aat2870_bl_enable(aat2870_bl);
        if (ret < 0)
                return ret;
}

aat2870 cannot read main backlight register nor channel enable
register to check prev backlight status. Hence this logic is used. If
new brightness > 0, update main bl register; if brightness =3D=3D 0,
disable all active channels, if it was 0 and now is >0 enable
supported channels.

>
> Daniel
