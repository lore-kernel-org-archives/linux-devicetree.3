Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736FE2F60CC
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 05:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782365274; cv=none; b=i5JMnGDKGvEjT3d6aa/oggpIxzpc7nE5rbojJpYGes7bdeZ31XfigMbRg5mmTeQk8v3H+fkdWVQjf5yJT6S98fYoLBZve4Eeh6HHZNUDi6Ahr6vz/gcAk/SnFR5AXz1qECO6a513ySSVkuGb52RMGA1U7e4du5YNFEguJKE3m+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782365274; c=relaxed/simple;
	bh=utZWytu5ai9CNGXAFQcug6qUDSlwkkNLzLZU6nCx/Mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GclTtII7pw+Q0GubVCVBpvz04hsPVxmYKHay2xw5jybChWhgPFpOM9y3TgXmfmPuKkIaSx+OphJ0oRSqXsMxduw0YlLm3Anj+fb9cnDotwjX1qmtLPIHKm4PQcTVft6lJqMcFNzhx0FjAoguIikJ0jbRrxd0co1WwdnFxbtbLTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g5oG5rve; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L9VE+Qsq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g5oG5rve";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L9VE+Qsq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3e2tG2261589
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 05:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	68QmrLLXwE4JrUm3cojVwQjQkH3bZQyo8VxIUTcnh8U=; b=g5oG5rvee8BQgALl
	vh66gsQhJa+vEZoh8oZa+cPblCRO3VmZU4gjyNWkpiDKAfG9s8g30NoFvtx8wWmx
	sO1CAwSx/hiCW+Rhv+Vlp+IMjE4uZom63OTaxaN8Kv0+2qD9UMOCiO8w29O1O43W
	ezBj4RcfRrfQJMPZji9KnDdwo7zF7B804StRC+eVu1tlpN6bkbTe5S1hqKOyfzwA
	AEGsdF+nnYpyiXH51FK10IKfaVWkVJS+IHV0fQfHdnRgPIYg/+M9YPfoYZ+SQs8Q
	PNOFUEDxbK0R5uwLFx9myM7HoCQ3V9VA6AxqzpIg2QiSyuMzRv0uwywOUxh01C5y
	Y5pjew==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0aqpcrkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 05:27:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c860544c077so2362564a12.3
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 22:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782365272; x=1782970072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=68QmrLLXwE4JrUm3cojVwQjQkH3bZQyo8VxIUTcnh8U=;
        b=L9VE+QsqkzW50CPE1yYwpvleLyj5iuaawj3VU63Oq+1rYQhjqtlqo3YDlwPkghinH/
         26LH4EzCJBtfwmTPaKnxQVJLaj7bC1Wg72q/mj+5oUk1NehKj9+anLWiepYuyBHK4F/J
         xSw7FPHkU53m6UVqnuB5dlv8mMJbeplkmYIbVAh3bJ9lWU7Cc58T4BhLVk1VMWma2RjN
         cAtsF9CKe01pqF+MsthJO44n8lFBc6enZD/wXxC4s6NnGo/v23atT8+v7z8X0fUM9PfA
         1k/Sq4unKXJH27neVVLOKeGCWtliaIv+uw3QpEckxIcMpfrKLrVrRnFVBbSfzBUHXjh2
         J8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782365272; x=1782970072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68QmrLLXwE4JrUm3cojVwQjQkH3bZQyo8VxIUTcnh8U=;
        b=SV4G4IhuEZCMSG8HrAa/+8b0ZeNaupVfIKqCxh1v/PTdXYa4fN8FBf2Kiu1qHlCTQP
         1y6nxS/KlpjbxGJgTu/7OrQ7yPwV5aPxUlf/L3fl5wUd3p3J7Y0cmFv2uMdOZG/3Vij3
         hnIp7577ic8aRq/qslFQ7M62BuH3SS2DmU3XHvRFNG64MUsZy7bCQaPEA3iR2B69BF5C
         Mn/zec5gyb0j6sIxl9JaAnvD1ZV8VebaJit5H1uKQYVnj0svDe4z9wvEgqeoD9clITJo
         OuFlf6N+L045m23ggp2GrpgUegojk7/l6+ZpTSHi4UC4deA2vFYJYlJTRjaA1eB3pU4G
         yMnQ==
