Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40DB38E113
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328819; cv=none; b=Kgq+RxJ8nomLyz6JS++8+JMYg47JzbEpngdPzQCjSowIsc7J+SPqQ/9MWS+fsqayFciNVcqVVquNX++W1Np0J1ebrWZU/rm8XieB/IP9TWzjd1y1b0bOuzrWv6gASNp4AozXJjzXqHBM1nWZdAsMFn+afWl66jVUMKcaljqZLMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328819; c=relaxed/simple;
	bh=ZwTTelmznCo6ePzhwhGkrzjsXOlhzD8HcbphQBRt7Is=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ec7A5ftx8PARjv1Gxb+wftr2K+6pMduKgCfB64OjxYbfPvolcLVXe1UzkQ6HlFjP3iZY3P4eoVRUBLwNF0Mvo0IwVjZlVADU6iWYkhJkF1m2cG/dE2Jz2z3MMMUKtD/h1GsXlyQb7vB4yhb9A4g6NMII6qSaKEuprLCKHoFBOY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OBJYeT/U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WrcQvlDY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OBJYeT/U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WrcQvlDY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66694IA14180036
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RUN3RCsTUv18V7czcf4SZLShjkkb8twB9ACp3z+QL8E=; b=OBJYeT/U4p3JFZJd
	ICiH/MiZG0OcTsJgxnyvwqfnF+35jDPxoSBmaTH5G6QfZNbb5RrU66gaxG2gh3Dk
	0H/s9MmU3dp3OPPlNXNnM6QL2B0aMZ+H0PNZ+hi8C4MwQDEHlqtsnpjt5uBYhT/m
	y2uspnpeJaHuvcxhFIXMR1uyVR+WWsrKXhVUIWkAD0BAGVLcz80YsyL3Csf7LOAA
	e53NV+AN76kRGSDincS/rWiEUjK+sKEnpdDlqYCKJj7pq00dIIKvwy5ivAVwEH7E
	f/w4VGJPc9p4sSwtFPCYTjhd2BoaULnFRC3xi2Y8b3bXRXoHWmpuQC1JVSs42igI
	J6LzZg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txena90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:06:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e66f9e2baso264025485a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328807; x=1783933607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RUN3RCsTUv18V7czcf4SZLShjkkb8twB9ACp3z+QL8E=;
        b=WrcQvlDYdbbe1nzAM8fIpCsJklr4nX8OU0pRiVimXV+QUb5lnT9aKiNmTKBA8F3fbU
         +NV0FJ1f+CFVAOI1j3q+xtyRCkYGBxwpy9FQJn9+gOMwsLLhrJf0Bp0iiYfWS7wLcscc
         x5v1CBE4G9TUbYXKl3OlwE/bJuk8YGz/zL6T8MZ2iRNnYSzuRKSJGgO/pA/g2jJeEGNL
         YAefeg4GWpeSuzeqGgaW/vfdtL7+eI/QIDo/tooE7K9A0P5rjT43gVu16tz4thulRc4e
         l0or74RdiGrabSxDIqYbZ1quvxMPT8rL+zXBJtN44PqwxaFMAar7EGQoiZlhHlBr/j9r
         a4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328807; x=1783933607;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RUN3RCsTUv18V7czcf4SZLShjkkb8twB9ACp3z+QL8E=;
        b=a4BMtC7QeXiV2kHh5+yPDMShWrKE3ZsbVJzvQBj5gwfxqrvm4R3IWivczjijIwG7ZW
         pgZfQME2hkzcQHSWmbahuTAtbtGk+CFCS9RAsavA25G2v1W33QD+EZOA9NipMrUaxcTi
         2ahQndy+VkIHPNgeecnwl0aOFTMejzCoDm6U0XW4JtMQJ7s8x9QyNC/V2t+oc/vo6asZ
         Qzpq23Y4aOvFZfUBN9p9dR1D+HGwe3CdShIkcQIne6mTY7GSKl9YCcdrBZZ71s7ybJjX
         JOh/cWSJoyQC9dpJpYZLyy2edxy4anzsxj3jREo3/6+tcMWCIz1shA6CeihDKqbJBLmX
         SmSQ==
