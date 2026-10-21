Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792625066;
	b=ZDIDmN7Y0VFDFJhbsm9WkNSmIOFPb6bdwt0rbB+rpr1mec/G80MZ2rbDuuV3nBkqzaDs
	 quTZj/lg5KBfZPQDt5j1bAp8Hy87u8DE0nDCgue1vWAACcMSCRbR5O7fMRHvO1EYOTMDL
	 3tFERlzpjXcLKrD80OoXm2lZ/YXM9kyaFMYHYlSWyIotXt9GgJ32/H2w4H5ak5DBqkQoB
	 XIz7BwghXFwPuSKgpmk5g5FYbzCqmVpsdT8/YPSxAp+W9irWEKCQ9QsTKpvRB63TNkhnO
	 gG7mVFT2PPc81Mu+h7L32eK3c/vU0MCvEa9ayKPMAypsd+uvRnax0C29UoyCg9fmllg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792625066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OOnJLMePRidiRd6Zbc0eEriUIlHpT2oioIudJsKLtbo=;
	b=vWTJRYR7Zv4Evvn9NB1pipRtmuySYsw8CxUh18Q/tk7YLAbdBMl9IjT9Zkh0G0r4OOTw
	 CglJBdhrCvaRZyM0ccmUt14HZUvZzDr5Ljcu9HNWrr9XAEJ5Hyjm2La7Ig8HEBXkGkyk2
	 jhtPMmkwzNnZZ17AWPdpK17sQh4ZRKVgKiV4dMVqku9EIkK4VSBMQ5/34Usfqq67h/r+g
	 X6878M17yRRco+4S9PgaOA8q7JV6eR/yj5/uRj1jrhG8wVdMQDHljDF5vye6TeyG3v//7
	 WSUjPcalajIL8orKJCZjHB3rpyZ0ljlswJkw4hTS2zxuwassTBczkWf4OHQOco/gbaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oLi8y7J2;
	arc=fail smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFEA606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 23:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AFEA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oLi8y7J2
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8ac8a2ac52bso4271177b3.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 16:24:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792625065; cv=none;
        d=google.com; s=arc-20260327;
        b=SdwGCqBn3qMdn87TdTMSG3eMuJ6tjMcUae+2A9bKZP6DDwn3xYyUgdCN7t69T9KdDi
         7Ngfp4+U0zXutF/eIOOTFxSQfNxxcH/a7XEt/4yFBp/ysnxKI2TKveleRMfOB8GnKqpk
         og4DbDSeqAUJNYwz68fqOXxfEKOPbC4K17GdCSDP1f/D5BODGXo7r10UycwpjVNgCuOm
         6mmg3kk0zX5TE/qbtYmFT3Ul71oKGvyXpnhxkIAIM1eAyHnelulu30h1TWwo4JAwmqI1
         PKuXQLYSLjF1QGy5xcQPbwz2iqaKmTzwRr1k0H6RkEmxHZuhdwl0RO+AOtL0767flrCG
         m0YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OOnJLMePRidiRd6Zbc0eEriUIlHpT2oioIudJsKLtbo=;
        fh=IzSB69vaZAYkKslkTihMMCrrXJeg2YLNELs+rkoaeb0=;
        b=c4SBRzZ9YZ9t6dyo7hB6xwycyfs9mzQMkjVNyJJhCsUPiHK1sCD4hzKDtGGqlKYeaX
         FcIvvJs/UgHiTLzxt+UGA/epHoYjoj+A+1rkh/6nabi/rxIrBA43lDndQQHXjnht/7ST
         CowxVOdRUQwPboiRADjWlPWge2xMaCz1vV2Xt2ZpTB0LxAHgiv1SE6iVqgJ8v7ODJXvC
         xs7v1m5k4WWbVwEdqbGaeZbPyXOFgupQW0QVvgz3nzlXh+zEvxFg+qdZYWZlfvNL1pnq
         S1RTYjeVKGVhYUPBb+wcYOyjHfxmanh+ht/Z9ptghkEou5fk8mU/boHJtIyMAaEmZWBS
         dvwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792625065; x=1793229865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OOnJLMePRidiRd6Zbc0eEriUIlHpT2oioIudJsKLtbo=;
        b=oLi8y7J2xgDhdaDp9fFCzXu3oc0F5lPk7JamTcvIw3le8Dw3lMLUBD6Gya+o37DXpE
         UyBfigPn8dmOyI3/uwfbcVVf7J58WFe+Fgp/s64m8mG4IhYwl7IHHJI92+G6kAxadobP
         XVMpG7fBQeNJo5ITGawxn7y6Io6uSkHTGov2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792625065; x=1793229865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OOnJLMePRidiRd6Zbc0eEriUIlHpT2oioIudJsKLtbo=;
        b=MHWzYgavcCQhgVLXCQWm+gzqRp3RLJQmAvB5IH5xpgud5Y2KYwyj1JdA9eMUAf9Ho0
         NpdTtgKjV+f7Bga5uDJnWHwOC1si+yUv0vh/gskqaiQR5pbkBVZEjL8k637d0mjV5/i2
         rIUlxNXlrvB+g2INIAj/ps/LeYw1SiBGgkkrfi7rw5exHS9EgRldTQzYXWHDTvSmKbeo
         iFDKPzxyYtt8PaBUL8yso09IcCQUcfynZBxY/wZ5QeVS1i5d4Ar4/tCdil2f5YxSrEwC
         cRvX3qsr8m8wTyKvGWhErPcDqAhT54gHsStgQhL6W2llsGGy2j3VP9f4UmMgm/r19Yd1
         ix5w==
