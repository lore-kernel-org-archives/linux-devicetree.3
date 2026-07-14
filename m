Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2941F3DB330
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013725; cv=none; b=hBevuvRzqxUYvMpxVKITvGq1SE1K8SM8clSYqBKPTGqrfkVahjnwXvm4495GLNg7dWQlqqanRab8gkGUqufyP0nT8JZiXkxjv+YtNd7ErPH4nkXL7KNJqaBdvn+3BMHrVseEp9ZbMpICrIImasF2jBfcZdgTgN9YbfqH/BlzlG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013725; c=relaxed/simple;
	bh=oKTCy22CxgnC324cb3PyZrbujxVbPFBxc2/hevIt46E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gzkr4UPZx3g3QLaw5Iwx9fi/GQJcAlLE422nFMIZEPZAUH0XZ0CcXlweU7O7uoQFVnnY5DBRi+N3AxTUdlFTlzTc3nAUZ+nitPKFkD3OpSUHBcp+yNNwM0rAHLlasA7+zITWJ+cYk0sN4zU4xeqDQ1NBkl3cpd9kQ0bvZoaBCn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V6SyD9Lr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2fZrIcL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V6SyD9Lr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f2fZrIcL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SSGc3743626
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	As88+E6oeC/hkzQqTfAlXei3eLyRxyuFIWEFsQIurtI=; b=V6SyD9Lr0vGeekpP
	i6uqYnqlC53+7yumD981XSFa2b08UJRLHBIEYSzPWTlLYuHxBc80uQDEpy6s4RTf
	qy6nhnfzrXTwDYxpw+gfCjXBQ9loNaf/YVNesIOK0OKaBTW5VvZSclGNrRu0IWQ3
	XXVkoFwvWPRZAihcsMP4UIkztCcz3Ei4+oq+RN/begQM0B1RTIlfxJigfx5DNzLI
	/3QvhBBc/wiZiRlc9PzZV/RAd/DnNFyhFoSYE3+XeY7VKG2ELQiFZ3RM9eoucRSX
	ep9O/fq2unCsK0kLV27d864oV01D90H192+aCnOKBkdCyjPzuNOQnSn3Ml2fRC+I
	8P1ieQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p2gwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:22:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb687f82eso62724095ad.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 00:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784013723; x=1784618523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=As88+E6oeC/hkzQqTfAlXei3eLyRxyuFIWEFsQIurtI=;
        b=f2fZrIcLnHJcyCo5l+lY1Uco+8rAxe5fWXK/C+O0SiFF0eQLNLVt7vFKkiCnjGv7oy
         GPqVarSlaStXNp1vHYIqfM/Agt0TzywKdmkSslVf9FAOLrkoBqBbpRAgIqCjkmoJtuH0
         sgY6PCkgQfknikYczMiuqx/0rFZ+olJyF08rUEcD6PsyF72b3CjMUxowOmg0QZpR+hzL
         7WA4suFw1uYVGvReZryhUNCaM9luIasV+cTXBsYz2F4ZfWI6bRMuA3bYHDElLoe0tgLq
         jJBP+GFSu4Hh9Dq1ybdSNqrnjMJ9J4pShNqwEd3+5G7vV13xqOg6ccYmzU5RvvYpbfCH
         0ZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013723; x=1784618523;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=As88+E6oeC/hkzQqTfAlXei3eLyRxyuFIWEFsQIurtI=;
        b=F9v5GNNrH/hfcUzy0R3GYSV9bJryHYAdUY9iPGYsoOCY/Q3s9qnZwjNj3DmoeviayW
         sL1VgDK9y4sC/nufszFOisTAw5AlvzxNjqJu/WZdVtw+j/tt22S5f/S84VFm9JzawxfD
         yr+yzcPz5atA4/RNNx7L+gsRbkLkyK4KLiKrfAvLT3nTJt6JjMNjRoTz3OiUnsf2NF/r
         BcO99NYDUvsUP4WxqpePrnHanbJnP7F3zkZajlN5satdW3ZNEUQzdastUN4Fva9nAyVu
         jc6Pr+vVBNgftJrYxodotBmYIGgKid1IQxLUfTYDndcBiAtuF423U1mvq05irCsfrnuG
         3QcA==
X-Forwarded-Encrypted: i=1; AHgh+Ro9Awad8vVSVf7O4lyn970gk+fqENeG+Yd8Yso89bQ4+jUqIVmII/whPsfuh35ldtF4DpdnAz4WseZz@vger.kernel.org
X-Gm-Message-State: AOJu0YyfuYeyxCHlKebYjHVERUbSXFXRlTauTt2MAW0QRLRIIBHcnVg2
	xRkv47sMTcE4nipwXUchER8NyMTn+dX+T1DM6v5vVIffXILHp/MsCglT/LyxUgH6GvxmCacpANQ
	fU7YtTO42cM2U0tMERHzBnpkh+kiRCAS8ZkyoK0K+dwZiwL67VnhjMo0k/0JjWIS/+fWn4kGz
X-Gm-Gg: AfdE7clVFBu8yzdUDxfhdTSFCbCCWLatrO1eosnKeJmcRKKXMKZf3Zg9zefSCJ0QvGN
	nJUjzodxiIisi9BnxZdAYzJ+QFd8bRRjEXDBIftx4mCT+2yiB7kpHxnTqtsxbd3tNu0J25x1a/M
	qwb41SMFHC8RTFGmFHfA8P7OYRmIVvZbULEM1zVtFOVk4I6cloEpKZ1yWMHbCgsumA6D721kJzR
	SL1pK8KF9WIajfnOwK7VmKk/1Tg5wDN7x3cuNexlHtCADbec+1I76Wd/gIs7NehaSf5pm+Jb/6L
	2vymUlcvyQ185zp+YiFvWg6s1fMIL72UnhdXSVt5iZNMx2fREkJAIO3I7aCC1cz2iCQ1WjrKLSf
	UiTslRG1LLYbcv2jzFvnGnFkYjTD1SvvZUEhciolA
