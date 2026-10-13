Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5DD5625EB
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 22:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791929717; cv=pass; b=BQJ+bkYTTQJRD6/EOh/OFLy6lTGc2nIH76LY5sMWxcGocj03QFyyvR4I0Uk6M1VF+cmHiYEvQhKCp9B7RV0nMZ5ZM1GifTrDuO0fFDJ6sAL0dZhPOYgtFf+MKbQrlgYhwaWIPliX555X/a79VXv7a82ydnLlMgt6lwAxTEEyChs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791929717; c=relaxed/simple;
	bh=YoOftzpeEReVb6O4VclP/t8iOYPrrpNMFEoppDguHGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fKE5z+OUVTCddU2GizGseswIdOyWE1JBhQVG1beoC2CofMIlKoHGULwq4VEiVergGovBQhwcyp77lqzDLS5+yc82tttVlEr6QjxW0jgUsZ7jWecS5sGwFb4fZY9mL6YdCoP8MIlTn8xesbgADTVq8h1OTWUQMajnnjqgche9n9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CU2M3KlD; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CU2M3KlD"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8ab38a051aaso28400367b3.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:15:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791929712; cv=none;
        d=google.com; s=arc-20260327;
        b=Cq8x9ZOccl9me8y/CUXUes6uDIrNMv4takXPZa9YDc9xbYeB+jSxZGl8lSeGY5rx/6
         YVEv12AW48MxMacQrXdmhtcYoWjWyWscWZGjOdTyZVkrDHAhNTbeovrhYOgEe2ZoUfta
         6qefnO1Nt+IObSRZmHtatzgcXxjE8sNLona7z7lVu/T+O2QIizAuPcTJVSEknccz3DvP
         6fPAZG6f4Mmu7e3SvgnYtOCxrygn3Wa+Xpr0veEhy37Af4NrIGPulfio18aqRW0q6eME
         98U6VQ+wjFreBv4VGO+ROfk69BeR53mdQzAhxYvZIfrE94BIVftdc1I7UDP8X3DjBVxa
         cFEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gu1pMEg3izEfc/rQ67eSbYz040q7y2e9OLH8nvi7wBU=;
        fh=3pv70WFf4AjwPc34yOdaPBDsmDLm8dPJkJENFb17Yhw=;
        b=WWS3olaXd1y9nhig0ybms+kjz89vWOPr6IUSAAUE34KNTMpEpsf5QERdfGrTTybP4L
         Il0BvOwwryEpT40YN9r+2hiK6xayV7qkmOiGD0P4uL3vms1zZWg/vzMan7OMUiHUc27/
         5SFxyCReSNzyxjLdNRWVQ3geTF+gRHcUA2dnZa4l2TdufgHa6VlLbfkxo/JO6+rVeWwZ
         IlnBl7f1OBsICXpvmectg/HA582qiDcW5lqcdyBGKMUlIX5f8htQEy+KnN0vdIvPKhzR
         NdMiEtIf6A8F5zwI7O2t2hCB6iqthRRCVmnu8ntZ+Vn/BY0ZPH659tav5gbyGC19fJCC
         FJ6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791929712; x=1792534512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gu1pMEg3izEfc/rQ67eSbYz040q7y2e9OLH8nvi7wBU=;
        b=CU2M3KlDWGShhDGLsvVmNHaag52sVAPgnsl/46rX4qmt6Oq5kdhpnE2Ya2eqYjeKAl
         nqoIYb2uYCDSy6x6hc0GVKf0hy99xPkaUTbhAOx4fojhEw+lm/yYy/l9joKVl39iSRwp
         MOANNDIM2El7Nbfv1Of3F4DOG75+7iqqBEKUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791929712; x=1792534512;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gu1pMEg3izEfc/rQ67eSbYz040q7y2e9OLH8nvi7wBU=;
        b=fXTFww9lr+i1Rc83Bjc0VctHcv85kYcsQjn4QcD2fV7GCBNBKB54vpAMg7urarnqIL
         hja1uCLDNgKAYmx7NFXvom+kr3N3ZoNnqLYgYmN2UUeyQOEFuN+h6fdeNQukcIF7HNUk
         OJWDqIMNStDmMbjvLQSUOJwD6tVJOSS3ui0j3Ts1sg1JwGpKbIPGFiXXNizPG/z/6cib
         NOg1nR+Pk8tpHhZkObDgV54Gx6C7ZYszZdq7hZEJffpgiRD77troD3BP8Edi2g1MydVM
         pnWYMWFLTvQeYMw7YDyrzIMpyR1b2RIImRj1mBojCuKad3p7EyN59yqJGgt8i3tWLElf
         QGfw==
