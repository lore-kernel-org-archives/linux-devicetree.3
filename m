Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2955F2609FD
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779197304; cv=pass; b=kqQY2wQSaaI7aPmh52eSxt3HgoEJFTC+symWYECqmtVSQOfLkrOIBNcgvUxT4bKyruGFhi2bgFpHIzcAkauUDT7jehBx8L7IQC5qI6yKMbBIAuZAbh4FYZoKTduvEu03pHgIlKOf6iKszkFdlYctmRks9Aqo+h7a0U3Yz4MEZe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779197304; c=relaxed/simple;
	bh=AJDpfP9UZspHTC3+uZ4OkTygJiOxBWBP3cwoWE7gENs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AjffM7cFq5oYkMP9JHHiRNbC1dZpp881OKeyj1k3oT8Dnpf6C+U4BhTLk8OarACTGDfrGQiF4M3GsB4wsakECwkArB7Mba7TxqDRQ7GJD0Hngj9P0AnlXyEozLd2kA41dyQ23AzzqshDCEY4uW9FAD44aSQdbiWSRnC1MwVoAr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KD+w3mAy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jo+aD/fL; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KD+w3mAy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jo+aD/fL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779197291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u5YvULhhts6qX2IWUm0kkAdZMFsRNKK4rnVt+gyCyWw=;
	b=KD+w3mAyrGtSs+o64fB8RNu1TX5ucMi1dX+9eK/9IeertgQeCswZ9w4I9Bh/ZqCB9KkOah
	pD2IBxI3NlttYeW1V1KFdnaI2PG56iDO/b5iKfth1mPEaCyIQO43uUKNbpRs/rijYOyjvd
	YoInA6gTNk8gh/p7hxeqi86REhRs95c=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-jBIHdF50MSSqGtoDjeCOvA-1; Tue, 19 May 2026 09:28:09 -0400
X-MC-Unique: jBIHdF50MSSqGtoDjeCOvA-1
X-Mimecast-MFC-AGG-ID: jBIHdF50MSSqGtoDjeCOvA_1779197288
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5a871871c5bso293286e87.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:28:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779197288; cv=none;
        d=google.com; s=arc-20240605;
        b=aFrmNPP8BJth8U+v3LpGhEAW+WaWAIRBC8cGJq/AjEIMKXexYWfR8C3u1BdnPcc/f7
         PAT5fZmrLNPRGkGbZq+eoslCnsxavzgZxcCnElZBVzfBLR4Kl8rfvtN74sCLDBychT4o
         cjAYbNEg7GArH8XCICX4MRJ1fs+PDQQnVllYm8ygIkxofN33BW/Zhn6XioSvnuK9PVe4
         luz5Pzo+Zr58LTyTxph/wflAjZnQhQ2udmpWjEd+v7l4IqCInTGFMwTmKmMuy5EwvWKS
         +oNWuKcuYxgnyZzcTAd1I44I2aFwncPhOo5dmBPfQYOpqmee87WbkroqBEiIKnKU02CH
         jBPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u5YvULhhts6qX2IWUm0kkAdZMFsRNKK4rnVt+gyCyWw=;
        fh=zGCk8NiF1fw++w/+bsMvXzZIks7KLm2MC9INEyujR/Y=;
        b=IeibRsG2iwwxA0CI9Vr7mtvslpMNlCAe1mIRCS7tpD/Wwd0YOjn/UBzKwwzN8tFvxS
         kuwsYeaoC7zHyQflFho7qQ4D+hCgTSajf4UjrtVjRcwGWNJmhPfEwIxCR+weRxFOFhGi
         suvXfptjqKJcyxZnGDKo7HmKCYwzbYb3dABR2Sl7BjhDG8DC2WLqsTsa9VEJiAUdm5zO
         2nWDTDeQ5DsBTftm439pX69e/1nTxLret68OwgAf0n2M0zPudwDtBqSJbEBvXwI0vNis
         KfPSviJFTz4V2ILpqPFjIPFMUuHOMhF04L9nuzdlzmgA9pIJk852xsJxyVSYUUgIFFZc
         VtZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779197288; x=1779802088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5YvULhhts6qX2IWUm0kkAdZMFsRNKK4rnVt+gyCyWw=;
        b=Jo+aD/fL2jEOd1bQe2bsWp13gAfZlnjXGa/sbd7InHiZQzSckpexjnKZj9xK0HVEqj
         mAoCw2nrYnheSuMdA9rc5yLGyTomvEBZfXNi+gQP4nZWHkvPlamdxctSZvXryIYi9mia
         p1hAMdQoFkvbdF+KgbfbItguIdCpgqnND5gBp+D8yl5wLDOAKv5/ruZgd2QGCwJVio/A
         rPfNY6278h2D+USvk5TNe/WwA72V3JvhC9fQZIoepoeEYY9jtjGLosUdd6WqEDfIG0PE
         x/2hzRzU5IROiK+PBflsr+ebDIVorRkBHp0Y46tjZUlPO66b82EgOLh6h5R5if4M47sz
         IfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197288; x=1779802088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u5YvULhhts6qX2IWUm0kkAdZMFsRNKK4rnVt+gyCyWw=;
        b=Gf199ZoPPSKQ8eyIngAu70SnVDbxo4pwqOyZG1lXLAgdE9PD5ubt31D1ZpOZNgrd4U
         RXOTlz24cP3e99hL4QD6IJbpCPMJS0wUyx2YhkApsQFxUwfrweWH9QPyZ2rtcAY2iuK3
         c7NeOq4j67pVmaDnkum6Cvidiov07740KxLLNYQBJfYhcEVj1c6pbEpNTZ3zeuVxNP8j
         Y0OVxWSlLGwQsS3W3EpMDd/tZw9+btu2yUdj0Q2dhPP1E6gks4mHhPB8wtALi3pAwNL7
         ouphwkI5T//7Lse8NAfFROsMjkyEwqLg0dJLNH/XvViUxxiapXRKWFIQbcahvmwxtLiM
         p/pg==
