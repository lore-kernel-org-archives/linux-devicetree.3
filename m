Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794979715;
	b=YaK6ccanTf4UZlHC94lCgviPqUziG5+o1ROOkv5N7XtCdqVEIG2toHPUpKhoikJRQiOB
	 Uw7GQmGHdO9KcdqjeUmGvgt+C+wTgxXDeDpiqXX8xFLjlWzU1zFSJFvaxgo8YuP0mSp4K
	 s3F0SFkDgHDa+odqegBZ0pp/gbJnezqDKiP/tNY2ulC0vcD2qo73Luxyto/tOGOgehaYN
	 6rNHTnZZDhmlgeROpyJJHUVGJH/7BgbmFo4lokEw9Eup2g0epqMrW6uxk8qp/6MK4kqkz
	 eKZ7sRg+MeUhZs+VAYQtp2Laqi/LwOQsJdtDUMpdvPOdqe4804fp0y9uXpdEN+VoYqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794979715;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YIa0M2Oyej4uAAroLGdxpHBRs5qXTY+ypa7gdhJiHII=;
	b=PrwSE49rpLl8zqDEmoveyneZfwwhABoP+qmFA5hQCXkW2WRFbi1BbIf2QWc++dXfl251
	 TKSdY+vm4t1JDWlu+peTNhCi0RWuWExiBbsw4DLU8ngE5ZdE43Ukpvz5gRrq26DUE0rIE
	 +JuAMdv6Jq0LB5TGzW6HFsETMYo5Dg5dndzraPZkqh/blVGJWaFb0kgTbAzonMqErTet5
	 BLVMABDQ+WxG05WBXIwdbzssf5e9LdVKqK3ilhihrTehSaM3wfH0q7FE6WJJjSlzbeVdv
	 cCR7WsQYQLf88gbwxe25Lv6m45vhtP5e8dK1dAje8pCS6xFAlvfbk8qtidbv34PlYQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gGRIw76r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hWoA4kQ0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD44606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD44606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gGRIw76r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hWoA4kQ0
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Vv6n4059968
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YIa0M2Oyej4uAAroLGdxpHBRs5qXTY+ypa7gdhJiHII=; b=gGRIw76r8GlC3bZK
	XyduY/FfuPhSKykNGizJkLbHImMadxRHWXHelyBJJaT5PD5ggJiqqU4G/V2OTXoE
	bJGusW40I5Frq+RROAHWZ5No0H/CzuczgTUISrsKmuMjczhwB8IJvdvMUPrECWPC
	RtrSIHsxrPCEYVOeNSHYAOWOkY/VRqKoljtFeY6YAkKl1X5c1CvrVIK43rEr76AQ
	N2MNojWamaQF/9tSpPdFwlmHorrST8HDnLeq/DmbzsFfofls9c9nUH49Khp3v3qF
	SjD77RKZIyVnDQgpJ7fBmTXCbuX2xlDyKIf9O39tKNLcsBnJRaAdNjTtngN0bNP6
	u/cd7Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvchchn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:28:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a08903566dso1288059b3a.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794979712; x=1795584512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YIa0M2Oyej4uAAroLGdxpHBRs5qXTY+ypa7gdhJiHII=;
        b=hWoA4kQ0yFLRkQj4JQcMN3JtIS/9L/1kaKoItK3NykDRXDQo4AQlpRAxwLBbYih3ez
         xgKCQPQmJM/0BOOpsC8bKltR+JauafqfK+4XG4RNOanQ9dpnDeuTWzbfnn8ie4mOpeIU
         e+co6vJRlbBiVnE7959fonWTIBeAyhq7OnFwW25+ctKvD66Ok0okV9RUqjorf8bx9Vwu
         /yHFnIOvg8NYM90GhSh/O4ZOmHDwNLdqTvbxoSjtOxji2ASHqxDloLBUQBWyabMVRgaP
         VC1tMF6inQwDLYwOmXFKGjyF90rirQbFyt/kPUrcDgj64pmgH+f9nkAAiifKuT8ZtB8L
         EFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794979712; x=1795584512;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YIa0M2Oyej4uAAroLGdxpHBRs5qXTY+ypa7gdhJiHII=;
        b=x+ukKT7NT3oaSjAnHXnymUmltZkdIxJ8DbYyvvEyoHhjbYUwQ3mm88/UZpMgnacVlr
         FRJdmHf+xv/RtgG9wUMCr7AvM66yJ2gJr1v+q06fpaOyruFAkn7xuucZ5L+PZODi3AtG
         XY8LnHVDky+Z7pGVhqZ6hxxW/iMIEDG7sz5GpbG8TmhW1jhixwtSGc7+cpt73FQFZD4I
         mjl042cGZBTj0npQchZCFu5o7tfS14yYGg+LFAmvSScJzi5J4q5BhivnzrgQJ3o5/fwf
         tdpmB/IjXcJkkvXo46JEllSZxuVKZE7f4AizSafVBKpl8yjKZJmYvWbwC9roAhXw5nGT
         sD5A==
