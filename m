Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7C7399017
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162515; cv=pass; b=agYlGBirGumX/YZKWfRgJ3Gpt1KQw2JOgdeYM7KQ+pMpu0em4s7DuFnmnrzXoGO7iMvWK4he5wP0iUVOX5JoloqpB3BCFFUNLIN7rtEkvigcWrycm1eow1j/JMWEDkrI5d8uRHD8RsHtEmCxvJFe7Kpgnde1kHgr0qB+kEKfew4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162515; c=relaxed/simple;
	bh=lrmJycYsABuOjKqSc9d0hOXzD3f0R5HKmLZc5qFfWUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nw9q6OH+mQpEPBbhQxVbFr0ZBMQxZkDafmSHcNwLNyzDhXxnR3rqUY1nH813z9WpBbVFdYHTG/mP5qee/OMyeRu08wBJRrtygrlragOIkHHGHPUPFdXZw2FrNwCQmF5UH8gjDIBy070AMtl8cz8bwCpOjD9hwZ7nan7SXQ29rfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=UGKyHmtW; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="UGKyHmtW"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-506aa68065eso42144401cf.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:28:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776162508; cv=none;
        d=google.com; s=arc-20240605;
        b=ZQUukr84495BOfKuwOnli5wdtrZ9sxgEjDG2FDYYQfRqFgJXdCStaWJbOjZ9rHvYdZ
         C0kLiRBlh0Fzav0wc3ALJ58jOewIxz3P0xyl3xpXv4q2Lblb3+YK5cMwnykF1TOy91bI
         a5ayIjdyiVcHnYyVYT/9xKT0QQORdf4xDCyG3fjdE6i55kWrcKseJQHQEGLMrqXahzO1
         2G2KpfgUtDdT3qPDmoCZzpVTYa2b17axQrBufhqga77PIGGvGWisoPZzS/ymUvIxJySm
         AOUFusXXkA2gk24oYZJ5FslFGvq7xUeIav+3XJ46fQJHboJeRi7olwr11OHPa0Wh2ytK
         wGRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EbKz3DQzt83f/P1RrZXts9tDEfXZSdSj2yob2J1dqQE=;
        fh=w4K+ez/MxTcDZtDsIj/YENFewLhH9MAyxgobm1UN1gA=;
        b=Oyd1QaXhewmH4NJV4GHylCoht5NgnKa1fGOJuR49YhZxwAhqaSg4RCA0TfMtnv4Adz
         wtwfKQVDIOv7g1Ja2wY3TIYKgxsB4sI6p2NpqYNeCo9RW5iphrZePmNDDPa+Iu3wG5ay
         CWkYS3tXz0LkPOotcbQ8OyoYWAfhhR7g5t6fyyeaNwOsTscFafgLcEYI0NRrlg3xQFTs
         cWIyZVB8poPa9XrbjiKHp8KQJKUhEaSGxJtn1IOiFDecVphGoZVkUr4CEEkoSuoY9qAL
         KfY21o9HhDag8h9Jmv73SbwnDgYZ3KEyUtdU60sa8R2ea03jfWo3AzjaXJ9u6ALoM/8V
         8IuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1776162508; x=1776767308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbKz3DQzt83f/P1RrZXts9tDEfXZSdSj2yob2J1dqQE=;
        b=UGKyHmtWQpxhpS5AwJhZWSVst41dokHijuUCKK5Actemb697xQVH+jAeGzgIu4OEhH
         XRCRnuhtXdqt5NbnCFiRo7+uJuBcQ9l7GCE2V4Vi1NSWCmtOUeADL4XUYtdk3hDpef2Z
         5xWaACAm3PbLJj0AqmOtUYT+paqM0KPih14BI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162508; x=1776767308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EbKz3DQzt83f/P1RrZXts9tDEfXZSdSj2yob2J1dqQE=;
        b=n05vqz45QKjpPBLud+STFQGA9pm6+BRwe8Hz7Z8wbRT7tOCv2lpbSGpdu9+SkOGIqO
         hes7/YYpX4A3N84eYlqxiWZukupm0FhDyXeELNaU4IH1ZwXk8soJmrlllnKBOfwc9Pgc
         eo4Zw8oFS8NBIKOPSLuOEjnKxQVqfp4nq2ZHFc2bbeY8SlLC+CUjjbZqUuo/ICUuxUxa
         pL8Um+xqiMc9CYDcVnvLg/2BcMlsCkuCWGH9oXII8Q/RjbzPIqdqapGtTW+MK4uzF1NI
         +hY7VIqQ9tK2//KmDnDQOZVRouHeK28cOw4gE5zG6G3tzw+FQO8fSuW4ZFLCTg2hu2Tc
         r9OQ==
X-Forwarded-Encrypted: i=1; AFNElJ8YnpilPdWKtJzOlBg6Yz4kUMgc8+FYQywZGqIZyolBe2oPHzedfXe3AwKfepTQuth9/TNjGs4ANGDl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2ErhQ8tI87A8VOyNqNGy2TnVgNPJQ0gvKryXy5hYOJuTDnWpQ
	YdHmqeuTcgh03lP3nWdukmTeURV7aj18rN9By+dcKIclXKFgplI1uO/m3gjKQZUEINQbw1AOYS3
	6ys3WoG4qx1PNiIW+zqGLWqwlYFFpN3HNh3HOUJ/hFw==
