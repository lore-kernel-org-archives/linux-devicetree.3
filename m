Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE735581E9
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 22:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791929235; cv=pass; b=FNhTAgtO4L7MjueWQ5wXj41BfWPIFdZdToaMIV5Cg6s90yztf49EsJHo4G695USOR/UXU+SK/yiIlaeZPQ0+Sxl3LIEKOgYZ9jTtJhrVGS9ORb1+kDlfkdgZttDJZDyyc+L/QofSD84IGGhDeGS/dDEiicrjGjFHMRYHUXZWtUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791929235; c=relaxed/simple;
	bh=t3LBPAFHnhQ1u7O0ECQtw6w9DPC/4CEOsts9RgS3xwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=al80sZE5Xr9oQ+W+e3rOyWr+tjVqOppaCrYYiqU9/u6YKu0YbBN9iH4ytEAKHtoRY8sWu0n1DFomJ2NpuIRgPPv5mYiiNPptmyMVXx/M7d1rRGOQ916SzRFl2nmT7/9bv/7LZznGMpe6YzRcjxANYAyBljMB2mqSfaJlfE5s6AY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ey6DWjkb; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ey6DWjkb"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8ac551be4d3so27892917b3.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:07:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791929232; cv=none;
        d=google.com; s=arc-20260327;
        b=cIxYqVZVUUuteJdGFrDtmiZC0OXJv7kWuU9wBYuUjgGAM1lkxo1OLfLA4UPIPbyXsd
         /8GX+Vl3r/vzX8shPyb7GuERE+AClIpHAd7Flu2gaBzb+6MR1CJHAld1ezYLbL5N0KC5
         p2nS0Aupp2WpA7vl5dlQ4h9wk/0u02H5ZHhyQQm5abJV24hElAMVkjh3hag6e3It/nxu
         rBUDfCAE9q3Xtwh8mwWdQDSv7JaIqRwrNC4KgZrEHaQUphRq3DD9gnn9PsBuR8eZisA3
         Lj0CjYKwQhrhUqzQ8y+hEwqcVjRRDLsBL+9F5zccLN0cxDEDFqcoq+RcdjZXCT1iLN82
         pZMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3V04dj+1E4Q2ne6jooiMIXl4K+a/cJClSlFVSPgO3gA=;
        fh=ewVYb1buN4xdRIlKTNNvXszcZ13tdJXwh5m2LoMQFCs=;
        b=oZ+WjD9CiGW8SqDBKO3RLX7aYfeO2U7orYmgLzyZ5HbOn8l5BoeW0yGvlC2eJTWerl
         9OGf2ZTmowNAxSA2LPUAVZI1A+BfqL57zeovY0TaioHvP9+X1RPo/UlmpuKox0lBNnWO
         o3+OdGEK6Ga52Ol4gHBtigHpKFONnVTflf0zRO9KKWSCdNbMi6RfBB6rOyPiNAlDyws8
         UTM1X0g84n2FRxeXcmSO57vbwrsXUBri7KPGxF6aZ9MC184+b3z2IvtoDBqy1K6N9Y0p
         HmMdRWunlVWdeGEz6hywL/vviYmfzV5so5C3ipus6kETXr28ZAvupKzjFtbJskPFFApg
         SC4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791929232; x=1792534032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3V04dj+1E4Q2ne6jooiMIXl4K+a/cJClSlFVSPgO3gA=;
        b=Ey6DWjkbOIyawtqs6Gaz6LyujBWqXV2JJ0avzsShdblSrHTzy2K63aUSbRMBPxIBRh
         xrcyPJ8X+yw8A6U7nFuOR1mlne4DsiOCq/2POVGTcWi3Yf811m+4i6jkdSRjzWavacVy
         DWBYm0oafBtwftnG3SDqlHLfemjNcD+xLuBnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791929232; x=1792534032;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3V04dj+1E4Q2ne6jooiMIXl4K+a/cJClSlFVSPgO3gA=;
        b=QM8qRsvRcjZWcmGDeA2b1x+QWjbXJBe+HFLy1JstdqmiU4yrNkIYbAbw3UHxWlYVo9
         Sc6y4iK9U4HzWFyLCOpSyNWMOZUI+ZHIvYzOsl6FzN7mzoQrrFsu/4tEtLVsXlyeMBAM
         fLweZDQHO15/QY+jO2BiVJTVkhEZeeCyGKcX9D8s7qi644lFGcvvLPQNupILQ78i4nKk
         RMmAEtaBmKXnsrGf2hVTofsKk544Dgy/cK8msEStaTHrFLKeFt965aF5aPg3mODm5e/I
         x0M7Cqqmbvp9XGJRxymJcDNOeEzbdtVxzQQL461nFe74M1OQSBjB8+f0NZU0RoztB4C7
         EUSg==
