Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CF73C3787
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762546; cv=none; b=FlZlF0W2xyo0h9orYg4oOhNLQ5GSJWHb/V8jWPnzM9f2zAFpjPsjDEaKNnBLzUlayTQPFvifIL/+msbn3XJH9w+uH0fgKGDrhmM2sXZV+XjkPglx94grtIZjGIcKL//ZEMzNs6bevlhzBWIcbhwck227DT66IGchukNAWxjRmII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762546; c=relaxed/simple;
	bh=eJocVqgZC1LZ73uhvhGrTfsM5JBh1CAAbm6cuy+2k/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LUmzs1/Ik7HSZ61e0He3zfszXoglryQ95Q/tyWYYP371tVWkzAlUs4dQvaZWXxlXl7jQf3P+zltO+TDASmDQ9/ZNk+JUpjig0OqZsYdPltPZZcGKpDDpQyYBX0fC0XdpgHyfTqX3xzwKkxhrubCYPMftUWKXAR6SRXZubOQYewI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kK6mDofg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y4xjERmC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kK6mDofg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y4xjERmC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dQ8i2119059
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MPe77bI+fMFp1YsFWGh66THD7WQb0kpPqkpc9dkIEeY=; b=kK6mDofg1UYweraG
	FTYCsXqg8/0YygMTj5WZt9+hbTg+7Qdmeq4YjzSfCCgwUrtRb+nOegy0a9kAPzhl
	gdbIwnmL6JwOt8cAl1e0TA053uR8sK5zU4fmA8ejq2KuIUd2oHksgLk1cQWHU07T
	g7bkBkZcD7zH9/CLMm1A+UqJ+y8XJsH18kU94M+YUFp4BX80Tx0PIcT6wfAzz3jS
	1uidX+mWoPWTWpwIbxO4IuUpFIQv3Czert8/hGV/WVzYXwyr+144TK75VEgYwgR6
	O+LRnzHd6fdo7L0AVbK4LCJCgdjKDwGhcq9z2faaf6XdCCukOp5j3XcqQUhchvRQ
	d0sVew==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhej5qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:02:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso5392390a91.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 03:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790762542; x=1791367342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MPe77bI+fMFp1YsFWGh66THD7WQb0kpPqkpc9dkIEeY=;
        b=Y4xjERmCMcXF5VYmhsSbQlMXZBxOAMAGZdZanK81pdjND7DXV75/j+rcEeeSV4ftRY
         mObydIDapSlqq1BlUBuyArJfwaYzzl0vxnGXFV58Z2HJim71oJnVWz1VDYvdFoRZU67c
         F826BQffbvehbOlhzY6dZDfPb8kJKa+X0v+oSvJhW+i++ynxbQQ9F05tTPi8lV3GJum3
         zfPYtMWvT1HVTJPr8yEcecnIIvsviS6aevA1f+82x8IZR8NvP4ZarE/mkOZIRWhzsXtm
         hFtln/u1Moxbv9xFEm2SpDmDo3zYnkISGY7uJo2GZrF2U3NPBKxO27qcMteQCcwy6msT
         UznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790762542; x=1791367342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MPe77bI+fMFp1YsFWGh66THD7WQb0kpPqkpc9dkIEeY=;
        b=fkMZzW1qsK8Ghr2eRbO4PSQaI7Jm8z1C3omNw7oc0jc+il3sBGsfYakgXRYV/fiJv5
         mK0ghLhTAL1fAp6phaAuSoX0s0HEFrc6HQnIm94+6K65WWTeIPrgCmMKbR9e5tzcPRYG
         /398q9aWnLkBSOoDvayGbek2cxFgCwegavP+Uol7UyIJw9FJ2LIzZ9fyz1B8kM1U+3ZU
         RxJNdazg1BpHzS3/GhTecGwU/JMbCcDqEWklYmuTLWwFy6iwEiHUEGwIgZI77RDU1hjc
         xrNaeUzs0dwmJHx4M5DIi2LvE5tSk49KNKlkf5BmWjOyLsviZDyOVhXuPO/eFFaAgV9s
         Ak5A==
X-Forwarded-Encrypted: i=1; AKwUvBxp2Gh8++b0K2Yh3ExfrowLMdVCVkUNAE3nun+LGTt5e5UHRb2lFVnryNqkme1VqFvJ96ndPOp8hqRg@vger.kernel.org
X-Gm-Message-State: AFq9FYJy1DB63mf9LjbIC5SMCWU7dvw+gmsJfP41K0gT4EalHjHdynjq
	JaabuVxTo3+/4UJLglz9nB8WU9wrj7bU6xH3vnKVo7hWJQAbB8ICMuO4EVSXlJgMVBIIhIzxh0d
	C1DOyUNKDSSEGsj7eaVhVmt51sK4Wanb7AnxgP/ZNa5J+ZJPj99dxv9pYxq5rsa8c
