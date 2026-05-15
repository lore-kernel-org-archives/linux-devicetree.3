Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EA448125E;
	Fri, 15 May 2026 11:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845900; cv=none; b=dZNAAECW60cLat9RnhdnslCq587SN3MNWue40pJjMJCr9E0/65JzvHb4HeqJwqMKdKj7FRtotVPRb0cR98e1Yg4CxcpPbfcmH3HYZujCMvdRNunIihfHOVvFCsiniyM2n2klkfpK4D045hRwYMwK/5Z2PnBxAb6i30jTMSBPVfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845900; c=relaxed/simple;
	bh=6Ornjrf23rEOB/6D0To4EjrJ0niDBjzEVAsAG0kjV58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rl5HPUv4mgG1MNRE9S7fkZ0rsloF4U0x9N2xgJ3tn2uVw4nMk5QvHfGIj7f4VqNWn1wGT0YuhiascQPmkKhQneJd9OGp2BXEmkYi9ZDKhtGyA4WysCcJCf1pnOalxw0zKAui9hqC1eB+AhaJ/l4XzuJ+UtyrVv/SUkjC662m/o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=af1k/zYO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="af1k/zYO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC57C2BCB0;
	Fri, 15 May 2026 11:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778845900;
	bh=6Ornjrf23rEOB/6D0To4EjrJ0niDBjzEVAsAG0kjV58=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=af1k/zYOZDtkAol+aBF9ODBYat+H/3yuVJMrbkkNks5OW3CCFgOkowvycBrJY92Or
	 Jrv1J1f4wO5Z/H9Oft0Y/FTpSSL5JQCLuJMbhiPM5vAEIv3o5Po+dirydLusa3WYUF
	 Yxtu3BSViZ5e4j5vgR+1YHMxaxIykej4KqEFhDVdgwp15HnyXwheeh1zXPhTvgaucm
	 wa1jgVymSUQtJHwlbpwln5/6/mjbS9MT3as27MeQRAdSL4S4UEUXAKzxdcZ9F0UgNs
	 2VNr3TgKgNqWlrZUgeiKFLz1kkWNnKIDEYmreMgv7G3KsvmslMxRPh5QxM5j1D16Dc
	 k7QmlSlJthEDA==
Message-ID: <b44bb312-4308-4130-ab26-dd47a73a144f@kernel.org>
Date: Fri, 15 May 2026 06:51:38 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: socfpga: Enable the SMMU for SoCFPGA
 device trees
Content-Language: en-US
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515080014.6260-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260515080014.6260-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260515080014.6260-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/15/26 03:00, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Enable the SMMU on the SoCFPGA board device trees where it was
> missing. The SoC uses a different memory-mapped base address for
> its peripherals, which requires the System Memory Management Unit
> (SMMU) to be active so that the Secure Device Manager (SDM) can
> correctly access those regions through address translation.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
> Changes in v2:
> - Move SMMU enable into the base DTSI file instead of individual DTS files
> 
>   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> index b06c6d5d60ee..64f3739a0c33 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -385,7 +385,7 @@ smmu: iommu@16000000 {
>   			interrupt-names = "eventq", "gerror", "priq";
>   			dma-coherent;
>   			#iommu-cells = <1>;
> -			status = "disabled";
> +			status = "okay";
>   		};
>   
>   		spi0: spi@10da4000 {

Please make it a practice to see what formatting previous commits look 
like on the subsystem you're making changes to. For example, this commit 
header should be something like this:


arm64: dts: socfpga: agilex5: Enable the SMMU

Then in your commit message should not restate your commit header. So 
remove "Enable the SMMU on the SoCFPGA board device trees"

Thanks,
Dinh
