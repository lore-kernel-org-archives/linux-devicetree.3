Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07A73F0ABC
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700289; cv=none; b=GYTuWOpiPZv26sXE0IFurqmLSIUbp6jHWDDh3uFXP4M+Bwku374NYxrb5sEfTJijvcjDrhQqYLo9ZuSM96Q4xri3QzyQPzCtS+I0uXyFFe3rVYjV0UKI/2WDQyEf7SM5XrDx2xLb01hkcK7j/hOFiatorZI5bJZYYZ4D6USE6rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700289; c=relaxed/simple;
	bh=eJstloW2uNSbMNmuAJEHSeOYil5g4xbqtYbzXqxNAdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i6G1xD7CCKX/U4lchFyLw2WuxLLSTeHNgGfJxBmp++r6ktecMc+ub0EkSJ9o/6JLDTyOSMcSY6HvQBE/+YtRJiNvJqprtGfSRXaNAOFlszSo0GxkDC+JZrx6mJ1irLmJQx+I5PP2mO4dwOo/Iv76IwTWMy5JdWgnAEdva2K82XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pda9F3sM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQV70e97; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pda9F3sM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQV70e97"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UvaD2025403
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8RN/3eykQCaBeCitaPquH73O6bIsCGSHsqz7b2YuNQQ=; b=Pda9F3sMejzdRzpl
	XCMvPd8ujmf3RtL1Re6GmKiM16UwX/NWIbv4XaptsKdI2aIcHFJGZ1n6AYWEy6wS
	hoUJBmOmKD6B4OaGzwj2hgbwbdR4oYXfUepMOw928JbTpHdyvnx0WDIGyWzk9zWK
	RJsl9IWQ8RcuG9/MqTIjYIznnL0ipnTxRf9rOpwugCGpjJI81cnbUbbnD6qp1za6
	zgYw5SNVu4rKWboTKd67BOZpIGwKDqPGG1+8KchOTWwOt+/a2JWG4CwpqBUvYJc8
	R54N5B9DvDS0WuRUII1VhEKGb6cBbVGE83lOmgqBSACTQKhTAICWGL/C3Pj5czRE
	Wf2Zsg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euees34sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:44:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915827fb1a3so49618385a.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 05:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781700286; x=1782305086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8RN/3eykQCaBeCitaPquH73O6bIsCGSHsqz7b2YuNQQ=;
        b=eQV70e97/EE9KoLEWf9ctgUXTY6URiihgf5zepb4dCAIfuACxI+xDR8QBMls52arCF
         q5VCvSb2b7nZ8xDHcVoczsmKwOy0H2LD43zf0q760Zu9dU7To2kjfABAg80pP7r7WFki
         zik5LX+V06/Amcvwqu2rlO0aSDPdITvvO/bFdL+bwKdYbsriaBd6Szs3+/qz/nedsb4D
         3gk8rL/Pgbs1GZJ2MQRQAUjqbuzZYvLItRVwqGoqV+0g57Ua3DfQMIZBwPA4J0ByR7A2
         v7aV+Wp5LjSlKdNtI0yhp2zFZIxbtfce0FwbTHCC3g/5g8r62t/oiwlMlWi65+iMzVG+
         ED5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700286; x=1782305086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8RN/3eykQCaBeCitaPquH73O6bIsCGSHsqz7b2YuNQQ=;
        b=IIoHfKYMgveyxteuYBJ6Qqjmjh2Ledz7bMplB6HWEN3y9fPpnmOrf0o4NZkNAu4hly
         /tazNzkZ3bMnTIoyxhPCxpW0xa8c8IQVPfrQRyqXQ+zqJ5TwguVxfXPkWscH9j5ZNbFO
         7L2fowmmw01XmXA7FDcXGcDwWp2zp57wlO98uVS2z/KyBzqsZLzpioND+xAp3prqdpnW
         mKZcZ2m2SibzFyEdwHDB1EXS4gHbRgR9gEODjOCy9R3CH6lOKqKthTSVwO06x+9rvrMR
         beKQAfRBmkhJ2mISpV4AR2SYZYjnhSdqJiiO168X+VIrPTHrFqFydlbigWe97UgwsugA
         idyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9MpiZz6xQV8I8hJ9QaTKRWahUdtdepOKgJ1SGkd/n6uNTr8GanrZb5JXh7++E0A+x07Fy1qULte1Ur@vger.kernel.org
