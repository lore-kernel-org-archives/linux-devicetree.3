Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57B2191F91
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 17:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027410; cv=none; b=Ic0w7aY1UzQ4Ln8aLWB7IZp542JKSBJWplM6ZeRKylx7wTWvKu1dBTBKyyb1hQlMt5rS80IhqsKF2upAqC/9L1vnqSpReOwOzp6YmFWPN02KHyTsQ+lHyizxm4By6O9lRTMMplcFAbv7lNfHGDgP9qgh6Nvf+tXVc1JtJw8l3+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027410; c=relaxed/simple;
	bh=OJJyQ7N3WF+j+dEurHCdLzCCk3xicc9di2O5Up0QKJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RZ2SmLJxtcGd1zkgsOo68Usi6xzX1BrH26L8pJ4O4GM4aTYykNFyNXy25JuMvRbujodRFYy4a26sPvTq0Q1r+jQMHLnHaLNJFB50raah8E+YpCawTIhH0x6EYIffcEz0byMXJLI7xw3QWLPSKHrumGjxBB0Rv+h73vjKqP2P4mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R3ae2ZQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bYEn653p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R3ae2ZQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bYEn653p"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KEFcaI1525568
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 17:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfbxDY9Im2+BtL9OZSyqlYbFE771o07gzHc0qIeYYj8=; b=R3ae2ZQam077UttZ
	x0zRwZTNWjAMA8FgstZbdBkdXRWea+TBW5pCL2WGntLuUy16AW+gGbhRR9cxIo/j
	FsOHoDoumCvoj01uDo5/MCv9rEyoyM+Puf/9wQnFoNGBxt8kB3T69HQh+KuX8UFN
	1ys0pb+a38go2TnOAgHcZ8XDcuZfDrOcJ2S8lT7Pq6fvcEhpFRIY29kNP+O3b17m
	gr2CTzfF0yCFcUTVoGl5uWAe/KPoeBgvy9LaZ1pWCbSaos6oG1Oqx/iFkP3Pch38
	8cycW3/xqGInoL/V9W4bGzMvf3jg5T0IqayrphghBQ39cNtowrCnbrhYl2nqgdUR
	W7OVig==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0jt945tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 17:23:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b2cbe7223so130431911cf.2
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 10:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774027407; x=1774632207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SfbxDY9Im2+BtL9OZSyqlYbFE771o07gzHc0qIeYYj8=;
        b=bYEn653pghZh5RsoGTyHdW+nluxCMPOQdzY+67+k3OhxNWo/IlzPCPcDMJ+x+gVRWC
         eDVlIbGJ3Z9JkgsLnKsDt0o+x1gu/JCxuGZLjzSYLH5NZDJLkK+CYyCiDLQxPdmPloXy
         777gVXOAphFiVGorx4ufXzQ/Uk6D5IXlywbPVlHJaVNVmAqnSnmOq74/Iu6sWJOiFppp
         jtze6H1otDfJ1xp+6Yyx13sld+/dFBvwYGVf7OZOPaccbyHcZgJX+3fYADtGfEBtZAWp
         ABTJA2aGwH94HZP7cNS2zLOhZQuiFHEHnHw2KKRL2gkmOPqSrnJ/uFCLLTUu5Bwacay7
         VUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774027407; x=1774632207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SfbxDY9Im2+BtL9OZSyqlYbFE771o07gzHc0qIeYYj8=;
        b=OkqWExipgTpkY9QlBYIwiNi2wyT4xPtL35WpZoyxD53Do2XcqqmfmdK7/YhVhMuUyS
         oAK2ppUgNYbMronzCpLxzAQ66ut5ZOAlNQXecyP8VQGk8T+9cbCR0wHoKS7ZTVz2GosY
         MvGLa2wOYPkwALsWPuHAcJ2XFVQS7KwiCZ2EmJSmkQGE6SfgF6mY8wKGZtknFUt+87yd
         PkQj3vdc5uujTOuyhTXWByDP7x097fEoLhHYMGnwSBhtr+A0flu80qqEJUMfhn2k2NhV
         tVZ9jxqeN7C+EkGF8+Qo9Fn/TqUlm63CaB1smHuS2ZXQpZNtvlI3pkm11Mmf1eZO5/V1
         UY3w==
X-Forwarded-Encrypted: i=1; AJvYcCUPtP/nYN53OQ7kUsFlniDbFU8eeCK6bEIKvn4+mYQS2waekHV/2oxFOjD5+/De9roqeJSfNpB6cCAh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Piao3NWBoNAARfeYeCruuX5AagsTCKmAq3Mhp8pREFjZwDss
	eEswxRa3DyURBU3t2wTMGy3GdcwCSCEuG3QoawfEdHKC+iagZAhdhEEXKzh8SQ7oB/67zd/Dtr4
	h7z7k0nqKiJYwoiaweimFRoLalkGHwirI/E7Jhehf3RJG83Yrl5mGuwri9005sg6U
X-Gm-Gg: ATEYQzzfb6Ji+6GjTc/x/wY/PCYCEonMSqZE5cVh8z5AC0gh+M80H02G2XTHZCdykHm
	dOY7vg6Hy96L8pSGXQq7KVBtHgJTeogVoM6SH3q9ZyXCezT0iCE6NaDoExm+lRA3a4YUN6WtjdZ
	APket2pkssPUCN4W0jSBkTvtZhMPbY2WeDAaCQ1dT2JSwOB9HtQK1YaoDyFWQjOP+tlOXQFd+rn
	NQ94ANRPp5ig1d0yXRtrkBWlLP794w7OpHib2ot7qiRZzZgJAqWtS1b0fKJc3nczlWL+z/yimIb
	wx3fkFbkxFfzi9OKpDK32oEOQf3Satg3yug0AJ43mlVcrFrig/PqzroCq7bta54fqrB+1rSlOJu
	amHA+9N/kPqCrzumSeJdLb2PvPa7a5i1KvDDM7Cg7ZY+Kr8ec1FrON5RldFTsfqsv5+6gnowxYy
	hW46B/Cr/7
