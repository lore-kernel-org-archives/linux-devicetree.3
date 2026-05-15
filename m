Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D84448A2D7;
	Fri, 15 May 2026 11:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845970; cv=none; b=Dw2ay8O6Z5LXYxeCdBTReDutvFkzGas/6O3/HUPJLBztXwJg7TiDtg76r7Y2m9NIsRASgto04cM+Y4hhXWV93SttK5fB5UZgIu5Mpq/xS67f3yChwn9rjAGHFmqVkcHw3XkY6wmHVecRJCo+1VfYYWfND8tF13YUHLYe6we2W2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845970; c=relaxed/simple;
	bh=amk1/vYopuUOXRTYPsRAb5BGcgb3VSuxbeiGB8LywuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nWNQ2nHDav5uM79wD8+tAv7aZMWFdq54UpWQNLZR8gKrlleiypPdx/3mdtYHU7qxVH5fv/BUr9umvJtu1LS2PwYafx8y3KlNOZKej3zrTLAx/2xZz8ok+yvCp5ODAwNXKgsVpEdQ1zRfBtgXC1vMr+xVlISYdJZbQNFxLmCuS3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWcRHP5L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWcRHP5L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45896C2BCB0;
	Fri, 15 May 2026 11:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778845969;
	bh=amk1/vYopuUOXRTYPsRAb5BGcgb3VSuxbeiGB8LywuY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SWcRHP5LeBi4t8IRsiHQkB8TrP5CPsuj+nIqeniiFUpIZwR/5lEdx4/dH1sTJwfR+
	 17TfhL024DPz4BUv0zFy39fOE9RFvRAO2J7qRhcdpGEo8pasU8zsuqRhNRy0/kYwAJ
	 norUKcdd8qTiA1USwdla8xW5faoOLAD+KfPHR9Y3ri9VsQBSNmOYJMHXpqexY9nJS9
	 /au7ijjKpwIMn8XjCOAQwnAODFhcHe4TsLSo3yiAbeDDAyp9iUFpLCS2rvoY51F55X
	 lUbsRQqAh1v2PexcfqhtjGbOxiqZJ/m74rdO/Iq9LTlgdwEQ7k7QgjUxFxgLoTLhUZ
	 MUHoCL8ZQUwCw==
Message-ID: <a83537ee-0a05-4d2b-9dff-6c928e5cfeb6@kernel.org>
Date: Fri, 15 May 2026 06:52:48 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: socfpga: Add dma-coherent to XGMAC
 nodes
Content-Language: en-US
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515080014.6260-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260515080014.6260-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260515080014.6260-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/15/26 03:00, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> The SMMU is enabled and transactions going through it are cache
> coherent. Add the dma-coherent property to the XGMAC nodes to prevent
> redundant cache flush/invalidate operations and potential stale data
> issues.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
> Changes in v2:
> - Move dma-coherent property into the base DTSI file instead of individual DTS files
> 
>   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> index 64f3739a0c33..bef386cb2fcc 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -577,6 +577,7 @@ gmac0: ethernet@10810000 {
>   			altr,sysmgr-syscon = <&sysmgr 0x44 0>;
>   			snps,clk-csr = <0>;
>   			iommus = <&smmu 1>;
> +			dma-coherent;
>   			status = "disabled";
>   
>   			stmmac_axi_emac0_setup: stmmac-axi-config {
> @@ -690,6 +691,7 @@ gmac1: ethernet@10820000 {
>   			altr,sysmgr-syscon = <&sysmgr 0x48 0>;
>   			snps,clk-csr = <0>;
>   			iommus = <&smmu 2>;
> +			dma-coherent;
>   			status = "disabled";
>   
>   			stmmac_axi_emac1_setup: stmmac-axi-config {
> @@ -803,6 +805,7 @@ gmac2: ethernet@10830000 {
>   			altr,sysmgr-syscon = <&sysmgr 0x4c 0>;
>   			snps,clk-csr = <0>;
>   			iommus = <&smmu 3>;
> +			dma-coherent;
>   			status = "disabled";
>   
>   			stmmac_axi_emac2_setup: stmmac-axi-config {

Same comment from patch [1/2].

Also, can you add the dma-coherent to the other IPs using the SMMU as well?

Thanks,
Dinh

