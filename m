Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C40409603
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 13:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779197006; cv=pass; b=Ua+9MqVl64ck+8jadFF+uqeYHdtV78CeB6MBlD9i3U7+CwcU8aZOLqSG2PnQppllkQ+oVGuo05FzsWQHsT34OCCGZoJWthYjLcl2IuG4reu0vOTO09iACOMHpqqwjRowtOPHPf00zn6rSr6e1vTuIk/Mg/shZrA4DXRFz9lW3C0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779197006; c=relaxed/simple;
	bh=P0R1xOsfpQqki1vEBgvaHmTz6ftpxthYcxHuok2B86M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eFmqiomFFQXSuh8Lg8IduHpRuLh9TbfMeP9Ld2XkpLnaxRj7DZsH2rU37DuKnwvhJjFHrHltHit3+ejn6xK8Qn8QRbZOZhfAYRFCOPqgd6/7lSMfo67lrZQl8hqEdILbpTbDckt/WYnAYJjhJI9TPjKwgBO9D73jy2166zO9N8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CMwqjHcM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=L4o6ooXa; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CMwqjHcM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="L4o6ooXa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779197004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vSZwixHkv2muy60wUJhbvc6cwMeXT0Usg6Pp1th8RbU=;
	b=CMwqjHcMkwRhrvTLZe02ndsLXGlA1xJzq0FFnSvChJGHUxNRKFhDBCq0MvBdet5/igboj5
	Bwo9B6GatJuRhMcNg6bMeTXpO9V2SPP6ELKMcxQ0+O1aScDWvTbZpyOrOWp4OZggP2WTbL
	wiCadE7AReCjmtAt2gKR8DNON9PYevk=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-X1Xr9TsKNbm-oYZZwEmghg-1; Tue, 19 May 2026 09:23:22 -0400
X-MC-Unique: X1Xr9TsKNbm-oYZZwEmghg-1
X-Mimecast-MFC-AGG-ID: X1Xr9TsKNbm-oYZZwEmghg_1779197001
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5a85dbbe2e4so178264e87.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779197000; cv=none;
        d=google.com; s=arc-20240605;
        b=f2wCJFyhxGCen8YdG+gw0kR3NfzDjhrnwJGgPXre5ZE+A5LuQV/bB0AxTQuRN3S4Ft
         zpXMB9jnWeQA6HPB7IEFp45GCLP8VU1eqbUYtIO4j87zTsP6ibcHsuiWHypI69zRq7QB
         WQak2p6HbSV52VOLfSB1wJSfNWNwVWEc9Gr3z+lO0IzOpY2jpDvfVmNhmQ7cr+yTC1Wj
         W3/enVXM42lAj+Nx0RBxyjeinH5GtxzQKCi8AtrG7yF/qsDOJ5aFuBZCK6gDJmma7QSc
         XUNJOMEoKRXn10RQMHrt/Tf708aijroB33znPRVZiH0Uj92MGWXcBb7L5sdElbmBKmgR
         8ZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vSZwixHkv2muy60wUJhbvc6cwMeXT0Usg6Pp1th8RbU=;
        fh=bg+ZLa6RvSQk9jfUdtuN2tOaS4Q6Wo20h7N+GrAieuk=;
        b=jIEPSgw1cneOpL2M850MiIuEmK4J3utCcxuqKMwNjF1SYYeQRyzFmdkdk5LXYvu6zh
         ohm29QsCZYj86pRxJcScsFVw5O9Tc+yWtdKFG8n3dhoXXFVUa2jSU5ljf2FL3GYfwmTt
         rfczvQTublbyViVelCW0h3T1PbQMiPg0+3jZydFQaTngh/0cQloWVb1af0u7u7w+zfOI
         KNWLN9Vu1TvsZqhcZ2e8lO5yo9dIvUwD06EFbrdun/f1zBSQLLYEUMLZjvnRBS695n9i
         iZpZcjg0aRICFdOIVmC/Xm1kQIjKcSBQz9mJke+Vjsx+6iH6QuXpmca8x+mZrkjQGwP0
         QzJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779197000; x=1779801800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSZwixHkv2muy60wUJhbvc6cwMeXT0Usg6Pp1th8RbU=;
        b=L4o6ooXaB1aF2bX4nNdjER81MJs2EX9U55zwN7efcxrjGPr3+RVJTYgctsKffaaixB
         vj0D4cVC1DrD8iPMgUpbdTM+KH9+rKQ8CsgIwOKzKrbdJ6IRYecdXn1vqvLvLME4n791
         Z9qHR27E8CN3bpzdsqq9j9YlAirbkDV034G/4oEiN3+j6nR4g/GNaHLxayRMkXyFvcw/
         Hz5s7YW9SbnFy0gCDFDPLt36Oqn5c/HCWowiKYALqb7syy7G+mAVC4tAwp8gpADm5P8e
         SIO58g+BGw2LMaxcNYMH/dkiFACAJKZQh1raUNCwM89pXkQFHtV5gxLcSLVkKgPhpTbM
         Ji8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197000; x=1779801800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vSZwixHkv2muy60wUJhbvc6cwMeXT0Usg6Pp1th8RbU=;
        b=pqZ4wCv+Y6YtzAMv7kqQ0YfNmCjLdLgNLDvw0Njo1RePGo+q7jnDmlI/aIN0cYf+qE
         azbWn8ytGD3l/UNZARaegE1iSiGt1GKVfEHCY+TS2wz0zkf6f6E0rEYoDKO4WsrfvE/K
         PqV9PvPPe8GwcAZ4umedNjSv1/JSazQERZ4enQOUHQCL0pqDrA25x99O+uGI8O13gTwp
         DEhHloj8QEWVHnJzMho691Om6lt8AbS048S8meAabKGRcmWjoDvi/gz2HPNJ8gIhcQ83
         6ozJcP6FeJIYDI0C/VGXoHqIICljWKqcaVwnFKQJjQeRcuuy7QoXjCIQJxfvVsV40l/z
         x25Q==
