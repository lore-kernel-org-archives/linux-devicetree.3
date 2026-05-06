Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581063EC2D1;
	Wed,  6 May 2026 11:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067439; cv=none; b=R+in5E2y34o6Qzu/eBFUd7UNnQ2QlWpPapVq/xDLi1WIvHHSFky6gOXnlPTLCBsVPkOJto0Ro+4PJJO4NwdALRtjXErl8kY3G7kvyL3ATrmxMlJCBWthPQvv2Y/xRKJKLXBM2UiZ6oID2jMX2pvY5l7mfkr7TAuqcXLH7horurE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067439; c=relaxed/simple;
	bh=rJ3u55sy4BSGIAqQVA3Gb67uHLCJm4cGXCoZ+LsFPcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AnyN1OVnP0PIYISuMyCwVqF7gWs6QUZ5uLRd+MvIi1EmSTQK04MIdwwwFrPEKjq672RU9yC18ly/5UtDd0kPDI5I/PP6YC0Tr974r8ID0Yg1/a3cjr4NnDDTr3JwWTvdYBsaY1ssRWTKLvTlQKS2Vz1siiYXHVQ5xDwqjkomeq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RqYZjVsV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RqYZjVsV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76909C2BCC4;
	Wed,  6 May 2026 11:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778067439;
	bh=rJ3u55sy4BSGIAqQVA3Gb67uHLCJm4cGXCoZ+LsFPcY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=RqYZjVsVWlIvT4ZHP7VZPeiXPt6vDwLKPqJs6lXdincnFwJAc9b5nR3Dq08A7Pwsx
	 y0XvPjsR8t9B6G91WmqXXsHppbPj6GITjq3xSdT9DH9+uV3tPWqUM60yAt2Hiy8XMV
	 zDMDARDFcjRYhvr9nxpybbHCi2gbW/6DwiG5mxtUYM6+dfCRqssvGBn7SLmfHNqLwp
	 MLHduaSvu+TTxIzkcwKyFUr/8mdIG/bTEbY8EFYNgEbjp2dpP0OTciR1kcc6Oi9AL1
	 cBiXJq07T+U748uTPt4al+P1NqVakM66DRN8W68/0WcbK/j6yv32Q/q5n2pRlgD4Y8
	 j5aYbhsTkBjZg==
Message-ID: <88a55cdc-0ed0-4d24-ac32-521dcfd4a96f@kernel.org>
Date: Wed, 6 May 2026 06:37:17 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: socfpga: agilex5: update data-width for dmac
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <593cb7874d90b6d1e7e68c2c0795e55d051dd90a.1778047935.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <593cb7874d90b6d1e7e68c2c0795e55d051dd90a.1778047935.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/6/26 01:21, Adrian Ng Ho Yin wrote:
> Update data-width property for dmac to 3 which is 64 bits to match value
> configured in the hardware register.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
>   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> index 02e62d954e94..b06c6d5d60ee 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -343,7 +343,7 @@ dmac0: dma-controller@0 {
>   				#dma-cells = <1>;
>   				dma-channels = <4>;
>   				snps,dma-masters = <1>;
> -				snps,data-width = <2>;
> +				snps,data-width = <3>;
>   				snps,block-size = <32767 32767 32767 32767>;
>   				snps,priority = <0 1 2 3>;
>   				snps,axi-max-burst-len = <8>;
> @@ -362,7 +362,7 @@ dmac1: dma-controller@10000 {
>   				#dma-cells = <1>;
>   				dma-channels = <4>;
>   				snps,dma-masters = <1>;
> -				snps,data-width = <2>;
> +				snps,data-width = <3>;
>   				snps,block-size = <32767 32767 32767 32767>;
>   				snps,priority = <0 1 2 3>;
>   				snps,axi-max-burst-len = <8>;

Applied!

Thanks,
Dinh

