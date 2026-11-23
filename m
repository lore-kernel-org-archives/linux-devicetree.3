Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423268;
	b=XsMJmhLUZ+SpjhKydbVp6M/B2TlEDA+JJEK0EsCNbvyomIa5Lk37SS27lzM/HEMS61mg
	 JxUZOwJLlreEdW5QhWcLuu+LPo3YcuXXIMhOG89AQkIBA0SAK2O9doX80IDFhB13Up3FK
	 Pymbe+Ezaut9q+9zUBF00qqXfw9f511dz9yhGhZ/QGQstNIF1QPFqPLMEaIbHSuqJogin
	 CemtTiVSu4sOMfQ8EpcbIvlPTQNZ7QNB6wDho/p08HFGztz0wKuMmsgnx79lJvWGixHrg
	 vRNGbej/DKI3H6BSNlEjV5VOgFIjTiuA/kS49fEEf8C9mw0vlMeANK3qkntWzeGfiGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423268;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=weS4nh8yzJ9DgJBIRpH2X6+13bRBxiBauBejFD0MyZ0=;
	b=s2gGHv1LQGkuWAWvb/IwIhYxeX+xkXaformfIAwkeGSk5Wt0yC6Ir2iRry8EEPhXRT+a
	 oPaQLXUXmRX9f9hDYXs19D01kaUrBcu/gJAszMdzhkSKP6bLfmMfy7/Xndsbu7e7ErhiR
	 jHf82+QV0uwrk7ivuUr/Oh+2JH0hJJ7CnaoWq0+hNP5UtDx3B9ZDKpapp89tLUCxlaYVn
	 Vu9yMXY1dNYn9tvKRPrQJzAVLyiZt7w09M53mIbLqg8W/iVraauJKdAWRnA47JIb3uu/b
	 FT+snDWiHZ4DqP8q07xDay52zjj1zo0Z4YF/KhpxvRcqlpzmyyhX+T9XxU5Tjq7jpWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bk0ytuA5;
	arc=none smtp.remote-ip=91.218.175.65
Received: from mta0.migadu.com (out-65.mta0.migadu.com [91.218.175.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA0B606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EA0B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bk0ytuA5
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=l2DP2WRCJyIifr/DPGizDAIwXyQaHH94kdBlyIJQkXM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795423265; v=1; x=1796028065;
 b=bk0ytuA5taDoTGgVafhhlm+v9MxLzRYr/Bloib4ufR6eML6dAvXr63wvEXk/tuf2ctjwJPuy
 HX2P6VLK2TeDCq8Rq6h2ECB6MQNrcsOBxT5RKiFmCoEM1KYRcS1Y6Ne/a323HlfDaCmDO2wFhAm
 8pWhr2atTDrYTbBvfDkZrVSc=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 49510743510806cb;
	Mon, 23 Nov 2026 08:41:05 +0000
X-Mizu-Trace-ID: 49510743510806cb
X-Migadu-Flow: FLOW_OUT
Message-ID: <ec584c15-c49a-499d-bd79-a9f48f54dad5@linux.dev>
Date: Mon, 23 Nov 2026 16:40:56 +0800
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
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Enable the RTC on SG2042 EVB v1
To: gaohan@iscas.ac.cn, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261122-sg2042-evb-rtc-v1-0-f222c64cc7b9@iscas.ac.cn>
 <20261122-sg2042-evb-rtc-v1-1-f222c64cc7b9@iscas.ac.cn>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20261122-sg2042-evb-rtc-v1-1-f222c64cc7b9@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/22/2026 9:33 PM, Han Gao via B4 Relay wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
>
> The SG2042 EVB v1 has a PT7C4307 RTC at 0x68 on I2C0. Enable I2C0
> and add the RTC node.
>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Reviewed-by: Chen Wang <chen.wang@linux.dev>

Thanks.

> ---
>   arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
> index 9f403e564694eae14913f6ab23080a6333df15ae..6ddb16eabc48a51f457449d245d63a3840b2fdef 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
> @@ -136,6 +136,17 @@ &emmc {
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
> @@ -201,6 +212,16 @@ sdhci-emmc-rst-pwr-pins {
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
