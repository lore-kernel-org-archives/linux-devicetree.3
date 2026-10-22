Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792674090;
	b=orsvFqAEuallaJb+fRsdKpcauSP2Mz/WQrhBAqIgH5XnG2Qm+PNp2QWNQIlVUrvwP43U
	 9cWh7D7iqQj1XsERUqwllv540K4Gi7oqIMcykWAvwlXooqCwLcJi/syTr7cOGwTk4nXzk
	 7ibbEu9P63OnoAucNsjSrCVHUNzV9cn+QGr0qpcQkzx74C2yjywJN7uZ5Dgow94w4kjTY
	 pvP9gWBoWZqRk3ULS+jQvG7qWeBRMawUnXoDbllLWRxYQ6RINrclVWwGPwGRyR7Sulzq5
	 JJI9nZCwpmzx1yB27hyDmJRrCqz5XgWkJ1hZQko4DgGi8uGCYSmTo0Hg/Xhl6CdXWeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8aJ+ZgjrOzJ2MQ0XsYDbjZR4GMqieJUK4jmHnZipazA=;
	b=kBLjpb2u29y3pcYGgefDYqVJ/XzsSLNG9QQnzG8ij01uFS4hhZ1lxvCwOCHV6jQrKon0
	 vqhH18OXktLl63rvula63ACfnc95mk+uZL8jsP26FDgXtCPqtDgzsBm2mM+F/+Zt1Mdyw
	 /qcmg/Vp6Ex33pbJWHAkpKC1/jS/T7cl/GH8NWsXV2E3lqvoRSzsMljnhMwlo1rXq//ZV
	 56fovTg5bWHtToMVB3RoA0CaCAjthGGKXlIyvyPfK4CGcvYslLwWnGNtlSLYvUtk2qGuS
	 HGk1Kv4+j++S1EwTLp+d+rsC9Fa34hAO0bnqMyna6o0oM4vY9N2r1+xL1+CGars0drw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VxcSf6CI;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F9F606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2F9F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VxcSf6CI
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso4533975e9.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 06:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792674088; x=1793278888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8aJ+ZgjrOzJ2MQ0XsYDbjZR4GMqieJUK4jmHnZipazA=;
        b=VxcSf6CIKAoagWCSIk4OdejyY4PIlSMFBre+qTk0yUCEjbr8jPstuWf4c3hOiSaohB
         7f6xKeqOMebzGnhOQQ9ePVAx1VBCJX6b7uE4867QQJClJnCDDfiL/i9WXXqRjEIRLYiT
         px6c5t+fcMzSygiMFvy6cb9Ob5QIX5cQgnLalF7EuhTsp5RRvI6bkWfSMplSO5zozwbP
         BqkFAWGFYItDrPJTXFx/mwdCzIxKtdAQ9AR6hnI8OWzUuKQOqeuRjLhQSekeTpJRfz4g
         ARtYn+UrMYcfS7Bq1znNG8eGJZogXbKlf2W+AkAw0ChUd2n2sdcb7eM1BFQ4IoKhQvOy
         0w2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792674088; x=1793278888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8aJ+ZgjrOzJ2MQ0XsYDbjZR4GMqieJUK4jmHnZipazA=;
        b=v2pmepFm7H2h2W/rbaPiyJc7Rw1yNf+/G0+zOYVt6rUaU1Czx5lZRtPbWeWU4WJiOQ
         qlU3dKw0sc5DOtCHJrYQOUPak1QqN4guC98e/ND5+4gNA5j/p9DKatSPjYZluVgl0Axh
         KIrrrX4Z9o23BGlnRbBW/2r3pz2noCpDnveaAitGmvw4sbwuqBkzSVMRjxKgjgtemD5f
         CN/Mmsi3Zfq6mAOZbqF7OkRpJ9RJHPe3mjB7sVLibvHd0w7vC8v2maJw2exczNf87RfU
         fc18g+bnKJNEaP/5Tm8Y5l9sk2cZ7iQorG2rskiDP+lx83SpVU8pQLRYpRujRe35H0u0
         Awjg==
X-Forwarded-Encrypted: i=1; AKwUvBwwSUdX/m2hFqEmCWtygrh4MWnL4sVURWgcgOjxGgjHEYpquE1XnIwWUHJY1WNPhmiluKoHln9WwsOL@vger.kernel.org
X-Gm-Message-State: AFq9FYKb+MB0EV6v/Uk5LMX+Im/hBMRkPBvUtITj9r6VXLpRgxsOVtZs
	8XcVf+E0e7xHFi25P1aVTeyfWFDUkPwodEJl820dgefHqlkTU0J9Ps5Y
