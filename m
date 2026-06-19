Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8115D31E848
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781881602; cv=none; b=JumVro04vx4UEqhRbxXLjRFU+Uo9xQZsU/3TDkF0EdzXcCm0jvqhMh6Rseiwu6nfZhfkY+uiI8NhAGtiChaO9v+9ekwAgmEAk3aGlQ68jckrAb1/l91sQ4H21UX7wDIBUDPeYPvhyJJ3eEfyy8KihY7o5NrWpl/gO8TZFev7Qkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781881602; c=relaxed/simple;
	bh=UiGYjO3pkB6lfkBPWwm/laJhIY0XXfdw0uDinSFJ7Q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OlDw216s2M/26pMbvT/eWr4C198Sn0p0i+IQ3RmJ8UmT5ce0fa1SuBXq6ZbciO9z5bj22IJ0gYI+50JZzamnNH1NNh9P4F0diTX/EmaN5hpxH1PQIZ4odPuSA5/SA88gQJmBr3gGx3Znbf99RedvUmHgccoEvKpJ2Z/G+DdFOsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+GGBbUM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqDocgto; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+GGBbUM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqDocgto"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDC83q759381
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WXBA2WLTP7wDMQw/gN3zwRvNcYmd4PqDKtZbmWkOQq8=; b=S+GGBbUMOQnWVubs
	yKeaRnULfrj4x6w696l6G6tqv1DQ5DWcukntUJqKqCJ9iFL9n4cXZnuJIr4/3tNL
	ImK9XIRt14xsO5ApVRKkQgqPQ5yRlkbxYJ2Fjj/BNkH0KZAsBRrWjnykuMoBzjB+
	ZThrjW9fVuf63Na7byCElPwPedQ6KFotyjFJsHsxGi/bySUlKYkfRMMRQDRlSUUz
	/OLXAi9takTrfk+lGiTZBr/GFewKEJvnGrn0VjP3Z2Px4fE78tOiOG3YaJfwW1eL
	pcAjctphtEmRGywbHy5wv0CftWDJ5V+tXojD7AdglQ7YcPN1q6RURtzz/RG++B7k
	UpLSxg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ew5hp8j83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:06:39 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7270ec494f6so104046137.3
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 08:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781881599; x=1782486399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WXBA2WLTP7wDMQw/gN3zwRvNcYmd4PqDKtZbmWkOQq8=;
        b=iqDocgtocZHRh4j3SVVqoSYidCgsOv3AVfZZjJvGl/GS9T4Yn/5tabpMY6GCOPXKpU
         3zy6iQLbOCJKg1cICh+7ekffM/M/l0ymuYNfuAZIflrwupjOYgZdI47SahZ84kEz1/n+
         GsZXrvYHSE9V83VDxE+/X5sVA922RlZw+Sa+qU6/BHtXAoikQVXsc25RL0Qq4UhrRqOf
         lNO1pzSIpE3d3S0IbpD2lKCmwUmzJOu3S9GoUIa1LShmDul8qTznW/61K+N3Yzi3nxYQ
         TLUUAQShSCh8E1Dmx3dDd7SAsmV9eUo7fg3Rv0J+FfpT5CdbBD3O3XhsiSI2k3QwUb3G
         Q+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781881599; x=1782486399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXBA2WLTP7wDMQw/gN3zwRvNcYmd4PqDKtZbmWkOQq8=;
        b=icSh7oty2JKWDf2/rGe4aMdGIObaDMi7w35uOnsrYgjkrdOHwVMRBNBu6jEnansdI2
         R92Sl+BDGMiUTsHEa5JyqZjAaPrS4NPHjJleFP9YiRKwvUNjzZcl1QJDTGseSnEOkUpH
         92nOgnnPmVOa6E4gz6Rvu37B1fzmqBVXYL0BHJzmvvoqtvEJpyb3jafX3UcKFO56ApqJ
         o9j4NA6/fk49UxSySvuRbmcvZ43Z4WSuBYJ21JQsb0fEfqEWQKmpOTeqEgL+zquI2ns1
         Oji6dUFpdaBcolKEAR4YWvTtCatVCyrma+teiCz/rxPHzRA7fmpawX9B7iE9sVSEw6LR
         UJsA==
