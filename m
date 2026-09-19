Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6B43B14A7
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789811688; cv=none; b=fE3bioxakdrT4JvfMNlmMva/GC8PZIzCXTnb6umPfvTEMToLOTfyzVjRFIe404IRU7vH8PMxta/4SEw8tElRXhvaOnlnqjdO59bxZ9VcayHivbWGSfuHU/uiJ0BAALl3VfVKouumxqE/8i+SNdh8puxP3kLJcLsnQzx9MMOMFMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789811688; c=relaxed/simple;
	bh=z/qQL0CPK3fkdmYWyHcS9nuOhJqJmsrxtpGJPsiPrxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EEafDFAJ1puI6m/NG9MAvaeIfezAanC42et0PkzNoLUjfMAIPevvNs3Hpq2HWLpT2EHcRWJOOuOnnkGdSqWuCO5m5xRLI5UoaOjrD7odnuI8nIqM330Y3nJw79BSJIK7PffivEJmQZCbSM1+Mi1E5Q5SkZV6+Ut2Zx9APAxtHjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kHHgbV8X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U5IUZO7f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kHHgbV8X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U5IUZO7f"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68J6e2Nq3431996
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 09:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	53ePU/EqYBKQnQJgkF/MFGCIZg32zoI4VYtyTC3M5fU=; b=kHHgbV8XW4BLQhwR
	zhwf8R2pzBNi0nMPRSWluKnWhOR5SaFGHIaE3NhNxRofWIsnIcqj/efXEKyUwlZu
	9fGHhf/1rih7ZrN4SjHVVntrX+tnDM/FLVorSEDFA05otRPX0kRz5G4GB/n++5W5
	G2liyMqDBG5BPG1aiOQyrOYi/cjlYmDnXwpfP/RjGVHtBi0HncuwWTLYTgsS9SGJ
	XhgxwqRp33OfjqFQ/CTb8Ua+vokjppBzyZtDJL0IC346edBPHiPhTEXGCwIoaSmB
	wkPzOlpqnTGhNMWINX4pH8yuYT6W1PJCV8p+3aOmpDw3gs7yhqbfE8TAYD1EYyOM
	Oei6Yg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshd60s0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 09:54:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so1903046a12.3
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 02:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789811676; x=1790416476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=53ePU/EqYBKQnQJgkF/MFGCIZg32zoI4VYtyTC3M5fU=;
        b=U5IUZO7fTE1AxCC9rKBOG3furOaEcWddXHITeFe2ayPr9JANW4qEuoOoGy6vQP0Ncs
         4bQIj5QPDgYymUpsUF8xbRuc7GYh2FzLqxady7iMQcHXQg0836fptsZPyb7Y4PDf0FTW
         rp/7m3bvf/6D+oqMk0GCvGSTIlg0pPjlUBUeQ/sTE8cDxB6n3wme1PTa9uA1GhVItJCP
         niuoklfLi59IJPa9rbZEK0SLK5F/nxupw4NKW5+lyeB6WBMcxUaCxCGg/9k72P27z5yN
         jlG/dXaY558UJFKyXtG01iOBUUQLNQymUtLa0I1gK9lBTM5ULf/ZCA271UqM83pvOBp/
         sHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789811676; x=1790416476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=53ePU/EqYBKQnQJgkF/MFGCIZg32zoI4VYtyTC3M5fU=;
        b=ttZ/r6VlZNKPbI65XBm2LI1ftv3piljHdVumBaFmIX0qFvr524PtNlhrT2kKUlernU
         ElxmwYVGhgq/OK18zrKib5eh6owa0NHpVP6jVMpIzh1FNTyWOJtEQZO7crX0bGrNSual
         DuaipnJm9aZnzqH+oA83dJonobUN/9uuGG1CSDRlPuzDQ1/Lr2ioGeHwcHurizhJPHNd
         1a+G4c73ev3uJxMYSkLrRNV/Zt3/dEiIciNms+3efHUEJOsejlMLFqSg24mVGECSvOoL
         ygCVNY5awaSeXbBhO/onXxVEFYaGwN8rps2ttekGOTc99qSulCpP35f5tkm1lXQRin64
         u9wA==