X-Forwarded-Encrypted: i=1; AFNElJ9iRFqTG0XuPF/bEQEpegHOfUzudCQ/cKSDeHOIAHX5IVjFKQ1VG8hcMzh9bMLGZzmUbzK8fuw9+Mli@vger.kernel.org
X-Gm-Message-State: AOJu0YwIazzFDFJDvvYaTNo6oe48Y787bSyoh6Gei2pDfsHNzMwFpEYl
	UyWIxVhm7QpaCv4WCboR7es+3xK2NkYIVJJA2z0Pqp+WKw3ROrrBvsojFfiBNx7jh2EEMt5ptAv
	h7MuKZ2dDKvKnoC4JA6D+p74k+b+BnF5poShYeCffkSG0fbyNsgPvqjD1Y8tJfq4X02olaLLVx+
	VTACHkCyZBbJJp/iky1b2dVjWzEy3uAxx7PDdaZg==
X-Gm-Gg: Acq92OGHropshbpjcgMQXSp9PugXzclzRmrsEe0XTyBl1lt1wUfPQuXr3Fsx1xBY9c5
	jdyGgb2LEqTDT7JZ2U/frY0VTkvgy9viSvMCc1P54EcGGyIT5Spibn65WvT9Oc7mMJm7KbvQOwZ
	F4cjwJDDHTylRT1D6W15s8Iak5vY1s1f06sEN5mViHrKzqVFmuGm4XTL7Ufrsv1nZZW/B39tRmp
	uSvVg==
X-Received: by 2002:a05:6512:3409:b0:5a8:7396:63e3 with SMTP id 2adb3069b0e04-5aa0e74a2cdmr2307631e87.5.1779197287900;
        Tue, 19 May 2026 06:28:07 -0700 (PDT)
X-Received: by 2002:a05:6512:3409:b0:5a8:7396:63e3 with SMTP id
 2adb3069b0e04-5aa0e74a2cdmr2307625e87.5.1779197287356; Tue, 19 May 2026
 06:28:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514082639.1181240-1-khristineandreea.barbulescu@oss.nxp.com> <20260514082639.1181240-2-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260514082639.1181240-2-khristineandreea.barbulescu@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 19 May 2026 15:27:55 +0200
