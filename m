Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D31731077A
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 16:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776788055; cv=pass; b=p5epfv2qvuP3Lc5vTkfW3M2IkHMEgSbk2fsX5e8TqrBRb7g/Ci5ZmdG3KEuOoIW2GbYkAQwi7v//REtHV8nHG4qYD5mxaGeJrbmKudEDOU0kTeVSVT+2/56qj/+a7/8sKnIeuDa7pWT8EO6eShKgWmK1U7zI3fSfgCSWw17BgJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776788055; c=relaxed/simple;
	bh=7gVeWo4+oY4Q0kqA2hOQ1OQ3rgGg0MyfM78M7xgQgbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LqmYJ//Oor1yKIzbR35xpSIXPbJKTR8TUkrla122uFvDDh6lXFHClKrcl4q1ifs5nsWWryA1JF/fjVEj8VwvGfQEA55vpvXYWSZX/XAtRZY5d9vsHYm5RzMxSpxrlz8VgM4i7QGB9eXpvcodwAJnnbfL5eGoFBHyxSkx+zfcdBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmNeARGU; arc=pass smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmNeARGU"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-479d593a0c3so1595180b6e.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 09:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776788051; cv=none;
        d=google.com; s=arc-20240605;
        b=FMlZRGqhnYYG9taDRju1wPeLSskw6NIFdUiph6w8kRv9KVVFbLK1xb/Zz67kfMvQbW
         JriQ0W5t8JhvrS4SOx2fD8REX7Rtss2fH10KExA8Gyok2BWrvEHhzsUhxYY6/vZDRfx+
         5Bf9Wj89HM7B2GLoNZG+Aq5mReYDQWIWcynCHnNtEaIBv8Rewxp0YWoYWomfruT98Jz9
         bXfjZPcp0mvpv10cNXSre9gjXTIWvxVJKDZNy2sC1psneihHaJ3w2hnf5BvEjdfRsJy+
         60skb5tEuFRas9e6l78VYv1qioiHpUMd8JRCv+tmym7oplDJfsleSlSaWWWyjO8KZCo1
         v+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PoH5cen/vhOZ0DzwkKLECtpXsvLoy+/ZJjPSwZrY7fU=;
        fh=jryZIEZ2GVnXmV/DD0E2tWG01nvW7EeaZfwAwhoYI2s=;
        b=QPhDeGFF99CQTGHZOawtV1/fIqxlnpU4ov6e9mxfWQ97FWjOFULjN6ktpocuU3Qh0v
         Mj/4Edu+guI4mFeFiw5/7qrUPssSAQ7dQk5SymCPBz90rVJPrMzeLDoeNycEfZKtIcUu
         va2SHN/EYSYSBsyTW7N3zpJpWN3RRatzMe3BT9hjoJx9UPkV4Cu1Sgrp7py69vKong4o
         Vu/5y3ZgfdXBdqtvJM1QcPsLih6UnHQig9REdlbTKiilWzsoDgR6MaGR6ctz+d2/EjCB
         QAkH+UiFCmQc8id2rufG1k4HFPiWzPJzMxap+jW8fqU3zPJI4slJhXkIsEAgEhVBct8i
         g2eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776788051; x=1777392851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PoH5cen/vhOZ0DzwkKLECtpXsvLoy+/ZJjPSwZrY7fU=;
        b=XmNeARGUnnlcwiV7BJsr+K+o3w+3YiMZQqFfj+7ZqsnNYnqAgrIOwiCKCjv2sMUEzc
         yIXQgQVsvy1wz59SjI4n9lDpLWAXiYG1lBi7P/SVw0H7jo9ZH2DrkgJWs9XGGggd1pBK
         ydVrgiQAa32RvgYHmKrjTAhDkopWTrJpIZXu7XkAy43CbWrTqjwa9Fmp4OgxcWiY5Jxn
         Lr0Ub7uceLkc4wYDuLot5/7FebWugL3bLRSms8TdtqRrEeQYVTXcbpPhfV4UmUL7OVh4
         mxjIIvnejg87JaTbIGUxfgXEa2Yps8kcMQUWXU5/EJ305G39DBNAo4UKzJhT3SZPfP5v
         VFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776788051; x=1777392851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PoH5cen/vhOZ0DzwkKLECtpXsvLoy+/ZJjPSwZrY7fU=;
        b=IBN0rT5R4a9z4KpW02whQ09Uolt+OeFEsPfzPm5QCMN0cGS9Q556qyW4CRgHqGfR79
         GVwwpoFbZiOYY2aLZA+ZZJ3dzK96viXRikAFqRbxvi79LlecReXjiQ2U27llQAIlq13m
         YFE7ou7oeSms1v0Qh0QXQiS1OD33nk3oU7+bLjghji8H+o6DIn0UeyHclaHNm2TCfx29
         QwsQNamhKvvESIbg6DstoMj0qPgVpZLBPZwdCYfl3DB3123MTUduynZ1Cpi4VdzCyKA8
         Cm3FE7w8WryQCZIHZi/ilL0YlGWlfwHb3UCrMomV2TUvROJ0bQNG4XsqtuNXRfm9z26w
         OjUA==
X-Forwarded-Encrypted: i=1; AFNElJ/Cv3TxKh81Os/D8vI126RoiFUJE+WGxLJVxirzzCxjtkBTPYw80Br08qTFKYRz9oc16weLNwilxpBi@vger.kernel.org
X-Gm-Message-State: AOJu0YzBAB3bXLNPBG+Jb+DUthV9BrgyOCqoVbemve24QKpXeVeWvnGH
	tGS3lVhKDBc6sIWG5e0qOZXUfpQg/tggiZoZc4FYloA2ZaxWtwvpVQ9LFoDJyC6NHh8HtS86TdH
	OBowiC7On5q/MJU4qmAC6DpNqdPoEo0U=
