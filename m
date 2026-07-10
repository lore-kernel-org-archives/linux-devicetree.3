Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5643B0AD7
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 23:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783725513; cv=none; b=Mt6s+BPvPHnfaZBqjLy8tzoy4uXTZLP94qdmC7FgQi4sfspxPgAM0OwOGmRcWDtE79X55ywkghn/grHZS2VY1swsDqW1CPzEqe/bfcGdfFAHFmNddnMo9YLsJPKaqkTbHSYycmGHjoaZ7yrFkwJoHjxtglJ/JttLXt7YsSwncL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783725513; c=relaxed/simple;
	bh=FlB9JZQQPGUHJvsnoDybwnXHyrKvMXEE9jqOsLo0K60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nzvvq3xvN80CyAqmJ/kE6w0OeC65N9rRG2gW+MlZ3tE58OhleSTQNfV/DqxW4UegLynKMnkrk6LLVxC1DOwwPZew7PfCEsZKOJmvjs/wG5apme6TwDhN2/wa2aisocMcPxAOB7cuEeghqZETRM5b3BclMvffJD2KsO8JoUC9ICQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kwiboo.xyz; spf=pass smtp.mailfrom=fe-bounces.kwiboo.xyz; dkim=pass (1024-bit key) header.d=kwiboo.xyz header.i=@kwiboo.xyz header.b=bUw8y0Ix; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kwiboo.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kwiboo.xyz header.i=@kwiboo.xyz header.b="bUw8y0Ix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.xyz;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-58e3cb06d0; t=1783725511;
 bh=eOaCq+Mdrdtda9WrxPQLv48aiGY1TRUdPRNtds93n88=;
 b=bUw8y0Ix3j5o7P+YVgDrMEzH7rv7BxhwCQcjtF97FQF0k/49YgFssNlx+qrfUJVsLABrZW3JD
 n/j6dU2PtQVkHDqlHw5dhsj5el9qhqVRSKoaKQe7BcR0frnThm+4jp0LY6Iwyv5hxlP9TP/7tsf
 NEFJhW4JZWjPUOLKEBqeCe8=
X-Forward-Email-ID: 6a517dc6780742a88792fcb5
X-Forward-Email-Sender: rfc822; jonas@kwiboo.xyz, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.10.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <84467f61-9902-4dea-abda-6e8cb31e0238@kwiboo.xyz>
Date: Sat, 11 Jul 2026 01:18:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] arm64: dts: rockchip: rk3588s-nanopi: add
 missing sdmmc cd pinctrl
To: joachim.eastwood@gmail.com, Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 diederik@cknow-tech.com
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
 <20260711-nanopi-m6-v2-4-422675a65402@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.xyz>
In-Reply-To: <20260711-nanopi-m6-v2-4-422675a65402@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Joachim,

On 7/11/2026 12:11 AM, Joachim Eastwood via B4 Relay wrote:
> From: Joachim Eastwood <joachim.eastwood@gmail.com>
> 
> The cd (card detect) pin is used, but not reserved through pinctrl.

Maybe this and some/most of the other DT changes that fixes some missing
bits should put first in this series and with Fixes tags?

Regards,
Jonas

> 
> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> index d41c49716fa2..a8f32b994b10 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> @@ -336,6 +336,10 @@ rtc_int: rtc-int {
>  	};
>  
>  	sdmmc {
> +		sdmmc_det_pin: sdmmc-det-pin {
> +			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
>  		sd_s0_pwr: sd-s0-pwr {
>  			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
>  		};
> @@ -407,6 +411,8 @@ &sdmmc {
>  	no-mmc;
>  	no-sdio;
>  	sd-uhs-sdr104;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdmmc_bus4 &sdmmc_clk &sdmmc_cmd &sdmmc_det_pin>;
>  	vmmc-supply = <&vcc_3v3_sd_s0>;
>  	vqmmc-supply = <&vccio_sd_s0>;
>  	status = "okay";
> 