X-Forwarded-Encrypted: i=1; AKwUvBy1s5Hxe2wUq9iprbTNn0InLil7fouqo8SwzQP6+tHQZW1YhUQtK+bX4YLh4ixibe6YTrARIcYcNq4h@vger.kernel.org
X-Gm-Message-State: AFuF++nvanoXSI6eYz1N0A1tEGjvzhhcPOydzZamZvjTT77C/wYungnA
	Ij8KONiGp6I9pAxNaILBgj8XTnAB2W2a9l76elqV+jkj+1ZgfND9Ehg8COWyCU8A/0zdnUtCEAB
	OUmdlHEV3mFVzl692nCumTOCSo6RHnqOEg0W5G0kkXDoj9LLOUdjdfRVpIf3KMIUT0o0m82vz
X-Gm-Gg: AYBFou2pBGYmacshzvC9g+araIWJyTtkfRzypOuK8vEAGXkJpnwXBL5h+MqHmHCyEWV
	gBCsaGwCu2r8GNbBAEFVluZwZeEEAM+ljHBJnE2xjHWzVVQUcseUsTBFt1ckmh8BZdVSR+v0jU8
	tDKlLeWOVsJPAJttYP3JuWneZgZ3sYbEJbWmcDHcbKnozqxFoP/sExcDUvffGjy3n8Id65PnKEs
	/caot/otthd9dqPjOx27OvN/v7bUtB7oxcNn47dTdnnKX/GmyE4sTbTDUMmtlajcwNoKCZlVjTd
	2a/+rKdM4RU0Cl/raUEECR5VpHGV0foj7/2migU7TRubWWVievEKDLX3ufnYdD9XRebTrRfjL9d
	gosrdLnJMzRnNNnOctZ1iJf16x7/rqfQx0JIN
X-Received: by 2002:a17:90a:bd6:b0:39e:6a81:5a97 with SMTP id 98e67ed59e1d1-39e6a815e70mr2667641a91.43.1789811675942;
        Sat, 19 Sep 2026 02:54:35 -0700 (PDT)
X-Received: by 2002:a17:90a:bd6:b0:39e:6a81:5a97 with SMTP id 98e67ed59e1d1-39e6a815e70mr2667631a91.43.1789811675424;
        Sat, 19 Sep 2026 02:54:35 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.146.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55d45a6sm4526951c88.9.2026.09.19.02.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 02:54:34 -0700 (PDT)
Message-ID: <697a7c7b-5bf7-4279-898d-a8310f5a0a64@oss.qualcomm.com>
Date: Sat, 19 Sep 2026 15:24:26 +0530
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
 <63bae39b-1256-4e19-a9de-840d8752ec69@oss.qualcomm.com>
 <an27PVxkCpD09xSR@linaro.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <an27PVxkCpD09xSR@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDE0MSBTYWx0ZWRfXwHXWaMuTDk2D
 7KXRn7kaky74xYcG8dyl/1oBfyp7LLLkYzgltYtjKCOIFEwLARIm57W3vvIPQUehIVqkYM+iaVe
 2H6lQxKRbuJ9DxUg5xc3zKPpT0Gldmluf6vZftXB3w19YHuIZlQDNRrKdfvbwSSF8yB+iJ/SrVZ
 YegDeSgFppV2KkAA+b9V80yF8/n1RmglJwyhpHFm1fKY0tz1m2oglTaq0HeAb59M9ya8UlJkfhk
 IHd2u/kxVPDC0jta+LKwnvTfkzR+NtqcErcFRi3iYZ8hR6ebRguNRNS+JKUSnfciQ5bvdPIbrb4
 pbxlRy7aGQgYtolT4rhTCZnGYg+HasIfzdPjHSvtLDNQyUSXrJ5L9hQP2kyYXIIivs3JtR7LYs6
 j8k1mAS1+QfKMaDHn5E5PXvF9nCLFhYazIrE5wlLClJACrUYgBbyzgqd1JnSNjlx/BTDlnPyRkb
 ZfdX13p5zOO49etUgYQ==
X-Authority-Analysis: v=2.4 cv=RMQmjIi+ c=1 sm=1 tr=0 ts=6aae5bdd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=K/78aEDNEn2Q/Yuv7mVN5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=07d9gI8wAAAA:8 a=EUspDBNiAAAA:8 a=vzY3hVqx5U8Bfi6rXLEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=e2CUPOnPG4QKp8I52DXD:22
X-Proofpoint-ORIG-GUID: K7_y9PeT2ERqGc4dMtrnLD9um3YzKjC1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDE0MSBTYWx0ZWRfX6XH5bhFgerlc
 nUmDk9MQvciiYMBTrlo2dy76zkTIzhEueNB7/e4/w6YmZkcqAALt2i4GotgkY280jggq1+nsD6C
 E2WvXEwZY+A7iBttOFynVTj983RjdwE=
