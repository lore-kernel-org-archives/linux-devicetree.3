Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32953CB911
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869538; cv=none; b=YVWLRxRxfL8Sp5/d+lZgp0hDAZbEdVw6oCL7SWPgGv07gElt/o50H2vQqZ64qdb+iQTMwU0Au/9OucVJdwRNF6c19pSzAXWwINhOY82rre+ZAyEums8+g6eWIsJFQ1pZgWXffln2DlQHXD5AG/V5dQ/PaicCFiSk4vj0wEvsEnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869538; c=relaxed/simple;
	bh=ek0mHY+jX6/KNnk4EXp5aEITYu1sH8LI6WIoOTR4bGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+CTAkoXgU6rzMJwe7oPTScob+SzqyC0zIUolmMniZYh20tn2MqRWmW4Ib85JgdW2Qp55oqM9t0RQfnYjCyR26ykmzxhA/GL27TPuAuUW1OMp8tfNwtL1RTrLMi+Mq4wFs4ciJl0oyq4qPl9sIiHg3bUFE8URrDjOYxgGDKvD+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIuUXEpE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ve6AF9j7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIuUXEpE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ve6AF9j7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Dju9d1304144
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 15:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xOg8ridGO382LkGdPMnhwPfNlAgSjjSsZkKVWWJT/h0=; b=SIuUXEpEkR1C86eA
	1cZZRd7Hqi1yYbwiFZdH1C7UJk7mHUxNrDc6SX0qGqXxF21ZzJqIcoUmBDQvkBgF
	qarAldHF8hGnW/Q9PAVRCTB8gUsfiF1bJlJubbNI/lK43nTK5/YVvSdLmYOh4eKO
	VMtAQRilQ34KrZn6V2osg5kFj1KGrZnjFNhHxY2bOLglp8XP4OUaQCnWVW6xYJXk
	IrMf7pmyPw8ei37q0ECW5QeB0s1P9uCvD+LIDyfL57nA0M24K54AEj8yjvN1mvEb
	COIBFsL8LRMvjPgHVPvYV/cJ6Ja3djjWbTCFFoEUKQYWPX7pIn3QcWqrbku+SEVu
	yshUWA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5cv68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 15:45:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc72777faa2so4019531a12.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790869534; x=1791474334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOg8ridGO382LkGdPMnhwPfNlAgSjjSsZkKVWWJT/h0=;
        b=Ve6AF9j70qMrFI2S5dOKE/dmMGmM+x46hWp266sdcCTNiXmplWFx8ck1S/aR2obf+f
         ZFnlW+6jc/aK8Jo5LrBMr2SoWEEk9386E0f+pv9z3GPRNAYTMxtTCiXvCccgGT2dYgKv
         txThyW5OFj2WlP9dsKldlanfNS6XnE6Pa/yZS1nZXh9kGqenu7gN4PIO4phLlF6lc6YF
         C6dp5FpuGG9VKaSJVRC2wRdjY2uL+lRzpaqp6hNIYZliybWmGpjSn1VuXjcEBmL8NGV2
         083Rj0w39gUVTkc745I9fIhpbAvJYtfAExXqsKMKb0sgPSlqVAx+2tmaRDn3BKe5CEhC
         fMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869534; x=1791474334;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xOg8ridGO382LkGdPMnhwPfNlAgSjjSsZkKVWWJT/h0=;
        b=X0LGAPObSTDPYcuVb39J/k21GpdyZcQELLCRohVfLgXUD3MGhIYpyRcA+usNaPFrMf
         iZEMLBvQDfTfBwZ+viUNxvbJphtVypIP6mZSCv67Bj1m3NDlXqTPjBqIRRl9Ql87170C
         vepeJgHqZgWeCXGuwcboiNralTfBvEaoI+dLOi3VHPdjUDePlQUABUSHUCGism/YnQyZ
         WVKYdVovUsXDU+pYrit1nt3ibtAFWcUjm+2cZeEQWW9Ud5R4xTBJwxNXI19PZFESqP4V
         kwMUAQxMnK37XgqLXwSv0aiLdtvQ4q51MZwixFIQ+jT6OptnN9XrT3lA/HIhmjC5AP1v
         XZ2g==
