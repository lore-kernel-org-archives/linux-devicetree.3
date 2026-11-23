Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795395467;
	b=Pko0lAldAy/fIjW5fDO2m17SO2aAH0tmGBA/wBwvmFT+3RxPdRGOjY3W5cyxW6ss1HHE
	 mketCOkf8jTocoriOgqY4jrL0ufKCKTeEr/GgaluPeZywWfv0PMyQwyupYL7ES1NRINWK
	 srGDFoVuyNjrLX2FS7MEI+8ocz5ECgRgk4+Kk+on8W9GbGuxQXAfl2LuckiqL2Ds+lc0k
	 zx6RgBzkxojOn/IRM6gdoDgSCjb+UrRaMSJs/lrytY2Sr1BB/+orLWGHKJjH6ib8/lpZ7
	 3ZUqjLNbwGsjHHjhsc9+3/KprggibDA0h2s8b2gMhyt5tYrKKTbk1r1+MJbuXE8R40g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795395467;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fc8Ar5aH5Y5otKVLEatz4wwbIIdMLZtXZ0Vqbo5bjHo=;
	b=lziUsKcF97ZV/uB/I+JeHxFHwFw6XD1X348miyEnxi4ACithCG3+VkxbMINTtif0E3E5
	 +S4OVYx7AM+WoocAxa1ElONXVqtloKIHLKORNCDYFw6QtUhRT83io7ek+WXD+VSbXij/U
	 jOus2KD1CI188MS61Ke60hlX/M1DoE1jp2/KCgP9EY2elK1/eNB/1L4Wn6O5IK4gZCQVX
	 RQ/gxLOqy0NX/NiwvbfaBujNdnJWUJy+e3qhbSLCRNd7yzDbHpk6D82Oxcop3aCgF5SnI
	 7vxGytSy2tqaEeD+sH0rB7Y05/uuaVIchJWMvR8QZfsJWX60e0Mc4nEffChLa4DHNNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cgRXkngm;
	arc=none smtp.remote-ip=91.218.175.201
Received: from mta0.migadu.com (out-201.mta0.migadu.com [91.218.175.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7365606A33B
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 00:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7365606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cgRXkngm
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1Z+IV195TFBGbtanyq4aEdiPJ9El2Z9WkuHp4Wlnj24=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795395463; v=1; x=1796000263;
 b=cgRXkngmMNtAHuGqTXs8XGGOeo13Ta/LeISW26FYOi7oQg2o/FIQD+M5e2Iv2N9nxKZU/Gw9
 Tra2kEqSDA88+2cbvS7rvxxFriipPUP3dM4G6NWEM4MR6+TCKFZV+d5ks7t7mW17RbXy5QKFhrC
 y0kW4ehzeuiQPWRO17s7cBec=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6ddd898802172db6;
	Mon, 23 Nov 2026 00:57:43 +0000
X-Mizu-Trace-ID: 6ddd898802172db6
X-Migadu-Flow: FLOW_OUT
Message-ID: <f611948c-0462-45c3-ae69-2ae083231f2b@linux.dev>
Date: Mon, 23 Nov 2026 08:57:37 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] riscv: dts: sophgo: add Milk-V Duo ethernet DTB
To: Hiago De Franco <hfranco@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Chen-Yu Yeh <chenyou910331@gmail.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
 <20261104-milkv-duo-eth-overlay-v2-2-e3d2d39cf229@baylibre.com>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20261104-milkv-duo-eth-overlay-v2-2-e3d2d39cf229@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/4/2026 10:52 PM, Hiago De Franco wrote:
> Add a DTB that applies the shared cv18xx-eth.dtbo overlay to the Milk-V
> Duo (CV1800B) base DTB. This enables gmac0 and the internal PHY MDIO mux
> on boards with the Ethernet IO board, matching the existing Milk-V Duo
> 256M DTB.
>
> Signed-off-by: Hiago De Franco <hfranco@baylibre.com>

Reviewed-by: Chen Wang <chen.wang@linux.dev>

Thanks.

> ---
>   arch/riscv/boot/dts/sophgo/Makefile | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index 440acd0aa55a..3c9f3530526e 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -1,5 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0
>   dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
> +cv1800b-milkv-duo-eth-dtbs := cv1800b-milkv-duo.dtb cv18xx-eth.dtbo
> +dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo-eth.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += cv18xx-eth.dtbo
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
>
