Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6F73E7650
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786611914; cv=none; b=r1U3a/qZ3b6nr178qUpRJfnNiJw5D3MuLxKKPHmgc3r3H14L5Ni7b32/cOMtd2wr/CheHokZ0dVsNSTxZUoBbTj545Egj1gGWIVKj2NV/AHmod3w1IHyXgvmoq6kCoXIx97y/ovi9V4wFDMHtHp8muNGZtvCHtcXmun0CUtYBG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786611914; c=relaxed/simple;
	bh=T0L3tpfGXHSCFKA/MYT8j6LXFVeLB1uzDVoTGvUhPPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qfRJ1xJvxZTe/PLZYXyi/giPztM4KoBh3S9jF3mDqx3WCz1deZ37gA70AgJnmdxGQeaDPZA80aOV6Tb92jj5LY+/IP+f/+u+fA+9n9up2KYcvrcJXa1OlPu3Ze3jXqjufVgUUkk7Y59S5V6Z+XNqWWdLh8hBShfHo1jE2wZ+xlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCR4KQ6Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hi7ulfZ8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCR4KQ6Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hi7ulfZ8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D91wD03421755
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T0L3tpfGXHSCFKA/MYT8j6LXFVeLB1uzDVoTGvUhPPU=; b=kCR4KQ6ZidoXLKJj
	8bdoJIPbEp0Yh2NEQYDyh/SLC3I3ZiYLrsoHCeKQNI3hHIoqCjw/4q8QBUDNXqbY
	IkVz+53Lk+4NFz/WaiAZuLN9+mQYfxBEx5krDKFXuvaxB4rXzauBAYTOl6MUS1zT
	5k/JZcfF21Bht016DV8KrqpnGHm3mmz/8Kvoxf0lTGfk/fOpyfTG0CrpMW0cf62x
	SLBY23IdL5waqJtl8t8oN3/I4Q8Ojc0A2hODFfIs5CZwkgULaGOOd/vuGwYyz6GS
	ngaqf8X+ojRzsV0zj6VC/W4yBENsoI4mAjr3fQoVwIrTeXkKaCnRC9ryD9UaX9Ty
	xlpqcg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g152m9fau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:05:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca124bf0189so608235a12.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 02:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786611911; x=1787216711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0L3tpfGXHSCFKA/MYT8j6LXFVeLB1uzDVoTGvUhPPU=;
        b=Hi7ulfZ8/KJgY87a2tTNAPfkookSstZP39cMCyUrexynnnDpLpBSLfV2SNzU7SOuph
         EwVd3sxrB92omNaUOgVguWHYQRLQKoBpBhIwQWVcuvjDBueD/Ca3uBaNC12+rNcMUtLQ
         cGmK2vI8WObQ+ECPozgTfqf5CVx7AhsUEbxWDpOELozQ/1saS6+rgxMfhaXh21PB58/V
         6kYMOEqIscIzTKWPGkDJXD59+3qQsmM68FHUvXF9rTOHKj/eYX8JRioO8kTpvs2I6jum
         mjpgvcoPkj+OfkffgJINfp+wKPgkvAXt1t1onif87PPMvD2QHBnnZ+Q5AOIXB2fCUMuu
         DzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786611911; x=1787216711;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T0L3tpfGXHSCFKA/MYT8j6LXFVeLB1uzDVoTGvUhPPU=;
        b=RWgjKD5WpxkXNzHng5Im+qWOmaEOJsh0civClgpC/2pNmhcgq4H68WZvB2UfMLLVae
         3YKJEDgfNpzbqQeE2TuU0rzRBuKyE0rUDzSw7hxEIZFSmwrYK1P8iEEkOhGqYHEEXG3N
         U5ONoCJB/szmN3G0GZcqIAEL9HbjIW06zzuk0Hn4MVXZgi4MaaotBhJf7mHR8lsawall
         o66fy3WesL3tYd6WFhdpAob691q9TffArcacG58FtMuXAGV7uVneYUABlfqVr2GxdpUG
         rHlP7TJN2Z4KwHb1CAOuB6+kqudmOT7epFbTcMyOBBlyvWcmD9SKy370TdZivGqR6gmj
         0y3A==
X-Forwarded-Encrypted: i=1; AHgh+RrEroHyUJIsHt8BtXJPD8XyIWYMfQWsD/lpd17FnYcSRXey5uRijZZFPPdKno6+7ekTAIEtLmF1lFzd@vger.kernel.org
X-Gm-Message-State: AOJu0YzSLPWrz0iF+eyXrqOAodxJ9/m+kgfX/gas/NJEycXgVlFDOKeb
	abvCuZU7D21FpNDBmXPmYFNOgsrKfPq+ikzgBQrToiFH/YOHc2D7t2Y1T1agW5waM1FjxowCk+S
	9xXjO8PxKq7VEmKzHrMT+4mqCXpZ6WLq+k4B3BY7bHynKE+j/rYfxDgIl8K/0xUci