X-Gm-Gg: AeBDietiRM9Q6ylzRBh2R3XvQK04/fS7oHygB62EQCH/tP/xF3jO8o19S2ttXDB8Qb+
	zfMUlnLj7xj3R+wO+g1ZhPjWBjfdJOgXjw9uEfidBMQfSAF17djWuosHCNmR+LCxg90clZ/bIJS
	cZfocTHMS4YoK7Z5WuFKVQidAF7IGt0AVLaYFlRp5qcu9obNtAs9vGo/fPpbP5QrSV8R5Qv5Goz
	235vFIM/B54hbTANnWdTa2rq5ohYkWbI2SMVqM5KX6YCpyinFLFIAzK673fqA0eAn/Xdl8Pg7dv
	NLILfh5OiInk39zTRZcY1t8fECQdf/O/kVkbrCWIojTzmgB3NO1ou8jg03Tlb/0KGt1KwEOUteS
	G6F3A6R/7UftLm8aDqiAf6wMGQ/kvVbfNX8vsK1Fu
X-Received: by 2002:a05:6808:e68b:b0:479:e826:ccdd with SMTP id
 5614622812f47-479e826d1c3mr2175511b6e.5.1776788051231; Tue, 21 Apr 2026
 09:14:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403111516.379795-1-josh.milas@gmail.com> <20260403111516.379795-6-josh.milas@gmail.com>
In-Reply-To: <20260403111516.379795-6-josh.milas@gmail.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 22 Apr 2026 00:13:57 +0800
X-Gm-Features: AQROBzBBI72CSkLDmiqtls647M6PwNy4PB7CMyuLTU7f5ccTrkmAadBqQHw2l3A
Message-ID: <CALbr=LYJKJREwh8KMqsgcXwd+jx0W7gFFFuBk-izNdgzkQU6Pg@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] riscv64: dts: sophgo: add initial Milk-V Duo S
 board support
To: Joshua Milas <josh.milas@gmail.com>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	pjw@kernel.org, samuel.holland@sifive.com, unicorn_wang@outlook.com, 
	inochiama@gmail.com, daniel.lezcano@linaro.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com, 
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, dlan@kernel.org, 
	chao.wei@sophgo.com, anup@brainfault.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, michael.opdenacker@rootcommit.com, 
	Wang Jiayue <akaieurus@gmail.com>, Yao Zi <me@ziyao.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 7:16=E2=80=AFPM Joshua Milas <josh.milas@gmail.com> =
wrote:
>
> This adds initial riscv support for the Milk-V Duo S board
> [1] making it possible to boot Linux to the command line.
>
> Link: https://milkv.io/duo-s [1]
>
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>

Great work, thanks Joshua! I really like this board.

I encountered the same issue Michael Opdenacker saw in v4, but
enabling the MDIO-related configs resolved it.

I'll keep using and testing this series and provide further feedback
if anything comes up. Next, I plan to test the arm64 side and will
also try developing an efuse driver.

Tested-by: Gui-Dong Han <hanguidong02@gmail.com>
Reviewed-by: Gui-Dong Han <hanguidong02@gmail.com>

> ---
>  arch/riscv/boot/dts/sophgo/Makefile           |  1 +
>  .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
>  2 files changed, 86 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
>
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/so=
phgo/Makefile
> index 6f65526d4193b..58cc6b70d8de4 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_SOPHGO) +=3D cv1800b-milkv-duo.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) +=3D cv1812h-huashan-pi.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2000-milkv-duo-s.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2002-licheerv-nano-b.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2042-milkv-pioneer.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2042-evb-v1.dtb
> diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/ris=
cv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
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
> +       model =3D "Milk-V Duo S";
> +       compatible =3D "milkv,duo-s", "sophgo,sg2000";
> +
> +       aliases {
> +               i2c4 =3D &i2c4;
> +               mmc0 =3D &sdhci0;
> +               serial0 =3D &uart0;
> +               spi3 =3D &spi3;
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial0:115200n8";
> +       };
> +};
> +
> +&osc {
> +       clock-frequency =3D <25000000>;
> +};
> +
> +&dmac {
> +       status =3D "okay";
> +};
> +
> +&emmc {
> +       bus-width =3D <4>;
> +       no-1-8-v;
> +       cap-mmc-hw-reset;
> +       no-sd;
> +       no-sdio;
> +       non-removable;
> +       status =3D "okay";
> +};
> +
> +&gmac0 {
> +       status =3D "okay";
> +};
> +
> +&i2c4 {
> +       status =3D "okay";
> +};
> +
> +&mdio {
> +       status =3D "okay";
> +};
> +
> +&saradc {
> +       status =3D "okay";
> +};
> +
> +&sdhci0 {
> +       bus-width =3D <4>;
> +       no-1-8-v;
> +       disable-wp;
> +       status =3D "okay";
> +};
> +
> +&sdhci1 {
> +       bus-width =3D <4>;
> +       cap-sdio-irq;
> +       no-mmc;
> +       no-sd;
> +       non-removable;
> +       status =3D "okay";
> +};
> +
> +&spi3 {
> +       status =3D "okay";
> +};
> +
> +&uart0 {
> +       status =3D "okay";
> +};
> +
> +&usb {
> +       dr_mode =3D "host";
> +       status =3D "okay";
> +};
> +
> --
> 2.53.0
>
