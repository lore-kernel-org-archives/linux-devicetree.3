Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.122
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793794904;
	b=yJzEnz/K+VN5qRImMSjG2lXj/XWcgdpkk56+I9TkBgZoMOre4pl20SH10kU0lJCSxdnw
	 QvjT3BVdPu3w3E33w11eE0IsIwhs4ghgoApDQ8EmlE3mYQ96TZheMYBk0t8ecDdEPlRwf
	 G8cvO5pH35345VOIL9UBy+9z4/i9Tr0nRc38mRE2nNtPpQvqy5mIlA6Ahz77Y8je6kJIQ
	 eS2l0Phn6zQ5X2o25abarCgSzzHMqeAPsXCBOcaudeBYRdMwcp+AyjOVX/MTnCBT7DImy
	 fzbfAIbGZXN+WUo1XWwR9eFrSsxOwql05V6C1ZveCvt7rk6bjaXr3f5J/rClRO6CGzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794904;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=DLiir0b/2WOs2YcDbEqb6fOBt0XwzpsNWUx0VYlKRDA=;
	b=LrqnaXhfZmXDjM1BvfcaE4DF0Lk2yspKjYPUHsjaUGUhhdUqvAm3w4yKtY5g+/Kh+vJc
	 mSg7qB8IzD+QwT7F9/tAfb7ygDqp3LkWRNFH3BARHa7NREaFZ6Gf6swByWs7xx/tu3SgU
	 IVj/Ilei/VQMoPAf+Ng17SUeOdy2ucVvPujpuH13RrtYbhB9bbVZAZZiHfVFmA4QkgL3o
	 RDLxvNNg+LMxSjc1XsucRfrXrGxJRT0T50xd/FIWYnWLYdBw/k1bJYGLf/a0aDV56sxea
	 XLpg+QRa8cOLZf5aJhPc7XaA1fmtLw62Go/iaQLHVtfiplQGM6IBn7xPzv8vwJggKvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=gz0CoSuo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD28606A329
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BD28606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=gz0CoSuo
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4B9453F780
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793794894;
	bh=DLiir0b/2WOs2YcDbEqb6fOBt0XwzpsNWUx0VYlKRDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=gz0CoSuoUjYFvXYrPQx01KJD0eT+lX1bPpfRY/AYyvmTHMZA4s+XnDn12sRzssZsU
	 Yj/LeNecBV1CjQCBA5PEwZ90G4yXUGey9EOWWc3UP1WGuc/leMCwrSwVm2aeuda8nu
	 9DlPk7SSXyw9Ptj9kYhDyLCOw2PkWmVwHjxleD175xHf5LdTrV7qjrolDG9CpX1tw6
	 2de8BYPw77UpyVu8M00mwe2DeOAmhkBYAGJhcBS99b7EE5w9Xgf4jU9PNbEqcRl9G1
	 ft7Iw5cNVH1sdES86AtNWkA6Yet6Jk0vDGsb/2R70zEG38UKAq/Mg40JG4BGJTRPZu
	 okPdZ60KGJh12sbwlMCoRs8w85uWO57ylkGMunyH77nsR64t6uzQZqQxqsa9+yCqAn
	 KORq/bahj3wyPJcMRUawvuqQtrbxh0qP/irgGmZ6PN+yKquVrdIcn5/0wv6ATGF9Zp
	 jZNGpQzan4k4fWN3p/jnomwhGKmhkV0Wd56ORoXxjzySklNncNeHR5oRjEgNVC7g/D
	 Ibg3Gnmu2sr1GtXnPAzJJa9IlQ7AkU2IvEXhtNw1upt61J0XQfxRM1x/zcWVdk0ms9
	 L2tqV3B7lRYjAruTvEtPsyBUV7yL4cIiieKV0tkGHvRHbH1FhgWk+Y/TDNjsbVrDAw
	 uyv0sVBHir6dqgRX7knB/LkM=
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c41dae9db9dso92129166b.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:21:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793794894; cv=none;
        d=google.com; s=arc-20260327;
        b=kE4S1avmagTV8p5p1I+QP7vi59HyIniQLlAjVqlofD7BBNMu+JEtukrvZdNQGmYRsl
         vlpBZPCP8Snd97Fp0c6qz5mWzGpQavCHY2KpwleoRMheA54HZfA4wQOnESBBRda3MLqG
         lke25msZZU9+bRm/qD7Akh+OdK8lSdpCpPKcEGTcQ5jZp3TJF72NDHrcm6LI0284qg9w
         0R8BQPodWuv/6rAjTK3BFFgi1bBvNhhXQf5Om38mn3NJaaS9SuZ5J5IAzrUWN4Y2CDWi
         FyYpcU+RxN5Km3OeaGSETd/ZL0RA16FpsW8no+c3EYLNF7ShNYuXk4kPaRy14uVIMY+r
         wb9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=DLiir0b/2WOs2YcDbEqb6fOBt0XwzpsNWUx0VYlKRDA=;
        fh=+Yn6vXipRzW5O3Fxv+PJ3vI0XPs1vR9zI4fCPW+6ZSk=;
        b=kGjFUAkb15VMfc2WE/D7ur5YWTMXB/1gk5GKLHPpIbRADjQqbsBB55I8OX/CvE8hNe
         Onb2+qYbmeQ0m2XE0kRrnjbgrZKwauFWWHDkf1/68/T5iATRf43P5huOLn3KlfXJs5J2
         S3dFaBhd6ctXkzMKfbsiFR0p2O001unh2JUtyPhZ9f6ROHm3hnhct7L7i5CXYlzXngab
         TODCHua67hetucddmQ46b9MWkbFdUZXv0ONGG5Xx5BhpvGWcJ/XXTjzwHVMd9VIKU86p
         gmQGpMAKGIdfNK3wP1oJZWbZIaPDqHnDu5aavIaZCufCyc/o9jIKvdqvSJ4kQKM8xhlH
         4KRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793794894; x=1794399694;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DLiir0b/2WOs2YcDbEqb6fOBt0XwzpsNWUx0VYlKRDA=;
        b=mfHJH9XiNC+Vv+gvnW1jxT+/YZzi8hpmeJneoTQEwVOQttl/t1FiAAi1QR8rguJGud
         FuZev6oyWckDe7DZzRhTGAGeRD/I0A1S8e0yhyY0N00S9dwJPrt1GiMkHmIqRcmKcHMq
         QEkxVpkVobcK9FHMHxO3cbfKXdIs1SUE2URNVPLxKb7L3S7Yu8ae9Z2cDOFU7nzvRXcM
         u4PrD8ZeiejqYHDHKlgxYqnXoPT2cDsIJG3EJptQ/Y1qrqX0JEwUldRwamebxXRgUBBk
         pkAh3kWQByLVXhLNSoKzA+2S6csUeJrdurbJFwJhCl1hkCj2dqlu++zC+UiM/aQQA2T7
         KTSg==
