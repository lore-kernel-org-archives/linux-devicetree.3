Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B781F938
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 00:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790985997; cv=none; b=KEWHnSnf5pq4UEKCVdpaezntDT39IOM6VGSN30IY+4TxIQ0O2ildrqxFu3xqdvM3gYkK4o4wGyjxajT7+Db5owKyFtfZmVQmxe7zH/UOjiokZkuNW+XPOn++IgxuxuYqv0LbjpMNGeN7q5dW4tsanM95Aatc9LFMyuNYqYyXdaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790985997; c=relaxed/simple;
	bh=jSjSvKzp7smyu3936/0pSG7c5grOpl/+0ErBJ5VecLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O6FRCOW0053LrrerK7qf+hrD9Nx0MOV3+3OW6vDfOp8p14fOWwfZpP647HM3LmFaXjzT1p1Siv86vqzsVQhjOWZxsX8hRBmMTgTmAoGGs3TWQ9dNn65kHb8dJUVBE6XKRzE0jNzgo79jx4bAojj0RiTiyokt/ncOA9cwDGqUwOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JiVcq1q2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MUC0s4Fa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JiVcq1q2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MUC0s4Fa"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeMCu2928379
	for <devicetree@vger.kernel.org>; Sat, 3 Oct 2026 00:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HMrvdFYQCazM8G9VA/H64aEP6ONlH/25N/jX/1bcgzA=; b=JiVcq1q2j80ybQqO
	8vqBrt6cFvVdmZDd7W14JUAMxNKy2OzSpPU37W8rs5gpunfWzuKko/WYPTzrR0lT
	EvqdvVxPBE0iRqMx5p4EEhSPxQAd47z5kSyHZfj1pTGPRawAkVNdPhWEYbuP/Ag3
	W7YlA9/z9DXK7NYNucFojZGKUzrj6cUqc+asQJwHeugAKm5UY/Nx4UwhOHiWAEOc
	6lrXXTh8O/JXM87ZoFFC7TD9bXBXUJc7qFxD7b76ZHfbcLRTLnDDrNlFP+Tw0mhu
	OrJ/lZR7YQ5Gt2T+SuAzSUJhzaUDoyYIhsHAx72Ecab35JxBWVEx+nnL0mH6NBp5
	F/uSQQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20nfvt8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 00:06:34 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14383177746so420311c88.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 17:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790985993; x=1791590793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HMrvdFYQCazM8G9VA/H64aEP6ONlH/25N/jX/1bcgzA=;
        b=MUC0s4FaTEMFnQd1To8mjlMdWkaDsiszBQKpDMkTPcdTVvcDPrAipDtoa72rAB/d3X
         rz2LC/NAPoHH37GQYBxN0/6I3gsNbWsuaY2O+Amw5gnmzuDm5GnfoFm8FUIC/UvU1leu
         nwfHIaEQTW4QVYqneLKEL0blje5y/7OqYj6pp+BjcoY/HlBBx2L30bYxcHodH0HV/sZt
         wHbAY+3yK3DjiuJCMCaKmyyBqZcTrcUV/gyTTtPixqaGE2GYQmrGTD1Fybe190s6ALJA
         QQ7wO9zsoY9tv5OEGjj2MNjvBZHz7tJNdTtdZwjOeAaDUsaQQhqqQBCqpJaa0WnAjJ7h
         dyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790985993; x=1791590793;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMrvdFYQCazM8G9VA/H64aEP6ONlH/25N/jX/1bcgzA=;
        b=M6UJ7eT05kD0m0V5+iaBx5l2k78U2MNmf2omcQ0R7INOOZ08d//Ix+r6qaCFs4RIE4
         u/+MKImnmSDm+ugcj5A6F3hGUHEW6+6yXgtsKI4YIhk7rj4QnktZHT+tA/OkcAwKsotL
         uIKU1EAcERgXJMNfr4hp2U4Z5XJTOwxP7LokPAu/fKGknyE9VMOdE+O4i+YlI9ZRmdGk
         jOgl4NNQ2Rz7mjMi8OS3SAVsCbhJXNMsCLarVPH2+3Zl1eDge6wqfi4Ziuah8mj0gZ03
         1iNyw4fUIxdP6m5fkHEgAKV9AYiWwJZtiZE1o80nO0GxsEI6vfdw6fRF4lgut3KHFlXO
         kV1g==