X-Received: by 2002:a05:622a:7593:b0:50b:1932:c9c with SMTP id d75a77b69052e-50b374b1f0dmr45800131cf.40.1774027406965;
        Fri, 20 Mar 2026 10:23:26 -0700 (PDT)
X-Received: by 2002:a05:622a:7593:b0:50b:1932:c9c with SMTP id d75a77b69052e-50b374b1f0dmr45799691cf.40.1774027406461;
        Fri, 20 Mar 2026 10:23:26 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b322d9sm139618585e9.8.2026.03.20.10.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 10:23:25 -0700 (PDT)
Message-ID: <faf511da-722d-4ea7-bf5a-9c7abbdd1379@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 18:23:24 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
To: Guenter Roeck <linux@roeck-us.net>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
 <ab1fSWx7pqlSANph@mai.linaro.org>
 <a922cf55-ebe7-4256-b3bb-cc732e45e1ff@roeck-us.net>
 <6f4b27c5-074e-403a-90b8-fe7ef3a993b5@oss.qualcomm.com>
 <1db8667b-5546-47bb-8ba5-cdb99fd60848@roeck-us.net>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <1db8667b-5546-47bb-8ba5-cdb99fd60848@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UIBurofLmmjQFyjxI8lkZJqESGih5oAO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDE0MCBTYWx0ZWRfXzZaa+22lWehg
 4Wn03qgwkIx3XBTdT28dCqQld5wLE6zJMd/xArVutlqIqnzXKtemoDE29zMYsKD5s+UBdr+skG/
 blSzthVSYfJiUkKWNXE3oju0GhaEz+d6KUNQL19KXlh83TUrkIYGg4OBvSPlE4/hrEUqdnruOdT
 VO/NjTJBIaSBxni+BNfAJoaAgkdOR8SM3AgwUsLklrpzIMQRU8VQ5pds7qAQTtn3CUOWWqa2k9g
 VDXSXVq/bbLco8P9EIJ+oDgrTsfK01dUzSYODx3Mj6XghxTytdCGEXNZ48fmKjjpeRzdRv/T3Xj
 GeB43uAtMtD2OHT9HLw3Q3UuU/f96PAu2L0Jq99KVlN512A/WEjZPO4Q35Gj59PTPuzPHO5MhFc
 wQTf5R6j3LDRjVEMR+RUPEI+v363HazGSbgoMKaHw0As97PyeOevhOXYTBO9CJ4QOr0wZ4ow1EJ
 apN1Eyh/pJfNXr/crow==
X-Proofpoint-ORIG-GUID: UIBurofLmmjQFyjxI8lkZJqESGih5oAO
X-Authority-Analysis: v=2.4 cv=FKMWBuos c=1 sm=1 tr=0 ts=69bd828f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=N4zZDkH6pAkBRpc-Z9EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603200140

On 3/20/26 17:59, Guenter Roeck wrote:
> On 3/20/26 09:08, Daniel Lezcano wrote:
>>
>> Hi Guenter,
>>
>> On 3/20/26 16:22, Guenter Roeck wrote:
>>> On 3/20/26 07:52, Daniel Lezcano wrote:
>>
>> [ ... ]
>>
>>>>> +
>>>>> +ADD_BCL_HWMON_ALARM_MAPS(in, min, lcrit);
>>>>> +ADD_BCL_HWMON_ALARM_MAPS(curr, max, crit);
>>>>> +
>>>>> +/* Interrupt names for each alarm level */
>>>>> +static const char * const bcl_int_names[ALARM_MAX] = {
>>>>> +    [LVL0] = "bcl-max-min",
>>>>> +    [LVL1] = "bcl-critical",
>>>>> +};
>>>>
>>>> IIUC there are three levels of alarms but the hwmon only has max/min
>>>> and critical. Would it make sense to do adaptative min / max ? So when
>>>
>>> hwmon has lcrit, min, max, and crit alarms for all sensor types, plus
>>> an additional _cap_alarm for power attributes and _emergency_alarm
>>> for temperature attributes. There is also a generic _alarm attribute
>>> for each sensor, which is supposed to be used if the specific alarm
>>> type is not known.
>>>
>>> What exactly are the three levels of alarms ?
>>
>> Manaf can give more clarifications, but it is like we have yellow, 
>> orange and red alarms. So there is an additional alarm comparing to 
>> what is available in hwmon. The proposed driver maps orange and red 
>> alarms, respectively to bcl-max and bcl-critical.
>>
>> I'm just asking if it is important to have this 'yellow' alarm ? And 
>> as there is a missing alarm to describe it in hwmon, how can we use it ?
>>
> 
> Is this for high alarms only or also for low alarms ?

It is high for over current and low for under voltage.

> I would not mind adding _emergency attributes for non-temperature
> alarms if needed. We could also add another low alarm if needed,
> though I don't have a good idea for a good name for that.

May be "warning" ?

Alternatively, could it be interesting to have an alarm with a value 
passed in the event which represent the value in the unit of the 
monitored attribute ? So there is no need to add more alarm files