X-Forwarded-Encrypted: i=1; AKwUvByfryFZer0CsFJDj7iBWIAPEPAUFExuyrA6GQPIvKg5nqqtvSby/qnJS+QzeYl1AAUsk53vYvi0zEQt@vger.kernel.org
X-Gm-Message-State: AFuF++l5ETgw877mfzNFf5cq8FJ9bC3T+Togdwc5hX6+BDhJX2a4iy/1
	xnUBtAvm0Em3wSd3sDr15DuZOgSzfHSRamM/pSlkj3uq8YBVSKdZlOjnzKKoyY87KvS5zDL/RkZ
	F7xUPZ5/eJjfCI283okJ8tMuaQYwlv/jz84cQOn7r8LggN+eI55Zal0/yMbvwCcjq
X-Gm-Gg: AYBFou1HJUEs23XThR8kXCoOuE8nhP9HDCywtZFlIxRFG8luBAJHWTPDpr6L1VsitS6
	4GmaAJkSPI8CV+mdDBJY2KWW5A0cUxSIoAA+LyLCWYRnqDWoDizqD08Jj5o8p9QSjXIVslPFLlz
	ux1w8GBOZsLOCGkCMySxTy+aWDT6KBKUQzTRmtZ9zcBPBmPqvyNkO9CTtbG9YIFSUFU2VpkFgp4
	gFee9UFIuq/t7BKpH3dJ9k2JQEZl5YZVNBjRtAX+wdQMofP4GjwdeN80/OFXXFf2MbpOKr9qiXk
	Kk0TYDHWbyHlc41Dq9ChN0/Ps0MmYNUimIVJrCO50Qyj/xpnFESnaf9XALmVc9f+yAfC1FQ7ATq
	5UlrRYHK647a9NngCRrntDvGnSwm2rT1ZfXK+
X-Received: by 2002:a05:6a20:1603:b0:3de:5abb:ac8e with SMTP id adf61e73a8af0-3de9e89a4abmr5562003637.69.1790869533368;
        Thu, 01 Oct 2026 08:45:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:1603:b0:3de:5abb:ac8e with SMTP id adf61e73a8af0-3de9e89a4abmr5561981637.69.1790869532822;
        Thu, 01 Oct 2026 08:45:32 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.146.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-888193d7cb8sm1305786b3a.37.2026.10.01.08.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 08:45:32 -0700 (PDT)
Message-ID: <4cd28b2d-421b-4665-9985-3612a6f2c99a@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 21:15:29 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra: Add BAM-DMUX support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260920-qcom-shikra-dts-bam-dmux-v3-1-91474d507d61@oss.qualcomm.com>
 <20260920034535.9EC581F000FF@smtp.kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20260920034535.9EC581F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MiBTYWx0ZWRfX2HUdpT6zX9j6
 nVi0a8CHLN5E52qwOKHvWGxUMz9NuOovwfedAXOYD22ke3daWtwb7Gf+iMGF/Xqh6LpwrYHeAXT
 qONrm/3xPiqWKRCS6ugoQ8FgW5MyF0bOyEo8z+aV5G4XobrQyZKzYH6C3nthou4X/glzpcAbKsO
 +DK/C2BStmXs2lQXaUve/vPZeonyOqtYgJaNUH3aUhrhNCXNT+9AwrZC318E/PuIkHEwI8Zq6ng
 r8vDvNGf6fSIgbJOA83DdELMxIvUx+iTXat90wym2UnICWGtfJFYYjS0BkUMcFV7jhB0pJiLr+6
 ZK1hLczlNw+vs891N9O9dfN7yybOj127XSn9URvAYIHxpah/woiIQ8VMGynP51cZvNA8QwhZJ2i
 1EZF4L2tmCHLXa8gF4iwFtLHXhUuRoFbUdVtHNyMr9jI41zYr5ev5UC5en+laiDqLeaVtGv4GdW
 hZFRKv9fJe+cdyNT/4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MiBTYWx0ZWRfXwrmUULTze0I3
 QBji5mTwn52We/Yg3SNrpxSk/87YSicl13vH/+jRGc617er6eT9xb/PEYok9pL1sik0B8jLx6/W
 L+ieJgFKjkA7gHQEAIURIc8XEcQAp94=
X-Proofpoint-ORIG-GUID: ami-OVPCLL0Dbw--h-a3qRbWNwGiK2ED
X-Proofpoint-GUID: ami-OVPCLL0Dbw--h-a3qRbWNwGiK2ED
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abe801e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=K/78aEDNEn2Q/Yuv7mVN5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HFV7P2PMItf7egDhFlcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010062


