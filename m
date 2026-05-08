Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5453DBD76;
	Fri,  8 May 2026 12:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778244224; cv=none; b=RHqx5zzxUJyVydO22ZtEOEnlbP/kSNleX+Fyln1Dq9wWmuzUhL7wGNNQ++CWsYjS7MY7Tp9hNkbrONjdRxtSN88VMz3UtFrpJeI740UdC56O63CU8NmT4GINHUjzIcK07wPbLtwJIINmOvhNXJmP5NOWCJ5qMfmpIfxgpFY1eO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778244224; c=relaxed/simple;
	bh=8pN5Rwn8lPjGRrLEnHE3XH2IxyHHBHEOd6YL+wOoTCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=R1Ljgrmf5A2ipWkix1PKMQuM3sNVHLC7j+nVblBJ4gg1EtpEe/OyXj6EbUeeFGM4TObGYWtUDQSBAeylJUeEpvx5sdJGSwxf5wyuLEVm9m3BwcsY9i44xdLJeMXNg6uoZ0QdTO70kJr4iodZg90xsWA0wZsIG29pHifnSlhZw0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbqNcexT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbqNcexT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E77C2BCF4;
	Fri,  8 May 2026 12:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778244223;
	bh=8pN5Rwn8lPjGRrLEnHE3XH2IxyHHBHEOd6YL+wOoTCE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=bbqNcexT0rSjH729ZCwQUSMi7EV66uZp9WD1vddX36GmEOyKBTVdLK57TFBP6v2ig
	 C4HCrbBIVGwWuP9rDjRubFQqpFdpbC1Uxz/QkehOpX4xrn2c4sfp3OfyxFaNygic08
	 MjrBZRpBL+50n3QbN2OnGGl1PnrF++Pc/Z8FcQkSyqnNEkrxtyucQTQRToqVCEb0ID
	 Ee0DJ6v4wekks+4AO5PbqP6rhqv5vSgfDpqdU7+M8E2gpgKJN4LAhHQoAVSJAQ9Lmf
	 ox9+iw1fKnoKHwnlj1JLDtjVTJ5y0fWLWDm/70aCp7v2lZ/D0SvaGjZ3uD/YPoICnq
	 06f/KlsCosR9w==
Message-ID: <9e777728-84ee-48ac-985d-7f2fd354b5c1@kernel.org>
Date: Fri, 8 May 2026 07:43:41 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: socfpga: agilex: remove unimplemented clock
 in smmu node
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260507061210.933512-1-adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260507061210.933512-1-adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/7/26 01:12, Adrian Ng Ho Yin wrote:
> Remove unimplemented AGILEX_L3_MAIN_FREE_CLK in smmu node to prevent probe
> failure when smmu is enabled.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
>   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
> index 0dfbafde8822..6bfee8263b3d 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
> @@ -445,7 +445,6 @@ smmu: iommu@fa000000 {
>   				<GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
>   			stream-match-mask = <0x7ff0>;
>   			clocks = <&clkmgr AGILEX_MPU_CCU_CLK>,
> -				 <&clkmgr AGILEX_L3_MAIN_FREE_CLK>,
>   				 <&clkmgr AGILEX_L4_MAIN_CLK>;
>   			status = "disabled";
>   		};

Hmm. not sure about this. When I added this, the documenation had the 
clock and it's defined in include/dt-bindings/clock/agilex-clock.h. But 
you're right, it's unimplemented in the clock driver, should the fix be 
to implement it in the clock driver?

Dinh
