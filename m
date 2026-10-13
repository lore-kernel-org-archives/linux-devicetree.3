Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCE64A68AA
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 23:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791932817; cv=pass; b=MokvwBQ8+yxL4CZ8Mr+pbCuYvtq4wjatRRXxp+d4dCVnYWP8K3J4xd+iVQuDmLTbSfrl1OsvUM3JIhKFyzur/aBZTevytbdh2zitJFGKIQMI4mzp2/v4b2r9v7gg8ghdTgAIW6F3vqTSR8Js5Gp5Mok2sDJMO04IR34sAK41vec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791932817; c=relaxed/simple;
	bh=OJKCxitzFX7Devyeo1RMIWQKY4aZ2+94sv/X63QES54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fKYMmFndor+gcLwxY1GQcpjYJ2avgdSUhyNL5Iw93WQwRhAXBymVRa1bUJGzcx6ixJ/z5zl1iHa7ymFbg8IySZ8/21Y6b1pgS+OcccYIqTuSu1MbqWkrvYNbrqecaVoaET5uHAhS6qC+aeyS7WGnhowgQaE8pRofJ9D8RfQNA5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LhjcfavC; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LhjcfavC"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ac9d666d4eso4204527b3.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 16:06:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791932813; cv=none;
        d=google.com; s=arc-20260327;
        b=cmM2JZrJ5sS9OjXhExeH6URaYjf1EUyfhNUnVfl0hj4AbRKqHn1GaYnfRSL7EyiT03
         GGY7mFzRGdXInDCj53bvSgkYkmLsK7NKTRgpLO17cRxSA/Iz7T2S8bmYQEcHD+n8UOMc
         pszaLNrHXLLUkc2vmGK8KphVlY03ZrFjzJ1u/wsa3+WgCkCCIhFgVPIqwq9IBbnIkUIj
         nPD7fA+zHJJL9fGQHImcOlFxYACFOrFAzxxp5UNAWqFizheq1oUlPS4NZIs8uJG+4svu
         EgixCG70UV6QGxUKMjKUz0rKgu8KPUvtq9swv7OeDwEoNKVGCA+usP3J3BiccSv+up35
         IjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QntlmUV+IlR8FFxFh/1ODDrw2JuP6ngb9YrJOIy5BCA=;
        fh=yxnXvxfDLIqOf6RrXUk1j4PGo96oQJYdy4x0Hq3DOag=;
        b=gBAoz2kBFElDLn1zVJdIzmeW00ULJxNIPWaABDC3MW9CD0ooW6nF0ngkNeeOh9qAan
         MUMuqxzDKGov01y5N2uGYQKIRU212CUIVoU968D8vsyvRK8KxENHdlPk37Cjf5rAA+eo
         rtIKj9HmgeZyMhsuLgrleuP8y1DPK0GQXLQnpJu0rJxV3z/w8WSO7Z7UB5qVUiXQ2MIO
         i5xuFfnzHmnCQJ7HICI4+H1caO3x0DTY6Pt6wPauN6PHeh6eqGjiBaqJJqcFLSeULvhO
         r2X4YrieOaYTK/Qx9j7tnwiGykv2xHINNLkLhmiPGIiPx5xp4YHe9mJiCvjpVXUtVxFm
         cr6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791932813; x=1792537613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QntlmUV+IlR8FFxFh/1ODDrw2JuP6ngb9YrJOIy5BCA=;
        b=LhjcfavCp9bD3Kt6BHrZPKZfe7C83QVgolYum5AlSX/RQHfYq7ACFgSFfiyOa/MYIh
         g0vbeOCvoXidnwGNuYun4Y0vu65zajMlnhekuDSSZW3gSwbAxqwHNV9YSK8aFT7zDXHP
         LDJJGDFwHjPC3wbXiDX9/gohTj454dcIuMHDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791932813; x=1792537613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QntlmUV+IlR8FFxFh/1ODDrw2JuP6ngb9YrJOIy5BCA=;
        b=J/KgNLTFT6iXof/AYzWHq5wUnpc380M3ObWxmf2RyO29bF0gHxcCNvzfUzKAIjat+m
         4QPWL1rW+jmEubvHsswcIgiDQ9GSjMEMdGuJIAq0ZAL9AQy6rreOREklzBqjg/RRnwln
         TosiP2cWVtWipjpZa6zGWXdKHk6kSImDcq3pQVkZzq0qLFln623xACYKE0vSp0eqE1Xj
         Adg9Z5v8dpM1PMa6bc5zGgQKx5XMLXrwjhMnL6FIIFMaj3I2Zib2w5RiPqt6LAuA/M7j
         KtJuadj9W5++F4mpa3749XbxdnDZL7iuzUUGKFT6U9ntRkmmFQttNfm3XAMjfd3ZewqT
         5Z3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzagS0j/uqpnPG3yrdHvW2P1QFo4nJ1Lfd97FMIkCM4WryRkN+tgnxPI2Mj56MFzCdtDI49T00rdxky@vger.kernel.org