On 20-09-2026 09:15 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] dts: qcom: bam_dmux_pool shares BAM DMA descriptors with untrusted modem
> - [High] dts: qcom: bam_dmux driver ignores qcom,vmid, leading to SMMU/XPU faults
> --
>
> commit 29cefe6f8087e49778891d714bb8fb329002f944
> Author: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>
> arm64: dts: qcom: shikra: Add BAM-DMUX support
>
> Add the SMSM state entries, BAM-DMUX node, and BAM DMA controller needed
> to provide modem data channels on Shikra. Reserve a 256 KiB restricted
> DMA pool and reference it from both the BAM-DMUX and BAM DMA nodes.
>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index 92d22e3b6931c..4980c125b7e1a 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -352,6 +353,13 @@ reserved_memory: reserved-memory {
>>   		#size-cells = <2>;
>>   		ranges;
>>   
>> +		bam_dmux_pool: restricted-dma-pool {
>> +			compatible = "restricted-dma-pool";
>> +			size = <0x0 0x40000>;
>> +			alignment = <0x0 0x40000>;
>> +			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
>> +		};
>> +
> [ ... ]
>
>> @@ -1866,6 +1891,20 @@ glink-edge {
>>   				qcom,remote-pid = <1>;
>>   				label = "mpss";
>>   			};
>> +
>> +			bam_dmux: bam-dmux {
>> +				compatible = "qcom,bam-dmux";
>> +				interrupt-parent = <&modem_smsm>;
>> +				interrupts = <1 IRQ_TYPE_EDGE_BOTH>,
>> +					     <11 IRQ_TYPE_EDGE_BOTH>;
>> +				interrupt-names = "pc", "pc-ack";
>> +				qcom,smem-states = <&apps_smsm 1>, <&apps_smsm 11>;
>> +				qcom,smem-state-names = "pc", "pc-ack";
>> +				dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
>> +				dma-names = "tx", "rx";
>> +				memory-region = <&bam_dmux_pool>;
>> +				qcom,vmid = <QCOM_SCM_VMID_NAV>;
> [Severity: High]
> Does the BAM-DMUX driver actually parse and use this property?
>
> The host BAM-DMUX driver (drivers/net/wwan/qcom_bam_dmux.c) does not appear to
> parse qcom,vmid or invoke the necessary Qualcomm SCM calls to configure the
> hardware memory protection.
>
> Will this cause SMMU or XPU memory protection faults when the modem attempts
> to read or write its buffers, since the driver fails to grant the modem the
> necessary access to the DMA pool?

The driver support is added by the prerequisite series and is in review:

https://lore.kernel.org/all/20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com/

>
>> +			};
>>   		};
> [ ... ]
>
>> @@ -2026,6 +2065,18 @@ dispcc: clock-controller@5f00000 {
>>   			#power-domain-cells = <1>;
>>   		};
>>   
>> +		bam_dmux_dma: dma-controller@6044000 {
>> +			compatible = "qcom,bam-v1.7.0";
>> +			reg = <0x0 0x06044000 0x0 0x19000>;
>> +			interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING 0>;
>> +			#dma-cells = <1>;
>> +			qcom,ee = <0>;
>> +			num-channels = <6>;
>> +			qcom,num-ees = <1>;
>> +			qcom,powered-remotely;
>> +			memory-region = <&bam_dmux_pool>;
> [Severity: Critical]
> Is it safe to share bam_dmux_pool between the modem and the BAM DMA
> descriptors?
>
> The commit message notes that this shared pool provides space for the BAM
> descriptor FIFOs. By linking this pool to the bam_dmux node above, the design
> aims to grant the untrusted modem access to the entire pool.
>
> Because the bam_dmux_dma controller uses physical addresses, if the modem
> overwrites the address field of a DMA descriptor within this shared pool, will
> the BAM DMA controller blindly execute DMA operations on the forged address?
>
> Could this allow a compromised modem to read or write arbitrary host memory?

No. On Shikra, A2 BAM memory accesses are checked by the xPU against the
permissions of the remote VMID, which is only granted access to the
restricted pool. A forged descriptor address outside the pool results in
an xPU violation. This is the same fault that occurs today when the
descriptor FIFOs or buffers are placed outside the pool.

Thanks,
Vishnu

>
>> +		};
