Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10F2541E6A
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 22:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791932290; cv=pass; b=g4dbSIOTTcq4CL8VCGUle+reqbfVWOTvx42iaB9B6uL/pZF1EVO2oySSbBFiR8xZDgKa/Ei7r/3qdeUwftjkxrDln3sHzTAt6Lxl1E0gzlw9uFCVINR5S7rcpJlPdfxW5iOwYqUv45H/+H99oGQPoc6CSkdR9QVvLlDgAMN316k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791932290; c=relaxed/simple;
	bh=0EpohbfYukostjZXI2ncT+Tc3ZmFCLMbMduDseGX9/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X15z/ZuNGIsXD0RoyxsQLflhc6OX3f+Pjq5LSi6HM1z2bNUQpDETgKaKCXE3lTsSDAMGTHdkiBc9tbwJAzU88GdH4GIBCwrm4s2xAQri1CtpU4hFrexlZXL3i53FEn+Op7JPqiX/2adLpcMs7AXm+6Akk0nzFy/85dKqnXxppNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oZBUNVUP; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oZBUNVUP"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8ab43af5e97so34643837b3.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791932287; cv=none;
        d=google.com; s=arc-20260327;
        b=lng1Xvea5jPbFSnRcbmthgsHFMGd8Q3twVgYvXnWL5oLfJ96XjLslHnI38B2WDmiDh
         LJfJ1kPvnHKLRDtZAMRg29mlHzBAceWXT8Plcw+/emUS0pNl9FqqBA0JJEFaqrD4wpc0
         Q+H0r2TxXpSwJHY1Q7pyxC0BacYuFouuUwE2AFYjSSIunChwO8WJeYsjFbqooJ0pUqAP
         NUUXwnBld0vrxWu6qBa6NVtRyqr+AsagQklorGXFFQsrkjbqLsRhI3haUQKK7v4zvypn
         w2prczf2xwveqk1pc9jFOet+oK/nYBS7SCqq2B3H4VGDtL7zUQpMUvP9pvnRdX/FrP4s
         Lv0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNT5k/R5hoaf9iRJyFQonm0fN6tqHDSkSoHBE1CtQE8=;
        fh=6ysXxluG0S6idgB5ls5mSq5fwlw8LMn3wS2LlqdBpyw=;
        b=icz99kH31WQePC54UW4rst+oDJSrVaJ+qjBuqOfBcT2oP3tB9MWrgV8O1Dt6P1ebW5
         nIc2ZUjhJ3lr+OFoAeJs/2f3nd/LWq9Yg2iazdTnAun7ciget8hlNN9ObF9iCh8rVAiT
         c+l50uanynLSE7OHBlNZ8L4p7xe5FWNcBkQ/Dn9zYeVMlpR0GmyG4POBTqDb51V4bW6s
         7iVSGt0UQSMZzXwjFgd0Ye1iqcZQYB8Ew8Hz40sCaKFszw0gOCy1/XXV42aeBeJCTruT
         keGRS3Z/Q/qw/S2Njixce8LYMrlX88av6v/fr7aw6u/pe1GtTYlH9EfQnGnUGpM/OAJC
         FCmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791932287; x=1792537087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNT5k/R5hoaf9iRJyFQonm0fN6tqHDSkSoHBE1CtQE8=;
        b=oZBUNVUPz9F891EBANCiJ1zpQtqx5ZnytrriGsQTtVDwjEfrozhfX3EUQSXt4Uq32m
         o/62ov5r2iWb0s27TnHD0DtzR75APPg3LI3NvusDHxoQodUNP2XVpwpT7JjY5USRURBy
         GVmXzV+oBz6/YA6VdTe2OhtUQVY1rruxWflo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791932287; x=1792537087;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNT5k/R5hoaf9iRJyFQonm0fN6tqHDSkSoHBE1CtQE8=;
        b=t4JH2c+fxTDyXC7yiBvjYnNP+m9sI5wPg+V6ANN52rDZ3N5XQ+uA2NBwnWmq0EQKeS
         g7HV4tbjgnHyYXGJ3DauuHLhEmRLa/oi7D4sD0ZO4HZnMSqH4x0rKpFH6fVC2mKSq0EJ
         3WDB0AU5Sp7sVRlq28S3N3cKGsznrnH0tVsgGGxXmDAduyLq5Koowj8W9wHEogMhcepR
         43ysX2yY37AaoKXIZ69LJzZ2yOmgTisc8EcqDwIZ2yxv8+iZgqE0lpGb3HGr1s8h4P/a
         xX9g+XUvWDIYuOmPPytrB84VVeHS9eCsY/WIZX6R3EO+yHk85UrTjPyTA43q3HGzkyT/
         rqAA==
X-Forwarded-Encrypted: i=1; AKwUvBxJJUgFXR0X4unjo9SbmXXEBtDupzOmrotVVXhjkHcSYon2uYi4sBXP3yc0JwpQZKJLZH+c0VrwUXIt@vger.kernel.org
X-Gm-Message-State: AFq9FYL1SaQMR4yHbitJQj4HcrqYUxtJ9Bl4voc020OP92z+aPEN1pR4
	rkJC/3I5HkTcx+/WNieE86LfQNAsaVjg7DtleUmQPJ5vKBxkSvpjbGtPghBRbeiG1POPhbc+pNw
	N+0fD9bdHVAQw51//zSOAgutbyDICPSOlBH9UrDQf
