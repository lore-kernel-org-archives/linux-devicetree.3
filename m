Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830DC38D68F;
	Thu, 14 May 2026 23:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778802194; cv=none; b=GYWXSC8IE0UK4G3dhUUBiOdAN6ei5aSnYXPaOnylNKsSK+cR8lA114CPgrv5n6+FnHbtB3ftd+tfyVJNjwU38k5GwosreCY+Whk5sTgsOAbtkFlPQr76DhTT3pppvfDV/6hF/Jcf7nUokAJntsx7u7DE/h0ZHCMtP8064Lh01Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778802194; c=relaxed/simple;
	bh=o4PUtfFnIDlnRmFtetUSScwXph92XJHFuhTDdAg4cwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbD79gkWdclAnbpUvhGkLTW3JFgmqKKnuetJie9bhuuKeBTgLcbdacKmp8xKZjbqd02n3lP7+3uwcKGeAQBF28+rBzlr8m/wP072rBoHbga5MlZu6ny25v9vkTwcIMiyM9yq3qOE2FZ9tB5+BKODuu10gBzyBN9JNmMiZXY9H00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5leMYW/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5leMYW/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F5FCC2BCB3;
	Thu, 14 May 2026 23:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778802194;
	bh=o4PUtfFnIDlnRmFtetUSScwXph92XJHFuhTDdAg4cwo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X5leMYW/E4xoIHpBnlxj0Lm7QZWMCzwwD6r6VGQHQrzkvFYwy0OTC8GVZRw7tDgCW
	 MJ3uCbDVMZ/Jm+NVE9ZT0RWKhMwhS2fjwu1csLf7DI1UowAyAZPfARKC2o2VX/t+53
	 Lrf3C9xG50AXoXcssVvHe1Nj50xtAoj9WhkURzJFFYCVuW45i73a25vi3sJA9YvdTj
	 dlYkYj9zK5/Zy01Ht3yt6jGvUf9/SdVET2Q/vJogO6CigkfhZ78VhNjHADOEHK5OMQ
	 aqQK5JuD+fjyFQ9k7CUkr8AKDUEC+PH1J6TqLyFLGmidro8CIQTdnY1QbmiDzGsLmq
	 DJ+okJoqKmmNw==
Message-ID: <51c01dfc-d6b2-4605-81bd-496211947c1f@kernel.org>
Date: Thu, 14 May 2026 18:43:12 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: socfpga: Add dma-coherent to XGMAC nodes
Content-Language: en-US
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514114111.10574-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260514114111.10574-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260514114111.10574-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/14/26 06:41, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> The SMMU is enabled and transactions going through it are cache
> coherent. Add the dma-coherent property to the XGMAC nodes to prevent
> redundant cache flush/invalidate operations and potential stale data
> issues.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
>   arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts         | 1 +
>   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts         | 1 +
>   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts    | 1 +
>   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts | 1 +
>   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts    | 1 +
>   5 files changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
> index 25e17df0cbdb..2061d301126e 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
> @@ -52,6 +52,7 @@ &gmac2 {
>   	phy-mode = "rgmii-id";
>   	phy-handle = <&emac2_phy0>;
>   	max-frame-size = <9000>;
> +	dma-coherent;
>   
This property should be in placed in the Agilex5 dtsi file.

Thanks,
Dinh
