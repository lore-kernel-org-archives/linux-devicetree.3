Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA2E3A8743
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 11:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780140125; cv=pass; b=D3Vsr/Xocrjp7+c2kmYMKsQqwiIirqr1ry9TAfIQ2pGOp5fNEhuPwCtWaR5YDMPiq7V1oY2lKzhUa+Vj6VrsryWKuZ4dOKC2twhlb8gVz7CySErC1Xd4bWrs0677Yg6VXuk/kValJMFUgZKtx6mClG1zUmVTd00rWrkjihIWCJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780140125; c=relaxed/simple;
	bh=lFNrxzNQ5edL8UN6TD1iTrQnKblEFc91/Mi79oiB39M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WBRIHv+QT0GXeZrrEOwWhpL6QzM6UyxeVjJZ+WK/Vx5II0IcNfyk3famGFgGRHkR+aXtibPPCwQwylxPCCI57nYwJ88Nxqg44Ce+snUfwjNhUfuWkSfzCQMQtOJPA7GLMODnh6P3Yh+/thMQ4rah/AId0E9KUk14Ax/kRydHaHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyfImvyI; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyfImvyI"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bcc9a69ee07so217425966b.2
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 04:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780140122; cv=none;
        d=google.com; s=arc-20240605;
        b=JLwrvUgzg3BSokXErfeTt/2iPD19DrwVHgyiBAVCTUT+BuD8blsHFQZeUxAcwhFb+9
         yGdt9JSRJ6X6kziE2JXKHJ+aqrpHXgYKIT3tskMM17sasqKeCPey8miJpV9w0IJLwegv
         5ydr0atA4qJDhj5jclZ2hPDNN3W632YmBo41B+Iwp8wQgr9CoecNnSSjpx2ckPIMAeRY
         0Tifdudvr8Sc+635RIcz33yKJmLJnA/h8MQSTxQUwTrDVIL72tVChRGUmRfkWOO24Fp8
         nA0GeoLFXu9hssaKUzhVXFPNwZgmKjo04PvKcNFiih48fvbpE3Ap1OeTJs+OT8LmTn6s
         +HxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=25QSe8FS27jbL7gvHOw+es5cmwhYoyIGedo22jkR4Mc=;
        fh=kLo8gq9RN/HCvvo4jW4SUTRrd2lNMrxYQUkGfATdAvg=;
        b=eVHDjbMuZfIYI2bz79HnmHe0ZazEf7JfadKBeoQr0VWEdyNRCqgSnhEffUbE5p8ojX
         WhB7GIjOUigbLWR6y3ch+jxzuVy/EnovGWEf6oURmVvDELzLnUqvuG/HfluKoNc7K3ns
         vb4McZ4B5h58ifLFLxP5zeSOKa5ys0MbMURHgNC4OWY7fipZ322cQUZ40c9mQ3gqY4r2
         3uJeMJIJQk3a54FFCnTcXSTAFRXjZiGFyLaLyX3GNEn4ZN4WtSx8wginsoue21Xb5M6i
         8gcZJWjYpwvnbin4bz0qHkq/T96x9INn29+ofoCGgxFtB+xTsvGT1OyXYxuvJHN1QkO9
         hccw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780140122; x=1780744922; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25QSe8FS27jbL7gvHOw+es5cmwhYoyIGedo22jkR4Mc=;
        b=SyfImvyIajf9b7i9mSsZIIjeV7mdodbuG8I8ckZOPny80HuvsE2SR9C6WCYcolcYCm
         lSwOj38hpbiO2piIFatQJuud4agcyMji9qu2RF8niLyt0X0wbh+bXU/1IWTkjWXfz5LO
         8KoJbO1JjIU99Z+ZzYvp4Hwk2WdcqQWBvI7wkqNKJ5PbV/A5xwZTPGMM2wvuF7wROJsP
         UaP/t77MjdrIIem/JZwmNLefxwTLu8xt9xL6KHUfBQnll3mnOuUgh01Xmm3+5iGOmXAe
         ZqAlLSwmS/E2mBbB4s7VHM6lh28cZpiIYJ1pUoddH/5yF11k7CQ0oMOKo+qb8WcM1h93
         yp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780140122; x=1780744922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=25QSe8FS27jbL7gvHOw+es5cmwhYoyIGedo22jkR4Mc=;
        b=Wj09yqTnRuPcdlATC5Ftb+0HRAHI2FGFeGKFFrOoz9cTZ3qxFGbbBvaoNm7qFsxZw9
         ak4/zUkaflDlzx6jfMD1kQZAbaMOzNFA7cYyHNj3pWtkombNoNfUz1tdXppD1Bpt5VZB
         6Y6H9rBEG61zTLo0CYAoj5PEf5wabEqZqCAf7sRa4X7kHZ6LM1jP4OxxwVKsJm/QNek0
         X6EweC4bwY/dNEA3tgF0IfDix25QSDhlIELHWQ/HXKi9DY/ZjKkjyRe31eQNamwPVHe6
         bWgepFhfp1sr042WF/Kqr3lJVEiEB2/H6O35gJ+E8mX/OHuBHhYLe2JXU9B3bYbBUeGn
         oNgw==
