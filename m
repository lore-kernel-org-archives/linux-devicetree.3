Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCD43BB677
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622141; cv=pass; b=dtXjjbkDFHPMS+PakfB4tCbxJIc2zCcFbqDfoJmK0bs8rmL3i2A5mWJ5fG9XTyYau/VKZ2dXOLZpKB2W7rkpHrkCD+sLshhGj374YPG2WsCqh+KOSCUi+Mg0knB1srni+a3k1vl+VwjvItQSvHlhAZrRKnNHsPpYUZm8dH3fqgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622141; c=relaxed/simple;
	bh=PbIJX6UD1ZoB02wL/E9q33eYJBL+Acq3spZ3mV7eLNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpueqiASAKcikHboCzEkmHCRLL9WhcMQC251EAsz/YMR0fRKKzD8z49h5lb8LTCr8vvZO4cdNfZYK3EndSTrvPuHOUOJmtP3ofW3IuLDTgNorl5z06/X18O/X4e5i3rAzZrhZqMz19NfdHl47QA+9nvwnTA17lebx9KL/aN5ZTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F1XjJP9R; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F1XjJP9R"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-80c5cb9a888so92632387b3.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:22:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784622139; cv=none;
        d=google.com; s=arc-20260327;
        b=ETkmqreEcEctE/qrwiAY1Y+b39+CBSxQR5O6Xz5xtem5pkUXmQ9jdrdHvVr/g/T+cG
         JTLz47oFZCqUy9L8AhlmcrB68GSp041zelMrqcaRrNaaBF8t6hacRyNvNRZo3LJZ9xVJ
         ZIZIGpjrZtUwbcFBO5i7p4BJPL1rBbUnVNV1THUqvvq4NuzkU19u2j0NQmBLfQRh2evO
         ikVq3Dmjf7Bm76TBqSDICVtZADVD3s3yFB2/66+s/ARFhvhyWvuVfQpbOpguSzyeSm5w
         2UnuakhrcouXYi5/0KNcd/y+i2mOfV5+w7gxfAkD1a0hZY/MFASHbSE24FY2fJE6rr+p
         Y0Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HYMCpupp8yQkTntIzJ+s6xUACTMSRm9maqPbU9ARNc0=;
        fh=o67PwTBaVNB+pEFKzOtSDzYeEolOIpXhYX8JlKkpsq8=;
        b=QkANmjQ0bVHL1fzc6nXqv4ZBzrm5UC9hLWTRS50B+F4N16dROdt3QSpc/TQuLodxuY
         Se9md+TNLkwjxjD9I0gKxzEgXeQotHNGixozOuHtVGCebFNe/I4a8K3XseS7BFZWcjzq
         23ZnIJmI58PGbc4wRHsll7SwWCRbVX0HHb+y4jxRkkwYc91ywpyDlI79lYlP7okhzeRJ
         ERjdi0RDOTCfd9NubVM8/3uKSZPt0zuQPGET63I8BZguZMcG2+oS7/v5W+E4zgqiW1ok
         AR8fh4HgntUMtht8GKxrm87CaWTxFCTGfECaDXhc3KzBZVvASr7MD3hfDsq9TmSo23MU
         3aHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784622139; x=1785226939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HYMCpupp8yQkTntIzJ+s6xUACTMSRm9maqPbU9ARNc0=;
        b=F1XjJP9RSududKCLo6EeKgKou/kEV42yt4KUpQBLEwNmDAK9KIVeC+QT0N3l723QsX
         /Kmz+ZNc/ahHWhwYxu5Ge3w9AZXFrhOW+JhPCZUlbGI44QOZetIHFvmGIcnrSKnu6zgY
         /4I/5fcpD4lMTu49IoiH2eXbPiRcw+8rQWLfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622139; x=1785226939;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HYMCpupp8yQkTntIzJ+s6xUACTMSRm9maqPbU9ARNc0=;
        b=AiYhAYks4VJYsMwhxyqhhjLJjlJqYCd/YJ0S4z0X4PkCXES8K2UQf5UBLM0W2IFA1J
         sFk0VvMGhpVMkF9WNO9ld30X0HO8h0nQrXwwBsSBqWAwZgKVevw2JqUS/VIXuVW57tpH
         asyLMbULKFotTJyd6FGSdi9bz6ZH7SEneE6eQOfJHqrLjUDrOa/HiQAfrr6XgNbfU/Ux
         44obJv1NP4QbKaHJzpqs2WeWIGwqdDPFHYJaY09frv3anETPGQD6sKPMhR4VFfiMZgsY
         Lm/oO/YAg81a++41I9/LL2sOUL5GH1D8Mjj/y874DTb0pqzIh5ng3QdNoyaOOINDqnyg
         ZoxA==
