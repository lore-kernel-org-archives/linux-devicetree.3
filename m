Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11A935F60F
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 22:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780178435; cv=none; b=S4f9G8S9UYR61ufM2La+YQnjUkCqJ0NZFVK+GvV4vqoZc1E4YdcuTHWFE6pyfv/Yf1Hiz3mncC78odN5HQOLn0fzo8DmJK7pdBK0hSDmEL+mTICiGxFSET4UVuJp/8VFP/ExDiFzf71VKA7wNgbTRXi2EaOo6tu549P3WNq2nY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780178435; c=relaxed/simple;
	bh=8ACCvZfQgDoShinwl2YMJesKGGkT1vR9PHtGFuN5urQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiWjZ1ptaeJM3FeUOaHQ/8rNNuW1BEr54bG55E2UA4sbcce4MABy0Toi5zKKpjY7hvlDAqIWUISNXOLqAs/ZTqQNt/IC1hZHOfdDPEG0mmjvwWUWnItwgM4SyeXe6cxf4S+d2K6E+HD9CuZHDRubU9ZBHiBAL0uZtoTyVX8GO60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b69GMHQ4; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b69GMHQ4"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0c32f6ce1so1054015ad.2
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 15:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780178433; x=1780783233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sx8cn06GRvGbPjFtz25dkBjZJsL3bsmHBqAxLucbQNg=;
        b=b69GMHQ4HIgIIDaLVlqiBE6uCIt0V0og+jrA6IuLJ1dqMSX3HdP7FwMXmAIpzTkhzA
         n3jySEiABFz81CE7kjI1oO2/7kaBxAJEHAKv9ca85m/eZgVWS/oj1daWmbeEFm32MVG3
         r6jjk6AZqZwAx1uT8YlH1nujWYXPjsp+Cn1Ca10UWvXs5B2SwWYwpyIsdJWyKPKR+91l
         dsYF7l0lnzJPj8xh4Kdg3qjH40lz6KSamnYvh0JeVJw+2SBJ6vp52tEifEXVhv5AH+pG
         F0LVh8cISnxXuKywJq3CsqAseE+BBsoEEn/6Xx33Vn9dwPHYVVRVl6WCtx/4eV84OtL1
         jbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780178433; x=1780783233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sx8cn06GRvGbPjFtz25dkBjZJsL3bsmHBqAxLucbQNg=;
        b=j9qMA7bx5E+cAs11kooy+y+GixhtDd31vzlHMIqbGiyyi1ca4HadRcHnSuJ8vqDMbR
         9T5YAuE4i2yECzxz0E8WrYtFQda/AxmmL3nnfdGZYStiD+Tbm70KFE8z50zIRePq+5zS
         19n6zlT3gGQTf170gqJmNFUWgxVUQ00y4kkWH6XveEzyVXs1dQNXTDGBjRM6mlnB5tkx
         DJWc3/bllVacw9DN/NP78J9mIPFlQlM2MWMw5eqR9Q7NviU56qikTpPVAJFdEu9PjNSZ
         fKPX893s9x466OGnc9FFB8J30MYWRrOZq2waHbkR4CNhpWArwQAXnhEUT3sGfvKXHhsJ
         98zA==
X-Forwarded-Encrypted: i=1; AFNElJ+IlpqTKoj3MJQdPh7Ej379lkHRTlm01fnc2/mHANvp+w94s5jhid8GK2xwpze6ZB5KCXun545uQ0+/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfmu4qRTu6V/hcsJel4DtJKOsy3L8vGxTPAd/1uSxm4JectJIF
	AZcqTaLvJFMVQ5eESEoVC41dCsWd9WWG0jcq0xYvh1C+9389PWx2rQVh
X-Gm-Gg: Acq92OHSmdxL4afK9/JnuXIUCUA5XN2Omtzr42fyw85jHCrMwKbQwUSMpjo47r89H0P
	4K7g9rphzX6oFGvpuG/ig0BSosvH3ZI0YlHlvpLOF480TjJsNSpsmYDWF9fnWuV6m7KshEBjjpw
	eh2SlJGIF2zE6jFSjJzUmP5VNQXANFghF43QfJcN1Mt4WKYdodMOmxC4nnc+XD9Ngm+sRMR4ezj
	dugEKMCi9atuxIgdL0w8VJ9Q1vBzukJIE7ydSQjRbkJ0vSbgW9FgZ0WkVEv7qqpZR0urmDudpXG
	X81d2cv3QqY8DvrOGG4jwxl8XgQHKObRKKxKoHQqiH8Wv52eYPg8Uracx9UgAppVrzqJxW3rb2q
	mR1dQIpmHRL/JBQFjnfoCCLTPzSvAWhpT277f7yxqWBWjH+sQ7Se9JMvtdp5DsZ0NXwOzHTHdnp
	O6pdvFHG/z2SOBGFsJjHPl3A386MBXF7smLA==
X-Received: by 2002:a17:902:f651:b0:2b2:5314:e96a with SMTP id d9443c01a7336-2bf3688ab6dmr56121035ad.34.1780178430477;
        Sat, 30 May 2026 15:00:30 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fdf0asm57301565ad.26.2026.05.30.15.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:00:30 -0700 (PDT)
Date: Sun, 31 May 2026 06:00:16 +0800
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
Subject: Re: [PATCH v5 RESEND 5/5] riscv64: dts: sophgo: add initial Milk-V
 Duo S board support
Message-ID: <ahtdkX3ZCraGxVcV@inochi.infowork>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <20260530173347.33533-6-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530173347.33533-6-josh.milas@gmail.com>

On Sat, May 30, 2026 at 01:33:47PM -0400, Joshua Milas wrote:
> This adds initial riscv support for the Milk-V Duo S board
> [1] making it possible to boot Linux to the command line.
> 
> Link: https://milkv.io/duo-s [1]
> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/Makefile           |  1 +
>  .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
>  2 files changed, 86 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> 
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index 6f65526d4193b..58cc6b70d8de4 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
> diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> new file mode 100644
> index 0000000000000..8632470f43ab0
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
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

Adding all the necessary aliases here.

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

pinctrl is needed, ses sashiko's reply.

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
