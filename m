Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5923395D80
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495181; cv=none; b=gu3nJEfzBpFcNIbpAF35egMntwDRg82kC5X53ehYpyzbc1UTyqvSBWZZjxk58s1sTreKH+ALr7CChB+TQoxmnutMms6B7zNUf3NuePDUoLyiEwQMb1ZS7CXIKZjr4sU8693KHvF3270FSHCSuh1MRj/3itZzz7n33krUrs6Owy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495181; c=relaxed/simple;
	bh=5oHB1SpLY34giWNL3+PmUhl/5DeELC26H/q1euYdedA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aDnn6XyI8LzJVi4JZ7TrR/8DragIHoTaMYcWTm2syL77EJxoMGnzM2PUPleZ8YJVsEjXD+MrClvmb6nhiVh9UQVSw/87DndhXj1lr76X6Z+BV3jEG66uvgjJT7frn1GwDwTlWb6YFCOqBEmFnM6hkngX6HdOWK/B8dOFdmdRR+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PR00CchJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vnal+AYb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PR00CchJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vnal+AYb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PLP2Ii1060910
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ma1rn09jt7hRvwT+i2mRS9fJCw8LRFhm7fm7rOmJYqs=; b=PR00CchJ9+XTe19x
	EmaxhWPfbpNmwx5c5Q2DY8W06XBeVNiUy4LOo89dtC48xNgQMJMWZ6OW1J0NWwRY
	4wD1kNIHEPFmKXMQKeOBQwrP1KFS8Cv0PMD+H1e4J8dULW7U9Y8w4YJRI7WUugKx
	jjVtRCUP6VAlG6m3TZDi9Ixbx6+7m7s+7yCkyBmlluFDTH3DEICWFe1VQfYmQwuj
	Tlfxcs61YloolvxYEnscYqiu5F/IY3jbAfKR4EndiR3fbu7XebLoIEHoshJxKDIH
	NptamURJIAQJug2FAiPgWP2yCsyWEGk30HB1dkwAgfd0MI+odTB+bUhYNQWu0AMG
	l4WtfA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qksrutd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:19:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ad179c7fc7so1434015ad.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 20:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774495175; x=1775099975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ma1rn09jt7hRvwT+i2mRS9fJCw8LRFhm7fm7rOmJYqs=;
        b=Vnal+AYbuKbvCgx2B+b9eL8YfT6kmIMp8PI1NVwPzmcynkA77xIBVU87cZXd5DsUwC
         Gb6ZGPzKmLr/GWbKqAq/Oc3RmBub1lLcd69Au7vPmVa4Z7yf8CToNKowQr6DpcK6BMHN
         us+aYQYOK7SIX+cWgnCIoZbDxGivQ1BuWFC0Z2N+hMxssYs/1n9fLy15RE1UVwm522sE
         AlpvUxus/Bi1iOYq+O78jyrPPUWk9I0UIEPdgri8yGn0MNnrr+YHxp0ev3sVAuzm8MMA
         jXdsNFbVX/+2OgJdjbG30+19hOoUdScct9jDTYBf++u75ZL6fGZS72mpgFLzyzqAqbx7
         l6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774495175; x=1775099975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ma1rn09jt7hRvwT+i2mRS9fJCw8LRFhm7fm7rOmJYqs=;
        b=UtMgiPfwPVHjaCq3o9VKXkrDvx4VFKdDQfMQah+BsCiS5pTI2g/OIt8Ay3PKwXKDnz
         PeKsjA4BjIPCjXL+3R8hu7AEXgEJreTUshzA5kwzt1TziNTxrXsP81fbPfLWi//r+mjI
         9QRvNp9NdiGYTZxZL1GEP7bixlj4Phxaxx6VKuPVf49j8jUOJI9XgPcJ6GftEWv2F8HM
         Z04K4+pwCDoKWnyxGNHENJ5AEXGXf32MjL/gQBn/HUyX43Ki+jULVr0SfPDuByP3Jv3j
         sdGhKA0OEdXOXQTVmLdb8EDj49Emv1ScQF87rBBlh/yMCZpmbwLAYEW2/zv75dLea9cE
         8kyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3UHbPhLzg9t0oyBizKVU85FVFt0yNk/H52bBGo8gg7Nm17CtBHAS2h4hUn2yXY0NN0i8BomFWB0yH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4uKvfVt2CBIA9M5jfj2/q9mgQjLnSsTD9F7RRqHfJ7Ef61RYO
	FhGV/XCvCzttFkfqNhFZIGe+TbIQHJfOgKk+iie2YLeFjsBePlImAIk/AmoeilNxd+GxqlyuSOA
	6e0P5XN0b6GWbtsEaip9a4ZiVFUoU1OPpq/+GILiHoY1dWF33uhMdImj3Ud8ahSLkzH3YGF2bPt
	//WQ==
