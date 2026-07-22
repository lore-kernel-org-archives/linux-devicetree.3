Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCEF35E1BF
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784710894; cv=pass; b=HwafEzItGIchuismLyIM3s7mviyakD/42ihqEwaQzFYvMmWIaAUJcsOThcSVL4oMYZ2Gy+Whovrwbj3vuWL5giQ5amlRlwTEAyg1Rd4YalieSja3xH7P8PVv26aj0s7ngi0PAo14tfn6eX58mBPfqofzaggDZgI5BGl5NYIQI1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784710894; c=relaxed/simple;
	bh=kjMhhSUJeM58LyEBWOqNhoBXbBuuVqDLE8DYLHYzEqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENGgagBCBuFYbDcnE7835/NEZPLyFabLk3p/0ItPddRjRrUwpQsRrWHsRgOUdYMoTfGCe+hsxYb7X948YN+K/2X0ai1UnrCsyt7Ftu+Iw9twGNqCPPv2tJEfsH/Sgdg7S3FtZRKtZgIaE9MZyvitQYwGxoj9Bbc7rYDuBYGMaqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mXJbWsPe; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mXJbWsPe"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-81e69a2db34so74316957b3.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 02:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784710891; cv=none;
        d=google.com; s=arc-20260327;
        b=TpzJiXZjSzPo/0/FhncFRGtd0XUPuUHb3hKXYUR7kNIJVVHQ/iqojPhVLisbHjkQ2V
         +2n4BoKmD+AAUIrEL9WI4dB/xtrMZI4efI4BX31Zi4neY0nIq+0J1NaVa4zhcXEDfOsp
         vV2HR5xZcz8ejHCW9GzdRuEi6E96oG8w6KD5vFifmc0X0ZUgyeMUSOI7Iv/6UbSMl5+g
         /ko3p3SHda6mEqyjVKrEiPcNNoT2pW/3wJ7QFUvtO1m6kd0kNENYgkbxXnyUK1rsh9+L
         ECs5lIvZHPCsZc5nq+kkTw3vw7GIQY8aAcEpsm17I8i/MBAub2T094PIs4c7YJIPpMdI
         7nCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BVQ32j56Dr60NJMwmM+X8AwJaAcbdmT9panK+KSnLpY=;
        fh=22HSf3hphsnfhu8LfnA8BO8wIewP1034C5rDRg/3KrE=;
        b=WvxwmpMrbIN9XSuI7fJ6VLdVZ6W3elSqNVq7hFSFN+kHfk77D8T+nPuqB8hKUkRQjy
         QXXgYy4/k/c1QzzZKU4HJ7ZavyiZMnHAe4E0uLaZSkj2NaVkyFmUlene9vAcyvmmyvcu
         /TGpBzlba18+zG3hmCltQ661vUcFGeqjFXxsS/9sXOBiUdK7eWnihDahzYJ6gPxIAtKa
         qg4bhxManQOoDfKa5yEJndCXaeo8ySB17h8F3iTBVMbXiYYmAXJ3BuNsoqaNVDz8c0r/
         wNKbo4MlHFUVqhPoEUalggjVYzNk3IrtEmKkUCNzAJIPKQIjrA+vEPC9HqpDeFyYOcUi
         XfnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784710891; x=1785315691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BVQ32j56Dr60NJMwmM+X8AwJaAcbdmT9panK+KSnLpY=;
        b=mXJbWsPeCO8FslQIu10GK72HjeWHi1GFyymj/tGTDhE5yi1vHwlRPV046PHgZ7VpF6
         NEAxPt8ne/efXzlFDPF3d0AZKJ1AtDazYWogGUm5jeMFvwz4KLohfxv1cU7ZnMbv00OG
         XoBwDO7yJNVGOswjqco0Vgsms2BhEWcHJ8IV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784710891; x=1785315691;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BVQ32j56Dr60NJMwmM+X8AwJaAcbdmT9panK+KSnLpY=;
        b=nozM612jYP9URiyWMDFY78CqMylrkK8vzLoZyLcAtJeIg+G+dSOL9YQus8TcGyjgz7
         4eU6ceBuFX+Za8YK7Oklis3Tsl3r2nGWNe+Av+fqrvDDjUQGcDJp4VcYpTIeBWalIYTL
         xXqNm99dlT0zwBLao96+YTBbNBeZxLEL4HCKDqk5TvZs7tGWjOw/Rdc3204PaC0cvWIx
         Rt32Ne0xb0jvRcEk+OvQvA6bu4GK2E/ovz8rUiNFUn0m1fdCaZsLwnCpVhIZHbTdnOpD
         MdDvh6nR/dxooc635xGPKVLGp/HN9/YQ6L6Y2f/Vxb/vqRC7aNQ8W1Xfns8iDEunnCVi
         cYKA==
X-Forwarded-Encrypted: i=1; AHgh+RopJteETK1UiZhU/6z+edAosw9TArfNeRKZCxnCiiB31Rp0RnSnne9fhwJqrE0DEQDaZW0Dp1nFUGQ5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl1vKIdKkPgLD4cZzFyElhyszbmChLhOOkxOStM594zkm2qLmi
	8+bfMmecnNAd2QQyUmvMFhskZ6lf33lctuvIUgxPddUGPuYyMuaXMG/H/hLXKT/mHUuFccOJNnw
	Q3IFOx2Jee4kw2bNrPTY0UVtebEHgceojATDfVSQE