X-Forwarded-Encrypted: i=1; AHgh+RoyPzSrO3hsxnLelBSlcYnILG+a8RjKUP5rLuKWesiqjfFys7T3KEnBvO14Zk0aFwDKwzra0+Shy/WX@vger.kernel.org
X-Gm-Message-State: AOJu0YzxN+sf20hfc0qWrqPXW89ivdYD5pGfbM5dtPRR/bcdX1ctd3C4
	3KUijG4zW22ys87Ydd4Q/5MpAAI9iP1jq+3HZcuFTLqtMxtXmgYydNJzx4yHlXh7yeauVpBeaw/
	FHV+sRmh/z0nN9qzRhYIT8oEtPtD1C6Kqim52u2M67I5rxhMdP5jj6UplZzAhrqwk
X-Gm-Gg: AfdE7ckGNKWbVETfIym5HTL2gV4p+OzFuIWSvIU/eZr+1gF+pr8HUhevnKv/DDHMZHW
	erJ3+I15YUXZIcjCxyuwn5zhl02R6+IdAQbhXqmSant6ylI7QU3wcK7QKwDskHRQsKMIKTWmxxT
	Sje43CItMx9GPgpfMaPn1LFJypQCoQKtkUkG8WxhgR4tHxFSoHEXlI8PaU5bx22hLMAdyIY7IfF
	ogtRUSc2lbj+8YLYsR2Z6WjnGrgT6GpJL9aO7eDIrAafn0JUGlL86vJzXeJDuu9QIkbhKyqyWLu
	YsvE/IP1A91qKeIsWj0MSXCT76Ulr4fxXbO7nLRPRFKxrKAK0M3WPfrDZ5hnee8p0RWMIsW5zrQ
	BLOuCg8EtB9r2iRHEMLXi87jLCrGuoQ==
X-Received: by 2002:a05:620a:450c:b0:92b:6805:9197 with SMTP id af79cd13be357-92e9a4ff4bamr1206105585a.63.1783328807300;
        Mon, 06 Jul 2026 02:06:47 -0700 (PDT)
X-Received: by 2002:a05:620a:450c:b0:92b:6805:9197 with SMTP id af79cd13be357-92e9a4ff4bamr1206102785a.63.1783328806765;
        Mon, 06 Jul 2026 02:06:46 -0700 (PDT)
Received: from [10.40.99.10] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b629a1c7sm699473966b.30.2026.07.06.02.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:06:45 -0700 (PDT)
Message-ID: <954ecd7d-9aa0-4caa-90b7-0da990ff7c6a@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:06:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa: Fix xbl_tmp_buffer_mem size
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <037099d6-b8d3-4578-a08e-9ea594025ff4@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <037099d6-b8d3-4578-a08e-9ea594025ff4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MSBTYWx0ZWRfX54YS7xBsxoe3
 rkMTGR69g1rOepmBkrhlWQ/CYRfjMxRafYszNVnU/LlF+umWokhYyovz2PldyIlMKEOvS91VaUR
 vVwpBTngHOHfWdnGZG/+4XdprCUTgl4=
X-Proofpoint-GUID: RjwN8rDz6A-LUiOx-q4uqp32jwbB8pNE
X-Proofpoint-ORIG-GUID: RjwN8rDz6A-LUiOx-q4uqp32jwbB8pNE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MSBTYWx0ZWRfXwmA2FQK/G3nY
 puKRhhStnKqHuZUK/m+cd6ZXhpO11mnoCxr3nEL7rhnSNs+hT8pwFEU+crQIauH9zvIwWT7l2qr
 Oi4FqsNOxYDwwsCB7d/6HPTL0uG9WBMDTkaZBL01wHp0RK14VhtktR59h1s69CTH4gZA/Asaem1
 Gw8UkiiFcNcCWQki250D+ZQvp/7DZ8oCxAUUs6Ahb4cCY9X39KG8kzr7L8e4Cr3k6pYevzyyI/R
 KZAbyNKW9Ee5aJT03cHvzpz4GKr+l6WFKIFXmLTaRdcjkLpmC8Wfo6quugAPdw9F2lTBNOnLQb9
 jpHEzz1vx+BwheEWJ78VzTCwOQRXP7ipeWrLNpLndobLOBkA4C/cft/2l+EmIF9JVJnkOBSk8CA
 6vhYvPnBYk2TFGAQGXtB/x5Kk3K58Kb+JWK2LC0KvHYDLkpfE+D7qW5wkiiEt3ki4BN8xadN4Ko
 SkS+F6SbS73db0XsH2w==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b7028 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7K3b00r082jI9b_r_CMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060091

