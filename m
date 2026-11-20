Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795214534;
	b=Vt6vca/2YOSyVHJ+35wsx5zClRl2RzYZr12wac1C0FrxiGkbAKwNf4GBKBgxEVp03ad+
	 HcnlhC9PwuVJpbMasjhjyVBUVttN/ILdOmlzlIQMxRRsv+7igSTt6LDnU9MnojfM3s/MP
	 7syJYU61sKnu9pSuarwikEqH+24St2scWWPkbrmNYnx5fDd60KCBboFEMBGvWHEsHAxa6
	 babXChcBlo4q4a8RzICtkBVI+fjhuiMQc6kkmCu6hiIgGrfQMXRJqMZqAPbIFgCtbfF5h
	 DYJwXNPJ3DdEedN6VQewjDZNMEzwljRCyIvpoQiKClr/8TR9y0YnCRmKm4S/qaay2uA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vQU4s0s9jpO6QmWD/0jmrJPFOrD2Wfw5sN63JkEaowU=;
	b=IvyfNqI5Y60VvwC/5pmnIqwqq7ZMG70zk+ll4EX9jElnsKbkKooL5ndbOjwpBH93cpEt
	 EfPRK/T2tDqlZ+nGrIHqnyWx5TerUHgytbk7k3grSD4pxWgAAaD/+YD55TRTfwFE4gi+H
	 EWeCECf/H13z46Drdk3chTSG+QNHR1Abb4/lg8WZOG7C0NyfVKlgWq8xKUGIhwzfM2Svx
	 8nKPj2HSOANlzHqQ1fiUDImOuMcJ4R3jmj6GEGC830fjf4ykQ1UYNvZp8ouZMDLnFKMW5
	 JFUCOFvq1N53wNmi37W/KnlJpl+UZf66nWOKFWPER0HvJ+44esenfIvvouwix1x749g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fvNFs6YW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE3F606A6B6
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 22:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE3F606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fvNFs6YW
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so1719087d50.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 14:42:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795214531; cv=none;
        d=google.com; s=arc-20260327;
        b=pCzHfJfOxJhDXPI3nsNaol8rHCfQ7bbPeO9Rsb/sPSXeMICJlezqeGiGtlN4zfQExF
         8H9z4blz3DYHTre5zFzuSkfwb+HIw+04X8AlN2SGotffUYNe35LROyOl0yP+WkJAdM0W
         KA0aEr6B7AQJMAR61JGgYUIGL/xFWzbaBAGhDbxtt9sB3C+sdPjfhGU4UN1VOWEEsWD+
         1k07ciMEMPTgcwF+HjBTdHx/M5PTVYQvMRrrzKRaiA5ZKKnrTr1WMcRmj5qWN24TSNVg
         PWYn92CdznqwkzvXVUAMIHXOdPc/FtNldlBNaK+kWuN/MkHAAysKueqSZ2rTMn9PBTJA
         aMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vQU4s0s9jpO6QmWD/0jmrJPFOrD2Wfw5sN63JkEaowU=;
        fh=+uMTvrTApADlB7BHILEpCXu1EzyVTwPprA6Fp7VhMFw=;
        b=Xb08F2On2LUfACsvEB5TmanEjJFDZeq0zOfvvniBgegCikBSK/ZHe8QdwM9r+KlvTs
         57Ye4G4f+/21hAHn+encdusH/XfRjJsbikCqmiJ9OurepTIJPD0+AfLZgDBzBRyeLlVR
         8KPfHM1WZ58KegaEQKzTojyJrVRYIgTA7wnN0OH6CpDQOYMK+mRpv4PKL8DMqJH/kwTa
         Al5+WXJCgBOjjF2QD8z0sAbYkETGv3tAxMnBPFhNnsHf6IUmPGCpzkU1n/Up/QmWGN5C
         cLce3nsQjNPote3uLoRoVwYg1Mx0ryYx416JWjSKCxQ4b3WU/L96c5mz7Gqy7xmBB9xD
         umQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795214531; x=1795819331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vQU4s0s9jpO6QmWD/0jmrJPFOrD2Wfw5sN63JkEaowU=;
        b=fvNFs6YWasf+wplVYmHAek4F/XoGdUzQF5xAHO5IGZp5CRRMRRxkruN3V+DWI4+hCW
         oHgp2SRsfzcmufJj7ymjrsKVE0kw4s8HdIeYBoJqV5T7lhTewU9l1CwTZk4K5ZUFxWIh
         2dqCA02YjCgAuB7cdfi9YfOGibXePz+tK2myU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795214531; x=1795819331;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQU4s0s9jpO6QmWD/0jmrJPFOrD2Wfw5sN63JkEaowU=;
        b=fnlOPxqeqDl0QVX8/k3LUmVnOnJd5vp5tXUdDPQD/FirZn7vqchE5ENqbok8Lxxbbv
         pEFmszwzsEd8hmMEDBWwA8HhYKFH6bWg86FpMx2dSZjDwh6co6spwA4yU9GkkumXnNOz
         ldqiX0xvVuqha7p9GScLYQmRyFh5RkVn9llEzushGrCWdKkjYvyo8qjjR3/49/ERxZh9
         uUxsTStoPt0G8GDVyC5woAb3eAVjjOOl8DUo1dppozTdSp3ey4yOtADOmSiNZg6skDOn
         HWrdp/oZSXNEE3/4Ega//rvWYC2S4F7Mgad7DFkS7kfT2J2hE7Bd/OwWsO7U58SI2e/C
         7DsQ==
