Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC82A36F421
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 17:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779298204; cv=pass; b=gKNGGKww2pMGDMhevhmh0KWQksHltICg2APa+E1At+Zf/MOZL9pz2VpdIykMfVlsw44+uq9YCtxXINKoAOiiJN3P3RrmAm1YOKsXf5wOZ0ZfAB9mRWcMnsoTwDgx/NduQr1tORXI1bHbaWVd0GB/q4oxT6YsG4RqnXpllIZ+5Rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779298204; c=relaxed/simple;
	bh=AxJKt3npx/5olYpRGoq298LXQ/po4wFjS8RwWFAvF84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IcjgI9Vlke9Y2f5s5r281DvVKvWqgarVjHq4GB1I7qS2P5rlYzvXc2Yv9UKFmcOi1VK2Cn1Ktu3BeL3AmVzELsXIcEbaIjPPWNRXWAbRXzLE0/KFf20lfYEli1ip/bfxPVfwDZo36s+qNVVDTDgs9Ot0/kmfo+6Jd+mCMkhvFQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pCiTtgM9; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pCiTtgM9"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-393800f638bso40855181fa.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779298201; cv=none;
        d=google.com; s=arc-20240605;
        b=G1qi2oBKudCry+XugzIYnzsiJwDMvMHdScuah7JD7mG+gFyxZrEcJ/rfYcFbjzjzDC
         nAfpsbWDGlCuU4ismoZqPNxjFUbiSPUgRa20hhbKBkYtf8wdCZXYSl9SU8yWohOUDJ+2
         qv08Sww169Mh+6xLBs8GFYpQVGNALx8GSpMw579sGe9EZ1r6mA2fpINaXS6OdCCTRAbK
         /cmji5cSaSwOe4R1ZgDWohzjlQHxsLj/ttxYRRfxKdCIS3yQNNpsNtWZrb1bDoFg6gdy
         SJAe+8dFnMkP7rUyUKBReSR0L5BKXXx8g5SeQA7jKRvVEfXfV88RjF821bGJHKa3lyLB
         nVAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sqX6X7nWtjyIR3qederrBeJlDMfIxrgMnvzCbwNNfdY=;
        fh=6Nv8/VJ4BkVxpyC1EDtVGpNcabydOtUtAGuSaM0PK+8=;
        b=Mt4d7g8S9vSLLcGax8G9q3kB7Idm6Jk2LojJ0T6X0ZXxgvXaG6mxW9rQ50XoZdyZQw
         HgcxdYTXGiT2TIqsCnrZ6ctT03pdc+s4r61r1IblX+4BWm510uLWWubUNW+JyBNl7g9T
         ihRvfkEP1RGc7y3iIoH3v2UcGIBp/MXyuw42ipWUo7Nad6dClbmaj1/yWwsl77PNzhVF
         vQ5Ex+kpgmAU88OKMzb5MS9jW45msXKu59bdhvssA7+f4gWsBFVy0DfcPJmo4706Y79r
         7T8LTfHNp4cWDURroEGwvVj1GZEVGrStjvqLc71OloLYbfh9xlEg8KAM/YYqX9STzxDb
         I3Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779298201; x=1779903001; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqX6X7nWtjyIR3qederrBeJlDMfIxrgMnvzCbwNNfdY=;
        b=pCiTtgM9+8Bg8icQNwyyQj8BmgJ4pc7kwCekh88YUppF1+v4ke+830RzDiJ08r5jK5
         IR5P9TAhoz1+ma6fv6i9QUVg4X5u0k8cV9NOJZt/rnDPBGuRo/M+2nIor5TPltBPA4gk
         TOQMUj5m8g9D6JHlv4mpZsVxstIs8m+u0Z5jEDttAsJ21VdKEWjirrKSGzyVrSQwWS5T
         oTlgHZRnDVeWwKWYyJQ+AVfqI0By7JqiyN20e85pLwjpRRbYnX4F5mePTouyuaqYPNIo
         c++oS6LQaCvrpAXGjDyNCGry1+AeWM7EnE95UUJ/qXzbWkkzf1kkvEII8C9rYBPwat/M
         1FZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779298201; x=1779903001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sqX6X7nWtjyIR3qederrBeJlDMfIxrgMnvzCbwNNfdY=;
        b=Nvh03GVka/0g36HHSm4bVA4YtH9J9fpFA9TC9ytH5uhBj0nmGrO+7KL8zwfudScH/B
         2D4dWZRo5PYCeLCOpVo9gP0AOVs/kAhbaXtCOIaLCDMLgKRE+kkpDWnHWbXTWVs0Kzlj
         e0pczcMvsM7jtaNrG/i+SX2sB5xRo+AJpJfKd/Qf+SX4MSApM1Rtmkh24Oiv3/EvkYQz
         0vAImKdhNVMtURxQXxWtQwVkV99Mej0p0pa0rT2WW+/3q7FLwU/l16K6fWJ0c642trrO
         fHFPZOiGzghavPN3hO3mqBceTVe4EcLXkTO08vTcYaYJCcf8S2cKcA4hCIQjc57Dh/mH
         Xg5A==