X-Forwarded-Encrypted: i=1; AFNElJ9PMOrbddCngugtZMNM4G+sLAD7auTmxime3JrAIvsIlnSN77+afqWkz0soVJn2huLM9kMISQHVtMwA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrt4lfgOm+G9Ag5vOpuIRXSXvzKaEXnTftI0ulkRfZz2OJpHvF
	ccECV4Y860ixY3XYN4wpd8gD/X25O+jENJykaUeFdxAEiTQNFhJ8iHWm5yeGYVe/E5t1euJ+kbh
	Qr3nYCp6t6PU/xDlkMPqoimq2DSv7RqoEe0pCr8DPo9jtcaJeeJvMOnnl2d65P0OdfSPBBONI41
	cGiZeQhGC7qp072popw1FpVbdt4phXHg05CFhZmg==
X-Gm-Gg: Acq92OEmgGEDOOYuSKYDFHbyxY9faPdJ/c5Ez+tQnGyIEyVFKzQSSvwgUJp3wh38V22
	L6MaOh0k+MmirZ/Zay8tUJIRiIsA/gOitmN2WgJnFoouA9bzwCtDlui+9wuKyiuc0zERzOfxiM6
	hKaX9JmXYO4AttILPzUjQqrgkj3mjIQZCb0L+TwmRz3CenrkhgwmwFvCJZ8XFWF0UWb+efFTGa3
	Dy1pg==
X-Received: by 2002:a05:651c:881:b0:395:9f86:b433 with SMTP id 38308e7fff4ca-3959f86b5bamr7821421fa.6.1779197000484;
        Tue, 19 May 2026 06:23:20 -0700 (PDT)
X-Received: by 2002:a05:651c:881:b0:395:9f86:b433 with SMTP id
 38308e7fff4ca-3959f86b5bamr7821311fa.6.1779196999921; Tue, 19 May 2026
 06:23:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518063547.2890353-1-khristineandreea.barbulescu@oss.nxp.com> <20260518063547.2890353-2-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260518063547.2890353-2-khristineandreea.barbulescu@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 19 May 2026 15:23:08 +0200
