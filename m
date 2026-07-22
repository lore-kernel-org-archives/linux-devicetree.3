Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7DF343D8A
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784685176; cv=none; b=lrnpiquSAEgKBWv3zY9GJGALNbzdMto2NqIKUUcVovcRUNAz/xQS/wAJYRFZJF7RMw9LQW2nf7ZIhZMltDBmYptVuHBDE9zNFq7lMZQ1bG7Y6YKAbnpWTdN8HubYAPrlzaBx12jJGxHGA+YH6CsJqPh6mOeA6YfuJMCsE/PdITo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784685176; c=relaxed/simple;
	bh=wg4z4iYMd+KftkmIWByX2zZcL5mVsOnxvpqtNuh3aKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgx1MpmX3ZULC2clNxc2g2Ic2NDTNGqr3+iLQ6iEFTpltxVigCrcHlIfpYKF1ru/WfyttOYh71suWKh2NlNqUFPe2LWUJk0FZ7XZizJAR3+Uqe73FJzR48kTF/VH5aNBRT/2Rc5pAoz12BHW4l+vdZWZN+MMpkBkeca7ev/33JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYqhXvL9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gpLlYoP/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NYqhXvL9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gpLlYoP/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1COaE3275606
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CnE+UVT5W4QGFtLWhJ3bXaatQBvSFK8Z4xsF4Cr6siE=; b=NYqhXvL9pn0EynC3
	Q538fZ4MiKYbTuvSIyyHNEnepP9qUKYhVjX2ct/efNBJ9k8eQoBwvGMznC4AglD5
	qwRKH6oLhWAtPEDeFLAXYEBf3ELt0+ncwIrqTSJqcfbbfrmiD6WnBOp4ByJRHHJx
	6FmYbrf+McG1JJWW9WBFlHimCSVnEz+l6qZ3rKaHtgHSmnLUMgTye2xsYepbEez1
	r7G++GGtbXGFyHnRCGgz3zFBv4FnDdl8M50ccT7pMGHrTs1afm4hj6wYBv39WtpW
	Ys2xxYg/iIHwsYgnxzPbAslvPIj/VteznTM2TM8VEymweoL4CJo0hYwCtjPpoypZ
	cH+yeg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9aeb38t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:52:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so213793155ad.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784685173; x=1785289973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CnE+UVT5W4QGFtLWhJ3bXaatQBvSFK8Z4xsF4Cr6siE=;
        b=gpLlYoP/Q6cf+nFHd2cw0KCsno5qE8f2iD1CjjgRBkjv7EQ2X+3pXeg9g8CqFI8LLf
         mqAZEWSfcoND8P1du0Ms4x43CAkLc4pjHvAU0zboERsuyNzhhOtq7qriwZQw4qxBTS9r
         HMvAxo1KdBoA00nGAEj6u3zVR5jlxBh/lYGcT9tWbKSj4kH4DLomrKvnc+m6Ruh6BWB9
         MoQdhWCeoq6Mpk94kmFQfRN/Xi60teGfD3ECDXkERx/53oDP4bbYHC80kZWo/vLQTjQ+
         1hAfSl7vU9xFtk29MsoD/7rtNR2cLwr2QCEQ7q4xuKXGS5t7kwtz5uEbM9EfDQxPCIMk
         EKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784685173; x=1785289973;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CnE+UVT5W4QGFtLWhJ3bXaatQBvSFK8Z4xsF4Cr6siE=;
        b=Uii57SBUtfoqVSlZV5bbKASzK6yPmy58ilMLuLRF2APJZ45OwwHjlkq+QfT2kESgIE
         +i2LqflBkjC49clcfLB29IEd0EcVAbleeXGmWlK8usIqdg0ZCm8AuvQNu7TgB5+qC4yg
         mwUGuuP47R3guXgNDiXMYXPm7ThB4WJm79BfhH6EWYGGsY+WvvBhhXBuEfOALckn4ll2
         ESEFWPAxBbjs8mwNTKAGhoYGm0BfKj04zpD9VzyaZSpro0WI3aF3WULqvXowzMtiUKHr
         qYb6lA5Ui+bcblLUKnRZhNB1wimIYKJUjU2WeJtRKp2lPSfh0kwg/9ErHVIXWHBBpxAu
         iGwQ==
X-Forwarded-Encrypted: i=1; AHgh+RqCvGkuHaE51AS5OBPll6AKxDMIlP0cDUzXNVqvABOb51QBhW/GI51X2nQ6u3SqFm14zbmW0kRZG0ub@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3CE9t1iYX2aZDTPUtPgomAhUIlalVFvPj+iIZw05zI3QUla6R
	LczQ9chiIpG+9d5TgCinOTvCQ7HNywF9ktPRSxEUheNEGqpfGmPAF67UFkzbBPwUlkGrCRvMnmS
	XgozQFO3HZPALrVD20HLXkiuVcqhPD451dbHsn+h6iZus6LDG7khN2z09z5qeyNei
