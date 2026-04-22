Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5C83ACEF1
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 08:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776845733; cv=pass; b=otiSGDKFNLvGtfNy/hF1yEixcbplzYDooLsBVL+Yq/bSkW6Of4/r08xxVjGHU9eZZCmYj1bvH7bNcbmoRZQg02V31mXpJYhYXEjYcB4D8aNZHZAw09SeD8PwQHE5tVe90reZgGBcIbxI4txFzYtMTt0FJkkEo5BNNYRgWl8arpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776845733; c=relaxed/simple;
	bh=DncC7/rJMefHvs6jsOamy6nnhVmB7rwaLiNnQJd6iYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJWUIEhWtlPnV/5dJPV6U245HooeOV9FL6xbI98YZnMLpXOq/fSvFvRo8g5qKXueiZsIAfW6JPQ5Tt4P3AKO6wlARLiqptTCf5zNIEtBOECBfCnbBuu2LkqakMRrrP6OZQA011m7fn07zk4Lm0aglv12oBqfZB9Q6SzLqZdZFhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyko7ikH; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyko7ikH"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so4916461a91.3
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 01:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776845729; cv=none;
        d=google.com; s=arc-20240605;
        b=c6UmnQJF3l6ofF7s2z2e5hOLomcGY/nh/bxccIHn4u+iNo9qYU/CKD2uVC8C6B2lnl
         PrvlEX3cvTX8sIQcLlqQBzQ/6s5ECZmmDFvSBCtbgR30BVesH0pZxD+qMB8A85yMGkim
         rRG8UTdwVPqiICfh8FRLCsEysg4nGyZr8Suk8Fcg7B5B8S+bAgl9zExT4WAoskVJ0TLm
         VLAht+vgxJu2jiuxT4RjNXOHh+dmIV5ctwLKskd+g5vGWmragTqOi7bR69EwgazuLCRB
         F+1cquPx4Y19c3Xr4FgdTNTJiCQ5T4POGWrY9JijHAuHFkAwI66AzMMk3hTafaTZoOzO
         CdSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d9Svqf7nagVQGDYJm+292ujdtORxRBGZ1VO5yq6bktQ=;
        fh=+XACGuPb3eAqmBw1NNeSgRE2zp27MXJufW3MyfQGHqg=;
        b=RJwdYhd7pc9/wq4uN3XfQgroXQC+3jrRkTB2oJQe/+BHQBWo7tPkUDde7NBfT3QtM/
         75Qk/j5bNZrf184jdO0VXCuhgxYU2RMb5KVjYQBTjJjOillN9R2IGgOZqjBnzSldIddb
         CJv55oY4p2nhgUKC9RqAaZDo6DbBU7F6ERi10D+j8+OvYFjYBiUvqOpKWBnJ0GR60QmC
         KQnFsQAaIUirUWlslYh/sNwUiG92SgjP8YAUWznBrRKoB73Isi1Z+BjLNKE/7PTEgtDF
         DyiQ7W3kPhy1lJ2YsBxplieTPclEDNaR21QuVZ44gRDpi74Ke04bBZpcWDZqxx1yVhCd
         Gz7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776845729; x=1777450529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9Svqf7nagVQGDYJm+292ujdtORxRBGZ1VO5yq6bktQ=;
        b=kyko7ikHlZDTQDrxAvGPJLLhO6k0wsuuk5cBi+hbGY5LGu3kbYySWVO+v8MonTnX1c
         xbgLkBd1iIwgQgdY0vPoq9yeRKnvOlVuttblzdO7E9wx1iCBZ+jubQJS6nHHn+cbsstP
         3NLstWsbJiycQsRTlw1/vPcaqMYSuO/vLyGa662F92QTFO7lAeS7xGkL6bLzUMHSrJp8
         tv/Jlw9tLB+A7s3Jo1CrzyEF1haJKWpLRQUJcMNatrtF7H9/3k0lc3MIArb5e17Rdb0S
         6pjqxZe9z1fcvuP6YmjZb6woSifLEAqSfEw3tD9oZAJQbRnYlnh/fX5/BkbQwHqIOZHB
         vw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776845729; x=1777450529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d9Svqf7nagVQGDYJm+292ujdtORxRBGZ1VO5yq6bktQ=;
        b=L1/m2lGiFNgSygLrwYbzlvqQ4gjV5j15IS9w0fSEPqVvIz3W1oo5V+kTMKqZcJc8mz
         6yUNDAPPUKUAg8IJR3zIDDJYanrmU9+9YNVJz6hkb5tIbYM4sHTp8NWLV8PSlXwIq8Ox
         jvuwYwgeFhkTnmXJtYHgBhu+VzA6xcG7nWDYApFQd3mDn3dNsuuE5cLq02+oelkXWoJ9
         V6pEgMkquUaa45/spCjpRTvIyqvhWRZVbJz4hqBwwG8iks2/xSjbGqUYlX1xqfAkApp3
         IxVz3i1G5rFq12x9FXz/lcKxiP3B8OD6S79ciEz8MB5XmU0ztEGIiAH5fyNPZeQ1Tvxg
         PJpQ==
