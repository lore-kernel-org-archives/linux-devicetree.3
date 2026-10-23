Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792798747;
	b=G7DcfhWpdYYxqVQyNuxrkYgKsSPWJZIec7nnxWiHEZ6uXVKwQInHJY2PEU9Z7CGmf6Tw
	 XLfcoF07MpB5YCJdKRhYWsZjekTuRRmVuYRjTD5sDUdIcI5bynNMmBnQALjZfHhNDCcUJ
	 JNRysJqg01tKl7rAGTT763I0A3YjMuojQatElmyiP+2WxOMNYxF0NtY7VvTAs8Bk0qxy6
	 EBtrnYGfETr+4sPgT3VpgXhGaX/TwnEfnnUhkwzQVeYwwnhikWuErZvhrwf3tjC3XXoIZ
	 NwrLlQ4CdkPWMazDn1ixng9R10bgOkLu6yfW0I9FTZKazU0EVRtv90ccDv46LgfLJaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aimS7WOX4+iFi8PQPFSUhpjDeNXHySq/D50+MFe/QW0=;
	b=Osmd/5CahbdUvZRRVq6KLWdCUDkw8d9yhKZSHgweobtL/aqYIGgC5P40srgMlqC1GsuD
	 PLPHA8olF8RPAxQ9HdEPp0AGn2XGBn5B25okHdYvEmtWUf0fSLbBkzACx+mk4w1SKPHWk
	 R3PqCPrYyjK6+RfWYPorWpC3VLnprpFWHO61+NQt73ZbGs2R0kuo5cllKiM0C4OmPoXKP
	 SHohvle/quRucMOHXfYB4iQ2Ak+svhtxM4FGc2yCqHAgFX/QRCiCN2hiuptNxjGWS35US
	 wUt4WDtuhsS1DRPjHI1MbXC9MM6LYYsruS59q1fKV/jzP9Qjg97FMTV/aVpt+YpCTDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bL5XLpD0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F4C606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 23:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99F4C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bL5XLpD0
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b05bf699easo14030137b3.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 16:39:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792798745; cv=none;
        d=google.com; s=arc-20260327;
        b=Kn837sjVios4l97cAmX2VGzQ8Civi8yKCLEHeeJmbSdcQpXc9BP5+aUNVAt+B9fEex
         ycaaRpLc9/7AIA16frXeu3+VqSO28V+4yRrfUi1H6qxfMbAF9Dq3S3/bHSk8VwHP6fFf
         FEZp7fEsQmL22Xw1rKd1zLOYiAJHynwNg1WrImDzQQE8B2H1w/0yJBJrtBK3r0WU17uw
         JTBt7pji5GtveYHy7Sx+XNPiukPvVRPjZv2WZma1OxTsW/aGD0AhFy+LaCOH4VHsCx4H
         xryVk0ObfIATtEF3sEU3nZHVjy9YyI76gBYHv1tOJ1y2rLL3JaXZriAfmOpNwtRW9Kv8
         TBYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aimS7WOX4+iFi8PQPFSUhpjDeNXHySq/D50+MFe/QW0=;
        fh=cUJwHRm9Gn0yh5qJe2ozfN6nLLKkDRZOhbgaAiV8jQE=;
        b=N+ZjN/4/If1FVPcpW3fC2KdMYr3M8VRRioRQX5gCW/mQv4P8wvsExYS+fq2bi+lQ0A
         39mJB9InRGWNTAmdX4cWLTwftfJfp8SiGsEpX8wWeGVCCKcjgoXoPsHBE3paLieiA9rg
         51V8cTCmyjZfld4JD1INA8p0iz2q2eW0sT2Lcuzn1KYu7wS8yGZghbRXv/kKuhvT269v
         LlpY4krbCB+Es/tUPbPVgyPpkXvPpF1TJPm1wWRFS+tkhSvQmNs1xEqvlTlQce+nwzym
         XSueo6m7q4fEiOYswNP8g3QcLO3pkQqRXO0GD1nVUTOShHOyu/5+tFORw1r7AfF09V2z
         8wMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792798745; x=1793403545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aimS7WOX4+iFi8PQPFSUhpjDeNXHySq/D50+MFe/QW0=;
        b=bL5XLpD07fdBCpJkImNx5aN5kWR3bi9nyZMzVT6w5jTaU6HUEDEV8QZANEU8kdlbgN
         jkH+SEcNyMzlD+wpzCycC53DHoXBkFA0t9gQWE3QAvITHL5KLmwdL6LY8J9DUFmhJwDt
         ocPsXjfV4eaoMfRqqQ4yMSf6ifzqjjaqfwwYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798745; x=1793403545;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aimS7WOX4+iFi8PQPFSUhpjDeNXHySq/D50+MFe/QW0=;
        b=SQD29N8Yb3JHd/kMS+GSeDK5xTXX/SmTrkzs+1dIFmiUuYGicqAjN8T1zUyzqCbySC
         E1aIn3XVSm4RBX2TcAXlsusjWM15Xd3CtMHV/UocGrTa3Pf53DTj2mLLY9HlG8e60+a9
         YcSjcWLs0yziETxCfhd/rsbI8TmtGgr3ff3IiWNPD35GtY3eC7qi57wBt87xlbcljKvK
         uazkeLbMuB6TxQTojZKP7Qnrby1ajC5vXugO9fmbqcF7KGAcHzkI5NCnSGfmFOMwyhq3
         /OuGWXlo3DQ0t+3AQnoMzrdUEEDxKW6B+dF5tEZ0xz50u19VMCte7u8TyEIFDw7xtpQC
         tz0g==