X-Forwarded-Encrypted: i=1; AHgh+RqMNBDUCfT/1N5NrSZDqxiw7MxPfx8XsQaBZkK9Fo5KVaZ41ZVkL9jyLeAutVUBQ0CmE+gyLQDQ2x0U@vger.kernel.org
X-Gm-Message-State: AOJu0YwybZOA82PatI92OmxAk5Umdi1icNJNinGt8L47aNnv8rIQ2YKf
	w9JC5uxfhW8UtNY9LHU18PO/vs6vMO3fJkwdlsfi2UWlUfumSlQuAqspPdxXaFea4Ddmr1OJBbF
	NI/z5kBEFicdqQ++5EMsbztXtwEudwGL0ZJgCIwEk
X-Gm-Gg: AR+sD13j/LIHqWmpTWmO2IeHZEmf7hcDWiNt/7yEO/Us005sGQVpNof341ZBFbqrCTX
	YWEFKGdTQjy1xwB8HcU6Icn+eA/FwNACuJVsKKmMbujV0+Eu0/pVptTZ4h4urQawF1bbon5gWKi
	ca0pNeKGkRVH7lZYaniG543cid1LuEOL0QzToWiXH/K2GwrRlM9CG4ktlk8UyLrGbERo3MCzR2J
	+dsvzWqGUZ+aeuPAUzR5HPRfYonos4+o1rItUj2gL4csjg+WBMHadWjFzoe4lnTNV/6SWogMohU
	LKcwvDFPX9laV6BIpuyH++DbyA==
X-Received: by 2002:a05:690c:7342:b0:81d:cc00:cb8e with SMTP id
 00721157ae682-81ef27f1cbfmr54139227b3.37.1784622138845; Tue, 21 Jul 2026
 01:22:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721075226.2347933-1-wenst@chromium.org> <20260721075226.2347933-2-wenst@chromium.org>
 <20260721080829.4153C1F000E9@smtp.kernel.org>
In-Reply-To: <20260721080829.4153C1F000E9@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Jul 2026 16:22:08 +0800
X-Gm-Features: AUfX_mxfs-owsFVntpy2TfnfT2PivUx0k_MVeEmOEDZDOObrM7yQy9fA6FUILhA
Message-ID: <CAGXv+5ECnGRwdqRLQG6EQ_bqaezYCrMkczn=MP=wXfLhG3Sh=A@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] regulator: core: Add "enable and wait" functions
To: sashiko-reviews@lists.linux.dev, Mark Brown <broonie@kernel.org>
Cc: conor+dt@kernel.org, dmitry.torokhov@gmail.com, robh@kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 4:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] The prototype for `regulator_enable_and_wait` in `consumer.h` in=
correctly names the delay parameter `ms` instead of `wait_us`, inviting dev=
elopers to pass millisecond values that will be incorrectly interpreted as =
microseconds.
> - [High] Sleeping for the consumer delay while holding the recursive `ww_=
mutex` for the regulator and its entire parent supply chain severely degrad=
es concurrency, blocking shared regulators and serializing async bulk enabl=
ement.
> --
>
> --- Patch [1]: [PATCH v3 1/9] regulator: core: Add "enable and wait" func=
tions ---
> commit 73793dc0bdc3050ff22074a860d438d5d9cc0b49
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> regulator: core: Add "enable and wait" functions
>
> This commit introduces new "enable and wait" functions to the regulator c=
ore,
> allowing consumers to ensure a minimum amount of time has passed since a
> regulator was actually turned on. It adds a last_on timestamp to the
> regulator device and updates single and bulk enable APIs to accept a wait=
 time.
