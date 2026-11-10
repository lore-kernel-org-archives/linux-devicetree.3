Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274583;
	b=ZMW/BT/JCp6RNw7ve44p7ORLV2nutqhY2+U5SJ96UMcY0M472WGCGlH2t3/duoy23x5U
	 fj/hOjvhTDTkxfShrXzzXgIBpvedYUPDzy3HhjHcGgAEutHtOEUyux053+ktGUUHMQFei
	 wLDAQn6a5Z/QZJHwugZZze0cb5IO5+AT/wwgX5n7bljd9swbek/H2ai+Cj3Fl1qcFoIES
	 Ql6I2EtHxP3E7rquUTJ3sc6FHpCOfN43vJR0qXhaHkMZoIFeq3aSo/XKDSBOpQMAaoDeF
	 oCbo/bAZgMowN5QYD6Qdp7DdHve027lzzSD7z+IrL8uyAegt3fQ6NbIW7ohS9Me0JQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=T4Ebh8dhdAtqQW32OzgRtdpRlNomsu9HMRNHYFGmf0o=;
	b=TW+xOT5qNgj7j7s5Wk2XFFAt2sOkQbfHwhj6DAt9PuWkEeKp6ROYooAwnK3W+jkjSyrf
	 df9uAYFAyj5qrKLQJHVsOQbcywlQHX8lQSow3LAy9LrA6Ys1VdxBhqfVkMRysgow54Pvg
	 89hNZlaQbvAsr4AC9ZPQBxoB7mSH4eS4jWK9q+3IOWXAtO9c7Xnb6uIObE8BsyhNvYbk3
	 KFiKrcP4WJ1BcLRsw/zuf1QGmcecXAWjqs6+HlwrXhOV6IVsBSz88kTAwzLnpdRKOt/zJ
	 vaxG2OQbzOSZQnSh3C17qDp8TnXiL6P+ET/rOPkEGwvssF87jGVrJLSluaUs0FCDS5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iVX1L5iy;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4337D606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4337D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iVX1L5iy
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e977109392so8683455ad.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 17:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274583; x=1794879383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T4Ebh8dhdAtqQW32OzgRtdpRlNomsu9HMRNHYFGmf0o=;
        b=iVX1L5iy5pwjGl5huwZ2e8glfgO1lGYeiWgqpK8gdf6YfFzp5GQCwZux7Oh/F8OCvU
         YWojpzElcs6dW6W3w1bL8F53LBQowgkDPgqZeHfjmS1OSCYr+ZL/j7grfMsYulitcbCA
         nv4na2s19LYmsbHbl+DvVnPrmYGce/DEx6IAJTt0hsZ8pJWkJQFJFbJqFbgdtGGwIHjB
         RB4o9PZc4ywrR/PQrqbkcRKSO15a5s7EJoU/VBjCp85ZlBmr1sDGeh3mx+G0OuBNx/Fq
         TiZ40H8ZTsOnGSyd27GY/9gqBJC8umgeKe8z62W2rMZ1Kg+Cv6+wpMbkZu9gkkx0w1fw
         SjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274583; x=1794879383;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T4Ebh8dhdAtqQW32OzgRtdpRlNomsu9HMRNHYFGmf0o=;
        b=yrrLJ/yUhS1lgqlBlCj6PWqfgqpAEKQ0LUzwo1MdIpBzmkKf7XEHO/hrBieBPhCYxp
         6gf08Bpyf+Ydjz6w6Knfp4RPMYE9xqkmCJX4GIEigTcyHkQELCEgpjKp24xEvuZgT+sR
         8VOqyyW5pvhqxyiYXIjEeNYaISLc7TsCEjshTlRK6gbmozB6xTHwuNSy2xYRxd68jSJf
         B2SCb+Z1InXhtrf1Ka4fukctOAr4jGxckY+ePnCIvZ5AlF5CUZLDT32lG6ZCELTDSRlr
         kPfzT9W5xac04TAo0DIUgMjutjh2f8D2iDmttHAebm8WzNPl+s8V7EJ6wljzfOCKKg4+
         Eu1w==
X-Forwarded-Encrypted: i=1; AL+hErEQHmDd0s4NiJRyyt9KPyzLPaTktyCJ0JQ7A2UV5O/wNR7q+RFOJNKiD8umvPG4zJ+d7wIatNs6khCr@vger.kernel.org
X-Gm-Message-State: APuU4Z/wYLp//NTvqacSoW7LgtmsGQ4eV+O7Bxc/AQLOCiKQ223RGQws
	Yz3Ly2dm3ReRDwM0qGiWD44+Pol/6oqWMbQkz0ZlPkfcQkzS0RPAYAPU
