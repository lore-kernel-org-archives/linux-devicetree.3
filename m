Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909563F1672
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 08:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673068; cv=none; b=QNJ6WICDv5ALLywMpEEbQ0VabQIplAZl1ZspdkiSocFT1SsTMSVw236pGdyre1vBcyKzdkQ7qE8upaa/YnDXj+Y+BMU4AjDJlUGyLDgIRTx0EEAm+XN24F8rYbWMJurjLf9y7Zj7FGh/TDTaMY0zM3YkQ7Q9tXgAgotb5JiGJEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673068; c=relaxed/simple;
	bh=ETTx6erwN3T6vCZ7hUgrR7CmDthuW72cv4YgHfFIpsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bs854aPzx5u8c62kGXzuBsEsVeLf2auzHeos27AVGkTZXgpNVf7oz83QQ5QPgSWKy43Rz13x0C/aEP38LEF89mF5eghcThYjJJjDzoTv6S5JW/PBMFBn7/brsBkATrWLRajXdvFgzUYjtHFqkLnm6v1PqZOnzvDJ6BEd1jkgCWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8Beg7rc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/pU2uJ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8Beg7rc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q/pU2uJ0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dYnJ056516
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 08:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i1zQXih8SnCdGds/JmDRvepmzcgGZh61T0foqMxPgn4=; b=A8Beg7rcajSpzwuI
	B2GtGnLgslhyReSllSpYpv/4Jaxa+PoMngOHhialNVYOXlDzRseChMeMnrM6S6e9
	fBor8VEPyfpXfYoLCIo/aEOHK1H/8W5usNi6ucrvlwyG/+EQB4Ndo08/OlM10X8k
	52PvSA61xPWcgT6I1LhZmw63InMeSDrwgS6bRHUmpspyhUCj0ILP3CM/z4+E/YAt
	L5IViaNpmAvkxarxPRsxus/QS5W0YrXzaTmMnPFVeT9F7aBTSHQDiqGdkp1Ocrcy
	YtLDSwmb6irZMHavDmu18FWINSDjDgXPZFde812FHtBuBR7lxRoU1qCzk3pSCa05
	3khILQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajwta6bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 08:44:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e566bae1bso18777785a.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 01:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783673065; x=1784277865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i1zQXih8SnCdGds/JmDRvepmzcgGZh61T0foqMxPgn4=;
        b=Q/pU2uJ0yGnr4qOZZDhEwxBqDUIL6jNK5w4L+LjoCre8zrmfY+pj8+AXxDwArzLxI0
         /sVC5IKfKD/8z7O+CgrSTL+gSHxgSn9Ld+jXOqzHs5PTKx9tgiImFa1RugtmJYKf3zCN
         +ZGHIwxiyBfcOMK1E2B6VMrg1rCyr5hXWTtTLWf1HJjtd1t1HaTdnViFtsxXfG0c89Dm
         valOtnjYOuH+ATJeaPjU/YWQiXaqy7lsCifwyyqX2j/9YtCwNqq0/8bs2k6Aw6fmTHhG
         FYymBm2IkDB88f/kE4KJPF6QvkrwgnqCjpXywRsUeXYplK5C/AS+PPox/8FT7fdiPM8S
         DHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783673065; x=1784277865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1zQXih8SnCdGds/JmDRvepmzcgGZh61T0foqMxPgn4=;
        b=W7H8gX/y+rs5XBX/1ZOudIRCEEOIWWmgpmQtFvChUK3/SsZ+aC+yTZZJskrebpMDD0
         GFy25nl84rXGubsgNGAXKzFdD0r/aiPoWPBqvEWX2viCxiDSYC35+unY5ViPPgOkkd/Q
         Th0kIssJwEftsLJZWWag9cayd/95bwdzzqfs+SUFxP82BbBk1pfu/62icSsaECBjDd9A
         JI5kt5/QVXK3Jv4kktTVGlD1vzVnW0oJOtrEMqsuf3m2dvlNJkrZAW4yiY+48Sqhy1XA
         cPadx8CjGpiTZdiKKbEIjAI0p1Fiwul+5cOZTMtJVqclDcjrpiIViiUnb4ZmfpWN3s/7
         9zUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrq22iS54ievljJnb7JBpGa/S10qaRSaXdnOHTN+vyuTUDeWuNgPWJuXpx5K/qdyhuZxDDg4ZUyESlg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9VOhl4oyAw4gRfVcWBcpeex53YUjYPrlNqXb0aCaGN/ieotet
	M2vWscY9KmIbbqdTS57EYv8FoAX5WFjUir35p96UZlCz1snjw6gpiXJPuRGo6sjR4HgkFBTtFRZ
	Ww2dD9LRuB5TI+BC4weRZ4QrJpgXMYXgKkGc50wbrkVfyyaR+RQFus/J6PXXf0JTD