X-Gm-Features: AVHnY4JqE7oGhtd31y_8FQnK1agHYemkPRFMHImGIc2hHQQvFQ7fi52Nv9jZBbM
Message-ID: <CALE0LRuk2J-BHNytia52xuKm-SU4ukCiP-Ow2rU9bRMfdhh4kg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: s32g: add SAR ADC support for s32g2
 and s32g3
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 14, 2026 at 10:26=E2=80=AFAM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> Add ADC0 and ADC1 for S32G2 and S32G3 SoCs.
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

Reviewed-by: Enric Balletbo i Serra <eballetb@redhat.com>

Thanks,
   Enric

> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi | 22 +++++++++++++++++++++-
>  arch/arm64/boot/dts/freescale/s32g3.dtsi | 22 +++++++++++++++++++++-
>  2 files changed, 42 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g2.dtsi
> index 51d00dac12de..6f1952fbbcfe 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -3,7 +3,7 @@
>   * NXP S32G2 SoC family
>   *
>   * Copyright (c) 2021 SUSE LLC
> - * Copyright 2017-2021, 2024-2025 NXP
> + * Copyright 2017-2021, 2024-2026 NXP
>   */
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -554,6 +554,16 @@ i2c2: i2c@401ec000 {
>                         status =3D "disabled";
>                 };
>
> +               adc0: adc@401f8000 {
> +                       compatible =3D "nxp,s32g2-sar-adc";
> +                       reg =3D <0x401f8000 0x1000>;
> +                       interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 0x41>;
> +                       dmas =3D <&edma0 0 32>;
> +                       dma-names =3D "rx";
> +                       status =3D "disabled";
> +               };
> +
>                 swt4: watchdog@40200000 {
>                         compatible =3D "nxp,s32g2-swt";
>                         reg =3D <0x40200000 0x1000>;
> @@ -717,6 +727,16 @@ i2c4: i2c@402dc000 {
>                         status =3D "disabled";
>                 };
>
> +               adc1: adc@402e8000 {
> +                       compatible =3D "nxp,s32g2-sar-adc";
> +                       reg =3D <0x402e8000 0x1000>;
> +                       interrupts =3D <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 0x41>;
> +                       dmas =3D <&edma1 1 32>;
> +                       dma-names =3D "rx";
> +                       status =3D "disabled";
> +               };
> +
>                 usdhc0: mmc@402f0000 {
>                         compatible =3D "nxp,s32g2-usdhc";
>                         reg =3D <0x402f0000 0x1000>;
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g3.dtsi
> index e314f3c7d61d..5cfb37c1216a 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2021-2025 NXP
> + * Copyright 2021-2026 NXP
>   *
>   * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>   *          Ciprian Costea <ciprianmarian.costea@nxp.com>
> @@ -617,6 +617,16 @@ i2c2: i2c@401ec000 {
>                         status =3D "disabled";
>                 };
>
> +               adc0: adc@401f8000 {
> +                       compatible =3D "nxp,s32g3-sar-adc", "nxp,s32g2-sa=
r-adc";
> +                       reg =3D <0x401f8000 0x1000>;
> +                       interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 0x41>;
> +                       dmas =3D <&edma0 0 32>;
> +                       dma-names =3D "rx";
> +                       status =3D "disabled";
> +               };
> +
>                 swt4: watchdog@40200000 {
>                         compatible =3D "nxp,s32g3-swt", "nxp,s32g2-swt";
>                         reg =3D <0x40200000 0x1000>;
> @@ -792,6 +802,16 @@ i2c4: i2c@402dc000 {
>                         status =3D "disabled";
>                 };
>
> +               adc1: adc@402e8000 {
> +                       compatible =3D "nxp,s32g3-sar-adc", "nxp,s32g2-sa=
r-adc";
> +                       reg =3D <0x402e8000 0x1000>;
> +                       interrupts =3D <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 0x41>;
> +                       dmas =3D <&edma1 1 32>;
> +                       dma-names =3D "rx";
> +                       status =3D "disabled";
> +               };
> +
>                 usdhc0: mmc@402f0000 {
>                         compatible =3D "nxp,s32g3-usdhc",
>                                      "nxp,s32g2-usdhc";
> --
> 2.34.1
>

