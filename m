Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753354;
	b=HDiM5r8iyk+Zy6pa/YyzOcT1BeAwERJ6enKPc4s/i0m3e78QwAYIfCjzlIhQXga/+wl1
	 eqCBgRICmoL9GA5XJKSeCJoUxqnL065Pay7w9TJW4uLueZ50gcxh002XOEAZPJWgk6QYN
	 qoGTAHWE65+bhTbrukdJF4FLGQMXOW+13bjRRoymIVLkh0/rPSgiQOtQiNmf2tBPs3+XN
	 0ricrWlEyts0knGo4sucxOoThCIv2+/Kcap75wMfAmos8cm376mDDmdLy+YnlToueO46t
	 /ok4pGlcjfPvxdtl2/5v2uAOLPmrhuTlasJSDf9rHYzp17O2JdOYnbYtz9Q8YJLN6Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Q25AUv/nmZnCtJRHkg8euYpXtkTU5reDQI8K/4xuZBI=;
	b=JxYOx+BhK7OP2tUk4fHvlnXquF97Jt5idkmRudbSX0xXswtepkD/41eFrYevBLdgtFsz
	 UcpFhUVFLoSKv489tl+rnkC9mnYYpWJQzWQe4rlSm/G/9nOkewIkD8JXYUI87j2BzHjJE
	 GNCELlNfepXw41Ga/BLbSWqKg9K7QYX1ioQNnKy/xzO2kTClLlPW17YRMvIySKduTEPFo
	 XaxxmxxAj8lallm9VGYEVtix6pP+nnfxJz2dfcFAFpNCusBo1aAlvJ858uGktE/Ft3oXB
	 kKCiJ5A4emcinf9sCwjlrJmP9+s1asruhTDxAmOYdzUR4YRciR+76+i/DSwvZv+p5HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=NJvpdGf0;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B943606A323
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 14:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B943606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=NJvpdGf0
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491971ac844so2367035f8f.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 06:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1794753351; x=1795358151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q25AUv/nmZnCtJRHkg8euYpXtkTU5reDQI8K/4xuZBI=;
        b=NJvpdGf0UljWwfUO9d+YyB8mADHGzofjIzmwLCya/rTM8Bc9ALk2m6nDoj0t6EhwSG
         0PeRu0vK4OLX+5DuPPZRGfktsuzvxCKLMLjsXw+kPYsPHWBZ9pGI2Udfs+97w+qVfS9F
         WBWgEHFIItS5MLUuIej3LZxdmUaXUETIx8T6Fsx6NpBPCj8hTqqsZhGtoQooz9vqIiSd
         cb7F/57SoXjzWtu7Vo+aT2HordLafTWl/rDTIG162mILcWEy9qps9Xoe9HgrfpO+qB+F
         t+P7BFo5JzbQWrJiFRZeCw3yA3NNSrFnuX+q7r5eO7VV43kjy2NV3XKODJLSHfQP5lK1
         t+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794753351; x=1795358151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q25AUv/nmZnCtJRHkg8euYpXtkTU5reDQI8K/4xuZBI=;
        b=LOaw0BjmFwWpAfvGC8UOxhx18aJRkmY+aTIh6KNMMMsP/MpdKf5Clv9mHIf+sB/Ucz
         N//+9/S/zRmKuqUZk73ujR1WvO38WyEcJR9iOaF8ifJtIOtGdB3hZUuZfaTV650Tvkgq
         gOf/a9ePweFIoZDFW4bx1Vc0A5cnID0gbvw8JmxBLx2BIB3Ax9yLHkNhpoCwM2iG1nub
         9fm6IBy3TB5S5i8dWejVj0KXaFfoUlTXvqnwMnN05fYhL8fmndqBzLIf9JtYBno7v76R
         VeK+dOjRMvxeC7kwesJUUZRzHFUDwnorMxtL8uQScXx0JnXaZULxZZ5phTbhY1bpd0tO
         q9XA==
