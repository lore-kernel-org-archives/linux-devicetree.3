Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775C12BDC32
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 17:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779386260; cv=none; b=IPgttl7NLpqHGwsuxCZxwltFhGrhKNN09MOeF8MlDeUBDagHCFXkFQAnQvr0o83W8+EUbIyHo2x5MY+QzJGOCG/yUwe06FUZlDe8vfYQVdPuFlUuvLL1AxJ6XVDXE1sWKXlmPrGD8Ki7XI0RRhCDjtta6y4fug1fl1h1l2BznD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779386260; c=relaxed/simple;
	bh=xFmemDVgnr2azGMiC2daYpx3i+eCsGeDZTwp9hgqNlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CgHXzj6IbrsjTa+1bwXomC92S8h/xkA3vRqJ9pIxYCXzCcz7of0+yx2qNFI7MZ34KGYRmQGulX55XndXTDPJyUjXiAVB288bxR465OVsPiGRpU/BwED8knLiZWsgxijjHKZWHaGIMN7XWJq3VR/ntd5T5h9Qjn3g5r7bURGbC6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p/xgWpQH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/xgWpQH"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso6896705e9.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779386258; x=1779991058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gylbKCiCuocOK7umlWhz6aOgovCb2toi5YR+NyOexAY=;
        b=p/xgWpQHIJmFyFhjT/gSY+ScGe80MOkbw3CwlxtQVBRenMRqSLSzHDVgO9bVkf7FYq
         VmePIE8JtD8wrj4909vUt4jHw7s52XM4/U1Kp7CEXD6DzVHzYGyLeqFc3O8dX/JaD6Dl
         oyUIdrnsgHtGxOraMc9A5cFRA6bajygSdIX7gdjUeFD/a5kB45TTArT7aQuxrmq6TBVW
         vYjZGGgmhzR3YMkahF0kzf5du/PvTwOFqf/H/gZ7VIAOMlFkVd4ZcTFMl+lPtiosql3X
         yZbjgQgmK1mfVPL+LoRTzO5N94ivQrsq/q5/wNuRYOZXMHG7fFEUFnY3WexDbLqLN4gd
         a+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779386258; x=1779991058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gylbKCiCuocOK7umlWhz6aOgovCb2toi5YR+NyOexAY=;
        b=oau/KFvgdyZnYTKHs2VD13uFGamMak+XVEdYf3MMIDWyawOBdHXuW7XbF7flf3hNB/
         9BjA8wISYo9AHe9rlK6GWtAXfYqpZ/X78KakV4d5eayZprvMosQBoxa+0qHOf9pmSxdP
         t0XcbodtTDRKd9kopHn3JUE5lWmRPeSVEMqB47uKKlIntp6fE7g3U6RLL+R1FIEh+pjf
         aCwb8RhWH6d0lMLgG+isbbwOp+JN3qlvx8axRks/IB7lKC+2qwd+1Ct8UG/NNLqQHJy4
         5p7iOBKCgDXmng4BLJdD+fWqbwXnet6DMm/HHRqhTwdn81Drb+xeV9+m6wUpekpK9HX0
         9tOw==
X-Forwarded-Encrypted: i=1; AFNElJ9VJMYh71GmnvX4pizmGFg/na0Q0gaXYxuYwBnVo5QCRuk23HdWzOw4YYgMnCOEEP8ezhKhFb5lWrjJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzeN908uTH1KfbC511Ll2UpMuAp9DTM28U3FY9fA7Ucfk0AFqid
	3Va768OrFS8373GTfOfAw2z0E5k/T64//RSP5tdPErsclcex09RW9D4=
X-Gm-Gg: Acq92OElt4ctHDDUwopHAxNklSB/aj4etwzrSMyKY5TYPJvSYkpKE0x9snyJCH5puk+
	qOaGL27e8iMfCG801taiYjCyEuRQky2pIC77z3K7TXO724EZzQEdq644uCYiiN15TBMEXI3NJNx
	T6r+L0nj47kLEsM8CQYIHrNPd5Vi3j+w6/ngaN7halBmCa/3QaF4GlVfpzvwozZmqUDwjaFmCWz
	A3I1jzXK5AhLo466dGgfNSsp5aZQ0rVZ7MJessbFoEFCVPQjNR/zkqrzomwbyKvXQU5oEo/528R
	fshpuyTxgvvRSabb5Bl1jSFuIENHTnJ4QRlejRhycWgpJioiHmQAMTOstqhB7yEarZWvvBpBmAj
	ZaD0HnEk9Atobw0dbiSY1xd8OpkzqHTE3547oSL7rE0+3MgAmNV4KXUaDo5E7Bm1vuun8M2d5EP
	y3fnAnITYEhViIVoP1PMjIS46Plm8bDOY7X2l0uRzVaHrhsQCohtdwp5LBAruJc7DK1pThRJ18s
	dW4MRPVXrE4tzRBQCaBczd4X9XqG7dmU04GU7cyd5XPkHlUZDl7+MxLQj5gB4UnPC4YYw==
X-Received: by 2002:a05:600c:c084:b0:489:1a3a:9e45 with SMTP id 5b1f17b1804b1-490360d2970mr47342025e9.26.1779386257641;
        Thu, 21 May 2026 10:57:37 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:52d:7400:bbd7:ca83:de4a:f625? (2a01cb08052d7400bbd7ca83de4af625.ipv6.abo.wanadoo.fr. [2a01:cb08:52d:7400:bbd7:ca83:de4a:f625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033dab0besm74323395e9.15.2026.05.21.10.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 10:57:37 -0700 (PDT)
Message-ID: <9eddfa15-ec2e-4d3c-8d55-2be5a974866f@gmail.com>
Date: Thu, 21 May 2026 19:57:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] arm64: dts: qcom: sc8280xp-arcata: Enable backlight
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-2-9df52552bf87@gmail.com>
 <f5f70aa2-a1b8-40e0-838f-6709e6e08a5a@gmail.com>
 <624a780c-0b22-45e3-aec5-e61c319de901@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
In-Reply-To: <624a780c-0b22-45e3-aec5-e61c319de901@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/21/26 10:48, Konrad Dybcio wrote:
> On 5/21/26 12:26 AM, Jérôme de Bretagne wrote:
>> On 5/20/26 18:40, Jérôme de Bretagne via B4 Relay wrote:
>>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>
>>> Add backlight nodes and enable backlight so that it can be controlled
>>> with the corresponding buttons found on Surface Pro Type Cover keyboards.
>>>
>>> The nodes are almost identical to the ones from the ThinkPad X13s with
>>> a different enable GPIO for the vreg_edp_bl node.
>>>
>>> The difference was found by looking at the output of /sys/kernel/debug/gpio
>>> on the ThinkPad X13s to see the properties of its enable gpio9:
> 
> [...]
> 
>> and ... backlight still works! It can also be enabled/disabled with:
>>    /sys/class/backlight/backlight/bl_power
>> as expected.
>>
>> I have no clue why both gpio6 on pmc8280_2 and gpio6 on pmc8280c can enable and disable the backlight. Is it a common scenario?
> 
> Could it be that one of them is an ENABLE_BL pin, while the other one
> enables the regulator?
> 
> Konrad

I've looked at more device trees and seen that quite a few of them
simply don't have a "power-supply = <&vreg_edp_bl>" property in their
backlight node. Trying a similar approach, the backlight still works
so the gpio6 I was adding wasn't used (or even useful).

I will send a simpler patch in v2, removing the power-supply property
and the vreg_edp_bl & edp_bl_reg_en nodes.

Jérôme