X-Forwarded-Encrypted: i=1; AFNElJ8g1vadEHSWzYJ6f+fPPX5hNtZGFOqR6JQnDuy6CbGyQ68Xfueln8P4v8Cgk7Wzft9Nn6HOjV56pSY/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm+sXMfWuxT7r0pJ1FZ6eD+yT33wxkPqp/45FSOPGVV10TeZsH
	RjrqurrbABmu2xK6xACIDzHtQC493O0WYSGYEgQ+qH+8FcX0pQHW+QF3sryM/1tIK1Gcm3ojgAr
	Eo73Id+ue0JdpDPdcP7jqq4yWn+97XM4=
X-Gm-Gg: AeBDiet8NIBo5IPvHCh9pPs4cTIGTNZSpd1z3zGoxZST6csxzTceC6MomiNIEDpilHh
	wLTz17Fz5oiNlNdkJ+4ijEpw1Pm4sd87ZqgnFCyypsVYUDYLLylb5OrrtC8V+GCiH2RTmXfQdxd
	NA7gMyxCMic0K5c/Oxj9k8PqaP8oPwZsTp3aRVWgUQQ5ibJEVzAqvIvTcbEnDdrzRXaFbWKMRN6
	N0PORJ675Fk4H0pui3Od+xR8I5fLOkdBy1SnA26hbe+3oA3U08/+LiNujZjH1aivrLoxXqat7ea
	tQ/OR7sB1XTAGdxYEw==
X-Received: by 2002:a17:90b:2fc4:b0:35f:b6d3:da7d with SMTP id
 98e67ed59e1d1-361404635e6mr20506309a91.17.1776845729036; Wed, 22 Apr 2026
 01:15:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422070203.698716-1-linchengming884@gmail.com>
 <20260422070203.698716-3-linchengming884@gmail.com> <87a4uv5set.fsf@bootlin.com>
In-Reply-To: <87a4uv5set.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Wed, 22 Apr 2026 16:14:26 +0800
X-Gm-Features: AQROBzCXDwT8wfI3IxhKZWv7FK4oUhFYcEJUA7pBhDvdYOh76PDtet4MkYQV5Ps
Message-ID: <CAAyq3SYZdeWhtAbrp6HuQPLdsHEwvXUAFn2BAiD6YmE9FuZyPQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] mtd: spi-nand: Add support for randomizer
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvinzhou@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miquel,

Miquel Raynal <miquel.raynal@bootlin.com> =E6=96=BC 2026=E5=B9=B44=E6=9C=88=
22=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:08=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Hi Cheng Ming,
>
> > +static int spinand_randomizer_init(struct spinand_device *spinand)
> > +{
> > +     struct device_node *np =3D spinand->spimem->spi->dev.of_node;
> > +     u32 rand_val;
> > +     int ret;
> > +
> > +     if (!spinand->set_randomizer)
> > +             return 0;
> > +
> > +     ret =3D of_property_read_u32(np, "nand-randomizer", &rand_val);
> > +     if (ret)
> > +             return 0;
> > +
> > +     return spinand->set_randomizer(spinand, rand_val =3D=3D 1);
>
> You do not need the "=3D=3D 1" part. rand_val is cast into a boolean, so =
any
> non zero value will be taken understood as an "enable" and zero will be
> treated as "disable", which is fine.

Got it, thanks for the tip. I will drop the "=3D=3D 1" part and rely on the
implicit boolean cast in the next version.

Since the rest of the patch looks fine to you, I will wait for the Device
Tree maintainers' feedback on the dt-binding patch (Patch 1/3) before
spinning v10 to avoid spamming the list.

>
> The rest looks fine.
>
> Thanks,
> Miqu=C3=A8l

Thanks,
Cheng Ming Lin