X-Forwarded-Encrypted: i=1; AFNElJ9uW00YEQvk+aDAbwAmLu1GAmU58JBLBFK+Y8NLvftHiifWVsWCs5pSNvokaJfQvyLsH2GptGxUTVZx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7OjylpBqTllYNryzM8U2SRrhNLzrKrSj8zPljgCI6xJ295STB
	BmXMpo0Hew4Jwb1M3KpN69/OOH2Nii8ikYtNesELL/94Bh8PHv5cr6PAjfIAHG4Sd9LiEfuF4bs
	DAgUjEpkbT/Rnp2ccOQnSMe2Z3rFszA4=
X-Gm-Gg: Acq92OGJAZNaGbbIEzvp9j5/BNtNv4fT40a302SffHFaBOJBDGv5a2GKQwpXMt8kSvJ
	fCnUXzYNcSxVYC+G2PhtFPW8O0lS4dfs+7xRYd8mXBtz4VKYYOmdzcMFSjkGUtV+mp/Aqn9hfk8
	tPOmxseFkioC92er1Z1NMhQNhkWmkhG1ncIkJkfpDMGTEo8t/WGLxYKzWUlylbqMiiThUog3HtJ
	YATmlNQcxC70KGwGk3dMVNVTwlcPuOiecyIIgMw6WS/UrX1G1bQAkljreBwxyf9LciumZbUEbnm
	8+9VKnKyslvpU9FPOg==
X-Received: by 2002:a50:ec96:0:b0:689:ac19:3fb4 with SMTP id
 4fb4d7f45d1cf-68c8b2e7048mr483014a12.1.1780140122179; Sat, 30 May 2026
 04:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530135302.54688-1-tahanarimani3443@gmail.com>
 <20260530110658.30EB11F00893@smtp.kernel.org> <CAEsNvj8Q3n3-tuPhANfRjUfqrnCtzfguuRKL0OrwCEEkSXrUaw@mail.gmail.com>
In-Reply-To: <CAEsNvj8Q3n3-tuPhANfRjUfqrnCtzfguuRKL0OrwCEEkSXrUaw@mail.gmail.com>
From: Taha Narimani <tahanarimani3443@gmail.com>
Date: Sat, 30 May 2026 14:51:49 +0330
X-Gm-Features: AVHnY4Lgj0IR4-__iwmvmZBCf2z0cg5CbA51LFHjpNp4kCeS6HxzCvMaJGnWKoc
Message-ID: <CAEsNvj-xv4PC6jZD+x_xUh4_Ec=eO=BA=LXT0t9aMTEy4X+LEg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: iio: adc: Add schema for AD7816/7/8 digital
 temperature sensor
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you for the detailed analysis and for pointing out these issues.

I would like to clarify that these are pre-existing issues in the
driver and were not introduced by my documentation patch. My current
goal is limited to adding the missing Device Tree bindings to resolve
the checkpatch.pl warnings.

I acknowledge that the driver has issues regarding concurrency
protection, DMA mapping, and polling loops. I intend to focus on those
in a separate, subsequent patch series after this one is merged, as I
believe refactoring the driver logic requires a broader scope.

Thank you for your patience and for reviewing my contribution.

Best regards, Taha Narimani


