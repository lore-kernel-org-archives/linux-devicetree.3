Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B917F39B94C
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 21:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774907085; cv=pass; b=LpErZEDsT/m0zy7mCYsTFRRHfyR/XJAQNN83/pjbpicNU9wDYW+jNWTZv61dAYHktgnowqgfWt+tmI7qn1fx82QwO0x8rW5rFrRVps5qz1FMplFPQPl/I7RAOSPDcLp9uzK1XJkXzWIxbLx3x95nUjCsdfBUNYRiUtUIj3i1Eq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774907085; c=relaxed/simple;
	bh=joXl5W/My3zoQvxu423mjsgVhtX//AxggfI6qzYeX1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nVH2Mg3RNjA7YM2WuBtDmC/pyyTqwKs2QXWZyB6C7z7XAIfJX03+5CpBmO2S149+EOHqew/1Qxsql7erAeLMlIXG6XO0bTb1HjRA4djjEP2N5xb3AqSnbP+BXXZxHUZB0k4jEKhqiw1dTZox8FBExlH1rvkfsGkib7ZLlLhOsLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=h4CWypCb; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="h4CWypCb"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b24fdac394so16705285ad.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774907082; cv=none;
        d=google.com; s=arc-20240605;
        b=aXMrKceZNkLmRltnFU/Fg4WAR4DmRkQiO7EkyhDz7Si7WfCFDAJK+ypvKl1JGOlTqC
         nULETi/0kHKyawqxBfpFSXhvYy7PuwHUg0IWcl7bYQUiyme+QsqSP9EluIuXCSuwqD6M
         Sv08ky2+4r3q2T7kaBIBnv5Ftj+XE7uZ+KEST7nkz+35FfOM0XkSZHbny/0XhJOuSa9F
         y/iiW3auiIwQ5+l9ChB92ccEwdBuhnyfQOunlbhcQSYietmIMmnDLy9HL3+X9KL6NsUs
         UGtOw9V+X6O2sk6m5Cchf14SAHVXubJePcezy44jMNoa0OGR1zhxMwd1wxs0lVPPYMY3
         tObA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IY6TefpABY+FWNRT3kahjkpIdjUN+0MXMlIzQOjUTr0=;
        fh=kKkuA0RlLSJcUp285QDYDPXrIGrWxfzHtYq70Vlmzx0=;
        b=PL8PgpoygJJ03O1elLwr6pqwfIZyy/0cWabkjRg9LTudAzFWr3fwOyPhcZQZj1E96p
         zI6WZU8Z+AY95zf2Xq4m2OH6GszQaTwCkTuINPG3okXNLQ9GOtEup6mefqLhPySm+Eal
         3i5KIycRF+KOUSTZqzCxGV1PsqoOdE9Edcp3cbScxgyWujeYKIbX1aV4Fny39z2qfxwc
         Xi6rwjKTcvr8MWLPKd6UXrU2dUAydHuWm8r2B6tzDfGOhicjY6hqjqxAbEEOIT2MuNW5
         Q8/b7arGP9Q4/H8ed7Y/v8xY8DMMX11gxKCNBDowlRQ2fgt/BTfSK19S6s8ZBnEw1Dq5
         6DDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1774907082; x=1775511882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IY6TefpABY+FWNRT3kahjkpIdjUN+0MXMlIzQOjUTr0=;
        b=h4CWypCb0BSE51L7iQj7Kgzx8fCgyA9caHJLIWKS2zsI8FqZwVg1lczKwM6WdpD0zx
         onY1nqT3FXH6QNIFDu1+MObQa8RkYopMQb4Qhwso+mMHLTlpHgdxIRV7UGm2folQekXY
         9bnEAI2lqOPqHWGtUZh0UxME7vc/qPsx6igtRQNkY9N1223vG1pUyw1T8LhY3rGzz0NK
         PlPd3PRGpZTa+ZGjFLOVxWYllHtlcT2o8X56p0nkOe0CxHRh8mi1E5ITNfOmT9n6DnN/
         owMmIIAvULfCpeookYVJbdTSCJzdafu1vIg6kYEeYclzW0aCcGMtfhiyFYV3n4pWOQCQ
         62Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774907082; x=1775511882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IY6TefpABY+FWNRT3kahjkpIdjUN+0MXMlIzQOjUTr0=;
        b=V5k3WEC6tMJZLWmDMLIdePk9KkaiVtyY3FWX4ZfJUCOYdb/cDP9WntuaC/RCHM2hHn
         G/uNPgKmtKWGKon0ibv1AMtprC/UCUeoD3kkPqKx5tdw1NWgHMCuqYoydbz1mu05hAoB
         NapPIhDDD2THqAwblJdEVxqvIoQ6j/n4KeqsCUB6jPlRUBYTXbSSLshHtcjq9HI++E97
         fglQeS7mJZvMRN1HVEInUtkXFSLEynPEJkZqNQpJ/toDwmnkNXo14bVG9wDwtvL6HPsr
         nocq3kxmjzK1PIxfV+dsuxU6hSyenGGPOq7+Y6ygex+EyKXkzJv5cv+j77fO28SXdXKs
         ZKQw==
