Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690122;
	b=jT4ctBMr5+U/r3Ezp6wW5PNKmc5c66kAG4ArF8OJ3TRrsCNOU1QG103eWgg5jE1mtWR4
	 SeeweSRCr7UNzAsFGHtPDP5MoL2Su7rV7z/SYLCZi0n+ivHbS83IESbeZgns8ZH/SWRln
	 TTccD7tlvcmrAQTeOShEZqcK6o3TLlq3QCFfV4GPy8GYxXOfac9wZwxcT0p46jrDr+2Hn
	 PCOenAEn+eOgWGRMUHZjU0fKFdVyUE0CB2qRbgQUxWINuezU304HmYNjkLKc98oslHJTb
	 kNWA1tJkUfO/0ExosftgD8Es+dnOFXd/YCOBI2j5TAU5Y4ibETL61bCraMyFK3Xkdjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690122;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aIigL8Htvs1Eri4VcHQ6P7by4WWQ9ht1cFwpEUONgJM=;
	b=FVu2RT/7VNUzO4E3jmE70/tzVgfyfo+OWfQrtP7rohuySyX92iieTWl2wdDi8AgWI6Ml
	 ks9FZ2x4xwTQXy5gCUTPnHLi1LCNMoEca6ysWLE1OU8zqfltYgv9PMOdSjsD41RV93fFh
	 jwZk390z2BtUrbqLXRbTDZAqci8zXmSQpLdftDq1Q/mTlWbadfTh3r8c5E5e7zR/zjp4x
	 5hBRXDvX3EuHMDC8CGb9PaMZUF8KkPpcVMZ3lX8wnnMvyrzkhnNZbR0E/AnPnki3l852v
	 yJKp0OTqyzi2FIl2Bj5I2yAeUdqfLJZ19fXeEWHpoqdquNFlGVfPUAbBpTMEKanl/5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2505E606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2505E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2001dd4e7so448605e9.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690120; x=1793294920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIigL8Htvs1Eri4VcHQ6P7by4WWQ9ht1cFwpEUONgJM=;
        b=zkTKRKlxUgWYiW41KSvLj6GE0T4CJEpzzA3s0FzC2fWDSlxyzV5kuHs26szcJ5KS/G
         2JjdUgskV/EyeSi19i9MS/rzfqwOBxbVrdIJ++4hW8qkfi72xKQ4jPxA4jd5Vn30De8V
         y/kKZ+TIVOEbQj7IBwhsJLyX87LCJLa8H5srNnqaxMSK6lpHPYVdo8Ca3cXYhj1Y9rAk
         44+joIILtBICTAtd8GqRP36TW+564BtzfrUvXmLnsbY8ZIeN6SongQ2hdHah2CLPnJBc
         RNbHPU+sYUQ084tMlag1tlkvVSVM4HlxNCR+cRYBSHzEzkmLLUREGYUmWBMOzwbUOCmU
         1ARA==
X-Forwarded-Encrypted: i=1; AKwUvByDi4k6brvVec5jdTPID6povPzY6ypVCNS0yuzEWiKWFQ9qi6ixykV4S1FAlEl9LE22weu10WZP7Lu0@vger.kernel.org
X-Gm-Message-State: AFq9FYI5jFrFvmqNUiE+sAakWjJ//MntVDCkL6W7FQz+YRSL8WR7M8aj
	5GGxZDkq8w0wm7qdVqM0jgC2TaTwneWEfNMSw79HW1DcHYFAcdPl3Wqr
