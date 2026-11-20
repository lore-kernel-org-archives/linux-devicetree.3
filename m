Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795214191;
	b=5qDdyVyW3flGwAWvXiFO+F854OxR46fUBZtSHxJPR8E4za7f+GMdHszDVT/x1DTdfUri
	 ArpSCYQp9wnll6B3yDv17IX1Pfi1lwn/jcxeFvt6Sie+KfOkTvrIKllMNEiP3mvCzfaW2
	 5f/c9cVd3xuhWwCGh0IKxiPVg2W8JshtziPa3EpkSgptg/4ERINok+b64Z8VcO6K7RRE9
	 iWHLbKGSvkELbTUyRIvdwQiqUoP5M2LhBm1CcYdVx88GqKlw8if58YIsdEr14s6pNIVTs
	 RiW7WVLv4F6QojMev3awVh1iBbzu1V5cbRj/epFP4D3F/i1NUpXXA+vTIi1V5VRLx/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LI62TlkKF7SE72mFPwGFMzusKh7ch0L+DlHxc/4ud2I=;
	b=zuva4sSyrJj+jZLGtnCZCrDxdTpJvCztkAriwg7dnTPLOsyRjKWweEtEnOAb3Hbv7H2E
	 A97b1Q7VB2ImkjDklq8WoIgp9lDaaZcIOCXJNpAUgWA28n839i83iYOnQX3VnlnTTDOkd
	 vhfbfKi4THRyJ3Bix9oUnk9ZsUvoHmv1kyJNsJiDathUXcxeWQh64tk3seMlefFRHgP/N
	 vZgZEFhY0jNpCVnHkLkcMiBg3ucY3SV9lbLdCBU1zqoowZQ4J85eu8MKBF/Xjt2oR6Jwn
	 qZ0JUHe8wdSDmd7e1nesj8C6T1JTAg6pv7D0nHjtpU2ugR+Ss/Ud2x1AAy6yHfG/JwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="eRRP/wob";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1A1606A6A9
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 22:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F1A1606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eRRP/wob
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67c24619b19so1293922d50.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 14:36:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795214180; cv=none;
        d=google.com; s=arc-20260327;
        b=XqypylvI/JkHvnZBuXiDfnyeMNeVs+T4g7/d6JWR05EdLFE/R1mB6oLoMR/dr/I3ik
         rtAfPuIqTiNG6R4cZEanvgjErHWOoIS8Nr+hli8HhRb0md9hZFaJ+jfj+jxZ8BqnizhF
         iTCP+JVLK83y5T/F5DPwfYvVmeMyWOdu1yxCkyOkERC06WVEJs0ZPZ9yl637MThlh34/
         vxP/ekLzmK9A8i4Fr/h+MynOZPA3zHWOzIfeRlEttV9i72MzqbASKmwGQJpzRMfpqb31
         EgtMNGRGJrWFxJ3gQ62aHX0VWdppLRUnYc0maigi5RcA132bqJVKPCoj+Y0C4Y33ruTL
         VK4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LI62TlkKF7SE72mFPwGFMzusKh7ch0L+DlHxc/4ud2I=;
        fh=yUM0CGLuxW01y4wJq7tfJwZeQIyKuJjl1gHjCJ3xJ68=;
        b=sii6WP7zkAXm59RrsfLVLFTWJJQeaZMxdqDAhrDRnUlR8IRfqBbLpa7fgcdSPKu1i1
         pB3DYReVF+0YBsGQQYjO9L3RvvS47eu1X+jMJ1BDQ2xT5YeJTkvYT6cibMO49/3IjhkP
         pBGgFluWeb2uBcFNSVMMH0d+6iDB+P6wzne0SKCUDJ+ZWfuyfp7nkFjYR/tYzXLdhEIO
         zlUq3UHnNbIEusOXzZv/tPutZ97RW1OJcNUkpAY6U7fMqNyyawPFIvFrH2uW0zIo+WSx
         KpDB9tCB2sYBABo28yhRUhrZRrM5YOOqLs2TNB+qAtk1057KPw7Sd6bOxnvQ+2dQUXrM
         WVoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795214180; x=1795818980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LI62TlkKF7SE72mFPwGFMzusKh7ch0L+DlHxc/4ud2I=;
        b=eRRP/wobXJsITiQgwsuDY/DjVunwMvvWHB85pcB9gVCy7jztOH8pY+CbLv82/7Pdfy
         AmW9MnMAweg8pQ3eF3ZsvbkqBBRV+3sH9RWiwZ1JxlyHoKht12tMnzVRkBGKPjs6vBL7
         /0EtvKedEhSr+Fe3XjtOuSHiEG10trzsvsTHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795214180; x=1795818980;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LI62TlkKF7SE72mFPwGFMzusKh7ch0L+DlHxc/4ud2I=;
        b=QcoMzrfpHP53b33d6f0sWfHRpaA3HqMe9of3JeuW7I3POtNX9J7f0QG2ZCXa3U0igO
         qsyRdH7ABXnfXKnVRdVuN6UTulnmJHAE7j7fvl71/RLvgzbtYqIOYdPdYt9lQZr1JUwT
         5A12CdB6ZlZdnnaCHthdbORuUXCvBNRI+CWp4gm0QE1LnIoiYJSTZ2FIRNcAJYFnfd7f
         nj5TwRehuspI6CPsADVC4DlhAhfhyulZvF7FES1i4+jyN4vEPEzlcAxBJKiLHhSvDdaS
         +HPauZvf0EblAbojZBYCe1q4GrqIyptdWgnpe2EXQyvtLVjNH/w1FwRRNjtBLVGtim3j
         +G8g==