X-Gm-Gg: AfdE7ckQ+wHCf1SDm8R4tATV+mRKmEp1xkgX1bD6fEGvq1KrP1f+m8sLZEquidYRfnk
	1B5G8fqCHADcyeu/9+mrBh7wYdXOEpxXLtqra3/CB9XP0Nnr9GjzXQS3r05+bCBYJm5wIZa2A//
	fkrW6zW3tw4xMZZzAk5YbKx1iEh2U6E9KAVzKCVIh0ru0QrR3DPJTG+0c6V85jiu0BPwVi7OtaF
	jrbiJAe6vV6E3eoJmRwYAmiyHhuaSpWtOoFLxSoPumfFv9HvvLND1VGfQ6vvp0v1qMIfbwx3M0F
	O/GHAh4lFN7g6g9R1n7dSrh3pFR/bgyVj77eoLayWbCOGfYzdw74SE0kZCRgRXTnGYamawu4GqK
	GtlsuEiYItE/F6lMaIvyoS89Mjct1xFS7Gtc=
X-Received: by 2002:a05:620a:454a:b0:915:7a64:cb68 with SMTP id af79cd13be357-92ed7779c70mr620219385a.2.1783673064720;
        Fri, 10 Jul 2026 01:44:24 -0700 (PDT)
X-Received: by 2002:a05:620a:454a:b0:915:7a64:cb68 with SMTP id af79cd13be357-92ed7779c70mr620218085a.2.1783673064268;
        Fri, 10 Jul 2026 01:44:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad694736sm583711566b.0.2026.07.10.01.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 01:44:23 -0700 (PDT)
Message-ID: <6802dc29-d783-40df-bbb8-8b2dbd94be29@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 10:44:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 9/9] arm64: dts: qcom: glymur: Wire PCIe3a/3b to
 shared Gen5x8 PHY
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-9-269cd73cc5d1@oss.qualcomm.com>
 <ab21f1c7-f861-4961-9287-84cae280d8c1@oss.qualcomm.com>
 <akH9LKxqhciznM2x@hu-qianyu-lv.qualcomm.com>
 <ae2e1bdd-59b0-4ff7-bd6f-ddd57267c2d9@oss.qualcomm.com>
 <alBWrK8X7fW+UC7L@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <alBWrK8X7fW+UC7L@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XOYAjwhE c=1 sm=1 tr=0 ts=6a50b0e9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=TLRsrNMnCJaxhW4YLJwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 0PCFkQNpOOUHOD9OAfP4u49OdVEkws6b
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4NCBTYWx0ZWRfXwwzUgk8P6/4A
 dVjkjWdyJuEpBrFI07h2dZrVTc1PN26xATsP8tcK2fRpW9que3kkCJW8Vyo0QdB8SkEYpOh3iki
 TpESOUylcmf7imXGgVmzEHQqRIpaqxE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4NCBTYWx0ZWRfXxZC3Qc6iXFca
 54l5OV6RJiMUtCpZJzgSEGavCRRGiqwXaSscG+UjM/f1JIBmipxI3Z5m+cm4UDLo7ebJo+U5fk5
 S0vfOz8qKvyPb90kvAXVFPAMavsbZ/It8zI8fbyXkmdkAJf4rOOyJq9DU+k3Wu9yES+c0ToeGiL
 M5LWkmwbynRqWp2Px1iPougiNtNbvYV2B2xIFxQCD4ATibDuW2CrOyKv1cA9IJE9XelneGAkUba
 uS3Q2vzIpKIFvWVh6mT9238mKsG5lGmb74T5TTnCjXAAxmq1OLABke/x99RX2F9Ji2AZGQEvHzL
 1WXxBHLVekwM1OpoIhTwhrZW1Q0apLOiNsspnVDFEO73VclJT2ybuJr0bkWCZzL8XLp+w5oYVsw
 4wZG4ScLd0p7YkdTdLHRmwAsRuupArrQMOIiP8JQomR43fOWwXEpMN44ywRZwoJF1uclzXxmjIi
 Irf7Aj9tzJFefHMLZGQ==
