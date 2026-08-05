Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43583E49C0
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 08:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785918047; cv=none; b=RjNUn2Tw72uV4gLQa+hZUKmEnRfRazocFow5k2ddJyEso+m/3hlg2DLkwcUn5OQKZYrJhQFzf6Tls+nrhF9SvjoqSGYPYPXQcnNh6Qn8F0xFL1NWa3lvqFH7zaKVOAAEcOD1A97COEp4ZzxWvmlUIg3ZSEW0FRwA4US+u1ad1tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785918047; c=relaxed/simple;
	bh=8VqKG5G4/7S+Q3teEMkRfZYkwW71+WGTnAxtyzkzXLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jMImS/rVcpO0VvacH89YP5aH0CTxHOgc8UaVr3Ty+M4MfxCmed7O/hMZgEeA31uft7lur7M1P6JQ8zMvhyMvdmaT1CWQ5M5osXjTCa1MqNsN/TjMrKuNLkI+OOPI4PHKQDOoeO1DhzSPPM7/+zaGmhhb91utc0bAkNmwH8s4p6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DMCQvOj+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DL3WEvDN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DMCQvOj+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DL3WEvDN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755kxMt1736540
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 08:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8VqKG5G4/7S+Q3teEMkRfZYkwW71+WGTnAxtyzkzXLs=; b=DMCQvOj+fFm0L9VB
	JuVUcjphS1DU8UeVVJqs3+RUrYv+xR33Jqyvex6UNQhOjfR06nFv+LZnXSCdD1nv
	P8kVw+8eHRFhy8MzR+kpsVQMk0noaMHAi+8A93HwZrdlYA4ldWr3dHW5DAJPUXKA
	k9XFLy450poSY/DE+PEeRITVHC1I40HtjNnEmeaX+a5N8evTS1W/CFcQLQvk4DtX
	F5Fku9NqugCMRmJ0glVAAMgITPSD7z3FxM0aEdkauUdXy0awbX0s/RGy3h0ojIR4
	/4R3bn0SxmGiuGGBzDuhtHMPJmJJiKojCvD+kYq6WpSHx3Al6Kq+5im2y+jZz2Cl
	0hSXjQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum56bgwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 08:20:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb48f41343aso1503538a12.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 01:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785918044; x=1786522844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8VqKG5G4/7S+Q3teEMkRfZYkwW71+WGTnAxtyzkzXLs=;
        b=DL3WEvDNPQzu9bQQad2wfnJJKTzxm5CAktKSVgS32QBzsp04FfNHS3YOdWp7EJtTmo
         YLae+iiU42PME5JQWgTJKpkzJdrpHgGBHFt8zPfc8MwKAvmNC7Q5W+HQvCg49kGXvKo2
         eARE4qHlXocEHJPa5fKrKmd/G4MuXLgj2b8Kle26YTWAmyUuMZFwZFbQsnrF1zyZ+sIi
         7jjt7AnOSmLjtbGKaL1rawX7XqgO/qW6jZuAzMw3aSdb8Wxodj6c10I0K0+6omte0gAE
         Da2YURwfgekMtUC/mxqhVAOEGyUx1oUXA544fAq7D8Bv3ia1ByBWW6udBc2oJPgIKZWk
         9alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785918044; x=1786522844;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VqKG5G4/7S+Q3teEMkRfZYkwW71+WGTnAxtyzkzXLs=;
        b=TXx4nQ7zew1EG/ezsA+hNRLTVkb9DYXX7ytdHcCULgip9fb/I/8sOyrderT5Qb1UiN
         Uw+DbpJierOfwzrYYZCLcT6113UMwXAdA6vXYVz0Rh1hPD05vZkIBO1TcyzMzMPSPBpX
         UKeGJeueXmGQDkytJtIqQgyhiPZwKpQK3wwLHGPOLbzrm5j2MwaAQJT5y8QhrAYOlqBe
         JQ+RCTm6jdqsvc8BIL4UY7TfQPWIyJXJuhEPt5/MyoajJoubIz+/VfPLeVHz2IFk6vw/
         N159RF8z2syC2jxMz086TrInGLCr7yUhYXD8wLt43AZ00s42YvcoxMcgVAbrN15oCSam
         PM9Q==
X-Forwarded-Encrypted: i=1; AHgh+RoCZ3vCiIzlk+Bh+8sjr/2KYYTTfkMFmcrwI9NqHvhcbNlwmQ6JfgCBNPwRo+bJC2PrSt7pgRPv2/nk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx90taQGJLlDoJ3W8mjWItXjlVPpwFshXytvhNljdlGIeKNmvQ5
	ASt0lxGskWh4kp+vUUyNAtFhvPxHGZ9dJQd/GseO3K9pijt7Q5VKCW8jKJvrQYed88QuMQFIvwL
	CejEqiMJCc0pzEAsMKMj5cfE0fSHTONqSHJG5WTAh95yMDaKg/taXCQiXxDafHv5l
X-Gm-Gg: AR+sD11Zd/ZcL4HZNCkAFkf81lNosZ+pyFmlvCuATJkQuZaxJQK1s1/EuTJ0DtSJTaE
	2qyyi9gD1HOOXOTyWENjCLXJSf4ZpCIvzafLoR+BQ0oLTSa6UDg/xpKIcHsNNTEn7MI369EwFRj
	+XE6M8KgDVVqwjhK1a+I8WF7vGuDHSl0R6Vx9bZJOGFFr+VeurTeIvW6S2PJkEh1ggZROWnWLnU
	PP515ew9hYay93YzHIcJHA9xApKV2io0yZL2JZMvgB700DWzLbAnKp4k8ZxHe1LsZ6mK5fQ+104
	f11eR2uOsdzIT6oB0eJbvb5chGWPmDC+jtc1AhU4o8zOHVZ6Mlm4fkRT+1YGg42HDp59lRDmuJi
	Ui5ILKXgRn4Ny5rnQYqGOqnSDoJ+HzMXbwg==
