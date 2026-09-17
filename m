Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE6434D901
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 01:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789608049; cv=pass; b=TIvzvl5T9KzsfjDYFR5+xavrxQTRdvno4TZ0J8xr9Kn7Uq2rxskdjEXJ4tQX0DcBSXE0jzQjAqQ4QZtrYiYAQ751zMjTirO2LbRNg6N9dySyk6G4owa9XZdDt74IRVRzd7OM9wXafD9BTsHI2Og3mImyCs7OnUcPU8MweCTxIOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789608049; c=relaxed/simple;
	bh=JE6JhFt7uwibX+/JwtwXQf+od6j4Kxf+0SEGWI7CQAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3st6OpRZcKP76meU/lju488JPHa3QhcaKAtMZde+xNPDdRP5EQNlWWniwPnl+jo0ZhSkPLp4ug6hsycecT21aZrdefbfFy9FOj1xCeJzkcCA/gW5bs/LU/1W+k7R6XfzJuf1MTadtkzLCdBBXyZ9VUTZRPjtJeGXEWAhiHQbOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvgdmQjr; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvgdmQjr"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5e548cd7dso2740671fa.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789608046; cv=none;
        d=google.com; s=arc-20260327;
        b=gCPKSaT5upUAm0dJNcycjnOSIPB0F59NdU9vWJp/YaT6KRpCo4PJ7rqcuh4KJLIwXH
         doNpEVWskgmg8/6BidFsa4Qo7bU/d5l7NA5P7lo2Fod+a1ogAk8JtZ2GST3ip6C9aJm4
         Wgp5NTbpiLX+EamuivqMNfZB2ZeJaWEIQGUZGE3S8NH5hqn53U3hY2UVh/QjytpSwaaz
         PkVgl/t6/zrYpnRzyA6soZ0Q/eMBrzXpp98JPJnCPPYey2vB4P1JohvigcXHGaDDq8wq
         CJMtVr5f74ihbWlZw5nfdD/Y2sx/p0SySQDRdP9Rlai3Snnqa75R3rMZ865USYHX3G/4
         A7rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nOOMHObQRBAIss4LauCRNXpDdTW1eSIKzzXC9H3Alhc=;
        fh=t44s1VHA5nd4GOqWJKy2BIjn0zAkjrjWGpMbXOPM878=;
        b=Q2VvAAp5pAjBYq7UWtxEvJrrmkQmu10d6Kmi/NrQ+ZJfN3g82A6/dkJlQS+EvfKe8p
         N6UDVGP0lV85msj2EHxilgDy8Q0zz2JJb4JIGMU0/BrpwaXvta5XUtiDxJLuna4s3uE6
         Taq8cZq/Kh6ZzP+ah/FF3LpDIPUt4nU+BqFalvnnc6zJ57TVHpw4diDPIOFxeQw02wJd
         BjcDg2lrMJE9q2kttS5JdCoXmdISsQp+FQLxZr7FlFNOhWuRElhsa623fHyboCnNqVQ6
         ZhtpitR2W2rSqkM80/YzyNetyAa0y+UANOYnCJAeTODNmVqOZDYUanc29ZE0YhKSGr/w
         QeDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789608046; x=1790212846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nOOMHObQRBAIss4LauCRNXpDdTW1eSIKzzXC9H3Alhc=;
        b=dvgdmQjrb1SXh7DQfch2NI+Wmlnb/4wTBgmBRnr7A8k/LlGOtY2X2bSagtfGEzJq6l
         fRDRuk/dhYSQ/QpTgzK/wgEFGDuSQzuLeCHKBrYW4YS+8nylX7Fd7IM9dFdLmSx3K2FI
         NGrw31WenG4IQ3MMICRGJuTMEF56Cthio/+kt4SBV8PeFnn6xezAtOoClYQpseo50uax
         2UhKzRqYg5qn1lvTqmcJXY5/ZdnCGc/kBLiZbReqSqFraGDqGXaLRCBV1Hii8soQadr6
         frT2sNCtv5uJzKNL98ZDHFbrTpAcYIW982z/+ZumgSe7fL4ooX58xxriv9KipAtraGaH
         TWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789608046; x=1790212846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOOMHObQRBAIss4LauCRNXpDdTW1eSIKzzXC9H3Alhc=;
        b=pTh6eSCkg8N5L6uKS7qW7NTMfZl5iMv718uJNCdENCn8jTBg190g26T1QgG3xLuCAY
         NZCMaQoFNUJcqPxuOUm1TgrV8rtKLpk5rT24ULCZt9YJJOzpsQ8uC2UDzNFrH8oJhLIh
         7NNEfC1V+fdK+ajcJ5huv2Sy9PrProNnHly6BOK7PaiN5gs51v7U0TLnt0ml3vHC9Z9Z
         ZDAEMijfyOkaCsGingP3+dWwg+cc7isxltO2MaRmVdzSDHKFfyWHm4YSBC+NZ0B0f9lk
         cASy1isTjqwMP3C2ATMy3WU3lSm8HvtqnS61UrE0Q/YA1akfmKhyLL/1pK+BsofN8Vq3
         6uQw==
