Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71AD3B5DEE
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424810; cv=none; b=nqwLQcpN5WtmzfOHA+kRi5p7giC5tk+O97JHbjVGquL0HYBRAduPHb0AAvGjD7pRdK/70ys8Gl2TR1Tcp5eXtZS8tBXB5TynJxmaOhLWWLYKs5ypLFm65g1XIERYTmPVMKKlS5Q/eOrDSIu4IYOCwv460X0eU/jeDdyLY9moJSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424810; c=relaxed/simple;
	bh=4UwuheMNuKFG5cXp/o7N0kc1T5pw59f1tSxPt6f2HVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UMSLOcRXg6mkrqbRa6eo6uhS3fGYIw+0LCsJo1Q2SsfmfheWHWC5bcFqZR2BdCiXXBKufJkFfVOGgoAGwy0Gt0SlYj+Izjkaa076FnNdbzVjwuFTOWyLZkVjf5ntKAo7aiUNmSAiuPITVAnxtCxdzrfl57MnBZH1n0NHB04C4Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4AGZnhk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Avk5eB6U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4AGZnhk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Avk5eB6U"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDDIbW1062904
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z2e2OCzan7EyEJ0ZEQwZXLj9oRLJAD1e6T4kgplKI8o=; b=D4AGZnhkRuV937e8
	Sb5c0n1TQJLhHUL+5zp/vxVU9dxraxT3vlDWWO23GPQtxIl12NuPU62+B0DaDfhD
	Y8ofbflqZWuypKS5mk7mkDDUHuWEXLi4uu761ivHQoPdSpWghKteoy4zClveVA/T
	xMSjKnOGzH5o2jVibCwKKKTD+F8AR12OsFe0jOMH2nwS+kcYNogQOGcPkDxb2GnW
	jUvdL8gZ2LypRuih8M9cWccMbk712yCa9XmScaKk6LqojPMaEPJePZ/moTNo4/zo
	AUjj01X9mnIDlbr7kccEHtfg7xOtNFCLPyhUB2TZf233nbGIOyM6ODzUFo4BLidh
	sBHWjQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6yfrr3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:20:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ef13b61bcso323736885a.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424807; x=1786029607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z2e2OCzan7EyEJ0ZEQwZXLj9oRLJAD1e6T4kgplKI8o=;
        b=Avk5eB6UL7DQ+fmr5IHu4g71et8E13rXR2/9p6FyHhS0NXUKamFpxVaDCrqGrnY73V
         kHifwZmiIRvdHhzJfHVrNaeMUZE/NdEjQ/EJkQbWkK4Z3nOleywCfA4k41NKYLeP+TcW
         3NZt+HN8+Pslmj+b4TDMOPaLSnjgozOE3Unc0Rshp2B54PkcWDADMg9Tlg1kbLQ3ea5a
         sO8QQ4KyXBegrMJnUvMUbtLVc5Zf+9JoY5lnUgxZjGwbfiynBz+R8EYn2Pwl/jO8fHmz
         kI5RUhvZbldjnKO6XB4lKBS5+bGP+3cXgdCI9SuzMrOq3ClC2RUVz+EVPJKDhl6yGZ2M
         lsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424807; x=1786029607;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2e2OCzan7EyEJ0ZEQwZXLj9oRLJAD1e6T4kgplKI8o=;
        b=j5hWaN3s8VYV1y3nvgb7uzu2zQMjDK7SUkZfoJ6bJhyJUPki/UXp7QBR9IFtNX03xA
         fIST9uAj69thMOu4WaM2zWHqGWaawSZFiBIXBcgpeCT3mg5LGR8CizfNdbLZ+9sooZ67
         7sNNwtgqmjye7xXGjNfmBvsn++DEq277UAUZcfPN/B8vc23Rv2/a+0UvVvR5BXx+Zb7l
         CbfyW+f+h7q7bd7uCU6nV/Do4NIc/chZtCfJ5YjrLCVyegFKO+h5yyO0vg+3CuqxyVAi
         iSSskhHk8vxMtvruZ+tS959nETB3CB1S7pOqVmkJQpIT4mESyqozZ8wJSZmlNeXsxz08
         TXSg==
X-Forwarded-Encrypted: i=1; AHgh+RpiZ7kDU+P2way77mYGFpcuEnSWDHFTQLaNGeP2gSYJFg8pIutkJD8cBj+jDmJ/ycNdsFRnZSrVAefw@vger.kernel.org
X-Gm-Message-State: AOJu0YzIeGy3Z4JPAs6FskLDgnOcMCcCQvtuRh2pcsWjGrMNAvK8r/YT
	VxcwhVx0zo1Xoai4MEx9XW6zBatUNBhhOOE1RupefBCpRjNLtzfNpQc9jZCr7bepui5pMWertR7
	qf3MEiQgfunZcGJTM5tL21qq2plxxf8effZsDH8HRC7dhDNxNi/7dlOKeZpIv94dJ