X-Forwarded-Encrypted: i=1; AKwUvBy4vby81HOkEam08A1X9Ovu3rTLVCjhmlhHgGYPPv4lSwOPllqOLz2yawvgsmJS60944tVfU1NP7Cgk@vger.kernel.org
X-Gm-Message-State: AFq9FYKTgK4lt+PAKPX8V4atycF9JGQ7C0aykUJho4q7NxQjsckcN2J5
	pKNpDu3jRHYYwZ5lhF/n+A+tzrlTwOHpqNtrEolSFnl4Igk+RdTIcomIk41oP5+4hUvdi8Nc8TN
	9ppXdL4iE2UOFqaUEyKwC5kC7KnJp/Uycqn/yPaWDZTPiBTuAYZhB2w==
X-Gm-Gg: AYBFou2FN7YvEvyRaFqlvTq0D0LhMBNFaceu644yqVcFDe7JKPFS4TKLqyMZiyi3Wg3
	EnLct09W2mt45Gjy9vSRqn0VBBOfUFmggUotjZJaDSxZCcatyVqKVTMtB1Jr5KDwaC2VOcN/4IU
	pb0WUr2U6OS1aAC1La+s7dVZXx2g8+0PVjibF1G1TCGoqBB5cgQxKtEJjvqydiregoyqRpZd+/r
	OWAuaixw3E1ISRpvPmrHpQ3gnK0sgQOkeEruIdbpWZCyfPErChT1xhFG22QxiMbmq1PRtsDsl8e
	m4/1WY1pg0Hf0r0kuLCz5zBgSIGRmex2V2bnFDAeb+MOhW90BYPsz5RWqjbyD7JwiYMfRXLzKbm
	USpKjfXesoU2RQhPeaztlaeYzeRR+HTP+tQwWdqjWop2AjykhI9EWdIAyjAuwy7vn4g==
X-Received: by 2002:a05:690c:c9e:b0:8b0:c921:92e with SMTP id
 00721157ae682-8b166c4ababmr5255127b3.54.1792798745513; Fri, 23 Oct 2026
 16:39:05 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
 <20261019-send-upstream-v6-10-cb9ba4b3d6fa@chromium.org> <sashiko-outbox-178144@kernel.org>
In-Reply-To: <sashiko-outbox-178144@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Fri, 23 Oct 2026 16:38:54 -0700
X-Gm-Features: AclHuK8uEa43z9JyE9axDo9YiPWsBeLihmL2U6YIIVjA17r70unKjmeacRPtRjo
Message-ID: <CAEe3GZFz7D0F94gnqAG-aWfTDQc3jFw775jNdLNKiN1SsRukQg@mail.gmail.com>
Subject: Re: [PATCH v6 10/11] HID: spi-hid: add power management implementation
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 12:36=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
> - [High] hid: spi-hid: disable_irq() before cancel_work_sync() in spi_hid=
_suspend()
> - [High] hid: spi-hid: unchecked deassert_reset() and reset timeout in re=
sume/suspend
> - [High] hid: spi-hid: holding power_lock in spi_hid_wait_for_reset() blo=
cks recovery
> - [Medium] hid: spi-hid: spi_hid_resume() runs reset_resume before pendin=
g reset_work
> - [Medium] HID: spi-hid: skipped power-up in spi_hid_resume() when wakeup=
 is enabled