X-Forwarded-Encrypted: i=1; AFNElJ+7p0/qpJ4atiAGWHicNtEQC8TVJz40hlQ9WG9qMq/LkGWQTnZUpiBGPsc61kfstsJacRM5nUAlUFgV@vger.kernel.org
X-Gm-Message-State: AOJu0YwbTs6ZtpkT2EhpCjvGOmSaFE4UOoQRmjFw7Fk6lNEFjYM1CdMS
	5mnxovkdBjEFYF33aSF7iNLRqMSkccFhhCQYtnTNb9m+4nIpA02FLq5joOWt357QsKGlVyx/OsB
	oY83tkxHRjUh01nxPwy1yxjpL6Th42YM=
X-Gm-Gg: Acq92OF2gBigO4QmzL8EWf+smF6ej8Nps3IXYEElpmLwqaCyKFTL8kYz73Q9mdIEYzB
	4gRjB7Jo/BSgVeeTmstD1SBhAB4s2nufij408NizMqIbDl/PXJmItd0RETfoJ9KfgynSGnHbGdZ
	ZsQ9cbSTywB4JsXgOOk+/0Pt+BjgNwTreUzv6tWjG8qdgzPaAncZ62lWuiyccU9U48Tnr+9LiUc
	Kx7Gc86uiHYZ2mseWCDckXwGDXAnsMeHib924HOVTiSp0s/U/uaGWyys+oGRZRKmzDyfpJROy8b
	LFF3PFhdU1mRHa9pmNQfD3Y3gzXLApQrJuIHPNabS/lPWurd0hAYA5T0k+W9sxRbsCreapghlmq
	b5iw=
X-Received: by 2002:a05:651c:4187:b0:394:378:b53c with SMTP id
 38308e7fff4ca-39561f312afmr68643811fa.29.1779298200654; Wed, 20 May 2026
 10:30:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-tegra194-qspi-iommu-v1-0-57dfb63cd3d6@gmail.com>
 <20260515-tegra194-qspi-iommu-v1-3-57dfb63cd3d6@gmail.com> <ag2fjPWwKJmrdYMl@orome>
In-Reply-To: <ag2fjPWwKJmrdYMl@orome>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 20 May 2026 12:29:49 -0500
X-Gm-Features: AVHnY4LvroBWjQk9zP1yNxXjFt1vwSYbmuS4SgnDFGII4R-emIrKxrHn6Q0vFZ0
Message-ID: <CALHNRZ9+X-QMmse-+KOAgt4psobecQvizqXMPufx-BnEd2wujA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: tegra: Add iommu and dma properties for
 Tegra194 QSPI
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 6:49=E2=80=AFAM Thierry Reding <thierry.reding@gmai=
l.com> wrote:
>
> On Fri, May 15, 2026 at 03:35:29PM -0500, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Without iommu and dma enabled, flash storage such as the spi-nor on the
> > p3668 module times out and cannot complete any transfers.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot=
/dts/nvidia/tegra194.dtsi
> > index 1d659454a6f9fe..0e0a20befe9e68 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > @@ -923,6 +923,10 @@ spi@3270000 {
> >                                <&bpmp TEGRA194_CLK_QSPI0_PM>;
> >                       clock-names =3D "qspi", "qspi_out";
> >                       resets =3D <&bpmp TEGRA194_RESET_QSPI0>;
> > +                     iommus =3D <&smmu TEGRA194_SID_GPCDMA_0>;
> > +                     dma-coherent;
> > +                     dmas =3D <&gpcdma 5>, <&gpcdma 5>;
> > +                     dma-names =3D "rx", "tx";
>
> dmas and dma-names are the only properties that you should need here.

This is where I started and it didn't work. Without the iommu
properties, I get endless mmu faults upon accessing the qspi flash
device:

[   62.313833] tegra-mc 2c00000.memory-controller: axisw: secure write
@0x00000003ffffff00: VPR violation ((null))
[   62.324542] arm-smmu 12000000.iommu: Unhandled context fault:
fsr=3D0x402, iova=3D0xcd21d000, fsynr=3D0x80012, cbfrsynra=3D0x820, cb=3D1

I know downstream kernels aren't always (normally...) the arbiter of
sanity, but I did pull these from the Nvidia downstream 5.10 kernel,
which is where Nvidia was starting to try to align with mainline
paradigms. All of these properties are set there.

If the qspi node isn't supposed to set iommu directly, then there's a
larger problem here that I don't even know where to begin to look
into. All I can say is that dma fails with faults if they are not set
and works when they are.

Aaron