X-Gm-Message-State: AFq9FYJhfc7C2TOuAlX5lqCCj5PoRUy84OTVFZh9RrWd6i0PU1WwbAe+
	CLXAf9lwrTOxFmLmZZgLOLomqLmigOTByFLmwnbHOPu7x60RZN4JeKNNA7y8/OM5L9aMhCMRIDH
	WVDyywI60pfvc93bZbrw6zHCkPBapZF+4hKlwn4ai
X-Gm-Gg: AYBFou1/c+BeiVs6FqR6qnQhDfqieWtNjR9WnQ75cn7t8GBGauPcgJ60KoAM19tIrA6
	OXGZ4aKb0xRPNwfoMfAPzYdTp5CQDsbbqVUadPCK4LE3EysVJMvTpG5vmS2GpvksM3KfA9zRPYT
	HIdksPnDQQc/E/9RRqjCgAEPo+OYsthjnRANIo35KOhl4PctOF3XLVtoxBaM+YofgS6lO2jkZdT
	wpvFzVJWuNxZCHE9SizRmiyGSWKcLppiXSkO+CPtBvx1T2Amknl6Qsa4nw0N2GcbiLGuZgcSeeD
	Xhlgp68kUmyXuCOPNAU8v1kWJ5mGrQc1l79o1BOYOWiZPd7gEc49dHMHGlcObXfbU97vJv/pbTg
	opfiLlpLh+wE=
X-Received: by 2002:a05:690c:112:b0:8b0:b12d:6c3c with SMTP id
 00721157ae682-8b0b12d703emr16903837b3.43.1791929232182; Tue, 13 Oct 2026
 15:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-5-384af01da3ee@chromium.org> <sashiko-outbox-166153@kernel.org>