X-Gm-Gg: AR+sD10dRWxeYfZC1a5ZHuQmihxSuI5jrRw6YKMjHAK5/b0UmHL3NH5PwtlnneJffgN
	rFVwJw+VXrHE3Zje9Qi9gpY35SW2dDEBZWjILyIRQ+wLLywWRKZ/uF+jrvsDrj7qE0Uti+bzIwC
	+NNXB7NSzD8MtHSVwATQGRUB8jqaWm0Oqs4UntD3uif82p5Qmf4CsK5vojUNZTmdsvh4yV5gTFV
	vdE0Ou7zFkvC/2u5pI9OzGWAhlv2BPi0YyLUMdlUMdXYj7Wecenc1CxwOvx2XwWS9Ry6+ir8bSY
	klPAouPrBzY2jkz0CjlxAd7nwdGleBoCQuPcSf9+TXYU92tQIA0zjbNzmXl5l7P5Jjphq94Fq5i
	Jnc2RZr7HyihA3jpLSUxThhIfdWf1zGX65lkvFfTr0Wpjlah0Am3M9oNmHLuHcf4qH3rq
X-Received: by 2002:a17:902:e944:b0:2cc:f7c6:8320 with SMTP id d9443c01a7336-2cf34a28988mr205660975ad.46.1784685173081;
        Tue, 21 Jul 2026 18:52:53 -0700 (PDT)
X-Received: by 2002:a17:902:e944:b0:2cc:f7c6:8320 with SMTP id d9443c01a7336-2cf34a28988mr205660825ad.46.1784685172668;
        Tue, 21 Jul 2026 18:52:52 -0700 (PDT)
Received: from [192.168.1.9] ([122.177.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa39e9sm5675715ad.10.2026.07.21.18.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 18:52:51 -0700 (PDT)
Message-ID: <842b4369-3167-4247-a170-e62d5c78fce5@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 07:22:47 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: Enable USB controllers on Shikra
 CQS platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
 <20260721-usb-shikra-dt-v4-v4-2-2e7a092d7f27@oss.qualcomm.com>
 <mh63jqjocq2mm6h5dpqck6okfmsugjg7frrehmd5t6f3mynojc@tpfnitctm6ye>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <mh63jqjocq2mm6h5dpqck6okfmsugjg7frrehmd5t6f3mynojc@tpfnitctm6ye>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ASaJYMw6a6XeR1Kn3hmunCOblHmIHrHH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAxNSBTYWx0ZWRfXzs37xO2JXLCm
 31AhcCdMoeKGvu2AvYtAc+e2cwuLs+op3Zd0yhj47WDrrPMXnlVkRJ1ytl1HvpSUotQkdX5Wfj8
 +/1EYXRONos6B/0vdMdRSTiy/9Y6iig=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAxNSBTYWx0ZWRfX3eaw6G4WtK6F
 ahXS81NbQjWpWls7E8cEh6aH6XGbdvahYKWWCCWWaXNPnbid3oNjeAK/NV5Jm29M8pcmeru5Ort
 uFF5O0z8nUdPB5aWJwo5n4WwUgOG/cVdZqI/BjDbYFfJineko/c5fqTNN6+xgjj4rYg1AC8IiGV
 zN3JpzHJ7ng/vNfN7bF2Fhk81Kg7hNsvUnC3U2CQasG1SU8Zgy646tO8y5iIcbK4HTAtdXH01xv
 npKEXwM6itD8Me7z5GJ1Xkd7jJdkX9bVlYUwFfh2Kl4K9n3fkss1IEZDP81k0EMX7KzYbSytLz2
 4NuwNDC+H9svlSvJhlLJreqBGSP01msIXyMWgR6mCn/fYMky8n0yOrJ6qQ/zYb4uy1yGPWOaJSf
 hmxMOuNfJIaYKqRBVv5drD3iCTB+NRz52z4xPp3S9trOwXKjFzuTv/gwS4Dhn3MVmbYgt5UeU4V
 kUpx2zqN3lrsBnyq9rg==
X-Proofpoint-GUID: ASaJYMw6a6XeR1Kn3hmunCOblHmIHrHH
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a602276 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=cpTteeFDdnDplrLS3ufPgA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=idhYNPoMciAbT-xd-_EA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220015



On 7/22/2026 3:07 AM, Dmitry Baryshkov wrote:
> On Tue, Jul 21, 2026 at 03:23:46PM +0530, Krishna Kurapati wrote:
>> Enable both USB controllers in device mode on Shikra CQS platform.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 35 +++++++++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> index b3f19a64d7ae..006e24a62f5c 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> @@ -38,3 +38,38 @@ &sdhc_1 {
>>   
>>   	status = "okay";
>>   };
>> +
>> +&usb_1 {
>> +	dr_mode = "peripheral";
> 
> Why is peripheral-only?
> 

On First controller of CQS/CQM platforms, usb-role-swtich is controller 
by PM4125 and on second controller of CQS/CQM platforms, and both 
controllers of IQS, its controller by Cypress PD controller. I will push 
out the PM4125 changes in a different patch set since couple of issues 
are under debug. And the cypress pd controller changes are still under 
development. Hence enabled both controllers in device mode for now.

>> +
>> +	status = "okay";
>> +};
>> +
> 

