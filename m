Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B643BBA0B
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 23:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783725866; cv=none; b=Yjjd28sFjWI1vW9YzLWygH3VLP6B9ijMGkyDF7r0vwEfP8S7z7l+m8MUsJNNoIA2NTPWeInRIu+hmk9vUTY32QCkiC4k2WMyAesxf+gQYLxlDaFwizkT+sscQLB5/tkTvTQxDsi6/nb40fCw868RztkBNCNqdo47Fo61Bfp0cXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783725866; c=relaxed/simple;
	bh=MusBBTW78pbqWhH/unnOhuI2VygivvrUki9XivA9SzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJQGttNWbvHX0tLV4NgZFAc8PKl0VJNGFFU/FYSRZ0YoTrO7O73CAHpkH/JjhVEcdJocuhoFhHWOVrpY737RJdPkgyJ5KrsKUpHFn+fN0Gq20y85ATPvN1zoasQNpHKBRGzr+PMDfanZ5k06abmpRKyzgIz7sVGWzJU05YsazYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kwiboo.xyz; spf=pass smtp.mailfrom=fe-bounces.kwiboo.xyz; dkim=pass (1024-bit key) header.d=kwiboo.xyz header.i=@kwiboo.xyz header.b=DKZciE6R; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kwiboo.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kwiboo.xyz header.i=@kwiboo.xyz header.b="DKZciE6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.xyz;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-58e3cb06d0; t=1783725864;
 bh=yQvPeODxU0d6J4vdc1cgw/GKu3KH9eDW6Ridf2PV13Q=;
 b=DKZciE6Ren5NF2plGdphEjHgoM2LlWDhXjXtGx98N9gvEkPjsvIORI3dII9d6sa9Bapi6sE4D
 NbAEdKNpluNo9nGv4pGkqISSqrYbwArdXslUGyainYBcuEoZ0yA2OPoaYpnC5Gpzj/WmtApRqH1
 PB29ubK7TZq+jWcRbck0/lA=
X-Forward-Email-ID: 6a517f25780742a88792fe6b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.xyz, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.10.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <b9a5beb6-b701-430c-b667-44780736dd89@kwiboo.xyz>
Date: Sat, 11 Jul 2026 01:24:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] arm64: dts: rockchip: rk3588s-nanopi: remove
 always-on from vdd_npu_s0 reg
To: joachim.eastwood@gmail.com, Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 diederik@cknow-tech.com
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
 <20260711-nanopi-m6-v2-8-422675a65402@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.xyz>
In-Reply-To: <20260711-nanopi-m6-v2-8-422675a65402@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Joachim,

On 7/11/2026 12:11 AM, Joachim Eastwood via B4 Relay wrote:
> From: Joachim Eastwood <joachim.eastwood@gmail.com>
> 
> Since the NPU is hooked up on these the always-on isn't needed anymore.
> 
> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> index bcb2f5d63a61..463cfeddf270 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> @@ -258,7 +258,6 @@ vdd_npu_s0: regulator@42 {
>  		regulator-max-microvolt = <950000>;
>  		regulator-ramp-delay = <2300>;
>  		regulator-boot-on;

Why is boot-on kept?, NPU is likely not needed until OS has started.

With PD domain-supply the regulator should be enabled automatically, or
is there some other issue that requires boot firmware to enable this
regulator before OS is started?

Regards,
Jonas

> -		regulator-always-on;
>  		vin-supply = <&vcc5v0_sys>;
>  
>  		regulator-state-mem {
> 