X-Gm-Gg: AeBDieuQZ/UQoLXAyn3/5ppjyIHdu82n6wxx73YB0L4VVCGazg0N2emiOQ3harAEm/F
	vw5kp21A6c09j0I6X/Jx+lqiJLn8c3WJFS3JB+fSWqdixsfDUV+iIRbteu9Qg+L9rC1zkdjy+Ai
	jTJ+XksabQi8abhE091zUqCs6vHBY/tQjuUoUjbrSXXD45MWFfFT2TepdcwW5R/0XKiOzyuSwiv
	YxK+aBWK7U6zY9mzaNwdcCC1AMOuwr8ZOW0LKMsiEwYIdY+fVmIl4hbvKhWAkETmuVy0jd/tPJQ
	CnRy7UkE78O0zLubRnb37NN7JquzHqavqQ5J+2F4VvOG/590NkbjjOuINYeEjjbPyG805HPyd9N
	8jdW6Ei2wZxdqDh9kpdTbUFTbkwMP33vxAkb2dySQ90WhrOrlCXitvtAd+g==
X-Received: by 2002:a05:622a:550d:b0:50b:2876:586 with SMTP id
 d75a77b69052e-50dd5ad112emr252830511cf.5.1776162507725; Tue, 14 Apr 2026
 03:28:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318071808.817074-1-pavitrakumarm@vayavyalabs.com>
 <20260318071808.817074-3-pavitrakumarm@vayavyalabs.com> <acZL65nbtfMCPHhq@gondor.apana.org.au>
 <CALxtO0nFEG2Lm18Fnb=YVQfy4-Qjb5+WtOxsHNOwYTy2Kzyb4g@mail.gmail.com>
In-Reply-To: <CALxtO0nFEG2Lm18Fnb=YVQfy4-Qjb5+WtOxsHNOwYTy2Kzyb4g@mail.gmail.com>
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Date: Tue, 14 Apr 2026 15:58:16 +0530
X-Gm-Features: AQROBzAtNMeWlauuG2iBoAxxFsqw-tyFJ9-jcGZZ7ytu53NJX8wZj4aZKG2Fw2Q
Message-ID: <CALxtO0kj4JfL94qY-radGcLwMeTnq4NQF7vPqs6giuhBinvALw@mail.gmail.com>
Subject: Re: [PATCH v11 2/4] crypto: spacc - Add SPAcc ahash support
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	Ruud.Derwig@synopsys.com, manjunath.hadli@vayavyalabs.com, 
	adityak@vayavyalabs.com, navami.telsang@vayavyalabs.com, 
	bhoomikak@vayavyalabs.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herbert,
   If the above snip looks good, I can push that and some more code
clean-ups/improvements as part of V12 patchset. Do let me know.

Below are the code fixes and improvements
1. Multi-device safety handling - All packed up inside priv
2. Minor code polishes
3. memzero_explicit inside setkey, spacc_compute_xcbc_key etc.
4. Algo registration clean-ups

Warm regards,
PK



On Thu, Apr 2, 2026 at 1:30=E2=80=AFPM Pavitrakumar Managutte
<pavitrakumarm@vayavyalabs.com> wrote:
>
> Hi Herbert,
>    As per your inputs, I've replaced the do_shash switch to use
> lib/crypto single-shot calls for SHA-1, SHA-224, SHA-256, SHA-384,
> SHA-512, and MD5.
>
> However, SM3 does not have a single-shot library API in lib/crypto yet
> =E2=80=94 include/crypto/sm3.h exposes sm3_init() and sm3_block_generic()=
,
> with no sm3()/sm3_update()/sm3_final() equivalents.
>
> For now, I've retained do_shash only for the SM3 case. Would this be
> acceptable, or would you prefer a different approach?
>
>
> Code snippet below for your reference
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D snip start =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  switch (salg->mode->id) {
>  case CRYPTO_MODE_HMAC_SHA224:
>          sha224(key, keylen, tctx->ipad);
>          break;
>
>  case CRYPTO_MODE_HMAC_SHA256:
>          sha256(key, keylen, tctx->ipad);
>          break;
>
>  case CRYPTO_MODE_HMAC_SHA384:
>          sha384(key, keylen, tctx->ipad);
>          break;
>
>  case CRYPTO_MODE_HMAC_SHA512:
>          sha512(key, keylen, tctx->ipad);
>          break;
>
>  case CRYPTO_MODE_HMAC_MD5:
>          md5(key, keylen, tctx->ipad);
>          break;
>
>  case CRYPTO_MODE_HMAC_SHA1:
>          sha1(key, keylen, tctx->ipad);
>          break;
>
>  case CRYPTO_MODE_HMAC_SM3:
>          rc =3D do_shash(salg->dev, "sm3", tctx->ipad, key,
>                  keylen);
>          if (rc < 0) {
>                  dev_err(salg->dev,
>                          "ERR: %d computing shash for sm3\n", rc);
>                  return -EIO;
>          }
>          break;
>
>  default:
>          return -EINVAL;
>  }
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D snip end =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Warm Regards,
> PK
>
>
>
> On Fri, Mar 27, 2026 at 2:50=E2=80=AFPM Herbert Xu <herbert@gondor.apana.=
org.au> wrote:
> >
> > On Wed, Mar 18, 2026 at 12:48:06PM +0530, Pavitrakumar Managutte wrote:
> > >
> > > +             switch (salg->mode->id) {
> > > +             case CRYPTO_MODE_HMAC_SHA224:
> > > +                     rc =3D do_shash(salg->dev, "sha224", tctx->ipad=
, key,
> > > +                                   keylen);
> > > +                     break;
> >
> > Since you're doing a giant switch statement anyway, please convert
> > this to use lib/crypto instead of shash.
> >
> > Thanks,
> > --
> > Email: Herbert Xu <herbert@gondor.apana.org.au>
> > Home Page: http://gondor.apana.org.au/~herbert/
> > PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
