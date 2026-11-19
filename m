Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087167;
	b=GgvT6qTAaNdJeWHRhjsBp++PydJHYL/+XgD+2HdBKo++jScIkuunuNG86cpCSvNEWRFO
	 X/BcmjpnPbB7s4oEpA3+JWw7yuSjlaeYr24UxjsYGoN7wNduiKePh60jP9sIwaTPVpO9B
	 k4g9iG4PfqHJqVNG2s0EoLD5sHDn2KbMunzhwXb/R5ajKWmMGa2yEy7zWSvxzDD66G0hB
	 hXV3hDtERgcKL+FEtY+BaOZYmQpmfvNFhxYAz26yRxNnz3SeLvZ6eWscTnlRz/dpApfy+
	 tUXg9StQnmthlw1p2JKxiZ2ZHmMt4PP5RK0BSpuCAejx+ioJSH4LsRVL15NtaYh7Vww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087167;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=0KsnA1sc2ZPNx4wFgHWHhB+NH0HS9lIKRKe68U1iMk4=;
	b=JTLFwbQW5SSnNSwODSVA3Xpf7S3/M1AvnT+31jkfbJ9DW3lo6vCEVA/AfAKkD/rWSkFD
	 F000lt+IkU5B2ma1pqnOh8A+v/1u0BWWKmb7wvwjSbkxxNQJ1v7NR8GrrnWshbbTGldg9
	 pFIgtn5agHsHdabt0tzeFMBf/ogB3epEFVfA9HtBhpCgcepkmKCr/pLHpWj4OoN8y+1IQ
	 UbHHtk3sNKsdmc4auSwUHp7vD0n6hr2kaZLgD32Eeq3kvwraLJTKmkLLYjruMRro0aa2u
	 BfTXideIbOP7FwlD3nKIlu5oOth33FOtRM/O7OAHbNABXsyd8kvChEFfZm57qVS7V3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O0D+63dh;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCBF606A324;
	Thu, 19 Nov 2026 11:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CCBF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O0D+63dh
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A42B1575;
	Thu, 19 Nov 2026 03:19:22 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84B133F882;
	Thu, 19 Nov 2026 03:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795087165; bh=wni50JqD/rgfdfFKe6pPfOFoW/LymRi2FWik5KqVhC0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O0D+63dhCQU6szFikY+uimE6GKtFQmiJYlRYi+L1o5lauP7FUnaLfkZJw6m6AJoAk
	 MIOkKY3VaBwMmJO2HpVgxBB+Hs4sYtlmLQ3C7rxYx5mEuWldQ7r57yTy9j8Obb+ByJ
	 n4/eImI2DTDYhlfYrB0FrLcibzGivAP0/k1eOiAM=
Message-ID: <e5c405ce-0847-41c5-a936-0d8809f90ae0@arm.com>
Date: Thu, 19 Nov 2026 12:19:21 +0100
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
Subject: Re: [PATCH v2 1/2] arm64: dts: allwinner: orangepi-zero2: Reference
 the SPI NOR by label
To: aiyengar1990@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261119-zero2-spi-nor-dual-read-v2-0-185c87065e39@gmail.com>
 <20261119-zero2-spi-nor-dual-read-v2-1-185c87065e39@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261119-zero2-spi-nor-dual-read-v2-1-185c87065e39@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arun,

thanks for the changes and the respin!

On 11/19/26 06:29, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> Andre Przywara suggested labelling the flash node, so the Zero2 sets its
> supply through the label instead of nesting flash@0 in &spi0.
> 
> Suggested-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>   arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi |  2 +-
>   arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 10 ++++------
>   2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> index 0d3e761f6466..646d92e0f724 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> @@ -104,7 +104,7 @@ &spi0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&spi0_pins>, <&spi0_cs0_pin>;
>   
> -	flash@0 {
> +	flash: flash@0 {

I feel like "spi_flash" would be a better, more specific label to use, 
"flash" is a bit generic.

>   		#address-cells = <1>;
>   		#size-cells = <1>;
>   		compatible = "jedec,spi-nor";
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> index 90c25e12e189..59bbb09bcdbf 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> @@ -24,6 +24,10 @@ &emac0 {
>   	phy-supply = <&reg_dcdce>;
>   };
>   
> +&flash {
> +	vcc-supply = <&reg_aldo1>;
> +};
> +

Could you do me a favour and add the OrangePi Zero3 regulator as well, 
to sun50i-h618-orangepi-zero3.dts? It's also reg_aldo1, although that's 
a different PMIC, so actually a different regulator, and so should stay 
in the board specific .dts (even though the lines look the same).
That saves me from sending a follow-up patch with a dependency.

Otherwise the patch looks alright!

Thanks,
Andre.

>   &gpu {
>   	mali-supply = <&reg_dcdcc>;
>   };
> @@ -147,9 +151,3 @@ &pio {
>   	vcc-ph-supply = <&reg_aldo1>;
>   	vcc-pi-supply = <&reg_aldo1>;
>   };
> -
> -&spi0 {
> -	flash@0 {
> -		vcc-supply = <&reg_aldo1>;
> -	};
> -};
> 

