Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728AD3E5A38
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 19:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786649259; cv=none; b=PbE2F0IXdNYXY6JwQ4Jh4vPOuNgD+4u20w1rEE+zzXDOGAIHqGSXFr7vZy/KsO4ZUeQVj8EkBkClvqOfx8SUavpwmvfv2rCTWb1MBSolK0wZuUQhHWB2MVZYZ7H8e/AhV0ewqU3VtEx2XO0jJqQOMkvwCaXv+7//mXuYIAuF0k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786649259; c=relaxed/simple;
	bh=7a1morCh66UOrKmTjaHtFdf9M1LSa0tAMfrHTv+Ha3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tPBPo5rR8vxdPT31q+94t3ZP2CA4H8mMCWmbeJoQg0fmLZGZsaz7yaIMqTEkjLb3Cxz3y9Pu4WfBC4jb9baZRwusiHYBOb1ei8eDaiDY49iOtCtUGVTMFsHx57ZqduY9iQCls/J6W5NpkBV3WxiGUlWquZi/U1RfOc/GBs+/JWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ATjNJaV5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+SBqRwj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ATjNJaV5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+SBqRwj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DIhJti3559181
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 19:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D42vDXjyJMK1PmVkhCovHX+1s2WZnnUYkEVKSg7Oya0=; b=ATjNJaV543iwwvh2
	j4cDvftJTH6bv1xiwM4jk+19IdUHYpXpIcXjZ9o9ETVAMWeNbcPH36nbDCsXqLze
	uFjVeCYX49KwGGauVZShNwK7jI8cbNhXbLbAp0Qq1ztGqRe7GKoVi81BeqcTL0OS
	Lgk2EnN3E/U86eh6YFLV/EkgZa158XpryGxZCeR/TWWrSYTBSmyP5IAG6QZ2H+xF
	cWmXK96WqDNdM/f8bK6AQ8Iq3zz6zEie1UOd/RCLoPr7Qq5BDGYjVQ/dHz7Q9b4U
	kVYYdhxICA7xTqRzAowSGE97woYNRUKf0D/X21tQgcEPV7KVrs03LB0hbT/g3Dn7
	5Cor5g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1gy4s0q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 19:27:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85798977dcso286496a12.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 12:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786649255; x=1787254055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D42vDXjyJMK1PmVkhCovHX+1s2WZnnUYkEVKSg7Oya0=;
        b=C+SBqRwjAZWGeqhVD86ZtXNm/hjkJnNunPn/S6Apg2tqwYOEcW4BLWlPGk0qoCHZX1
         902Ii4EzqD47zabei44S/qs61eVkpCpEjeZE6cEyxAEzfuNr5Xxf+tzReJ1c8tSorNGE
         zgEDfn/LrZ03GS16tBy/dMSDe/UlXO+GzHErpPHNCwzOmM8LbjEmqfx4+lZRVbhLL4Xs
         41K6P5qVDI5zrq62fEF+DPFc5UH3lB9SJEXl5i3U7Vap6UGtgokvFQwpJQYJRMekGHe0
         FRh36vSGZr6N/MInksuK2ztouWAIpfx/Io8oDUWz7O3OVfenVhmVi8tzf9k55v6iGSrj
         SU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786649255; x=1787254055;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D42vDXjyJMK1PmVkhCovHX+1s2WZnnUYkEVKSg7Oya0=;
        b=H5rKIFYmgcVcINQmmRMPt+Ny/l5RYxhz55tCLZoFp5ug/xSvYurm/bavIRJ8/EV2e5
         amwPFs33A+C8EnOgjM9JbAitkXqeio3viLt1gfO/TFtVxxJdpeavo+udiT/mM0mzfm/C
         P517zz6meiZrzZzncNC9DGdrSdbAxYU7FdY9KB2Bjj0QJlzqPa8x2yn8nT+FFDQsTocg
         cN5FPLT0Hma3Ff6217u3WryLXfrcK+9/yx7+C2jJGhR0lanY9h0mSG7RwJs5Vm3vHnAV
         qEGehOgExQZGv+QAn1DtBv8VivAH1vFR96R2XDVneDcv2WevP/tuAGSp81q7D/Xy+MCF
         OaXA==
X-Forwarded-Encrypted: i=1; AHgh+RryS19C7CyUZS5nwcHDNhqgN4Hxn3zMeATSdkhX+hccqpdYNZ/+lWukMgPceIACOx52U7LY83RWsWTP@vger.kernel.org
X-Gm-Message-State: AOJu0YyEXAZg1MnmTFrph0g1NCWmANtH64hGxGEzDtS+otaEp3KYmW0+
	vIJ0e79534sa5XNMKIkOBDrFJkrGHJtvw2sk93XHkxqb5eZocPBuvvpwzvwSkEBBkTgiXXntRLR
	kOwfKys3Ne/wMKdtk4G8EzRpuV91eS9eIzJHdTYth1dN5zAUbR6u5rgJbwdpCkjLI