X-Forwarded-Encrypted: i=1; AKwUvBwIDRKtu9fRu0j/AeN93u06+k7qi2HwSon0eIHBE63ZWskNmSkwQ0HCahKJJhf/csIVmr1WSlKBqmpm@vger.kernel.org
X-Gm-Message-State: APuU4Z+9/I79kv2Ez9DOJx8VMVrJStv4UYxrc6GdFMuRQaHMo1nR6C+H
	W+s9IzIW8pJqcS3g0G0HMfKQ4cJ0Fiijo3hZ92CvRT1L/U2Ck9sfkCsY2SRy5XYfNKxrPQRO3Ph
	mB/4joL2Z1D2aH3sLS1w9/CcjpwEQl9fX3jbwXUG6aLqjModU2EkZlWgiqeZRd7LnYr78L98l2h
	4w8W5ZbncbROIwD6cdINDgCYajgqL29AW24DvZKeVTeogaQu6s0W9ZAA==
X-Gm-Gg: AYBFou3gGvYnN+drsqhzZoBsZXtul1hBxnXKk1/WG1z7lyVMaaPd+R2P5yZJ8VQXVGg
	wsCt6DsGQn0NyDpCbJ0xyjGyFPNXjzUl4fvjEx0g2Z07zUIcdCBRATTs86omTOnkdYZk3AX/1fN
	8Dsdy8Y1oSllm04i4uqYF3UG0O2rx6BF1VNIPcsrHDp3iqLEG7vQYuTv3QxsK6I5m3BiWbDd3yo
	d7XYfHXaT+o9Q==
