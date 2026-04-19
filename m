Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB0633689C
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 11:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776599470; cv=pass; b=h//LsW8MBSUPgBXeCKe+bX353Gr9euTk9/PfdQKDhdQtRr69f+52WYKjap/n5kJKHjrCb7ybI9xFg8T5ybygyMk3kLL3a7al3SKoHRHMgW6gQDYrYw8epyf7BdCtEHKh8hdqDpptIKgRCLNf4OxiDaug7Vdk3Ut8J4aovHOMsC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776599470; c=relaxed/simple;
	bh=YFp/ewbau35oN7gDA56jyAxYeb909Rw3ZdgCe0T18io=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnl4mMNUDL6OjYGKx5aOFvGojYsTIQMsiE912GTtlTiMWIh5R+7OzcN+a/v0ZaIABxZMqElBtyGX5HWwlVFiYtRLIR18HpHjGRKFPPAHqYIt4wT7918+AO4jHyR8uSSS1lZ0btqj+cDhpO8N0RryfuSXjLQ+k58nH/21iNs6z7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULlXizHi; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULlXizHi"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d77f60944so1628657f8f.3
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 04:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776599467; cv=none;
        d=google.com; s=arc-20240605;
        b=e4qlD1zGDvNSWYlurzEU+6HSAvvqLprQIj9HgdTeJoi9FYKNcChHofWj7jQr55XxdU
         NBAm2k01CByYR+8F/GY5ohUmD4FVyZuEJ3ccxi73Zf6yx+H7bC02lmgvLUQFqgRR64rr
         uk50Xk+k1z/ZdXJ6KEcZcExIM4IIitrFwsjUyraI7QIb5wyRIhYG/0Cf5Ivd/wIMgmG4
         g6LwWBQGiSLq5jtK6w2wPlOv4CqpyawBGn61JPSC7UmJQwagBuXwYG7TSAwpMvN3c1iZ
         HP8dXS9Iokvx/QM6xJMvmGYHAxRb22tXYDnbNICTs+IiJjDSEOr+J5HvztoW4WRnnqaN
         sICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tncWQPfYyaqZlRgPygAaRhu74GKThm47UJdwkoBU6aE=;
        fh=MlGuxw7BA5XtNl35kKx2v0UUDcmCcnURfpEtZAIp/rE=;
        b=icI7Js14far3chGFYYUoB2bitXkkh2MwIT4kDricrJWraRLY6eT+UCmXVbw7DrR2Q3
         +Jqdz/pdHTWsscCq+s5ARw7JghIeb1fnnJFrpY+IEcY2w/OIGHmbWnTr27BqsevFR7tS
         EZy72EJgkgpOaNkolke2Fvuj52EAGaNnzdMI6CIjaHLcFwlOzGUlhWjV/bnwaeepoAxW
         Sjj1bfyFeXKW/jrwdut6Zf3ayfDrqIQovjQlgHer+8bbJtUK5wsL+/fCi5iA2tU5ZFqk
         2obXB895MUAqwicA6rSUD/T8FGpltIsYcrkrlwVmUP/gBSfoC7wWnTNVnK8xy3ojKYBw
         G+rQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776599467; x=1777204267; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tncWQPfYyaqZlRgPygAaRhu74GKThm47UJdwkoBU6aE=;
        b=ULlXizHiYDjudHl9qXhJkmL+V3dEip6uM5SHtuB5Z+uKFiJJIHbVopdSvws/mWI5Li
         AVhXE1kDBm06a919Lz6TfPql8hdQ8WRki8hLSxwzNrUpyxnIb3UckqJbzecVetT1PJH6
         HfoAu1PJhxvVRtmYAojgLLcqpK8Jtn/2nu2dvZC6HomStMhvvp2MUREp4x15gvCR6gjl
         AZ6b+M5VW68nyHOeiiXRFIjl/bmvu2eJNxcDzxWobI8w2IBJDH6I/3l5CORfZF3ed1Om
         SWsW5vnemQIKTD51TQBJCMrtP5GLxavNCo/aoexnZ1bP47RM4Isxkm2cG8Dqf0UtppHc
         RY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776599467; x=1777204267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tncWQPfYyaqZlRgPygAaRhu74GKThm47UJdwkoBU6aE=;
        b=H4VaH6Ofrf+F9Mynr/pOl4FQXhZVdzkNLwd+eIjl6KgvkXKTWy2jKx3xNKis00l3aP
         aGnpBvwMaATI7arFP68hG9lNi1JYudx2VKuaw3eP9hvHEMoBs+1WTkeXwZHnAqnI7jEp
         BNV3+0QhTMf0B29x9+yTTwUMQSZvmbc5xIWBJfiBVs9xEaFe6hHSAUs5x9QQOF/rzmK6
         lZxuBRL2AzKEnfMu5jHhxQbfrbATSRjJ4fahlC5LPFHnSzkP4J5MRnvaUF6FYB2yQVxI
         XsxVpUWAgscQZMEWIyG1YpzqKVrda6PlDagpW5JFAc5/nQwkwmDeqSMHbAO9RYr5lrZI
         1Djw==