X-Gm-Gg: AR+sD13j3LEarGsiOEfKRWY+yk/q+r3JhPu2wEgaRymlwa2/Qx9bvkF/AmDMLbmEsXY
	sLQiYzFzpprmKqdw51GULit+23fdMWbSYZFe74p60Po5BPzckTRMzyGbeab6fJawvqcDQRQZyA6
	RKCnVe/Iz/wojdEkbVG2+4Sk5sKkn7JIu5CnniiKSHx1LM7oTz3x7vQXHQFGyiOt2ix3eeSvipM
	CQwtRL3di2nvVZfASoAyxX2qRAZ/K0//eIu+45auXePX+Y7eHv4oXio+OUaKSDSobTwl46ks1mu
	CvW89xUSBZqpSvD+Nc3bIGCTWc4VBHztGZnTJ0eRP5NTGUbqAPbZ1Njjd2NwKt2XCLuutuiz2nL
	KEbhw+oWJKRqyZ+aE1LVQpBfWqJ0gOLde
X-Received: by 2002:a05:6a20:6a1f:b0:3c6:61b9:917c with SMTP id adf61e73a8af0-3cc71ced6e0mr46762637.11.1786649255141;
        Thu, 13 Aug 2026 12:27:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a1f:b0:3c6:61b9:917c with SMTP id adf61e73a8af0-3cc71ced6e0mr46684637.11.1786649254456;
        Thu, 13 Aug 2026 12:27:34 -0700 (PDT)
