Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC40413618
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 12:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007449; cv=none; b=i+OzLJtDJaxYH8+QpS5mcuaDO6V5yYUv9neQCPvGFzZE1b8avDgKN0FLLLNdXsyOwqkSyf///2uRgq442sauAEUbZvlEmx+aJU+MnQEsHCQPs0tBp67dREVrgxkmjJNPxTj+YUQcQ1g3PoKWVfd3U9LyHjiDC5sxAJFQPArTgQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007449; c=relaxed/simple;
	bh=7mY4ZLLEtPhXCIzYG6qT0auuWpAN+xsmJ6MePgj9U70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAuMQQaK3KaRpE7bqS1wQbuJYIPshCHnYUK/183Q7cEZNXD/sZj8Zm8FdpmKiIjj2oRuaqCrPrkOzT1LSfIxbKUjRH4/AwDqg9+oZNR9OF8P0xNtChohqkrI5Br/Hb0OLq1aHPtYC0EJwlFUgFjDHO4zfRSU3BYLYVFCCGTCd6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PVQVXxTM; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PVQVXxTM"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45eedc94d37so2754574f8f.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 05:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781007446; x=1781612246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0sf15Qn18zljQFqjYtY+ttqovVDRkyxEeVFCISge3H8=;
        b=PVQVXxTMsOamZccx0PR52rnSacwaUSO0Wr8g9gKplkHQsHXGFHmztBfWlAmYdrvIj1
         NQnlcqGUaSmWhMklqIUXg/8am1A5naQQroZJjRXXxGUkNNF9bNL9HqP0QAqGFRLsXG6u
         BP8Gj4goS8iZYmWkLfFlpqYu6sEaphoZKRQixRRxIfRvirMBcANrqa2sgOenQ1mH4GYQ
         aqwkrx9GznkR2vNunSOS324nJbdoseEnm8lwSxxyaX5lPMvOpDELaExK5Nx8h/q4O4Lz
         zG1kavv7BZoyoSggAFlBDWCBD2ceGj+Wifkc6jg4iYytXxbFp2YGNFcqr8jvWOFoWM30
         gAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007446; x=1781612246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sf15Qn18zljQFqjYtY+ttqovVDRkyxEeVFCISge3H8=;
        b=l96fxGlc04BqaB8mwO3zwXX14ozZPdudQWQClykzbqmRsYvhhpkH7+7zOn5aiiRBoP
         1V6qD1Vqs99zDvHwGvF6liNI0USHfBfQX6rv3ZsamnLeimwY7tNveT8/2u3gZ1qIbldS
         MdEINLLMxSNlVej4qJvcxubkY3tKtmMIzHeBAFFWH8the9NKPyg2Q/xT4aUtQgnTjhiq
         BJlCzIC7CyCNumqF2Ls+nNde24uqXBcwsmABSco0/5IB8pYqpuO6qnzsCVlcjQQGht6R
         7TDT7Sjq45GPf7Lp7by0QwpQcIlGmbqEeK/UrtRGqDY5F9a0UnWactvACPVaLI4J7enj
         qIQQ==
X-Forwarded-Encrypted: i=1; AFNElJ92tsHcW61d0o1MMjNNkkCaJHprnpdjqY5AyeuseceY6ghDrl+uUpGi2hq8FRRgwTrjTNiYwg2HL7Kl@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzgbuv4z3ZEd8iVJCjTFFisvwvBjZ0vnPR6v3oJvP7HsjP89Xf
	Zoa64wh3cQlXtTMSM7/OR87wSQLw2bNyHWapOPBbOpnZzA9mAvuPd/8Q7l6hLA1wFSk=
X-Gm-Gg: Acq92OGZhRZB2k/prTR9jiKBBnn9NAPpKHeNsxSmJgNvaACBhDggVJFqtVdCfbknm10
	t5H/5AmWHjEpXBNEDmQzaN7G3Of999r5ChnVS+DU4HbBBhTfs6cCjPhM0LoccGIfZ6TxnL84ztX
	DBpkQsPZ6IQCpkCW2/2w/41W7pbVBoQihffikaGjw0MUr2NdriHuYyL6HjNUbTiuWBkrKRmpZne
	rBQqDlt2IAaf0vGmlxi+T0Pv7MtZ3zdz6I52F7rJh8BBa7+6fxeUAxiHEhZdHDN4sJj5aZ97AWp
	NYBSPMAusWelhrRHQBKlicrrVQV+rRu3yxeqFGD5IcTvE1XMkoXFhT6htoDzXk2SDd8FabBBqWB
	VnIHO0/IaGsZ708KdOkRwecCL5Ff4Xl4LzPvIMh8ABhBFi4Re9K0YwqWAWYjiIiguLLgL27fXn2
	O2tC/+WIHci1ERIyeSF1qFwG8uE8OIesPri3C4pD/lZzu1lq8Gan18
X-Received: by 2002:a05:6000:25e7:b0:460:3233:beef with SMTP id ffacd0b85a97d-460566dc381mr3315017f8f.43.1781007445883;
        Tue, 09 Jun 2026 05:17:25 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351ac0sm110033645f8f.27.2026.06.09.05.17.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:17:25 -0700 (PDT)
Message-ID: <055b5f99-887d-473e-8211-aefb253cb549@linaro.org>
Date: Tue, 9 Jun 2026 15:17:21 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] arm64: dts: exynos: gs101: Add thermal management
 unit
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <20260603-acpm-tmu-v8-4-0f1810a356e6@linaro.org>
 <08d7299968e14e5fc07fa4791479abd9a2b11c2d.camel@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <08d7299968e14e5fc07fa4791479abd9a2b11c2d.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/9/26 2:44 PM, André Draszik wrote:
> Hi Tudor,
> 
Hi!

> On Wed, 2026-06-03 at 13:00 +0000, Tudor Ambarus wrote:
> 
>>
>> [...]
>>
>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> index 86933f22647b..b6866ef99fb3 100644
>> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>>
>> [...]
>>
>> @@ -639,6 +647,15 @@ watchdog_cl1: watchdog@10070000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		tmu_top: thermal-sensor@100a0000 {
>> +			compatible = "google,gs101-tmu-top";
>> +			reg = <0x100a0000 0x800>;
>> +			clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
>> +			interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			samsung,acpm-ipc = <&acpm_ipc>;
>> +			#thermal-sensor-cells = <1>;
> 
> Vendor-specific properties should always come after generic ones
> (samsung,... to move to end here).

Yes, thanks! I'll address this after I get some feedback on the driver
from the thermal maintainers.

Cheers,
ta 