X-Forwarded-Encrypted: i=1; AKwUvBwbXsNujA5nGsu7NnJfNWwKhLzSzDR1EA0em2yixo86BcnYHog72XtMOfGlCM1t58CIID4XPJh8ZOP+@vger.kernel.org
X-Gm-Message-State: AFq9FYKbjwAUkk8KOMYTKHXhsUOPPCCTp8pIiGyfrN26aHsugt0/LP+X
	NUdjRf6/V5w0bxNth7hLSaP/WfJ4MOh1HWUsJM42NDd6LaksZ9PXv/L7bBjcu6+Hz+EVoqAa96x
	XliJDJN3tR+45CFMgtMLBDgOXynkSlFX0Wpf2zEmf
X-Gm-Gg: AYBFou2UuwQtXZK1RCAwEXygkoP7iKwJ53F54vDuN0QSAh7lOyym48XiZ+ZRgYsAXjr
	R9wuMmDsFnGuPgiD2rciRPQMck870YNcA9uwT+iJkSK3BUVLX3MHuFcwzyWwdr4OwAmAbbdOumL
	noOWqm5oKKAsVFSb/1/rdAROhzJY/ofEUh4RpfvdqPtTYD4evHmEIe49v0tbEb9f0cIwJDukKxD
	7mF2uMII0rwPUJCzBixbGf0vKBimfIBRk0rdmvHSTf3XlqVWV+5BdevBDzroVKVsrDAR4vVKDOq
	Q7CHd8I9xSQhikoZTfRu2Dvp+B/FlwECNnJMeV9p/thrK+Bl5/0px59syGwov/kLwYTwlsbNYaJ
	u6KX5eufq8xoB+kTn86rdu1+VlkrsSfNBYLLhX7ojgFcw1wAJgTODkn3xEnTFx86dFjE=
X-Received: by 2002:a05:690c:2786:b0:8b0:88c7:f184 with SMTP id
 00721157ae682-8b14551034emr3963617b3.4.1792625064963; Wed, 21 Oct 2026
 16:24:24 -0700 (PDT)
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
 <20261019-send-upstream-v6-4-cb9ba4b3d6fa@chromium.org> <sashiko-outbox-178143@kernel.org>