X-Received: by 2002:a17:906:4a8c:b0:c4c:e344:ece7 with SMTP id a640c23a62f3a-c4ce344f6eemr563419166b.10.1793794893804;
        Wed, 04 Nov 2026 04:21:33 -0800 (PST)
X-Received: by 2002:a17:906:4a8c:b0:c4c:e344:ece7 with SMTP id
 a640c23a62f3a-c4ce344f6eemr563415866b.10.1793794893306; Wed, 04 Nov 2026
 04:21:33 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com> <20261104-k3-bs01dcma-v1-2-794025247e4a@linux.spacemit.com>
In-Reply-To: <20261104-k3-bs01dcma-v1-2-794025247e4a@linux.spacemit.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 4 Nov 2026 07:21:06 -0500
X-Gm-Features: AclHuK_XAaqgUQs2Aa9O6V8c62-48k8GCjUGQBNbXSzWZRHNnme5DGYTTas6Tew
Message-ID: <CAJM55Z9Yj87hqwMugqRsf_RL9np=KqzCj-J9RyutuWKd-w-n+g@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 BS01DCMA support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 07:24, Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:
>
> K3 BS01DCMA is a board equipped with a SpacemiT K3 SoC, 16 GiB of LPDDR5
> memory, a P1 PMIC, an EEPROM and QSPI NOR flash.
>
> Add initial support for the serial console, EEPROM, PMIC and QSPI NOR
> flash.

Hi Troy,

Thanks for the patch!

I just had a talk with Dong from Spacemit. He tells me the BS01DCMA is
the name of a module similar to the com260, only it has a different
form factor and each module consists of 2 separate K3 nodes. Similar
to how the com260 module can be used in a small carrier board
(spacemit,k3-com260-ifx) and in a 10-node server
(spacemit,k3-com260-tq), I'd expect to see a
common arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi describing the
module itself, and then an
arch/riscv/boot/dts/spacemit/k3-bs01dcma-<something>.dts that
describes the extra peripherals that can be accessed when the module
is plugged into the server.

Unfortunately Dong didn't yet give me the name of the server using the
BS01DCMA modules that they showcased in Shenzhen.
/Emil

> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  arch/riscv/boot/dts/spacemit/Makefile        |   1 +
>  arch/riscv/boot/dts/spacemit/k3-bs01dcma.dts | 266 +++++++++++++++++++++++++++
>  2 files changed, 267 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
> index 851b701e5da4..09d17fef995d 100644
> --- a/arch/riscv/boot/dts/spacemit/Makefile
> +++ b/arch/riscv/boot/dts/spacemit/Makefile
> @@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
> +dtb-$(CONFIG_ARCH_SPACEMIT) += k3-bs01dcma.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k3-com260-ifx.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k3-deepcomputing-fml13v05.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
> diff --git a/arch/riscv/boot/dts/spacemit/k3-bs01dcma.dts b/arch/riscv/boot/dts/spacemit/k3-bs01dcma.dts
> new file mode 100644
> index 000000000000..0c3b4ccd105c
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k3-bs01dcma.dts
> @@ -0,0 +1,266 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
> + */
> +
> +#include "k3.dtsi"
> +#include "k3-pinctrl.dtsi"
> +
> +/ {
> +       model = "SpacemiT K3 BS01DCMA";
> +       compatible = "spacemit,k3-bs01dcma", "spacemit,k3";
> +
> +       aliases {
> +               serial0 = &uart0;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };
> +
> +       memory@100000000 {
> +               device_type = "memory";
> +               reg = <0x1 0x00000000 0x4 0x00000000>;
> +       };
> +
> +       reg_5v_sys: regulator-5v-sys {
> +               compatible = "regulator-fixed";
> +               regulator-name = "P5V0_SYS";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               regulator-always-on;
> +       };
> +};
> +
> +&i2c2 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&i2c2_1_cfg>;
> +       status = "okay";
> +
> +       eeprom@50 {
> +               compatible = "atmel,24c02";
> +               reg = <0x50>;
> +               pagesize = <8>;
> +               read-only;
> +               size = <256>;
> +               status = "okay";
> +
> +               nvmem-layout {
> +                       compatible = "onie,tlv-layout";
> +
> +                       mac-address {
> +                               #nvmem-cell-cells = <1>;
> +                       };
> +
> +                       num-macs {
> +                       };
> +
> +                       product-name {
> +                       };
> +
> +                       serial-number {
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c8 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&i2c8_cfg>;
> +       status = "okay";
> +
> +       pmic@41 {
> +               compatible = "spacemit,p1";
> +               reg = <0x41>;
> +               interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
> +               vin1-supply = <&reg_5v_sys>;
> +               vin2-supply = <&reg_5v_sys>;
> +               vin3-supply = <&reg_5v_sys>;
> +               vin4-supply = <&reg_5v_sys>;
> +               vin5-supply = <&reg_5v_sys>;
> +               vin6-supply = <&reg_5v_sys>;
> +               aldoin-supply = <&reg_5v_sys>;
> +               dldoin1-supply = <&buck4>;
> +               dldoin2-supply = <&buck4>;
> +
> +               regulators {
> +                       buck1: buck1 {
> +                               regulator-min-microvolt = <1050000>;
> +                               regulator-max-microvolt = <1050000>;
> +                               regulator-ramp-delay = <5000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       buck2: buck2 {
> +                               regulator-min-microvolt = <1050000>;
> +                               regulator-max-microvolt = <1050000>;
> +                               regulator-ramp-delay = <5000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       buck3: buck3 {
> +                               regulator-min-microvolt = <800000>;
> +                               regulator-max-microvolt = <800000>;
> +                               regulator-ramp-delay = <5000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       buck4: buck4 {
> +                               regulator-min-microvolt = <2100000>;
> +                               regulator-max-microvolt = <2100000>;
> +                               regulator-ramp-delay = <5000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       buck5: buck5 {
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
> +                               regulator-ramp-delay = <5000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       buck6: buck6 {
> +                               regulator-min-microvolt = <500000>;
> +                               regulator-max-microvolt = <500000>;
> +                               regulator-ramp-delay = <5000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       aldo1: aldo1 {
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       aldo2: aldo2 {
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       aldo3: aldo3 {
> +                               regulator-min-microvolt = <500000>;
> +                               regulator-max-microvolt = <3400000>;
> +                       };
> +
> +                       aldo4: aldo4 {
> +                               regulator-min-microvolt = <3300000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       dldo1: dldo1 {
> +                               regulator-min-microvolt = <1200000>;
> +                               regulator-max-microvolt = <1200000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       dldo2: dldo2 {
> +                               regulator-min-microvolt = <900000>;
> +                               regulator-max-microvolt = <900000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       dldo3: dldo3 {
> +                               regulator-min-microvolt = <800000>;
> +                               regulator-max-microvolt = <800000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       dldo4: dldo4 {
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       dldo5: dldo5 {
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       dldo6: dldo6 {
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       dldo7: dldo7 {
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +               };
> +       };
> +};
> +
> +&qspi {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&qspi_cfg>;
> +       status = "okay";
> +
> +       flash@0 {
> +               compatible = "jedec,spi-nor";
> +               reg = <0>;
> +               spi-max-frequency = <26500000>;
> +               spi-rx-bus-width = <4>;
> +               spi-tx-bus-width = <4>;
> +               m25p,fast-read;
> +
> +               partitions {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       bootinfo@0 {
> +                               reg = <0x0 0x20000>;
> +                       };
> +
> +                       fsbl@20000 {
> +                               reg = <0x20000 0x80000>;
> +                       };
> +
> +                       env@a0000 {
> +                               reg = <0xa0000 0x10000>;
> +                       };
> +
> +                       esos@b0000 {
> +                               reg = <0xb0000 0x100000>;
> +                       };
> +
> +                       opensbi@1b0000 {
> +                               reg = <0x1b0000 0x60000>;
> +                       };
> +
> +                       uboot@210000 {
> +                               reg = <0x210000 0x5f0000>;
> +                       };
> +               };
> +       };
> +};
> +
> +&qspi_cfg {
> +       qspi-pins {
> +               power-source = <1800>;
> +       };
> +
> +       qspi-cs0-pins {
> +               power-source = <1800>;
> +       };
> +};
> +
> +&uart0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&uart0_0_cfg>;
> +       status = "okay";
> +};
>
> --
> 2.56.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
