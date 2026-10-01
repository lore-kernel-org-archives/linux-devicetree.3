Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4B5364926
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 08:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845015; cv=none; b=AAyqfdl5T1qBC2Bdm98Hwa9kga5e6ZLgMixZ4NU6tsDwlociosJhJleeOTSyP1Izy60/VAGaO76uRCLv5SaP9tLZUmA1WlL9bjS1jmhAnmgrsb8iWAEDglpqug55v6J+ZqzEqPUxHQSEbiJaS+ny21Bc1nKOBc9jaWqJB1I02dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845015; c=relaxed/simple;
	bh=l9pxoQjA2zp6vLUsaTL5foc7U7Q68PU0kX2DGu8OKQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nImA9f/H0uy1TnAh4782Minr/LhLwVgXZX23zVTnM2subSATbrGKByJS8wEvZ6rDH456JdH+msCkz5cCeDjLnwMwdmvGxCh5CpN4pGFGjQJo7DunKVRjHT/IPyO9gdmzcgq+Am+2uY8nGMcWCpV7RG0ZUi5gx7M9iPhVceaysPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMj5WqQM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LDAkCv9e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMj5WqQM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LDAkCv9e"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xnK6396316
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 08:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EqUyi3SAPTfoQDkj+nga/fJDEDVCPjeXmL/XvgQVSyw=; b=VMj5WqQM43bEd6Vx
	FnCuo2n3zzmQ1XMlLajfibxObBlAE793+qjbobEsWxBx11hy2b+HhTQv0HU09RdV
	xbqKTVNe8oY2YV10Pvwu20ay9Apu12mwFqdXrmWZ0OdUPxwZtCgY0nIRZTnJR2uC
	qi9uX+1cjfCppErgK5sTV8Ev65QJoLZZwMq+zE09UIA4hHaw1ReJ4ScengXMwboP
	NwtUuLb74VC3pQJXNR540WuNDOkbCbVPi/AlHPcknR7xTV5i698kw1accDnA57Wb
	hg0iIKBflgAGF2oYLHLXweyz47y5Va8rqsyuo82Gf8VbGRVsDpm8pAy8pvMJo3E/
	3Itvdg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh59x9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:56:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d55d8cd938so96402205ad.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 01:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790845013; x=1791449813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EqUyi3SAPTfoQDkj+nga/fJDEDVCPjeXmL/XvgQVSyw=;
        b=LDAkCv9e0E6rYRP0ac8QrLMCip/E3nYSzOmeUfTHfV5g0ZtP8xiIjrli+yIhXGDjJH
         pCFvEKkj91eeoMhep+TOjYLcuiXXX7F1UmMOTY+NwV4G9sE2PrclKQt6i/W95qWEdS7j
         tAKSTDr7MHTQnI4Sr+YU6Poom5UHMpFxcdMqDnk1lDfXuoYQDkomWO1hPrVm+ZihBJ0K
         fhSoLGcpZ96PvzTVq9Qt23pRu5311ainPMqmlo7XMk86v3fT/6a3PaZ3JGEkrXCUIGPt
         odP1B0e0dGMdD5+GRD3URXkSt+OA7H72Ib7jRrlAuL6FMH1St+BU75HmyfAJD7Jrdxqk
         yXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790845013; x=1791449813;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EqUyi3SAPTfoQDkj+nga/fJDEDVCPjeXmL/XvgQVSyw=;
        b=NXjel+AeOsJpGqIN+vWEx2+ai/vf2peV/1/PatwRJm6n5zVXLJKT6L6HVvwyhDCEXU
         KHyDEiVhAQBof3nN4z+6Ynl58CIdcX4OZ0wuSWpE36GbslmpBnIHxKSeso6RDZrCt04r
         3j3oexIg7zZ+kDeVDyOEdWq60pl2TUqLBgQtuh2pjK1CZiovFdG2SCcbO3xeMjO9vRoZ
         TWEvFEuY3bXGjlXOGf5DPTnqjExS/q+Ve/JQ9pe/v4SwR14jfO0+9gvnsMJ/Z0We8UjQ
         a3FrcTCS70IZdxLsf2tYLe5+sFN2qe1WZO5DtaDJ7P2LDmlmd1CmUOBZL5BDVTdTmdfc
         BUaA==