X-Gm-Message-State: AOJu0YwZli5PMCIwyLf8f/zB37vfsp4Gg/57YjnjTCZwP7mnuihpnN12
	O3aXuFPdn4ZA062zlBeKN1FjX+kT4WAOfjzi95qCqi+r567LKF/zLpJ8zK1ZvNjJP5ruu+EYPwP
	1f9l6Yy6EoxMxjc4BCGCCnpNShYoA8wISr0C9BG+NwHcrTOtwrJwobOuA/nfJlauz
X-Gm-Gg: Acq92OFugEYCXOcP7sRFntMeNhrY3CXxRJqaBw78UUS14PEHKPh1mfqS7xLc4J5z+Qt
	Xi6IEKvJKfG1MIhuIzAi0JFyLyrGGr9Ce2p0M965RmgOESuyN9XgCy6Saz6iLCzjxStM4cIQX0l
	1Cb2VbqtarruOAlxGppePkigiIUjkJKB1Q/wPxBJB0GFRwchVzhzpZxvFcit91T0hRg/6fSCS4r
	Tg2WCSvLV1tIyEWtkVf/Euk+WF+8XztbwzJyOdSL0vcqQPzD/7p/OXbEchemIUycKNhbFeYFyCw
	s4D0zymH1nyDoXu4IVD8M5jAnqq8TAN7hgtkgBTnZve4kSNl71Ohp7pDWzc+NYW9bwBlJN7luHS
	5iE8+UvZH92el0dW05sE6e1WBfH0ZPhbZ7b4=
X-Received: by 2002:a05:620a:2908:b0:915:8197:4490 with SMTP id af79cd13be357-91d8cfae231mr374726485a.4.1781700285898;
        Wed, 17 Jun 2026 05:44:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2908:b0:915:8197:4490 with SMTP id af79cd13be357-91d8cfae231mr374723285a.4.1781700285342;
        Wed, 17 Jun 2026 05:44:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c19a9f5sm14224681fa.32.2026.06.17.05.44.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:44:44 -0700 (PDT)
Message-ID: <bf9a7031-c6d7-4897-9ba8-988b92f55dd8@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 14:44:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org>
 <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
 <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
 <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw>
 <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WSTwIlYM8dmhFUy0k_Jra97zvsmDggYh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyMSBTYWx0ZWRfX8TYb7cAQWRhi
 Ed3UypHNTI6Z9ZOttaAzby6jp7QAiTK8pQy6savMIaszyjXADm4tQxo5t5VTwst2htcQq272hSw
 RqpQCnh+ctU6xSeSX3aqNV1MSystcgT0lRnNCGJI4hnHEvqi5fFU3v9BZawkrfo8+XyGgCCnAbs
 IXHXvxgCFu++Ra4giDC1ads0ctZSszvW0OBb2hBnf2QCir4ik+F1tA00Mr5cJvLSlE1+OYqGJEY
 oaziyXGDMlU+wrklEw27MTfiWl4cSL6hburLtL3FOoOC5IOBOa+N5CJWd+/QBqjjuUQ+UXMswQK
 A1yln0yHmY89mxIovMHogwFZXETgbqZPWjhZ0y0F+NNnJCP+FRaKL77JMzTIjXjlrAgmK0+8Zi4
 od45U4bVAUbXd2F2Kkv4ptmMsRweTA0l7Uny8j2j+PK+xiakJao3O4gu0v2ba1Am594P8+l2Mu3
 qoxT5B7ojN6kTwUjlJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyMSBTYWx0ZWRfX20gYZi0ZtWkX
 GKN0xRSo4VXGMKopsKRMzUnQSBfb2tLRIubsf8hjC4NSAeeRb04py3luIKNQkyMQxAcBVg8TXCx
 5D2aTO8ACrSAD27Sxa+rDrnJiwKzW6I=
X-Authority-Analysis: v=2.4 cv=KeTidwYD c=1 sm=1 tr=0 ts=6a3296be cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=o19EmiD99IrPSnOigvUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: WSTwIlYM8dmhFUy0k_Jra97zvsmDggYh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170121

