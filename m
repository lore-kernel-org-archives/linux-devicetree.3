Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221E42C15A0
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 08:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411711; cv=none; b=lzagSE0fV0j/HOl72uhI9HmxKOlE6bYIH9Vsxn2+/BiJkNmjDDoRV3xUXlv7ZOru3gfAc5aPf/e8X/19RLi7/J8LCau2mzFcI+9c2FAQzvTZjPTIFTRRC7PXGJvgFSCczifCyZsR0XJZo2+xUs1Z7bDQoQqVfj93Qx5Yg38JFBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411711; c=relaxed/simple;
	bh=A2SY17CAeZ/j2znh/Nh29scTgcl8twuNHXIs5ZQBXac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L4QRXCcZaTYCr/cIDKpf/E+CCF6gOGmmfj/3TglkOJy+KsGYhw5QenId8O+STpsw1+T1Xb6e3Xbrxtb3EQpF11zqSLWXEZXCbL47pgv3xo7/V9ppFVYrY5Ec5X77+8ltg0llhbhhBz5D7GnpqrFSXzTaGmdzS58/Y0SLzNCJDck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjChqHs/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbZD9G4H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjChqHs/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbZD9G4H"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748gQ82449770
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 08:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TNCFc4M275i5hqwVvMbqgQb+aYFA0UWni3Igt//9OC0=; b=JjChqHs/Y0ehLuj9
	+Ek57vIafHifloHM5Kj5V7Q5pLcWdKiLeC8D1eR4Xlto8WqLlt1PDw8LV2h81EhT
	w9NfbePsgKMT17eiwjHJQwcxdjKjHH2tWczk+AY5U7Br3/8XRCpZfl8vr/DL2hzT
	ovFeczrWWTfSiJUJ1cUPIbogrRfhfPmNLtJItBIjU15L/Edt4cXG9TamUStaHpSt
	Xm5oT6/NDi6KP3t4FTfLvCja+AFrh/UoRRurLs/0MWH0GHKoOlymRQo8CS5/x6/K
	namP9jFL8NamLaKj7qm3x20gwxEUq5Ukwe2n9TEqv6d6v/MfchaF47CrjK2h0sb3
	YD/F2Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su70vp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 08:08:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0199faafso43956841cf.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 01:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783411707; x=1784016507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TNCFc4M275i5hqwVvMbqgQb+aYFA0UWni3Igt//9OC0=;
        b=ZbZD9G4HNYGNP7CDGb/4z5JJlIshgyJYP/AZYJpe3ZK1UoaFvnjBi6acRo9msvdr7K
         q3ss7Rda+CPvXK3PtCQlVR/BUaXNlCen8ukTiApEhDbz8WYI2LpufyB/pVW9xkh8NBxc
         jB6oej8pLrmUPkvfbritqudR2xfTTu3nPqN4LX95LjR5M8rm53hhWotPh2ka9Gb8vbPW
         maKKcbIdvIY+gme/Kwhi74Lxyyug/kNMZ3nc3GRcARbYl/dlJlbVCItuJ2Sb7i7x7y6V
         kViHV2AvF3NlBHcVs7egfGUas1TDSCmVP86RuJlCGHGbtQaMlS9A8RlexBFotakgGybV
         lMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783411707; x=1784016507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNCFc4M275i5hqwVvMbqgQb+aYFA0UWni3Igt//9OC0=;
        b=XwydUZYeRcUcBA9x/fixk8zs75E8EkZNNpZPVbCI3PabwW7iSEl19G5o/h72pSLXMp
         iaKf97605Ltyt563ujxarUp1PYR0K4cI+wDSaV8pEiua+OfgRUDEtEns8b9ZscyrqeMc
         fWLuR02wbeI1hQLIhc0Rksc2az+rmM58QYNdBP98iUwFLFuGm0BetOAY4TyKw7wBJ2wi
         y7IkWQq2GJDmw0LLKKdiBoXgAHdTZVYeB6BkJZavDe3nBRvlJlJzs+cgzVNsNUK/DFM5
         5bbWSEUnLNS0Dp64PPrTkLNnN+GLf3abqxNb9YucO9nsYT/Rw9kFgtv8Jk9CvauEHjTu
         XdPg==
X-Forwarded-Encrypted: i=1; AHgh+RoEl4qzvb1y2K90DI7LQJ469l/SndipbmaSjiYbUdkxQ8PlMjn/jbUUVES9bF8s3EjA8HYzZmAx3P1E@vger.kernel.org
X-Gm-Message-State: AOJu0YzTUQJIm6u8IPWr5rvk3ogMqIOpfBW0NQfiUgB/3LRqiXpp/kiv
	0aqi2T1W0+dz4dBkdLAfxaIuOTSM21CuXgLkubF5og/vAJYvrkWLc9MVGfwaEJNB4R5wZ8ls3mR
	dBAckWVoBzWm+NToCMQsvbY4jekEa0iIEc3ihmg1HnZ241dOtg8Vs7/tGUaNMOnrc
