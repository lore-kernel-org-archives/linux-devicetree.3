Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000746;
	b=H1eWLv5HdEYxbfh9/XOWHJACYYWz7TnI5JGEPuo0ihtrK8+zGBknzQuIip+i8E+58G2y
	 aWYgWJTr9+R/7DYti0E/sobBFQCfFb4h2nQ0C4BzXX9fYvtxpOz/oGniWyOmYjD3oQlFU
	 gzF4PJYvuKHZ85MLpU36zyeq84AWxqaXl+0quvagC1rJB1iRRRuXx7gIiiRpRtaWPnlY5
	 TanmQiedz6cx0EJaT6mAzRStDOpmZFnZCLU/tGoc1DYC9dJqTcSoQ3d2ys3lAHAwWmCnO
	 NdEvK1rr8sQKP1hzTbiikKhS6Gz6JnZLfUWUd+7cHMHdbI/VhDQKtX9a+3zLEnrsnfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000746;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=zmXjV3iawTS0v0ZQvsd7944Tri/Bv2s1a3To2GaIC2Q=;
	b=UBkl6gdA+UZi8yVdNTfXk7+WE0kjNMHqu9xPBq4AnxR9hMRg4AuWRbRdoLJFaBNXSl95
	 LhGrWx0OK6W2X0rkw0QUnT26teIVTkljZpsITRmUkc2Z7jB6kRwIpx6DN66kZ/VshLprk
	 bB3k6Hy+CeAOIm/Wmk89ziFTszl8ZZq62psBRmm5OHwHcWwGr5pRWi1E4TNk+UGhGNCRD
	 So7f0FMbN3LaGo++NtG/a1r/poR0GpAduJ76NA0JnmBczn8IlBLuXFy5d8vuFvObDWE2f
	 DwYapYlgKofd0IcxWJv5GjLaOnSMqHBPJQxUymsiKvdwWqhRtajs8m9II9Z1RGHf2LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=P+LqYcQo;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A35606A31C;
	Wed, 18 Nov 2026 11:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92A35606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=P+LqYcQo
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBA2E1596;
	Wed, 18 Nov 2026 03:19:01 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC1723F673;
	Wed, 18 Nov 2026 03:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795000744; bh=ctVycx8CAE9HKS7xZ8rpaNfM80sKn1OMLQroGjvCHV4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P+LqYcQodHIrsRQtwJwhcavH4FJ2SP66b1oUrhYo/E21Jk+GpJS2V6Y99CfcIYwt2
	 s+5XGDeJy8eS+y2JFHg3wrEBJHgh59qQriN5/QpDPs6YzoyPawbpqKMUcfSWHCQFxh
	 mLxiZETSRm6rt0Tb769phP/EHvdi1Jmj1XH/DERA=
Message-ID: <aa1d651d-8ace-40c2-97c1-7ef68fa0f44f@arm.com>
Date: Wed, 18 Nov 2026 12:19:04 +0100
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
Subject: Re: [PATCH] arm64: dts: allwinner: orangepi-zero2: Read the SPI NOR
 over two lines
To: aiyengar1990@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261118-zero2-spi-nor-dual-read-v1-1-bcdcbf785be0@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261118-zero2-spi-nor-dual-read-v1-1-bcdcbf785be0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/18/26 04:55, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> WP# and HOLD# are tied to VCC (schematic v1.3), so read over two lines.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> Needs the spi-sun6i H616 dual read series v2 (prerequisite below).

I don't think it does, and this dependency wouldn't be legal anyway: the 
DT and Linux driver code are independent, even though they live in the 
same repository.
So as it stands: if you specify a 2 bit wide bus, but the driver doesn't 
support this (older kernels), the driver will just ignore this, though 
you get a message:
[    4.226908] spi spi0.0: setup: ignoring unsupported mode bits 400

So there is not hard dependency, functionality-wise, though it will be 
faster only if you have both the driver and the DT changes.

> Tested on an Orange Pi Zero2 with it: 1-1-2 reads (opcode 0x3b), 2 MiB in
> 0.28 s instead of 0.52 s, identical data.
> 
> Developed with Claude (Anthropic), which wrote the commit message. I
> reviewed it.
> ---
>   arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> index 90c25e12e189..fb117116002e 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> @@ -150,6 +150,7 @@ &pio {
>   
>   &spi0 {
>   	flash@0 {

This double reference looks odd. Why not just add a label to the flash 
node, and skip the spi0 reference altogether? Should have been done on 
the patch adding the supply (which has been already merged), but maybe 
we can still rectify this.

> +		spi-rx-bus-width = <2>;

Please note that this is true for the OrangePi Zero3 as well, so this 
property should be moved into sun50i-h616-orangepi-zero.dtsi.
Tested this on my Zero3 board, it works and reads the entire 16MB flash 
in 1.8 instead of 3.5 seconds.

Cheers,
Andre

>   		vcc-supply = <&reg_aldo1>;
>   	};
>   };
> 
> ---
> base-commit: a203a4bac3316451a3036653657c8b250dea2055
> change-id: 20261115-zero2-spi-nor-dual-read-645a6de25e81
> prerequisite-message-id: <20261116-spi-sun6i-h616-dual-read-v2-0-e0c66eb71e20@gmail.com>
> prerequisite-patch-id: 28b145097d0f859e5bd27bcc5028d0915f3ba4bd
> prerequisite-patch-id: fb47570beb53613acb42c518fd1999e05e0c54fb
> 
> Best regards,
> --
> Arun Iyengar <aiyengar1990@gmail.com>