X-Gm-Gg: AYBFou1NGyCHdb9mb1m9oCnXU6CRh9zSdRGzM4cS6WucJPxasSWa1tVE6nBEZgkXHRK
	TO8jOhqZZ1h6ZDyhwVAg2Sr3U9CEkeJeP5o1aAPEWk147MC5x21Xa6FIuuceCyhKg1d30nQaAWb
	eeoWKmfVxPasn+NoV90ru+/fasPYRh0McHgffmYIntT0HoXSLVRoB2O7CXgRQOhKP+cH7pK9CFA
	zHEmcc0zbgtEy91ihpl73k0Z0s5uRelp+5b21cvjov0eG+SufJCTu7oiLoM1r9psfZp4xb+iapa
	pLjzbUlRzueOBGVGZspKXP1BJ9RziXAugCB6JrFdhX/0HRMzAuMZOo8fGEfZzvr9vuTznELmloi
	52sWKh/XFpWYmrdG+sroSqTxsfUpQpRUqoCk4mCQNbb458+EcT7Uz3LftEBdTLGpE2oMA65L2vV
	uMMu7hD970hTUL/RrrFM4chECuv0326poKp8SlTr8Qk/Jm44cBNGIQyUHxmsC6LsmlTydfEmNW3
	lDmzHjGRLdVqBr/R0CBVGvqkLiA9pcNvAvVxZdpBW5bxacsE7keI9Kecds+0hw9kvV39+ixTjwb
	I480DrVc9ztzJ8I9GyfZaQ2Nq8zxYZyBSIutLWfVL+5grW9pxtUe4+I=
X-Received: by 2002:a05:600c:3548:b0:4a1:e774:370c with SMTP id 5b1f17b1804b1-4a1fdd145edmr104588835e9.30.1792674085847;
        Thu, 22 Oct 2026 06:01:25 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc1066cfsm116512435e9.1.2026.10.22.06.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:01:25 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:01:23 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 1/3] arm64: dts: freescale: imx8-apalis: Add NAU8822
 Bridge Tied Load
Message-ID: <3hd6y6f2lb73mrz2xi5pgsgzvahzmsmktfbyx7n7uewmobk22i@encqv6tasfzo>
References: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
 <20261001-v1-apalis-colibri-imx8-dtsos-v1-1-21881dc324c1@toradex.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-v1-apalis-colibri-imx8-dtsos-v1-1-21881dc324c1@toradex.com>

On Thu, Oct 01, 2026 at 10:43:10AM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 
> The NAU8822 on the Apalis Evaluation Board V1.2 can combine its two
> loudspeaker outputs into a Bridge Tied Load output. Add an overlay to
> select this mode when using the board with the Apalis iMX8.
> 
> The overlay is also combined with the Apalis iMX8QM V1.1 on Evaluation
> Board V1.2 device tree to provide a ready-to-use DTB. The codec and its
> routing are already described by the carrier device tree.
> 
> The overlay supports both Apalis iMX8QP and iMX8QM modules.
> 
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile                    |  6 ++++++
>  .../dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso  | 15 +++++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 9971b34f7301..2732b223eb3d 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -801,13 +801,19 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-zest.dtb
>  imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33-dtbs += imx8mq-tqma8mq-mba8mx.dtb imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb
>  
> +dtb-$(CONFIG_ARCH_MXC) += imx8-apalis-eval-v1.2-nau8822-btl.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-eval.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-eval-v1.2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-ixora-v1.1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.2.dtb
> +
> +imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl-dtbs := imx8qm-apalis-v1.1-eval-v1.2.dtb \
> +	imx8-apalis-eval-v1.2-nau8822-btl.dtbo
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-tqma8qm-mba8x.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-var-som-symphony.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso
> new file mode 100644
> index 000000000000..b2f9c43d29cd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Enable Bridge Tied Load (BTL) speaker mode on the Apalis Evaluation
> + * Board V1.2, combining the two loudspeaker outputs for higher output
> + * power.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&nau8822_1a {
> +	nuvoton,spk-btl;
> +};
> 
> -- 
> 2.43.0
> 

Hi Frank,

Patch 1/3 (imx8-apalis: Add NAU8822 Bridge Tied Load) is superseded by
the shared NAU8822 BTL overlay series:
https://lore.kernel.org/all/20261022-imx-nau8822-btl-v2-3-b4221ed43650@toradex.com/

Patches 2/3 and 3/3 are unchanged and still apply to imx/dt64 without
patch 1.

Best regards,
Ernest