X-Forwarded-Encrypted: i=1; AKwUvBza17ppU7aFyyS7z22/YGSwD4Av+rBsXULzBt93x16U7iuZtbY88UDhVq02sZFIyOEAqXLH7iox5s5Z@vger.kernel.org
X-Gm-Message-State: AFq9FYLAKxvyg9ShA112TkCIFr6V+8djfKe08aPDb3hRvAEcSX1nzCYe
	8W/ki0KxPLYSTcFqILwtHpl5/PC8Nkbz2gt3ZoYGmBp+g9SyoR8KJYIFThKvPbX0+CUH2EIV5tZ
	SqpO3qJ02KKbPCJ0zk62tu4M4NylQkErIQtakVoox1Lpm3NM1b3EDb5JyMx0Kwl/j
X-Gm-Gg: AYBFou0Z8DWugVPtKOMT2h6K1wQhwIGhxJKGlSM30TVWzwBf+lr7zxRXMvHP6rvlmj8
	HgYslUHtN4fygdT2IWVsrYELS3VphSyU0EeyRd9Qy/49L/0x6/rtAfLWL6T+i/GQ5zGwi7QcMkO
	T9onntTj2z/x+//d2lLXqyGX3zNJv/KXcxWHHaTsRo4kLuJXiDy7dayaiCw4q8AXnEbVMKr7xbd
	nyjKReaOtU9gR0W4moNki1Y7zXAtugblEGNKxCqkyjg6ORUb5nCElWaL6hinTzpwUg8OdFscmaj
	tp7NmD4yvBAGUFg9559+GbBpJGxXpzL9hl9CmZSsMwBT26EhehFRobVkyU1v0TPom9GgZY5PMiE
	q1R2Wc+3H17PzO6MafC8GdsAdHXE=
X-Received: by 2002:a17:903:298b:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2e2e48adb18mr33422505ad.5.1790845012902;
        Thu, 01 Oct 2026 01:56:52 -0700 (PDT)
X-Received: by 2002:a17:903:298b:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2e2e48adb18mr33422385ad.5.1790845012367;
        Thu, 01 Oct 2026 01:56:52 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300ac9f91sm7647745ad.34.2026.10.01.01.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:56:51 -0700 (PDT)
Message-ID: <1a59e842-c66b-44fd-936c-6895bc1e4e37@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 14:26:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra-evk: Add GPIO expanders
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260929-shikra-gpio-expander-v2-1-98ea5808c4a6@oss.qualcomm.com>
 <20260929084445.877431F00899@smtp.kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260929084445.877431F00899@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNSBTYWx0ZWRfX5L7xYgPqUFY8
 gC+jWnXDjdNqLRN+jUsyWYq/0R4YuwqV9Ur8T+REQYBHl4tVRRLl1Xkia5dkfKKpOaeN6hSnOxp
 omjr+1T8KBQbVzbIfMO/dkb0KwIC6f4tAHkRTVmSRm3IyQeFnXG0g0hd8XTshHX/0fyEiQ6MELP
 wYNQEq0qeuv9dsNjpjGfh0ZscW7C/G2/5/O7hHDmKKUHngihv4ynmFGRys6h4o57MP3uj8ivGzP
 X+Wb/cSNQJRZCCs9LMFxoQhWNNb6PBqNz2/6E+arW1OFfOHPlK3clEwO/vjfPt0FbR1iIigXUNu
 EUMHKfnIJUlN0cqCQqHHLdMKdrOSk02wEFr4vziiM/FiYtMIEPG/INq2+TCKbE7drhbNuJhAGm7
 VG0zVK0+jRqxZ/hbv3CP7UF3PzXNJsPpWhg2uZKkHxmzQoV9t59YtVpYmCfV36a+/9whNX/RAGJ
 gEy0Xvzfk4EY4eZAceA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNSBTYWx0ZWRfX47bSWzJUEoai
 7ga9v3UDsLlVfAA7xU7HtkPfyuvlbfTVkRIqDM8y9CQd/d1cyqJDd7GN56jxS4qIiJJ2gJKBRbC
 k8WMW2hbD9heFsNN8VnO2LCaMZ62Jj8=
