Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FDC402BA9
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905695; cv=none; b=A+4Njp77VH85K0QMPfEIcdxWqQZiKCnREoQdjbdnPD9HZ1Tm7D8ckQqCk8OrGt0MXW15Un35CUWdB6KCfgHwrbrFqAmz9v5bBK85HsYLMPs3ZsTuutsGoFhKBfxo8VhP4zu+L3gaO0GuMpoykJTsea2fEM5YFZWGqTeEyA+QCmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905695; c=relaxed/simple;
	bh=GxItDz3J7MMorYjhcNKlegY4Ed8sm631c+bMYoXpoks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bc2E7iBBLCDLuek9rB2TdUu8JLtCOT2IuVcGVKcKtOjZRYnmIRBuYez4n33IzB8oXUVraxyJ9SZJdP5LSo/negk7i7nItRIzIZRWzCHLTYmAvlMsm4l4g6cunATPqtIgvBN9PkZLib8W5zOSTNK5UmtgC21mX6LphIq2Rz+lYlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K7eqsMTk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cCZTGR7D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K7eqsMTk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cCZTGR7D"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbBTF3344445
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GxItDz3J7MMorYjhcNKlegY4Ed8sm631c+bMYoXpoks=; b=K7eqsMTkRVmDfRHk
	MPVX4EZamuMgvL72VzXrg/3p0XEdMLZZa/lskYJ5f0AwhpellcG3bxfspUXMMpOy
	Z6TWGFj6I9I1yMcmewwskIe8KHQohbBU5iM82RQ2nq+RfjJYVb6Y7bWEPIRY84TT
	RzDSl1HfuWJoQxzB8DlxnAjQwSDXi8bbFq7ox7GoGHcv+BvWDSNNXvlGOXVkXQcS
	jgkHDZOIRStUfwROjA2LpcrwiUH+SnRZ1XRkOBqTAw5ZF0eOHlLs0nAqAad2bTOa
	gujgQiV3iMTsC9s4998GyqhmM1WuRMPZW8hxTJB/kIIARIvfwcm0jvIyeOIlO88Y
	9XIMMw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cf0hyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:08:09 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e8577d187so7407987b3.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905689; x=1785510489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GxItDz3J7MMorYjhcNKlegY4Ed8sm631c+bMYoXpoks=;
        b=cCZTGR7D76tKgC9KdfFbEi3tgIpl3fNbS9BPwHJxdh10noY2hI3w1+bYC10V2tQXvX
         o2Lqvgd8u4W5ucuJQL39UPW6iIHiF+zaBEEOt9ejtscPrljPidY0pDcTWK7rXQ9u++m1
         GNmvh62yofH5ibSDB5hPdoKcmfWepSw/S1Q1IoQgfrqWLVgCjBF+eHNuOcH9WFPaiBPc
         GFUD/ph59GVZ2Jh/l5mJmsa9SL0dpr43hLkOy272sKCvYeoD9at5mvkVyo554BivY3fk
         wTjnn4Ksjx1grxoGJVogqsx1BmNeXvag1POby5qntj8+GtMUTFUK+WjGygWpdch+6ozR
         Q3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905689; x=1785510489;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GxItDz3J7MMorYjhcNKlegY4Ed8sm631c+bMYoXpoks=;
        b=kvF7u2y4OPLTDHhg2EbQf/Svib8DJh6pjoF8vxXHht9AGN9IlXqdZLFYMh4ER/rZlA
         T5gsgZGBkMCu7c4HXpD/vcZX587r6TVSZgyDG9G6wTTA5onkpuJ0AEpPdEmvoAHBZ22v
         cMaVZckJBwOK8ipXnSXkJ6dtZ6DH8b6hwh5JCqACosIQoKhJpI4uNtnNA02tP/ay5KOb
         YA0MiVWohanHasqx54Aj6ARNQ0JjYRxUbbfJkPXzKdjaqtG2G7Ed2XczYQ/Ot3X1ttDc
         P2UYO4dKN9PFUBwSHz4GJXziysllJ9KQBhzuo4C4P73T2cpgHPbHEZA5rLAfOLX3IY3J
         mPoA==
X-Forwarded-Encrypted: i=1; AHgh+Roiigjv9JfLjmpYLNwMcBhw3NR/E9HUWHOdPdPtPTK1y3WPLNo5oqNVvoe3ouPu1+Sow7Oo9vClVZYQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd9TovCcM24e7Q9lYnPYVvF0odRUFt6uRCh5KGSZEr7BzZ6Qhk
	gslT/7uUXcG19AA/Bt5bM06QAmYFtrLT94IuwNFC65ZH+f+F4CsNrqu7EzjjITjJrf4VMZJ16UI
	ZrNidhMRGu5LmZOTXOIFjnrBVQPjnTu+MYNkf1bL7zF9ZMY++enP1UEenKSzELQ5nq9WjO5Ut
