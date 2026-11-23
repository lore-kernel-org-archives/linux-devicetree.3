Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.241
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423303;
	b=CAEh7NFK7AeqMv9+1qyg7v/3ddiFxcYjIUSQYUnG0oCygXimYJEr0hS9ZxRp0ZRhNRDp
	 fscJgKegj3QVlNqTvQBaGbeTI1HAZYzdlm3sbKAXOhGhBc+m41R0x9Fp2oP8LRVTUMQHD
	 88zB0wQhKUBUbqaaOHo7vECqTfudG8qN4fi8HsUjNiYz1SlpM0UAE7x5hSsIAfr0J2v5l
	 LSx95uurLQ4eD+IVn1yZqj3ktEzaBNpyPYpnRX+TBbfq+MpKz+P+dHvJ8eH8uZ9MpC69i
	 yLUzyKIDGdd2zX/syeSarEB2XjNMvYZBRui2T9I5A9XqpvBXzJ70bwWsx0V/YLfRm0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423303;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=etC4+Jl76T0MEQ+fseHArwJ3zBooZY2/LaZ1Iwu3ZiQ=;
	b=tiHhIkQp/osKMXZukRrqcSaMaMRiWThvhHpQVwG90nLYkzHXcTDKjHeIRUM8/Ach7nxJ
	 P7PhATnl/M1aBpdmnvhK7biCtbG/M0ABLY8JM1o+Ew6OKvz2JeM+Z608J+adT3aIIulJS
	 ip160GlkmyoVXdv4V9XBGS+L9v4Tkagu96eoIWq0pzfIbr4l0kcOKyvoUpqZrel5ZpsyT
	 idFi1PVV20qbVdO0cvtJgvtAVkPpdZzGCqMdS4YBvKtjXYB/mu8YocSK8zKRc+vez4u7K
	 jm4xIrl/a7lY+q5ARGPZP3J4UcUq7VZZiXixn2jPpusii2NRis5B/N9lZTjWnsJo49Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="b9L/aAmC";
	arc=none smtp.remote-ip=95.215.58.241
Received: from mta1.migadu.com (out-241.mta1.migadu.com [95.215.58.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504DF606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 504DF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=b9L/aAmC
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=P4NQtTybGc0REmjpLHMH+9ubePcgyr439jm5FEY4xsA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795423300; v=1; x=1796028100;
 b=b9L/aAmCkl/bu3wiP8GVzXrnXxWzJGtAXbkG7EGetkbF57VmgThgd1KiLXSmXcB9PpADAIG/
 /nEl6+K7FzfU5wRLS/V8xH/1T9lTaHNoROu/b7c7DSb8J/Nu3ZnXPdErbVgzDmSckUsEi5zhzqb
 8pK8uZanSBAxjeAGimp0xrUc=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7cae5eb235d0b444;
	Mon, 23 Nov 2026 08:41:39 +0000
X-Mizu-Trace-ID: 7cae5eb235d0b444
X-Migadu-Flow: FLOW_OUT
Message-ID: <7e8e6899-8af5-497a-9eca-5091f7703020@linux.dev>
Date: Mon, 23 Nov 2026 16:41:33 +0800
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
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: Enable the RTC on SG2042 EVB v2
To: gaohan@iscas.ac.cn, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261122-sg2042-evb-rtc-v1-0-f222c64cc7b9@iscas.ac.cn>
 <20261122-sg2042-evb-rtc-v1-2-f222c64cc7b9@iscas.ac.cn>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20261122-sg2042-evb-rtc-v1-2-f222c64cc7b9@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/22/2026 9:33 PM, Han Gao via B4 Relay wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
>
> The SG2042 EVB v2 has a PT7C4307 RTC at 0x68 on I2C0. Enable I2C0
> and add the RTC node.
>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Reviewed-by: Chen Wang <chen.wang@linux.dev>

Thanks.

> ---
>   arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
> index d8c5814f22581076e6b5114f762d4fd090681b80..0dcc53b519971396a5ce734108ea0386fb186726 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
> @@ -124,6 +124,17 @@ &emmc {
>   	status = "okay";
>   };
>   
> +&i2c0 {
> +	pinctrl-0 = <&i2c0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	rtc@68 {
> +		compatible = "dallas,ds1307";
> +		reg = <0x68>;
> +	};
> +};
> +
>   &i2c1 {
>   	pinctrl-0 = <&i2c1_cfg>;
>   	pinctrl-names = "default";
> @@ -189,6 +200,16 @@ sdhci-emmc-rst-pwr-pins {
>   		};
>   	};
>   
> +	i2c0_cfg: i2c0-cfg {
> +		i2c0-pins {
> +			pinmux = <PINMUX(PIN_IIC0_SDA, 0)>,
> +				 <PINMUX(PIN_IIC0_SCL, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <26800>;
> +			input-schmitt-enable;
> +		};
> +	};
> +
>   	i2c1_cfg: i2c1-cfg {
>   		i2c1-pins {
>   			pinmux = <PINMUX(PIN_IIC1_SDA, 0)>,
>
