Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52A7559CB4
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 21:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791926534; cv=pass; b=jytMEXRuA+vp/ifpX//uw6ZaS3f+HLcVoOQ/VLLaEQTrNzYFwOnCTM1r8xYWoiQtdoIbofHamMAlKbUrTshaYhODu/Rr8HPqbdEMoXmaAGF0YHHnPJB8GckwvwjKJ5EkGiQ9Bt/WwqMqDg95BmfKdixUIDkD8KDbnd73yBoXzEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791926534; c=relaxed/simple;
	bh=sf30vAcaJ++DLttGm/TNinMSo0jN9WDVolmb3olSr0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYi0zz1JIypMR3Uf6wZG9rBhPqT57P3IkO0uiDzP+2FbbNBcZZ7Ilgg6pKDy4d74T6vPxUQw+XcqRHVL1x044xrIBbzG0sxochBocUrdpkOpuyJ/syU3Q/VF1s//HIaXW7JgiUF/FBG6RAKY0PfFjnR/KHo//xzYCGtsDJCb6+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Sc7Gh42h; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Sc7Gh42h"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6767d92cde6so3203637d50.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:22:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791926528; cv=none;
        d=google.com; s=arc-20260327;
        b=VFMc5he3ke0imePhWub4eumIYw5S6c6RjCKPRObSt9P9nlxlOBO9cU4wtK9mP/iNQS
         VrY/TAQ+9qluCYdOuR4f66Zy4dXUd/qbMMzUt3XKfx2G/SPWYeSaD151pn86+rOm7nQJ
         +bwSk2gyQbhF9sQynrXXlFDAMHOKffM6gA6CjW7AeBXdx8py08ESUKoYtqH/wrvYe813
         3S+pb4TUtfGvnGsEScVSKL6n4qigSzlPih3nIdflMe8R3AMcHxj60w7628l49Z+DtoMa
         trOLRuh3gad7Ju5s9wp/u3C92P9FEYd23lZOfCBkXo7pNhVFCSPyd0Cu9TCpe07zmlkR
         kLyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tW1MH59A22+8G0RbZ3B3dj8ln/Mz2H51o5N7Shhczv4=;
        fh=ozE+N9mJ0gLTxMxk+7Z7QlnOYwY28zNL12TaFG5tDL4=;
        b=AqFufEo/ttXHZTYAx1zxxuYLldGsjelLRXdo7KO5Ce8tYCogjpRO6MLItCf897kGUX
         9o7l1NicrF/wQDLq+Ijy3MvYMH4G8fcCZfhuf3/gH6b3Ejr+1G06UTATocKt/cdFBq22
         ANRB7I0q/FalqY7Xk+to3SRtdsjieZqlGbzu95TeSK8lXCbJm0B1DysnOW2KvjsSkeAL
         i9ljLl0O54qKaLiK7v7pH84uKITHtqdofF9Tb/JwrzcnyyXfDTPM6b4mjNoTZRQkjiFv
         STv16z3Oenq6nvCnSBKPTDriA04+v6OfUtu0pHc9hLNF01Jq9hCZ0ezxMTyn7zGVWM4i
         3p0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791926528; x=1792531328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tW1MH59A22+8G0RbZ3B3dj8ln/Mz2H51o5N7Shhczv4=;
        b=Sc7Gh42h6n0xBIW4jv8fFKe2zdPNW4uXbZLoU5mw34wx0S3tlmBSafIcAzh8tu4VIY
         pxY4mnOzgzmsLdfbyD+0t+6K2HKAO+hmJo//Gbu3+q5hLA8dVMikUJXaPWatgWbxA8eT
         M2J/XqcIQK3Fs3L+autqFqU2gzYUQXCbygCic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791926528; x=1792531328;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tW1MH59A22+8G0RbZ3B3dj8ln/Mz2H51o5N7Shhczv4=;
        b=q3c0x14R3kBnqXtxmzcHbPSAccdebI5dIPDAEJ4rN8I99RJckusIa3NKiEfvu0PCNa
         BTDYAY6KISMd1sqaBlyt/mCaWfxzpI2FBQx5p8AacJreHSQoIhlBNnKNyD9z5agjTQ9L
         JyNHLPXoxjl22NeWlC8KhukpNJZs8q8kcu7Hdll3B6B5hcqB+lmm3l0y2Qijyer6rAbz
         oh1tWXbsnC80pJ6f4OQCfwX2ZczAjtV9+C4wopg8KoaJM5eHGcps4tB3jBOR3neSbwim
         AyH5rOQgNftW4DM69x9sU0ZsM42ils9s4yxf5VlKD/fq6F+TXAk+CVUIY5WkcCsFgI/F
         gxVw==
X-Forwarded-Encrypted: i=1; AKwUvBxpkbeYmyiYNNj39gU1Sn6fLAuNF7fcTXk6pCoWDfTKgF9PBfcvQExyImQ/RS4fZh+WHYvMDlQCm0A3@vger.kernel.org
X-Gm-Message-State: AFq9FYJpfGNNJq0hWzOmFh4xl6xrKxmaSCgJiUUOoSC5mbEl6c0+2X0v
	jSQG7ZTltHLsaKTO+sFu1Ygv0YD1tv8CbsWysWu6GVv1WFvItbiYsTXAyQwPaQoyZ1ej1EgPYQI
	apauyNoXo05Gq/2Wsq9oicV2yHQiaXdn3cVTYl3UJ