X-Forwarded-Encrypted: i=1; AFNElJ++CmtUDAi/4r7VvQAEIfa2dYSCfHnxWsA+EdPoiaNwoKtpn4Lu0dpO5mEHF67pUF4OSHMJ8AjsW6X2@vger.kernel.org
X-Gm-Message-State: AOJu0YzHzC0hlfayHUlPAEIy0M94hmHJBE7rTUsei4bK9lncYAyett6g
	xKfKWQjn3etfTsstZns5h48Z7TICjbUCjXtvTKZ762Bdam4VtJAv36ldxlCJUWUcJCOvLRzBMQk
	z4Ugl/xYHId0ygu8anlUoMjWvoxL3P+qKCFW+70ovWmj5LSgmwUOt9XNVCajZ0ThF
X-Gm-Gg: AfdE7ckN0DBbFPRf6scODYWU5CDRWYd1x3zlBnHviICAxEQ4PYa63a70A1c6xQc3FiB
	bPNCNfcP9oFbnY6hmgLjdNHgUvSmDQ8vucv3mcP3zFrDDAQX+R/SKEJcw2lEvUjuVd6XgmiEe2l
	ygG6t7e3g0J8Y2yxT/Yzx4NZKlUls8h4HFQD4OUfWNcVqZhm5sJSFgjzdsf3JvRSM76EZ3gC7OS
	8az3PLTQEc1UXCJqMZT+Y7d/Sohq3Px/DV1zkgeCxG1o+Twv0+swc7nvHwV0i70TfSsPPhWc1fM
	9IGYSdsUAstWN3vkkP7tVRmQuFR3ijx8HjmTfKUZEGdXFSB2x/BBdljchftdK7HkHtXGMpvHSMg
	8h93kb/wk9R/VBZk01Jq6nty2wljPNmOV00F/ESvJhlRduzvTTfkfkU75gYuTbrt+kI9q4bqyA8
	atO8NuiB+42u4Zym9OAkxn4B9F1ta/g/jK
X-Received: by 2002:a05:6a20:b786:b0:3b3:10e1:a87f with SMTP id adf61e73a8af0-3bd4af033a0mr1353216637.31.1782365271675;
        Wed, 24 Jun 2026 22:27:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:b786:b0:3b3:10e1:a87f with SMTP id adf61e73a8af0-3bd4af033a0mr1353170637.31.1782365271237;
        Wed, 24 Jun 2026 22:27:51 -0700 (PDT)
Received: from [10.50.49.21] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c93522747efsm302606a12.22.2026.06.24.22.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 22:27:50 -0700 (PDT)
Message-ID: <ea9d0c11-e110-4d13-b165-1548875ef9cd@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 10:57:40 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v7 0/9] firmware: arm_scmi: vendors: Qualcomm Generic
 Vendor Extensions
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, Amir Vajid <amir.vajid@oss.qualcomm.com>,
        Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
 <20260616-responsible-junglefowl-of-chaos-7eda7d@sudeepholla>
 <8725caf9-cebb-49ce-b2c8-4960a6073322@oss.qualcomm.com>
 <20260623-busy-beautiful-trout-8cc2ea@sudeepholla>