On 5/18/26 1:49 PM, Kamal Wadhwa wrote:
> On Sun, May 17, 2026 at 08:18:15PM +0300, Dmitry Baryshkov wrote:
>> On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
>>> On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
>>>> On 13/05/2026 17:29, Rakesh Kota wrote:
>>>>> On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
>>>>>> On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
>>>>>>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>>>>>> - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
>>>>>>> - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
>>>>>>> --
>>>>>>>
>>>>>>> commit 457abf6e7ac410430c866842e08e602ec3daaa51
>>>>>>> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>>>>>>
>>>>>>> arm64: dts: qcom: Add Shikra CQM SoM platform
>>>>>>>
>>>>>>> Add device tree include for the CQM variant of the Shikra System-on-Module.
>>>>>>> This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
>>>>>>> the common shikra.dtsi and adds PM4125 PMIC regulator definitions.
>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>>>>>>>> new file mode 100644
>>>>>>>> index 0000000000000..401e71720519d
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>>>>>>> [ ... ]
>>>>>>>> +&rpm_requests {
>>>>>>>> +	regulators {
>>>>>>>> +		compatible = "qcom,rpm-pm2250-regulators";
>>>>>>>
>>>>>>> Since the commit message indicates this is a PM4125 PMIC, should the
>>>>>>> compatible string include a specific identifier for the actual hardware?
>>>>>>>
>>>>>>> Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
>>>>>>> the fallback allows the kernel to apply specific quirks if PM4125 errata
>>>>>>> are discovered later.
>>>>>>
>>>>>> This can be ignored. The compat is a leftover from the historically
>>>>>> incorrect naming.
>>>>>>
>>>>>>>
>>>>>>>> +
>>>>>>>> +		pm4125_s2: s2 {
>>>>>>>> +			regulator-min-microvolt = <1000000>;
>>>>>>>> +			regulator-max-microvolt = <1200000>;
>>>>>>>> +		};
>>>>>>>
>>>>>>> Do these regulators need to explicitly define their input supply dependencies
>>>>>>> such as vdd_s2-supply?
>>>>>>>
>>>>>>> Without these properties, the regulator framework might be unaware that the
>>>>>>> PMIC regulators draw power from upstream supplies.
>>>>>>>
>>>>>>> If the kernel dynamically manages the upstream supply and its reference count
>>>>>>> drops to zero, could it be disabled, causing an unexpected power loss for
>>>>>>> downstream components?
>>>>>>
>>>>>> And this is a correct comment. Please provide missing supplies.
>>>>>>
>>>>> As per the Qualcomm system design, the parent-child supply relationship
>>>>> is managed by the RPM firmware, not the Linux regulator framework. The
>>>>> RPM ensures the parent supply is never disabled until all subsystem
>>>>> votes are cleared.
>>>>
>>>> How is this different from other, previous platforms?
>>>
>>> This is not different. In the previous platforms too this is taken care from the
>>> RPM/RPMH firmware side, the only case where we may need explicit vote to parent
>>> is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
>>> may have a RPM/RPMH regulator as a parent.
>>>
>>> Even on those previous targets the parent rail of all RPM/RPMH regulators are
>>> internally voted by RPM/RPMH FW at proper voltage with required headroom
>>> calculated based on the active child rails. This was done for all the
>>> subsystems (including APPS) regulators.
>>>
>>> So no explicit handling from the APPS is required for parent supply.
>>
>> You are explaining the driver behaviour. But the question is about the
>> hardware description. If there is no difference, please add necessary
>> supplies back.
> 
> I understand your concern about descibing the parent-child relation in the
> devicetree, and given that we have been almost always followed this for all
> the previous targets, it will expected of us to add them.
> 
> However, we want to avoid the unnecessary access to the parent from APPS.
> At the moment, I do not see a way to avoid that, if we add the parent
> regulators.
> 
> @Bjorn, @Konrad - can you please also share your suggestion, how we can add
> parent-child desciption, but avoid accessing parent supply from APPS, as its
> Qualcomm's system design to handle this on RPM/RPMH firmware side (you may
> recall we had a verbal/offline discussion about same concern in context of
> RPMH regulators earlier).

Can we introduce some flag in idk.. struct regulation_constraints, make it
skip the parts we don't need and set it for all regulators registered in
qcom-rpm(h/smd).c?

Konrad