On Sat, May 30, 2026 at 2:41=E2=80=AFPM Taha Narimani
<tahanarimani3443@gmail.com> wrote:
>
> Hi,
>
> Thank you for the detailed analysis and for pointing out these issues.
>
> I would like to clarify that these are pre-existing issues in the driver =
and were not introduced by my documentation patch. My current goal is limit=
ed to adding the missing Device Tree bindings to resolve the checkpatch.pl =
warnings.
>
> I acknowledge that the driver has issues regarding concurrency protection=
, DMA mapping, and polling loops. I intend to focus on those in a separate,=
 subsequent patch series after this one is merged, as I believe refactoring=
 the driver logic requires a broader scope.
>
> Thank you for your patience and for reviewing my contribution.
>
> Best regards, Taha Narimani
>
>
> On Sat, May 30, 2026 at 2:36=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>>
>> Thank you for your contribution! Sashiko AI review found 3 potential iss=
ue(s) to consider:
>>
>> Pre-existing issues:
>> - [High] Missing concurrency protection during sysfs accesses.
>> - [High] Stack-allocated buffers are passed directly to `spi_read()` and=
 `spi_write()`, violating DMA mapping rules.
>> - [High] Unbounded polling loop for the BUSY pin can cause a hard CPU lo=
ckup.
>> --
>>
>> commit cb7e57cc9cdde2668abda84c0f0d3e60ebb9a962
>> Author: Taha Narimani <tahanarimani3443@gmail.com>
>>
>> dt-bindings: iio: adc: Add schema for AD7816/7/8 digital temperature sen=
sor
>>
>> This commit adds a new YAML device tree binding schema for the Analog
>> Devices AD7816, AD7817, and AD7818 digital temperature sensors. It
>> documents the compatible strings, SPI configuration, interrupts, and
>> required GPIO pins.
>>
>> > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml=
 b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
>> > new file mode 100644
>> > index 0000000000000..74008c14d40c6
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
>> > @@ -0,0 +1,87 @@
>> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> > +%YAML 1.2
>> > +---
>> > +$id: http://devicetree.org/schemas/iio/adc/adi,ad7816.yaml#
>> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>
>> [ ... ]
>>
>> > +properties:
>> > +  compatible:
>> > +    enum:
>> > +      - adi,ad7816
>> > +      - adi,ad7817
>> > +      - adi,ad7818
>>
>> [Severity: High]
>> This isn't a bug introduced by this patch, but is there a missing lock t=
o
>> protect concurrent sysfs accesses?
>>
>> Looking at ad7816_show_value() in drivers/staging/iio/adc/ad7816.c:
>>
>> drivers/staging/iio/adc/ad7816.c:ad7816_show_value() {
>>     ...
>>     ret =3D ad7816_spi_read(chip, &data);
>>     ...
>> }
>>
>> Since this is called for world-readable sysfs attributes, can multiple
>> userspace processes trigger this concurrently?
>>
>> If so, could concurrent execution of ad7816_spi_read() interleave GPIO p=
in
>> toggling and SPI transfers, corrupting the hardware state?
>>
>>
>> [Severity: High]
>> This isn't a bug introduced by this patch, but does this code pass
>> stack-allocated buffers to SPI transfers?
>>
>> Looking at drivers/staging/iio/adc/ad7816.c:
>>
>> drivers/staging/iio/adc/ad7816.c:ad7816_spi_read() {
>>     ...
>>     ret =3D spi_read(spi_dev, &buf, sizeof(*data));
>>     ...
>> }
>>
>> And also in ad7816_spi_write():
>>
>> drivers/staging/iio/adc/ad7816.c:ad7816_spi_write() {
>>     ...
>>     ret =3D spi_write(spi_dev, &data, sizeof(data));
>>     ...
>> }
>>
>> Since the SPI subsystem often maps these buffers for DMA, will passing
>> variables from the stack cause mapping failures or crashes on architectu=
res
>> with virtually mapped kernel stacks?
>>
>>
>> [Severity: High]
>> This isn't a bug introduced by this patch, but can this unbounded pollin=
g
>> loop cause a CPU lockup?
>>
>> Looking at ad7816_spi_read() in drivers/staging/iio/adc/ad7816.c:
>>
>> drivers/staging/iio/adc/ad7816.c:ad7816_spi_read() {
>>     ...
>>     while (gpiod_get_value(chip->busy_pin))
>>         cpu_relax();
>>     ...
>> }
>>
>> If the external device malfunctions or the GPIO line gets permanently st=
uck
>> high, will this loop block indefinitely and cause a hard lockup?
>>
>> --
>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530135302.5=
4688-1-tahanarimani3443@gmail.com?part=3D1