In-Reply-To: <sashiko-outbox-166153@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 13 Oct 2026 15:07:00 -0700
X-Gm-Features: AclHuK8JEhgVWod97Oeyuxy5mtDaH6c72Kz69Kz8EDN-ZL4874rxGG-gecFiSkY
Message-ID: <CAEe3GZFWJ45Up6=4UbW=MQAPmc3BEdVHqkMYnDM3FfNYvuFRjQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] HID: spi-hid: add HID SPI protocol implementation
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	conor+dt@kernel.org, linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 3:42=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] hid: sleeping in atomic context via synchronous output_report
> - [High] spi: dma: unaligned DMA transfer buffers cause memory corruption
> - [High] hid: spi-hid: use-after-free of transport buffers on concurrent =
realloc
> - [Medium] hid: spi-hid: SPI_HID_REFRESH_IN_PROGRESS breaks hid_device_io=
_start() during probe
> --
>
> commit 4647f83267b811c038d6b541aee03ea186664da4
> Author: Jingyuan Liang <jingyliang@chromium.org>
> Subject: HID: spi-hid: add HID SPI protocol implementation
>
> This commit adds a new driver for the HID over SPI protocol. It supports
> basic input and output reports but omits features like multi-fragment
> reports and power states.
>
> > diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/s=
pi-hid-core.c
> > --- a/drivers/hid/spi-hid/spi-hid-core.c
> > +++ b/drivers/hid/spi-hid/spi-hid-core.c
> [ ... ]
> > +static int spi_hid_input_sync(struct spi_hid *shid, void *buf, u16 len=
gth,
> > +                           bool is_header)
> > +{
> > +     int error;
> > +
> > +     shid->input_transfer[0].tx_buf =3D is_header ?
> > +                                      shid->read_approval_header :
> > +                                      shid->read_approval_body;
> > +     shid->input_transfer[0].len =3D SPI_HID_READ_APPROVAL_LEN;
> > +
> > +     shid->input_transfer[1].rx_buf =3D buf;
>
> [Severity: High]
> Could this cause memory corruption on non-cache-coherent architectures?
>
> The read_approval_body is a 5-byte array that immediately follows
> read_approval_header in struct spi_hid. Since it starts at an unaligned
> 5-byte offset, passing it as tx_buf to the DMA sync path violates
> architecture DMA API rules.
>
> The rx_buf parameter also receives unaligned memory when buf is passed as
> shid->input->body later in the IRQ handler, which starts 4 bytes after th=
e
> dynamically allocated input header. This can trigger CONFIG_DMA_API_DEBUG
> warnings or corrupt adjacent memory.

I don't think so. The read approvals are TX-only and never change
after probe, and the RX body only shares a cacheline with the input
header, which isn't touched during the body transfer.

>
> [ ... ]
> > +static int __spi_hid_send_output_report(struct spi_hid *shid,
> > +                                     struct spi_hid_output_report *rep=
ort,
> > +                                     u8 expected_response)
> > +{
> > +     struct spi_hid_output_buf *buf =3D shid->output;
> > +     struct device *dev =3D &shid->spi->dev;
> > +     u16 report_length;
> > +     u16 padded_length;
> > +     u8 padding;
> > +     int error;
> > +
> > +     lockdep_assert_held(&shid->output_lock);
>
> [Severity: High]
> Is there a potential use-after-free here if the output buffer is realloca=
ted
> concurrently?
>
> When the HID core calls spi_hid_ll_start() dynamically from userspace or
> BPF, it expands the transport buffers by calling spi_hid_alloc_buffers()
> if the report sizes have increased. This reallocation uses devm_krealloc(=
)
> to free shid->output and replace it.
>
> However, spi_hid_ll_start() does not appear to acquire shid->output_lock
> before reallocating. If a spontaneous device reset interrupt schedules
> reset_work on a global worker thread:
>
> spi_hid_reset_work()
>   spi_hid_reset_response()
>     spi_hid_sync_request()
>       __spi_hid_send_output_report()
>
> This path can execute concurrently, accessing the freed shid->output buff=
er
> under the lock, leading to a use-after-free when writing the header and
> payload.

Thank you. I will fix it in v6.

>
> [ ... ]
> > +static int spi_hid_send_output_report(struct spi_hid *shid,
> > +                                   struct spi_hid_output_report *repor=
t)
> > +{
> > +     guard(mutex)(&shid->output_lock);
> > +     return __spi_hid_send_output_report(shid, report, 0);
> > +}
> > +
> > +static int __spi_hid_sync_request(struct spi_hid *shid,
> > +                               struct spi_hid_output_report *report)
> > +{
> > +     struct device *dev =3D &shid->spi->dev;
> > +     int error;
> > +
> > +     error =3D __spi_hid_send_output_report(shid, report,
> > +                                          spi_hid_response_type(report=
->report_type));
>
> [Severity: High]
> Does this sleeping lock violation trigger scheduling while atomic warning=
s?
>
> According to the HID subsystem guidelines, the low-level output_report
> callback is used for high-throughput data on the interrupt channel and
> must be asynchronous.
>
> When spi_hid_ll_output_report() calls spi_hid_send_output_report() or
> spi_hid_sync_request(), these helpers immediately acquire shid->output_lo=
ck
> (a sleeping mutex) and perform a synchronous, blocking SPI transfer. Sinc=
e
> the callback can be invoked from atomic contexts (like updating LED state=
s
> from an input event handler), sleeping here may cause panics.

No. hid-input defers LED updates from input events to a workqueue, so
->output_report() isn't called from atomic context there, and USB-HID
and I2C-HID already sleep in this callback too.

>
> [ ... ]
> > +static int spi_hid_input_report_handler(struct spi_hid *shid,
> > +                                     struct spi_hid_input_buf *buf)
> > +{
> > +     struct device *dev =3D &shid->spi->dev;
> > +     struct hid_device *hid;
> > +     struct spi_hid_input_report r;
> > +     int error =3D 0;
> > +
> > +     scoped_guard(mutex, &shid->io_lock) {
> > +             if (!test_bit(SPI_HID_READY, &shid->flags) ||
> > +                 !test_bit(SPI_HID_STARTED, &shid->flags) ||
> > +                 test_bit(SPI_HID_REFRESH_IN_PROGRESS, &shid->flags) |=
| !shid->hid) {
> > +                     dev_dbg(dev, "HID not ready (flags 0x%lx), droppi=
ng input report\n",
> > +                             shid->flags);
> > +                     return 0;
> > +             }
>
> [Severity: Medium]
> Will this prevent drivers from receiving input reports during probe?
>
> When spi_hid_refresh_device() is executed, it sets the
> SPI_HID_REFRESH_IN_PROGRESS flag before tearing down the old HID device
> and creating the new one:
>
> spi_hid_refresh_device()
>   set_bit(SPI_HID_REFRESH_IN_PROGRESS, ...)
>   spi_hid_create_device()
>     hid_add_device()
>       -> driver probe()
>
> During this entire time, the input report handler will drop all incoming
> reports. This conflicts with the HID core API contract, which explicitly
> allows a driver to receive inputs during its probe phase by calling
> hid_device_io_start(). A driver that requires a firmware handshake or
> data during probe could hang or fail upon device refresh.

Thank you. I will fix it in v6.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-send-ups=
tream-v5-0-384af01da3ee@chromium.org?part=3D5