X-Gm-Gg: ATEYQzxrYccEPdNQfB2ddKK/VqGPAk2cj9CVSy/gt3kJchMPP9NRes/eqtZ9RmseVSz
	NV+mhpd2XyoiLp8OX97lV2OlhFV5UM0PdkvwQXxJZYqTWtBhb2XFHU4UZkdatJjSpuszKovWDSG
	rJcyOgc8UAMXbTzd8m4y6OcEziUnL7ICIbSPJP/ijGEJZRcoIh9BlKIAUeUA7J59x0U7cdio4ao
	EuAkI6+5yoaN9w5ztSGMKTcFd31T/mEoIu2XmCd30MSJCdgQR9/JJ8gU/75dtAHQv54UWtoy0rn
	1k9iKaUSmsNVAK8sl1LE97eP9rh2jMrmngcm+u8J1Kr7UCPVV7PKd1JMK9GyFeGOFSgTkNDcsN+
	DMX4oxTU/JahCwSlksWZBAVsWHqkPBO0hFFKs/2vuGe4Dq5sYaiiqGitthjdgQ1B8cT6IthTjbM
	m3WvXrocDFWWHX
X-Received: by 2002:a17:903:390d:b0:2ae:54b2:27d9 with SMTP id d9443c01a7336-2b0b0b2fed6mr47966845ad.7.1774495175159;
        Wed, 25 Mar 2026 20:19:35 -0700 (PDT)
X-Received: by 2002:a17:903:390d:b0:2ae:54b2:27d9 with SMTP id d9443c01a7336-2b0b0b2fed6mr47966595ad.7.1774495174606;
        Wed, 25 Mar 2026 20:19:34 -0700 (PDT)
Received: from [10.133.33.254] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7bbe57sm16802455ad.34.2026.03.25.20.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 20:19:34 -0700 (PDT)
Message-ID: <0279f334-95ed-4df8-9e42-749fd854c551@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 11:19:27 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth and
 Wifi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
 <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
 <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
 <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
 <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
 <c46islnlfzdawtw4o3holunf2a6rvfs7h5dznaggzptatdlqc6@7pjbwcqdtccl>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <c46islnlfzdawtw4o3holunf2a6rvfs7h5dznaggzptatdlqc6@7pjbwcqdtccl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAyMiBTYWx0ZWRfX3fn7+82mEWMS
 S8f9FVFbuKfix1cEHjz98ZLfsJNxWeZ4ugWppEG3u7NTOOMbRkuqFb1ye3/3nYCkGKgkHbRtRmV
 Bhnq4+kqZJhtXMxU+YP0UB7lH9KnTvK6MPFO5bg7tv0H7BvDjMD+x8vuhYe1xjfQH0Vl17Gg0wA
 R36WOuzqmSyX0zclLmFp/SccYIbku2IRzBzoY+7oXE7gvMRBZgQauT7E5ripS7SUw9BoXc5WdYY
 jUqDD1SrpVDwfc0Yhji6tdcoCls26ylJqP0t5nfP90LWwrXK1dk+VOLHELNAw/3d9cXF8f9FuDZ
 dV4iy+XlG2Hh5V9C7Y+KTzcACsJUKXC5LZUAZgrZ0dqb/PP8bbesyhZCA7eQd0VCkybSuZT6ofY
 sd6h1M6jLT8mmjC9+nHlkgNYTxpCRIdbFmi7Q5PN2a9lfbZTwcjJIiEyWna9/Fg1aQ3kltxQIl0
 6f9tFkLc0P+9hkiSVDA==
X-Proofpoint-ORIG-GUID: naLUvUuGAa0f3fL4dZXnePJuJUiNiLYL
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c4a5c8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=qsWkRSFgnTEi3_olH4oA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: naLUvUuGAa0f3fL4dZXnePJuJUiNiLYL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260022

On 3/25/2026 7:40 PM, Dmitry Baryshkov wrote:
>> On 3/25/2026 3:08 PM, Dmitry Baryshkov wrote:
>>> On Wed, Mar 25, 2026 at 02:40:19PM +0800, Zijun Hu wrote:
>>>> On 3/24/2026 9:16 AM, Dmitry Baryshkov wrote:
>>>>>> +
>>>>>> +	wcn7850-pmu {
>>>>>> +		compatible = "qcom,wcn7850-pmu";
>>>>>> +
>>>>>> +		pinctrl-0 = <&bt_default>, <&sw_ctrl_default>, <&wlan_en>;
>>>>>> +		pinctrl-names = "default";
>>>>>> +
>>>>>> +		bt-enable-gpios = <&pmh0104_j_e1_gpios 5 GPIO_ACTIVE_HIGH>;
>>>>>> +		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
>>>>> swctrl-gpios?
>>>> it is '<&sw_ctrl_default>' within 'pinctrl-0' above.
>>>> the input pin is not used by power sequencing driver.
>>>> just give it some default configurations here.
>>> Please don't mix hardware description and the driver. If the pin is
>>> wired, let's describe it in DT.
>>>
>> give comments about that pin in this dts file ?
>> or give a seperated patch to describe the pin in DT binding schema of "qcom,wcn7850-pmu"?
> It is there, as far as I remember.
> 
> $ grep swctrl Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
>   swctrl-gpios:

swctrl-gpios may be not applicable for 'qcom,wcn7850-pmu' since there is no 'qcom,wcn7850-pmu' node
which configures 'swctrl-gpios' within upstream DT tree.

 

