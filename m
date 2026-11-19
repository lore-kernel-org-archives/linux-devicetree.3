Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087300;
	b=BiVZVCPVll8Yqse5Qg8t0ap/559wthks8s047TleEx5D/+fqJFzAvtoi4kn7MkWY8Sin
	 nogFHPC3gMh4rHYKaZhJr696w9cj+XNGyh/Cj2icOVMW/RDpqNK66jhlnxbKb6sxaufFz
	 Z1mmEY1DLuIvRfJNht7gOeYZ4R7g6Nud8BYWJs5rTmW90nHFkbRrHIffJOIw7165DXSaU
	 Xe6Z4epLIv87ZTp84+IGhL/7FlLSmQekL4bzouxbUHfOxzU+8H1Sn0G41sX5PadeoYC2s
	 RnjfqNxJhVds46WyhtQzl4o2lm0D09tgJDjFP7o1W6aB9sWQKyDR0e/xi1O45+CyKpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087300;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=7v5ZNN63HvHrdbqH3CUQi62kfadGnTXvbl26t53r41k=;
	b=3XuDQ2guqIxTx4VbGHTCV1MF5o6WoFqiulhYcvUWEfEbqNvvOALFib3z1ZYgiD5IhH3g
	 fPVWGhJy0AdH4O+V/qfCX5dCFN073ieyPB3PEqxwlQyHO1+e+6G4G9RugS3uvfNMHPaX3
	 2H+3XG3/p5a/M8Ak2xCBnzsTldxCJjwj3dsogCVFTZiHbcFk6iDOdCk+FkVqZm/aXgwBB
	 +j37sm5vCoCVLn+FU4sBPMVcpiQiEvPrsjeaQ0Ddv0cvhilSOCBdgbMHjp1scnoo1ysbI
	 7IaXHKQUJOXZANYF6ODcu5J66ZoEXS5BoqC/dvae82l6JEzsOqUTb1bo6YLQibVOemg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NXX6a2Fs;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD7D606A325;
	Thu, 19 Nov 2026 11:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AD7D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NXX6a2Fs
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE4301575;
	Thu, 19 Nov 2026 03:21:36 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C53453F882;
	Thu, 19 Nov 2026 03:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795087299; bh=ryVGJvRFBKaDiggrplKfiWJ6FP8BRQLqWd2Wvok1GeQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NXX6a2FszbHwrTzPyuCBWkGsKVFFN9/j1nx5TKJv3bUAJe2mev+0wuSIgDWMjA7JJ
	 +3u+G6+Xf2wXZjvHMHM2+zy6zAQwdlaRTT7JT1ixLxKuTTK8apBoMmDBObTxJGi03M
	 Mof15FU0FgTcf5o2MBncHLIGuFsLgRtajtqOXx1U=
Message-ID: <6064cf83-7cf8-4ac2-b8c6-9745e05d8e3e@arm.com>
Date: Thu, 19 Nov 2026 12:21:25 +0100
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
Subject: Re: [PATCH v2 2/2] arm64: dts: allwinner: orangepi-zero2/zero3: Read
 the SPI NOR over two lines
To: aiyengar1990@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261119-zero2-spi-nor-dual-read-v2-0-185c87065e39@gmail.com>
 <20261119-zero2-spi-nor-dual-read-v2-2-185c87065e39@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261119-zero2-spi-nor-dual-read-v2-2-185c87065e39@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/19/26 06:29, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> WP# and HOLD# are tied to VCC on the Zero2 (schematic v1.3), so read over
> two lines. Andre Przywara pointed out that the Zero3 is the same.
> 
> Suggested-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

You can drop the Suggested-by:, as the whole thing was your idea, and I 
just suggested the move.

Feel free to add:
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>   arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> index 646d92e0f724..4a588c44d029 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> @@ -110,6 +110,7 @@ flash: flash@0 {
>   		compatible = "jedec,spi-nor";
>   		reg = <0>;
>   		spi-max-frequency = <40000000>;
> +		spi-rx-bus-width = <2>;
>   	};
>   };
>   
> 