X-Gm-Gg: AYBFou0m+XInY7Oiq6A/eVMp4iR67LRrshG+6BOPu0lbun4h6rBgG0S3CJjhQUOdgqU
	9qH8eGT9DaqHp2CULfAn32B8p19FM0fD1I35kzpqEsyNClwbxjCmTmrH9tHxxW2OBZfMfQ4OAru
	oqFZKI7Brt2dzT/5lXIqWluwTt4eG2ASHMhWjJdmbbucXVW3y9NhvN1gl9p6WesHK8sHh914zfZ
	64dQvgcpPehEpDnMPSjWZ1vxf0+8Re/4pAgBn8O4wsBxvGsldmjjOYoHPA7dBt+s+hnzpEZ35wY
	52uVoDkd5Co23qfn5OdJFE3jWvNUg7ZgYM8GFyV3VDov0L4eOodVx9JA9w/b2dKx5jPdQKQVVcZ
	NzF6Kdxc3TQ==
X-Received: by 2002:a05:690c:47c4:b0:8ac:927:f7e5 with SMTP id
 00721157ae682-8b07ed0a2e1mr37669057b3.10.1791932287599; Tue, 13 Oct 2026
 15:58:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-10-384af01da3ee@chromium.org> <sashiko-outbox-166155@kernel.org>
In-Reply-To: <sashiko-outbox-166155@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 13 Oct 2026 15:57:56 -0700
X-Gm-Features: AclHuK81HkBfvQ90JSsC-kMkz_kzpA8f9XGiSlSkqkbfMIOwnBJRPKPpuZiMjK8
Message-ID: <CAEe3GZGdbXdbqLjAmubh6EwdZ=FgzSDphmTy6YR53PySnH4cvQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] HID: spi-hid: add power management implementation
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	robh@kernel.org, conor+dt@kernel.org, dmitry.torokhov@gmail.com, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 3:43=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] spi-hid: hid_driver_reset_resume() races with error recovery d=
uring resume
> --
>
> commit e43c402ebe88a8dd98c0bab5a81f64d825faf560
> Author: Jingyuan Liang <jingyliang@chromium.org>
>
>     HID: spi-hid: add power management implementation
>
> This commit implements power management callbacks for the HID over SPI
> driver. It introduces suspend and resume operations, handling device
> power state and reset coordination during system transitions.
>
> > diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/s=
pi-hid-core.c
> > index f4e9b4e1294ed..66bfc251bd915 100644
> > --- a/drivers/hid/spi-hid/spi-hid-core.c
> > +++ b/drivers/hid/spi-hid/spi-hid-core.c
> [ ... ]
> > +static int spi_hid_resume(struct spi_hid *shid)
> > +{
> > +     int error;
> > +     struct device *dev =3D &shid->spi->dev;
> > +     bool was_reset =3D false;
> > +
> > +     guard(mutex)(&shid->power_lock);
> > +     if (test_bit(SPI_HID_DEAD, &shid->flags)) {
> [ ... ]
> > +     enable_irq(shid->spi->irq);
> > +
> > +     /*
> > +      * For devices that may wake up, process work that was pending wh=
en
> > +      * suspend cancelled reset_work. Otherwise suspend already droppe=
d it.
> > +      */
> > +     if (test_bit(SPI_HID_RESET_RESPONSE, &shid->flags) ||
> > +         test_bit(SPI_HID_CREATE_DEVICE, &shid->flags) ||
> > +         test_bit(SPI_HID_ERROR, &shid->flags))
> > +             schedule_work(&shid->reset_work);
> > +
> > +     if (shid->hid) {
> > +             if (was_reset)
> > +                     spi_hid_wait_for_reset(shid);
> > +             error =3D hid_driver_reset_resume(shid->hid);
>
> [Severity: Medium]
> Does hid_driver_reset_resume() race with error recovery here?
>
> In spi_hid_resume() (drivers/hid/spi-hid/spi-hid-core.c), the power_lock =
is
> acquired at the beginning of the function and held until it returns.
>
> If a wakeup-capable device suspends while an error recovery is pending
> (the SPI_HID_ERROR flag is set), spi_hid_suspend() cancels reset_work and
> leaves the device powered on.
>
> During system resume, spi_hid_resume() reschedules reset_work to handle t=
he
> pending error. However, because the device was left powered on, was_reset=
 is
> false, causing spi_hid_resume() to skip spi_hid_wait_for_reset().
>
> It then immediately calls hid_driver_reset_resume() while still holding
> power_lock. Because reset_work requires power_lock to execute
> spi_hid_error_handler(), the scheduled error recovery is blocked until
> spi_hid_resume() returns.
>
> Consequently, hid_driver_reset_resume() attempts to communicate with the
> device synchronously while it is physically still in an unresponsive erro=
r
> state, which will time out or fail, aborting the device resume.

This needs an error to be pending exactly at suspend on a wakeup-enabled
device. Error recovery still runs right after resume, so I'd rather keep
the resume path simple.

>
> > +             if (error) {
> > +                     dev_err(dev, "%s: failed to reset resume hid driv=
er: %d\n",
> > +                             __func__, error);
> > +                     return error;
> > +             }
> > +     }
> > +     return 0;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-send-ups=
tream-v5-0-384af01da3ee@chromium.org?part=3D10