X-Gm-Gg: AYBFou0Fpqvcgnz/52V9v09afSZ/oF5UtEUlWyZrjTzTULolm/q8pJCq+Al472OVCEh
	rftXTfR95eqSbbbNffogVzQt0TIgHG4UQC3zW0dlQNgnhlwAQeBJ2NXDS4YICT1Yz+a5K45DNWx
	mrvDsJnwAdXb7gxLclsyhXXaD66Sx3G0RlH4SRTzc/gRlTyGlO7Ec+5lo0Ofc+YMlsSx7JR+TSv
	1HSBhkTkY+SLt2XHgzGJsgsZnwb+piU4yjg6Jy+aZSR7Zvy6v45MKdJRDZF3VWYMrqbn2zcehns
	FtLPrUAu3WciCYaoOPrpKuP0ntsBZs3SdpmpQGy3nO3fBZA1xX2rT9vxu4JjqzVMjDcWcomFsBZ
	9gk/nlRL5BA==
X-Received: by 2002:a05:690c:4d4a:b0:887:f4fc:ee35 with SMTP id
 00721157ae682-8b07ed1fb6cmr47618147b3.19.1791926528330; Tue, 13 Oct 2026
 14:22:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-4-384af01da3ee@chromium.org> <sashiko-outbox-166154@kernel.org>
In-Reply-To: <sashiko-outbox-166154@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 13 Oct 2026 14:21:57 -0700
X-Gm-Features: AclHuK8vj_2CnW3lS7fdTlkJRR8RuhSwUE7H_CFag_-G2v-URCUG4IFSzD-lQgw
Message-ID: <CAEe3GZH-QD4vj71c2AR6Y0VFhchBARBctYtfmur07nrgK5xBWQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/11] HID: spi-hid: add spi-hid driver HID layer
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, 
	dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 3:42=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] hid: output_report callback sleeps in atomic context
> --
>
> commit 954a3684cea1bad33a85c00ff6725f7553c75027
> Author: Jingyuan Liang <jingyliang@chromium.org>
>
>     HID: spi-hid: add spi-hid driver HID layer
>
>     Add HID low level driver callbacks to register SPI as a HID driver, a=
nd
>     an external touch device as a HID device.
>
> > diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/s=
pi-hid-core.c
> > index 02a7608c4b882..fca7a44eeb9f9 100644
> > --- a/drivers/hid/spi-hid/spi-hid-core.c
> > +++ b/drivers/hid/spi-hid/spi-hid-core.c
> [ ... ]
> > +static int spi_hid_send_output_report(struct spi_hid *shid,
> > +                                   struct spi_hid_output_report *repor=
t)
> > +{
> > +     guard(mutex)(&shid->output_lock);
> > +     return __spi_hid_send_output_report(shid, report);
> > +}
> > +
> > +static int __spi_hid_sync_request(struct spi_hid *shid,
> > +                               struct spi_hid_output_report *report)
> > +{
> > +     struct device *dev =3D &shid->spi->dev;
> > +     int error;
> > +
> > +     reinit_completion(&shid->output_done);
> > +
> > +     error =3D __spi_hid_send_output_report(shid, report);
> > +     if (error)
> > +             return error;
> > +
> > +     error =3D wait_for_completion_interruptible_timeout(&shid->output=
_done,
> > +                                                       msecs_to_jiffie=
s(SPI_HID_RESP_TIMEOUT));
> > +     if (error =3D=3D 0) {
> > +             dev_err(dev, "Response timed out\n");
> > +             return -ETIMEDOUT;
> > +     }
> > +     if (error < 0)
> > +             return error;
> > +
> > +     return 0;
> > +}
> > +
> > +static int spi_hid_sync_request(struct spi_hid *shid,
> > +                             struct spi_hid_output_report *report)
> > +{
> > +     guard(mutex)(&shid->output_lock);
> > +     return __spi_hid_sync_request(shid, report);
> > +}
> [ ... ]
> > +static int spi_hid_ll_output_report(struct hid_device *hid, __u8 *buf,
> > +                                 size_t len)
> > +{
> > +     struct spi_device *spi =3D hid->driver_data;
> > +     struct spi_hid *shid =3D spi_get_drvdata(spi);
> > +     struct device *dev =3D &spi->dev;
> > +     struct spi_hid_output_report report =3D {
> > +             .report_type =3D OUTPUT_REPORT,
> > +             .content_length =3D len - 1,
> > +             .content_id =3D buf[0],
> > +             .content =3D &buf[1],
> > +     };
> > +     int error;
> > +
> > +     if (!test_bit(SPI_HID_READY, &shid->flags)) {
> > +             dev_err(dev, "%s called in unready state\n", __func__);
> > +             return -ENODEV;
> > +     }
> > +
> > +     if (shid->desc.no_output_report_ack)
> > +             error =3D spi_hid_send_output_report(shid, &report);
> > +     else
> > +             error =3D spi_hid_sync_request(shid, &report);
>
> [Severity: High]
> Can this code sleep in an atomic context?
>
> The HID subsystem requires the output_report callback to be asynchronous =
because
> it can be invoked from atomic contexts, such as softirqs for LED triggers=
 or
> force feedback.
>
> Both spi_hid_send_output_report() and spi_hid_sync_request() acquire a mu=
tex,
> which will sleep. Furthermore, spi_hid_sync_request() blocks by calling
> wait_for_completion_interruptible_timeout() in __spi_hid_sync_request() w=
hile
> waiting for the response.
>
> Will calling these synchronous primitives from the output_report callback=
 lead
> to a scheduling while atomic BUG and cause a kernel panic?
>
> > +
> > +     if (error) {
> > +             dev_err(dev, "failed to send output report\n");
> > +             return error;
> > +     }
> > +
> > +     return len;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-send-ups=
tream-v5-0-384af01da3ee@chromium.org?part=3D4

Not really. HID core doesn't call ->output_report() from atomic context
(LED updates are sent from a workqueue), and as noted in my reply
on the documentation patch, USB-HID and I2C-HID already sleep in
this callback too.