X-Gm-Gg: AYBFou3emH13yi0hU2h15m7F6u0NzMSzzGEglJ1FZ8uQdJN3ucEDGdnMzWhXOTFArn3
	KsAwc6wOAoP6/0KDw9oOZIL8nEmobtjpug6WNWWcNi+v4aFgIm9elnT9i2ibgSf2lUL6gBZqwqF
	zyy3X8twP/RyoVtlg3RHXexRYjqTQhvXszoY2c+EEzPIXC93S68+rLtTsOoRf+JROYjBpVBjXcB
	LxQ6B1ALfPsL4ZA46wK2ejib58O7c2CusnBHEiZyW4nccxzggaMFXkMZuoBlEwuj7iMYymdXTJo
	Roi7I3ueBq0cq4Vi77iqt1xEMisvodI6IA9jcnD0A7C8XAp1ZX9RqjuwqFm1F7AO2yMLzLmMZ4C
	nLeOrWKk9dshu3hbDTxADpuZeKoHq3LaRPA==
X-Received: by 2002:a17:90b:1d46:b0:3a4:cfc2:3517 with SMTP id 98e67ed59e1d1-3a4d1b5dee4mr770898a91.49.1790762542411;
        Wed, 30 Sep 2026 03:02:22 -0700 (PDT)
X-Received: by 2002:a17:90b:1d46:b0:3a4:cfc2:3517 with SMTP id 98e67ed59e1d1-3a4d1b5dee4mr770865a91.49.1790762541848;
        Wed, 30 Sep 2026 03:02:21 -0700 (PDT)
Received: from [10.92.215.224] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4cb194b86sm2880249a91.2.2026.09.30.03.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:02:20 -0700 (PDT)
Message-ID: <050bed16-c250-4cab-baab-d3b766668f17@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 15:32:11 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor
 node
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-7-f5ca00889cf7@oss.qualcomm.com>
 <szrhaamkkvvhwcs67mrptuigkmgel5jixo2bqgk6rwi2kn3jdu@a275fnea2vlf>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <szrhaamkkvvhwcs67mrptuigkmgel5jixo2bqgk6rwi2kn3jdu@a275fnea2vlf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wqDvapkZ_RuRx_0bHnU6te2McDPVzu3y
X-Proofpoint-ORIG-GUID: wqDvapkZ_RuRx_0bHnU6te2McDPVzu3y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzOSBTYWx0ZWRfX5WRbopqOOn++
 VK+umVren8cxyWM506X4qWfGun3m4oBygsspPBNcTiCIhV8BOv7+jY0M+bE4SsWbt23kcSvFau8
 UZ7wK+PcsOgk5rSLg0nVJNMJkWqvt6QKkNOBhxTT5WCW2sh6Zgn6H22+V/wpK3XQo2PJPztTI9w
 RJNvJlr/gOnBd4e66kOUbK1265XLIxREfjnbjm5slnG8788A7FZ9Bc1ikc2NACOsDMSP4QW4OR7
 Fd+lfWpCje73DEwEw0wtRjeUOHo22FysD2hwMuY5GWAIypt6rrivnR9gaO03Cv869Ct/MSjCIEw
 Uhv5Y2dY81bwCMma/CK/jS03GRygtlgwwSLubKePw7Yo/FOkVRP8QdQ3CXFyCMA367B2Jkwo4di
 EdxJeJiUycROX8mgFvoB4NbLBE/Fg6eaQZ6uClZ/gUqunbWalleGWx8y+kU1cRnrZvYUZMzlIcE
 i4bOaM80KVzunlH8XVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzOSBTYWx0ZWRfXyxSzcP+YykTI
 D5+n0WSlbTiTfdDXoa7CA+uMDWmBMIcmgLcG1MKCIyPduvR92M+RbsG5aDOTd4iXAhpuTnM9wDn
 wsMNlrUhGMVFreDoMwUSrHHErpLUBnU=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abcde2f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9t18G-HS6d7wqxctyjgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300039

Hi Abel,

On 9/29/2026 6:45 PM, Abel Vesa wrote:
> On 26-09-29 18:39:39, Manaf Meethalavalappu Pallikunhi wrote:
>> Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
>> PMIC. The BCL monitors battery voltage and current, providing hardware
>> interrupts when configurable thresholds are violated.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/pm8350c.dtsi | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> index 1a24e6439e36..52b5fc1ef9a3 100644
>> --- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> @@ -20,6 +20,17 @@ pm8350c_temp_alarm: temp-alarm@a00 {
>>   			#thermal-sensor-cells = <0>;
>>   		};
>>   
>> +		sensor@4700 {
>> +			compatible = "qcom,pm8350c-bcl";
>> +			reg = <0x4700>;
>> +			interrupts = <0x2 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x2 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x2 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "max-min",
>> +					  "critical",
>> +					  "emergency";
>> +		};
>> +
>>   		pm8350c_gpios: gpio@8800 {
>>   			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
>>   			reg = <0x8800>;
>> @@ -41,6 +52,7 @@ pm8350c_pwm: pwm {
>>   			#pwm-cells = <2>;
>>   			status = "disabled";
>>   		};
>> +
> 
> Drop this new empty line.

Thanks for review, will fix it in next revision.

Thanks,
Manaf>
>>   	};
>>   };
>>   
>>
>> -- 
>> 2.43.0
>>

