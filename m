Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0241D48EBCE
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331870; cv=none; b=d3TTuq/M2SUdomDu4ryK8hZmGFISXzZ/hw3V3fhSyyIv9LcQkhnPbNTLvkohd3woqoTFxE8keXvAdeFQMf8uIbkw+c6GfuZfFaJO39clu0uMINybazF9fZMi1aw820x5UoLGKzc4MlyaZHEo/2XSJWwu2eQ2wmHUTVYmoBYOoJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331870; c=relaxed/simple;
	bh=//ydaMvuDcE3HJ/Z4qDQc9OC9a2+tOHr0C1rrcwouhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cb6fB/zzNf2+oHsK/imMD5lGIaxmnBlvzyouPSlbE+wGzOHMwNXxFwpnXNdQ/NpglicFAQ2n2REI2MkhqlkNrmDQKxDBpK4n7MJAmlegF5CenfFjPGGAutseU95hXe7usVpo/jwd4riLdwJRSXuriEPLdx0hWSHoOCKoCcWdGEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EV2Q77qU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B1kbhEe6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EV2Q77qU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B1kbhEe6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Yc201193858
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GxkbBoFwPDC5kONFYqfHLm2ecZsOlzpQCPq3LAhmLTw=; b=EV2Q77qUK94/KmKi
	NqGEuT/29qQItlpYMJVwpn01J0n0VFcAeDoA7TC50z7Y+kccdrnIAmdYgvEza8KQ
	j4Y6GsDxxSGQsqkwKW8mliB4Y4xDsioOUvi0AOhKiDMB3QhzEQw9oSBd5yHaf6gd
	P++Z7EiEXL6G9rLQZ/T67DPbcRDaSvjxiFuaV8B3AIpmbONfl5KDJJ1i6SfO3lpJ
	rvFrH/5yWxeQOiTDcX16KCQFQaBtntIn5UcseuGzm0DxK9FMEEHHVAa6KshexUlK
	gmEQXsL9TVTN8m//alk69bSKi46Njh0+la5dEEOKfudG7Wbc2UHCzrlvm444haF/
	Eapfqw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874k1h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:24:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1183866eec.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 03:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331868; x=1790936668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GxkbBoFwPDC5kONFYqfHLm2ecZsOlzpQCPq3LAhmLTw=;
        b=B1kbhEe60OnvQXYVIj8+ejiV3u7ItdBh2vrOnYeDYjQRQ+IbKtb2oavKeuYDs9EIh6
         jBE//AM/J+t4hdJIJqceyTNdf12gKZ4AXTXI5kbgab55eCIzgyqZPuD474phwQyl9ZS8
         ZeS4JgqqEYZEyyxPCgNfkWULJUdViYHYMgZd65nJkaTx7vLPeB69va7Ix+ARESfSo2Gz
         PWaoBxMEgGG3ZzkigMia/ZkKY9Iq9lfC7P62oNrlq70kEjae7dC9qmm2LxRfQR8Iu9r2
         LpkgIcuMUxeWEHVB3Yk+X8wBdMfyaBhPuofnPPwRgiP9KueDiImo6mf3lhusTBfiO45u
         ysuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331868; x=1790936668;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GxkbBoFwPDC5kONFYqfHLm2ecZsOlzpQCPq3LAhmLTw=;
        b=bu8cF444xfmgCLwMumY19sOCJz6XEk4L9qtopLDg8OjAITQI9sD5PT3KedDVgaMkyO
         iDkIKhRc1+o148abvVQSd7gWEDBmHBjWlFF1INaWFZfqiRvfeBf7eVZtT05Zft300lFc
         iZ8ekCEq2l5n2vqVMRLYS1rbMYyHsTaI96SXsIZylVkyr8rLND7uD0lXHcbzVztxCcAY
         ahJvJY4FttKjdlAZa4TtPTbrvPrmbUDf02QBJRhlgVtC+qfqKnQakykEsuNvZGWnIQUA
         EfUM6ts1ixMwSAyg/Y8DaCibqgO4pZ+z57ioYxTUo1NCQYTs78XcTmkLnDTqJBIRLCj+
         vejw==
X-Forwarded-Encrypted: i=1; AKwUvBwkWP8jLXUxuYHFlfOTMrl85gGJDLOl26aKXYQ90XmCCa3s39biEyXvYIctnSUSHoEWGaj3PrYDxiso@vger.kernel.org
X-Gm-Message-State: AFuF++nv2/Ulc4USgABaMkX6FdTaegaeOVVKT50XvVIHk3ec20JBHD6k
	2A7SmRDniXA8zuYwxSlBA6UiR6fJupVdux6dBKHZ6WAHmKLYBpn9QVzESn2NvOLM/5D0rVB7pgW
	DKFNuW+XqkmdcVf8LjRwIWUR5dzMLJgCIryySXMJOsG9GvXy4zZAng9IwNF/djBixet/2sfG5
