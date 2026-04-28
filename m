Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C291B30B525
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 07:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777362209; cv=pass; b=qPfMEURiieBSSHf7ChFov47J3LGCDbyXngUG8nKuF+6po8heKs0eHZ2lIN8PkCnMR5t7/CqqwF7rn6PX9z1Y9Hy/darolaQjT7cLeAWhDocWtjcSDCj+8rqCEoBo7kE8nsQiQefFFetgS4eEOHYmaHkXlKYHVNqGOkedNvIL7yQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777362209; c=relaxed/simple;
	bh=CfVWaBOeEjdowRgBP1GTk1092ksC859xKTluhNn9M5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SLH41MHRYxceMfQF6hZDeqqvMKn6pHt19QAFzkwvlfrCncGjEwTHwLTDgyCNSYl/i/AqWg2hPDam9ZMkXwhR96KDJyF3nLF2VYJ6x1rvFsRwrLrEcwQeWCCrGf3Pk/38Bifcj3WDeyvLMdc3O/2Ujsh9sUiNxLwpZ+SUfYBcvnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwDB3zzt; arc=pass smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwDB3zzt"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-662efd1bdd4so5585291eaf.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 00:43:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777362207; cv=none;
        d=google.com; s=arc-20240605;
        b=dYXk9uQ/+DNpL2NOEkSi6lqv7jh/N9s6SrJk40yvaA3wL+qXOc1AraeLh2WTE8eXYN
         5sh5Hn429IwpLcayjsjjM4eAnheBdKJd8rbtC4F0KMAzzvkHDdXmPa2jvvmQ6pOjPRzL
         mIC78u0rT8titvwsjz7t6GJfnJULSIc8N2P7dmeuSGMzG/dKehwPyFHL2oh+/HB7N1ws
         QNErS2/vXUEjrUTityLIzGMuBbyKGXozB2r1YebHsfctO0pSyrVECz5fBVHH5iZb2zMY
         6ywP0KoUbNPZWIFqN5Qund26jEdOhtg67ZALt4sHMJAn3UuPlriSyCIWDtI/WFhyG8L0
         BnSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nlCWMuzvVJ7IzoN/xOGYuIb24YK5KEaZSDEM2wO3L9I=;
        fh=94WRSUy8fg0cA5HJ6dDpwolaklRParDDDyX6aOvIHvA=;
        b=DPlXtk7pMIJqeHbBCxFcIhd+yGrbxUjTBXq7hwwB+ox15prYqwKDyVp/Fyqi23XOzV
         H/9a46J06Oz7fRYcuDT4aQyLRQVbDQa/m7JKpcWLjt3Ku/9HcOC7344VSKJaz8K+iDl1
         +l16Fvvt3XuZbDQBt15HhJDVtZ679Tx1ow6HiRhk8YR9CGY03p7tsWwfCgiHaWgj2gEo
         WOl/uPPQD9gAFVPDdLpipm+xnbO5/FmdBKkJ1hqzJ1nJGfBtYewffuo7gpf8rG7LuqYq
         GlLWKMa1bnztB6NqPHX8F4H+4CvI4JR1oCFaD4xAko9+hnzxSolOZ3quamONTA4Ii2zJ
         9vhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777362207; x=1777967007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlCWMuzvVJ7IzoN/xOGYuIb24YK5KEaZSDEM2wO3L9I=;
        b=NwDB3zztW7wcFixaWcGppi+ceXMbjNgVAd2M1mSh117Kfo+suE6e9sPL3qkxzl7YSi
         nkF8kchw6GXPNRO9vMgWXJ5xlHUWTG/cNo4tTkXajnlQJzNXRNh2hziYPNTErx9Ji7g4
         0NpxXqUKLbu1kI5iJ1ZbiDnYwB9nznyFZeB/OrU22+iGVX3lZSOqC5ntdeARUsRd67En
         DvDW5FGIYaACqQVep0CtGrr3kucG9nGQ+pcZ7fddnDexJlb3qhdza0oENj0Ab+5IrAIw
         XO4C5QbvdnezlsTdJ0iHanGJwu8AbYOMdhZ3OIOdVXrYUxNyYflkVPgFjqS0BeJkwv7p
         hjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777362207; x=1777967007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nlCWMuzvVJ7IzoN/xOGYuIb24YK5KEaZSDEM2wO3L9I=;
        b=btgRUJ7PI3c8vUkmSIuUYadNacIkwpZaRapGNlWxoWWmAZDVbVTv9Zse4NviWQZQcM
         v/rqXRfbz2LswYvj1coozfubxCFD/9oA8bNv/NMwwzkToLlyNmlvzrHJnGF42aMEoJcD
         9zDETteJhnHBju+jEsf2FmGz7uGm4lSQn+saz0L/oKVNEbDJ683MJP8I3ino5WNcocwE
         qoCFhXI1SDyFMzMtQowzPx2i1BIp6ag5Z0BGJ6qOpzdTK29xHuSl5WxGw6rpmjwjRt8S
         yxGLOqGxU1ei8qadjc3TxIDXEbZOpZxGsV9xnNtHPzsaSgYDfla5+nhtvNQapt6G+Xf8
         deMQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ODMqiY8guFNTd+3GnmsCxXDfKnCHuPH7FxOczwHMh2c+Bz21WwPzi32sTXARosjFKdPeuLllbJeCC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw58m4P8K1Ukm+p4kqG8t/UFgjdGQaTMhlC/MIs4Qc2FFWQZroG
	7rFkvNvR/k7UNx67YQN9Fy4xZZdYK8MvI7tTBv3uT29tzOw/xyAkM+FjJlxYQ3R4QiQDIvVDhyW
	PeIth3J+Iw515wweZXyXhNK70bY288lI=
