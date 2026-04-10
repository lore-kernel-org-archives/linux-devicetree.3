Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0D938BF76
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775810492; cv=none; b=QMXBXFsmyTpdcNMrBxxh+i2QevX3sSvnZgFcEZyqahP7uSAV3KfzGPHCjCfw+YpilErJCrWq+svfZLlGtHxB0DAcrOv0W9eEYG8VyYvxhzAEHI8/wFXzBZ1vFXuxSwhGY4L3Q+Jrue1qmTMYfmMDod3gnAumu40IBldLox8/hmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775810492; c=relaxed/simple;
	bh=L55gQgV2VqfRHB3kgV15oShwGxLR3LWbJNhDSOa9we4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+bM7MHduEFlxaITI1V3wEe4YKvnY22CmhZJKZWNp/5pVSsgOFYboG1LVbw2zI8vt0dHAmN24NYCnfzNE+j3BqwYGcmfgXhWizNZuTT3e+23bdWp1/cxnxQsyI3tiU2u4vnNXtwNZKkWhg64hcqzx9X+myHCGB/WfHpsFZJTKl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtD4IXMD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jqjpbgRz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtD4IXMD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jqjpbgRz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5Cqqx2866555
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	07i6b9jm14fpmcPVX0s4Eck0s/m4kny2C6giuEzHva0=; b=TtD4IXMDLgZYhDRa
	UUlOr0qDYNY11Cjr77XiujvX5Vty7SuEemZJNEKOmZubrVD3CGqhch3VsZ+cW7Og
	N5QkZcq42Zd2hHMxAPX9RlfMSWuThBkjtUGF8C6TSBh6XW5a3nXBz+rDe9OYCNS5
	hybv5LRFQne/9PTrpmKScVT3Mx9OAiJhjrSa0bVH6jVMmWO4CmxeV7IUrOwaJ3PW
	4tbeJTA6t2j8Wit6TtBrsfgpCw40ETWt7fPKaIHTBY8jsWliA8wF23Sk46Eirdyz
	+miTUGg0qKDU8pEXs4HEBzh9cCY7/OlOftYvcUL+64ncOC2vCJ4EmIzKhKr/NcIH
	C0CMAw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decaykk4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:41:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d99c2908cso2148124a91.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 01:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775810490; x=1776415290; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=07i6b9jm14fpmcPVX0s4Eck0s/m4kny2C6giuEzHva0=;
        b=jqjpbgRzwSOcZSevMPIuvA9OTlzV1lnPDzEekEbuTYyz4c8V4m3CD2R0TY1nTEZkV5
         Mf20onOa/slIlblvkS6DwrQrVgcMJCYSplrAbmqOSlQ/CImeb/7VgaAkteBMBltPLq/Z
         5jXTUzhgoTgaFwxz3H5tAGjokChrIHac0tXsXT1qCxEH2RyJMn+rb/7t9EUhbJULJqQ0
         IYBeIAZgRzFRviYef2w8l6E8yAgHsmFvZQBmskAWu/3xuyF23VZBPQI1G+dOZLVhG99l
         xNDNOVE/lEkgTlO6hGYJ3I0nKw952pf6JiVS/bjOqRNOqa1cneEYPvjVA5iY8l7s7xU+
         Cfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775810490; x=1776415290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07i6b9jm14fpmcPVX0s4Eck0s/m4kny2C6giuEzHva0=;
        b=Q2QljLJJvXiUIwkBjThW7PDsJcTt0JWXMOZl3dOv6eYHfBYN+jQ8ce0X1t1MXwZmLU
         260QTov2xP1NnzWvcNkyu78nfY5YmNAqsLMhhmP3CUB2QULUDSePgsTH22bms9d6xrMA
         1UzGx+LovInruhp9liAlLKRkTjDU0aYuSPms8CLNHDAN9c1sPFV8LonZSEED4ksI9Fg4
         oREbiD7q/U6WwEJy7n98Yr5IxIfR3e93BPURIWlansKgZ62kyfVd+GJoJ4a3/AksnM6A
         gPTOy0KEGhP5bOsOs5T1D/HzEUH19lSOIPE/MFZJLnvFY6SVWo1u2qWG+Af1gat3f2AZ
         Hi2w==
X-Forwarded-Encrypted: i=1; AJvYcCVwbkYSPFyCr3J1LoU3JCYFfAQGBYLmzGgCsYex0Bx8VW7Q3ocT9FdRs9bJgB+B2haX4Fpdv1HNfMqk@vger.kernel.org
X-Gm-Message-State: AOJu0YypalvePVt4edqgKAGomF7fwiAP2afNIiKuJAR7DN2pYBoBPKRx
	Irake5QhtyPQDMOZMT/sv//ZaEUp02DbqVzAdMn2OwJiMWLxGeIRNAwSN28SKloG9PWH+7AYi3m
	u5ybzjqRQ4ueEgvfpsXVdq61gHxnFOdJ6HCPvxlaiHkRSchRtomMUdjWtxI7i9mN5