X-Forwarded-Encrypted: i=1; AJvYcCUtHfM6GQ/pEzkPKtnJw0INMHk5uhy5wwo8vdfGZadwFKDC/QmZ+r7+2g3fX62ABtaXzoePBdSEH1Pt@vger.kernel.org
X-Gm-Message-State: AOJu0YxSfIqpgEAkTq2MCcMI5NrgxN73V6U3ns6V3Bpq/RDgYavPIkog
	FJfuyKu2oF8pQCzSz9lUWwW7K8JU5evw6AgWynCo8m5s4IjhlwPLWYPP9O5s3OKTs2UNU6jEmLK
	CiyUXmShsJbHyEYH3FbPAzn0wR5U/AAA=
X-Gm-Gg: ATEYQzxkxenVkr23PDrNqvO+1Vq5tcy+MYz4T7GsMv8FAyd0cQN51Shp1onkZprp1jy
	sQOVKDRRHZWOTF/S2TLrJEL/2gXF0871YODbekyjDmDdC9LBzZrtKC1OsMqZKKrhZcX6KBmHad4
	8c+PdZRPFQFUBOw9AubDHt/SLBt1tDC3VNtJ9YQ0qVr/zgYk3h41aQT27jcxSdveZxpZSlSQfq5
	97PPW3YfHxxrxfkgFCD6ofSe1N+k6wuyUX6NWTz1GArfQtctj5393M0mG6EPWjl32oPN1OBX4g9
	VsMy8e+ezb2KoaoBx880DuWB4gxyWFNNqfwep5ni
X-Received: by 2002:a17:902:e847:b0:2b2:54e5:b3af with SMTP id
 d9443c01a7336-2b254e5b653mr47612585ad.45.1774907082131; Mon, 30 Mar 2026
 14:44:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com> <20260326-s6-s7-pwm-v1-2-67e2f72b98bc@amlogic.com>
In-Reply-To: <20260326-s6-s7-pwm-v1-2-67e2f72b98bc@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 30 Mar 2026 23:44:31 +0200
X-Gm-Features: AQROBzDFiVgbyoC-RBIZt33tOxsaNE_LH0olelId_HKu2Jck3TyhrNiFIv2aRxY
Message-ID: <CAFBinCD-4dwp7pmM_GHK_N1kag_5VBZbP9VAwQOxcyg6aquj3w@mail.gmail.com>
Subject: Re: [PATCH 2/2] pwm: meson: Add support for Amlogic S7
To: xianwei.zhao@amlogic.com
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xianwei Zhao,

On Thu, Mar 26, 2026 at 7:35=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Add support for Amlogic S7 PWM. Amlogic S7 different from the
> previous SoCs, a controller includes one pwm, at the same time,
> the controller has only one input clock source.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  drivers/pwm/pwm-meson.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 8c6bf3d49753..3d16694e254e 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -113,6 +113,7 @@ struct meson_pwm_data {
>         int (*channels_init)(struct pwm_chip *chip);
>         bool has_constant;
>         bool has_polarity;
> +       bool single_pwm;
At first I wasn't sure about this and thought we should replace it
with a num_pwms (or similar) variable.
However, I think it will be hard to add a third (or even more)
channels to the PWM controller (not just from driver perspective but
also from hardware perspective). So I think this is good enough as the
choice will only be 1 or 2.

[...]
> +static const struct meson_pwm_data pwm_s7_data =3D {
> +       .channels_init =3D meson_pwm_init_channels_s7,
I think you can use .channels_init =3D meson_pwm_init_channels_s4, if
you change the code inside that function from:
    for (i =3D 0; i < MESON_NUM_PWMS; i++) {
to:
    for (i =3D 0; i < chip->npwm; i++) {

[...]
> @@ -650,9 +674,13 @@ static int meson_pwm_probe(struct platform_device *p=
dev)
>  {
>         struct pwm_chip *chip;
>         struct meson_pwm *meson;
> +       const struct meson_pwm_data *pdata =3D of_device_get_match_data(&=
pdev->dev);
>         int err;
>
> -       chip =3D devm_pwmchip_alloc(&pdev->dev, MESON_NUM_PWMS, sizeof(*m=
eson));
> +       if (pdata->single_pwm)
> +               chip =3D devm_pwmchip_alloc(&pdev->dev, 1, sizeof(*meson)=
);
> +       else
> +               chip =3D devm_pwmchip_alloc(&pdev->dev, MESON_NUM_PWMS, s=
izeof(*meson));
I don't think this code is too bad for now.
However, I'm wondering if you want to make "channels" from struct
meson_pwm a flexible array member in a future patch. In that case it
will be helpful to have an "unsigned int npwm =3D pdata->single_pwm ? 1
: MESON_NUM_PWMS;" (or similar) variable to future-proof your code.
What do you think?


Best regards,
Martin
