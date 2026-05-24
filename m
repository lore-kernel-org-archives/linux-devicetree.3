Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A86C23FC41
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 02:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779590874; cv=pass; b=t00JChjXMubhw2y8l21Zun0Bip84FFaEbKWonSaiDkLfjLaVEbw9g2WjwuxjYLKRg6le5rs+RSNaq9lVXXbKqyE6wloWxzGYkNgqOdLpmzUZ+HOVDHGkDa55F/8jDDyvMM0PRqzfAaq2lOkMnZqRx7noUxj8T+7+KykFYSLcPLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779590874; c=relaxed/simple;
	bh=I/N/K8WvFPQceqDzSD0crzbpbH6Dqlv+HRbp9QLvdC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cb4TqE+dEj9e+vBhZecwoU4NrL9yuitP8c88EX8m7kuzD9gwZ4BH0KnymW3hZ8m+NGdnDWUn2mp4UN0/Kpm9q4rgbBii4CDFUapjuJ7nP1zUaUpprrr6fwUXt30SsO7zw9cDkKxPDsc2Yktw24lN4uRpdDPmlcdv+z2nIYbj1qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LASGv/e9; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LASGv/e9"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39397d63804so34628301fa.2
        for <devicetree@vger.kernel.org>; Sat, 23 May 2026 19:47:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779590870; cv=none;
        d=google.com; s=arc-20240605;
        b=Up0Jr9NLHrS7ZJpTKQnvreZwe8aJtU+xT9YVczYPK13vyImOYF7aql/U2WFIw/p01u
         kM/HPxUV0fNNOVCIVrru0Lf2asAVHJdB/54EBKp8EBUlvwKjDPblsUtbPj3uQR24Vos6
         EjKaOcT0UaRPLHjiHux7Qd9jzG3uz8MDmt5QG/dPRx5tWNZa/3zNkmp323dACIiayC4g
         y4vFH9dfxlwMK6wE1oYhaqok4MuG0inXGsqB/Owwmlp2/iZIlFCvTIMV8q+4GJ+vFEtd
         vmJg1nug9OFTtynFWOfnvyat343tu6HSbs7yVWfSvMgSvncj3BiHu7l7iYXrGg81fMdp
         XXxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zvmM7qHda/oxQGoHR0NxIjHhHvelNuIoX0E+Fww4/EM=;
        fh=PNY1T1nIoH/No1aD1vCFSfr9GoEtSe0F7m7bGLyvIic=;
        b=K35bED1a9wF+Q/Hhx6osO8tbZnWKkZLLsVcWdzb9eVj4rS4lE8pl0MTrIPVlu9x/cQ
         adHmEet6UZHcLY4unwaMsHGWRjX0vJ+UJxdEoZKL5OpMmwlGXcHW+N/1+ctCWpsdwLuS
         3i1RFRcKIFuKcTORCeY+UMC6YhEQ0Ni+9yuDy6qaXqHyKMr8SdKKTfPSnr+6TCPJDYM9
         yiCNEX0tvdz0iQOsmHHI7qiPNX/lOS8r14dyYSROF95c78umP5I1Reh9wjFmpzqblAt9
         SUd3kUMmQR59TkXwW4PekwJjNn35MGD+wPTc34CZOjhU7RP3BPedDLSO7PBI+5DCfy4A
         HDWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779590870; x=1780195670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvmM7qHda/oxQGoHR0NxIjHhHvelNuIoX0E+Fww4/EM=;
        b=LASGv/e9AgIP9Q8Aspf8xmei/O7go/HDBiZ3fxngj5173H1LpaTnxTujRtqO7I2yzg
         VAfnWl4sD1kWVeFj7OyKRZBCylaRxOp7w+5I3dToez+U/56oaa2MLVMeLkjbPIimrdBK
         d2CQhZGYMnPd54MC+stYCACeStkb+Os60xY6nyyEyOnTu6/Scvftv8IA0p8ExrX2sXxF
         wSi7dQyktZabRhSgQLKLSJfL6ynRdBy0DHV8ryqZUG76biVc5QnWEutQsNzaJ3pxlhex
         qF8sZONNJruJrUJi7XAL73hNDWqQvyqTpQamUEt3YYL1TAI1cxD/z7FZEDN5MmwkwInz
         7u7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779590870; x=1780195670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zvmM7qHda/oxQGoHR0NxIjHhHvelNuIoX0E+Fww4/EM=;
        b=otjOpzdQO9LAysVpcbxl1i+dy0qgBopzhsr+mmvrx5mxuSJTT1Fmtpmv7Gminn9Oz2
         LyXE5p+uoRFeTVwZscjEGqfEjECtbcc06q7FwUO57Rx1iTYclJYcjCEAfNzF+YM8pDDj
         6Tw0E8tus6IEhjsuiVFw/BFBznxcdnarfoD0CJUmiiHvdVYEQDY9UvVaFgFnvYCytBhr
         JAGVpMycj3e/iB0wtFWCNA16FMIGDNmiGDKSxed4066xWfQoUvbJB9HP0xooIKfOF8GC
         5LapV5Gw0blQUMuPEW+2vj9K0yWZjzIgIz+Z1REYskaOrHYuZjRqKm/wyrGRZOnakuWo
         ZKaw==
