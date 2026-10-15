Received: from mta1.migadu.com (out-239.mta1.migadu.com [95.215.58.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE40B183CC3
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046832; cv=none; b=Wk8udN4nx6AJJnU5ifQtSkexMis+94QEIkTVnKT0SKgb0hrz7yJX1QKpAfxTGhJYozhaHHFXWKwZAXv9ZqH5rtYQTvYR5rtKs8ITg+YBPUlQh8zA6MFJB1Rp1kKEARuuVHvSUxg0S4S9fWSzAlRR8RsaSzsyS83asDpFD+Vzk0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046832; c=relaxed/simple;
	bh=t0IiZB/Ux47ttYhnh6RR0lffF1iWD71iJlXsK4k5DOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NVBuOct9nJGcfky51kvSJJR3KK403toe85mfVkERb8PzYbxD6zohySG7MOaFJCyG6OIhygH6R4TYlXOVFMyitHkVLbkJasSM4sWHCKOgcMbqLuYtMH5ABRnndAf7FvB14jyeE1077w7TTPoypbZF2MeKkM7uNL28fIFycvvgs9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TTx/nC1Q; arc=none smtp.client-ip=95.215.58.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TTx/nC1Q"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=t0IiZB/Ux47ttYhnh6RR0lffF1iWD71iJlXsK4k5DOc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792046827; v=1; x=1792651627;
 b=TTx/nC1QABBM3wNaW3dAXJYGE9k2GVpX8LG4qwqz576pl6UxY05/5R3tjISDNuvgKROx8XPi
 sAakGSpaeqPnSIARr7zN+QHUC6z1toBfReID365lkmYR4eeOysEATXa2LK2GnkNxGhjeKl+VHKl
 5HaYOBTp6FkWYkEksBpcwqH4=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c8ba14fd1bd62bdb;
	Thu, 15 Oct 2026 06:47:05 +0000
X-Mizu-Trace-ID: c8ba14fd1bd62bdb
X-Migadu-Flow: FLOW_OUT
Message-ID: <861d25f6-7bcb-4b04-841e-89ed4cf55843@linux.dev>
Date: Thu, 15 Oct 2026 14:46:58 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] riscv: dts: sophgo: sg2044: Add eFUSE device
To: Inochi Amaoto <inochiama@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-4-inochiama@gmail.com>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20261014074516.240247-4-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/14/2026 3:45 PM, Inochi Amaoto wrote:
> Add eFUSE controller node for SG2044.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
>   arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 12 ++++++++++++
>   drivers/nvmem/sophgo-efuse.c                         |  1 +
>   3 files changed, 17 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> index fed3d9a384a0..1b506972d465 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> @@ -36,6 +36,10 @@ &emmc {
>   	status = "okay";
>   };
>   
> +&efuse0 {
> +	status = "okay";
> +};
> +
>   &gmac0 {
>   	phy-handle = <&phy0>;
>   	phy-mode = "rgmii-id";
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
> index 320c4d1d08e6..9577aae08f7f 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
> @@ -408,6 +408,18 @@ sd: mmc@703000b000 {
>   			status = "disabled";
>   		};
>   
> +		efuse0: efuse@7040000000 {
> +			compatible = "sophgo,sg2044-efuse";
> +			reg = <0x70 0x40000000 0x0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			clocks = <&clk CLK_GATE_EFUSE>,
> +				 <&clk CLK_GATE_APB_EFUSE>;
> +			clock-names = "core", "apb";
> +			resets = <&rst RST_EFUSE0>;
> +			status = "disabled";
> +		};
> +
>   		i2c0: i2c@7040005000 {
>   			compatible = "sophgo,sg2044-i2c", "snps,designware-i2c";
>   			reg = <0x70 0x40005000 0x0 0x1000>;
> diff --git a/drivers/nvmem/sophgo-efuse.c b/drivers/nvmem/sophgo-efuse.c
> index 5f90adaf8e4f..568d17b88ff6 100644
> --- a/drivers/nvmem/sophgo-efuse.c
> +++ b/drivers/nvmem/sophgo-efuse.c
> @@ -14,6 +14,7 @@
>   #include <linux/mutex.h>
>   #include <linux/nvmem-provider.h>
>   #include <linux/platform_device.h>
> +#include <linux/slab.h>
>   
>   #define SG2044_EFUSE_CONTENT_SIZE		0x400

This change is not related to DTS, should it be in patch [2/3]?