X-Forwarded-Encrypted: i=1; AL+hErH5KOXDmbDf2zueUGTsS1TVy0Dqrh13WS/N/c+FWe3ydk6Eb7C7WoZkC2xutvLVptqg3KLYa0sICNGG@vger.kernel.org
X-Gm-Message-State: APuU4Z9KrJO978KukwnhCqF0gA8FxJ+1dVYs24JtoTmHU/JGO9Oeb5hH
	gEhFyCmNVBQ07DjGem7hyYs1BEePuliADiWON8PedoNSuU6aUFDYr45Q7yMxaIhOisYNDVTWvUh
	frBgGRRn75xizJM+O31dJGvMLEnDqOOQZrwbCR7fn
X-Gm-Gg: AZFdTZcd1oRWhLsLXGDeB03nMMzNTnfEDBacFcHIWP3Plvw/e9fA8b0hDmMCTokPLP7
	gwgb47dYp9FlGWVclCDJxsrqsgTY0u5t5KaaafNtmi5VCh3Q7X/gIcoJ6eM43sMLUq+PrDM+8/K
	zCTnwQULa0r/PqWpR4iB6gXtloa/3VclY1cp5OhNJzvbMkn6PklpRDRiVriKyq9jZ3+gOIfTTfZ
	+bd6Dh9HRZiKayWS8RJoClbbaJzOW024VA/3NoJ00BVe85Ihc+SpT7GmzpCtexYTdW0hqtlsOp6
	S/sbUYFTnu4avLOsXQwI2TLTHZV4UziaxX/s0sLdghiJavdn/NDbdQs69dvv6xzSV9Y0wLqF/nj
	czkpBqYZ57KnRUp4khOgNxf9lwYSDlq/3t6FW+15SMT283cKZdM+MHLzEdFm7m8gMc48=
X-Received: by 2002:a05:690e:1918:b0:67d:e4c3:d838 with SMTP id
 956f58d0204a3-67df440a008mr1910475d50.29.1795214531587; Fri, 20 Nov 2026
 14:42:11 -0800 (PST)
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
 <20261024-send-upstream-v7-11-abad13174b43@chromium.org> <sashiko-outbox-183484@kernel.org>