X-Forwarded-Encrypted: i=1; AKwUvByAFmTxa3vuWuBpHrZsd39p7ofT8hMLjLR29zk1VOf1VLr2pNHq2szL1jmxFSUtO27WMjUWzH9/DJdQ@vger.kernel.org
X-Gm-Message-State: AFuF++kNmmhFfxm04gqIVnYa8Hl0dsUd84EamE3B+0X7S29BQUCP6haz
	S1mkGenA987ytFMUcphH79i1V2kJWu7GeKTlRVm+zn4sXYqs1eg+7zLsfg2mZcDaDQ4ULOp6ETD
	Zbk9RrHM0aEsB/cJ8dok7C7bT+kCZjDchz/BNPcxTZHd8swBjIFEFG8OPYN0U8Z4l
X-Gm-Gg: AYBFou15nfAbBcZse+OPUZBwRtYtu1v5M0T6GihAmIZFwuvZjR99NNcjg/CLXtmpRTT
	oDI0NpcbNpGJZHxq02xoin3RoBpC9AhXr2CN6KmaUuPtTX9MSxGBUmN0lfDTH8YiKTK2YRTNUBt
	BDtMAajhUFwoDbT/pm/fAa/YOEMIiENvCaLFaGZs6x0FGvIwpS2Thpxh6Yvc3uELKV76/YiLSIC
	khojRjBoj6MlwxUs3QZYbp/XUjAW3wBPFkrOcX5KIvqlTkePa0BEab8yUgJE22VEk+MZEqVV/TD
	rQttwLPTN4l39GhZdWKAuBUkp5gc6LArg1Ylz+N/WlJ2osWXdfrROoXo9ZjUw959L68nLLQWaHw
	issJ+UncnH0A8x1Qsq6CqbPsBecT8K5rDA/3A8PkuHSONsYvxjY0YLG4X1lZioDo=
X-Received: by 2002:a05:7022:f90b:b0:14c:be8e:69f2 with SMTP id a92af1059eb24-14f5c2ee7bfmr5868532c88.21.1790985992833;
        Fri, 02 Oct 2026 17:06:32 -0700 (PDT)
X-Received: by 2002:a05:7022:f90b:b0:14c:be8e:69f2 with SMTP id a92af1059eb24-14f5c2ee7bfmr5868482c88.21.1790985992020;
        Fri, 02 Oct 2026 17:06:32 -0700 (PDT)
Received: from [10.71.184.34] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fce9a619sm768525c88.14.2026.10.02.17.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 17:06:31 -0700 (PDT)
Message-ID: <855bde4f-59cf-40f6-9dce-e0ee225c4e95@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 17:06:00 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] soc: qcom: qpace: Add Qualcomm Page Compression
 Engine driver
To: sashiko-reviews@lists.linux.dev,
        Georgi Djakov <georgi.djakov@oss.qualcomm.com>
Cc: robh@kernel.org, linux-trace-kernel@vger.kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-3-georgi.djakov@oss.qualcomm.com>
 <20260930150435.C5D371F000FF@smtp.kernel.org>
Content-Language: en-US
From: Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>
In-Reply-To: <20260930150435.C5D371F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TMX3qPI-sWnDR0adWRPitJuU4jQP89KJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMCBTYWx0ZWRfX5MEdOO04kk5p
 JUlWpQUOOKfGHTSOXMs3F7R5ngJPCJrcuGMjFYYGTHK8Wvn6EYPZL6N6wqnL+X4IUYWoV+LGAyJ
 EsZlVfLDmELROJ2catMQXZo+efXH0i0=
X-Proofpoint-ORIG-GUID: TMX3qPI-sWnDR0adWRPitJuU4jQP89KJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMCBTYWx0ZWRfX/7jWwL9rXO/N
 1F7VC+39luX7DP/lq/nJuiIPPfrJ/nIE3OYVyjJzhjtwOw2I6xlDFpdMCQir8WL0Py+Z2nAXdoc
 CvICRCJyXzZjfXwTZM1CW6OSyG83wmz9dhOakEPK/OAk5RdiGipe/8t/qIw51ZAy/SJ4ocb+vFi
 1WH5x9oHlj/uXAix742g0a3Od2CE5CXJ7mOhpUmkFUy0UTpUZ6rhhtsVQ7A8d8jJwslUxf/brYO
 vEibho723ii4BnG9w64QmL8QhjJGCrTsLwFu6ZNXZ3RtwA3g8bRBjguB9jVwScsZ996s/tIzgbv
 MvWwdsfIRfjQHsH5ReNzNkLUXc4Isd+MJXJkNeeSsngQHn9/mXcJZ3e21ABXhoZn5Y2uXt4iWlX
 MqruL/lgcKurTuWoZuonvZbLwgXpPLM8892ZTp4lMDEyLDpaAg1Ka9OeJWUlCgjKcqwyq32QvAy
 LDUFAAx2iRXk9kos0eg==
