Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204BA44D020
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 12:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783514295; cv=none; b=Gz3H7Qd6UFKKQwFTXKZAuV9L/efQKU746mDT081yUza3lapD9Q5t9z6A3K8nK7gtceOpcc9NxVz7SvHO5m9nmxcCki04P3RBTE8FGLk1nxKJbvQo8/zZj4nAqJkxFUnkp8N2HHBKxo/PFnVr0uNHyIR0n75nzVpMNTUu9AXDkoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783514295; c=relaxed/simple;
	bh=+JRPwrOZ+ypwkQ7iD5bSYPKHGljtOUaxDrIScQnpVQY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TdOXqzt4KSuFnIqYui+GS3S+HFXzfxmeAzFUKYB0buX8y/GaR6sH4XBDvBFd1I4NJuZbWg5BPpc5PHfjaC1uYa2oggrbykfOyeeKaJmRkU01QHBs2y+piODb22lyjtcRvwSjoGlnJ2Dl/NRZjynE5Ez4b4dTra6UPOxUHMk2XyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=c69r4ZX6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="c69r4ZX6"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493e4cccd8dso2604465e9.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783514290; x=1784119090; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rFFEb1yJr4W/OXQaHP4cwompeqYq2+VX2v909Wsi6ek=;
        b=c69r4ZX6TXcMbont5OsxB9wtWwMzbaxViO8iCNAp+S4ODLF2UIFTtSIZ779mybKXwz
         5HsVBhS0n0jHiEO1cbRBRCnDCQgoTv3ii7AG4zwomYSmZtnIgYo/qTjLk/n+haWReQaC
         o94M91qvvditNZTKKmEAqswp5NDf+VazLqvQio3ee4eMomsq6KxjQrBKX8QfZudREoDc
         783ztMV+4iXy283TGlF1YmjL+gAKgmNzbAX+5F2e/Ooc2aDlyQ45fEhmOLWo4XNy/YXH
         bkpNg7OZj7ui5sEFTBiQq5haoinuYNr9lZEQEEEaYxX7V3er+l/7+PP0FyLkoFndGFg4
         ibGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783514290; x=1784119090;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rFFEb1yJr4W/OXQaHP4cwompeqYq2+VX2v909Wsi6ek=;
        b=eID2DYbQs1cuXicNK1x7RRDh1hfBij3XVMAn4iXaWuV+j2Kj2lJe3l7vIjsHNaZ8MN
         4WR1lBP3hH1t10zttz9tOAB85jU2TvpEPfqN4+KoNluCnXoX+xtOBcJFfQLRc+En9SZD
         jRUN5/8ffz83hu3jBnhs/vfsesnhjJ8AAm5pBKH+ykUHuXYS8bHVzTkh1C49+sUSw+Ve
         htLKRFQ5Y1+A2HtqIcbzd3f7RnVCf36BUEsC+Kj/pLLfjZXgXcSDYgH3PKjEEuaLw2aw
         mPLHEDVmvH0/ZzAt9eWSfcO8EHujHAqkkuDLD14JBc8KLhX6I1NFMs3D+Xr7F9JI0yY0
         WK/w==
X-Forwarded-Encrypted: i=1; AHgh+RoVDimV/S4mlNwvQIkK3xan0mbZXEODBtgDEpEds3QpbtJ7D+lhVOgo7eEWcDRH81Wkuca94peQE0x2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnrcd2TydIZZJ91xxbtbyEutHgvkRMZUG8RDPE+6cq2ZaxjKc4
	+oJu/9Vtablx99TZekcl6QU7Of8/2V1o6DbrwtTNeI59ZfYB2U7CZBWWVZm4K0ctliI=
X-Gm-Gg: AfdE7cmcugSC+Q0E/CgSdzyXVTlXM4t17CQIRQy+YLBfohJWjVxg1N6az2RVpX3f/h6
	fZksxORxeYMjGVGdfKmIRtXLBnnNVcTCnE0faXCLjQVMP+9qaQeKhiD+CExurrZkFM0L3ApA8jc
	E0zyVaaYfv71KuuJD1BbSJk5jpXoM1bJf37jUCg8f2OGS5W8jYG9Bf6B+oO/rwMLU3MJ2+NtKqQ
	nVVH5LOAASHw9BfzrbM2eLdqGYRm+YhFCyr2c++bmRtitrYitSoIyQhebI1VYhV0c3s5dpcVz6h
	Dx7mx7qjnFoZ8CFYns8EdPemVBBsqRyAUn4ZMC4fIxubmYN89nfuyljCswogDgvDZYOl8q5m8Nx
	r4PMUxrODSf3GBUqzMT2vhJgykNdtvWe8Z0vbw+X/23d4abcxPhtvVnBk9HD6Se/UNnwHpu0em1
	lWJKSXQ33sFhs=
