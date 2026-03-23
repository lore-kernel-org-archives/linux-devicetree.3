Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A69E38F65F
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262467; cv=none; b=hRVJMhwdmrBTZIJk3Fbo+pi0rhDtI+peelhXGsOnd/vUQMYtKj6uPOujYOxlpR+Ls33SoXQeEz1eyI3iEKQyceP0xp0euA7evy8dBJoptL+dsO35NDS5piIM3dBSiBOu9Hl6fgiqT/pVFuVXh9hlVTYlOq283pPsJEZmbXzyDi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262467; c=relaxed/simple;
	bh=PDMsEi6zYxrhKfGSBv+ElUdaA5Bg8Cf2Ujaxsk1ppW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQeuw1uZQcEi4Fl5+yHmStJcusDeIbD0dD+oRDGSnYVSStFc2xRPUjmhrJ0rSRlAJp75/K/mVIh25jbgHPmz/QCh9DajYPS36RWfdZ2gph/vhMJ1Bdezojv1yp40KwLkGuifiRhnYLlM1aoUxZXF9irZs+aJiOsuM4WzmKpLpbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=j2MOUC4d; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="j2MOUC4d"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8f9568e074so21684666b.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1774262463; x=1774867263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ab56nxYJ6oFO4EIr5BBI/ZlXkH/IEQRPiOy/1Ule1ME=;
        b=j2MOUC4dch7nL8i6ddNaFSwPMknW2eOr891/KuzTrEzyOCDwj/HDy4L6aia1n8Bk5H
         IkjZLHGIIoofCn+I+INXba4JhAAPPFw/w4BZktAi1EJnY2b2/CW2o2OzFHJddonZpvvk
         tabWci9t48eLyWc5e3Hzwpdye3OIlGROptDtL09ZhT54OHQj2QnMfOzDIi0vGPPXsA6b
         HTSmGFBsPlxkZeisBBfJ+y/s70/7Tb9h8EqTqPBfK3T98uB+BYeX1nsLhkm+FKCHiobL
         00WMdgCgMjHi0fa0mj+14M+9YP/gae9igq9XBr9/abOffblv9oiRfq12KBRJWHe/Ku38
         8Kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262463; x=1774867263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ab56nxYJ6oFO4EIr5BBI/ZlXkH/IEQRPiOy/1Ule1ME=;
        b=aNVv7XuWfWV9bwBSiMBBjNsXatMC/peFyApby0u0pqd0RycXKvVFaqZtIbXNxXqpyq
         CTHugPtEbFikP1xVMMFkvIIcUxQ3f/NqVy5enGMgCe8iB9sUZa+hOHXYq1beAy1mFd3V
         eWJKOV1JgmOzR55S8ZnoxXhXjW4H4tvQsCBVBwlFCms0HHMkwZ8Tdsn5Va5OXgzlNko5
         TmLTw1zytLFXpKRIHDpWUou7KU1pgzyrqoeX6xycrZjFXyP0AvU7JD7nZk3c8vkBGbcK
         Ez8VEgAR25kqZp+EX/wwcg2ixAWqM91pXOCFKmbnxpwIXDKOfUi2io3433fAvGBOT3FJ
         0NXg==
X-Forwarded-Encrypted: i=1; AJvYcCU0s4AlZfQgw/ilMTJqkBFEtYC4JKiBICY8f+VtkKtSH+CL4lI44ka4cKwrVaYfEEOcIwOn7RoeOofd@vger.kernel.org
X-Gm-Message-State: AOJu0YyTadkX3MTq0sKdYOdlUP3q3q2GHQ1sfMN4C6vDbkdid8f6AEI6
	0YWHXgeetAM3zfopQgEaIo4VL3A4Mk605BMaKFzshxNDJHrmjsqtVUNbantcpwViV0w=
X-Gm-Gg: ATEYQzx1dxsKlxy6/xvHt6KAgoIHfcXDWTBTyFTXRoushiv4Xw9VbVt7cRFbMeQlBv/
	Auisc4OTE5cYAS+5F4nta2Y1naFWEnY4jVivrFGNyZ38GoLqSD6zY6oRXvoE7lPyNnXyN7QtW68
	QjixdqJNWkT1wvad/FtWMpQL6LefkAnM7mLQGIVdeKycQnc+FQaj67/r+q94kixaH2cj/hm1el8
	cijq48UY8WmLhAk8NRJZ+KLyrV+FPTVrMD5eTxvgp3CD1/eMG1mHMoIYIgyMQiQ1XP2uSZotBtL
	BaXsmqZFrlUwncJ1qHHN6WUyNzJuuaEURVwe3aqmpO7dKEZDzQOP52IU+RkHW02P54Zbvo2BPcT
	SSoxkqyeoMNvQO0HoaZefdpJSaW0GuQdhfv1VSy5WssHC2zlR0g0Ov9c5ezNyOHqAgD+b/Kyf+N
	0jbXVP9nxDQ+DC/AYbMxP4WFwB4qYY4wI=
X-Received: by 2002:a17:907:7fa3:b0:b98:4799:e6de with SMTP id a640c23a62f3a-b984799e8afmr633936266b.48.1774262462984;
        Mon, 23 Mar 2026 03:41:02 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.216])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f440f2sm473267466b.5.2026.03.23.03.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:41:02 -0700 (PDT)
Message-ID: <962e1094-49f7-4696-91f8-2dadb8686bd4@tuxon.dev>
Date: Mon, 23 Mar 2026 12:41:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: sama7d65: add Cortex-A7 PMU node
To: Mihai Sain <mihai.sain@microchip.com>, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260126131035.6964-2-mihai.sain@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260126131035.6964-2-mihai.sain@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, Mihai,

On 1/26/26 15:10, Mihai Sain wrote:
> Add the Performance Monitoring Unit (PMU) node with the appropriate
> compatible string, interrupt line, and affinity so that perf and other
> PMU‑based tooling can function correctly on this SoC.
> 
> [root@SAMA7D65 ~]$ dmesg | grep -i pmu
> [    1.487869] hw-perfevents: enabled with armv7_cortex_a7 PMU driver, 5 (8000000f) counters available
> 
> [root@SAMA7D65 ~]$ perf list hw
> List of pre-defined events (to be used in -e or -M):
> 
> branch-instructions OR branches                    [Hardware event]
> branch-misses                                      [Hardware event]
> bus-cycles                                         [Hardware event]
> cache-misses                                       [Hardware event]
> cache-references                                   [Hardware event]
> cpu-cycles OR cycles                               [Hardware event]
> instructions                                       [Hardware event]
> 
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
> ---
>   arch/arm/boot/dts/microchip/sama7d65.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index 868045c650a7..1e1ca4f93969 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -45,6 +45,12 @@ L2: l2-cache {
>   		};
>   	};
>   
> +	pmu {
> +		compatible = "arm,cortex-a7-pmu";
> +		interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu0>;

According to the documentation [1] interrupt-affinity is not needed here. Could 
you please check?

[1] 
https://elixir.bootlin.com/linux/v7.0-rc4/source/Documentation/devicetree/bindings/arm/pmu.yaml#L107

Thank you,
Claudiu