X-Received: by 2002:a17:903:2d1:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2ce9eabdb67mr106950725ad.12.1784013722834;
        Tue, 14 Jul 2026 00:22:02 -0700 (PDT)
X-Received: by 2002:a17:903:2d1:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2ce9eabdb67mr106950425ad.12.1784013722261;
        Tue, 14 Jul 2026 00:22:02 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cef8852e68sm235525ad.37.2026.07.14.00.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:22:01 -0700 (PDT)
Message-ID: <4efaa8d7-56c8-4581-a161-51abb319bdcf@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 12:51:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
 <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
 <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
 <h37rmadj4yallpbm3n4vehm2rcflocwen65jacg7kd3zmpo6hu@ohjpgawid6jf>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <h37rmadj4yallpbm3n4vehm2rcflocwen65jacg7kd3zmpo6hu@ohjpgawid6jf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3NSBTYWx0ZWRfX/7HOzsQ/ZCIW
 xEwHIOadwI4Lx4PUJBlmOTaEQiWr8xePpqeriHopU5IkYCLRwXW3q755AiadkKlVx5Sqte0/sao
 hVN4wTpRqRmHcDg6yvVg8+oJZg5R6NE=
X-Proofpoint-GUID: rOelaoLfItOUKoi2YQdzt6thHtkj3GyS
X-Proofpoint-ORIG-GUID: rOelaoLfItOUKoi2YQdzt6thHtkj3GyS
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55e39b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UrGkU9YJQ5gMatbWagUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3NSBTYWx0ZWRfX4lofz+t2OiPx
 7Pb1lc//AVNDq/N6u1K/ezEz38RuX6abQuv8cUu5fVuVwYdm40JFrUzVUK6npaxXfl2PT/2F4TV
 f0td5stwLHEA/6ts6fj1xgT9RM9geOKUxIxvpjlffMuIhgL5149Id3V0xd9zqJ5UhB4qo2p+jOo
 koP2U9iB8KOri7m2JqCFK2U7gj5HTbvAMs0zzNDmIJvNQCxh5/W2voFSjek4+XxufLdlKQ87B8e
 9XVb6mlcTVDZgFtGH3QvhA8HDVjWsB8v068Pl3e/D57ZRBS6Gdz64UuSylwGmReKa6QvNCH3gx2
 UqdYIpxvBn1JgcoEO/sp7Plq8Y2iRh8drm1LE65SkS1CofB/gqRpFnRPsld0puvSz17BqWOIToE
 JBDbziO8k41abdNtDQlvklxvMMfr12MUYOYaLZHMqmO53e1TIMHLRo10PvR8wVg+8YswBOBEVk3
 JgxZ4aolkCmZbGa8uWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140075

Hi Dmitry,Konrad

On 7/10/2026 6:09 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 10, 2026 at 05:28:04PM +0530, Arpit Saini wrote:
>> Hi Konrad,
>>
>> On 7/10/2026 2:31 PM, Arpit Saini wrote:
>>> Hi Konrad,
>>>
>>> On 7/6/2026 3:33 PM, Konrad Dybcio wrote:
>>>> On 7/6/26 8:04 AM, Nabige Aala wrote:
>>>>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>>>>
>>>>> Enable the Qualcomm Shikra MDSS display subsystem on the Shikra CQM EVK
>>>>> board and add the DLC0697 MIPI DSI display panel node. Pin pm4125_l5
>>>>> to 1.232V with regulator-allow-set-load for DSI PHY PLL stability.
>>>>>
>>>>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>>>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>>>>> ---
>>>> [...]
>>>>
>>>>> +    panel_bl_en: panel-bl-en-state {
>>>>> +        pins = "gpio91";
>>>>> +        function = "gpio";
>>>>> +        drive-strength = <2>;
>>>>> +        bias-disable;
>>>>> +        output-high;
>>>>> +    };
>>>>> +
>>>>> +    panel_bl_en_suspend: panel-bl-en-suspend-state {
>>>>> +        pins = "gpio91";
>>>>> +        function = "gpio";
>>>>> +        drive-strength = <2>;
>>>>> +        bias-pull-down;
>>>>> +        output-low;
>>>>> +    };
>>>> output-foo isn't necessary, the panel driver will assert it as
>>>> necessary
>>>>
>>>> Konrad
>>>
>>> Ack, thanks for pointing out.
>>>
>>> Arpit
>>>
>> I just checked,
>>
>> Normally the backlight EN pin is controlled by a backlight driver.
>>
>> However, this panel uses MIPI DCS based backlight control with no
>>
>> separate backlight driver. Since there is no driver to assert gpio91,
>>
>> we control it via the panel's pinctrl default state..
>>
>> So this is platform specific pin , we need this to enable/disable
>>
>> the backlight.
> 
> Handle it from the panel driver. Also please fix your editor to prevent
> it from inserting extra empty lines.
> 

Earlier I handled it through panel driver, but this GPIO is specific to our
Qualcomm Daughter Card, it is not going to the panel connector.

In earlier panel driver version v1, I got comments on dt bindings for that,
so I modeled it like this.

as Dmitry suggested here [1], to not include backlight-en-gpios in dt bindings as it
is not panel specific.

are you suggesting any other way to do so, Please let me know.

[1] https://lore.kernel.org/all/81724048-0cb1-4305-b613-374c14df87d5@oss.qualcomm.com/



