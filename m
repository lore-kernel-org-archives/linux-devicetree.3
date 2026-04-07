Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1BE37C11E
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 21:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775597392; cv=none; b=ja7octOv+MHbwEqk2M4/IcOvyoHl8XMtbJ7mCc8bgcifpsVvYDJdkBgdDlN49maPZJJlaoQA9eQ4OFe0Clza9Pj6sZlv4gfA6fUDcqhD76G99qzdJE5TBhiMStqyH+axm1TAMTeneN3nfV1w1AvRkLVK2WIi3TlFajda26Zh73k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775597392; c=relaxed/simple;
	bh=LUzfOZ9YwviR8BFAgvfFpjUtsgdASt+x7nUVSfVWXho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ms37PdcYghbwhzqIe4O3rxSYvqI44o2J8e+H62qQD9W4ogfZk7MTQOXHshbauglLCkwq5WWxyBprMwsewEkepSaatGtdW4XiKgOzE+QDL44FDEZ/yjXDG/KoDIlR6bxLXJtcFwRFZVweHvZhsOSkUk9q6qtHOBf3w+8YtsaKWLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxDpTPiu; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxDpTPiu"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c19d23b19so1106740c88.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 14:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775597389; x=1776202189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rAsUgyG9UbQQ9jLOZH8SPojAcuCKJ8oZlGopHdK8NOY=;
        b=cxDpTPiuMFC4Jdp6Ap6ifTxYxdF8tKsDiDaqU6zlNLnKwAPRpLA4kvX4AVoLHw7YDQ
         cUAOAHIxmc0r78meBe6nXLBh81nauevq/PqineDbkvSQmWvmIJgjHBux7Ri8B8YKQeWI
         gBCsK6nywhMnDmPPOrzdu1ozAUYgA6d2YyQ6bQkw05WbzX/+UHDIlxvV+koMMGUVuMa4
         YxR++eDNoQ06wQGvm/lAEawl2R9mrEZFP3BWwa1AZpWFG0OTNFiakoxlJZOP7UYI04H/
         JKFUEjVzT84YCiIzZWXpXAy5qVH4K3Q11HH35TPVEWL54HmMDkfvukIpiqcQhEfhh7yN
         ILrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775597389; x=1776202189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAsUgyG9UbQQ9jLOZH8SPojAcuCKJ8oZlGopHdK8NOY=;
        b=MMKs/OMYSYhip6PoGI7GJ3QGUKuVsQLSgA1GSgr+1NDNYVPCNThAAKn5qcPcl2Y5Mx
         JzCe1LEe8m7dt/VZxWepeTiQQHiVqTwFDFKnISFdPG38zLMeP5t9bgL+lGC6imIk509x
         30WU1pYKLcVLBzberADn4h/7SDmxh5eRG9ehqGDozgBGKvZZPCQtSGP3TfxoAsZZ6n6j
         prc4fw0soHAjRLvgeYeGeooYcg8g4QsdkesyG7HCd0l0tcPQM3EQXw+gnbx05lv32BQm
         KLTmGELEXuQBcHd6MImr6JModSU37A5CmcFrYgTM9hD2i8snwbpu0J6jJO9xCKnE9WD2
         uBJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUflYH26cj75yNKyqZgZmA75Aii6Bwydt7i/R1ZYu46DFKV3lDZKz6t/7TP0h3RIFC1pn526PKktMeP@vger.kernel.org
X-Gm-Message-State: AOJu0YzpNkvQXJXFg6VeHMkSndi6ILestY7uWEB5fsucI4BEyC2sWoTe
	Kq/KVyonmVU7DYGfTajhO+F9nRVx0z+ktSWILqoYoSoK3RJaSH7Xl4cJ