Content-Language: en-US
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
In-Reply-To: <20260623-busy-beautiful-trout-8cc2ea@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kO4UvO0UnBX9GxZflUrkPB_yi3FWhnHJ
X-Proofpoint-GUID: kO4UvO0UnBX9GxZflUrkPB_yi3FWhnHJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA0NCBTYWx0ZWRfX0h0xKwrfIlr1
 j1IT9exIB91VO5iVIX1SU0lTpZO80L18WaRlU6i6964jKFBEIOEzlc+1Qdyf85SE3qRZUsepGju
 1Jx1Q3ZasjcU5yUghrETjdAdBufoDU3nV5o2DE5aDjelgVEOGH54GlAdKlV68gCeVqha4S1wFCY
 B/d9xg/K9tYx5jG3LC0s1WS8FFW4/06us/3gDBNINukOr3+tcFjJ2wddo7/jaY59M3HTgLjfye7
 hdXHtN4ctrSn05iQQSm6uPzhMWpJpwo1Ris1T1B/4fR/fxrLYrXVl7AN27aFYvZpxx6lYgODp+i
 OHpc10E+80ctpgbh9tyhR91yoy1jz+UfxXS0oU5PXTtSJJgG2hbOOgL2W7hcAByyhRiKyJL0NVE
 3WEn5nOoE1vVMb1QsHd+Yi3oIsT9RCUjNN8vAg2EMbf6aB1aFU4aHbM5rbv5TB+I/JVwrCSVlag
 0O7ya3yR8X5UFRij8HQ==
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=6a3cbc58 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=TXgiicuEePHzAitInHsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA0NCBTYWx0ZWRfX7qa3LytbtmcI
 /XI0ckzzSYvV6R9YUDX6TPUNF7Sttz2ocSCGJAn4HzoVsNFybxqlO6IyombwTgv9czeCTciGVT1
 YedGT4CmGdHtcXqTzz28SI1G2dBkO7c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250044



On 23-Jun-26 2:17 PM, Sudeep Holla wrote:
> On Fri, Jun 19, 2026 at 06:01:23PM +0530, Pragnesh Papaniya wrote:
>>
>> On 16-Jun-26 1:57 PM, Sudeep Holla wrote:
>>
>>> Not sure if it was discussed in the previous versions or not, it would be
>>> good if you can capture why some of bus scaling doesn't work with the existing
>>> SCMI performance protocol and the monitors don't fit the MPAM mode.
>>>
>>> Please capture them in 1/9 as a motivation for this vendor protocol. It will
>>> then help to understand it better as I am still struggling to. Sorry for that.
>>
>> Thanks for the input!
>>
>> SCMI perf protocol exports perf domains to kernel where kernel can set
>> the frequency but here the scaling governor runs on the SCP while kernel
>> just observes frequency changes made by remote governor.
> 
> OK if it is sort of read-only w.r.t kernel, why not perf domain notifications
> work to consume the change done by the SCMI platform.
> 
> And why do you have set operations in the vendor protocol being proposed then.
> It all looks like something just cooked up to make things work. I need
> detailed reasoning as why the existing perf protocol can't work considering
> all the existing notifications in place.

Please do take another look at the documentation and driver changes to see
how it all comes together, since it's apparent that we use SET operation for
a ton of things. Taking another stab at explaining how the MEMLAT uses all
the ops exposed by the vendor protocol.

We use the SET operation to pass on various tuneables (IPM CEIL, stall floors,
write-back filter, freq-scale params, adaptive low/high freq, sample ms),
the core-freq -> mem-freq map, and min/max clamps) required to run the
MEMLAT algorithm on the SCP. You might ask why can't we have these values
stored somewhere on the SCP itself? We would like to but all of these are
tuneable values, that can change for various boards for the same SoC.

The START/STOP operations are meant to start/stop the algorithm, in this case
the bus scaling algorithm.

We use the GET operation to get the current frequency of memory that we
are trying to scale. It can be also used to read back all the parameters
that we are trying to set. Another thing to note is that exposing the current
frequency to the userspace was something that the community wanted.

With all of ^^ in mind, re-using the perf protocol becomes impossible.

https://lore.kernel.org/lkml/k4lpzxtrq3x6riyv6etxiobn7nbpczf2bp3m4oc752nhjknlit@uo53kbppzim7/
https://lore.kernel.org/lkml/20241115003809epcms1p518df149458f3023d33ec6d87a315e8f6@epcms1p5/

We'll add more call flow diagrams as part of the documentation for the next
re-spin to make reviews a bit more easier.

-Pragnesh

> 
>> While MPAM is not enabled/supported on all hardware (Hamoa).
> 
> Fair enough but I still don't fully understand to rule that out yet.
> 

