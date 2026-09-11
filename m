Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76F23D667F
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 02:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789092927; cv=none; b=YdMpuFnkwxk/0HfADSiXHF5C63DIGi0B13BNhCmWRrwr1dOlxRQoS7NiFhqWXK0HQ6BPwh1dYXp1gFp40zZaMH323u/Qak4CoCNsmKyFggxre5heCX2LHmRUn2D/5iFQr1/TkJUVLregGIPeJDknR7w8g9aBUBfFWFh9s4XeiuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789092927; c=relaxed/simple;
	bh=c5/c/iuk1PLNOXDE+ezMovGNa06OcIGGAi7k0LM2HDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U6sjaoJm+/5BVHySzAW+I3dkTujYETIRwQBbavXiIrOKuVwJSywn4fDtPCr7HVqNL/ejN6VLt+btHgmNAYoW1uSUogvKxOqZZPNcE2P1HEzksed+RWX5oqYCOKDEtrNThRDJaWbMsRprz8q3OWRzm7X7hOyw33Sox0ILGanZZKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLP5VO/v; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLP5VO/v"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-86b32af25f6so371023b3a.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 19:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789092925; x=1789697725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bx9ZpFS+OPzNWA2YRAzKII3GvhLYAanR46+NuPP9i20=;
        b=WLP5VO/vOv0AY08KppDjx9BIeDd9NBlPdfXdf+6OLWj8JC9K0OxnGc1A6vW7lNDmLK
         YWcPZolP9Nwy0fxIDnJjgbKItLJ0CNBgC3DILnotzTxBWienILg/L5GXDuqkoG3JcL/2
         RktVFfgOMfMwLj6bF1//DKRAgWcpVId5VX/qE68u3d7/3anYxOSCoAkxh2WGSaLwVMOn
         fS/9/BkgRjdkfeOqc4cyd9QgGtcif+Lj68pvzrjzrblpdIvV/T2Hakd619hb59femY/B
         l2ENOb4yzDJTOnCllokR8e9O64N14lal+PtA/fJEC0TPgZBXZRnumrV6wZVLH3jsdQC9
         Nxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789092925; x=1789697725;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bx9ZpFS+OPzNWA2YRAzKII3GvhLYAanR46+NuPP9i20=;
        b=ndCJU7XW5IIlMsYRdXuQFFLOCxdJMKBcEDruFhUPM3ikxg7s44ZaAZySsnQ6aXA5wl
         T7VE5DkM3hdbGBzabvyITNlg/16j7/N3Hc4io5lF+uUufBndjvGcxrKVu87v3/jnVCnE
         8ZyX8Cb+AoiA2PHPVt8p8X+GMhH0EUNkK7Q8iivpRYW0MEOGRSRMtYOU200Oq0oWshnf
         3tIG/3BHMAwp2cdTz8HckhN7kQbdOycXVUA0gtdH9QxVcL+TrHe8C+B88aPpbdmVNOei
         Dvvda+Q72tTsT5J5UlpoNoooUZxvTr7JP9h0GfvaVu5pyw/CI5ITLg7DCLo9h3SJe0PD
         sZUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuMPsEEi/6Lisg2/gM2blkkFfvuGp5Qq0tUo2T4Q7NVSzIXSJp4DHhhXTw5SyMIRBMCfyItIHfsfo5@vger.kernel.org
X-Gm-Message-State: AFuF++kRuKWmyzuPotSkw3EWfxoDwzLX89fO38fbFQxtcfM7UkGgRc9m
	HKvZM4NpgvST5zK/erBfTSGXrDXrp9p3ibMeQhvfmZgvPzJQTPKnHHRY