X-Gm-Gg: AR+sD13QWB05sZ1eOtGwcTDrkxmwK9H2QB4d5ndejHQezp09BsbEJIHx4G63xoWKzlo
	7C6yls37uXlukn9jZhtOAWSiEC+LVbMVWFc4sMb9J974ekIPNfebcxXgoMPdFe3vmf7t8s7VBcA
	I1WiXPo1Bjx8wkbrlJ4M0UmF2OGIdrebQ2XKiGalSzLo4YOdA0RkQgcLXTSQibwLAdC2sHgG1EU
	zjPZg2BQE1r+luRYaD1fVenAPDplgePpzqTFEaxf1TOPvMn8dXqZMSH7QtWd/gLqulTg5mdp1W4
	Gt0LVkYS3VDlUhpr8698O9a6AP1d+9i1oDX/IjYeO0xyfLhdnm3RG66eFP6gwdZuCDUoJU+pTDW
	+yD4WnX1+W+D5GPizeEznycDNCYycrPVNwQ==
X-Received: by 2002:a17:90b:52d0:b0:387:d5bd:622f with SMTP id 98e67ed59e1d1-3931f971fa1mr1668343a91.18.1786611910969;
        Thu, 13 Aug 2026 02:05:10 -0700 (PDT)
X-Received: by 2002:a17:90b:52d0:b0:387:d5bd:622f with SMTP id 98e67ed59e1d1-3931f971fa1mr1668311a91.18.1786611910433;
        Thu, 13 Aug 2026 02:05:10 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931f44de1esm2177013a91.13.2026.08.13.02.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 02:05:09 -0700 (PDT)
Message-ID: <63bae39b-1256-4e19-a9de-840d8752ec69@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 14:35:01 +0530
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA2MiBTYWx0ZWRfXy9pYtNejeirL
 sMH7TBSOndFfnvThtNzyx0jW3NQEEZHDkdModhrtC/MVP37bRVd8lKWqCzxK2I7ch69LK9Wajib
 ndsXGNUW09IVHSgaw0OaYMieoEEyglI=
X-Proofpoint-GUID: 4r-Bp-jhlKeB05sX_4EauocUdbPFPzdV
X-Authority-Analysis: v=2.4 cv=D8R37PRj c=1 sm=1 tr=0 ts=6a7d88c7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=J4aCkolXD37Z9lCRw_gA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA2MiBTYWx0ZWRfX7rmiTE1evBl2
 SQX+sn9aDCfjMPVQsqafZhpDpUEMOk1zrgQjkt8uZby7i/tlXqGf8WsqKs98Pn2Zlksh8G9S70v
 ZE3qDMMPuMy6YE3dNqJEl6AD+EFMdbEAYo4jyP/HB58wDeWbgRDtS1Lz5L80MT1ouRxn7UBaIvD
 0ZboEtG+rNMey4XDqB75nIgsWOV03jXUyPgCyKgplKO/ztOxVtvAqo5e6SeLT9rWSK2eWcTssgd
 3vDi4PimMwanEuSToloT3aFGArUMQGNXNu1Ds/UUS4owCeA58OlgMSugMFcg/TOenw6NX4r7f0p
 w+yGbLoKNFLbVJwAEoONuMi20BaKxk2VzUdx7yAWM4EsvCTWVSn53mcpT1BdBXDv2ZE/5zphRqD
 mIKNqcQdKxNiSvHgMqEc0Guash0M3apne4bMY7SqfKH8DzKSw3gh3Gi5OzT0xaSQnYGAVGvfe3z
 dYD2/yuiEGuSOijOg3g==
X-Proofpoint-ORIG-GUID: 4r-Bp-jhlKeB05sX_4EauocUdbPFPzdV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130062


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

Based on what we confirmed with the Secure Systems team, this is a limitation
of the current Shikra platform rather than something that can be addressed
through a firmware-only update.

The A2 BAM used by BAM-DMUX is not connected to an SMMU/IOMMU domain on Shikra,
which means Stage-2 translation is not available for this path. As a result,
it is not possible to move this path behind an IOMMU.

Modern IPA-based platforms differ because their data paths are physically routed
through SMMU interfaces and therefore do not rely on VMID/xPU ownership assignment
for this type of access control. On Shikra, the A2 BAM path is protected using the
xPU3 VM-based access-control model, where DDR memory access is restricted and
granted through the request-based Hypervisor VM assignment framework. In contrast,
older targets relied on the earlier xPU2 resource-sharing model, in which modem
access did not require this type of explicit VM ownership configuration. This
architectural difference explains why the issue does not occur on those older platforms.

So, for this path on Shikra, SCM-driven VMID assignment remains the only practical solution.

Thanks,
Vishnu

