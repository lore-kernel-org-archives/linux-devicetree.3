Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531BE3B4E9E
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 22:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779314500; cv=none; b=j+HQCCx9YtkhOVyjDC7UCGbjMgsJvMKfOJ2vp89Z5GUn+pXJJ1y83poPNnCCgW6v2xynitFtOsoFN3+S18ot0TvCKFXvXjA5b+KrMXZrpXyn9O09LNGMFbOsHuYWvDT2ZluCcVFwJVYu2WE9NOhTn1IP22I6wfvhe54GGpwpkOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779314500; c=relaxed/simple;
	bh=RzpB14xk/2UzIGRN+1SLXmzPCeS1XLfL9h4CLr+vXao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WbybgFcaY9YSlE6UzAlqp8De6EgAJmD5xPvxfFc/3rq5NjkuGkVsl4e9JqFkNcGBdRUVn+SXPjoMHN8aDToNUEdCHTnSmfuxRwEjQYACMuxhdciHdjS+xGC0Us+mjmcpAl4YTVQKMkG0oP5UIU8PZa+lBs4EfsYcjD+iln0qy8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6B60xgB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6B60xgB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso27981675e9.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779314493; x=1779919293; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=29/pt5xtdIfWUNP2HMoH7lMK3K2QTJTzmuk9CehWO9A=;
        b=T6B60xgB6XrVWzNr50+yaExmQmiYsreJZJkqMigcYvwmHiBNl6d3Q4rc0E6mfXHN+g
         3CSfokcP8QKM2Q+Ahf44uk3oZbWiNlB7F9jGgmbpOQPoA62eIXH0jfFvdos85Q+VAKjf
         fA2eHxyfVVFFsGQ2w/oWGSkvHDiULefDqLiCIi+9xSB7CVPXaomqliRQQg97u2iq4UEE
         ZDNP9H/2M+IxeI2V05tixYyYsFG08alLyJdGWPNLFNwBR40UcmtEH8mXiZyGNK2tbrx1
         /iEDZ8fky1rEp6cuzXHBIrotozRP+NNluQuKHHv+VZM2SQ42TSc1U0LQm/430D1D2QYw
         uEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779314493; x=1779919293;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29/pt5xtdIfWUNP2HMoH7lMK3K2QTJTzmuk9CehWO9A=;
        b=Rpg8U59OlTWcb1bbjVRkRIdlG8N5keZegSyYBUg51c1Soa1USUuCNyGQlAvRZ6cYnf
         9FPpCIAGq45Sd2OlQ5pMQgcJAYWMWUD7j54hO4C2tvwPVrgLE/PvtrQCBs+WxEaXYqhL
         /i3lygWBhBfbhcAlrRpPHxYAFWu7g4MTO1vHyQkF5E+AvwT1zzdiRyMcesUQBz7HkFHI
         PwxDdUmNxy30hVAqy3SbT0RyHceStILliRHvV1ylymfkNs6XV0YhnhIHqTDwR61xWHsx
         xZc55h/ZHsZF7ph9RLYLCU6eBBKoWQhSqciMqY2q6/tqcMf7DHA83czFNZxKD21+wPs5
         IXpA==
X-Forwarded-Encrypted: i=1; AFNElJ/dfAIWQk/YFi+D7LBgwbUk8oeWYNqol0PdmfQic/KXGZSLLciz3EqrwQYkfGeoAeQxBbd9StecDEfX@vger.kernel.org
X-Gm-Message-State: AOJu0YwW3S9Fj9W6qyOBKNFYyb8wRUBN9si/tKXu9j9VhA5JjbchqJTJ
	nEacAIstI+Las81rUwXFB+JjctVuqidVSvejgtuF2KBeC88kY8iLpIo=
X-Gm-Gg: Acq92OFf2niCxlwig8EuFvTT7RtyusjNr2Pn9bgK9hqDiFHgBB1PqPGi0d1/uug3sP6
	3dwaoSAwAq/NaiNXyiRkMIsc2IBcLVG1io0oRL0L7rb/wcTuN2KwZAfW6c1d7VCoYZyHDi/9gpW
	2arXXOte21tFecWi1GTLPLZ61hTDOfqdCqMTKK53NedQHCr+9u0Uosty3wAaDWI1K1AS7REKf8M
	3WHIJce5KMWzxZAVVi5iSRIu1Ft00n8SyuStfHBH6AXnFmbHO98AagUoa/I9rt9uw4YbscOWUwM
	dfzdoapEL1AZeTbBSrwugQDiaNgqsHC9dWAyREc/LDiQc3zj1ERgqNguABBwjstZSJm9567JFq3
	fJG3O653cAFW529oqZhQ1ZC7xgQGM2ThJSWbei3n+VaTgHce+W6EXp5sWHqFZ9vwYv50lAXNpeg
	SbDqQA6YvBVEDPZfJWCFKTPK8fm0jESr8nh5L/BufVDtoTeFMGzL4DW1oW45l9I7ySQecuUl/8J
	OqrxrdoyrkLVJv9jUEZq+P5byxDDjOIAo2Agz4rmuqOQ7Gv5qqnRcKJ3dRqz1i7DoCwWg==