X-Forwarded-Encrypted: i=1; AFNElJ/8zTFK+CU7GclHzieeWdc3wb/LCtZguhcPUrnGSWIhorqa9NRF93+r3k+2h5nMEb5GO5c/+MEuKeIR@vger.kernel.org
X-Gm-Message-State: AOJu0YyEjwJoqK6f9XlN1FoDbWOrarxCra1TZEErWQLL4Pdc19N1dGCr
	nKQlywkSgC2UBZ5TyDvtT5LXzo5IgmzLS/LO+s/rRbfW8WV3LreLEKnR8SW9wJzDoOojK0G0b0b
	uYnOKD+iY6DQdXOdy4Y08l1y0iSVD4FY0JJ832mhnD1uag/1gqcAEV/nWQQSZiK0L
X-Gm-Gg: AfdE7ckX17OT32DA7xgpLXNM8vSU+gYI5xIAgU5RQz5pn/lGLK03atAgheJeY+oSq0k
	jjvvSyUICCwPouohcsSP1Ug6yln7OzpwGUKzJsqStyA6cI/6/31uPYqVSI2Hz+NfTQ/0+CoOqS4
	EppT2JNZbMIdeL5d/Ywak6ru2/7qXn2vqMKX0r3F/2IwWWQhUqqludV5RtvuXBJaZ32qgQHqH7E
	kdd7GbcZ6+tQL7T6yQYqIrK3Lc7gH0CiCZyh8FcGhDgKinLwQIxSJ+b7Aod7Sm6EHBueyOpbJHE
	wRTzn+WXq1zVldRAuNpPY4pmXiT5yhU/XYx5ZV8weWmVDxHKvQ0vKEOa4uRX8H9PNKTopaRMawR
	FccV26tzySRcjuX7MdYbnykXeLdNBwwEgBmU=
X-Received: by 2002:a05:6102:2910:b0:60f:77ad:4bed with SMTP id ada2fe7eead31-72a0522b667mr971235137.7.1781881598603;
        Fri, 19 Jun 2026 08:06:38 -0700 (PDT)
X-Received: by 2002:a05:6102:2910:b0:60f:77ad:4bed with SMTP id ada2fe7eead31-72a0522b667mr971201137.7.1781881597992;
        Fri, 19 Jun 2026 08:06:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69711f439f8sm980688a12.22.2026.06.19.08.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:06:36 -0700 (PDT)
Message-ID: <037099d6-b8d3-4578-a08e-9ea594025ff4@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:06:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa: Fix xbl_tmp_buffer_mem size
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260525114749.5939-1-johannes.goede@oss.qualcomm.com>
 <20260525114749.5939-2-johannes.goede@oss.qualcomm.com>
 <7d2aedb2-4bcd-4453-80be-5c7ca6bdff95@oss.qualcomm.com>
 <7ebbddb0-175b-4023-91ee-93d23e5162ba@oss.qualcomm.com>
 <21a97c4b-293f-435c-91fe-ca7394b5a2b0@oss.qualcomm.com>
 <829fa641-dbd4-4319-90a2-99a24934e0df@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <829fa641-dbd4-4319-90a2-99a24934e0df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KXdTprsJ-f7KFOcHbYdYeWGnYNlungxM