X-Gm-Gg: AeBDietY4WnRxYV0996VN1MANuBEbQdtLvj31fVNQ4PBJOs6Xp1xt/bgioUymF8QCxA
	X5c9rqAqOWyV3OTg2raIrgyUcZI3+B3pnWgBPYZotVtTfJNPJ/f0zlsbMUz2meithS/4KAAk+Yh
	k/g2iyLu6j+cXg8uSiTt8HuURJZqAD0clBw41p0qehGjWPW4ublmwyxSLHjtBlpRgIVWOb80nn/
	mH8zH38ZlpUF8+KTZ6fsxt2h0513oeyx70Ng8k8HRzFWE7DWFQCv68KjuB77alyTkcLWvIpEdNv
	2S3sgomKYl1iKixpptw+r0ttI5gy0Zf/k/oS6brPKoy4n5nd6A0Z3/lORWo9XNtOWWYS0TP9ToJ
	+FWJmK7pHe0zdVVDCv2Y5+KxljLaBsCSZko6o6OSGAbQlt2G+aG+dIKm3cMVDXEpPua3w7ugt0N
	iKDsY5g3TkZsiGxSnHn4PuAN6F1ILu/B2llbAr/3uVLLBFUnx0COOuFtQs+slZHcY0MTZ/0Hkyr
	x4d/g==
X-Received: by 2002:a05:7023:b0c:b0:119:e56b:98a4 with SMTP id a92af1059eb24-12bfb700b66mr9474420c88.11.1775597389162;
        Tue, 07 Apr 2026 14:29:49 -0700 (PDT)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm22255462c88.0.2026.04.07.14.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 14:29:48 -0700 (PDT)
Message-ID: <ca3f183c-4237-4620-8738-6700d5a68146@gmail.com>
Date: Tue, 7 Apr 2026 14:29:48 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] ARM: dts: qcom: msm8960: expressatt: Sort node
 references and includes
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
 <20260401-expressatt_fuel_guage-v3-1-9674cfc0b5a2@gmail.com>
 <8e4ee378-113e-463d-8b21-eeef74b84120@kernel.org>
 <b8b04f36-2f4d-4d0e-b0af-a01d129a5199@gmail.com>
 <a27ee109-0716-45e9-9aa2-b58a57cbbd46@kernel.org>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <a27ee109-0716-45e9-9aa2-b58a57cbbd46@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/7/26 14:04, Krzysztof Kozlowski wrote:
> On 07/04/2026 22:39, Rudraksha Gupta wrote:
>> On 4/7/26 12:59, Krzysztof Kozlowski wrote:
>>> On 01/04/2026 22:32, Rudraksha Gupta via B4 Relay wrote:
>>>> From: Rudraksha Gupta <guptarud@gmail.com>
>>>>
>>>> Reorganize the DTS file for consistency with other msm8960 board files.
>>>>
>>>> Assisted-by: Claude:claude-opus-4.6
>>>> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
>>>> ---
>>>>    .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 408 +++++++++++----------
>>>>    1 file changed, 207 insertions(+), 201 deletions(-)
>>>>
>>> Sorry, but no. We are not taking Claude as one determining coding style.
>>> Are we going to do the work again the moment we come with proper tool?
>> There is no tool currently to auto format DTS, and doesn't seem to be
>> coming for a while:
>>
>> https://www.youtube.com/watch?v=cvoIbTL_ZQA
>>
>>
>> Claude didn't determine the coding style. I did based on sony-huashan,
>> which is already upstream:
>>
>> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
>>
>>
>> I just used Claude to do the manual work for me. In v2, I made sure the
>> diff before and after the change was nill. v3 included additional
>> changes requested by Konrad and some comments that I remembered during
>> prior attempts mainlining patch series for this device.
> IMO, it is just too risky to let Claude reorganize the nodes, but I
> assume reviewers of your code did run dtx_diff.
>
> If they did not, then it is on them :(

That's fair. I also re-ran my tests after DTS reorganization and they 
all work:

https://wiki.postmarketos.org/wiki/Samsung_Galaxy_Express_SGH-I437_(samsung-expressatt)#Testing


Also, I think I'm the only oddball using this device too, so minimal 
impact. Someone listed the I8730 model in the wiki page, but I believe 
that's a MSM8930 device.


Hopefully that reassures you. :)


Thanks,

Rudraksha


> Best regards,
> Krzysztof
