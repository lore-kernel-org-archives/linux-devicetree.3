Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFB335AC12
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 12:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782562832; cv=none; b=L9UQepKd3MKImXLI47E6M/6kr1gIY0diAjjp7vEIE754JM1WeeJwcrF5FU5ODzdcE7uYt9RQ9l+TcS1LJVNz15SUhvbLWhpZTClLuDyWruWlPxGS9muYwNq62yF1EEGojQZ4GcXe3CMdDdb6QpG/NWyj/uCJWfvmGB8GRVlQxYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782562832; c=relaxed/simple;
	bh=t8dpMT17hkzMMN+PsIDonumo4SS2Hi0jPaf3p9pBhvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h3IgGX7RFchb7M5jnPMe7IVZqpslXteUvWJsSQC8LF/QjRVH8UJ8gdHTO7clmgpTxlebxSQ4vp0PI132VOB2dTnl2210aTLiOnEucGqokutR3uLiBFeXV2rxojzMQSpiiDDJl8qyTLziFbeLawDlrlTtAAUu0Jg8/w0vdqbnhME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpsz4t1782562789t7a7c9406
X-QQ-Originating-IP: MMcO3H5Updz/13KjiVzaiYci4ttABBAs/FU7yjHTTeM=
Received: from [127.0.0.1] ( [119.98.234.251])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 27 Jun 2026 20:19:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16511041071073179787
Message-ID: <B5AFFA6368F94E1A+32e72222-ece6-42bf-8191-518165c1ae0d@radxa.com>
Date: Sat, 27 Jun 2026 20:19:46 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Fix DWC3 core register size
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>,
 Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260626-sc8280xp-fix-dwc3-reg-size-v1-1-ddcba897b19d@radxa.com>
 <f07dce35-f807-48bd-a04d-76d69ae74f37@oss.qualcomm.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <f07dce35-f807-48bd-a04d-76d69ae74f37@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: ODcDgdcDagQKAUGgH8xVs5EPOWfVBa42H9jVm8PBJ1UVDTs9f6i1LRpw
	qt+jxElA/yhygPMeoqoO/15yNYCZgAE+2y68p70MoDf7LhOchrV20Nk55sLh+7Z9aZLf3M0
	NcNYou4a164GvpGc3mMoHjrqnFkPvVx/TGcTe12EF3xf7YivnNGO2quaLYN11D5/kOjIxcp
	jl7egI9aLUwR1RNkvXG2UxujND3IOQ81BkXZQyunNJvPQ4+SaOOsK5J8rWynTWU+1cTF9KT
	PnGnJ10xEh1F8Ub4tlgHiSA/mvXNtD3kh2PKLN4xC97pmT9ZWOqrYV1zaF74Uy65/I6h3QA
	uVEyIeGCp6KnxOrwfjXW+HBzg5kV7CnfdhOy6EMda8KxmRedK4B6YXAwQJdLZ7XIxnRz9r3
	TEAConU28nlxeZzQxqh+huXom8rJ6uEq0gM2mRSNPqSgyBhknMnlqoFZTq5UEC5g7tq+YhK
	SxCGHRUGvtCMf4NK5CPWsXLzBkOHeNGqnCbkC1Uk5Cwj6HgYz+YzTbCRtHTOGjQ2R5DWKn1
	J9dmDM4sW65Zg3IM/woYcBZAehpmX4NhW+JFdeb2xLTed5cQHE/AsH7lJJnik7UaMCn0rLL
	sZTWebH+JClWVfz/zIplT0ylqPKD2iPWXntECGJ4zuaupZvBQN3623T9XjJB2z1AWIvj4+X
	Gc4LikN6l5r+c+e4eVjM7OYkxcEBpOdPVikp4Cc3yVEm+z10RQskJHCQQtFpQNf0KO6AvfU
	+Mj3pxP+9QDKjSPAybdRKqX+Yl8GkEwzdNx+pK7YZrMl4uH2cNFXy0nQhNSawcpFjKAaC0p
	wdbyfHy8Th6R0aIyKhFjbAIHypi88YZuvYf88suPPvRqgKIfqT5dTZg0V1n/xCp8OXto5kE
	D1K0/q2sKWqSIe9Gx+pE6ud10PL70+8OB0Ri+0IkEinVcDrFHQmKhY6d/KJ1taJICZcDjts
	nm/4u/S4XQsepYOZp2jiGOxiZchhhu9KzlOMowh2fjBmXAuBo4SGqg/BBQNMp2JqKuA0XSK
	+k+/eqMZHUbj64OqB+J+84AGe5UYLUBLFcDW4au2JNI/MNq9E3CeYrslfhpUY=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

On 6/26/2026 11:21 PM, Konrad Dybcio wrote:
> On 6/26/26 5:07 PM, Xilin Wu wrote:
>> The SC8280XP DWC3 core register regions are currently described as 0xcd00
>> bytes, but the hardware register block extends further. In particular, the
>> DWC_usb31 LLUCTL registers start at 0xd024 and are accessed by the DWC3
>> driver when a controller is limited to SuperSpeed using
>> maximum-speed = "super-speed".
>>
>> With the shorter resource, probing such a controller can fault when the
>> driver programs LLUCTL.FORCE_GEN1. Use the correct 0xd950-byte register
>> size for all SC8280XP DWC3 core instances.
>>
>> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
>> Fixes: 3170a2c906c6 ("arm64: dts: qcom: sc8280xp: Add USB DWC3 Multiport controller")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> index a2bd6b10e475..d06f79b7680c 100644
>> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> @@ -4034,7 +4034,7 @@ usb_2: usb@a4f8800 {
>>   
>>   			usb_2_dwc3: usb@a400000 {
>>   				compatible = "snps,dwc3";
>> -				reg = <0 0x0a400000 0 0xcd00>;
>> +				reg = <0 0x0a400000 0 0xd950>;
> 
> Let's do 0xfc100, the QC glue driver already does out-of-bounds
> accesses into the base+0xfxxx space..
> 
> Konrad
> 

sc8280xp dwc3 doesn't use the flattened binding. Using 0xfc100 would 
make it overlap with the parent glue resource.

-- 
Best regards,
Xilin Wu <sophon@radxa.com>