X-Gm-Gg: AR+sD13qH/KCWHYyztE/QBjYYO/AO9I0SvTZWDLy4vBzQmUawFxM8UzQvyYhK2xdJFb
	S9UZV1k2VtkVZQWvaBtFrsLC/IjbN5JjV+XxH1P8AI2HcTdfjH9+3yWtCvd6fszZvrvvgmB4G2r
	vBdQNIcV4uTeA+SUuF33krWdinnQljTp/T/pHFOzF8eKD6F5D9H3dgBffh7S1Wv36TCdUrocJKi
	zgs/xSw8JASrHViOzFx3goY9K0Jj3EZ4I1jSxV3w3zTY0b37zbEmKnDQ5E0SLrKbcu7oArJgfku
	3bGBy5IONV3k/Ky3uUwcdGyyEoD/fQyG+sPGTcSUWONZL0yElSZrlyFGFRSdqAa1pE190Gndhn/
	p9EVTB3PND7iF3vTLRSrRLcJ99jzFYEAD2YUnxA==
X-Received: by 2002:a05:690c:4c06:b0:81c:d9d0:8d6d with SMTP id 00721157ae682-81f4c3534fcmr25156057b3.57.1784905688732;
        Fri, 24 Jul 2026 08:08:08 -0700 (PDT)
X-Received: by 2002:a05:690c:4c06:b0:81c:d9d0:8d6d with SMTP id 00721157ae682-81f4c3534fcmr25155797b3.57.1784905688193;
        Fri, 24 Jul 2026 08:08:08 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.146.251])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f65932eeesm1119767b3.48.2026.07.24.08.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 08:08:07 -0700 (PDT)
Message-ID: <4b75ee6a-bbfc-4079-b617-4ba366f2c439@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 20:37:57 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] net: wwan: qcom_bam_dmux: Alloc RX buffers as a
 single coherent block
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Stephan Gerhold <stephan@gerhold.net>,
        Andrew Lunn
 <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com>
 <20260714-qcom-bam-dmux-vmid-ext-v1-2-3f29da7cca76@oss.qualcomm.com>
 <alXm0rp3NK62G3-3@linaro.org>
 <c8417ff3-db92-446a-acf8-8c73c83b85de@oss.qualcomm.com>
 <amMxkrW3mu48HIOr@linaro.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <amMxkrW3mu48HIOr@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNiBTYWx0ZWRfXwXMs28alfD0U
 PDJ2PwFhblFmK4RVZecQpZj1FGmDN9DmE1XZXyf+SaU0GeytWeN+J6eFonw8tTATxl9HP6QVvBy
 8/hdRq+GYM80W7oZTlwJL4rz+p/wltE=
X-Proofpoint-GUID: 9kHmCKS7o6ToDT8GeEDpzBcBdKqX4pAR
X-Proofpoint-ORIG-GUID: 9kHmCKS7o6ToDT8GeEDpzBcBdKqX4pAR
X-Authority-Analysis: v=2.4 cv=er/vCIpX c=1 sm=1 tr=0 ts=6a637fd9 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=K/78aEDNEn2Q/Yuv7mVN5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lNWbMoYigRjAFYUbelMA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNiBTYWx0ZWRfX9QxGsMkfClLA
 sqf8OhDTj2RpOpXiGyDJYnyvyYNGzcYkXdnjAMSwfZQX4OtYDvCroZ7jwep6cGuDARV55Ga8y3E
 +tgO7zPoRYRlkVTLpl7poDhe2tQkwMcrmtwBHL2c2iqjv/dg0TJw1LPAOUe5rLNuKheKUFk6T3t
 BolZGC5j87C982dRmPRI2bMcGYEyA+WX+Q2+ncEgNndNXXYA1hQdpiz2m9o1DB+pnwSsZSQPMyO
 3UT4DOOGoq+PgLY32T+CMfgx9k5JfsEjdreiIyMiysmc+V/8TTBPZHT6TxPPW2lZcleciAMhqBV
 +X9Pa0nOb+O8wwbtMLzq/gfYFqXoKZd0FtOZlUDc28O8O2SFzEBQId0WqOMnzFAXmuLN7fLhu6d
 vqyyd6JZLucm9a8z+JALhkI+wsOIk8oMMy6LHjOdcraG7srmmEoCXio5G1GwUP/2A9+JfZSTRIl
 IIOUnFT363JVeKG4EVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240136