X-Forwarded-Encrypted: i=1; AL+hErGC/p69S7EQ12t9+4UOi/w+qTjo3xB6ZIUwltO4CYPDgc6nM1pPR0Yg53OQxqJRN3jrvIxtQC+5MGcS@vger.kernel.org
X-Gm-Message-State: APuU4Z/PG6zg4V9y4CUkIadjrOtZcdMiIlwj2HVnbPiCl/mJpYuuT+v9
	OLeR2sn8Q67qOPcv66AeiM47tWPUYq4T9z7/WVXmovwEOtfi/D/BfWZeKplD4Rx1p3PlVjA4q3m
	mN3OI36trAudNdSxLfV6xIbAsj7PyNx9p5Kuz/oMy
X-Gm-Gg: AZFdTZdPmFDde8oFKOLcqQHKzTpfddc/0QQ5mLYCtH0kj/jyxYv09LMlI0AoAQ8RmKt
	VtXQLAa73HOQeZgpTfGkCZyggFNmcBrrG2XVaIAaB97doChrFLmK7dBXoAIVO+osRiYIvdWA7Lo
	obO+57srHdf4bru12RppKoouPvbYshMgjlZxcO99ysUi/82b8ToeDqS+1tOwJmgIwpbxjqD23GG
	Ehafn3bdd0LUBJa3GiV20EvzuWuPwhBkljgC4nw1/Hy94+QsAY0nRFTt8xMx1MhrqQ0eLngqxx2
	HWHw4YlMkmRnC2sSF+4Tp6QfCvWXvDrmw+mhUSS+sFYorxW53d3pBRZRY+fvO/fBAMK/8MP9YSF
	4JvDKfz/xI6asW0GdIh5Cp+JKoEcMTRsO7LFUs2I+fAeedqPS27Nt//stAj+YVhr/tXw=
X-Received: by 2002:a05:690c:6b09:b0:8b3:33cf:1fd6 with SMTP id
 00721157ae682-8b5204da8cbmr22654577b3.46.1795214180401; Fri, 20 Nov 2026
 14:36:20 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
 <20261024-send-upstream-v7-10-abad13174b43@chromium.org> <sashiko-outbox-183486@kernel.org>