X-Gm-Features: AVHnY4Ku0WK3_tTMCuY00U13A1ewKmhxwVXJEJLHH0cS_8oPrxB1SflVfjvcxDY
Message-ID: <CALE0LRss3eXM-+sA9VzpvKnv-UsHh0X_SWBRBYKDP3-1i=svsw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: s32g: add PIT support for s32g2 and s32g3
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

Somewhat related I'd appreciate a review to:

https://lore.kernel.org/all/20260514-fix-nxp-timer-v3-1-a3e68fdb505e@redhat=
.com/

The changes looks good to me, so

On Mon, May 18, 2026 at 8:36=E2=80=AFAM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> Add PIT0 and PIT1 for S32G2 and S32G3 SoCs
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

Reviewed-by: Enric Balletbo i Serra <eballetb@redhat.com>

Thanks,
   Enric

> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi | 20 +++++++++++++++++++-
>  arch/arm64/boot/dts/freescale/s32g3.dtsi | 20 +++++++++++++++++++-
>  2 files changed, 38 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g2.dtsi
> index 51d00dac12de..57ff97e44507 100644
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
> @@ -417,6 +417,15 @@ edma0: dma-controller@40144000 {
>                         clock-names =3D "dmamux0", "dmamux1";
>                 };
>
> +               pit0: pit@40188000 {
> +                       compatible =3D "nxp,s32g2-pit";
> +                       reg =3D <0x40188000 0x3000>;
> +                       interrupts =3D <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 61>;
> +                       clock-names =3D "pit";
> +                       status =3D "disabled";
> +               };
> +
>                 can0: can@401b4000 {
>                         compatible =3D "nxp,s32g2-flexcan";
>                         reg =3D <0x401b4000 0xa000>;
> @@ -622,6 +631,15 @@ edma1: dma-controller@40244000 {
>                         clock-names =3D "dmamux0", "dmamux1";
>                 };
>
> +               pit1: pit@40288000 {
> +                       compatible =3D "nxp,s32g2-pit";
> +                       reg =3D <0x40288000 0x3000>;
> +                       interrupts =3D <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 61>;
> +                       clock-names =3D "pit";
> +                       status =3D "disabled";
> +               };
> +
>                 can2: can@402a8000 {
>                         compatible =3D "nxp,s32g2-flexcan";
>                         reg =3D <0x402a8000 0xa000>;
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g3.dtsi
> index e314f3c7d61d..efe5398e1240 100644
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
> @@ -475,6 +475,15 @@ edma0: dma-controller@40144000 {
>                         clock-names =3D "dmamux0", "dmamux1";
>                 };
>
> +               pit0: pit@40188000 {
> +                       compatible =3D "nxp,s32g3-pit", "nxp,s32g2-pit";
> +                       reg =3D <0x40188000 0x3000>;
> +                       interrupts =3D <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 61>;
> +                       clock-names =3D "pit";
> +                       status =3D "disabled";
> +               };
> +
>                 can0: can@401b4000 {
>                         compatible =3D "nxp,s32g3-flexcan",
>                                            "nxp,s32g2-flexcan";
> @@ -693,6 +702,15 @@ edma1: dma-controller@40244000 {
>                         clock-names =3D "dmamux0", "dmamux1";
>                 };
>
> +               pit1: pit@40288000 {
> +                       compatible =3D "nxp,s32g3-pit", "nxp,s32g2-pit";
> +                       reg =3D <0x40288000 0x3000>;
> +                       interrupts =3D <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&clks 61>;
> +                       clock-names =3D "pit";
> +                       status =3D "disabled";
> +               };
> +
>                 can2: can@402a8000 {
>                         compatible =3D "nxp,s32g3-flexcan",
>                                            "nxp,s32g2-flexcan";
> --
> 2.34.1
>