X-Gm-Gg: AeBDiet83DxZU662NH4Zzrfaxt0dtiBkyn30HN9rwFwHR/C1f5xdYvPt2lkZB4r+WEO
	/z+csnIms/wyEAeLG7k7+6brmwypQqHK+UxCje6bJf3bfxvGShqkJGpbCEZnCaIe7e5MNL2Kxgb
	ZH9BE7MsPriOOw/lBe3ubl1KNxVRqwrh5Pm07VqJZH2GLKiShspq1LYrEaehCpHjStSBegbC40a
	1yzhyVkH1UiPwYR/WRB9zlkSz/5DIiaW4jIqbCW1aiHjFpfUxeg1s2+DOo4RD7De/T2ZXC9hurw
	gEpCmoAJKnnNF2d+zNbiZPF+/PMd+JhrU3Pe14BXmkyBqhPwwasCvyETQPLDn7n5YI/PdV55sB1
	wCl32lCrfgi+wt6/7HvhpQF1PHd1yPF+0fsmvYbd1LK4UyQcTCoBr9kXJ9BGh0dI94/s=
X-Received: by 2002:a17:90b:53c3:b0:359:8e5e:43de with SMTP id 98e67ed59e1d1-35e4281194fmr2857156a91.22.1775810489773;
        Fri, 10 Apr 2026 01:41:29 -0700 (PDT)
X-Received: by 2002:a17:90b:53c3:b0:359:8e5e:43de with SMTP id 98e67ed59e1d1-35e4281194fmr2857123a91.22.1775810489251;
        Fri, 10 Apr 2026 01:41:29 -0700 (PDT)
Received: from [10.152.203.161] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e4133743bsm2458206a91.15.2026.04.10.01.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:41:28 -0700 (PDT)
Message-ID: <9d99f3ad-e2ec-4a17-ab07-3d379dc28d55@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 14:11:23 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5210: add the bootph-all property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409-add_bootph-v1-1-cb2b5093f7d7@oss.qualcomm.com>
 <8fe36a5e-1ebc-4c5f-9c3b-3c50ebd2274e@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <8fe36a5e-1ebc-4c5f-9c3b-3c50ebd2274e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=69d8b7ba cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lIHZG7vxoDUjMCuUgwYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4MCBTYWx0ZWRfX7CnzGerVdwFr
 GWB2vMpWEOMUSzQ4FCea3fmI7T2TclfT2jvlwhuyiSGEzQK+M12XuO8YPNuHv7W7pPe5t7PlUoP
 tzRhskgCXTl2WaMRz+MnALMTfWeDInt4F36NtStyMUDgqZKwSGNyh5TRAMh0LlEDRHL7jaMAUrs
 uoHgBZmeXB3CqMO4rDP6HOx0cQRJH1h4MLNp1zzlecFESrxrvtBlKCMM9wisWZr9nVidr8yMGNQ
 VY8MGyKKZLFVqyU+vR1Us5UBjjFGV9QZVQXSzSK1hFYRTd5XKjudL1v1bTCU+qWFvW7BbJOkI2Z
 h+qpXKPTwKRnMjf7tofS4GeAtCzLQz6JkD91Al6/CGu6aaEy2JcTXi6Ue2qNfI6D6tCGavhGyDj
 dkNTVW3qjcM2usUQGXL/Br+Lbe6gSsfN1rc6rBhSmjjg54xifi2J31yeR8HoByIo+goRJ7zxtEL
 dYRToHYuDvR0p08ayNg==
X-Proofpoint-GUID: jpaMVPK93UhByZxz0mfrhOAV7Bof2HMd
X-Proofpoint-ORIG-GUID: jpaMVPK93UhByZxz0mfrhOAV7Bof2HMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100080


On 4/9/2026 3:33 PM, Krzysztof Kozlowski wrote:
> On 09/04/2026 11:28, Kathiravan Thirumoorthy wrote:
>> Add the bootph-all property to the nodes which are utilized by the
>> bootloaders.
> Uh oh, so it started for qcom too? I really don't like how these bootph
> properties spread all over, so please provide arguments - which pure
> upstream bootloaders exactly and why exactly these nodes.

This is needed for U-Boot SPL for IPQ5210 [1].

[1] - 
https://lore.kernel.org/u-boot/20260408091136.2794546-1-varadarajan.narayanan@oss.qualcomm.com/

>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts |  5 +++++
>>   arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 10 ++++++++++
>>   2 files changed, 15 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
>> index 941f866ecfe9..56dbc506da78 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
>> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
>> @@ -17,6 +17,7 @@ aliases {
>>   
>>   	chosen {
>>   		stdout-path = "serial0";
>> +		bootph-all;
> Since when do we add bootph-all to chosen? Which broken bootloader
> ignores chosen?
>
> This really makes me wonder that you do all this for some downstream forks.

U-Boot doesn't need it, but U-Boot SPL needs it.

>>   	};
>>   };
>>   
>> @@ -41,6 +42,7 @@ qup_uart1_default_state: qup-uart1-default-state {
>>   		function = "qup_se1";
>>   		drive-strength = <6>;
>>   		bias-pull-down;
>> +		bootph-all;
>>   	};
> And that's a pin, not a device. What is the point of marking it? The
> device needing this pin will have phandle which must pull the node.

This is because of the fdtgrep tool's limitations, which removes these 
nodes in the final DTB if this property is not present.

> Best regards,
> Krzysztof