X-Gm-Gg: AYBFou1qcqaxBzEBfj/o2QRZDq2Ie122u9TyVcJtXrW4kflksnWt+g4mdY3NXAj65od
	E2PP42T8YTEnl7s52XQW01dxZhKnclolOy+XjY4XifKXWXlRFLaz3yzM9VR6gYMWnxpjMfyqKK7
	nXOZUgQmKmtJeoKW27cOqE2PI2ZJvYvLwOoOGPjcYHppKQEKw0o9W9omjwvDKqca8QnuX8/216I
	zUNK/W7R4xcuzsxbfOf/MMADejU+7zDZf6EUIBK84OOtM30/BxPuWz/muqQgbpZGpOMCDSUdUo9
	BxCiIA26hBoJZJHVSlI20nKKG7TJFMKjLKroJ7S72n9F2pX2I5qSR5O7UcB3Kq4rieS8foItBx8
	2aRFHznjiqzNJsRWU8Gb9kEAMsGetSLIp8PgC7NwUC1bf5dJNOayV6yMVjzrm0P3Xsfc1VqibDc
	r+aBt6fBnH7dyztbd2JwG/RHlKxhi6TtvpTLZJMeBalzivZtpE2RG3IAFAyiPlTkHEnCfTl15Pp
	rV/m+mXWbWWCAfe8huD+TGq18m21UxOzXHnmeEhXtIXpKX4eXdKfzbz1e9LQnNSlGw6eeaWaC5Y
	Sw3NMi9AkQ==
X-Received: by 2002:a05:600c:8b4c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4a20729f92bmr52278535e9.8.1792690120279;
        Thu, 22 Oct 2026 10:28:40 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210361ad6sm11491635e9.7.2026.10.22.10.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:28:39 -0700 (PDT)
Message-ID: <1ca9d46b-02aa-41bf-b184-2a62f8a284bb@linux.com>
Date: Thu, 22 Oct 2026 18:28:39 +0100
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
Subject: Re: [PATCH v3 4/8] net: stmmac: dwmac-meson8b: apply the RGMII delays
 the T7 way
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-5-tanure@linux.com>
 <CAFBinCCpo28jZkQnup2=iofwh02GOMzxJ82hGHWctiWzcKTxUw@mail.gmail.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <CAFBinCCpo28jZkQnup2=iofwh02GOMzxJ82hGHWctiWzcKTxUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/10/2026 22:49, Martin Blumenstingl wrote:
> Hi Lucas,
> 
> $subject caught my eye because I didn't understand why there's a "T7
> way" for adding RGMII delays since we should be following a standard.
> Patch 8/8 in this series documents the standard. Can you please find a
> more suitable $subject for this patch?

Ok.
> 
> On Sat, Oct 10, 2026 at 12:59 PM Lucas Tanure <tanure@linux.com> wrote:
> [...]
>>   static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
>>   {
>>          u32 tx_dly_config, rx_adj_config, cfg_rxclk_dly, delay_config;
>> @@ -411,32 +455,34 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>>          dwmac->dev = &pdev->dev;
>>          dwmac->phy_mode = plat_dat->phy_interface;
>>
>> -       /* use 2ns as fallback since this value was previously hardcoded */
>> -       if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
>> -                                &dwmac->tx_delay_ns))
>> -               dwmac->tx_delay_ns = 2;
> The 2ns default value in case "amlogic,tx-delay-ns" is absent hasn't
> been necessary since commit 093d23db4fff ("ARM64: dts: amlogic: add
> the ethernet TX delay configuration").
> That commit is part of v4.12. So boards using RGMII and a .dtb without
> that property haven't been updated in more than 9 years.
Ok, so for v4 the code is moved probe into the function only the older 
SoCs use, so it is isolated there and the T7 path never sees it. We can 
drop it future patch.

> 
> [...]
>> -       ret = meson8b_init_rgmii_delays(dwmac);
>> +       if (dwmac->data->mac_applies_dt_delays)
>> +               ret = meson_dwmac_init_dt_delays(dwmac, plat_dat);
>> +       else
>> +               ret = meson8b_init_rgmii_delays(dwmac);
>  From the discussion in v2 I couldn't understand the overall way forward.
> I get that new compatible strings should not rely on old, incorrect
> behavior. But what's the path forward for the other SoCs?
> 
> [...]
>>   static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
>>          .set_phy_mode = meson_axg_set_phy_mode,
>> -       .has_prg_eth1_rgmii_rx_delay = true,
>>          .has_pipeline_clk = true,
>> +       .mac_applies_dt_delays = true,
> This should be a callback function pointer (apply_delays or similar,
> to match set_phy_mode) unless there's a way to make older SoCs also
> follow the "correct" RGMII delay specification.

Agreed. V4 will do it.>
> 
> Best regards,
> Martin
Thanks
Lucas

