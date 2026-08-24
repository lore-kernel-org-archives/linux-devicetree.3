Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A39DF76;
	Mon, 24 Aug 2026 00:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787529951; cv=none; b=QaX+wPUY0Jr5oTsaz+JmnYdrttcbqIhCKCdn1e85gcXKWOhMNS+U2LI0L9tXAvVzLY4NgtlIKlsK2lQtiCt2vQQ31mkCDCLQjRjIcykZS19OA+sZz0DxZcmmXVmxjhHaTqIq69cxIHTPNpDAqbl40E+Ue/Qw7lF5bGWkVOXwFCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787529951; c=relaxed/simple;
	bh=dYZ3DYxwp/TAv0AT+QspJtXohZSRzlEjNJeptHxNcuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LKXOWoXu7JjeiaQdtNoiW/SluJOXFTMAglAUZnfYPQZDZ7sd/dz4dzO1x//4aIzFwv0ETKwv2HjjdoKu1qmygiXl1387vLzhzI6reeXdf2JCy+4A7inbG4LKkGpdQHLQIOwbOu1SEnzychKnGNXpCgusE4vSN0X7L2indAUuChc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ikvW5eoZ; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=8EXw/jcO; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ikvW5eoZ";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="8EXw/jcO"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1787529805; bh=Mtec1r9+tmRQf+fEUoo0FB9
	VXGZNVIWU7qNJoDeUZ6A=; b=ikvW5eoZ9SvTmIhoC10+yXRvoDkVq1M0lGVpl52/3Dj+WDWB1t
	W+FxAwcgFOk9ViYMGpVe/aNtxd0njzUdJL/I+gomj4oPYhcwOfndaH3zEy2YYZ5FQMLoh+XtbNf
	XVcuIi6iV6m2exq5BQU8nV7RNo08aBvHAQ6h3Wl2lTzPqN2i3XJdb66w1Js86ou28EL2cm9tAr1
	p4QzPlXnFRYaep73UcBFDmT/yPpQQBwDdTmxGX1c0LRFWiANfCUn8ARarco+yLMl8fG/wrNwlTr
	f++/PytMPWwI39HMcRvtvNdE0yM9XRmKJG5tJenSen6uh5u9oqM1gWW7a28ktuGNeMw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1787529805; bh=Mtec1r9+tmRQf+fEUoo0FB9
	VXGZNVIWU7qNJoDeUZ6A=; b=8EXw/jcOiXy5RiUddiQ6upgxEs3eIA7/YrFjE236az0csubWnk
	c2pmIPROgyeItrL0cUIWiJ8LfVWjj3wQSfDg==;
Message-ID: <6933112f-dc14-4c3d-93f9-662c36987786@mainlining.org>
Date: Mon, 24 Aug 2026 03:03:22 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm7325-nothing-spacewar: Add ath11k
 calibration-variant
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Eugene Lepshy <fekz115@gmail.com>,
 Vasiliy Doylov <neko@altlinux.org>, Achill Gilgenast <achill@achill.org>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260802133203.259734-1-danila@mainlining.org>
 <2a11fedc-94a5-4709-871d-c63c46d0106d@oss.qualcomm.com>
Content-Language: en-US
From: Danila Tikhonov <danila@mainlining.org>
In-Reply-To: <2a11fedc-94a5-4709-871d-c63c46d0106d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Konrad,

Thank you for your message.

On 18/08/2026 14:49, Konrad Dybcio wrote:
> On 8/2/26 3:32 PM, Danila Tikhonov wrote:
>> The Nothing Phone (1) has its own calibration files for the WCN6750 used
>> with the ath11k driver. Add the calibration variant name to the DTS so
>> that the appropriate calibration files can be loaded from
>> linux-firmware.
>>
>> Nothing capitalizes its codenames, so the capitalization is intentional.
>>
>> Signed-off-by: Danila Tikhonov <danila@mainlining.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
>> index 1e78a42062c7..85811b5de4af 100644
>> --- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
>> @@ -1546,5 +1546,7 @@ &venus {
>>   };
>>   
>>   &wifi {
>> +	qcom,calibration-variant = "Nothing_Spacewar";
> Have you submitted that variant to the atheros mailing list?


I just did it and sent you a copy of the letter:
https://lore.kernel.org/all/fc1ce95e-f3a0-4534-a315-b091d389197e@mainlining.org


> Konrad

-- 
Best regards,
Danila

