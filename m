Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF16306779
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 13:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181719; cv=pass; b=tLiFeGSjaKZQhWzBnLqX+ynx+ir+1rkq/dPZNeWnto611CPg3Kn/Q5kOUuNgrsZXGo/yekgbU7saISI7CecSm6vSHggC7jKBS9mifZpAoo6nml0a4w1p6s/zLLl5g8j3lG5Gjl88V1OkxcR0KAjHVqTOa7204iD4/jMqZyaeO90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181719; c=relaxed/simple;
	bh=vHpnMft6Dz9Dvk15TYbbOwoNGe/1LHJBHSjjNHYgaZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XEEpO/3nSn5R6KZ5HXc2NrW4tsvUaJyoIBVmqHDEwxzpN4q7NpLEwynztl3Ilsrg+5Rw5acBdq48JhCL+13q18CRcqqpZl0l6ikQcJaLfhU8eBVWRxFgTd/WW6vtBe8YR26Lu4le9v9qC2H1I14xBtSE+5yb5W4WIi+FUoV2gNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oQ3AlIQf; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oQ3AlIQf"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2529b3139fso435981566b.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 06:08:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788181713; cv=none;
        d=google.com; s=arc-20260327;
        b=GjBglozw29SbtQANHwryeetcF5C4GlWx+TRuyYgVFDJJk1pANXl+MkGT/37wzYmPmL
         OvDA9EptOrCG3I0FcbZclzOlZvp+mpSPH4MMKP2XK9P8/ME4z7zcp8CECKbyREj8L8uq
         AGv0smUmPP3Sh2HCPCSs39nOmLDSD9Dg0RRFUGhtle64j/yEn+YP0qDP8L4vZLkPotr0
         NINK/su3o5OmMWzv45SIDuDz3WfpLZ9sIAtoCIxIVjAf9hTgU1pwCx1O4aiW+uHeWg6b
         UEjUUYZGkKH5BuWF2pxZLO0NPzptBi1AZIb4V1EEMDzEAjT99l/DOJYK33U8UseWVJd9
         qAaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ArVyWXSj4XrOJSM6D/R8V0wa0IdxUZ6f3y+EOLVfmmA=;
        fh=L5Q/IasGRNARqYYTeo4jsjNn70UDlAPmfh0TwFXKXik=;
        b=ASdrmF4emrlxo55dBTIBJisBYE6+pxav0kq6+xrFtW+V4vkc0qcoHCED+b+U7UkJVZ
         PTuK/InNmASAUokDsXze0y3oIUwtxX0dq6eCpKgEcWFI9mURe9LoYmAuvrV3VwvvEKvT
         BWpvx3NTMQ003X7yTaMxJraFpDKLa5OMPB85wefnHXBFBLREE6XWe2x+j3ec5H0r3goy
         lx69AaqbBEuV5De0JWcjbBO/CRSYU7pIzpzEFl4fAtzfTvAbgMFaPBmcGHd0U4FNI8K8
         MCrSXU5n7Ueqfk45Q66skSOoDMwL937NBGw/g6sKKP+BnjEcUAKF3u6v3Gnm9wetxEti
         oRnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788181713; x=1788786513; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArVyWXSj4XrOJSM6D/R8V0wa0IdxUZ6f3y+EOLVfmmA=;
        b=oQ3AlIQfC8x0EjfGtvp9uhvG5EmEGocd2c/Sm4BSXw7tiTH4PeCTa9Qu1oeGkpG9Qy
         vdNhihjc+FezJkRcUh75RW+RzVMDp3Nr4HzSNqOHpSO93mbKvu9dfSmqpW5k9AUlXaS+
         BdoTmFrk4ODft5KuWxlLhhrmk1j/Wd8CuBtp5+IGl1sYXRPK3FkuEaeyi1gXXmkiFWxe
         +UblfgMMd6Nufq59vbLLpifa6BI+w12LGOTEw0YNEApcEpnUoqf/IHEGDeyMI2g2D1jC
         SWlPCLHLVoqhetqADRj+grobV9lI2e7vjOyOtWR5vIsXQ/7o4e7wWBlqwH1qzIml/Hme
         gTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788181713; x=1788786513;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ArVyWXSj4XrOJSM6D/R8V0wa0IdxUZ6f3y+EOLVfmmA=;
        b=hL+NYleolR+2WXY4Pl0SPK2QyxNI4PqnLP6OJFi2E/+ef8cw1FNl+SNlwz6ov/7AUY
         N/YQ+wzbif9zCA+ohnfU7IhhwwFI3iIjhnxxkd6kUo11K66/BhGtpHtjvSS9ivbNGb/U
         gwSpDqvLTFJCNrfAlssLzZ0mOldFWAwFQ0ipVpyYGRoxuneGvEN2sm6TXJjVr255X6+F
         HzkMAXavDXAVUePK2+yQmwCTCvh73eRMr9wvg9AX5q2sKQb73g8n/9BeuPOJtmaAaufQ
         aZpXAnMyDyQwbxHBFyYXydX6GP5RRCcJl1o+Al/g6byyv8KzyMqJrc+L+ONlzzCdsD0y
         uNKg==