X-Forwarded-Encrypted: i=1; AFNElJ9tQykobPGjP7566vZuhMLfjA3x9dacuNSIMgPuQaBxAooIF75cGgZBQd3CHJ+t6hYC/7Sl26e48SsB@vger.kernel.org
X-Gm-Message-State: AOJu0YzoZZVP/DbgFDF46udMNjOYcgmcVgpn9JSRRU3gi5BCnKatWP5P
	mJJI6elGFNWn3GZ631EmjVlk/rLgAeXDjUmLricm/Mq//qFzjp0UeLz8UOfIKQuxbyF02ASZjuc
	CMl8zTy8uyHA9kPhEwnheYgulx7HQOM4=
X-Gm-Gg: Acq92OERItKztlaOq+XNz21Gt+k8UZPGhn/ahTyYCsiinI+bE4OqJ7DVxWm6dWVfeXP
	/TiSOfAodhMmtBqVG3pyMoJwpZodLzhxDEli29aABFaAHxYDxl5LiVa4UVDK7tSPp9p9WrTegrt
	YCC+z3QWsCbWP6fXSHS35B1kSsXG3GtxmvPPqi6qAIuIeRMwvTlr24oytu8Dfia2fRRtTZnUy4B
	I9C08je4HLq9JjOzK5GR+seIbMzsIjAji+bpaswXQT4Fg5AWUAjLEGphEGKPIlZBkuYpG4PGSR5
	rnZAoeJtJmmaq7KAMI9EbEeoDBJnCR3w8wMGqwYS
X-Received: by 2002:a2e:bcc1:0:b0:38e:1dcc:6c77 with SMTP id
 38308e7fff4ca-395d8d9160amr30829091fa.29.1779590870041; Sat, 23 May 2026
 19:47:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518220228.63322-1-piyushpatle228@gmail.com>
 <20260518220228.63322-9-piyushpatle228@gmail.com> <20260520112438.4b396652@jic23-huawei>
In-Reply-To: <20260520112438.4b396652@jic23-huawei>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Sun, 24 May 2026 08:17:13 +0530
X-Gm-Features: AVHnY4KRxiRMaLEFB1hv-DFh55J-HHbP41FD40lpNrpCFFnEtyo0HaJITqXoBrc
Message-ID: <CAMB+xkaeNGLv2nGs4gkGGT-PFpsC+Vy=N_wUgga6mRbjSaXQrA@mail.gmail.com>
Subject: Re: [PATCH v9 08/11] iio: adc: hx711: split variable assignments in
 hx711_read and hx711_reset
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andreas Klinger <ak@it-klinger.de>, 
	Andy Shevchenko <andy@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 3:54=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Tue, 19 May 2026 03:32:24 +0530
> Piyush Patle <piyushpatle228@gmail.com> wrote:
>
> > Separate the initial value assignments from the declarations in
> > hx711_read() and hx711_reset().
> >
> > This is a small preparatory cleanup before the later loop-iterator and
> > variant-specific changes adjust the local variable layout in these
> > functions.
> >
> > No functional change.
> >
> > Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > ---
> > No change from v8.
> >  drivers/iio/adc/hx711.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
> > index 30e1ce321747..9e5cafa1e307 100644
> > --- a/drivers/iio/adc/hx711.c
> > +++ b/drivers/iio/adc/hx711.c
> > @@ -159,9 +159,10 @@ static int hx711_read(struct hx711_data *hx711_dat=
a, int trailing_pulses)
> >  {
> >       int i, ret;
> >       int value =3D 0;
> > -     int val =3D gpiod_get_value(hx711_data->gpiod_dout);
> > +     int val;
> >
> >       /* we double check if it's really down */
> > +     val =3D gpiod_get_value(hx711_data->gpiod_dout);
> >       if (val)
> >               return -EIO;
> >
> > @@ -204,7 +205,9 @@ static int hx711_wait_for_ready(struct hx711_data *=
hx711_data)
> >
> >  static int hx711_reset(struct hx711_data *hx711_data)
> >  {
> > -     int val =3D hx711_wait_for_ready(hx711_data);
> > +     int val;
> > +
> > +     val =3D hx711_wait_for_ready(hx711_data);
> >
>
> Trivial but no blank line here. We want that error
> check closely associated with the thing that set val.
>
> >       if (val) {
> >               /*
>
ack! will fix in v10