Hi,

On 19-Jun-26 5:06 PM, Konrad Dybcio wrote:
> On 6/16/26 10:40 PM, Hans de Goede wrote:
>> Hi konrad,
>>
>> On 16-Jun-26 1:04 PM, Konrad Dybcio wrote:
>>> On 5/25/26 2:46 PM, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 25-May-26 14:29, Konrad Dybcio wrote:
>>>>> On 5/25/26 1:47 PM, Hans de Goede wrote:
>>>>>> The EFI memtable (shown when booting with efi=debug) shows that the
>>>>>> xbl_tmp_buffer_mem region size is 0x1c0000 bytes large not 0xc00000 bytes:
>>>>>>
>>>>>> efi:   0x000082800000-0x0000829bffff [Reserved    |
>>>>>> efi:   0x0000829c0000-0x000083efffff [Conventional|
>>>>>>
>>>>>> This fix aligns the size with the EFI reported size and makes /proc/iomem
>>>>>> correctly show mem blocks matching the EFI memmap:
>>>>>>
>>>>>> 82800000-829bffff : reserved
>>>>>> 829c0000-83efffff : System RAM
>>>>>>
>>>>>> Instead of:
>>>>>>
>>>>>> 82800000-833fffff : reserved
>>>>>> 83400000-83efffff : System RAM
>>>>>>
>>>>>> before this change
>>>>>>
>>>>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 +-
>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>>>> index de0f2346cb38..5a2e84365901 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>>>> @@ -582,7 +582,7 @@ tz_stat_mem: tz-stat@82700000 {
>>>>>>  		};
>>>>>>  
>>>>>>  		xbl_tmp_buffer_mem: xbl-tmp-buffer@82800000 {
>>>>>> -			reg = <0x0 0x82800000 0x0 0xc00000>;
>>>>>> +			reg = <0x0 0x82800000 0x0 0x1c0000>;
>>>>>
>>>>> FWIW the reference memory map shows a contiguous block of:
>>>>>
>>>>> 0x8280_0000 -> "no reclaim XBL scratch_buffer2"
>>>>> 0x829c_0000 -> "reclaimable XBL scratch_buffer"
>>>>> 0x83f0_0000-0x8400_0000 -> "no reclaim xbl scratch_buffer1"
>>>>
>>>> Thanks, so the first part here 0x8280_0000 - 0x829c_0000
>>>> aligns with the EFI reservation and with the dts reservation
>>>> after my patch.
>>>>
>>>> 0x829c_0000 - 0x83f0_0000 being reclaimable matches with
>>>> both EFI + the dts (old and new with a different start)
>>>> having this as usable RAM.
>>>>
>>>> The 0x83f0_0000-0x8400_0000 area seems to be marked as
>>>> reserved by neither EFI nor the current dts...
>>>>
>>>> With the first part of the reference memory map aligning
>>>> with what EFI shows, I think this patch is correct.
>>>>
>>>> I wonder if we should do anything about the 0x83f0_0000-0x8400_0000
>>>> range though ?
> 
> [...]
> 
>> [    0.000000] efi:   0x000080800000-0x000080dfffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> =>
> gunyah_hyp_mem: [0x80000000 - 0x80800000)
> hyp_elf_package_mem:    [0x80800000 - 0x80a00000)
> ncc_mem:        [0x80a00000 - 0x80e00000)
> 
> then we have these ranges that are absent(?) from the efi map:
> 
> cpucp_log_mem:  [0x80e00000 - 0x80e40000)
> cpucp_mem:      [0x80e40000 - 0x81380000)
> reservedregion: [0x81380000 - 0x81400000)
> tags_mem:       [0x81400000 - 0x815a0000)

Ack, which is why I keep these reservations in the DT in patch 2/2
note the EFI memmap does not mark these as RAM it just skips this range.


> 
>> [    0.000000] efi:   0x0000815a0000-0x0000819fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x000081a00000-0x000081a3ffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> xbl_dtlog_mem:  [0x81a00000 - 0x81a40000)
> 
>> [    0.000000] efi:   0x000081d00000-0x000081dfffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> RAM
> 
>> [    0.000000] efi:   0x000081f20000-0x000081f2ffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> =>
> usb_ucsi_shared_mem:    [0x81f20000 - 0x81f30000)
> 
>> [    0.000000] efi:   0x000081f38000-0x0000826fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> just normal ram
> 
> 
>> [    0.000000] efi:   0x0000829c0000-0x000083efffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> this conflicts with:
> xbl_tmp_buffer_mem:     [0x82800000 - 0x83400000)

Right, that is what this patch fixes, the size of the xbl_tmp_buffer_mem
reservation in the DT is too big.
 
 
>> [    0.000000] efi:   0x000084000000-0x000084afffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> normal RAM
> 
>> [    0.000000] efi:   0x000085380000-0x0000866bffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> =>
> spu_secure_shared_memory_mem:   [0x85300000 - 0x85380000)
> (hole)
> 
>> [    0.000000] efi:   0x000091480000-0x0000a67fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> RAM
> 
>> [    0.000000] efi:   0x0000a6800000-0x0000a7f00fff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000a7f01000-0x0000a7f01fff [Runtime Data|RUN|  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000a7f02000-0x0000a7f04fff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000a7f05000-0x0000a7f0cfff [Runtime Data|RUN|  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000a7f0d000-0x0000a7f18fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000a7f19000-0x0000a7ffffff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000a8000000-0x0000bbc0ffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000bbc10000-0x0000c177ffff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c1780000-0x0000c178afff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c178b000-0x0000c3933fff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c3934000-0x0000c4c76fff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c4c77000-0x0000c50aafff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c50ab000-0x0000c54fcfff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c54fd000-0x0000c5b12fff [Boot Code   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c5b13000-0x0000c5b21fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c5b22000-0x0000c5b23fff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c5b24000-0x0000c5b34fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c5b35000-0x0000c62e3fff [Boot Code   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c62e4000-0x0000c62e4fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c62e5000-0x0000c62edfff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c62ee000-0x0000c65f6fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c65f7000-0x0000c66d5fff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c66d6000-0x0000cf6ecfff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000cf6ed000-0x0000cfbb9fff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000cfbba000-0x0000d0020fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d0021000-0x0000d5135fff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d5136000-0x0000d5136fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d5137000-0x0000d5cedfff [Boot Code   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d5cee000-0x0000d5e7dfff [Runtime Code|RUN|  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d5e7e000-0x0000d6c8dfff [Runtime Data|RUN|  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d6c8e000-0x0000d6c9dfff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d6c9e000-0x0000d6d02fff [ACPI Mem NVS|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d6d03000-0x0000d6ddefff [ACPI Reclaim|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d6ddf000-0x0000d6ddffff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d6de0000-0x0000d6e0ffff [Boot Code   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d6e10000-0x0000d7ffffff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> as described, RAM interleaved with UEFI regions
> 
>> [    0.000000] efi:   0x0000de5b0000-0x0000e46fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> This doesn't reserve:
> 
> xbl_sc_mem:     [0xd8000000 - 0xd8040000)
> reservedregion: [0xd8040000 - 0xd80e0000)
> qtee_mem:       [0xd80e0000 - 0xd8600000)
> ta_mem: [0xd8600000 - 0xe1000000)
> 
> absent:
> tags_mem1:      [0xe1000000 - 0xe36a0000)
> 
> 
>> [    0.000000] efi:   0x0000e69c0000-0x0000f84fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> and absent:
> 
> smem_mem:       [0xffe00000 - 0x100000000)

Ack, which is why I keep these reservations in the DT in patch 2/2
note the EFI memmap does not mark these as RAM it just skips this range.


>> [    0.000000] efi:   0x000880000000-0x000cc236ffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x000cc2370000-0x000cc6bdffff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x000cc6be0000-0x000ffdffffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x000ffe000000-0x000fffffffff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x00000c264000-0x00000c264fff [MMIO        |RUN|  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
>> [    0.000000] efi:   0x000081a40000-0x000081cfffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
> 
> =>
> xbl_ramdump_mem:        [0x81a40000 - 0x81c00000)
> aop_image_mem:  [0x81c00000 - 0x81c60000)
> aop_cmd_db_mem: [0x81c60000 - 0x81c80000)
> aop_config_mem: [0x81c80000 - 0x81ca0000)
> tme_crash_dump_mem:     [0x81ca0000 - 0x81ce0000)
> tme_log_mem:    [0x81ce0000 - 0x81ce4000)
> uefi_log_mem:   [0x81ce4000 - 0x81cf4000)
> secdata_apss_mem:       [0x81cff000 - 0x81d00000)
> 
>> [    0.000000] efi:   0x000081e00000-0x000081efffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
>> [    0.000000] efi:   0x000081f00000-0x000081f1ffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |WC|  ]
> 
> =>
> pdp_ns_shared_mem:      [0x81e00000 - 0x81f00000)
> gpu_prr_mem:    [0x81f00000 - 0x81f10000)
> tpm_control_mem:        [0x81f10000 - 0x81f20000)
> 
>> [    0.000000] efi:   0x000081f30000-0x000081f37fff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |WC|  ]
> 
> =>
> pld_pep_mem:    [0x81f30000 - 0x81f36000)
> pld_gmu_mem:    [0x81f36000 - 0x81f37000)
> pld_pdp_mem:    [0x81f37000 - 0x81f38000)
> 
>> [    0.000000] efi:   0x000082700000-0x0000827fffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
> 
> =>
> tz_stat_mem:    [0x82700000 - 0x82800000)
> 
>> [    0.000000] efi:   0x000082800000-0x0000829bffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> =>
> 
> smaller than
> xbl_tmp_buffer_mem:     [0x82800000 - 0x83400000)

Yes and this DT reservation conflicts with:

[    0.000000] efi:   0x0000829c0000-0x000083efffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

Again, this is what this patch fixes.

>> [    0.000000] efi:   0x000083f00000-0x000083ffffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x000084b00000-0x00008537ffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
> 
> =>
> adsp_rpc_remote_heap_mem:       [0x84b00000 - 0x85300000)
> 
>> [    0.000000] efi:   0x0000866c0000-0x00009137ffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
> 
> =>
> adsp_boot_dtb_mem:      [0x866c0000 - 0x86700000)
> spss_region_mem:        [0x86700000 - 0x86b00000)
> adsp_boot_mem:  [0x86b00000 - 0x87700000)
> video_mem:      [0x87700000 - 0x87e00000)
> adspslpi_mem:   [0x87e00000 - 0x8b800000)
> q6_adsp_dtb_mem:        [0x8b800000 - 0x8b880000)
> (hole)
> cdsp_mem:       [0x8b900000 - 0x8d900000)
> q6_cdsp_dtb_mem:        [0x8d900000 - 0x8d980000)
> (hole)
> gpu_microcode_mem:      [0x8d9fe000 - 0x8da00000)
> cvp_mem:        [0x8da00000 - 0x8e100000)
> camera_mem:     [0x8e100000 - 0x8e900000)
> av1_encoder_mem:        [0x8e900000 - 0x8f000000)
> reservedregion: [0x8f000000 - 0x8fa00000)
> wpss_mem:       [0x8fa00000 - 0x91300000)
> q6_wpss_dtb_mem:        [0x91300000 - 0x91380000)
> 
>> [    0.000000] efi:   0x0000e4700000-0x0000e47fffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |WC|  ]
>> [    0.000000] efi:   0x0000e4800000-0x0000e69bffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000ff800000-0x0000ffffffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
> 
> llcc_lpi_mem:   [0xff800000 - 0xffe00000) (UEFI reserves more)

Regards,

Hans