X-Gm-Gg: AYBFou36ppriMgW5sAMVjmpdggXLTjKMXYpGdfPCsrqE3SrswK6YYGTRpGuGEHCYN2g
	EEJRKAnO3LQBR5m0GIVqvB8AHWcpANC02QK/sW5Lni/s8ZijzR4+zKbqoZI9FFRgLpcnX4+yC6H
	ecEAzGWL7+MuR5DqG8FD1D/gLcsF6ZW2Q9hTqdQTAVSg9HJ8mjaggwnwTPn7ljLOTPp9RU4mxUj
	/VUHVTxZzCowQWyKnVNFBYvY7OqdSwi9I683GQBEtEw1KM6ZPqFQqNfcpll+UyiPHg3X/5GEygS
	BUcFS/jNr1Ij4luYAdrzLhvr2/EiORcdqM2CMttkbkpiRbyV7sOr0Btb18tbzMn1pwBiBXu/elC
	Hx4KLuJai8fZejKVge0+kwvFA1gFsyi6EtV5cZJ6E8zkqLKs5WlurT/Gv9DYbjRBA3XivS/kEEk
	9eDmB+FTbAK2P1vBAC8wP6T9mDFPIzcX5Mqd2wtyOrJyEM+wcxGBfVJcka5fpuCW/Ls40uw56OC
	bJhsuJJ1G2/0lxrMrWG+9KVgAIV6VkyFGcmh83y4gK+mLwj2kpU2kU/kKX970g9J4MTmV++qv0K
	xUS2TIX9o7tBZCwGsgs726rnI8GCzKQv2WediHJUJz7A+2JCPVC/uK+UfJU1+iOruDU4lmAVc2Y
	sAjjjlJeJvg==
X-Received: by 2002:a17:90a:ec83:b0:3a7:b260:9ced with SMTP id 98e67ed59e1d1-3b166cecc28mr1338219a91.58.1794274582333;
        Mon, 09 Nov 2026 17:36:22 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b594sm1694983a91.6.2026.11.09.17.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:36:21 -0800 (PST)
Message-ID: <84e38db6-ebd4-4b32-a36a-32f36bff3550@gmail.com>
Date: Tue, 10 Nov 2026 09:36:18 +0800
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
Subject: Re: [PATCH v8 2/4] arm64: dts: nuvoton: ma35d1: add USB controllers
 and dual-port PHY node
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
 neil.armstrong@linaro.org, olteanv@gmail.com
References: <20261109065606.62641-1-a0987203069@gmail.com>
 <20261109065606.62641-3-a0987203069@gmail.com>
 <sashiko-outbox-204536@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <sashiko-outbox-204536@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/9/2026 3:16 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] arm64: dts: nuvoton: ma35d1: usb@40200000 reg size 0x1000
>    truncates DWC2 FIFOs
> --
>
> commit aa9ff21b68491f1e002468f4d400c0d7fd2b192f
> Author: Joey Lu <a0987203069@gmail.com>
>
> arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node
>
> This commit adds the dual-port USB 2.0 phy, dwc2 gadget, and ehci/ohci host
> controller nodes to the ma35d1 device tree and enables them on the som-256m
> and iot-512m boards.
>
>> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>> index 7228ad4735b5c..72a1659207fa7 100644
>> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> [ ... ]
>
>> @@ -431,5 +439,62 @@ mdio1: mdio {
>>   				#size-cells = <0>;
>>   			};
>>   		};
>> +
>> +		usb: usb@40200000 {
>> +			compatible = "snps,dwc2";
>> +			reg = <0x0 0x40200000 0x0 0x1000>;
> [Severity: Medium]
> Does the 0x1000 register size for usb@40200000 truncate the dwc2 per-endpoint
> data fifo region?
>
> A 0x1000 window only covers the core global, host, device, and power control
> registers (offsets 0x000 through 0xe04), while the dwc2 driver defines
> per-endpoint fifos starting at offset 0x1000:
>
> drivers/usb/dwc2/hw.h:
> #define EPFIFO(_a)			HSOTG_REG(0x1000 + ((_a) * 0x1000))
>
> dwc2_driver_probe() maps the exact length from reg via
> devm_platform_get_and_ioremap_resource().  If the controller runs in slave/pio
> mode, dwc2_hsotg_write_fifo() and dwc2_hsotg_rx_data() access these fifo
> registers at offset 0x1000 and above, faulting outside the 4 kb mapping.
dwc2 register size: valid. dwc2 places the per-endpoint FIFOs at
0x1000 + n * 0x1000 (EPFIFO() in hw.h), so a 0x1000 window cuts them off.
The USB0 region in the MA35D1 spec is 0x4020_0000-0x4024_0000, so in v8 I'll
change it to reg = <0x0 0x40200000 0x0 0x40000>. I checked the other USB 
nodes
(EHCI0/1, OHCI0/1) against the spec; their 0x1000 ranges are correct, so
only this node changes.
