Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D198142E404
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235008; cv=none; b=tKGuzO1JXY/6591cnFdbjZywKcKC/0MZ0k8m0lgQ2sPda4n/R1pqIwlZCC6yMmzdW65cfw6fgX6wnihqyyJ+xl/uiiL7NCovlo9EZnTD2zr8vTVvA8x5G0kVKPM9azg5o41CeKf9ZFyBAZehuw705E9nQBHwDxkqVm9VsoXkqDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235008; c=relaxed/simple;
	bh=uLnagpfUFVqNy8Hx6YY4OSsrTwJNd/dKrsdS6zcaC5A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PcET60rYbAmzh93CW1+G5Ff4vF7dzBUu77HyC3CclBHU3dBYfA4TQ7GnebdQ9YX4Sn35eiICHCRuCOyP4ZZEQnr5JEBv1rYncBMLWHLneuhnCkvD80sa0U2YowzQ7N4fdo2gmc/L7Y/LAvZX3k6glNLFs0HDnGwovDXL4wkN2K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HBfQbUYa; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HBfQbUYa"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so9627565e9.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 00:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790235003; x=1790839803; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mdc4xxWsL55mn3imyt0LizMFSY4UfYvhYLzlk2F0w9U=;
        b=HBfQbUYadkpBJvEeftpMYsA9H2eDOHHBeXZb6/tTo95bkBiTqEEVk6EUNtcbUKNqhz
         3TEZBI7qfSsBWG/qE/Wzdz3jc1kQatAr8yp5g3i/AwvqISj2/RW4cZS8sJUFCgH/J1fB
         uDUybzSuIw01kr6cPFGw3LM1Z6pXjQguyquvtlhpPTRDjip5S2uPRDtEYutkpxGH9WuM
         1+EzT/gZVTZmnP7ebKZHdo5Nj+E39kdaSAOgncx62Iro4hxCWpGMGsD9KMxo557bG/Ps
         Ky/wEcFbY1kz6nMp9V/b1LZPaN5gKz7rDgEysgJ5sI60ruRBA0+d49oTIF+MdTEZj443
         gbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235003; x=1790839803;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mdc4xxWsL55mn3imyt0LizMFSY4UfYvhYLzlk2F0w9U=;
        b=t7aU09aaNgIh5nNnDNHKO3UAzkFD75Lk6OezHH6OFtbdKPbkeFbTD4Dzs3/Vb5Rbac
         6eyTbuYD86jYaRm+tGyS6HFu/Cj/aN20N63O4WrhwNE5bULH9jFg4TEGst7q9xD5xN+v
         8DiNEluBSoB9TK2Haqr/wpppZYyrm4ujhfLBMAJifSXfbGK2KuBZuzMvwM/LTQN29j+x
         hyUzpITo84fpSKjcG0E90/p0odWqqAlfntfEkMXP937swK/SOJNlWuCdXZ7tFoUnv9CY
         gtJrZCbtGT7coSDZCprwDEYdeyYGAkMAc0SSR3JBHhXwR2bbkLxjWGB0nTjeUKhRM9O8
         Di6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxQmvOWkbyxLltRUm52X3Zv3csfrDYCsbTRCL8mOnNWtB8J2lI/WkuIZ1EU+ncaAklQ0Xvcrfpxqe2j@vger.kernel.org
X-Gm-Message-State: AFuF++kYq/SM//Qw2Na9HmrpcZa3iI+qg7dR8Ep8h4SzWfGxjgsJGRHW
	tu1wEYDa8+Id7FKB4EPLtsPHb9VgOV6F0nlnW5VafBli8vtjlPyGqiObiugUQsPuof4=