X-Forwarded-Encrypted: i=1; AL+hErGuQk2X29hmZ0a8FlrCFCFwQAtUrSkZvkUfVK5xraVzWcqVY5qeiKue0+gcowdvH9YUIg/hVaJXkYyk@vger.kernel.org
X-Gm-Message-State: APuU4Z+iaeYdd3kD9SKsBpHcn+uy8b31YvIEI16aHpa+AjFrVeodOnOH
	HrQMHuBRwoePl13lp9AAiVtuzec/PUPHB80krfSEyln1/Qxi2gie9gjvTsbHu1v/ccHKnNcDTZA
	T1Mo0UQfBcgAv1vAxZpJXG8IHGe1kRNYlEQAbqGIPcBdTgGOhSGRlva1waRgABRCx
X-Gm-Gg: AYBFou3KKNY4B3O+risuIAbscu6E8RnA1jegOPN03pZN+k2EkIPONl/NgKDd22eUgcw
	79d71byxmahxH0pxyzx64L2FNWkrO2jo9fLpdWIQdVH3XeGDCGHUQEt3zIp7k2niPgCg76AzVJr
	xwGxN3t1jTnUW6UPyUVlYTFuXrT4eene4hRKAWT5qzw9qPrEX8aRKpAJHkfKA0bF1Gh77XsmjUS
	53axK0NiwF7ktJFWbjqzHaIM1hVkKhdpJXUMCSL5mnGuVcnRtANtdSRgh4EqQu7l/mWwGFQUcZp
	Gd4FV/BX947jiqnoqQ9WD3QhYzuxWFKt3KHURN2UJJdje8oiogHNISpjyPaEi3IIgXY5LYBDtTX
	uLZK7qZ8QYDMP94JaWl+C+LtAgOMOlJ7DMbI/UHIA60K9IOGt+vhiszjmd9Fd38ulTb0sRfzO2V
	RmgtGJVH8=
X-Received: by 2002:a05:6a00:1ca7:b0:8a0:638c:6958 with SMTP id d2e1a72fcca58-8c457e2cbd5mr3205475b3a.40.1794979712310;
        Tue, 17 Nov 2026 21:28:32 -0800 (PST)
X-Received: by 2002:a05:6a00:1ca7:b0:8a0:638c:6958 with SMTP id d2e1a72fcca58-8c457e2cbd5mr3205456b3a.40.1794979711810;
        Tue, 17 Nov 2026 21:28:31 -0800 (PST)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm523817b3a.31.2026.11.17.21.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 21:28:31 -0800 (PST)
Message-ID: <94429261-7bbe-40d9-a8a8-3e85272d7fb7@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 10:58:24 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 1/2] dt-bindings: net: qcom,bam-dmux: Add
 memory-region and qcom,vmid properties
To: netdev-bot+sashiko@kernel.org
Cc: stephan@gerhold.net, andrew+netdev@lunn.ch, davem@davemloft.net,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, loic.poulain@oss.qualcomm.com,
        ryazanov.s.a@gmail.com, johannes@sipsolutions.net, edumazet@kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        deepak.singh@oss.qualcomm.com
References: <20261112-qcom-bam-dmux-vmid-ext-v6-1-7a16bd3dff18@oss.qualcomm.com>
 <179483727050.3136.1539014411037771065@kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <179483727050.3136.1539014411037771065@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd3781 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DnCp-jmL7daH_8vrcTgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: wCCqztxlgHfJWWw1yDpoacMloXf7_fyF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX2z5eq8pIIC30
 W7cCizCa7Yvcfgi9/VlB9X6UrwWhrmmsy6q64rSLRPU4n4sK0Ix7MVsz8N35qIyy8lfK1cDn+vo
 l0h90PtgTsRaCMkcpCm8qPj+fkoazPI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX+zOVD3YpVgJk
 wPzAIW/OIzIEZ/8zgMBYHAE9/vq1qFgveBm7Kqo+p3vb/wl5lEv/u5T5BhZVncUTEk0FNWpTQgD
 lqVxJrMvCwTIZo1BtXEjNgeBhTjBgM/LsRTdksBYoDr9excx9JqxsAOkL1so7XQOILENVS7sX4L
 zvG831cyBhGZpKuAi01VEuptpAcizlBCsC5DcmsxzDZQ7Fk3OCBmtDlqgWte/QpGKmZGGYyhiC0
 e4YAvUAFF8c3keczXtDar60zkTO6ujxT0T50SR89ZybaPOZoyMFFSWb+CU//4HDUXykDvXLsth3
 BXBQcrof6YNfFidOrMt0NVAiuKm2QxSAhcUZF0DHIDv4L3nkPGqSje51wk2wyWI8vQPOVOYGbFW
 0lHbHxW+GUCl9IZzg1T/T5dk4QYrdjwCs0Gng81GePIrvlYr2lnSfDwP1QG91b/z/PMWKvTZPZa
 GmN2puAHvwkZq5ZAV+A==