X-Gm-Gg: AR+sD13phhCnBI74QgMYLAdpyERlzVw0sGdxk55i+8x7lE4mrX/kEetjeVJhicrYFQV
	yVbJhy+3jfyCPAzRXZFNO430aAPnHTbJuLWqsKqtTqryd2blBViW2Y2FCO2O6WqxgbtoQVV9Yy6
	tTp5kf8uQ0+qdZKwH6tCsf7O+Cfz24CNbtdt+vzHmdEXsAw2AQf51yL0fWhaX/1C8W/mg9xoUca
	MsbalKgsMZZHxOnv2388hnjDFia3bqAMyLrMrQ8KqvtjkUwW94IrlkdCQc7DsvPMmpqE9vJHpDc
	7DCVIcaJy62Vt0Shp97LDu4sHjM1rQjJ4OS1bMDH9cHM/SDDq7bJ2KLN+IUkBwYPTdDL+RmK0Hy
	2Je9Y2LXKa5zNd0i9pQXHvyIcHibM20mjJqo9poGVLw==
X-Received: by 2002:a05:620a:a183:20b0:92e:c118:18b1 with SMTP id af79cd13be357-93486f080b7mr230423185a.80.1785424806993;
        Thu, 30 Jul 2026 08:20:06 -0700 (PDT)
X-Received: by 2002:a05:620a:a183:20b0:92e:c118:18b1 with SMTP id af79cd13be357-93486f080b7mr230418285a.80.1785424806397;
        Thu, 30 Jul 2026 08:20:06 -0700 (PDT)
Received: from [10.44.237.143] ([157.51.226.244])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933d3225b17sm431211785a.8.2026.07.30.08.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 08:20:05 -0700 (PDT)
Message-ID: <fdf4e885-8f36-432f-9247-80f216ba353e@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 20:49:57 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] dt-bindings: hwmon: Describe Qualcomm BCL
 hardware
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-1-febe2805e17b@oss.qualcomm.com>
 <20260723-radiant-scorpion-of-hurricane-cbed57@quoll>
 <63b4c911-d1a4-42b0-a66f-b0c84308d5dc@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <63b4c911-d1a4-42b0-a66f-b0c84308d5dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX4UQ42sHo4Z9r
 r2uYvAOaUoPcGT90f27eWY0yM3CKMHxs9qHvICNqZ9ryQqJGFauaXL6plUwk5gira/Wwm0/3KI2
 zutCyleH7BHM0dg9THCnsFc4AdX2G2GAfgblC5+US3YyIn+Jx6eof7GL+3rvhwaRn34LNL1ai9N
 gsW0X2lQkKRY1M5J2+Tt85zxX0d1AAbYmeWhdAW+twD8eHC6AZlx5UkoXqUDYZD3A8yrOwWC7vY
 U1zDTiOwkHApyDfdMW28iQpziGUb7vXJk9MQYmZCK3SFy5zlt5NgDvUF/iceWAlytqeQhexIjgE
 TQzwqAaaD1E6rQJtMzek8/bRiSHIROMMqnnEIK1z2DjVTVY4TyT4GFBZGzGxvxChJDzgL7aIBCz
 CwbNCWh9jXV+2NfSL1kggEzuwOJxXW9FSII/XYv9nq3OV3yber+yEBhj3amqE6ugGdytSqIQvyF
 STjVQWpXDUN4W3RB2Rg==
X-Proofpoint-GUID: Jd_5PJGUqdLT20H_7QqXZXDcsyEnf2dH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX2jtqDdUAbrDC
 V/2GV8A8/imy6hiwhXetYXZmy2Lo2x8m5M4i/hP9HsIFeMYDb9T9vFo2hhw3VUPIHJLy0W9HqPx
 Vbw6KGJqBGjP0alR3jxU+hj9ycD7YPc=
X-Authority-Analysis: v=2.4 cv=Tv3WQjXh c=1 sm=1 tr=0 ts=6a6b6ba7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=cCWIhcq3vK99OmWhR8wnPg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VXrKn6nlqrV7Eejcd_EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Jd_5PJGUqdLT20H_7QqXZXDcsyEnf2dH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300116

Hi Daniel,

On 7/30/2026 5:05 PM, Daniel Lezcano wrote:
> 
> Hi Krzystof,
> 
> 
> On 7/23/26 10:11, Krzysztof Kozlowski wrote:
>> On Wed, Jul 22, 2026 at 12:00:06AM +0530, Manaf Meethalavalappu 
>> Pallikunhi wrote:
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,pm7250b-bcl
>>> +      - qcom,pm8350c-bcl
>>> +      - qcom,pm8550-bcl
>>> +      - qcom,pmh0101-bcl
>>> +      - qcom,pmih0108-bcl
>>> +      - qcom,smb2360-bcl
>>> +      - qcom,smb2370-bcl
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 2
>>> +
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: max-min
>>> +      - const: critical
>>> +
>>
>> Binding looks in general ok, but feels incomplete. If this is battery
>> limiting hardware, does it actually need any battery data through
>> monitored-battery property?
> 
> I'm not sure it is relevant here. The BCL is not a power supply neither 
> a charger. It monitors a power supply output which can be a battery or 
> another source of power AFAIU.
> 
> The monitored-battery property is used by chargers or fuel gauges if I 
> refer to the documentation.
> 
> The BCL monitors the output of the power supply while the chargers 
> monitors the input for the battery.
> 
> Manaf, does it sound correct ?

Yes, that is correct. BCL monitors the current drawn by the system from 
the battery, as well as low VBAT or low VPH conditions. It is not 
involved in monitoring the charging path. PMICs such as PM8350C, PM8550, 
and PMH0101 do not even have charger or fuel-gauge peripherals where BCL 
is still supported to monitor low VPH condition.

Thanks,
Manaf