In-Reply-To: <sashiko-outbox-183484@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Fri, 20 Nov 2026 14:42:00 -0800
X-Gm-Features: Aa3M54qwBjwBmrAzhDq76JOH0mkyHB45HQlbB0ykD_xKYZsQBf4Gvgfm3ggVaBs
Message-ID: <CAEe3GZHSuQ2c2gOJPgJDu08T2+m+2RHLmcpGsE_0o+=UX96F_A@mail.gmail.com>
Subject: Re: [PATCH v7 11/11] HID: spi-hid: add panel follower support
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 6:10=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] HID: spi-hid: unrecovered deassert_reset() failure in spi_hid_=
resume()
> - [Medium] HID: spi-hid: improper wakeup teardown for panel followers in =
probe
> --
>
> commit 35d9a38c1b6ffa8dbb3ab740ec9ce120c5b2e7a1
> Author: Jingyuan Liang <jingyliang@chromium.org>
>
> HID: spi-hid: add panel follower support
>
> This commit adds DRM panel follower support to spi-hid so that a follower
> device powers up and suspends in coordination with its panel rather than
> during initial probe and standard system PM callbacks.
>
> > diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/s=
pi-hid-core.c
> > index 3b8874ca0e1cc..496b33cdf3d46 100644
> > --- a/drivers/hid/spi-hid/spi-hid-core.c
> > +++ b/drivers/hid/spi-hid/spi-hid-core.c
>
> [ ... ]
>
> > @@ -325,28 +328,30 @@ static int spi_hid_resume(struct spi_hid *shid)
> >               return 0;
> >       }
> >
> > -     if (!device_may_wakeup(dev)) {
> > -             if (shid->power_state =3D=3D HIDSPI_OFF) {
> > -                     shid->ops->assert_reset(shid->ops);
> > +     /*
> > +      * Check power_state, not device_may_wakeup(): power/wakeup can c=
hange
> > +      * while the device is off.
> > +      */
> > +     if (shid->power_state =3D=3D HIDSPI_OFF) {
> > +             shid->ops->assert_reset(shid->ops);
> >
> > -                     shid->ops->sleep_minimal_reset_delay(shid->ops);
> > +             shid->ops->sleep_minimal_reset_delay(shid->ops);
> >
> > -                     error =3D shid->ops->power_up(shid->ops);
> > -                     if (error) {
> > -                             dev_err(dev, "%s: could not power up: %d\=
n", __func__, error);
> > -                             /* Suspend runs next even if resume fails=
. */
> > -                             enable_irq(shid->spi->irq);
> > -                             return error;
> > -                     }
> > -                     shid->power_state =3D HIDSPI_ON;
> > -                     reinit_completion(&shid->reset_done);
> > -                     error =3D shid->ops->deassert_reset(shid->ops);
> > -                     if (error)
> > -                             dev_err(dev, "%s: failed to deassert rese=
t: %d\n",
> > -                                     __func__, error);
> > -                     else
> > -                             was_reset =3D true;
> > +             error =3D shid->ops->power_up(shid->ops);
> > +             if (error) {
> > +                     dev_err(dev, "%s: could not power up: %d\n", __fu=
nc__, error);
> > +                     /* Suspend runs next even if resume fails. */
> > +                     enable_irq(shid->spi->irq);
> > +                     return error;
> >               }
> > +             shid->power_state =3D HIDSPI_ON;
> > +             reinit_completion(&shid->reset_done);
> > +             error =3D shid->ops->deassert_reset(shid->ops);
> > +             if (error)
> > +                     dev_err(dev, "%s: failed to deassert reset: %d\n"=
,
> > +                             __func__, error);
> > +             else
> > +                     was_reset =3D true;
> >       }
>
> [Severity: Medium]
> What happens if shid->ops->deassert_reset(shid->ops) fails in
> spi_hid_resume()?
>
> For non-followers, initial power-up goes through spi_hid_dev_init(), whic=
h
> powers down the device and returns the error when deassert_reset() fails.
> For panel followers, spi_hid_core_probe() leaves shid->power_state as
> HIDSPI_OFF and shid->hid as NULL, and spi_hid_panel_follower_work() relie=
s
> on spi_hid_resume() for the initial power-up as well as subsequent resume=
s.
>
> When deassert_reset() fails in spi_hid_resume(), was_reset remains false
> while shid->power_state is set to HIDSPI_ON and the IRQ is enabled with t=
he
> device still held in reset:
>
> drivers/hid/spi-hid/spi-hid-core.c:spi_hid_resume() {
>     ...
>         if (shid->hid) {
>                 if (was_reset && spi_hid_wait_for_reset(shid)) {
>                         /* No reset response: let recovery retry. */
>                         set_bit(SPI_HID_ERROR, &shid->flags);
>                         schedule_work(&shid->reset_work);
>                         return -ETIMEDOUT;
>                 }
>                 /* HID requests would fail while the device is not ready.=
 */
>                 if (!test_bit(SPI_HID_READY, &shid->flags))
>                         return 0;
>     ...
> }
>
> On the first power-up of a panel follower, shid->hid is NULL, so
> spi_hid_resume() returns 0 without scheduling shid->reset_work. On subseq=
uent
> resumes where shid->hid is non-NULL, was_reset is false and SPI_HID_READY=
 was
> cleared during spi_hid_suspend(), so spi_hid_resume() again returns 0 wit=
hout
> setting SPI_HID_ERROR or scheduling shid->reset_work.
>
> Should a deassert_reset() failure in spi_hid_resume() trigger recovery (o=
r
> clean up and return the error) so the device is not left powered on in re=
set
> and permanently uninitialized?

Same as the 10/11 comment; the next panel prepare retries the power
up.

>
> > @@ -1447,6 +1452,108 @@ static struct hid_ll_driver spi_hid_ll_driver =
=3D {
>
> [ ... ]
>
> > +static int spi_hid_register_panel_follower(struct spi_hid *shid)
> > +{
> > +     struct device *dev =3D &shid->spi->dev;
> > +
> > +     shid->panel_follower.funcs =3D &spi_hid_panel_follower_prepare_fu=
ncs;
> > +
> > +     /*
> > +      * If we're not in control of our own power up/power down then we=
 can't
> > +      * do the logic to manage wakeups. Give a warning if a user thoug=
ht
> > +      * that was possible then force the capability off.
> > +      */
> > +     if (device_can_wakeup(dev)) {
> > +             dev_warn(dev, "Can't wakeup if following panel\n");
> > +             device_set_wakeup_capable(dev, false);
> > +     }
> > +
> > +     return drm_panel_add_follower(dev, &shid->panel_follower);
> > +}
>
> [ ... ]
>
> > @@ -1523,21 +1618,19 @@ int spi_hid_core_probe(struct spi_device *spi, =
struct spihid_ops *ops,
> >               }
> >       }
> >
> > -     error =3D shid->ops->power_up(shid->ops);
> > -     if (error) {
> > -             dev_err(dev, "%s: could not power up: %d\n", __func__, er=
ror);
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
> > +             /* Like the IRQ: the first panel_prepared resume enables =
it. */
> > +             disable_work(&shid->reset_work);
> > +             error =3D spi_hid_register_panel_follower(shid);
>
> [Severity: Medium]
> Does calling device_set_wakeup_capable(dev, false) in
> spi_hid_register_panel_follower() after devm_pm_set_wake_irq() in
> spi_hid_core_probe() leave the wake IRQ configured and leak
> dev->power.wakeup if wakeup was enabled on the device before probe?
>
> In spi_hid_core_probe(), if the firmware node marked the device as wakeup
> capable (for example via acpi_bind_one()), device_can_wakeup(dev) is true=
 and
> devm_pm_set_wake_irq(dev, spi->irq) attaches a wake IRQ before
> shid->is_panel_follower is checked:
>
> drivers/hid/spi-hid/spi-hid-core.c:spi_hid_core_probe() {
>     ...
>         if (device_can_wakeup(dev)) {
>                 error =3D devm_pm_set_wake_irq(dev, spi->irq);
>                 if (error) {
>                         dev_err(dev, "%s: failed to set wake IRQ\n", __fu=
nc__);
>                         return error;
>                 }
>         }
>
>         if (shid->is_panel_follower) {
>                 /* Like the IRQ: the first panel_prepared resume enables =
it. */
>                 disable_work(&shid->reset_work);
>                 error =3D spi_hid_register_panel_follower(shid);
>     ...
> }
>
> Furthermore, if a wakeup_source was attached to dev->power.wakeup (for
> example via sysfs power/wakeup before async or deferred probe completes),
> calling device_set_wakeup_capable(dev, false) directly sets
> dev->power.can_wakeup =3D false without detaching the wakeup source first=
.
> Subsequent calls to device_wakeup_disable(dev), including from
> device_pm_remove() on unbind, check dev->power.can_wakeup and return earl=
y:
>
> drivers/base/power/wakeup.c:device_wakeup_disable() {
>         struct wakeup_source *ws;
>
>         if (!dev || !dev->power.can_wakeup)
>                 return;
>
>         ws =3D device_wakeup_detach(dev);
>         wakeup_source_unregister(ws);
> }
>
> Should spi_hid_register_panel_follower() use device_init_wakeup(dev, fals=
e)
> (which calls device_wakeup_disable(dev) before clearing wakeup capability=
),
> and should spi_hid_core_probe() skip devm_pm_set_wake_irq() when
> shid->is_panel_follower is true?

This follows i2c-hid's panel follower handling. The wake IRQ is
not armed once can_wakeup is cleared, and the SPI core doesn't
enable wakeup before probe.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-send-ups=
tream-v7-0-abad13174b43@chromium.org?part=3D11