> --
>
> commit 943f2d7ec87adee993c65a27b7655a39b4d0ef5c
> Author: Jingyuan Liang <jingyliang@chromium.org>
>
> HID: spi-hid: add power management implementation
>
> This commit implements system sleep power management callbacks for the
> HID over SPI transport driver, handling device suspend, resume, reset
> synchronization, and wake IRQ setup.
>
> > diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/s=
pi-hid-core.c
> > index 96805c10bfe36..c2232d5959b88 100644
> > --- a/drivers/hid/spi-hid/spi-hid-core.c
> > +++ b/drivers/hid/spi-hid/spi-hid-core.c
>
> [ ... ]
>
> > @@ -242,6 +250,148 @@ static const char *spi_hid_power_mode_string(enum=
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
> > +static void spi_hid_wait_for_reset(struct spi_hid *shid)
> > +{
> > +     unsigned long timeout =3D msecs_to_jiffies(SPI_HID_RESET_TIMEOUT =
+
> > +                                              SPI_HID_RESP_TIMEOUT);
> > +
> > +     if (!wait_for_completion_timeout(&shid->reset_done, timeout)) {
> > +             dev_warn(&shid->spi->dev,
> > +                      "Device descriptor not received after reset\n");
> > +             return;
> > +     }
> > +
> > +     set_bit(SPI_HID_READY, &shid->flags);
> > +}
>
> [Severity: High]
> What happens if an error occurs during the post-reset handshake while a
> caller is waiting in spi_hid_wait_for_reset()?
>
> Both spi_hid_resume() and the power_down() rollback path in
> spi_hid_suspend() hold shid->power_lock across spi_hid_wait_for_reset()
> and hid_driver_reset_resume().
>
> If a transient bus error, header validation error, or descriptor error
> occurs in spi_hid_dev_irq(), spi_hid_reset_response(), or
> spi_hid_dev_desc_response(), the driver sets SPI_HID_ERROR and schedules
> shid->reset_work to run spi_hid_error_handler():
>
>   spi_hid_reset_work()
>     spi_hid_error_handler()
>       guard(mutex)(&shid->power_lock);
>
> Because spi_hid_wait_for_reset() is sleeping with shid->power_lock held,
> spi_hid_error_handler() blocks on shid->power_lock and cannot perform any
> of its SPI_HID_MAX_RESET_ATTEMPTS recovery resets until
> spi_hid_wait_for_reset() times out after 2000 ms and spi_hid_resume() or
> spi_hid_suspend() returns. That leaves SPI_HID_READY cleared when
> hid_driver_reset_resume() runs, and delays the error reset until after
> resume finishes.

Will fix in v7: resume no longer calls hid_driver_reset_resume() when the
device is not ready. Delaying the error reset until resume returns is
intentional.

>
> > +
> > +static int spi_hid_suspend(struct spi_hid *shid)
> > +{
> > +     int error;
> > +     struct device *dev =3D &shid->spi->dev;
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
> > +                             return error;
> > +                     }
> > +             }
> > +     }
> > +
> > +     /*
> > +      * disable_irq() waits for a running IRQ thread, so no new reset_=
work
> > +      * can be queued after it returns. Then wait for any queued or ru=
nning
> > +      * instance. Must not hold power_lock here: reset_work takes it.
> > +      */
> > +     disable_irq(shid->spi->irq);
> > +     cancel_work_sync(&shid->reset_work);
>
> [Severity: High]
> Can calling disable_irq(shid->spi->irq) before
> cancel_work_sync(&shid->reset_work) starve an in-flight synchronous
> request in spi_hid_reset_work()?
>
> If shid->reset_work is already running when spi_hid_suspend() disables th=
e
> IRQ, it may be executing a synchronous request in:
>
>   spi_hid_reset_work()
>     spi_hid_reset_response() / spi_hid_create_device() / spi_hid_refresh_=
device()
>       spi_hid_sync_request()
>         __spi_hid_sync_request()
>           wait_for_completion_timeout(&shid->output_done, ...)
>
> Since shid->output_done is completed by spi_hid_response_handler() from
> the threaded IRQ handler spi_hid_dev_irq(), disabling the IRQ first
> prevents the response interrupt from being serviced while
> cancel_work_sync() waits for reset_work.
>
> This stalls cancel_work_sync() for the full SPI_HID_RESP_TIMEOUT, fails
> the request with -ETIMEDOUT, clears SPI_HID_READY, sets SPI_HID_ERROR,
> and triggers dev_WARN_ONCE() in spi_hid_reset_response():
>
>         error =3D spi_hid_sync_request(shid, &report);
>         if (error) {
>                 dev_WARN_ONCE(dev, true,
>                               "Failed to send device descriptor request: =
%d\n", error);
>                 set_bit(SPI_HID_ERROR, &shid->flags);
>                 schedule_work(&shid->reset_work);
>         }
>
> For wakeup-enabled devices, this also leaves the device suspended with
> SPI_HID_READY cleared (causing spi_hid_input_report_handler() to drop
> wakeup input reports) and SPI_HID_ERROR pending. In addition, because
> shid->power_lock is released after hid_driver_suspend() and before
> disable_irq(), spi_hid_create_device() or spi_hid_refresh_device() in
> spi_hid_reset_work() can register a new shid->hid in that window that
> never has hid_driver_suspend() called on it.

Will fix this in v7.

>
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
> > +                     if (error) {
> > +                             dev_err(dev, "%s: could not power down\n"=
, __func__);
> > +                             shid->regulator_error_count++;
> > +                             shid->regulator_last_error =3D error;
> > +                             /*
> > +                              * Undo partial suspend before returning =
error.
> > +                              * Complete the reset; RESET_PENDING stay=
s set
> > +                              * until the device sends its reset respo=
nse.
> > +                              */
> > +                             shid->ops->sleep_minimal_reset_delay(shid=
->ops);
> > +                             reinit_completion(&shid->reset_done);
> > +                             shid->ops->deassert_reset(shid->ops);
> > +                             enable_irq(shid->spi->irq);
> > +                             if (shid->hid) {
> > +                                     spi_hid_wait_for_reset(shid);
> > +                                     hid_driver_reset_resume(shid->hid=
);
> > +                             }
> > +                             return error;
> > +                     }
> > +
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
> > +     if (test_bit(SPI_HID_DEAD, &shid->flags)) {
> > +             /* Stay off; only balance disable_irq() in suspend. */
> > +             enable_irq(shid->spi->irq);
> > +             return 0;
> > +     }
> > +
> > +     if (!device_may_wakeup(dev)) {
> > +             if (shid->power_state =3D=3D HIDSPI_OFF) {
>
> [Severity: Medium]
> Can gating the power-up path on !device_may_wakeup(dev) and
> shid->power_state =3D=3D HIDSPI_OFF leave the device unpowered across res=
ume
> or hibernation restore?

This is addressed in 11/11.

>
> In this commit, if shid->power_state is HIDSPI_OFF while
> device_may_wakeup(dev) is true (for example, if power/wakeup is enabled
> while suspended or after a failed power_up()), spi_hid_resume() skips
> powering up and resetting the device. A later commit in the series ("HID:
> spi-hid: add panel follower support") removes the outer
> !device_may_wakeup(dev) check in spi_hid_resume(), but hibernation still
> has a related problem when wakeup is enabled.
>
> Because spi_hid_core_pm uses SYSTEM_SLEEP_PM_OPS(spi_hid_core_pm_suspend,
> spi_hid_core_pm_resume), .freeze, .thaw, .poweroff, and .restore all call
> spi_hid_suspend() and spi_hid_resume(). When device_may_wakeup(dev) is
> true during hibernation:
>
> 1. During .freeze, spi_hid_suspend() sees device_may_wakeup(dev) and skip=
s
>    clearing SPI_HID_READY, asserting reset, calling ops->power_down(), an=
d
>    setting shid->power_state =3D HIDSPI_OFF. The hibernation image theref=
ore
>    saves shid->power_state as HIDSPI_ON (and conf->supply_enabled as true
>    in spi-hid-of).
>
> 2. During .poweroff, spi_hid_suspend() again skips powering down the
>    device, and platform power is then removed by S4 or by the boot
>    kernel's .freeze before image restoration.
>
> 3. During .restore, spi_hid_resume() sees shid->power_state =3D=3D HIDSPI=
_ON
>    from the restored image, skips assert_reset(), power_up(),
>    deassert_reset(), and spi_hid_wait_for_reset(), and calls
>    hid_driver_reset_resume(shid->hid) while the hardware is unpowered or
>    held in reset.

Will address this in a follow-up patch.

>
> > +                     shid->ops->assert_reset(shid->ops);
> > +
> > +                     shid->ops->sleep_minimal_reset_delay(shid->ops);
> > +
> > +                     error =3D shid->ops->power_up(shid->ops);
> > +                     if (error) {
> > +                             dev_err(dev, "%s: could not power up\n", =
__func__);
> > +                             shid->regulator_error_count++;
> > +                             shid->regulator_last_error =3D error;
> > +                             /* Suspend runs next even if resume fails=
. */
> > +                             enable_irq(shid->spi->irq);
> > +                             return error;
> > +                     }
> > +                     shid->power_state =3D HIDSPI_ON;
> > +                     reinit_completion(&shid->reset_done);
> > +                     shid->ops->deassert_reset(shid->ops);
> > +                     was_reset =3D true;
> > +             }
> > +     }
> > +
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
> [Severity: High]
> Should spi_hid_resume() and the power_down() error rollback in
> spi_hid_suspend() check the return value of shid->ops->deassert_reset()
> and handle timeouts from spi_hid_wait_for_reset()?
>
> Unlike spi_hid_core_probe() and spi_hid_error_handler(), both sites ignor=
e
> the return value of shid->ops->deassert_reset(shid->ops) (which evaluates
> the ACPI _RST method in spi_hid_acpi_deassert_reset() or drives the reset
> GPIO in spi_hid_of_deassert_reset()).
>
> If deassert_reset() fails, or if the device fails to respond before
> spi_hid_wait_for_reset() times out, spi_hid_wait_for_reset() only logs a
> warning and returns without setting SPI_HID_READY, setting SPI_HID_ERROR,
> or scheduling shid->reset_work (and if shid->hid is NULL,
> spi_hid_wait_for_reset() is not called at all).
>
> Both functions then unconditionally call hid_driver_reset_resume(shid->hi=
d)
> while SPI_HID_READY is still 0, causing any synchronous HID requests
> during reset_resume to fail with -ENODEV in __spi_hid_send_output_report(=
),
> and leaving the device stuck in SPI_HID_RESET_PENDING with no recovery
> scheduled.

Will fix this in v7.

>
> [Severity: Medium]
> Also in spi_hid_resume(), what happens when a wakeup-enabled device
> (was_reset =3D=3D false) resumes while reset or recovery work is pending?
>
> When SPI_HID_RESET_RESPONSE, SPI_HID_CREATE_DEVICE, or SPI_HID_ERROR was
> pending when spi_hid_suspend() cancelled shid->reset_work, SPI_HID_READY
> is 0.
>
> In spi_hid_resume(), schedule_work(&shid->reset_work) queues the worker
> asynchronously while shid->power_lock is still held, spi_hid_wait_for_res=
et()
> is skipped because was_reset is false, and hid_driver_reset_resume(shid->=
hid)
> is called immediately before shid->reset_work can complete the reset and
> set SPI_HID_READY.
>
> As a result, __spi_hid_send_output_report() rejects any feature or output
> reports sent by hid_driver_reset_resume() with -ENODEV:
>
>         /* While not READY, only (re)init descriptor requests may be sent=
. */
>         if (report->report_type !=3D DEVICE_DESCRIPTOR &&
>             report->report_type !=3D REPORT_DESCRIPTOR &&
>             !test_bit(SPI_HID_READY, &shid->flags))
>                 return -ENODEV;
>

Will fix this in v7.

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
> [ ... ]
>
> > @@ -1454,6 +1620,25 @@ void spi_hid_core_remove(struct spi_device *spi)
> >  }
> >  EXPORT_SYMBOL_GPL(spi_hid_core_remove);
> >
> > +static int spi_hid_core_pm_suspend(struct device *dev)
> > +{
> > +     struct spi_hid *shid =3D dev_get_drvdata(dev);
> > +
> > +     return spi_hid_suspend(shid);
> > +}
> > +
> > +static int spi_hid_core_pm_resume(struct device *dev)
> > +{
> > +     struct spi_hid *shid =3D dev_get_drvdata(dev);
> > +
> > +     return spi_hid_resume(shid);
> > +}
> > +
> > +const struct dev_pm_ops spi_hid_core_pm =3D {
> > +     SYSTEM_SLEEP_PM_OPS(spi_hid_core_pm_suspend, spi_hid_core_pm_resu=
me)
> > +};
> > +EXPORT_SYMBOL_GPL(spi_hid_core_pm);
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-send-ups=
tream-v6-0-cb9ba4b3d6fa@chromium.org?part=3D10
