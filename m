Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D78D279903
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 22:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780178505; cv=none; b=VXbSHDRUYfS2nwP5YLqJIgX7jUDL7oTn/1taeFLXrj6SKFLogl1cI6GCaBtLi9EuJFDHhtHQpdJSoNzvx/CrA5NMcBbTKWrwqLUd2ESgSy5nRlM3ehUNFMufOE3/QdbeGEyeYfIhuaKPMBwGY40Hcdo8ugqJA/QYaGRWTwANyoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780178505; c=relaxed/simple;
	bh=4DVUohzAaXwz3eVrtrKvme/fPS4PAOQR1+cKdCnuB6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsFYmmUE1TUu3fkMNjFXstf8RGkgXgFG9Y1LGQ3fz5LPyGypWlkWszqUjbqb766qRKjJgRr562PdT1JO4W/eb8FoqfriVlw8zONl9gmvikTr9haNyKg6/hNi/sPWRC9Q4ADHGTqAS+0USX9JBAKiOpV42Wna4LVGJ/8TtmRfzj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n9RUxQZQ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n9RUxQZQ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3698e34a567so13659130a91.2
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 15:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780178504; x=1780783304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7n4onNHcUGonSFh3iTX+9p1SOqH/aLpn6mI3I4XkfLM=;
        b=n9RUxQZQuOuoApK4AKtx4ugRlatTpyrjRNRmv/CFC9nVb1lETJLNQGGie/7otEPf64
         uHLIIt1265MdQ8Rv2F2UWJYlozph1VSm4G3d18Dy5Y10rOtkm4MXjFvJFYcw/58qeNhx
         6rRdmRGOeqm4/QA5v7PsnUbt09na2D/jkgL6XjFfOmNMhuhU9AzkKYlXMMAFS5lJ3tBk
         SSxm5uvbctfZ6zdB3sxdjXSYcpbC3iNxpgy+9U9BMGVWUehncj+LX92LXIDCEtA2g2/4
         flYateoRzvLWiluufYsyxxV0eECf4u6jGkxFHjgtYdWG4Hmr1frYxu1eGcnasZ5zV6tE
         ST7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780178504; x=1780783304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7n4onNHcUGonSFh3iTX+9p1SOqH/aLpn6mI3I4XkfLM=;
        b=cLY9p9V0hru6THb/Pbdgu5Gk7RmTofA+KptdMyIVu8E0NwllMb5Vwi7fyqQxo6p5ul
         mynJ5f0GSWULv1Uh1Rux8UMg/U74rRvQogt/4RBH/cl2o5q6SQOp+k4DX7kjX7XVD49w
         Ab7kJLWo9MnymO5g6/uthQdNuV1JyEexHJK/CsF6q1A98gheBgciOYxKYvUnGXM4EpA3
         mNz96Ou8MXv6NJ7LKCpHRN2WH575GAZm8+9jTgMBm8R3RR4tWfh+xV7IdPKS5FP+Kn6d
         uCkK7CYUwTejTbNphTKqTyEZpmd4FBNiXU8Fa/555eIEFHSlToRbajBJL5MbilDQ25DN
         ROSQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rjZeMnGzJ35sDreLoOOImgLGMIM4aV3ry9C9NYc3lXc95ZM08VgFg5Q93Lqb9QBd4RajfkiUDgOVW@vger.kernel.org
X-Gm-Message-State: AOJu0YzWZrzlT1z9w7GrgjkNRl3RxfNdA6j2i/JjfbuvkAesjXnmqDKn
	TewgerY6gMYrKrYnrgXDDEdpMzWmkOQtr8OXY0bywFbkVhmivy0rHd4W