X-Received: by 2002:a17:902:d486:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d08aa64855mr95188025ad.9.1785918043779;
        Wed, 05 Aug 2026 01:20:43 -0700 (PDT)
X-Received: by 2002:a17:902:d486:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d08aa64855mr95187635ad.9.1785918043312;
        Wed, 05 Aug 2026 01:20:43 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4d8af6sm14454145ad.74.2026.08.05.01.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 01:20:42 -0700 (PDT)
Message-ID: <4ad24e6f-03f2-47a5-be82-33b51bba1e40@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 13:50:38 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add qcom,vmid to BAM-DMA node
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260714-b4-qcom-shikra-dts-bam-dmux-vmid-ext-v1-1-5b19da8d7735@oss.qualcomm.com>
 <amu9hfJQ3VhRZ6PR@baldur>
 <a8862b6a-28fb-492b-83c9-a02730fc366b@oss.qualcomm.com>
 <anKwCKnt-3wrtzRt@baldur>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <anKwCKnt-3wrtzRt@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA2NCBTYWx0ZWRfX6t/ltAS8fxkV
 r0pJ5IYnsEgwhysiHDNm+mJcu3J5IyFsM+KegrG7lOHzC+I3EF6DX5W0HLUFI90Aj9HFbtFkQOZ
 1p9CPlzHU7XC9WNpzQ+D2YDwxL8oEqjq8mJO/xSD9CtuUWJp61zAbhvzRGce+J1TrBJAMuaASaV
 7wL35n2tSAwNX9Gu0D3LHmz6+nqRc7Tieitg4QTqAPNcz76uHXj4VYQg/qJqsXgw+iLUL6FZYDg
 ISPSMfGxSE/ykYVAFDhydJiAfrn5NiCOxZqEugHMECAW2Nff0uhMvOZMh4Sc26ZEOojJzlAh9EB
 o0D0JSVBJaxQP0PpR6fhZrOPt9b3wpN+wDqRsYikge5y4sJcsBV76iE9eRoPNsLAfTd7M1baT5h
 8BB17pyIkdFVolsWNS40xD0ghfSnukOZ/Jx6vzR0x48mjaLKVKVnyHpo05pzktx8CSUnsel9FUf
 IVGbMQI+aijB8ABvXhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA2NCBTYWx0ZWRfXxqioExCddUxf
 0lMdPfBxX7UoSi2zaZK2kr+HHKWcovX4Y8VXVi3qI7QmazsgFiR7ElVAXZ8qMDshhOAQjnslhT0
 3Yq3jspG1v8WwzecK9VXZJ5/59sBRos=
X-Proofpoint-GUID: XbD3kvniK7Dq4Jl-yp33Flaic6-HajNj
X-Proofpoint-ORIG-GUID: XbD3kvniK7Dq4Jl-yp33Flaic6-HajNj
X-Authority-Analysis: v=2.4 cv=GL441ONK c=1 sm=1 tr=0 ts=6a72f25c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=oVj3lZxTCizMYWdbe9AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_02,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050064


On 05-08-2026 09:08 am, Bjorn Andersson wrote:
> On Tue, Aug 04, 2026 at 09:49:18PM +0530, Vishnu Santhosh wrote:
>> On 31-07-2026 02:49 am, Bjorn Andersson wrote:
>>> On Tue, Jul 14, 2026 at 02:01:53PM +0530, Vishnu Santhosh wrote:
>>>> On the Qualcomm Shikra SoC the mDSP (VMID 43 / QCOM_SCM_VMID_NAV) is
>>>> the AXI master for BAM descriptor FIFO accesses. The XPU enforces
>>>> per-region access control; without an SCM assignment granting NAV
>>>> access, the first DMA transfer triggers an XPU violation.
>>>>
>>> I'm a bit puzzled about your plan here.
>>>
>>> You posted this on July 14th, that's 3 days after I asked you to rebase
>>> patch [1]. This patch literally says that [1] is broken and untested.
>> The XPU violation itself wasn't visible against the base bam-dmux
>> enablement alone. It only showed up once the access-control policy was
>> enabled, which happened to land close to when [1] was posted upstream.
>> That's why this series followed so soon after.
>>
> Are you saying that none of the shikra patches were tested with
> access-control enabled?!
>
> Regards,
> Bjorn

Correct for [1] because access-control wasn't enabled in the Shikra build
used at that point. It was enabled afterward, which is when this XPU
violation was found.

Some context on why this issue is Shikra-specific: A2 BAM (used by
BAM-DMUX) sits in the secure domain on this SoC and doesn't support IOMMU
Stage-2 translation, so there's no IOMMU domain that can be attached
to it. The XPU is the only protection mechanism available. On past
targets like msm8916, the same A2 BAM configuration never surfaced
this class of issue, so it wasn't something we'd seen before.

We are currently discussing with Stephen on the SCM calls on bam driver side
to fix the violation. Once concluded, will verify and fold the dt changes
together with [1].


Thanks,
Vishnu