X-Proofpoint-ORIG-GUID: wCCqztxlgHfJWWw1yDpoacMloXf7_fyF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180021


On 16-11-2026 07:24 pm, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 · High: 1 · Medium: 0 · Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>
> - [High] The series confines only the BAM-DMUX client's own DMA mappings
>    to the restricted-dma-pool.
> - [Low] The patch adds the Shikra-specific compatible `qcom,shikra-bam-
>    dmux`, but the only placement the driver supports cannot pass schema…
>
> --
>
> dt-bindings: net: qcom,bam-dmux: Add memory-region and qcom,vmid properties
>
> This patch adds optional memory-region and qcom,vmid properties to the
> BAM-DMUX binding. With them, DMA mappings can be confined to a restricted
> DMA pool that is shared with the modem through SCM. It also adds the
> qcom,shikra-bam-dmux compatible, with qcom,bam-dmux as fallback, and
> requires both new properties for it.
>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>> index 33746c238513d..f7388d24c8612 100644
>> --- a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>> +++ b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>> @@ -22,7 +22,11 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,bam-dmux
>> +    oneOf:
>> +      - const: qcom,bam-dmux
>> +      - items:
>> +          - const: qcom,shikra-bam-dmux
>> +          - const: qcom,bam-dmux
> [Severity: Low]
> Will a Shikra DT that uses this compatible pass dtbs_check?
>
> The bam-dmux device is only created from a child of the PAS remoteproc
> node:
>
> drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_probe() {
>      ...
> 	node = of_get_compatible_child(pdev->dev.of_node, "qcom,bam-dmux");
> 	pas->bam_dmux = of_platform_device_create(node, NULL, &pdev->dev);
>      ...
> }
>
> So on Shikra the node has to sit under the qcom,shikra-mpss-pas node.
>
> Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml does not
> define a bam-dmux child and ends with unevaluatedProperties: false. The
> qcom,pas-common.yaml schema it references does not define one either.
>
> Should the series also update the Shikra PAS binding to allow the
> bam-dmux child node?

This is handled separately:
https://lore.kernel.org/all/20260908-shikra-pas-bam-dmux-binding-v4-1-6044889e7e3d@oss.qualcomm.com/

>
> [ ... ]
>
>> @@ -72,6 +76,22 @@ properties:
>>         - const: tx
>>         - const: rx
>>   
>> +  memory-region:
>> +    maxItems: 1
>> +    description:
>> +      Phandle to a reserved-memory node compatible with restricted-dma-pool.
>> +      The BAM-DMUX device uses the pool for DMA mappings.
>> +
>> +  qcom,vmid:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    maxItems: 1
>> +    items:
>> +      minimum: 1
>> +      maximum: 63
>> +    description:
>> +      VMID of the remote execution environment that is granted access to the
>> +      restricted DMA pool through SCM.
>> +
> [Severity: High]
> Does this also cover the BAM descriptor FIFOs, or only the bam-dmux
> buffers?
>
> Only the bam-dmux node gets the restricted pool. qcom_bam_dmux.c maps the
> skb buffers with dmux->dev, so only the payload buffers go through the
> pool. The descriptor FIFO is allocated on the BAM DMA controller device
> instead:
>
> drivers/dma/qcom/bam_dma.c:bam_alloc_chan() {
>      ...
> 	bchan->fifo_virt = dma_alloc_wc(bdev->dev, BAM_DESC_FIFO_SIZE,
> 					&bchan->fifo_phys, GFP_KERNEL);
>      ...
> }
>
> That address is then programmed into the hardware:
>
> drivers/dma/qcom/bam_dma.c:bam_chan_init_hw() {
>      ...
> 	writel_relaxed(ALIGN(bchan->fifo_phys, sizeof(struct bam_desc_hw)),
> 			bam_addr(bdev, bchan->id, BAM_P_DESC_FIFO_ADDR));
>      ...
> }
>
> The follow-up commit "net: wwan: qcom_bam_dmux: Assign restricted DMA pool
> to remote processor" says "BAM-DMUX DMA mappings and BAM descriptor FIFOs
> must therefore be constrained to a designated memory region", and that
> accesses outside the region can trigger an XPU violation. It relies on
> "When the BAM DMA controller references the same pool, its descriptor
> FIFOs are covered by the assignment as well."
>
> However, Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml does not
> define memory-region and has additionalProperties: false. The
> dma-controller.yaml and dma-common.yaml schemas it references do not
> define it either.
>
> With a schema-valid Shikra DT, wouldn't bam_alloc_chan() allocate the
> FIFO from ordinary memory outside the SCM-assigned region? The BAM
> descriptor fetches would then land outside the shared region.
>
> Should the series also extend qcom,bam-dma.yaml to accept memory-region?
> It may also need to check how iommus interacts with
> of_dma_set_restricted_buffer(). Failing that, could one of the bindings
> document where the descriptor FIFO has to live?

This is covered by a separate binding change for the BAM DMA controller,
which goes through the dmaengine tree:
https://lore.kernel.org/all/20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com/

Thanks,
Vishnu

>
>
>