>
> > diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> > index 1797929dfe566..d14ce86d8f7bb 100644
> > --- a/drivers/regulator/core.c
> > +++ b/drivers/regulator/core.c
>
> [ ... ]
>
> > @@ -3159,13 +3162,24 @@ static int _regulator_enable(struct regulator *=
regulator)
> >               } else if (ret < 0) {
> >                       rdev_err(rdev, "is_enabled() failed: %pe\n", ERR_=
PTR(ret));
> >                       goto err_consumer_disable;
> > +             } else {
> > +                     /* regulator already enabled somehow, but timesta=
mp might be invalid */
> > +                     if (!rdev->last_on)
> > +                             rdev->last_on =3D ktime_get_boottime();
> >               }
> > -             /* Fallthrough on positive return values - already enable=
d */
> >       }
> >
> >       if (regulator->enable_count =3D=3D 1)
> >               rdev->use_count++;
> >
> > +     if (wait_us) {
> > +             ktime_t end =3D ktime_add_us(rdev->last_on, wait_us);
> > +             s64 remaining =3D ktime_us_delta(end, ktime_get_boottime(=
));
> > +
> > +             if (remaining > 0)
> > +                     fsleep(remaining);
> > +     }
> > +
>
> [Severity: High]
> Does sleeping here while holding the recursive ww_mutex for the regulator=
 and
> its parent supply chain cause concurrency issues?
>
> Since regulator_enable_and_wait() acquires these locks via
> regulator_lock_dependent() before calling _regulator_enable_and_wait(), t=
his
> sleep happens while the locks are held.
>
> In cases like regulator_bulk_enable_and_wait() where async workers are cr=
eated
> to enable regulators in parallel, won't this serialize the wait times for=
 any
> consumers sharing a parent supply, defeating the purpose of the async des=
ign?

I suppose the fsleep() needs to be moved outside the lock region.

So instead of changing _regulator_enable(), make it return the last_on
timestamp, and then act on it in regulator_enable_and_wait() after the
lock is released.

> >       return 0;
> >
> >  err_consumer_disable:
>
> [ ... ]
>
> > diff --git a/include/linux/regulator/consumer.h b/include/linux/regulat=
or/consumer.h
> > index 56fe2693d9b22..a69157c9b5b51 100644
> > --- a/include/linux/regulator/consumer.h
> > +++ b/include/linux/regulator/consumer.h
>
> [ ... ]
>
> > @@ -192,7 +193,7 @@ int devm_regulator_bulk_register_supply_alias(struc=
t device *dev,
> >                                             int num_id);
> >
> >  /* regulator output control and status */
> > -int __must_check regulator_enable(struct regulator *regulator);
> > +int __must_check regulator_enable_and_wait(struct regulator *regulator=
, unsigned int ms);
>
> [Severity: High]
> Could the naming of this parameter cause consumers to inadvertently pass
> millisecond values that get interpreted as microseconds?

Yes I missed this part when I changed the API to use microseconds
instead of milliseconds. Will fix in the next version.


ChenYu

> The prototype here defines the parameter as ms, but the implementation an=
d
> the parameter passed to ktime_add_us() inside _regulator_enable_and_wait(=
)
> treat it strictly as microseconds.
>
> If a driver developer passes 10 expecting a 10-millisecond delay based on=
 this
> header, the core will interpret it as 10 microseconds. Could this lead to
> hardware initialization failures due to premature access to unstable powe=
r
> supplies?
>
> >  int regulator_disable(struct regulator *regulator);
> >  int regulator_force_disable(struct regulator *regulator);
> >  int regulator_is_enabled(struct regulator *regulator);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721075226.23=
47933-1-wenst@chromium.org?part=3D1