X-Gm-Message-State: AFq9FYJHlHN8j9zh+EJhK6eH9KVYl5rVs/T4On6QYtHzO0XCAy8z/DaB
	nfrhSHRdh01TJ0yrg7egO6l7KIs4hJXRqVt+SRxQewQsqCFtkSEtVVVofTNGc7IZTabHNi0ohR0
	f4yEA2U1b1bAGYRKg+ubxMlak5IkCBKVu1U9YFfqL9AB3XXr86R4SHw==
X-Gm-Gg: AYBFou0CJV6fuIhWBHoeH+A23redB/3U4a0eYJhAuRcSy682DZ144ExLnxx0QmG/r0j
	1QhuClFH32DWn6wULHbQ3/maYR4p2m9yCIXuNuZAES/poRgvEF3cMhg8F1WnCYfo3G83i/m5QYH
	LoJDr/VkNqM7+l/WnItz36As/r/J0xPdpVZnYpVQF7OL0TR9oEjvspyB59SGb39Vp4dfRfLGaPg
	NBTG/MhhGKkTA3aXl3nmDa0RNwi8HHfX21v21mgo8uETfLRfUN0hUY/XxbsPSdHi1mhZK6ycL9i
	5+qZ4lvG3jYHdzBWVS/gOmW4Q8iP6SFPl3BCJRgi82mrcT+ymovXfSnVBRcT2iKl9wO2xkInxIa
	XRjbtnCDqzg==
X-Received: by 2002:a05:690c:82e:b0:8ac:805b:3a6e with SMTP id
 00721157ae682-8b07edb832amr35007727b3.25.1791932813416; Tue, 13 Oct 2026
 16:06:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-11-384af01da3ee@chromium.org> <sashiko-outbox-166150@kernel.org>
In-Reply-To: <sashiko-outbox-166150@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 13 Oct 2026 16:06:42 -0700
X-Gm-Features: AclHuK_EPiuPXQkmP4djXq_D1z67MVt8XUJL6Sx0kl0aGpRUcTZIlzf43HHn9kY
Message-ID: <CAEe3GZH07w_-Be--FnoVJXvOXtQ4pnjO1T8CMkejVaUFrVC9VA@mail.gmail.com>
Subject: Re: [PATCH v5 11/11] HID: spi-hid: add panel follower support
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, linux-trace-kernel@vger.kernel.org, robh@kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 3:36=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] spi-hid: Inconsistent wake IRQ configuration for panel followers
> --
>
> commit 4c8d0ec463c5dbd300c392f3f924992096f8ebc1
> Author: Jingyuan Liang <jingyliang@chromium.org>
>
> HID: spi-hid: add panel follower support
>
> This commit adds support to the spi-hid transport driver to act as a
> panel follower, allowing its power state to be sequenced with a display
> panel.
>
> > diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/s=
pi-hid-core.c
> > --- a/drivers/hid/spi-hid/spi-hid-core.c
> > +++ b/drivers/hid/spi-hid/spi-hid-core.c
> [ ... ]
> > @@ -1577,21 +1676,17 @@ int spi_hid_core_probe(struct spi_device *spi, =
struct spihid_ops *ops,
> >               }
> >       }
> >
> > -     error =3D shid->ops->power_up(shid->ops);
> > -     if (error) {
> > -             dev_err(dev, "%s: could not power up\n", __func__);
> > -             return error;
> > -     }
> > -
> > -     error =3D shid->ops->deassert_reset(shid->ops);
> > -     if (error) {
> > -             dev_err(dev, "%s: failed to deassert reset: %d\n", __func=
__, error);
> > -             shid->ops->power_down(shid->ops);
> > -             return error;
> > +     if (shid->is_panel_follower) {
> > +             error =3D spi_hid_register_panel_follower(shid);
> > +             if (error)
> > +                     return dev_err_probe(dev, error,
> > +                                          "Failed to register panel fo=
llower\n");
>
> [Severity: Low]
> Does this sequence leave a dangling, inactive wake IRQ attached to the
> device when it is a panel follower?
>
> In spi_hid_core_probe() just prior to this block, the code checks
> device_can_wakeup(dev) and unconditionally allocates the wake IRQ via
> devm_pm_set_wake_irq().
>
> However, if the device is a panel follower, it calls
> spi_hid_register_panel_follower() here. Inside that function, it checks
> device_can_wakeup(dev) again, warns the user, and forcibly disables the
> capability:
>
>     if (device_can_wakeup(dev)) {
>         dev_warn(dev, "Can't wakeup if following panel\n");
>         device_set_wakeup_capable(dev, false);
>     }
>
> Because the capability is disabled after the IRQ is already requested, it
> appears to waste resources by allocating an IRQ that is immediately rende=
red
> unusable. Should the panel follower check and the potential clearing of t=
he
> wakeup capability occur before the wake IRQ is requested?

This is harmless: devm_pm_set_wake_irq() doesn't request a new IRQ,
it only marks the existing one as the wake IRQ, and the PM core only
arms it when wakeup is enabled. i2c-hid has the same sequence (the
I2C core sets the wake IRQ before the panel follower check).

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-send-ups=
tream-v5-0-384af01da3ee@chromium.org?part=3D11