X-Proofpoint-GUID: K7_y9PeT2ERqGc4dMtrnLD9um3YzKjC1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190141


On 13-08-2026 06:10 pm, Stephan Gerhold wrote:
> On Thu, Aug 13, 2026 at 02:35:01PM +0530, Vishnu Santhosh wrote:
>> On 24-07-2026 03:04 pm, Stephan Gerhold wrote:
>>> On Fri, Jul 24, 2026 at 10:16:31AM +0530, Vishnu Santhosh wrote:
>>>> On 14-07-2026 01:05 pm, Stephan Gerhold wrote:
>>>>> On Tue, Jul 14, 2026 at 11:02:32AM +0530, Vishnu Santhosh wrote:
>>>>>> On Qualcomm SoCs where the modem (e.g. the mDSP on Shikra, VMID 43 /
>>>>>> NAV) is the AXI master for BAM-DMUX RX transfers and the XPU enforces
>>>>>> per-region access control, each individually DMA-mapped RX buffer
>>>>>> requires its own XPU resource group (RG). With ~16 RGs available, the
>>>>>> 32 per-buffer dma_map_single() calls exhaust the table and the first
>>>>>> inbound transfer faults with an XPU violation.
>>>>>>
>>>>>> BAM-DMUX is a singleton (exactly one instance per SoC), so the
>>>>>> destination VMID does not need to be a DT property; it is looked up
>>>>>> from the compatible string's match data instead. Add struct
>>>>>> bam_dmux_data with a single vmid field, and a shikra_data instance
>>>>>> hardcoding QCOM_SCM_VMID_NAV for qcom,shikra-bam-dmux.
>>>>>>
>>>>>> When match data is present, allocate all BAM_DMUX_NUM_SKB RX buffers as
>>>>>> a single contiguous dma_alloc_coherent() block and SCM-assign that
>>>>>> block to HLOS plus the VMID once at probe. This reduces RG consumption
>>>>>> from 32 to 1. The block is never reclaimed across a modem power cycle
>>>>>> (bam_dmux_power_off() does not touch it), so the probe-time assignment
>>>>>> covers every subsequent restart without re-assigning or reclaiming. It
>>>>>> is reclaimed to HLOS only once, at remove or on a probe error, and if
>>>>>> that reclaim fails it is leaked rather than returned to the page
>>>>>> allocator.
>>>>>>
>>>>>> Each rx_skbs[] slot is pre-assigned its virtual and DMA address from
>>>>>> the block, so no per-buffer mapping is needed at power-on. Because the
>>>>>> coherent block is not page-backed, received payload is copied into a
>>>>>> regular netdev skb before handoff to the network stack; this is an
>>>>>> unavoidable extra copy on the XPU-enforced RX path.
>>>>>>
>>>>>> Platforms without match data are unaffected: rx_virt stays NULL, no
>>>>>> coherent memory is allocated, and the per-buffer dma_map_single() path
>>>>>> is unchanged.
>>>>>>
>>>>>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>>>>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>>>>>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>>>> So how do you handle TX buffers? Right now, they are just passed on from
>>>>> the net subsystem. There can be up to 32 TX buffers in progress as well.
>>>>>
>>>>> Overall, I have mixed feelings about this patch. It looks reasonably
>>>>> simple, but fundamentally I don't understand why we need to go back to
>>>>> the old days of implementing protection using a highly limited MPU (in
>>>>> your case: the xPU).
>>>>>
>>>>> Why does the setup of BAM-DMUX differ e.g. from the setup for the crypto
>>>>> engine? Crypto is also using bam-dma, but it avoids this inflexibility
>>>>> by making use of the &apps_smmu. Is BAM-DMUX not covered by the SMMU? Or
>>>>> did you just decide to bypass the SMMU in this case? (If so: Why?)
>>>> I checked with secure systems team on this. Crypto BAM is
>>>> behind apps_smmu, so protection is enforced through the SMMU's Stage-2
>>>> page tables.
>>>>
>>>> A2 BAM (used by BAM-DMUX) is present in secure domain and does not
>>>> support Stage-2 translation on this SoC, and there is no IOMMU domain
>>>> that can be attached to it. The only protection mechanism available is
>>>> the xPU.
>>>>
>>> Thanks for investigating this!
>>>
>>> So is this a hardware limitation or something you could change with a
>>> firmware update? Could you move the A2 BAM out of the secure domain and
>>> protect it via the IOMMU instead of the xPU mechanism? The other modern
>>> platforms with IPA do not have this limitation, they can use the IOMMU
>>> for this.
>>>
>>> We can try to support the xPU protection mechanism in the BAM-DMUX
>>> driver, but it's pretty bad from a performance and memory usage point of
>>> view if you need to copy buffers around multiple times. So if you have
>>> some way to change this in the firmware (and there is still time to do
>>> so before production boards ship), I would strongly recommend to
>>> investigate that.
>>>
>> Based on what we confirmed with the Secure Systems team, this is a limitation
>> of the current Shikra platform rather than something that can be addressed
>> through a firmware-only update.
>>
>> The A2 BAM used by BAM-DMUX is not connected to an SMMU/IOMMU domain on Shikra,
>> which means Stage-2 translation is not available for this path. As a result,
>> it is not possible to move this path behind an IOMMU.
>>
>> Modern IPA-based platforms differ because their data paths are physically routed
>> through SMMU interfaces and therefore do not rely on VMID/xPU ownership assignment
>> for this type of access control. On Shikra, the A2 BAM path is protected using the
>> xPU3 VM-based access-control model, where DDR memory access is restricted and
>> granted through the request-based Hypervisor VM assignment framework. In contrast,
>> older targets relied on the earlier xPU2 resource-sharing model, in which modem
>> access did not require this type of explicit VM ownership configuration. This
>> architectural difference explains why the issue does not occur on those older platforms.
>>
>> So, for this path on Shikra, SCM-driven VMID assignment remains the only practical solution.
>>
> Ok, thanks for looking into this further.
>
> Can you please try the following as alternative for the implementation?
>
> 1. Make sure that you have CONFIG_DMA_RESTRICTED_POOL=y.
> 2. Define a restricted DMA pool for BAM-DMUX, e.g.:
>
> &{/reserved-memory} {
>          bam_dmux_pool: restricted-dma-pool {
> 	    compatible = "restricted-dma-pool";
>              size = <0x40000>;	/* 32*2K*2 = 128K minimum, but 256K might be safer */
> 	    alignment = <...>;	/* Check xPU alignment requirements */
>          };
> };
>
> 3. Assign to BAM-DMUX together with the qcom,vmid:
>
> &bam_dmux {
> 	memory-region = <&bam_dmux_pool>;
> 	qcom,vmid = <QCOM_SCM_VMID_NAV>;
> };
>
> 4. Extend qcom_bam_dmux.c to look up the DMA pool address and make it
>     accessible using SCM: Call of_reserved_mem_lookup() to get the
>     region, then invoke qcom_scm_assign_mem() with that.
>
> 5. Keep RX/TX DMA code paths in qcom_bam_dmux.c unchanged.
>
> 6. When testing, make sure the kernel log contains
>     "Reserved memory: created restricted DMA pool at %pa, size %ld MiB"
>
> 7. Add memory-region and qcom,vmid as optional in dt-bindings.
>     Add dependency: if qcom,vmid is specified, memory-region must be
>     specified.
>
> In a quick test (without the VMID stuff) this worked quite well for me,
> SWIOTLB should handle the copying behind the scenes without further
> changes to the qcom_bam_dmux driver.
>
> I would prefer that over complicating the driver with two separate ways
> of buffer management. AFAICT, the restricted DMA feature is meant for
> this kind of setup where there is no IOMMU but the firmware can still
> restrict memory accesses to a limited amount of regions, see
> https://lwn.net/Articles/841916/ for a short introduction.
>
> Thanks,
> Stephan

Thanks for the detailed steps. I tested this approach on the Qualcomm Shikra
platform, and it works as expected.

With CONFIG_DMA_RESTRICTED_POOL enabled, following the approach, the kernel reports:

software IO TLB: Reserved memory: created restricted DMA pool at 0x00000000fffc0000, size 0 MiB
OF: reserved mem: initialized node restricted-dma-pool, compatible id restricted-dma-pool
OF: reserved mem: 0x00000000fffc0000..0x00000000ffffffff (256 KiB) map non-reusable restricted-dma-pool


The BAM DMA controller also reports:

bam-dma-engine 6044000.dma-controller: assigned reserved memory node restricted-dma-pool

The BAM-DMUX TX/RX DMA paths are working with this configuration. I will update
v2 to use the restricted DMA pool approach as suggested.


Thanks,
Vishnu

