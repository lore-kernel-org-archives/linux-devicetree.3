Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDCB3E0759;
	Fri, 15 May 2026 07:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828579; cv=none; b=kRxu1eAR9WH5TqUnhXpDLeG6NzVKcOufMrWLn/ZAwNMcM30kew11iZ60XhCUP6WwuKCvYEgSBGmD8es3VZqWld3L4Pi04rm65/BVBG7aVFeHUMA364tRdaV5txfH0Zz4blhLC1deC6t1DJY/c/a+TKO/WmDGkLAxC8SIxTlBIfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828579; c=relaxed/simple;
	bh=yM52irgJ9u/mGvyCSJPEBCg0DmFJclslJOPPfSLhI/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sGyRS/0Sk7X8ycKg8naUPq/20I6JX23P8BVji9yRAYg6RrpqnQ2OXcVD4PdwLCM3FPZIz8C2LxfDvb99t1yWzfTrlkXECfU4bmkkJ/txK+jyQt/o3uFqY2GtspmA1wzD3mhC/aKkQLsRAmIsf/BtWDO3c2PQYtruJ8JN+fP3N84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=HdZf2y+M; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="HdZf2y+M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1778828524;
	bh=qCTfWv8m4cc4h0EHyDjm6M3IOtAl6o28GT7LNvnI1Zs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HdZf2y+MPudCZ9scJCptwAzjRP1aFklSKAVj8rhCRZcVOE6VdK2u25KLcnEirUHQd
	 HO3lj7np6/Dgn9Tz6hhktTRVrSsR8UNcWxiO7ChlderQrikAtZfzWFYhe/38pgsUoZ
	 2tSFsN6E0fv5bBYHAd1YK/JXZFQe1IxIfI2ojBzjA7PTesjw6PTPFBAbiBJq9sG6d+
	 Uxx1ypuyocBX4yIlnM2Be5YVCQM/LFD41EspuWdu7yOQXegfGmRzh0wuZCArDxtRKV
	 M3LuJaWjBRMHYJEjMOuJZnIYx8ExctZJC5hMq3CvInLw56YvRjSWeowLNiRE9KE1Gn
	 pGS7Q0lsbEa1w==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 9131EB2201FF;
	Fri, 15 May 2026 09:02:01 +0200 (CEST)
Message-ID: <f52a821b-157a-467d-84ee-4d1d4a96f673@freeshell.de>
Date: Thu, 14 May 2026 23:49:00 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] riscv: dts: spacemit: enable eMMC on Milk-V Jupiter
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260514160356.1642075-1-aurelien@aurel32.net>
 <20260514160356.1642075-4-aurelien@aurel32.net>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260514160356.1642075-4-aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/14/26 08:56, Aurelien Jarno wrote:
> The Milk-V Jupiter board has a connector for an eMMC module. Add an
> entry for it in the device tree and alias it mmc0. As it is not
> populated by default, do no mark it as non-removable.
> 

The meaning of "non-removable" here is whether it is expected to be
added and removed during use, requiring to be probed again; not whether
it is a user configurable module or soldered down part.

> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> index 450d28e438293..b9b8ddc8e7fb0 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> @@ -17,6 +17,7 @@ aliases {
>  		ethernet1 = &eth1;
>  		i2c2 = &i2c2;
>  		i2c8 = &i2c8;
> +		mmc0 = &emmc;
>  		serial0 = &uart0;
>  	};
>  
> @@ -138,6 +139,15 @@ &cpu_7 {
>  	cpu-supply = <&buck1_3v45>;
>  };
>  
> +&emmc {
> +	bus-width = <8>;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	no-sd;
> +	no-sdio;
> +	status = "okay";
> +};
> +
>  &eth0 {
>  	phy-handle = <&rgmii0>;
>  	phy-mode = "rgmii-id";

With that, LGTM

(no R-by tag, I would want to test this I do not have the hardware though)

-E