X-Gm-Gg: AeBDievMokdMyH5aBq5P2sR47MCeLLBx1zOULFO4oW2ohSkxqGmsTtw08cEvdh7IAME
	UFHnE1i34vd3jMbvax4+xfAAYtGsXRep5TbJZ7Rf5Z84bqO8F4DKaHpttSSbxoHB//vt7GTJBw4
	TXhyncYLhvKi7WzRSEqCM6rQtGn2+eXla6WkzKg2S2mmwy8man6WRvz0VA14qXrmAel5ZXFBODi
	01d4igpNIhTuxfC8kKH/buCmoR4Md0tUuCqbHzrFbHjmRXf4k8bnGQm410f84F2SD4rLJBm14Bb
	ZoWJCz/XXPstP0Bldw==
X-Received: by 2002:a4a:d154:0:b0:694:857a:5a78 with SMTP id
 006d021491bc7-6965c24db04mr901521eaf.8.1777362206757; Tue, 28 Apr 2026
 00:43:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424085007.3239969-1-syyang@lontium.com>
In-Reply-To: <20260424085007.3239969-1-syyang@lontium.com>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Tue, 28 Apr 2026 15:43:14 +0800
X-Gm-Features: AVHnY4IQskqnH5leWyDO4V390XKUdr9xIa_jNwD7t-f6Q8D1cijxN2LeWsm7gY0
Message-ID: <CAFQXuNYQZrOUvuQmB9RpBRqTz8obVLg0Oo5O856ukYZcBLR=QA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: Fix the interrupt clearing error in LT9611
To: Sunyun Yang <syyang@lontium.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	dmitry.baryshkov@oss.qualcomm.com, maarten.lankhorst@linux.intel.com, 
	rfoss@kernel.org, mripard@kernel.org, Laurent.pinchart@ideasonboard.com, 
	tzimmermann@suse.de, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, xmzhu@lontium.corp-partner.google.com, 
	xmzhu@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sunyun Yang <syyang@lontium.com> =E4=BA=8E2026=E5=B9=B44=E6=9C=8824=E6=97=
=A5=E5=91=A8=E4=BA=94 16:50=E5=86=99=E9=81=93=EF=BC=9A
>
> Incorrect clearing of the LT9611 interrupt register causes subsequent
> interrupts to not be recognized.
>
> Signed-off-by: Sunyun Yang <syyang@lontium.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/br=
idge/lontium-lt9611.c
> index 4517aee83332..f30a2875000f 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -398,6 +398,7 @@ static irqreturn_t lt9611_irq_thread_handler(int irq,=
 void *dev_id)
>                 dev_info(lt9611->dev, "hdmi cable disconnected\n");
>
>                 regmap_write(lt9611->regmap, 0x8207, 0xbf);
> +               regmap_write(lt9611->regmap, 0x8207, 0xff);
>                 regmap_write(lt9611->regmap, 0x8207, 0x3f);
>         }
>
> @@ -406,6 +407,7 @@ static irqreturn_t lt9611_irq_thread_handler(int irq,=
 void *dev_id)
>                 dev_info(lt9611->dev, "hdmi cable connected\n");
>
>                 regmap_write(lt9611->regmap, 0x8207, 0x7f);
> +               regmap_write(lt9611->regmap, 0x8207, 0xff);
>                 regmap_write(lt9611->regmap, 0x8207, 0x3f);
>         }
>
Please check this email.
> --
> 2.34.1
>