X-Gm-Gg: Acq92OFbVkx2miQhKGmvHrb550bWVzqAwbTnbzTi+JLu8XM05pnxuzDTXeQ9OfSXRlx
	nabTyaYi/JCU0u49mYdeKWfUoPKBc6Gc6LHahDL/pftGBK20x3XR0SlRja3JoU1ew8leJ0UwLPd
	xf6n5W96Q8mVoJx4zT5KIfHxX0HgXbszgQnP7mblkJXgGRiuC1pSISjYywtaoEkr51+VawWetHG
	Yef0070S8eS/2qTCsPAu+A+2cjT/+3JJPsNTQ1yD4mYU62Z8r9ytqrb6V0eZPIMLYEDoblhB0M3
	X2ap8WHf0B93z8a/hVpHytYg4tk4Xu5t7UX0ufAZKkXP9NbtyHsVNM89wGMYyNIgYS3X0zhku9g
	gDSsoB6L5nMSRO83TJ+gRZdiC6zKVJhP/Bx2GRuynlpOxD3gLPJb4xgQzA0r1+zGtmyISlOeVxx
	R0YBCSflxUK7um5FdT07Z2oI/OZunD9RUtRQ==
X-Received: by 2002:a17:90b:2383:b0:36d:6315:1de5 with SMTP id 98e67ed59e1d1-36d63151e6amr2613775a91.18.1780178503719;
        Sat, 30 May 2026 15:01:43 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc6b7c178sm5814986a91.15.2026.05.30.15.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:01:43 -0700 (PDT)
Date: Sun, 31 May 2026 06:01:30 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Joshua Milas <josh.milas@gmail.com>, tglx@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com, 
	unicorn_wang@outlook.com, inochiama@gmail.com, daniel.lezcano@linaro.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	liujingqi@lanxincomputing.com, alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, 
	dlan@kernel.org, chao.wei@sophgo.com, anup@brainfault.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, hanguidong02@gmail.com, 
	michael.opdenacker@rootcommit.com
Subject: Re: [PATCH v5 RESEND 2/5] arm64: dts: sophgo: add initial Milk-V Duo
 S board support
Message-ID: <ahteG0AtGbTLexVu@inochi.infowork>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <20260530173347.33533-3-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530173347.33533-3-josh.milas@gmail.com>

On Sat, May 30, 2026 at 01:33:44PM -0400, Joshua Milas wrote:
> Adds initial arm64 support for the Milk-V Duo S board
> [1] making it possible to boot Linux to the command line.
> 
> Link: https://milkv.io/duo-s [1]
> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  arch/arm64/boot/dts/sophgo/Makefile           |  1 +
>  .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
>  2 files changed, 86 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> 
> diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
> index 94f52cd7d994b..68aace728223a 100644
> --- a/arch/arm64/boot/dts/sophgo/Makefile
> +++ b/arch/arm64/boot/dts/sophgo/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
> diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> new file mode 100644
> index 0000000000000..8632470f43ab0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +/dts-v1/;
> +
> +#include "sg2000.dtsi"
> +
> +/ {
> +	model = "Milk-V Duo S";
> +	compatible = "milkv,duo-s", "sophgo,sg2000";
> +
> +	aliases {
> +		i2c4 = &i2c4;
> +		mmc0 = &sdhci0;
> +		serial0 = &uart0;
> +		spi3 = &spi3;

Apply the same change for the reply on v5.

Regards,
Inochi

> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&osc {
> +	clock-frequency = <25000000>;
> +};
> +
> +&dmac {
> +	status = "okay";
> +};
> +
> +&emmc {
> +	bus-width = <4>;
> +	no-1-8-v;
> +	cap-mmc-hw-reset;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&gmac0 {
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +};
> +
> +&mdio {
> +	status = "okay";
> +};
> +
> +&saradc {
> +	status = "okay";
> +};
> +
> +&sdhci0 {
> +	bus-width = <4>;
> +	no-1-8-v;
> +	disable-wp;
> +	status = "okay";
> +};
> +
> +&sdhci1 {
> +	bus-width = <4>;
> +	cap-sdio-irq;
> +	no-mmc;
> +	no-sd;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&spi3 {
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&usb {
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
> -- 
> 2.53.0
> 