X-Forwarded-Encrypted: i=1; AKwUvBxJJl56jDwFLcSbquaKTmNPPpPzPjJHzhVTlGFXq6ohMChBzknNo8u3VUQ5TgQlVmWEtHjiXdSmLFwm@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8LSdT8FWdDy3E+ipkKvNOBxsd0HpS2Gqu5HJIlwMKABrOKLRL
	5airYaLiPCZN5/1ZjEcJj0xxgq0PISHONSUa4iYZrOfs+TmXXV3q77fy6IxAGuQPdNBymmBU7Rd
	DlyihIOkX0a3/YFwl2hyUbPVFg+Ku4PBVyRvNZjGg
X-Gm-Gg: AYBFou35NPGRgn18C0IoNBbARSz27WnEYSxG/4Jwxh3aRRcSyB8dVzU1q/PJttm+z25
	Ohj+oRAo4+3NishUEjYGPzKYhKN34HfXyBz1hAKTJTKbn9nhedXfjOOvXxncQAcq9FyqlRU4nF4
	KPFIOU3a9F04Bsc7jwkwRR8nH40pMvF96UwMJ3VK59EraowT2dIF6n3hcyVnrgs3r6Da7FgWuOm
	ZvhZZ8N6yjmYUd8l5xvQGMOJpuykoGM1hEDU/FTAKtG8/VjM40rNeu9Ok2GNR3kC+mBV3Duhn9B
	qP0Xufc/DnDqNPk3clHjGBRApjy3TBNd0t8FNbYudIEWF4bxAqSVmfURsML4o58QqcyxXafykwA
	JWwLkPFB45Q==
X-Received: by 2002:a05:690c:e1d9:10b0:8ae:dfee:cd30 with SMTP id
 00721157ae682-8b07ee80677mr35220177b3.56.1791929712213; Tue, 13 Oct 2026
 15:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-7-384af01da3ee@chromium.org> <sashiko-outbox-166152@kernel.org>
In-Reply-To: <sashiko-outbox-166152@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 13 Oct 2026 15:15:00 -0700
X-Gm-Features: AclHuK8LY0flPJXmLlCRmm3TtT6hKXqXYTxefNgnCBXeN5jvcX9L7jCw_bXXSqQ
Message-ID: <CAEe3GZFCEBXTQqGw+JdppYm7hCwuoBTXuAf104ru5nArKwes9A@mail.gmail.com>
Subject: Re: [PATCH v5 07/11] HID: spi-hid: add ACPI support for HID over SPI
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 3:41=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] spi-hid: data race on bus_error_count in spi_hid_error_handler
> --
>
> commit a262e333d16eb58c8aa593f81c7497790c2b01b7
> Author: Angela Czubak <acz@semihalf.com>
>
> HID: spi-hid: add ACPI support for HID over SPI
>
> Detect SPI HID devices described in ACPI.
>
> > diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/s=
pi-hid-core.c
> > index 83678e6835818..f4e9b4e1294ed 100644
> > --- a/drivers/hid/spi-hid/spi-hid-core.c
> > +++ b/drivers/hid/spi-hid/spi-hid-core.c
>
> [ ... ]
>
> > @@ -327,8 +303,21 @@ static void spi_hid_error_handler(struct spi_hid *=
shid)
> >
> >       shid->power_state =3D HIDSPI_ON;
> >
> > -     shid->ops->deassert_reset(shid->ops);
> > +     error =3D shid->ops->deassert_reset(shid->ops);
> > +     if (error) {
> > +             dev_err(dev, "failed to deassert reset: %d\n", error);
> > +             shid->bus_error_count++;
> > +             shid->bus_last_error =3D error;
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> [Severity: Low]
> Does this introduce a data race with other updaters of bus_error_count?
>
> Userspace sending an output report via __spi_hid_send_output_report() che=
cks
> SPI_HID_READY locklessly. If SPI_HID_READY is read as 1 just before
> spi_hid_error_handler() clears it, the output report path proceeds to acq=
uire
> io_lock and invoke spi_hid_output(), which updates bus_error_count on err=
or
> (under io_lock).
>
> Because spi_hid_error_handler() updates bus_error_count here without hold=
ing
> io_lock, both threads can execute shid->bus_error_count++ concurrently, w=
hich
> can lead to lost increments or torn reads via sysfs.

This is harmless in practice: bus_error_count and bus_last_error are
only debug counters shown in sysfs, and losing an increment would
need two failures at the same moment.

>
> > +             /*
> > +              * Without a successful reset the device will not send a =
reset
> > +              * response, so no IRQ would trigger another recovery att=
empt.
> > +              * Retry from here; reset_attempts bounds the number of t=
ries.
> > +              */
> > +             set_bit(SPI_HID_ERROR, &shid->flags);
> > +             schedule_work(&shid->reset_work);
> > +     }
> >
> > +     /* Balance disable_irq() above; a retry disables it again. */
> >       enable_irq(shid->spi->irq);
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-send-ups=
tream-v5-0-384af01da3ee@chromium.org?part=3D7