X-Proofpoint-ORIG-GUID: -4XORpRyGQ0tnxrnT9Sob0Pni5E3j7O0
X-Proofpoint-GUID: -4XORpRyGQ0tnxrnT9Sob0Pni5E3j7O0
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abe2055 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VLX9wKi361tmcy8YDwEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010035

On 9/29/2026 2:14 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Low] dts: incorrect hardware compatible string for GPIO expanders
> - [Low] dts: devicetree schema violation for GPIO node names
> - [Low] dts: unsorted i2c child nodes
> --
>
> commit 9c266369a865f519d07da1f291fbd2938e091d86
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> arm64: dts: qcom: shikra-evk: Add GPIO expanders
>
> This commit adds the EVK GPIO expander definitions to the I2C3 bus for the
> shikra-evk board. It describes the TCA9538 and TCA9539 expanders used by
> the EVK boards.
>
> Link: https://lore.kernel.org/r/20260924-shikra-gpio-expander-v1-1-71929498ea44@oss.qualcomm.com
>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> index da484887110b0..ecc6301179400 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> @@ -11,6 +11,38 @@ &gpu_zap_shader {
>>   	firmware-name = "qcom/shikra/a704_zap.mbn";
>>   };
>>   
>> +&i2c3 {
>> +	status = "okay";
>> +
>> +	expander0: pca953x@38 {
> [Severity: Low]
> Should the child nodes of the i2c3 bus be sorted by unit address in
> ascending order? The node at unit address 38 currently precedes the nodes
> at unit addresses 20 and 21.

I will reorder child nodes by ascending unit address in next revision.

>
> [Severity: Low]
> Should this node be named gpio@38 instead of pca953x@38? The generic node
> name recommendation suggests using 'gpio', which helps avoid dt-schema
> validation warnings during dtbs_check.

Agree. I will rename it to gpio@38 in next revision.

>
>> +		compatible = "ti,tca9538";
>> +		reg = <0x38>;
> [Severity: Low]
> Does the TCA9538 hardware actually support the 0x38 I2C address? The 0x38
> address natively belongs to a TCA9554A or PCA9534A. While the gpio-pca953x
> driver abstracts these expanders using identical logic, should the
> devicetree accurately describe the physical hardware limitations?

The hardware configuration, including assigned I2C address, has been 
verified against board schematics. The address assignment in this design 
is intentional. Same applies for TCA9539 hardware.

>
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
>> +	expander1: pca953x@3c {
>> +		compatible = "ti,tca9538";
>> +		reg = <0x3c>;
> [Severity: Low]
> Is this address physically possible for a TCA9538? Configuring an offset
> of +4 requires an A2 address pin, which the TCA9538 physically lacks.

This is correct, has been verified against board schematics.

Thanks
Komal

>
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
>> +	expander2: pca953x@20 {
>> +		compatible = "ti,tca9539";
>> +		reg = <0x20>;
> [Severity: Low]
> Does this setup actually use a TCA9539, or might it be a TCA9535? The I2C
> address 0x20 natively belongs to a TCA9535, so this compatible string claims
> hardware at an address it cannot physically occupy.
>
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
>> +	expander3: pca953x@21 {
>> +		compatible = "ti,tca9539";
>> +		reg = <0x21>;
> [Severity: Low]
> Similar to the node above, does this represent a TCA9535? Address 0x21
> is the hardware address for a TCA9535, not a TCA9539.
>
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +};
> [ ... ]
>