X-Forwarded-Encrypted: i=1; AKwUvBzIqH/5fELgPHX/7hDdTzHolhdHHmq2Q/3hREyRzOWi3Duo7gxwvOhaKzIXyXkX/olFh/v3rLM4J8Hr@vger.kernel.org
X-Gm-Message-State: AFuF++ldOLx6nLrHFXh4zuK8RR7L+tgi9Xte8YtO+VVmNprQxh2Cdbpw
	+Xdq7U/hn/sD3e804+5AXKdY5/rfY7EKDoH06QfmMKwAjNV6Ktd1y4XZYoiFTRPu+d5CXyjvPgB
	QOokHlfk6MNPf2UIakt1ojX84OxnXwyQ=
X-Gm-Gg: AYBFou2HLKtMPNQWu4xJxRW/8Jb66FiIWaCY1022kFp3tg/fUrZtbjdomLAiBvDFFBz
	OfyCigu4f1uzwgQo0n4t7KIgURK16BljngRbG2COr6wpZrJ+Xn7ujiCmlzjPJacxI0jmFXMyXfw
	tZ7g2N7RDpMJ6BXXJKtPb8SKibu3V+0buhdMu6OPmFMUJ9opVlwuoyiJVkSBBmfHFxDknWYA3CM
	MEUHmL/7Vy2cxa/sQgwTV3pXe3Zdd7ZHpwd0QLqPFECnF/0uceJhZjmdAWHlzozW/27lbPZx3hM
	t+9k8rixMyOvIOkOg/wUMKgkLRM+iIGAcbNGtyMz81Yn1r95YODarRokA/8M1eWCjQDzyYWS1we
	W/SKr6sLty4qVwg==
X-Received: by 2002:a2e:bc1e:0:b0:3a5:f041:d7c4 with SMTP id
 38308e7fff4ca-3a5f041da54mr299311fa.17.1789608045973; Wed, 16 Sep 2026
 18:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915052021.6959-1-syhuang3@nuvoton.com> <f60a440e-1b9d-457b-865f-b3c4778d966b@roeck-us.net>
In-Reply-To: <f60a440e-1b9d-457b-865f-b3c4778d966b@roeck-us.net>
From: Sheng-Yuan Huang <hsyemail2@gmail.com>
Date: Thu, 17 Sep 2026 09:20:33 +0800
X-Gm-Features: AcwNN1UXSRHVsaDtbTNimMW42Y1gjHq9uS4TxC2W27XMSX28femBTxPDTsjGqk0
Message-ID: <CACW=pY7u2wOzgc05gHfRVJFx12CXGvZe7fCwgPZ_y8dSo02PSQ@mail.gmail.com>
Subject: Re: [PATCH v3] hwmon: (lm75) Add support for Nuvoton NCT7715
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Sheng-Yuan Huang <syhuang3@nuvoton.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2026=E5=B9=B49=E6=9C=8815=E6=
=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8810:37=E5=AF=AB=E9=81=93=EF=BC=9A

> > @@ -1129,7 +1147,8 @@ static int lm75_suspend(struct device *dev)
> >   {
> >       struct lm75_data *data =3D dev_get_drvdata(dev);
> >
> > -     return regmap_update_bits(data->regmap, LM75_REG_CONF, LM75_SHUTD=
OWN, LM75_SHUTDOWN);
> > +     return regmap_update_bits(data->regmap, LM75_REG_CONF,
> > +                               LM75_SHUTDOWN, LM75_SHUTDOWN);
>
> Drop this change.
>

Thank you for pointing this out. I will address it in the next patch.

Thanks,
Sheng-Yuan Huang