X-Authority-Analysis: v=2.4 cv=f+jdl+yM c=1 sm=1 tr=0 ts=6ac0470a cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tqr4Kburuj4KFFtUzTYA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030000

On 9/30/2026 8:04 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 8 potential issue(s) to consider:
> - [High] soc: qcom: qpace: concurrent MMIO access from CPU aliasing on >8 cores
> - [High] soc: qcom: qpace: UAF of global qpace_priv after driver unbind
> - [High] soc: qcom: qpace: 100ms busy wait with preemption disabled causes latency spikes
> - [High] soc: qcom: qpace: interrupt storm due to uncleared level-triggered IRQ
> - [High] soc: qcom: qpace: stray DMA writes on urgent command timeout
> - [High] soc: qcom: qpace: hardware stuck in STOP mode after suspend/resume
> - [Medium] soc: qcom: qpace: silent truncation of unaligned output_addr causes DMA corruption
> - [Medium] soc: qcom: qpace: inline stp assembly breaks big-endian architectures
> --
> 
> commit 5edbc123f3ebd977977e7d874e4ecebc5ed95e6a
> Author: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
> 
> soc: qcom: qpace: Add Qualcomm Page Compression Engine driver
> 
> This commit adds a platform driver for the Qualcomm Page Compression Engine
> (QPaCE). It provides the urgent command path for synchronous single-page
> compression and decompression, supporting low-latency operations for
> compressed-memory users like zram.
> 
>> diff --git a/drivers/soc/qcom/qpace.c b/drivers/soc/qcom/qpace.c
>> index 0000000000000..69aa14b7c4772
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qpace.c
> [ ... ]
>> +static inline int qpace_urgent_command_trigger(dma_addr_t input_addr,
>> +					       dma_addr_t output_addr,
>> +					       int urg_reg_num,
>> +					       enum urg_reg_cxts command)
>> +{
>> +	void __iomem *td_dst_src_reg = qpace_priv->urg_regs +
>> +				       (urg_reg_num * QPACE_REG_PAGE_SIZE) +
>> +					QPACE_URG_CMD_0_TD_DST_ADDR_L_CFG_CNTXT_OFFSET;
>> +	u64 urg_addr_field_lower, urg_addr_field_upper;
>> +	u32 stat_reg;
>> +	unsigned long ret;
>> +
>> +	urg_addr_field_lower = FIELD_PREP(URG_CMD_0_TD_DST_ADDR_L__CMD_CFG_CNTXT,
>> +					  command);
>> +	urg_addr_field_lower |= GENMASK(63, 8) & output_addr;
> 
> [Severity: Medium]
> Will this silently truncate the output_addr if the caller passes an address
> that is not 256-byte aligned? In qpace_urgent_command_trigger(), this drops
> the lowest 8 bits, meaning the hardware will write to the incorrectly
> truncated address and overwrite up to 255 bytes of memory before the
> intended buffer.

Current use case for qpace is zram (although it is not limited to only 
zram). ZRAM operates on a page granularity which means that all 
addresses submitted to qpace will be 4KB aligned which is also 256 byte 
aligned.

> 
>> +
>> +	urg_addr_field_upper = input_addr;
>> +
>> +	/* Clear a stale request-on-active error before ringing the doorbell. */
>> +	qpace_write_urg_cmd(qpace_priv, urg_reg_num, QPACE_URG_CMD_0_STAT_CLR_OFFSET,
>> +			    URG_CMD_0_STAT_CLR_REQ_ON_ACTIVE_ERR);
>> +
>> +	/* Ensure that preceding stores that QPaCE will depend on are done executing */
>> +	dma_wmb();
>> +
>> +	/*
>> +	 * Ring the doorbell with a single 128-bit atomic store. QPaCE
>> +	 * triggers processing when it observes the (dst_addr, src_addr)
>> +	 * pair land together.
>> +	 */
>> +	asm volatile("stp %0, %1, [%2]\n" :
>> +		     : "r" (urg_addr_field_lower), "r" (urg_addr_field_upper), "r" (td_dst_src_reg)
>> +		     : "memory");
> 
> [Severity: Medium]
> Does this inline assembly break big-endian architectures? By bypassing the
> standard writeq() accessors, this stp instruction skips implicit cpu_to_le64
> conversions, causing the hardware to receive byte-swapped, garbage memory
> addresses and context configurations if the kernel is compiled with
> CONFIG_CPU_BIG_ENDIAN.
> 

ACK. Qpace is used in only little endian arch so far. We can look at a 
handling for big endian configurations as well.

>> +
>> +	ret = readl_poll_timeout_atomic(qpace_priv->urg_regs +
>> +					urg_reg_num * QPACE_REG_PAGE_SIZE +
>> +					QPACE_URG_CMD_0_ED_STAT_OFFSET,
>> +					stat_reg,
>> +					FIELD_GET(URG_CMD_0_ED_STAT_COMP_CODE,
>> +						  stat_reg) != OP_URG_ONGOING,
>> +					1, 100 * USEC_PER_MSEC);
> 
> [Severity: High]
> Does this cause severe scheduling latency spikes or RCU stalls? The caller,
> such as qpace_urgent_compress(), disables preemption via get_cpu() before
> initiating this hardware poll. Executing a 100ms busy-wait loop in
> qpace_urgent_command_trigger() while preemption is completely disabled
> can freeze CPU cores for unacceptable durations under load.

Under normal operating conditions qpace will finish processing a request
much sooner than 100ms.We have not seen any RCU stalls as a result of 
this 100ms timeout loop.

> 
>> +	if (ret) {
>> +		dev_err(qpace_priv->dev, "QPaCE urgent command timed out\n");
>> +		return -ETIMEDOUT;
>> +	}
> 
> [Severity: High]
> Are we returning a timeout error here without stopping the hardware from
> continuing the DMA operation? If the hardware takes longer than 100ms in
> qpace_urgent_command_trigger(), this returns -ETIMEDOUT while the device
> continues. If the caller (like zram) frees the output page, the hardware
> could later finish and cause delayed asynchronous memory corruption.
> 
If we ever run into the timeout path, then that means a hang has 
happened and qpace all toegther is not making forward progress on the 
request. This means it will not be doing any more DMA accesses.
But regardless I think adding some error handling to stop Qpace from SW 
is a good idea and can be implemented. Thanks.
>> +
>> +	return stat_reg;
>> +}
>> +
>> +int qpace_urgent_compress(dma_addr_t input_addr,
>> +			  dma_addr_t output_addr,
>> +			  struct qpace_algorithm *algo)
>> +{
>> +	int urg_reg_num;
>> +	int stat_reg;
>> +	u32 stat_reg_val;
>> +	int ret;
>> +
>> +	ret = qpace_get();
>> +	if (ret)
>> +		return ret;
>> +
>> +	urg_reg_num = get_cpu() % NUM_TRS_ERS_URG_CMD_REGS;
>> +	stat_reg = qpace_urgent_command_trigger(input_addr, output_addr, urg_reg_num,
>> +						algo->urg_comp_cntxt);
> 
> [Severity: High]
> Can this assign identical hardware registers to different CPUs running
> concurrently when NR_CPUS is greater than 8 without cross-CPU mutual
> exclusion? In qpace_urgent_compress(), get_cpu() disables preemption but
> provides no mutual exclusion across different cores. If two threads initiate
> compression on CPU 0 and CPU 8 simultaneously, they will both be assigned
> urg_reg_num = 0 and race on the same MMIO block, leading to data corruption
> and hardware timeouts.
> 
Current qpace HW configuraion is to work on soc with 8 cores so that 
these urg_cmd registers match without overlap. Alternatively, we can add 
a check at probe time for cpu topology and abort device initialization 
if num cpus > 8.

>> +	put_cpu();
>> +
>> +	qpace_put();
> [ ... ]
>> +int qpace_urgent_decompress(dma_addr_t input_addr,
>> +			    dma_addr_t output_addr,
>> +			    size_t input_size,
>> +			    struct qpace_algorithm *algo)
>> +{
>> +	int urg_reg_num;
>> +	int stat_reg;
>> +	u32 stat_reg_val;
>> +	int ret;
>> +
>> +	ret = qpace_get();
>> +	if (ret)
>> +		goto out;
>> +
>> +	urg_reg_num = get_cpu() % NUM_TRS_ERS_URG_CMD_REGS;
>> +	qpace_write_urg_cmd_ctx(qpace_priv, QPACE_URG_CMD_0_CFG_CNTXT_SIZE_n_OFFSET,
>> +				urg_reg_num, algo->urg_decomp_cntxt,
>> +				FIELD_PREP(URG_CMD_0_CFG_CNTXT_SIZE_SIZE, input_size));
> 
> [Severity: High]
> Does this dynamically overwrite the shared hardware context size register
> concurrently across aliasing CPUs? In qpace_urgent_decompress(), with
> more than 8 cores, aliasing CPUs will race on this MMIO block leading to
> data corruption.

ACK. Same response as above comment about > 8 cpus.

> 
>> +	stat_reg = qpace_urgent_command_trigger(input_addr, output_addr, urg_reg_num,
>> +						algo->urg_decomp_cntxt);
>> +	put_cpu();
> [ ... ]
>> +int qpace_get(void)
>> +{
>> +	int ret = 0;
>> +
>> +	mutex_lock(&qpace_ref_lock);
>> +	if (qpace_priv->suspended || READ_ONCE(qpace_priv->broken))
>> +		ret = -EBUSY;
> 
> [Severity: High]
> Can this exported API blindly dereference the global pointer after the driver
> has been unbound? If the device is unbound via sysfs, qpace_priv is freed,
> but the global pointer remains set. A subsequent call from a client like zram
> will call qpace_get() which dereferences qpace_priv->suspended, resulting in
> a use-after-free.

ACK. Possibly we can make use of qpace_drv_probed in exported functions
to avoid using qpace if it has been removed or not probed.

> 
>> +	else
>> +		_get_qpace();
>> +	mutex_unlock(&qpace_ref_lock);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(qpace_get);
> [ ... ]
>> +static irqreturn_t urgent_interrupt_handler(int irq, void *unused)
>> +{
>> +	pr_debug("Urgent interrupt handled\n");
>> +	return IRQ_HANDLED;
>> +}
> 
> [Severity: High]
> Will this cause a catastrophic interrupt storm? The
> urgent_interrupt_handler() fails to acknowledge or clear the interrupt at
> the device level. Because the GIC interrupt is level-triggered, returning
> IRQ_HANDLED without clearing it on the hardware will cause it to
> immediately re-fire forever, resulting in a hard CPU lockup if the
> hardware ever asserts this line.

Currently as seen above, SW is noified of a completion event by polling 
the HW register and not using interrupts. When other usecases are added 
which use interrupt, then you are right that the HW registers will be 
reset/cleared.

> 
> [ ... ]
>> +static void qpace_remove(struct platform_device *pdev)
>> +{
>> +	mutex_lock(&qpace_ref_lock);
>> +	qpace_priv->suspended = true;
>> +	mutex_unlock(&qpace_ref_lock);
>> +
>> +	static_branch_disable(&qpace_drv_probed);
>> +
>> +	wait_for_completion(&qpace_priv->no_active_refs);
>> +
>> +	/* No callers remain; tear down the hardware. */
>> +	cancel_work_sync(&qpace_priv->disable_work);
>> +	qpace_power_off(&pdev->dev);
>> +}
> 
> [Severity: High]
> Does this leave the global qpace_priv pointer set? In qpace_remove(), the
> device is torn down and devres will free the memory backing qpace_priv, but
> the global pointer is never cleared, enabling the use-after-free mentioned
> above.

ACK. The pointer can be set to NULL to be safe and qpace_drv_probed can 
be checked by exported functions to avoid using qpace if it has been 
removed or not probed.

> 
> [ ... ]
>> +static int qpace_resume(struct device *dev)
>> +{
>> +	int ret;
>> +
>> +	mutex_lock(&qpace_ref_lock);
>> +
>> +	if (qpace_priv->active_rings)
>> +		dev_err(dev, "active_rings not 0, unexpected case\n");
>> +
>> +	ret = icc_set_bw(qpace_priv->interconnect, 0, 1);
>> +	if (ret)
>> +		goto out_unlock;
>> +
>> +	program_urg_command_contexts_v2();
>> +	program_decomp_core_cfg();
>> +
>> +	qpace_priv->suspended = false;
> 
> [Severity: High]
> Will the hardware be stuck in STOP mode after suspend/resume? In
> qpace_resume(), we restore contexts but fail to wake the hardware engine
> up to RUN mode (omitting the QPACE_RUN write) and fail to reprogram
> essential bulk mode and cache index settings from qpace_hw_init(). This
> means all hardware operations will indefinitely time out after the system
> resumes.
> 

In suspend case the HW is in power collapse mode, but once woken up will 
retain it's run status.

>> +
>> +out_unlock:
>> +	if (ret)
>> +		dev_err(dev, "failed to resume QPaCE: %d\n", ret);
>> +	mutex_unlock(&qpace_ref_lock);
>> +	return ret;
>> +}
> 

Thanks,
Oreoluwa