X-Forwarded-Encrypted: i=1; AL+hErEDSVmUrQy5VpSllgl3YAHzDwYt5hrIAZTY5+rs1es3ts538qQMNkwm5DvuCbMjN9fLPF5UpEogc9ZM@vger.kernel.org
X-Gm-Message-State: APuU4Z/tE6o4lwIetdY3Hc361cQQeNcClf8W9nNv1ys7IFcLP5pTVGHZ
	DGf7U7zGBBmNBVNMa/qAk2aAFmQgldCKpFoZrmcxLgNI0SnK4xTQEUHYyqrox0j7KWk=
X-Gm-Gg: AYBFou3G6KhdbxneU56HVHNhIk+g7i9830zfMRjFTyVUvC7sY/FpqInN1HqTmFaIQH4
	5XHyyzrqJ4Zwc7QsmC0J0PKsZ7kiUT74WozwpHOL2q9+1e7NxyJ/PavYhO6PUB1BPoSD/72toRD
	F9tf8CIPW3H/W2HfEbsgfcQeL0n9on1fifHq3U/WPsOEgnsxGrY1djNtpPsl1a+5IjJO87qwqpP
	nL0Lw0J4CmMHX8X+YFD3XfWz0zlwBcCt7jaGDFug2p0qwqGDSgpKPUmKzeFIZmiN4xtW/dO9UcZ
	NDcvy8L0HS7Cum5VRq88pm7PYshpOv8YwP+PP1oKpI6TDLEmKSrpU2XJ2ATiJsBxQrdOpzQr/Zz
	3pswHD971mdptftLcMqN/aEhM+vWyKy/u/FlNobmiiwvQVo43R46fKczuv6wxgLSfTHp9b58FDW
	VhBXA2D6u2jBNFPZ7hp2l9sFPx5SG2qUqEPhAXQ+pnKHTQkMFyredyYNtAq596ECeETRdpc1ofK
	rHHeNnl4GxrXwAXvbj5+ft9tCz4evDmhEb29mvxwMu0lnjrdBG1r7wHXGgqxWqXCq9zCOlKmf+P
	3TxSi9+LSXmFwBD5DyffglV8S5cErrkrlRbRxw==
X-Received: by 2002:a05:6000:1614:b0:48e:7b12:aca5 with SMTP id ffacd0b85a97d-49c72e85eadmr12207691f8f.46.1794753350909;
        Sun, 15 Nov 2026 06:35:50 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm18730077f8f.1.2026.11.15.06.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 06:35:49 -0800 (PST)
Message-ID: <0ab96156-9c28-48bf-9c91-d1c9ecf90d5d@tuxon.dev>
Date: Sun, 15 Nov 2026 16:35:47 +0200
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
Subject: Re: [PATCH v4 14/16] ARM: dts: microchip: sam9x60: Add OTPC node
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-15-ada@thorsis.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261105110715.2486432-15-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Alexander,

On 11/5/26 13:06, Alexander Dahl wrote:
> The One-Time Programmable (OTP) Memory Controller (OTPC) is the secure
> interface between the system and the OTP memory.  It also features the
> Unique Product ID (UID) registers containing a unique serial number.
> 
> See datasheet (DS60001579G) sections "7. Memories" and "23. OTP Memory
> Controller (OTPC)" for reference.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>      v4:
>      - Dropped new microchip,sam9x60-otpc compatible,
>        use microchip,sama7g5-otpc instead
>      
>      v3:
>      - Removed needless header include
>      - Removed clock-names, not part of bindings anymore, and not used by driver
>      
>      v2:
>      - squashed with patch adding the clock properties
> 
>   arch/arm/boot/dts/microchip/sam9x60.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> index 4b777c61c1e09..996b13300ca06 100644
> --- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
> +++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> @@ -155,6 +155,14 @@ sdmmc1: sdio-host@90000000 {
>   			status = "disabled";
>   		};
>   
> +		otpc: efuse@eff00000 {
> +			compatible = "microchip,sama7g5-otpc", "syscon";
> +			reg = <0xeff00000 0xec>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;

#address-cells, #size-cells are not needed as of now.

Thank you,
Claudiu