X-Proofpoint-ORIG-GUID: 0PCFkQNpOOUHOD9OAfP4u49OdVEkws6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100084

On 7/10/26 4:19 AM, Qiang Yu wrote:
> On Mon, Jun 29, 2026 at 11:20:07AM +0200, Konrad Dybcio wrote:
>> On 6/29/26 7:05 AM, Qiang Yu wrote:
>>> On Wed, Jun 17, 2026 at 01:19:49PM +0200, Konrad Dybcio wrote:
>>>> On 5/19/26 7:47 AM, Qiang Yu wrote:
>>>>> Glymur PCIe3 uses a single shared Gen5x8 QMP PHY block. Model PCIe3a and
>>>>> PCIe3b as consumers of that shared PHY provider instead of separate PHY
>>>>> nodes.
>>>>>
>>>>> Update the DTS wiring to:
>>>>> - point GCC PCIe3A/3B pipe parents to the shared PHY clock outputs
>>>>> - add PCIe3a controller node and route PCIe3a/PCIe3b port phys to
>>>>>   &pcie3_phy using two-cell PHY arguments
>>>>> - configure the shared PHY node with link-mode and dual pipe outputs
>>>>>
>>>>> Use QMP_PCIE_GLYMUR_MODE_* dt-binding macros for mode selection.
>>>>>
>>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +		pcie3a: pci@1c10000 {
>>>>> +			device_type = "pci";
>>>>> +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
>>>>> +			reg = <0x0 0x01c10000 0x0 0x3000>,
>>>>> +			      <0x0 0x70000000 0x0 0xf20>,
>>>>> +			      <0x0 0x70000f40 0x0 0xa8>,
>>>>> +			      <0x0 0x70001000 0x0 0x4000>,
>>>>> +			      <0x0 0x70100000 0x0 0x100000>,
>>>>> +			      <0x0 0x01c13000 0x0 0x1000>;
>>>>> +			reg-names = "parf",
>>>>> +				    "dbi",
>>>>> +				    "elbi",
>>>>> +				    "atu",
>>>>> +				    "config",
>>>>> +				    "mhi";
>>>>> +			#address-cells = <3>;
>>>>> +			#size-cells = <2>;
>>>>> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
>>>>> +				 <0x02000000 0x0 0x70000000 0x0 0x70300000 0x0 0x3d00000>,
>>>>> +				 <0x03000000 0x7 0x00000000 0x7 0x00000000 0x0 0x40000000>,
>>>>> +				 <0x43000000 0x70 0x00000000 0x70 0x00000000 0x10 0x00000000>;
>>>>> +
>>>>> +			bus-range = <0 0xff>;
>>>>> +
>>>>> +			dma-coherent;
>>>>> +
>>>>> +			linux,pci-domain = <3>;
>>>>> +			num-lanes = <8>;
>>>>
>>>> Is it fine to keep num-lanes 8 here even for configurations with
>>>> bifurcated PHY?
>>>>
>>>> I would assume so, given essentially this is a x8 host, whose 4
>>>> lanes may simply be effectively NC 
>>>>
>>> Actually, on existing platforms, the PCIe3a and PCIe3b controllers are
>>> never enabled at the same time. When PCIe3a is exposed, it is always in an
>>> x8 slot. But if we have a x4+x4 platform in future, we can simply override
>>> num-lanes to 4 in the board.dts.
>>
>> My question is whether that will be necessary - if yes, sure, we
>> can do it, but if not, we can conclude on this early and not have
>> to fight over it in a couple months
>>
> I think we do need to override it in that case. If both PCIe3a and PCIe3b
> are enabled in x4+x4 mode but PCIe3a keeps num-lanes = <8>, userspace
> will see an 8-lane slot. If an x8-capable EP is connected to that slot,
> both ends will advertise x8 support, but the link is up at x4. That looks
> like a genuine bug from the user's point of view.

Do we know what's advertised on x86 PCs with bifurcated lanes?

Konrad