X-Gm-Gg: AfdE7ckPg9bTOwP0uP4wdJycSxS/EevqPtYmf0YC5SSMIToDhXn6aGZF+W0NBMFHFTR
	X6gtCRmjUaXo5p0w84ZmAcetZujKgLUhX3b6YdVTDByygFNi/K/zFTpotBWK7a9QmMVKxj5YHMF
	y3xNkCvQn9u9bewDFjtXpccJNGpc4DCanj5pWkyCkT7OjJ7PBw3W8TJy/CaTl125EcKz7GlqPN4
	MpFWg+H7AHF4mzJHWb/Hhx0bWxgoPli8n8cNkDueriffpe8YT3PRjEPYkdN+HXbmr3ztAgkIwOi
	Vu9otNyLb92Xnqc/gRkvOhSIfs3qizcSQ4DIHkbSTYaAdaxykBrcUjpY3hPDtY+rBGYu4xnM+k1
	cx8pG6Q7viVzWf86XMQrYFhUCmWh1Gllv6m8xoKNL3Z5Lf/wtG6lZIgl2j04jXnLIyEc1Al5sQg
	==
X-Received: by 2002:ac8:7c49:0:b0:51c:1132:c800 with SMTP id d75a77b69052e-51c747a137dmr43719811cf.19.1783411707386;
        Tue, 07 Jul 2026 01:08:27 -0700 (PDT)
X-Received: by 2002:ac8:7c49:0:b0:51c:1132:c800 with SMTP id d75a77b69052e-51c747a137dmr43719601cf.19.1783411706797;
        Tue, 07 Jul 2026 01:08:26 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b126sm31391476f8f.24.2026.07.07.01.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:08:26 -0700 (PDT)
Message-ID: <8d579153-efa5-4c8e-acae-87f3bdfbfc24@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:08:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: embedded-controller: Add Lenovo
 ThinkPad T14s thermal sensor provider support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
 <20260706184648.35613-2-daniel.lezcano@oss.qualcomm.com>
 <20260707-armored-azure-terrier-4dc3d3@quoll>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260707-armored-azure-terrier-4dc3d3@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA3NyBTYWx0ZWRfX7y/WILdYm0Cu
 oxiDlRXsnS1TVrFvoFPeYEx0M6ViHc3/lJLdKbBZr2GOTHzCK3TMFm5CkfFQs8ORoeLgicywPe0
 Q/x1qx/G6egX0CGzm64XGdwh9h6IYo3hi1PGSlnGyOGJgN5vxIgyydXzMEzVznpcbS46uAg2elA
 mmObHmhNoloh47cCf8vEFjLjT1G+8FHPYgt11eU0rZW9aaOtfqfd1lcuETQrGhA0DeddgAPTBYl
 oEWtsFRu+p7rcyxXoTQZtSS0BoBY1Gm257ADIFpRfUq5wsXQncTqfRWdlF5gkPD73e6piLsyb09
 2MNyfNll6LW0/daDX3WcmM99WjKsuiM14/f3IQrstNrAPE3ce9TkG4H4lBevh7OpWdePMLfnH+t
 gMnso3xiRbWP0vAZkbB4LGp2Z8lci6FfNbwETCBvGoIV4z1IATJd/tfy3ALKAyUo31KbW9t5KSJ
 2jxynvUR8ovBHK1z57w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA3NyBTYWx0ZWRfX7PK7P4TgEv4U
 smkaol6+9doUov/8LWNbKcOg7w/IQb92XMBWv4jJw4JwBY/afc3AX+1dMIIS6isWJYhYk03sPwe
 78KXx58RoQMnjR/KG/P34orbJFCvpWE=
X-Proofpoint-GUID: 7aJehiFO0o6sffM_cE2-CPN1aZn9UY_H
X-Proofpoint-ORIG-GUID: 7aJehiFO0o6sffM_cE2-CPN1aZn9UY_H
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4cb3fc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=dgN5xaoR74Ub-rSnYJMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070077

On 7/7/26 08:38, Krzysztof Kozlowski wrote:
> On Mon, Jul 06, 2026 at 08:46:46PM +0200, Daniel Lezcano wrote:
>> Document the Lenovo ThinkPad T14s Embedded Controller as a thermal
>> sensor provider by adding the '#thermal-sensor-cells' property.
>>
>> This allows the EC temperature sensors to be referenced from thermal
>> zones in the device tree.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
>>   .../embedded-controller/lenovo,thinkpad-t14s-ec.yaml         | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>> index c87ccb5b3086..0d049979e35b 100644
>> --- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>> +++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>> @@ -26,10 +26,14 @@ properties:
>>   
>>     wakeup-source: true
>>   
>> +  "#thermal-sensor-cells":
>> +    const: 1
>> +
>>   required:
>>     - compatible
>>     - reg
>>     - interrupts
>> +  - "#thermal-sensor-cells"
> 
> This looks like ABI break without explanation.

What would you suggest ? explanation or removed from required properties?