In-Reply-To: <sashiko-outbox-183486@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Fri, 20 Nov 2026 14:36:09 -0800
X-Gm-Features: AclHuK-uqG9_uXU3EVhPHyRTDXChIzvp0O_bkgQvn7hhRNcrLduMWOI_Cxiv4hw
Message-ID: <CAEe3GZGLP5PtW1HD1R_wm6+WeUf=7pVbCb3iKbihorEKy-4VkA@mail.gmail.com>
Subject: Re: [PATCH v7 10/11] HID: spi-hid: add power management implementation
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 6:19=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] hid: spi-hid: unhandled deassert_reset() failure in spi_hid_resu=
me()
> - [Medium] HID: spi-hid: race and missed hid_driver_reset_resume() in spi=
_hid_resume()
> --
>
> commit 9bd51942caad3c04cffc9fdd14002340e1980586
> Author: Jingyuan Liang <jingyliang@chromium.org>
>
> HID: spi-hid: add power management implementation
>
> This patch adds system sleep power management callbacks to the HID over S=
PI
> transport driver, handling device power down, reset synchronization, and =
wake
> IRQ setup across suspend and resume.
>
> > diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/s=
pi-hid-core.c
> > index 4ff93d22715cd..3b8874ca0e1cc 100644
> > --- a/drivers/hid/spi-hid/spi-hid-core.c
> > +++ b/drivers/hid/spi-hid/spi-hid-core.c
>
> [ ... ]
>
> > @@ -231,6 +239,147 @@ static const char *spi_hid_power_mode_string(enum=
 hidspi_power_state power_state
> >       }
> >  }
> >
> > +/*
> > + * Wait for the device descriptor response after reset; the device the=
n takes
> > + * requests. Set READY here: the report descriptor check that normally=
 sets it
> > + * needs power_lock, which callers hold.
> > + */
> > +static int spi_hid_wait_for_reset(struct spi_hid *shid)
> > +{
> > +     unsigned long timeout =3D msecs_to_jiffies(SPI_HID_RESET_TIMEOUT =
+
> > +                                              SPI_HID_RESP_TIMEOUT);
> > +
> > +     if (!wait_for_completion_timeout(&shid->reset_done, timeout)) {
> > +             dev_warn(&shid->spi->dev,
> > +                      "Device descriptor not received after reset\n");
> > +             return -ETIMEDOUT;
> > +     }
> > +
> > +     set_bit(SPI_HID_READY, &shid->flags);
> > +     return 0;
> > +}
> > +
> > +static int spi_hid_suspend(struct spi_hid *shid)
> > +{
> > +     int error;
> > +     struct device *dev =3D &shid->spi->dev;
> > +
> > +     /*
> > +      * Stop reset_work until resume; pending steps keep their flags. =
The
> > +      * IRQ stays on so a request in flight gets its response.
> > +      */
> > +     disable_work_sync(&shid->reset_work);
> > +
> > +     /* HID driver suspend may talk to the device; responses need the =
IRQ. */
> > +     scoped_guard(mutex, &shid->power_lock) {
> > +             if (shid->power_state !=3D HIDSPI_OFF && shid->hid) {
> > +                     error =3D hid_driver_suspend(shid->hid, PMSG_SUSP=
END);
> > +                     if (error) {
> > +                             dev_err(dev, "%s failed to suspend hid dr=
iver: %d\n",
> > +                                     __func__, error);
> > +                             enable_work(&shid->reset_work);
> > +                             /* Redo a schedule_work() dropped while d=
isabled. */
> > +                             schedule_work(&shid->reset_work);
> > +                             return error;
> > +                     }
> > +             }
> > +     }
> > +
> > +     /* disable_irq() waits for a running IRQ thread. */
> > +     disable_irq(shid->spi->irq);
> > +
> > +     guard(mutex)(&shid->power_lock);
> > +     if (!device_may_wakeup(dev)) {
> > +             if (shid->power_state !=3D HIDSPI_OFF) {
> > +                     /* Device is fully reset on resume; drop stale st=
ate. */
> > +                     clear_bit(SPI_HID_READY, &shid->flags);
> > +                     clear_bit(SPI_HID_RESET_RESPONSE, &shid->flags);
> > +                     clear_bit(SPI_HID_CREATE_DEVICE, &shid->flags);
> > +                     clear_bit(SPI_HID_ERROR, &shid->flags);
> > +                     set_bit(SPI_HID_RESET_PENDING, &shid->flags);
> > +
> > +                     shid->ops->assert_reset(shid->ops);
> > +
> > +                     error =3D shid->ops->power_down(shid->ops);
> > +                     if (error)
> > +                             dev_err(dev, "%s: could not power down: %=
d\n", __func__, error);
> > +
> > +                     /* Held in reset either way; resume resets it. */
> > +                     shid->power_state =3D HIDSPI_OFF;
> > +             }
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int spi_hid_resume(struct spi_hid *shid)
> > +{
> > +     int error;
> > +     struct device *dev =3D &shid->spi->dev;
> > +     bool was_reset =3D false;
> > +
> > +     guard(mutex)(&shid->power_lock);
> > +     enable_work(&shid->reset_work);
> > +     if (test_bit(SPI_HID_DEAD, &shid->flags)) {
> > +             /* Stay off; only balance disable_*() in suspend. */
> > +             enable_irq(shid->spi->irq);
> > +             return 0;
> > +     }
> > +
> > +     if (!device_may_wakeup(dev)) {
> > +             if (shid->power_state =3D=3D HIDSPI_OFF) {
> > +                     shid->ops->assert_reset(shid->ops);
> > +
> > +                     shid->ops->sleep_minimal_reset_delay(shid->ops);
> > +
> > +                     error =3D shid->ops->power_up(shid->ops);
> > +                     if (error) {
> > +                             dev_err(dev, "%s: could not power up: %d\=
n", __func__, error);
> > +                             /* Suspend runs next even if resume fails=
. */
> > +                             enable_irq(shid->spi->irq);
> > +                             return error;
> > +                     }
> > +                     shid->power_state =3D HIDSPI_ON;
> > +                     reinit_completion(&shid->reset_done);
> > +                     error =3D shid->ops->deassert_reset(shid->ops);
> > +                     if (error)
> > +                             dev_err(dev, "%s: failed to deassert rese=
t: %d\n",
> > +                                     __func__, error);
> > +                     else
> > +                             was_reset =3D true;
> > +             }
> > +     }
>
> [Severity: High]
> What happens in spi_hid_resume() if shid->ops->deassert_reset(shid->ops)
> fails (or if was_reset is true while shid->hid is still NULL and the rese=
t
> times out)?
>
> When deassert_reset() fails in spi_hid_error_handler(), the driver sets
> SPI_HID_ERROR and schedules shid->reset_work because a device held in res=
et
> will not assert a reset-response IRQ:
>
> drivers/hid/spi-hid/spi-hid-core.c:spi_hid_error_handler() {
>         ...
>         error =3D shid->ops->deassert_reset(shid->ops);
>         if (error) {
>                 dev_err(dev, "failed to deassert reset: %d\n", error);
>                 set_bit(SPI_HID_ERROR, &shid->flags);
>                 schedule_work(&shid->reset_work);
>         }
> }
>
> In spi_hid_resume(), however, a deassert_reset() failure only logs the er=
ror
> and leaves was_reset false. Because spi_hid_suspend() cleared SPI_HID_REA=
DY,
> SPI_HID_RESET_RESPONSE, SPI_HID_CREATE_DEVICE, and SPI_HID_ERROR before
> powering down, shid->reset_work is not scheduled, spi_hid_wait_for_reset(=
) is
> skipped, and spi_hid_resume() returns 0 when !test_bit(SPI_HID_READY,
> &shid->flags).
>
> Similarly, because spi_hid_wait_for_reset() is gated inside if (shid->hid=
), if
> shid->hid was not yet created before suspend and the post-resume reset ti=
mes
> out, nothing sets SPI_HID_ERROR or schedules shid->reset_work.
>
> Could this leave the device permanently held in reset with its regulator
> enabled in HIDSPI_ON and no recovery work queued?

No. The next suspend powers the device down and the following resume
retries the reset.

>
> > +
> > +     enable_irq(shid->spi->irq);
> > +
> > +     /*
> > +      * For devices that may wake up, process work that was pending wh=
ile
> > +      * suspend had reset_work disabled. Otherwise suspend already dro=
pped it.
> > +      */
> > +     if (test_bit(SPI_HID_RESET_RESPONSE, &shid->flags) ||
> > +         test_bit(SPI_HID_CREATE_DEVICE, &shid->flags) ||
> > +         test_bit(SPI_HID_ERROR, &shid->flags))
> > +             schedule_work(&shid->reset_work);
> > +
> > +     if (shid->hid) {
> > +             if (was_reset && spi_hid_wait_for_reset(shid)) {
> > +                     /* No reset response: let recovery retry. */
> > +                     set_bit(SPI_HID_ERROR, &shid->flags);
> > +                     schedule_work(&shid->reset_work);
> > +                     return -ETIMEDOUT;
> > +             }
> > +             /* HID requests would fail while the device is not ready.=
 */
> > +             if (!test_bit(SPI_HID_READY, &shid->flags))
> > +                     return 0;
> > +             error =3D hid_driver_reset_resume(shid->hid);
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
> [Severity: Medium]
> On the wakeup path (when device_may_wakeup(dev) is true and was_reset is
> false), how does hid_driver_reset_resume(shid->hid) interact with a pendi=
ng
> reset_work?
>
> When spi_hid_irq_error() sets SPI_HID_ERROR or spi_hid_process_input_repo=
rt()
> sets SPI_HID_RESET_RESPONSE in the IRQ thread, SPI_HID_READY is not clear=
ed
> immediately. Instead, SPI_HID_READY is cleared later when shid->reset_wor=
k
> runs spi_hid_error_handler() (which must first acquire shid->power_lock) =
or
> spi_hid_reset_response().
>
> Because spi_hid_resume() holds shid->power_lock across the entire functio=
n,
> scheduling shid->reset_work and immediately checking test_bit(SPI_HID_REA=
DY,
> &shid->flags) means:
>
> 1. If SPI_HID_ERROR or SPI_HID_RESET_RESPONSE was set while SPI_HID_READY=
 is
> still set, spi_hid_resume() sees SPI_HID_READY set and calls
> hid_driver_reset_resume(shid->hid) right before shid->reset_work runs and
> resets the device.
>
> 2. Conversely, if SPI_HID_READY was already cleared (for example, after a=
 sync
> request timeout or while SPI_HID_CREATE_DEVICE is pending), spi_hid_resum=
e()
> returns 0 early at !test_bit(SPI_HID_READY, &shid->flags). Once
> shid->reset_work later completes in spi_hid_refresh_device():
>
> drivers/hid/spi-hid/spi-hid-core.c:spi_hid_refresh_device() {
>         ...
>         /* Same report descriptor, so no need to create a new hid device.=
 */
>         if (new_crc32 =3D=3D shid->report_descriptor_crc32) {
>                 shid->reset_attempts =3D 0;
>                 set_bit(SPI_HID_READY, &shid->flags);
>                 return;
>         }
> }
>
> it sets SPI_HID_READY and returns without calling
> hid_driver_reset_resume(shid->hid), leaving the HID driver in the suspend=
ed
> state set by spi_hid_suspend().
>
> Should spi_hid_resume() coordinate with pending reset work on the wakeup =
path
> so hid_driver_reset_resume() runs after the reset completes?

This requires an error or reset response to be pending at resume on a
wakeup-enabled device. Waiting for reset_work here would need
restructuring resume, since reset_work also takes power_lock. Leaving
it as is for this series.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-send-ups=
tream-v7-0-abad13174b43@chromium.org?part=3D10