X-Authority-Analysis: v=2.4 cv=aOHAb79m c=1 sm=1 tr=0 ts=6a355aff cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=8ppMBgYsIGJW4uXv3vMA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: KXdTprsJ-f7KFOcHbYdYeWGnYNlungxM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0MyBTYWx0ZWRfXzg9wT19LS8Dy
 uZvNMvxOONa2w7Dkw3T/8cD4JKtZgzyrihE4DNOL3S9qj1EGiVx5tRXo7Nn0/mRZkvr2rEwXV9J
 +V7fLW+ARj3fZQo1urlEhzfYh/M6Dxw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0MyBTYWx0ZWRfXzvzGm/VhFXQX
 4ED78RHxc6HYhKt8u7EwO916Mp6YARlPGvxVaz5ryYj280Ttus3XJWb5y3ic70cUtmEGruORnlm
 mMfKAuz5FK7RKrTkPIDrR6crpNUfESbfH7HO/s0EUWZRnfgH5DcHw+5eft/MqUG1VQ10Wx2xxdu
 g9Mp4lyrdblRQVVreLjnDyDzY4nP2LDbzee56pQmCa1ZNaF+o2219wPSo/T6W2iQNG60uoq1RD9
 JHYM8PzlnNox8rQTG9Z5HgPYjxsxxpuYrVccq+ag0XW86kit8CXsvtl/FeHMLaKpDRkvF3oaq97
 MuLTixHNhiIAeKSUB/KztOBrf10HWJ4gyJR6C0o2IlSXybONwSQ/7jalLJPjhYgj86barN5cpiU
 STkfSFZ5pj1pBdQGxYh9iw2BlpITVU80wJ/rqtDT36PCpuNF2J0gl6nAYVWCqyl+XfsgvUCjLch
 PrpWdTtYREsUpi4SMdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190143

