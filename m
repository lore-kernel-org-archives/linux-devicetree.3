Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E3130C35F
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 02:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789786278; cv=none; b=jAip8n44uwYnLyx9tGs/+3wANq3Uyz9Alxous9UQ7e8PrR91OHfrd7shskGbfNKPPftYDcGZ95dyFbz8z8swenZKyWWguLx3uYWX06q8PZWNbB6HhIZfip1W3Q8I/0H2Wb5Wsi+/gUdxJGUH8SN4hg9M/jOs+P+jG3BywB9BCuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789786278; c=relaxed/simple;
	bh=JcECnNjrlOaWBJGWKF19/ox7DU/tJMVTNEO6ke2Z5lE=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=n9kwJkesrXhH3LZ7gxMxr+ywn3Xu0Nm5L0uNPlmlmo6ejpBpkK3OH0l43oyl1Lisnsd50YbjzqJD1TrPpen3G3JYoMeqca3kP+DQlpYUr2LG3l+UHY3uf9zUmmSD07T72piOyZ0Gma64FVMmTcOAOJk7mBIteTo+mOSbfprDS+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIxsM1rK; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIxsM1rK"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc5121bcf1aso1144295a12.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 19:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789786275; x=1790391075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ffAIIOTzJLTc90hT/z6VobY5awA2RAnbn6y+KHd4n0=;
        b=fIxsM1rKKETM7EOWIyBgwq/sHbjixz517kRhyizI8JZfwrlpSpN6CYY5J0e3TmND6z
         qo5iOwxoawWdWgno8hoJ5vmMfSezDZRhm6idsUyF2Lw5S2A/UtAsWbYVTvKWHgZeAZlQ
         rgvFhIJLfBWOQa05teE6g6Mt5Bu1b/8T/Mu01OZowBbGnfcwv6AOJdvnCre+Bhela57L
         1IWUgiTBi9X+WcSAsP9rDxM3z48XTBY18IuGENXXAK3FJLFAO31t056dD0pqc9UdgcZc
         0NhxQXJri4711v8URYLMwm70fYYoaYFjGt4zDu74T6dsrfNbZg+P2riG7P6cc5Z/EErL
         Phdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789786275; x=1790391075;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7ffAIIOTzJLTc90hT/z6VobY5awA2RAnbn6y+KHd4n0=;
        b=0nWZEI7Szu0hhAHtyG+3eRTZ69wdUPo3O0NZGQD37gdcCGOuQSn569OBVMygC1InFM
         84geYNC/rX2NBMHGNQqC2ot40Up9wc5eUx6EFQQp3UqtdKZPvuU0kY0uzU/bPIJUeJKF
         dvO17VrN7HhotkSlbDjw6+hxEwVdp2Dq8E/n9iUz6V/nYdkuoWXa4kbw7ED9anc4PBs5
         zFiIC2Dhy0SYJ56DzU2T31AskBrghl9RsJwWnS6c09AlgVgO0kFo1aq1wdu4aMAp3oiy
         qgMFZVn2F6eFdwDN/jPcHqkRumyxO7sr91+OLQ2t4Cxce/x8JRUDwyjXrMWKUJwdIt3Z
         LH7g==
X-Forwarded-Encrypted: i=1; AKwUvBzCJMtI3U75l+HWXO6cob4mTgfYGW1oRRwy+SE83sV1UEtQUNs4NrbSBKKTr/kx3UIFK94jViqaVHBU@vger.kernel.org
X-Gm-Message-State: AFuF++mxwe7ZAv8ZKdj4Uio7sK4aOqNJAq5y32afy56W21EGcRsvJqN6
	+JMXGRjp4DJl63Xrna2wWUoxPkvg6xbDQKSMplAlRSzMXPMbLWVugS7U
X-Gm-Gg: AYBFou1I03hy2T3Yeoei55boZsXRmuBbcSR28qC4Z7un2zxwuCpR1dh7a/s4+JPzb3k
	H0xou0ZXN2UviRwJ7ubUig6uNw094ICIlWgK5u4MfvREktTx3aoRizMWcltMt4ZvI52q6JHIIAA
	LqeDXzCwqjSx/ml+x2C7xtnB9D0rZ9JCkAiJ5fWp9YqkX7UAwASC4wi1EQBPXzZR8Z0UOSMNu7I
	POVMKCMilMnYueK/H8L12QkpGvneocBTNboZxrmVwkC7canrLBW+gWjxnBcrTevfeWcuoSe7y51
	P2vpHaJJvT8o5WsltXeXjziHVHtSw4WV4cNGNh0vdQJBob9zrRtZP5KyMls/Fo4Ixb0391xwL6x
	OxNxypHGXh7tlEQMJ67NOE8UNEksLkalTyA4RjKtTRDLM5bLAPGm9nbkP8ldSveouUCjSwUyYMP
	AJAPLNZpJfoFbGfbNeTz//AgRosreygq7oHniaz1AFlswZpX5W1JyTPXxNC5y50UdJun9DRG0LF
	Xvw9MWlsc276USz1/T96eLBefZAzThzvf6lBIVPO8KGGlkRRcY=
X-Received: by 2002:a17:90b:17ca:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-39e54cb43c7mr8391467a91.6.1789786274734;
        Fri, 18 Sep 2026 19:51:14 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c615f05sm2060720a91.15.2026.09.18.19.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 19:51:12 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
X-Google-Original-From: Jacky Huang <ychuang3@nuvoton.com>
Message-ID: <cb92ac17-d334-45e5-b5f4-4c299a1fb462@nuvoton.com>
Date: Sat, 19 Sep 2026 10:51:07 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: nuvoton: ma35d1: add CAN nodes
To: Zi-Yu Chen <zychennvt@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: schung@nuvoton.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mkl@pengutronix.de
References: <20260916051827.919538-1-zychennvt@gmail.com>
Content-Language: en-US
In-Reply-To: <20260916051827.919538-1-zychennvt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> +               can0: can@403c0000 {
> +                       compatible = "bosch,m_can";
> +                       reg = <0x0 0x403c0000 0x0 0x200>, <0x0 0x403c0200 0x0 0x2000>;
> +                       reg-names = "m_can", "message_ram";
> +                       interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "int0", "int1";
> +                       resets = <&sys MA35D1_RESET_CANFD0>;
> +                       clocks = <&clk HCLK3>, <&clk CAN0_GATE>;
> +                       clock-names = "hclk", "cclk";
> +                       bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
> +                       status = "disabled";
> +               };

Hi Zi-Yu,

The CANFD0 through CANFD3 reset properties added in v4 address Marc's
comment, and the reset assignments look correct.

Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

Best regards,
Jacky Huang