X-Gm-Gg: AR+sD138Q3pbEFRdfornXIfyLOOBBtuMzzEfqc83f3KDpMYo9WmGIIiFA8XXsm5Ukma
	LUfRPLwyv1oEln2eOsKgmQuFA9zOjHFBlYhcFs8IhssZYoEen7pDjwcKDfRvlPyL6G6sugi0oID
	2UHvhAlx/+IVAidmuZnvwsB6Kacx2cgaDFLLnddHPHyvmucoeXZDNs0s8gJZ+S3bpOxUr0NBPUC
	IWk7cZFhou3qBv5HYRgw/MhKTrf6x4JrDDWstNul/7pqogdZoUDaf0XuDh7Q5FaKBruKcw3e8Q2
	6Wiu03cRkZaW1mUE
X-Received: by 2002:a05:690c:e0c:b0:81e:6a1c:e30b with SMTP id
 00721157ae682-81ef28da7b0mr69266347b3.67.1784710891191; Wed, 22 Jul 2026
 02:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721065413.2306137-1-wenst@chromium.org> <20260721065413.2306137-4-wenst@chromium.org>
 <CAMRc=McsCRBxXMj0xC8H0cgdZZ=Z9_4u_DS9b2z0pLE0=gZr+g@mail.gmail.com>
In-Reply-To: <CAMRc=McsCRBxXMj0xC8H0cgdZZ=Z9_4u_DS9b2z0pLE0=gZr+g@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 17:01:20 +0800
X-Gm-Features: AUfX_mzymMOrnzz3ZSisQQjvbDECVUbqfaXF7TwtpwvIT3XYymwiPHVmpWvFgt8
Message-ID: <CAGXv+5H_V+J0cvrYjMFdKAQVrPKxPdtimXMc+hwHenwxhb9mDQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/16] power: sequencing: Add pwrseq_power_is_on()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 5:08=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, 21 Jul 2026 08:53:58 +0200, Chen-Yu Tsai <wenst@chromium.org> sai=
d:
> > The power sequencing consumer API already does power on state tracking
> > internally. Expose the state to consumers through pwrseq_power_is_on()
> > so that they don't have to reimplement it locally.
> >
> > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v5:
> > - Reverted back to returning -EINVAL if descriptor is NULL
> >
> > Changes since v4:
> > - Make pwrseq_power_is_on() return 1 if descriptor is NULL, i.e. if
> >   the descriptor is optional, matching the other pwrseq consumer APIs
> >
> > Changes since v3:
> > - Added missing stub function for !POWER_SEQUENCING
> >
> > Changes since v2:
> > - New patch
> >
> > Needs to go in with "usb: hub: Power on connected M.2 E-key connectors"
> > as it is a build time dependency. Bartosz wants the change on an
> > immutable branch to pull into the pwrseq tree.
> > ---
> >  drivers/power/sequencing/core.c | 18 ++++++++++++++++++
> >  include/linux/pwrseq/consumer.h |  6 ++++++
> >  2 files changed, 24 insertions(+)
> >
> > diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing=
/core.c
> > index 02f42da91598..72b96d36920e 100644
> > --- a/drivers/power/sequencing/core.c
> > +++ b/drivers/power/sequencing/core.c
> > @@ -968,6 +968,24 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
> >  }
> >  EXPORT_SYMBOL_GPL(pwrseq_power_off);
> >
> > +/**
> > + * pwrseq_power_is_on() - Queries the last requested state of the powe=
r sequencer.
> > + * @desc: Descriptor referencing the power sequencer.
> > + *
> > + * This returns the last requested state of the power sequencer.
> > + *
> > + * Returns:
> > + * On success, 1 for on and 0 for off; negative error number on failur=
e.
> > + */
> > +int pwrseq_power_is_on(struct pwrseq_desc *desc)
> > +{
> > +     if (!desc)
> > +             return -EINVAL;
> > +
> > +     return desc->powered_on;
> > +}
> > +EXPORT_SYMBOL_GPL(pwrseq_power_is_on);
> > +
>
> Didn't we agree on introducing an enum to make it future-proof for when w=
e
> also pull in pwrseq_is_controllable() from Loic?

My bad. I misunderstood and thought it wasn't needed yet.

> I think this should work like so:
>
> enum {
>         PWRSEQ_STATE_UNKNOWN,
>         PWRSEQ_STATE_ON,
>         PWRSEQ_STATE_OFF,
> };
>
> int pwrseq_get_state(struct pwrseq_desc *desc)
> {

I think you still want this here?

          if (!desc)
                    return -EINVAL;


>         /* Only once this is upstream. */
>         if (!pwrseq_is_controllable(desc))
>                 return PWRSEQ_STATE_UNKNOWN;
>
>         return desc->powred_on ? PWRSEQ_STATE_ON : PWRSEQ_STATE_OFF;
> }
>
> Bart


Thanks
ChenYu