On 6/16/26 10:40 PM, Hans de Goede wrote:
> Hi konrad,
> 
> On 16-Jun-26 1:04 PM, Konrad Dybcio wrote:
>> On 5/25/26 2:46 PM, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 25-May-26 14:29, Konrad Dybcio wrote:
>>>> On 5/25/26 1:47 PM, Hans de Goede wrote:
>>>>> The EFI memtable (shown when booting with efi=debug) shows that the
>>>>> xbl_tmp_buffer_mem region size is 0x1c0000 bytes large not 0xc00000 bytes:
>>>>>
>>>>> efi:   0x000082800000-0x0000829bffff [Reserved    |
>>>>> efi:   0x0000829c0000-0x000083efffff [Conventional|
>>>>>
>>>>> This fix aligns the size with the EFI reported size and makes /proc/iomem
>>>>> correctly show mem blocks matching the EFI memmap:
>>>>>
>>>>> 82800000-829bffff : reserved
>>>>> 829c0000-83efffff : System RAM
>>>>>
>>>>> Instead of:
>>>>>
>>>>> 82800000-833fffff : reserved
>>>>> 83400000-83efffff : System RAM
>>>>>
>>>>> before this change
>>>>>
>>>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>>> index de0f2346cb38..5a2e84365901 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>>> @@ -582,7 +582,7 @@ tz_stat_mem: tz-stat@82700000 {
>>>>>  		};
>>>>>  
>>>>>  		xbl_tmp_buffer_mem: xbl-tmp-buffer@82800000 {
>>>>> -			reg = <0x0 0x82800000 0x0 0xc00000>;
>>>>> +			reg = <0x0 0x82800000 0x0 0x1c0000>;
>>>>
>>>> FWIW the reference memory map shows a contiguous block of:
>>>>
>>>> 0x8280_0000 -> "no reclaim XBL scratch_buffer2"
>>>> 0x829c_0000 -> "reclaimable XBL scratch_buffer"
>>>> 0x83f0_0000-0x8400_0000 -> "no reclaim xbl scratch_buffer1"
>>>
>>> Thanks, so the first part here 0x8280_0000 - 0x829c_0000
>>> aligns with the EFI reservation and with the dts reservation
>>> after my patch.
>>>
>>> 0x829c_0000 - 0x83f0_0000 being reclaimable matches with
>>> both EFI + the dts (old and new with a different start)
>>> having this as usable RAM.
>>>
>>> The 0x83f0_0000-0x8400_0000 area seems to be marked as
>>> reserved by neither EFI nor the current dts...
>>>
>>> With the first part of the reference memory map aligning
>>> with what EFI shows, I think this patch is correct.
>>>
>>> I wonder if we should do anything about the 0x83f0_0000-0x8400_0000
>>> range though ?

[...]

> [    0.000000] efi:   0x000080800000-0x000080dfffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

=>
gunyah_hyp_mem: [0x80000000 - 0x80800000)
hyp_elf_package_mem:    [0x80800000 - 0x80a00000)
ncc_mem:        [0x80a00000 - 0x80e00000)

then we have these ranges that are absent(?) from the efi map:

cpucp_log_mem:  [0x80e00000 - 0x80e40000)
cpucp_mem:      [0x80e40000 - 0x81380000)
reservedregion: [0x81380000 - 0x81400000)
tags_mem:       [0x81400000 - 0x815a0000)

> [    0.000000] efi:   0x0000815a0000-0x0000819fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x000081a00000-0x000081a3ffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

xbl_dtlog_mem:  [0x81a00000 - 0x81a40000)

> [    0.000000] efi:   0x000081d00000-0x000081dfffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

RAM

> [    0.000000] efi:   0x000081f20000-0x000081f2ffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

=>
usb_ucsi_shared_mem:    [0x81f20000 - 0x81f30000)

> [    0.000000] efi:   0x000081f38000-0x0000826fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

just normal ram


> [    0.000000] efi:   0x0000829c0000-0x000083efffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

this conflicts with:
xbl_tmp_buffer_mem:     [0x82800000 - 0x83400000)


> [    0.000000] efi:   0x000084000000-0x000084afffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

normal RAM

> [    0.000000] efi:   0x000085380000-0x0000866bffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

=>
spu_secure_shared_memory_mem:   [0x85300000 - 0x85380000)
(hole)

> [    0.000000] efi:   0x000091480000-0x0000a67fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

RAM

> [    0.000000] efi:   0x0000a6800000-0x0000a7f00fff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000a7f01000-0x0000a7f01fff [Runtime Data|RUN|  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000a7f02000-0x0000a7f04fff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000a7f05000-0x0000a7f0cfff [Runtime Data|RUN|  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000a7f0d000-0x0000a7f18fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000a7f19000-0x0000a7ffffff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000a8000000-0x0000bbc0ffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000bbc10000-0x0000c177ffff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c1780000-0x0000c178afff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c178b000-0x0000c3933fff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c3934000-0x0000c4c76fff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c4c77000-0x0000c50aafff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c50ab000-0x0000c54fcfff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c54fd000-0x0000c5b12fff [Boot Code   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c5b13000-0x0000c5b21fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c5b22000-0x0000c5b23fff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c5b24000-0x0000c5b34fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c5b35000-0x0000c62e3fff [Boot Code   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c62e4000-0x0000c62e4fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c62e5000-0x0000c62edfff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c62ee000-0x0000c65f6fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c65f7000-0x0000c66d5fff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c66d6000-0x0000cf6ecfff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000cf6ed000-0x0000cfbb9fff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000cfbba000-0x0000d0020fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d0021000-0x0000d5135fff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d5136000-0x0000d5136fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d5137000-0x0000d5cedfff [Boot Code   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d5cee000-0x0000d5e7dfff [Runtime Code|RUN|  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d5e7e000-0x0000d6c8dfff [Runtime Data|RUN|  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d6c8e000-0x0000d6c9dfff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d6c9e000-0x0000d6d02fff [ACPI Mem NVS|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d6d03000-0x0000d6ddefff [ACPI Reclaim|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d6ddf000-0x0000d6ddffff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d6de0000-0x0000d6e0ffff [Boot Code   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d6e10000-0x0000d7ffffff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

as described, RAM interleaved with UEFI regions

> [    0.000000] efi:   0x0000de5b0000-0x0000e46fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

This doesn't reserve:

xbl_sc_mem:     [0xd8000000 - 0xd8040000)
reservedregion: [0xd8040000 - 0xd80e0000)
qtee_mem:       [0xd80e0000 - 0xd8600000)
ta_mem: [0xd8600000 - 0xe1000000)

absent:
tags_mem1:      [0xe1000000 - 0xe36a0000)


> [    0.000000] efi:   0x0000e69c0000-0x0000f84fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

and absent:

smem_mem:       [0xffe00000 - 0x100000000)

> [    0.000000] efi:   0x000880000000-0x000cc236ffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x000cc2370000-0x000cc6bdffff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x000cc6be0000-0x000ffdffffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x000ffe000000-0x000fffffffff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x00000c264000-0x00000c264fff [MMIO        |RUN|  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
> [    0.000000] efi:   0x000081a40000-0x000081cfffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]

=>
xbl_ramdump_mem:        [0x81a40000 - 0x81c00000)
aop_image_mem:  [0x81c00000 - 0x81c60000)
aop_cmd_db_mem: [0x81c60000 - 0x81c80000)
aop_config_mem: [0x81c80000 - 0x81ca0000)
tme_crash_dump_mem:     [0x81ca0000 - 0x81ce0000)
tme_log_mem:    [0x81ce0000 - 0x81ce4000)
uefi_log_mem:   [0x81ce4000 - 0x81cf4000)
secdata_apss_mem:       [0x81cff000 - 0x81d00000)

> [    0.000000] efi:   0x000081e00000-0x000081efffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
> [    0.000000] efi:   0x000081f00000-0x000081f1ffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |WC|  ]

=>
pdp_ns_shared_mem:      [0x81e00000 - 0x81f00000)
gpu_prr_mem:    [0x81f00000 - 0x81f10000)
tpm_control_mem:        [0x81f10000 - 0x81f20000)

> [    0.000000] efi:   0x000081f30000-0x000081f37fff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |WC|  ]

=>
pld_pep_mem:    [0x81f30000 - 0x81f36000)
pld_gmu_mem:    [0x81f36000 - 0x81f37000)
pld_pdp_mem:    [0x81f37000 - 0x81f38000)

> [    0.000000] efi:   0x000082700000-0x0000827fffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]

=>
tz_stat_mem:    [0x82700000 - 0x82800000)

> [    0.000000] efi:   0x000082800000-0x0000829bffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

=>

smaller than
xbl_tmp_buffer_mem:     [0x82800000 - 0x83400000)

> [    0.000000] efi:   0x000083f00000-0x000083ffffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x000084b00000-0x00008537ffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]

=>
adsp_rpc_remote_heap_mem:       [0x84b00000 - 0x85300000)

> [    0.000000] efi:   0x0000866c0000-0x00009137ffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]

=>
adsp_boot_dtb_mem:      [0x866c0000 - 0x86700000)
spss_region_mem:        [0x86700000 - 0x86b00000)
adsp_boot_mem:  [0x86b00000 - 0x87700000)
video_mem:      [0x87700000 - 0x87e00000)
adspslpi_mem:   [0x87e00000 - 0x8b800000)
q6_adsp_dtb_mem:        [0x8b800000 - 0x8b880000)
(hole)
cdsp_mem:       [0x8b900000 - 0x8d900000)
q6_cdsp_dtb_mem:        [0x8d900000 - 0x8d980000)
(hole)
gpu_microcode_mem:      [0x8d9fe000 - 0x8da00000)
cvp_mem:        [0x8da00000 - 0x8e100000)
camera_mem:     [0x8e100000 - 0x8e900000)
av1_encoder_mem:        [0x8e900000 - 0x8f000000)
reservedregion: [0x8f000000 - 0x8fa00000)
wpss_mem:       [0x8fa00000 - 0x91300000)
q6_wpss_dtb_mem:        [0x91300000 - 0x91380000)

> [    0.000000] efi:   0x0000e4700000-0x0000e47fffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |WC|  ]
> [    0.000000] efi:   0x0000e4800000-0x0000e69bffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000ff800000-0x0000ffffffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]

llcc_lpi_mem:   [0xff800000 - 0xffe00000) (UEFI reserves more)

Konrad