X-Forwarded-Encrypted: i=1; AHgh+Rpl0lRtr2IHCqjvkGhB0xc6sH2wjcyPpLv29bUP2pDgKShoWoKnTjSZzvSbPvxOKKYn2Lu3Qbv1xg1V@vger.kernel.org
X-Gm-Message-State: AFuF++mYZIw4mtZWnnkqQ+UMa6y+O3eM6q0j0RaMxqksmzYwx+/n+qkq
	qmQ0+lMpeZtLtXeX41P2uqzDlaV0XW/WMweZzNKMLgua0viDlCLcHRThtsOz1gwZSTHi9IU2K8n
	CXH2afsGJaUgXgFreMd9njBcLAH68yC8=
X-Gm-Gg: AR+sD10h1t+r+emtpN1NDAG1GYBJ819z8uxpJNxqRi3ZDlQ/GJoQ/tvP0HqCw7PvGKW
	HXam/Da9o7mUZ1wdcOl4qlnGsxnSFFbwdQDxqvQv1/76RLtl+an4EfHnJq/Dc2qQJxKJ1MdU6cb
	V7BXX9eoSNpXJ6qLlkJHvQB6Gkw5+4hiR8WyM4EcyUiQLvKtaTd8Cqg+pwXlTQDIMRrPXABK2Gx
	pX8auTax4uLpQu8QIt+oOU7qkua8bJixZKe7lCZxKX6dXOJG0JGpJh7Vo3rKQLAz97Na3gKdo5L
	jK0G9hd+vzWrNZwNjVLeBi7ihf/BxGsTNuza68x69gHqdrGPaf4nrGcwfSSNxZvL04coxxQSSl2
	N
X-Received: by 2002:a17:907:e009:20b0:c25:afb6:2d91 with SMTP id
 a640c23a62f3a-c25afb62f6dmr113371266b.2.1788181712963; Mon, 31 Aug 2026
 06:08:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831123637.666457-1-o.rempel@pengutronix.de> <20260831123637.666457-4-o.rempel@pengutronix.de>
In-Reply-To: <20260831123637.666457-4-o.rempel@pengutronix.de>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 31 Aug 2026 10:08:20 -0300
X-Gm-Features: AcwNN1Xw8wz2-r_4F8JCbwqtdJfxO4kY2Houpf0hjogBOIBslH4fHsaBt66kRng
Message-ID: <CAJq09z4ay-c51-GA6tFrV9QvqyRvvWODJ+G1FcQLYnmKsO_+dA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/3] net: dsa: realtek: rtl83xx: use
 dev_err_cast_probe() for reset GPIO
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Replace the open-coded dev_err() + ERR_CAST() on the reset GPIO error
> path with dev_err_cast_probe(), matching the reset controller above and
> staying quiet on -EPROBE_DEFER.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> Changes since v2:
> - Added this patch
> ---
>  drivers/net/dsa/realtek/rtl83xx.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/dsa/realtek/rtl83xx.c b/drivers/net/dsa/realtek/rtl83xx.c
> index d6d243131fd2..8121ec12fd8b 100644
> --- a/drivers/net/dsa/realtek/rtl83xx.c
> +++ b/drivers/net/dsa/realtek/rtl83xx.c
> @@ -212,10 +212,8 @@ rtl83xx_probe(struct device *dev,
>                                           "failed to get reset control\n");
>
>         priv->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> -       if (IS_ERR(priv->reset)) {
> -               dev_err(dev, "failed to get RESET GPIO\n");
> -               return ERR_CAST(priv->reset);
> -       }
> +       if (IS_ERR(priv->reset))
> +               return dev_err_cast_probe(dev, priv->reset, "failed to get RESET GPIO\n");
>
>         dev_set_drvdata(dev, priv);
>
> --
> 2.47.3
>

Nice!

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