X-Received: by 2002:a05:600c:4688:b0:48e:8345:6f8f with SMTP id 5b1f17b1804b1-490360a8789mr2218195e9.18.1779314492259;
        Wed, 20 May 2026 15:01:32 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:52d:7400:bbd7:ca83:de4a:f625? (2a01cb08052d7400bbd7ca83de4af625.ipv6.abo.wanadoo.fr. [2a01:cb08:52d:7400:bbd7:ca83:de4a:f625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c22bd1sm1823845e9.2.2026.05.20.15.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 15:01:32 -0700 (PDT)
Message-ID: <ec232a52-795b-4f32-bcb4-2b6e5f8fc928@gmail.com>
Date: Thu, 21 May 2026 00:01:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] arm64: dts: qcom: sc8280xp-arcata: Enable backlight
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-2-9df52552bf87@gmail.com>
 <20260520165709.E485C1F00893@smtp.kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
In-Reply-To: <20260520165709.E485C1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/20/26 18:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The eDP backlight regulator (`vreg_edp_bl`) is mapped to the wrong PMIC for its enable GPIO, directly contradicting the hardware findings documented in the commit message.
> --
> 
> commit 5bb21a2e354ddc1fbe2cb4a72c610f631fc3961f
> Author: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> arm64: dts: qcom: sc8280xp-arcata: Enable backlight
> 
> This commit adds backlight nodes and enables the backlight so that it can be
> controlled with the buttons on Surface Pro Type Cover keyboards. The nodes
> are similar to the ThinkPad X13s but use a different enable GPIO for the
> vreg_edp_bl node.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
>> index f2b4470d4407f..14287092fb07e 100644
>> --- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
> [ ... ]
>> @@ -127,6 +137,22 @@ pmic_glink_con1_sbu: endpoint {
>>   		};
>>   	};
>>   
>> +	vreg_edp_bl: regulator-edp-bl {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_EDP_BL";
>> +		regulator-min-microvolt = <3600000>;
>> +		regulator-max-microvolt = <3600000>;
>> +
>> +		gpio = <&pmc8280c_gpios 6 GPIO_ACTIVE_HIGH>;
> 
> [Severity: High]
> Does this map to the correct PMIC for the enable GPIO?
> 
> The commit message explicitly states that the hardware match for the backlight
> enable GPIO was found at platform/c440000.spmi:pmic@3:gpio@8800 (which is
> gpio6).
> 
> According to sc8280xp-pmics.dtsi, pmic@3 corresponds to the pmc8280_2 PMIC and
> its pmc8280_2_gpios controller.
> 
> However, the patch configures the regulator and pinctrl to use pmc8280c_gpios,
> which is physically mapped to pmic@2.
> 
> Will this result in toggling the wrong physical pin on pmic@2 instead of
> enabling the eDP backlight?
> 
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&edp_bl_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
> 

I was skeptical at first but upon review I've tried the following patch:


diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts 
b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index f938e68c69ea..82e0a01276a8 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -198,7 +198,7 @@ vreg_edp_bl: regulator-edp-bl {
                 regulator-min-microvolt = <3600000>;
                 regulator-max-microvolt = <3600000>;

-               gpio = <&pmc8280c_gpios 6 GPIO_ACTIVE_HIGH>;
+               gpio = <&pmc8280_2_gpios 6 GPIO_ACTIVE_HIGH>;
                 enable-active-high;

                 pinctrl-0 = <&edp_bl_reg_en>;
@@ -1050,6 +1050,11 @@ vol_up_n: vol-up-n-state {
  };

  &pmc8280_2_gpios {
+       edp_bl_reg_en: edp-bl-reg-en-state {
+               pins = "gpio6";
+               function = "normal";
+       };
+
         wwan_sw_en: wwan-sw-en-state {
                 pins = "gpio1";
                 function = "normal";
@@ -1061,11 +1066,6 @@ edp_bl_pwm: edp-bl-pwm-state {
                 pins = "gpio8";
                 function = "func1";
         };
-
-       edp_bl_reg_en: edp-bl-reg-en-state {
-               pins = "gpio6";
-               function = "normal";
-       };
  };

  &pmr735a_gpios {



and ... backlight still works! It can also be enabled/disabled with:
    /sys/class/backlight/backlight/bl_power
as expected.

I have no clue why both gpio6 on pmc8280_2 and gpio6 on pmc8280c can 
enable and disable the backlight. Is it a common scenario, Johan?

Anyway, if I follow my own investigation fully based on the X13s 
reference and the properties of its backlight enable GPIO, I should 
switch to pmc8280_2 to use the better match.

I will update this patch in v2.

Jérôme