On 24-07-2026 03:04 pm, Stephan Gerhold wrote:
> On Fri, Jul 24, 2026 at 10:16:31AM +0530, Vishnu Santhosh wrote:
>> On 14-07-2026 01:05 pm, Stephan Gerhold wrote:
>>> On Tue, Jul 14, 2026 at 11:02:32AM +0530, Vishnu Santhosh wrote:
>>>> On Qualcomm SoCs where the modem (e.g. the mDSP on Shikra, VMID 43 /
>>>> NAV) is the AXI master for BAM-DMUX RX transfers and the XPU enforces
>>>> per-region access control, each individually DMA-mapped RX buffer
>>>> requires its own XPU resource group (RG). With ~16 RGs available, the
>>>> 32 per-buffer dma_map_single() calls exhaust the table and the first
>>>> inbound transfer faults with an XPU violation.
>>>>
>>>> BAM-DMUX is a singleton (exactly one instance per SoC), so the
>>>> destination VMID does not need to be a DT property; it is looked up
>>>> from the compatible string's match data instead. Add struct
>>>> bam_dmux_data with a single vmid field, and a shikra_data instance
>>>> hardcoding QCOM_SCM_VMID_NAV for qcom,shikra-bam-dmux.
>>>>
>>>> When match data is present, allocate all BAM_DMUX_NUM_SKB RX buffers as
>>>> a single contiguous dma_alloc_coherent() block and SCM-assign that
>>>> block to HLOS plus the VMID once at probe. This reduces RG consumption
>>>> from 32 to 1. The block is never reclaimed across a modem power cycle
>>>> (bam_dmux_power_off() does not touch it), so the probe-time assignment
>>>> covers every subsequent restart without re-assigning or reclaiming. It
>>>> is reclaimed to HLOS only once, at remove or on a probe error, and if
>>>> that reclaim fails it is leaked rather than returned to the page
>>>> allocator.
>>>>
>>>> Each rx_skbs[] slot is pre-assigned its virtual and DMA address from
>>>> the block, so no per-buffer mapping is needed at power-on. Because the
>>>> coherent block is not page-backed, received payload is copied into a
>>>> regular netdev skb before handoff to the network stack; this is an
>>>> unavoidable extra copy on the XPU-enforced RX path.
>>>>
>>>> Platforms without match data are unaffected: rx_virt stays NULL, no
>>>> coherent memory is allocated, and the per-buffer dma_map_single() path
>>>> is unchanged.
>>>>
>>>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>> So how do you handle TX buffers? Right now, they are just passed on from
>>> the net subsystem. There can be up to 32 TX buffers in progress as well.
>>>
>>> Overall, I have mixed feelings about this patch. It looks reasonably
>>> simple, but fundamentally I don't understand why we need to go back to
>>> the old days of implementing protection using a highly limited MPU (in
>>> your case: the xPU).
>>>
>>> Why does the setup of BAM-DMUX differ e.g. from the setup for the crypto
>>> engine? Crypto is also using bam-dma, but it avoids this inflexibility
>>> by making use of the &apps_smmu. Is BAM-DMUX not covered by the SMMU? Or
>>> did you just decide to bypass the SMMU in this case? (If so: Why?)
>> I checked with secure systems team on this. Crypto BAM is
>> behind apps_smmu, so protection is enforced through the SMMU's Stage-2
>> page tables.
>>
>> A2 BAM (used by BAM-DMUX) is present in secure domain and does not
>> support Stage-2 translation on this SoC, and there is no IOMMU domain
>> that can be attached to it. The only protection mechanism available is
>> the xPU.
>>
> Thanks for investigating this!
>
> So is this a hardware limitation or something you could change with a
> firmware update? Could you move the A2 BAM out of the secure domain and
> protect it via the IOMMU instead of the xPU mechanism? The other modern
> platforms with IPA do not have this limitation, they can use the IOMMU
> for this.
>
> We can try to support the xPU protection mechanism in the BAM-DMUX
> driver, but it's pretty bad from a performance and memory usage point of
> view if you need to copy buffers around multiple times. So if you have
> some way to change this in the firmware (and there is still time to do
> so before production boards ship), I would strongly recommend to
> investigate that.
>
> Thanks,
> Stephan

I agree that relying on xPU protection in BAM-DMUX introduces performance
and memory overheads that would ideally be avoided.

I'll dig a bit deeper with the relevant hardware and secure systems teams
to understand whether there is any possibility to move A2 BAM behind an
IOMMU domain and get back.


Thanks,
Vishnu