In-Reply-To: <sashiko-outbox-178143@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Wed, 21 Oct 2026 16:24:13 -0700
X-Gm-Features: AclHuK8I92dDi-a24-arJkNbKz40DybvKa54bpvCtfeFFEOTon1M-6c-zRbUBhQ
Message-ID: <CAEe3GZG3rHcRtHmg=vB5WdfsQ38Fghi_o80dSnsuaog2_xrieQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/11] HID: spi-hid: add spi-hid driver HID layer
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 12:26=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] HID: spi-hid: zero-length report descriptor accepted in spi_hi=
d_ll_parse()
> --
>
> commit 9328ec8c48a0b55cf1019d845ec2c37e89f4cdbb
> Author: Jingyuan Liang <jingyliang@chromium.org>
>
> HID: spi-hid: add spi-hid driver HID layer
>
> This commit adds the HID low-level driver callbacks and device creation l=
ogic
> for spi-hid, handling report descriptor fetching, buffer allocation, and
> output/feature report requests.
>
> > diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/s=
pi-hid-core.c
> > index 02a7608c4b882..fca7a44eeb9f9 100644
> > --- a/drivers/hid/spi-hid/spi-hid-core.c
> > +++ b/drivers/hid/spi-hid/spi-hid-core.c
> [ ... ]
> > @@ -84,11 +185,484 @@ static const char *spi_hid_power_mode_string(enum=
 hidspi_power_state power_state
> [ ... ]
> > +/*
> > + * This function returns the length of the report descriptor, or a neg=
ative
> > + * error code if something went wrong.
> > + */
> > +static int spi_hid_report_descriptor_request(struct spi_hid *shid)
> > +{
> > +     struct device *dev =3D &shid->spi->dev;
> > +     struct spi_hid_output_report report =3D {
> > +             .report_type =3D REPORT_DESCRIPTOR,
> > +             .content_length =3D 0,
> > +             .content_id =3D SPI_HID_OUTPUT_REPORT_CONTENT_ID_DESC_REQ=
UEST,
> > +             .content =3D NULL,
> > +     };
> > +     int ret;
> > +
> > +     ret =3D  spi_hid_sync_request(shid, &report);
> > +     if (ret) {
> > +             dev_err(dev,
> > +                     "Expected report descriptor not received: %d\n", =
ret);
> > +             return ret;
> > +     }
> > +
> > +     ret =3D shid->response_length;
> > +     if (ret !=3D shid->desc.report_descriptor_length) {
> > +             ret =3D min_t(unsigned int, ret, shid->desc.report_descri=
ptor_length);
> > +             dev_err(dev, "Received report descriptor length doesn't m=
atch device descriptor field, using min of the two: %d\n",
> > +                     ret);
> > +     }
> > +
> > +     return ret;
> > +}
> [ ... ]
> > +static int spi_hid_ll_parse(struct hid_device *hid)
> > +{
> > +     struct spi_device *spi =3D hid->driver_data;
> > +     struct spi_hid *shid =3D spi_get_drvdata(spi);
> > +     struct device *dev =3D &spi->dev;
> > +     unsigned int rsize =3D shid->desc.report_descriptor_length;
> > +     int error, len;
> > +
> > +     if (rsize > HID_MAX_DESCRIPTOR_SIZE) {
> > +             dev_err(dev,
> > +                     "Report descriptor size %d is greater than HID_MA=
X_DESCRIPTOR_SIZE %d\n",
> > +                     rsize, HID_MAX_DESCRIPTOR_SIZE);
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (rsize > shid->bufsize) {
> > +             error =3D spi_hid_alloc_buffers(shid, rsize);
> > +             if (error)
> > +                     return error;
> > +     }
> > +
> > +     len =3D spi_hid_report_descriptor_request(shid);
> > +     if (len < 0) {
> > +             dev_err(dev, "Report descriptor request failed, %d\n", le=
n);
> > +             return len;
> > +     }
> > +
> > +     /*
> > +      * FIXME: below call returning 0 doesn't mean that the report des=
criptor
> > +      * is good. We might be caching a crc32 of a corrupted r. d. or w=
ho
> > +      * knows what the FW sent. Need to have a feedback loop about r. =
d.
> > +      * being ok and only then cache it.
> > +      */
> > +     error =3D hid_parse_report(hid, (u8 *)shid->response->content, le=
n);
> > +     if (error) {
> > +             dev_err(dev, "failed parsing report: %d\n", error);
> > +             return error;
> > +     }
> > +     shid->report_descriptor_crc32 =3D crc32_le(0,
> > +                                              (unsigned char const *)s=
hid->response->content,
> > +                                              len);
> > +
> > +     set_bit(SPI_HID_READY, &shid->flags);
> > +
> > +     return 0;
> > +}
>
> [Severity: Medium]
> What happens in spi_hid_ll_parse() if the report descriptor length is 0?
>
> In spi_hid_ll_parse(), rsize (shid->desc.report_descriptor_length) is che=
cked
> against HID_MAX_DESCRIPTOR_SIZE, but not for zero. Later in the series, t=
he
> commit "HID: spi-hid: add HID SPI protocol implementation" validates
> raw->rep_desc_len !=3D 0 in spi_hid_dev_desc_response(), but if a device =
returns
> a REPORT_DESCRIPTOR_RESPONSE with content_length =3D=3D 0 (shid->response=
_length =3D=3D
> 0), spi_hid_report_descriptor_request() computes min_t(unsigned int, 0,
> shid->desc.report_descriptor_length) and returns 0.
>
> Both spi_hid_ll_parse() here and spi_hid_refresh_device() in the protocol=
 patch
> only check if (len < 0), treating len =3D=3D 0 as success.
>
> When len =3D=3D 0 is passed to hid_parse_report():
>
> drivers/hid/hid-core.c:hid_parse_report() {
>         hid->dev_rdesc =3D kmemdup(start, size, GFP_KERNEL);
>         if (!hid->dev_rdesc)
>                 return -ENOMEM;
>         hid->dev_rsize =3D size;
>         return 0;
> }
>
> kmemdup() returns ZERO_SIZE_PTR (non-NULL), so hid_parse_report() returns=
 0.
> spi_hid_ll_parse() then caches a CRC32 of 0 and sets SPI_HID_READY, and
> hid_add_device() sees a non-NULL hdev->dev_rdesc and calls device_add(),
> registering an unusable hid_device while bypassing SPI_HID_ERROR reset
> recovery.
>
> Should spi_hid_report_descriptor_request() or its callers reject a 0-leng=
th
> report descriptor (for example, checking !rsize in spi_hid_ll_parse() and
> returning -EINVAL when shid->response_length =3D=3D 0 or len <=3D 0)?

Will fix this in v7.

>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-send-ups=
tream-v6-0-cb9ba4b3d6fa@chromium.org?part=3D4
