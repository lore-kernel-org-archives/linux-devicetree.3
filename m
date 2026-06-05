Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287124C0409;
	Fri,  5 Jun 2026 09:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780650634; cv=none; b=by+mVv1hQ1pvuM6Zs+iBXlOgDaA/2rYyUl0d4AQojVnA920JU3AoROPcxt8nesFP88h6Tz2w+Q/4NBQN56bAhHHUDDPZrDKzZbFeRqjEP3IPN1PTlgCPRsgWrIOr3i32RxhkwLBGfRCeHAREsDCGu2YN0VQpZRGk6EpAvGYtwoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780650634; c=relaxed/simple;
	bh=wmvUgqY5BZyHeFmqPz4uKT3rEQ0+QazR2avhAdS3rdo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=REh6Td/1ik0Ah0mPXNDRiXNQChvIOjEt9iCLqqmmtQQAV0miBDN/h7poshWCdSi4yjwkTcvc0RDFqGqUb1SVEg9U6b7S0G9A5MhDIMYzkpCZZYgZUeCg5QuDn8JkGiT4+FMATVeuRnTYXwGW/9TNITuL/MRC8fbCfSTDP41MSY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vI0C77rl; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vI0C77rl"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gWwdJ6LJbz9tqP;
	Fri,  5 Jun 2026 11:10:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780650628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pZu3uHIMs3CS8SP0rLKrzCVJEON6Er92uMM8TGXVtnE=;
	b=vI0C77rlpZ/kb5L+pgPubmrB62QzwYFwz/UtAHRj2WIe5QWJcrcdlu7DJXp+bnp/mZOxPW
	SxRfQrvUedLB+UfTzhRQlEINbsmW82fK4jS7YGqo5HGrMgiLgebZLvvOH9Vjqh/ToRynXG
	D3B+rRbWwyqls/Fl0rMv4gORxurK1z8WaEAA7cAQ+Ebasckmi6oshlvuUm0Ip8Q8s+4P5L
	qDlCaBMvu/zJI0UTVyQV3m+ia9Do+7DllCFdH4JJJDJP6rKQH7NEz/HqzwxP5Gynq2hisJ
	CHtaDC81fMXVh/G28KF5Ofk9RDloHe/p7aoANWUmKQq5Ds8lfZmJLTzAtofBxw==
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 17:09:56 +0800
Message-Id: <DJ0ZYF5C8MMH.2GBBY188VVPSH@mailbox.org>
Cc: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <sophgo@lists.linux.dev>,
 <hanguidong02@gmail.com>, <michael.opdenacker@rootcommit.com>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v5 RESEND 5/5] riscv64: dts: sophgo: add initial Milk-V
 Duo S board support
From: "Shuwei Wu" <shuwei.wu@mailbox.org>
To: "Joshua Milas" <josh.milas@gmail.com>, <tglx@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <pjw@kernel.org>, <samuel.holland@sifive.com>, <unicorn_wang@outlook.com>,
 <inochiama@gmail.com>, <daniel.lezcano@linaro.org>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <liujingqi@lanxincomputing.com>,
 <alexander.sverdlin@gmail.com>, <rabenda.cn@gmail.com>, <dlan@kernel.org>,
 <chao.wei@sophgo.com>, <anup@brainfault.org>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <20260530173347.33533-6-josh.milas@gmail.com>
In-Reply-To: <20260530173347.33533-6-josh.milas@gmail.com>
X-MBO-RS-META: ty4b5d94rbfqutfk8wi54pxq6xud5tic
X-MBO-RS-ID: 68716531ea3f837e9e1

Hi Joshua,

On Sun May 31, 2026 at 1:33 AM CST, Joshua Milas wrote:
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
> +	model =3D "Milk-V Duo S";
> +	compatible =3D "milkv,duo-s", "sophgo,sg2000";
> +
> +	aliases {
> +		i2c4 =3D &i2c4;
> +		mmc0 =3D &sdhci0;
> +		serial0 =3D &uart0;
> +		spi3 =3D &spi3;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +};
> +
> +&osc {
> +	clock-frequency =3D <25000000>;
> +};
> +
> +&dmac {
> +	status =3D "okay";
> +};
> +
> +&emmc {
> +	bus-width =3D <4>;
> +	no-1-8-v;
> +	cap-mmc-hw-reset;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	status =3D "okay";
> +};
> +
> +&gmac0 {
> +	status =3D "okay";
> +};
> +
> +&i2c4 {
> +	status =3D "okay";
> +};
> +
> +&mdio {
> +	status =3D "okay";
> +};
> +
> +&saradc {
> +	status =3D "okay";
> +};
> +
> +&sdhci0 {
> +	bus-width =3D <4>;
> +	no-1-8-v;
> +	disable-wp;
> +	status =3D "okay";
> +};
> +
> +&sdhci1 {
> +	bus-width =3D <4>;
> +	cap-sdio-irq;
> +	no-mmc;
> +	no-sd;
> +	non-removable;
> +	status =3D "okay";
> +};
> +
> +&spi3 {
> +	status =3D "okay";
> +};
> +
> +&uart0 {
> +	status =3D "okay";
> +};
> +
> +&usb {
> +	dr_mode =3D "host";
> +	status =3D "okay";
> +};
> +

I tested this series on a Milk-V Duo S board with a RISC-V mainline kernel.

The board boots successfully with sg2000-milkv-duo-s.dtb. UART works, the S=
D
card is detected and readable, Ethernet works after enabling the MDIO mux
options, and the DMA, USB host, I2C4, SPI3 and SARADC nodes all probe
successfully.

One thing I noticed is that the Wi-Fi SDIO device is not enumerated with th=
e
mainline DT. The sdhci1 host itself probes:

  mmc1: SDHCI controller on 4320000.mmc [4320000.mmc] using ADMA 64-bit
  mmc1: Failed to initialize a non-removable card

and /sys/bus/sdio/devices remains empty.

With the vendor image on the same board, the Wi-Fi SDIO device is detected =
on
the corresponding controller:

  mmc1: SDHCI controller on 4320000.wifi-sd [4320000.wifi-sd] using ADMA 64=
-bit
  sdio vendor ID: 0xc8a1
  sdio device ID: 0x0082
  aicwf_sdio_chipmatch USE AIC8800D80
  sdio ready

So it looks like the SDHCI host comes up, but the SDIO device behind it is =
not
discovered. I may still be missing some config option.

Have you seen this issue on your side? If not, could you please share the
relevant kernel config used for your testing?

--=20
Best regards,
Shuwei Wu