X-Forwarded-Encrypted: i=1; AFNElJ9gXPhbKywbkwGj77VCO94ANWbASHnR+7ZdzW/DaHlAQ32rHDLK9iAoKII83C9m9h4q6f+EMxzBlqc/@vger.kernel.org
X-Gm-Message-State: AOJu0YyymkPYk4yfXtLkLc+OmPeQVNtpuz2beeTQkZebOISljgpDFPz5
	YYqTPidqC9yh9FfHwt1Epjst0TnW6R1CFhwrC3CQrNezXkvhYmOLpf0ZjzkGUzTge1Rk+yYZd2p
	dYdW15viHyx2u06v5xRB0BzEbiyAAlBw=
X-Gm-Gg: AeBDieuPQQsytDA0Yx9XXcd1JZCFk7xh5CEiC//MAgApCwsw70/olEM9kh2KiKxdBHi
	WwHSF0tU4X9MwKoc92Ht/T4PGfBO2W1FeGlWk69++T2CPpJyc6nqpb9XuuKpAAGr8jv+Iw/XRLM
	eGTnn1MOtek5uCdsWQFo2iVH9Dlwt7Bvb9n9MXuyFqz+hEg8BIZce3W/udHPTN/JXO5ftHDu6ZK
	c6PydgJXEWLyhTBiGf+Ngg587sn0W4c2gMliO4/xT3NAleLaAcBNzGsCAfwPcfpUu5oyK7AF/XN
	PazM12t+b7UCGZDYySQ=
X-Received: by 2002:a5d:5f82:0:b0:437:711c:8754 with SMTP id
 ffacd0b85a97d-43fe3dc842bmr14658844f8f.7.1776599467085; Sun, 19 Apr 2026
 04:51:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419083125.35572-1-clamor95@gmail.com> <20260419083125.35572-3-clamor95@gmail.com>
 <20260419122950.67355f4c@jic23-huawei>
In-Reply-To: <20260419122950.67355f4c@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 19 Apr 2026 14:50:55 +0300
X-Gm-Features: AQROBzDe6HM4uuoI0FaMpknWQm05f0KEdcarfEIwiYOb4XhXkmoLtebse2uUQdc
Message-ID: <CAPVz0n1iB9iC+TFrGK5ajXjdk8-g8vzr4ZbXdvW5=F8iukanaA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] iio: tsl2772: add support for Avago APDS9900/9901
 ALS/Proximity sensor
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 19 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:3=
0 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 19 Apr 2026 11:31:23 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > The Avago APDS990x has the same register set as the TAOS/AMS TSL2772 so
> > just add the correct bindings and the appropriate LUX table derived fro=
m
> > the values in the datasheet. Driver was tested on the LG Optimus Vu P89=
5.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Hi Svyatoslav,
>
> Just one small thing.
>
> Experience has given me a strong aversion to the use of wildcards
> in naming within drivers.  They go wrong too often because companies
> can seem to resist using similar names for very different parts.
>

Noted.

> > ---
> >  drivers/iio/light/tsl2772.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/iio/light/tsl2772.c b/drivers/iio/light/tsl2772.c
> > index c8f15ba95267..8dab34bf00ca 100644
> > --- a/drivers/iio/light/tsl2772.c
> > +++ b/drivers/iio/light/tsl2772.c
> > @@ -127,6 +127,7 @@ enum {
> >       tmd2672,
> >       tsl2772,
> >       tmd2772,
> > +     apds990x,
>
> As above, just name this after one of the supported parts. apds9900
> That doesn't stop you using it for multiple compatible devices.
>
> Same applies for all the uses of x as a wildcard.
>

If this is the only thing keeping you from picking this patchset may I
resend with apds990x fixed right away?

> thanks,
>
> Jonathan
>
> >       apds9930,
> >  };
>