X-Gm-Gg: AYBFou1rTh346TNsEppoHPn1/6vfy4bGkfRa9H8byJtX8ouoGbHaDdLI55togUtDub6
	KCZNI0eDM9nC72ujxrhNHhHMFoOHo5SKs+5neuK8UDOYh0owueFVL0Cdln7itngABU4XXA+g7VL
	9XwGBmS9IUVi9Kpenw06pIaogFeNbbTyeutCS3p/MJuI72zbmuVIXDO+XOrt/q7n4zjl0IVsPRj
	2BFHD74q52DVh4tyPBrZhNZiRPN3QUnJob5yx2lbx/KuClM56w52Cis6+tF8rgDZ0wWXgryGiOe
	yGN6+JcujCpZ/rfmEDesr0AKhKlLIX/c5G6677va/Xisl+1h1Xz02FbIr2E6KA9ZxLMbG9k1hjs
	1cOakm/V8FT+F/IPdkG1UmR2/PtCypSnJvpqGf5sCkXj77FRAM2uUPoTR/Kn9t7oWt6QNQxauo7
	G180HCAu0UVAmtUjvdsQeLDV2VlLtVizl+dLdVM6wbSpOt3TwEg7VyaqSGipmWGPEOymNIn7EVa
	oJnESd0f5AnTIJe+g==
X-Received: by 2002:a05:600c:a47:b0:49e:823a:9dec with SMTP id 5b1f17b1804b1-49fe66c892cmr22336635e9.3.1790235002814;
        Thu, 24 Sep 2026 00:30:02 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5bae43dsm45721935e9.5.2026.09.24.00.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:30:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alex Elder <elder@riscstar.com>, Brian Masney <bmasney@redhat.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
 kees@kernel.org, gustavoars@kernel.org, p.zabel@pengutronix.de,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock and
 reset driver
In-Reply-To: <7147ce22-fc6d-4cff-9470-98e341da0a87@riscstar.com>
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-4-elder@riscstar.com> <arG238GS8bMB6DkW@redhat.com>
 <0785235b-de06-44d4-9068-ec706eeba848@riscstar.com>
 <1jcxu3adn6.fsf@starbuckisacylon.baylibre.com>
 <7147ce22-fc6d-4cff-9470-98e341da0a87@riscstar.com>
Date: Thu, 24 Sep 2026 09:29:56 +0200
Message-ID: <1ja4p79kej.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 23 sept. 2026 at 16:33, Alex Elder <elder@riscstar.com> wrote:

> On 9/23/26 3:58 PM, Jerome Brunet wrote:
>>>>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>>>>> index f9592fd9ec2bb..50efa10d48450 100644
>>>>> --- a/drivers/clk/Kconfig
>>>>> +++ b/drivers/clk/Kconfig
>>>>> @@ -292,6 +292,17 @@ config COMMON_CLK_S2MPS11
>>>>>    	  clock. These multi-function devices have two (S2MPS14) or three
>>>>>    	  (S2MPS11, S5M8767) fixed-rate oscillators, clocked at 32KHz each.
>>>>>    
>>>>> +config COMMON_CLK_TC9564
>>>>> +	tristate "Toshiba TC9564 clock support"
>>>>> +	depends on TC9564_PCI
>>>> select RESET_CONTROLLER
>>> Thank you.  The reset and clock drivers were previously separate
>>> and the reset only became available if RESET_CONTROLLER was enabled.
>>> Combining them means I need this.  I will add it.
>> Why did you combine them ?
>> 
>> it would be a lot better if the reset were handled in
>> drivers/reset rather than in clock. There has already been some work to
>> move reset from clock back to reset. This often involve auxiliary drivers.
> To be honest, I got a suggestion from someone to combine them, but
> I said "no, I got feedback last year that separating them was
> better."  But then a second person told me that these are often
> combined, so I took that as "two against one" and decided to
> merge them.
>
> The other reason is that four registers are used:
>    #define CLK_CTRL0_OFFSET	0x1004
>    #define RST_CTRL0_OFFSET	0x1008
>    #define CLK_CTRL1_OFFSET	0x100c
>    define RST_CTRL1_OFFSET	0x1010
>
> They alternate between clock and reset.  The previous separated
> drivers specified the two offsets for each driver in the reg
> property.  But somehow these interleaved registers seemed a
> little off, so I thought the combined driver cleaned that up
> a little.
>
> I don't have any strong preference one way or another.  If you
> think they're better separate, I don't mind separating them
> again.  The two drivers are extremely simple.

Yes, SoC manufacturer tend to mix the 2, it is fairly usual and we used
to have many drivers in clock providing reset too. We have been slowly
cleaning that up over the past few years.

To be clear it is not strictly forbbiden to mix ressources but putting
things where they belong help review and maintainance.

There are several examples you can look at with auxiliary device
support, ./tenstorrent/atlantis-prcm.c is a good example.

>
> 					-Alex

-- 
Jerome