Received: from [192.168.2.2] ([49.204.16.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ec002e857sm11727043eec.23.2026.08.13.12.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 12:27:34 -0700 (PDT)
Message-ID: <dcb8ee4d-7c01-4de3-8c01-528beaae16bb@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 00:57:27 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
To: Guenter Roeck <linux@roeck-us.net>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>
 <373bd00e-bfcd-4f6c-b64e-a707af01417c@roeck-us.net>
 <cdc0fb5c-d277-40b4-8b00-c73eb881c062@oss.qualcomm.com>
 <4f2d9c51-1059-489c-a469-562ec52015da@roeck-us.net>
 <24a0ac2f-792e-4296-949c-047d9ce1c1f3@oss.qualcomm.com>
 <3635cd34-4c11-40fe-a9ff-48b752fb5150@roeck-us.net>
 <c1db2ca4-ad1c-440f-bff8-eb7660af8021@oss.qualcomm.com>
 <df2f8d63-4972-4b59-883f-0a919e7cb409@roeck-us.net>
 <5861906e-2969-4849-b9ec-ff6c7df65dad@oss.qualcomm.com>
 <66979a1d-d92c-43b2-892d-cd73b6585509@roeck-us.net>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <66979a1d-d92c-43b2-892d-cd73b6585509@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SDWxx_doCHg8J1ZVHLAqjEEjVCkTqglj
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a7e1aa8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=BvtW7Q8lqb1UdYndl6lHrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=tUoij1vsQbLQIl3R9WQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDE0MSBTYWx0ZWRfX6WfmA1ImDc6d
 8YB4hbEniTt1VX6bYs2w5Sw9XBroW1vK81C92BTUq6700arA2E2fG9ITquMuQC3nZSAW/QUmV7T
 FU2q1qotiCxJ8fMh7F2t89OV5tFxCMo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDE0MSBTYWx0ZWRfX4ifXJjJG799w
 ZGmSZvG9DLKyvCENdm8WAq4l7sUhfTNvaeTkztoDg0gbFTlRtcOBm+p9YNxLfM8ZsKfC2lZnEy6
 rvv7yd1Wde6JW1Kldg5nJJEpSVMXqwvl3y5qNE4XAQ4612EqiFyMmjNIJMdLPsSbcyiTf/2r2Zy
 z042OWknMAMy1SW07smAVaon/2vpfezpphQXk2IKbbn/YblQmLdGbH6jmSJ5QVcob5/TXMCIOtM
 remQT3Li0Yc16xMh9XbOW/vZfHYgcwa3kfzIGFSiklVMfhG8SrYyenh7t3O9mH0o+Sm6rlVqmeO
 9ayEwUKHH1EBmiBTxBkljnH/JTJI/y85sSVj10lBOslTBcCfGAQyQnNqrS4sRLBfFnJl3cBQvt5
 X3ZYCCnT2zi9yELsn/aBtfMh1DpqHCfu5J8/v7q8hCgoo2m3bUstBIlRamRPMMjExp6x2svHOds
 2ALxd6F/H9jp2VInrmQ==
X-Proofpoint-GUID: SDWxx_doCHg8J1ZVHLAqjEEjVCkTqglj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130141

Hi Guenter,


On 7/30/2026 8:47 PM, Guenter Roeck wrote:
> On 7/30/26 04:48, Daniel Lezcano wrote:
>> On 7/24/26 02:04, Guenter Roeck wrote:
>>> On 7/23/26 12:16, Manaf Meethalavalappu Pallikunhi wrote:
>>>> Hi Guenter,
>>>>
>>>> On 7/23/2026 12:29 AM, Guenter Roeck wrote:
>>>>> On 7/22/26 11:19, Manaf Meethalavalappu Pallikunhi wrote:
>>>>>> Hi Guenter,
>>>>>>
>>>>>> On 7/22/2026 11:16 PM, Guenter Roeck wrote:
>>>>>>> On 7/22/26 10:38, Manaf Meethalavalappu Pallikunhi wrote:
>>>>>>> ...
>>>>>>>>>
>>>>>>>>> I am curious: Why not use static initialization and use the 
>>>>>>>>> is_visible
>>>>>>>>> function to determine if an attribute is visible or not ?
>>>>>>>>
>>>>>>>> ACK. There is already a comment in v1 suggesting the use of 
>>>>>>>> dynamic allocation based on the available attributes rather than 
>>>>>>>> static initialization. The intent is to avoid having to perform 
>>>>>>>> enable flag checks in multiple places.
>>>>>>>> . >
>>>>>>>
>>>>>>> You lost me, sorry. There is only a single is_visible function,
>>>>>>> and its intent is exactly to handle situations where some sensors
>>>>>>> are not always available.
>>>>>>>
>>>>>>> What would be those "multiple places" ?
>>>>>>
>>>>>> Understood, thanks for the clarification. I'll revert to static 
>>>>>> attribute initialization in the next revision and use is_visible() 
>>>>>> to control attribute visibility where needed.
>>>>>>
>>>>>>>
>>>>>>>>>  From the earlier exchange I had the impression that there is a 
>>>>>>>>> large
>>>>>>>>> number of current and voltage channels, but it looks like there 
>>>>>>>>> is only
>>>>>>>>> one each. That doesn't really warrant or need all this dynamic 
>>>>>>>>> code
>>>>>>>>
>>>>>>>> Yes, this hardware only supports one or two channels (voltage 
>>>>>>>> and current). What we discussed earlier was that each channel 
>>>>>>>> can have up to three threshold alarms (warning, critical, and 
>>>>>>>> emergency). However, the hwmon framework currently supports only 
>>>>>>>> two limit alarms for these sensor types. I have not added 
>>>>>>>> support for the third alarm threshold in this series to keep the 
>>>>>>>> initial driver support aligned with the existing hwmon 
>>>>>>>> capabilities. Once the basic driver support is accepted, I can 
>>>>>>>> queue a follow-up series to add support for the third limit alarm.
>>>>>>>>
>>>>>>>
>>>>>>> What does that have to do with attribute visibility ?
>>>>>>
>>>>>> I was only clarifying that the channel count has always been small 
>>>>>> (maximum of two channels) and has not changed since v1. The 
>>>>>> earlier discussion was primarily around the limit alarm 
>>>>>> attributes. That said, you're right that this is unrelated to 
>>>>>> attribute visibility.
>>>>>>
>>>>>
>>>>> Feel free to use (and test)
>>>>> https://lore.kernel.org/linux-hwmon/20260722185749.2313572-1- 
>>>>> linux@roeck-us.net/T/#u
>>>>
>>>> Thanks for working on this. I'll use that change as the base, rebase 
>>>> my series on top of it, and add support for the third alarm level.
>>>> By the way, for the voltage channel, the hardware monitors 
>>>> undervoltage conditions and provides three threshold levels. At the 
>>>> moment, I am mapping:
>>>>
>>>> LVL0 → min
>>>> LVL1 → lcrit
>>>>
>>>> For LVL2, would it be possible to introduce a corresponding low- 
>>>> voltage emergency threshold, such as lemergency (or another more 
>>>> appropriate name), to represent the third alarm level for voltage 
>>>> sensors ?
>>>>
>>>
>>> We can, but I really have no idea how to name it. lcrit is bad enough,
>>> but lemergency is even worse (or at least I think so). "lemerg" would
>>> be almost as bad, but at least it would kind of match "lcrit".
>>> I tried to ask Google AI, but it didn't give me any useful ideas.
>>> Any other suggestions or ideas ?
>>
>> 'lfatal' ?
>> After thinking about it, I'll stick with "lemergency", reason being that
> it matches
>      crit -> lcrit
>      emergency -> lemergency

I pulled in your patch [1] and extended the implementation to add 
lemergency support for the in sensor type. I validated the third-limit 
alarm support for both in and curr sensors.

The resulting sysfs interface now looks as follows:

/sys/class/hwmon/hwmon1# ls
curr1_crit curr1_emergency_alarm curr1_max device in0_lcrit 
in0_lemergency in0_min name power uevent
curr1_crit_alarm curr1_input curr1_max_alarm in0_input in0_lcrit_alarm 
in0_lemergency_alarm in0_min_alarm of_node subsystem

[1] https://lore.kernel.org/all/20260722192547.619281F000E9@smtp.kernel.org/

Could you please update your series to add lemergency support for the
in sensor type as well ?

Thanks,
Manaf


> 
> Guenter
> 