X-Received: by 2002:a05:600c:a00f:b0:493:bc4b:b8c with SMTP id 5b1f17b1804b1-493e69e9902mr24247945e9.38.1783514290519;
        Wed, 08 Jul 2026 05:38:10 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:6a8f:4433:b91b:5334])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e0f4fc0bsm125307795e9.10.2026.07.08.05.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:38:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Maxime
 Ripard <mripard@kernel.org>,  linux-rtc@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 9/9] clk: sunxi-ng: sun6i-rtc: add a733 support
In-Reply-To: <CAGb2v67AXz=TPzNFnRMS9-vweL+6g5T57dwwYCdorwdi8HWcjA@mail.gmail.com>
	(Chen-Yu Tsai's message of "Tue, 7 Jul 2026 00:47:30 +0800")
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
	<20260706-a733-rtc-v4-9-f330728db3d3@baylibre.com>
	<CAGb2v67AXz=TPzNFnRMS9-vweL+6g5T57dwwYCdorwdi8HWcjA@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 08 Jul 2026 14:38:08 +0200
Message-ID: <1jpl0xhd1r.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mar. 07 juil. 2026 at 00:47, Chen-Yu Tsai <wens@kernel.org> wrote:

>> +
>> +static struct ccu_div osc24M_32k_div_a733_clk = {
>> +       .enable = BIT(1),
>> +       .div    = _SUNXI_CCU_DIV_TABLE(14, 2, osc24M_32k_div_a733_table),
>> +       .common = {
>> +               .reg            = DCXO_CTRL_REG,
>> +               .hw.init        = CLK_HW_INIT_PARENTS_DATA("osc24M-32k-div",
>> +                                                          osc24M,
>> +                                                          &ccu_rodiv_ops,
>> +                                                          0),
>> +       },
>> +};
>> +
>> +static SUNXI_CCU_GATE(osc24M_32k_clk, "osc24M-32k", "osc24M-32k-div",
>
> I'm not a big fan of using global clock parent names, especially when we
> can have proper struct clk_hw pointer references. However in this case
> it seems unavoidable without making a huge mess.
>

Indeed there is no way around it to support different SoC path with
static data.

>> +                     LOSC_OUT_GATING_REG, BIT(16), 0);
>>
>>  static const struct clk_hw *rtc_32k_parents[] = {
>>         &osc32k_clk.common.hw,
>> @@ -267,6 +296,15 @@ static struct ccu_mux osc32k_fanout_clk = {
>>         },
>>  };

[...]

>>  };
>>  MODULE_DEVICE_TABLE(of, sun6i_rtc_ccu_match);
>> @@ -375,6 +435,13 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
>>         osc32k_fanout_init_data.parent_data = data->osc32k_fanout_parents;
>>         osc32k_fanout_init_data.num_parents = data->osc32k_fanout_nparents;
>>
>> +       if (data->have_dcxo_status)
>> +               sun6i_rtc_ccu_hw_clks.hws[CLK_OSC24M_32K_DIV] =
>> +                       &osc24M_32k_div_a733_clk.common.hw;
>> +
>> +       if (!data->have_phy_ref_gates)
>> +               sun6i_rtc_ccu_hw_clks.num = CLK_OSC24M_32K_DIV + 1;
>
> Maybe keep the old CLK_NUMBER macro and call the new one CLK_NUMBER_A733?
> The point is to not directly use a random macro + 1 here.

Are you sure you about this ? You are going to end up with this
CLK_NUMBER_A733 in the table which is going to be odd (unless I put an
explanation next it) then this CLK_NUMBER without any suffix put next to
clock gate things

The choice I made initially was meant to keep thing as clear as possible
* CLK_NUMBER remains the number of clock in the table
* CLK_OSC24M_32K_DIV + 1 (while not very nice) clearly show which is the
  last clock in that case. It is not random IMO.

If you still prefer the suggestion above, I'll submit v5 with it but it
look odd to me.

>
> Otherwise,
>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>
>> +
>>         return devm_sunxi_ccu_probe(dev, reg, &sun6i_rtc_ccu_desc);
>>  }
>>
>> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
>> index ab7b92b47f59..4f4f4cb00f1d 100644
>> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
>> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
>> @@ -11,6 +11,6 @@
>>  #define CLK_RTC_32K            6
>>  #define CLK_OSC24M_32K_DIV     7
>>
>> -#define CLK_NUMBER             (CLK_OSC24M_32K_DIV + 1)
>> +#define CLK_NUMBER             (CLK_HOSC_SERDES1 + 1)
>>
>>  #endif /* _CCU_SUN6I_RTC_H */
>>
>> --
>> 2.47.3
>>

-- 
Jerome