X-Gm-Gg: AYBFou1BQq2T27Ejh/rgF+hbMrcp6zgNGscwM91RZhjedaT9yLMJ4eFHF2RMOgCrmzI
	elwTyP60Q3WjNW2jL8LOc512ipS2ib5a/xdAP18sV4FFga1ZmwbzAUz+32SKEAobJ7nSAocnfOh
	UyRTmN3166sc9aqjxz28ZuK2UXTyY71QbUv1uGTlBReCLmf3+75Ua45oyZFrLhPH6fKauf5tWQc
	Gz2g+JCkUEiUhCEQou+8PGcVlaaUowa6G/VSxFmrWN7kaXh6yAh2java+hLaHi7+Yf8/MC37uDJ
	RiI7ScYK69DQUWB6HKWX+ouH4ksSavwTvE9sPi4EIV1kNkbmZkkWMW7jX2zZE8GPia3+5z56SMP
	0qgdX20eDDPlPKEVxrWg6i/XRgWahhbY356W70LVeZMy8GfoSmf8XQGeRYPcbJJP2qQ5l7t3oz+
	xazB1i3UFZPhlQ7TO6K6IxPzJwbzypPzvyBk54Bl9m5HSpUYuO3NPxfEWrwF+LX5jnxtMPYzNEJ
	nC6Si3S0eOWoZlBiExn+6oYY9UI/k7mqRd3ZRXAnDKo+2RdZAcvKriHWhwigYGAHW8=
X-Received: by 2002:a05:6a21:600c:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3daed14cf94mr3362546637.6.1789092924990;
        Thu, 10 Sep 2026 19:15:24 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c652aa8dsm385498a12.7.2026.09.10.19.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 19:15:24 -0700 (PDT)
Message-ID: <853110ab-1bd8-41cc-9b82-cc28002c0bed@gmail.com>
Date: Fri, 11 Sep 2026 10:15:21 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: nuvoton: ma35d1: add CAN nodes
To: sashiko-reviews@lists.linux.dev, Zi-Yu Chen <zychennvt@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260908014526.413399-1-zychennvt@gmail.com>
 <20260908015435.7DE071F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260908015435.7DE071F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> [ ... ]
>> @@ -244,6 +244,58 @@ gpion: gpio@340 {
>>                        };
>>                };
>>
>> +             can0: can@403c0000 {
>> +                     compatible = "bosch,m_can";
>> +                     reg = <0x0 0x403c0000 0x0 0x200>, <0x0 0x403c0200 0x0 0x2000>;
>> +                     reg-names = "m_can", "message_ram";
>> +                     interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
>> +                                  <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
>> +                     interrupt-names = "int0", "int1";
>> +                     clocks = <&clk HCLK3>, <&clk CAN0_GATE>;
>> +                     clock-names = "hclk", "cclk";
>> +                     bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
>> +                     status = "disabled";
>> +             };
> [Severity: Medium]
> Should this node include the hardware resets property (e.g.,
> resets = <&sys MA35D1_RESET_CANFD0>;)?
>
> Without the hardware reset line, the bosch,m_can driver cannot perform a
> hardware reset of the CAN controllers during probe or interface toggles.
> It must rely solely on software initialization, which can fail to fully
> recover the controller if the bootloader or a prior crashed state left
> the hardware in an unpredictable state.
>
> This omission pattern is identically repeated across the newly added can1,
> can2, and can3 nodes below.

The reset property is optional for the MA35D1 CAN nodes.

The bosch,m_can binding does not require a reset property, and the
m_can driver obtains the reset control through
devm_reset_control_get_optional_shared().

The MA35D1 CAN controllers also operate correctly without explicit
CAN reset properties in the existing platform DTS. Therefore, no
change is required for this patch.


> [ ... ]
>
> --
> Sashiko AI review · https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsashiko.dev%2F%23%2Fpatchset%2F20260908014526.413399-1-zychennvt%40gmail.com%3Fpart%3D1&data=05%7C02%7Cychuang3%40nuvoton.com%7C0f6b077d07ea424b0be208df0d4c30cd%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C639244293026922482%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=mOpnaGY2o1KYf6Z5OXNovFUJbA6M5WauNCVif8Ihfn4%3D&reserved=0
>