X-Gm-Gg: AYBFou2nMEmzxbojd9zkF3/9Dnv2ZgaJDHY8LcPP5eiI/sbt4q7iOjyo7OFN4cXPBXH
	o0NAix39mdwQFuLveZcAJwfy82bRFQifkI196p7gDfJBnSv4gHkkqQOZt2/7jjcnUf50NGYwOd6
	Hi0xNSdRNV1aU8lhtRAJF2aFNFmW75kF3Usqu5TKqwvtIvv3MJHa8b3ELe1B4on1vdK6rSExSN6
	dP7VhMr6YETo39dpg8VFg0787sqDDqPiOJPJu69lC6pBV99h6GDtglODnpiEYATHAwmxFtuysCn
	bUZi3MEFN4c5txpJJmjV7cdp5FkiOz42fb6m7N+PRmSJifoBdRZ2pyJoZJktqDIFFeqUSWd0ESX
	oTY35cKGHGVKcWIXjbB+NPEqiQ5DhIA==
X-Received: by 2002:a05:7022:e80d:b0:143:2719:566d with SMTP id a92af1059eb24-145040d4075mr5212171c88.41.1790331865628;
        Fri, 25 Sep 2026 03:24:25 -0700 (PDT)
X-Received: by 2002:a05:7022:e80d:b0:143:2719:566d with SMTP id a92af1059eb24-145040d4075mr5212136c88.41.1790331864761;
        Fri, 25 Sep 2026 03:24:24 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145aa0cb7bcsm4598842c88.2.2026.09.25.03.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:24:24 -0700 (PDT)
Message-ID: <53c6b966-a6ff-4b91-a2b7-d7faee5a6605@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:54:19 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Drop CPU critical trips
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com>
 <xa4gmzdccrububsmervkbtwqpddsbikubvgsqksypqmx5oih2q@q2hz6tadbmu5>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <xa4gmzdccrububsmervkbtwqpddsbikubvgsqksypqmx5oih2q@q2hz6tadbmu5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5UECI7boJq1n7CMpIM-yy4IXPvhWK84u
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab64bdc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=azjQQSWQslUy6IvBT_cA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfXyV6Utsup25nb
 crjsOHgo56O7Ndl15YjwpCZt6+lFMooMuhlntXQVez3BQTvbN9wbJYnigDzW23Vjt3ng7HK20Y9
 2zDN1FxvEdn/1reCX5H6yzQltbdjwMK/yLx2tmrN65cSqS937wVSYiS93xgKPkV8f7FRfUuIO1G
 k1b+u8BLpYbvRfALEWjZlg78ycNSAw3+Sg4k5sjaXFUMpEEjjjTZaeotHeAPOnZn4Ynh43luVfU
 UkhdeKPfLrVoiEm4TPk7muwdNCP+F50bPMaydglgnCEXfWZzDDZ85xG/iWcudGdaqbNPZgLEqIv
 l4RgVqrGLKpswX3unf4lg/CpVkOIeF4dpRYNC4Cyv7VKto7IBfO0hEsZjpj5LWjna+Lvtb4OnI9
 ennOrz6i/0bsyrfwoMw/K7s0y1KkVpJd8M/Lov//TzwymRyP8CEdLcTKDajvX03gb7zoeyvwmuU
 8bNWcLttB0K9E7adJ8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfXz9B0m9nbiAvd
 mU8pG6fPl7Af3cZKqT9bZuptdQUbkcMEI2e5btqqmjrlM0q5ZJGAkyp3+O6butqWdpXFe9n7x5Z
 F+hhg8VQtlUkCouXrquGFuFdZKpTbHs=
X-Proofpoint-GUID: 5UECI7boJq1n7CMpIM-yy4IXPvhWK84u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250041



On 9/25/2026 3:13 PM, Abel Vesa wrote:
> On 26-09-24 19:52:32, Gaurav Kohli wrote:
>> Shikra firmware handles CPU thermal mitigation up to 117 C, while
>> Linux CPU critical trips trigger at 115 C. This can shut the system
>> down before firmware reaches the end of its mitigation range.
>>
>> Drop the critical trips from the CPU thermal zones and leave the hot
>> trips, non-CPU critical trips and GPUSS passive cooling map unchanged.
> 
> I thought that was the whole point of having the critical trips set to
> 115 C, so that the kernel can gracefully shut down before firmware cuts
> it off.
> 
> What happens if CPU gets to 117 C and the critical trips are removed?
> How will firmware thermal mitigation handle it?

Thanks Abel for review.

For the CPU thermal zones on this SoC, hardware-side mitigation is 
already available at 115 C and 117 C, and hardware shutdown is at 120 C. 
Because of that, a Linux critical trip at 115 C is not very useful. It 
overlaps with the hardware mitigation range and can trigger shutdown 
before the firmware thermal sequence has completed.

So the CPU critical trips are removed and the firmware/hardware 
mitigation is left to handle those thresholds as critical is not helping 
here.

