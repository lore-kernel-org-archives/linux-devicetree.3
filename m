Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C4F404BD4
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 08:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844525; cv=none; b=kn4d5QuBDF62I22VNksLVZy2ls4m17HkRAviPpcoYRyCXDN6OaKnJYO7eGryLPnS3tn10kf5+QrzBlr3yiJe0FybePwXdaJziDfvDDcgIaBK330tCSKH+bpq3cctoMrBprn9y02hiZ4DvnsDzz22CzySp2t9qzXv1I2bxtdvXo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844525; c=relaxed/simple;
	bh=nr+YQ7N1k8qNgaWp+FXDvJKF1MvgrJIxfO3fL5291fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JGff76B/p4gP8P8QxwAHc4Uo4t5ETE7VcujnGZY/7QT5fD4iDqHDexfIg1b26nfJHQ3gbFidnkJUaqLHqCi6YK6COqHd/nguZejy/Oz16wPELbwTwmLsE2MfPE4JAf/gm6MjAOt8pQtRd9pzd0x/7lEOV6WJbtEc8NRaRl93Nus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EuWgErga; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EuWgErga"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so2678538a12.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 01:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790844523; x=1791449323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xkYtUBxUyQXi2wHjivuAC69Sw5c4fAlKZiLrX6CMriA=;
        b=EuWgErgaYuOiZ5ZEaQb3fXHHDjdms5ZpY+RYYBeBFVq5EuTebKSdGjwRvcsV7C2Rzg
         8+my/DHwbmEKrXPrh5GvEkEDKl1xU9MpSSplFPERMqXx445Wkk1p/Vw2O56p4WRdKZaA
         Eoj51JZsnRZ/GLFRWfUkU5W34yB8acQ7eJbmlQtJOoyi12fNj7howR2ewNZ9o6LgFOJi
         tAnutz4J2cAKQQlw0Ah8ubuvU1gxehdCetvO7XEr1N+TOlWcnM5ebhSuuYRjK5bQzwXu
         RhIFyvNE5KQt3dsQ7hJPDHQ0HC+vniJxcNVmSRiJgxf4DxN9y91+tXknasbNgFyNluT2
         hhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844523; x=1791449323;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xkYtUBxUyQXi2wHjivuAC69Sw5c4fAlKZiLrX6CMriA=;
        b=l6BBtp0gQB4sy0Kfbm4cwvdeNh+IYPTuiGUxC2sOAfn6g38p/gc7FFpfXgQ0tmr9Cz
         Vz1Y3q/e44PIyt1OYgoH8J+42Hkk3X2SO3RR4VW9WUFI6xGDGke7M2ha2TdOcLPJiy0S
         RLMSszd3XamfdTqnkI7Z+/pRflgXeae4flEx9os1cxHc2rTzaaWSX0cqa8QNKngBRtDm
         gDZBlv1eoDjzwyo9Meyrg1NVM8048ptcdEzQkAqX/EFJxIo9b5fweSrPgDtSb0OcdzIa
         nSnJv9jyXeM85iVfWZLMBiuQ8HslQSwDOr0FCACVM6SFBjpNJZmy6lCelPu5iaqzDH2T
         +PEw==
X-Forwarded-Encrypted: i=1; AKwUvBwkFmLan17IyNF7WhzE0Ylt44KdNRdXA1mroQ3OsiC5RCwDtRmRC6evFBU+QrPCOYcf+8x3tfw+h8Il@vger.kernel.org
X-Gm-Message-State: AFuF++kcEz6FRJIc0kw7Bw7/oV6FDjxrbvB7C9HHK9zdeHLFyrX6eI4A
	SsF1zI3pI3FhDqmDAHeIcOZMfRiFQaHeg3N7du/9YG+8NDzrqBlHnua3
X-Gm-Gg: AYBFou3eDt2pk5R3U96d91pSlXJVmisSI17/5I8gz3ib45RMzixv8lajEshkYQpvKCW
	KkgbU6VdhpjNS2WDEzCxjHStQfnTQQeHH+xLryA66c+iiumZeFI6folXcsbO6SojOvM/K3CC3m6
	fgaUY5glrIN0iYV7ypP67R1Ksi0MsWHIt/47viWRHWD8vdZE8pyUtew4AwHF8/asnSVrKVVThJo
	XyqNxRkhaFkBl4rxMVONKV7aSpXFhFOX0groBKbgUVVudLB7/AMFXR/cb/4NcS2ykeuf0vbDlRb
	mm8vVmpEqg9fhFewzRHCxmJZhBNQRasU5kSsYEgQBWE3qW5e6AswUziDtmDn9UvAGkRh2SkyXVS
	Pb2R/HXKJw8lQxok8sUCSDq9n0WTfeYABvfVgh3g2ib/OZHZdtepiCgVucK24k1Fiqhmf7qCcAU
	cPbSBNwE2ilfqXlKV399KoiRKu9hn93LR29D7OI++LnEB2RuKDueUsap66BiZg5GD7fWgAjy+50
	+JwZOSpboo+7Nrm0x5upwCZoO5v2AewRnavMBXvJOt9YB4KMTc7wHM=
X-Received: by 2002:a05:6a21:9218:b0:3dd:85a8:cacb with SMTP id adf61e73a8af0-3de9e8a898fmr4391298637.34.1790844523436;
        Thu, 01 Oct 2026 01:48:43 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e546039dsm1125695a12.8.2026.10.01.01.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:48:42 -0700 (PDT)
Message-ID: <92216f9b-6c8a-430d-9bca-eaf583106a3e@gmail.com>
Date: Thu, 1 Oct 2026 16:48:37 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers
 and dual-port PHY node
To: Joey Lu <a0987203069@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260929020854.1282339-1-a0987203069@gmail.com>
 <20260929020854.1282339-3-a0987203069@gmail.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260929020854.1282339-3-a0987203069@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



> Add the USB subsystem nodes for the MA35D1 SoC and boards:
>
>    - usb_phy: standalone PHY node with #phy-cells = <1>, covering both
>      the OTG port (PHY0, index 0) and the host-only port (PHY1, index 1).
>      Uses nuvoton,sys phandle and HUSBH0_GATE clock per the binding.
>
>    - usb (DWC2 gadget, USB0): phys = <&usb_phy 0>, dr_mode = peripheral.
>    - ehci0/ohci0 (USB0 host): phys = <&usb_phy 0>, companion pairing.
>    - ehci1/ohci1 (USB1 host): phys = <&usb_phy 1>.
>
> Board files (ma35d1-som-256m.dts, ma35d1-iot-512m.dts) add pinctrl for
> VBUSVLD, PWREN and OVC signals and enable all USB nodes.
>
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>   .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 36 ++++++++++
>   .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 36 ++++++++++
>   arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 65 +++++++++++++++++++
>   3 files changed, 137 insertions(+)
[...]


Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

Best regards,
Jacky Huang


