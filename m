Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577377;
	b=1xCG3/HFmqXaVU7aw/mIIGtpxsoKShPkwf27Ve/bN3QRYYzPzp4M/Z58nSRImC/r/5Wz
	 Z+h94RViVE+B/Dev9Fc8pKPsT3XWzFler4gSCtaXPA3uvvbspFlun9y+n4wmNAWKn5GV+
	 oQvsW40f7EIMz5brUJTamMD8Q6PJ8L8swcYRrUfyfM1oLsd+iyhtZnQZaouYRrt1lwhFf
	 +AOq8HeUVDHZWxd4p0G3Y6GOGYGcV842ns8rCTCD/98ekmkk4P8UVUVuGI4rhUYj1WqPH
	 9QPu307VPijqKZtjFrBtIrn2+A9ckugBsK3mDBaCfMhLrS1dT+OkM849D9j8YUCjgKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577377;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xX7w89EkaqYgsjNRtSfJ2R58JonXwvOwafkoVBNr9Wc=;
	b=DeFfODyrTqttHaZ/+01Hwuoe8Jf3oWxBTsklndb4OigHeO15eelDwjhJyZEkhvCAJLfh
	 8Oo3uWvres6qX8yyAoCsSPTx5du/GKtd/TEJ5OOID55zJ5GRB6WFIN12+1s9nilr/4RxL
	 RhEEjILSNe/LG315DuRH2a1fZze0rd96pEPDePv3w2VNlnY0APDFyGOvwMIJb8XEdq2iu
	 QX0xnqFTUI/GYznJSStXYoYE4mgXfaw8pt+xKCOdB6p/OJfk8rszlkrgaNbOsAh1hmMAM
	 lU8L6P7XB7u8Jv5V8+k7HpVmRZWPvHMOxZDHwH4sbNPmw1AbpbxGS2xoO2TN0GVN3zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VuBnaPI0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BJlgZfgO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DE0606A325
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34DE0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VuBnaPI0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BJlgZfgO
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5e171356947
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xX7w89EkaqYgsjNRtSfJ2R58JonXwvOwafkoVBNr9Wc=; b=VuBnaPI0CPbl/Ewm
	ui9CmMcphg4JRY61GGMhq5QiiG7poa/2e4xeNLERxfFGhgq66R36aVuK0apkS6eq
	E2vYxbrjq+vxlH7S+kIMxds+ElDQB/Efv1pnpcWgBCBorjQHvg/3H0+1ly/TGxd4
	PEM3asr+5vPiiUQbc2Xi0tSzddcexfYvgCyWY20LPxxUSIgUW15C0mPUEQ/WGbjy
	etpMd4xdiS4202CR2/cCfdoJU3q2CtrlTjEeZeNBmzbDLi7bsSMxGHygx+Dh9LT9
	ykEbYcy+QfBAPD+2DSvgeJxm9iUimpOO1q6aitxEGl/TytgzQ7DrH9ga1wJMxNb1
	Q6vlwA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4ucpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:09:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso887315a91.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577375; x=1793182175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xX7w89EkaqYgsjNRtSfJ2R58JonXwvOwafkoVBNr9Wc=;
        b=BJlgZfgOtQMxxQnzCTTJ1Lfm5zRQ69y1CnJVrp2FCAeZH8v34DxeYha7kQFUggIouW
         c8VbKjlDEI+2w9TOOHyr0a4I8UnfLe5IM5VYAkTzU9OBoREW0OQRv0ERZWrmZlfIVE9b
         NGPPwphTQSYn500vzHoKYW1p5Q72/qOd6/Lkcf2Ourx4ZUgP0XsVaHcjsyAve98EPL8M
         dFIdp2z4/HE6B1I0LgcllD5aCzTnDUCVYr4pezrV/atmCklCKXAwEeOIUVf8BuH7sn5o
         sEIE38g2POES3AHDrATWU0DrsLiE1zl/0ETtwjZNnvu0bYlPfg8PA4qqGrmuZCMImGcn
         p2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577375; x=1793182175;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xX7w89EkaqYgsjNRtSfJ2R58JonXwvOwafkoVBNr9Wc=;
        b=oSkNbBjm3ObN8C8F/hNVdjUO7MIVK7+2hWzFf8jKyl4EP99bvymo/AfosKRD5o0C9B
         oSRAiqtdyTQzJZ7rrvyRQ6p9BImlVqUCydFgT1V2W43XxhY/s8JSaFBjXOcCsRSPetmc
         yd+J77YGvR39jbv+dRql3ddb3C1hjoy51fBvZ5TjP/rParGdo4TszXEzIRmoexXcQaGp
         LnnkVB6D7EK136G7KzVUMx1VKl4k97a43V8UAIlp0riGlZLMKUmKz44fol0AzhmICZd6
         iIDLMEn0tl09qhYBOkjvh7sFS65AeO35qpJo+DtqEKXuI3EVrdiEzojOZr2MmZjO9nsa
         +ARw==
X-Gm-Message-State: AFq9FYLCXmBA+hECLnjrvgteLD8lyxbFXB5ACXVtiZg1rvVRf5JMeRyF
	L1LLyMP9VLH0TItOusBnEqVcQQuU/Zx5iAkYUEZxrqIxjWd7LYJ1HA+BdG99AZuF0n3pveGvwew
	45xkKHdyXt2PHzz+Nv9YXSGjoQG7kvlVK07bQJinfZAl6xoyeVuldRDFRY7rGLIvQ
X-Gm-Gg: AYBFou1zA9u0Zu4cZXOveFVcY7FW4bnm1eVzHMtYavVWdYXpilaUo+QUy7RKqLsj6Zf
	EPmojOb5MdJwTX/3A3+bmfHmJ2ODXJbcYdPRU9M/sRKcIvEhR6HSiecVib8sNyLezOr6aiHsJPD
	5VE8XoOaRxkM/ly+0Qo0qD9vHK560LvgvielIXiiLchXpaLMbCMqwT1qqdFi3FWjFk93r1ggvlx
	myI3rPAE4nE4c4J/D9Eh4xiLM5DxOEq/G6O/v+drmemARqAjAJUD2cuzVlzD70n4je7Y3S7W6ML
	a3r0QEsPfQKMzGxQx88/xv4hnaYOkzwGH81wLMZvSb2U3A25xDe9XdHxhjWKd3dJvfd+pQVxb+F
	IybgOZ2myZu+PvPji187ROCe2QrEqp1EJmg==
X-Received: by 2002:a17:90b:5806:b0:3ab:5832:727d with SMTP id 98e67ed59e1d1-3ad86f28451mr1324862a91.35.1792577374380;
        Wed, 21 Oct 2026 03:09:34 -0700 (PDT)
X-Received: by 2002:a17:90b:5806:b0:3ab:5832:727d with SMTP id 98e67ed59e1d1-3ad86f28451mr1324843a91.35.1792577373707;
        Wed, 21 Oct 2026 03:09:33 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6a859bad0sm627534a12.9.2026.10.21.03.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:09:33 -0700 (PDT)
Message-ID: <99df2266-677a-4d38-ab6d-e89f22c472c1@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:39:30 +0530
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
Subject: Re: [PATCH ath-next v2 08/17] wifi: ath12k: Add hif operation support
 for QCN6432
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-8-f510c33bfcf5@oss.qualcomm.com>
 <sashiko-outbox-173697@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-173697@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nilUExfSW5e6N8b5qiUbGgCf4RZps29W
X-Proofpoint-GUID: nilUExfSW5e6N8b5qiUbGgCf4RZps29W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX3lyJeh8ptGXO
 BIgjZExkHdyqoSFlXlfwMO55xU0qF6dy/SxduFLFUkccDsozOVwowsO+ShfaJjAXj30n/ihyH12
 0wI3VEk6XTYgkhz1rOKPuizaj+4fxS0=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad88f5f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=dyD3vpXHCcajTuVPfTYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX64NFQ7k00Tzk
 QiHd/NajHcJgD3ZFnUNdEq1pnLvdmZzR34+lkvPssFg2sUAnE4Nm4+VB7o27Ue6FcLMn5nkyVVM
 mgRgtEOyv/wsPPqrQ9KcAUwpNZSjzk3ZsR7A5q114BjM6OuNGHkJUzOezbjg9tZXdb5+EQ2o2f3
 UdpGrSr5qowcptWNqL+cdMBWh7usvK/NSda1oqCLvVWtzywuoGFV0ZT1AWbsCF+ZWPUNx4xE9NF
 sspu0BXje+hDId9oF3Nsz5NEFCF70VEJR4op7ybeFwYcavQIJ6lxjZIhbwzn/ygGPrBJnlsjKTk
 t95gU8PlBhVJqIhN7RE0/xtXu+Y5QHmuBuvsXGQmhqncq7CwAi5ls68mVnTAB7lnISSf6fzUYas
 dVRw9oo95pceaKBS4ke9nVBXJWVGtA1N0uB4ZAbMWN5sErrylVEUnw0QT3sPqmqrFiPMU38mA+O
 yctMYtCWAKHcUhwQb/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210040



On 10/16/2026 9:16 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] net: ath12k: unconfigured dynamic window in pcic read32/write32 causes out-of-bounds MMIO
> - [High] wifi: ath12k: use-after-free in timer callback ath12k_ce_rx_replenish_retry()
> --
> 
> commit d724e1834e7dbd2c47e113791169e389fe945179
> Author: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> wifi: ath12k: Add hif operation support for QCN6432
> 
> This commit adds HIF operations for the QCN6432 Wi-Fi driver by reusing
> existing methods from IPQ5332 and QCN9274 where applicable. It implements
> QCN6432-specific operations in a new pcic.c file.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
>> new file mode 100644
>> index 0000000000000..e3c8476af459c
>> --- /dev/null
>> +++ b/drivers/net/wireless/ath/ath12k/pcic.c
> 
> [ ... ]
> 
>> +void ath12k_pcic_stop(struct ath12k_base *ab)
>> +{
>> +	ath12k_pci_ce_irq_disable_sync(ab);
>> +	timer_delete_sync(&ab->rx_replenish_retry);
>> +	ath12k_ce_cleanup_pipes(ab);
>> +}
> 
> [Severity: High]
> Is there a mechanism preventing ab->rx_replenish_retry from re-arming itself
> here?
> 
> If ath12k_pcic_stop() executes while the timer callback
> ath12k_ce_rx_replenish_retry() is running concurrently, timer_delete_sync()
> will wait. However, the callback invokes ath12k_ce_rx_post_buf(), which blindly
> re-arms the timer on allocation failures (-ENOMEM):
> 
> drivers/net/wireless/ath/ath12k/ce.c:ath12k_ce_rx_post_buf() {
>     ...
>     ret = ath12k_ce_rx_post_pipe(pipe);
>     if (ret) {
>         if (ret == -ENOSPC)
>             continue;
>         ...
>         mod_timer(&ab->rx_replenish_retry, ...);
>         return;
>     }
> }
> 
> Could this cause the timer to be re-enqueued after timer_delete_sync()
> unblocks, leading to a use-after-free regression when the timer fires after the
> structures are freed?
> 

The CE IRQs are disabled and synchronized before timer_delete_sync() is called.
This ensures that no new CE IRQ processing can trigger RX replenishment during
shutdown. timer_delete_sync() also waits for any currently running timer callback
to complete before the CE pipes are cleaned up.

> [ ... ]
> 
>> +u32 ath12k_pcic_read32(struct ath12k_base *ab, u32 offset)
>> +{
>> +	u32 window_start;
>> +
>> +	if (offset < WINDOW_START)
>> +		return readl_relaxed(ab->mem + offset);
>> +
>> +	window_start = ath12k_pcic_get_window_start(ab, offset);
>> +	return readl_relaxed(ab->mem + window_start + (offset & WINDOW_RANGE_MASK));
>> +}
> 
> [Severity: Critical]
> Does this read from an unconfigured dynamic window?
> 
> When offset does not fall into the statically mapped UMAC or CE ranges,
> ath12k_pcic_get_window_start() returns the fallback dynamic window address
> (WINDOW_START, which is Window 1).
> 
> However, unlike the cmem accessors or the PCI equivalent (ath12k_pci_read32)
> which explicitly lock and program Window 1 to the high bits of the target
> offset, this function skips configuration entirely and blindly performs the
> read.
> 
> Could this result in out-of-bounds MMIO reads, directing the read to whatever
> physical memory address the dynamic window was previously configured to map?
> 

This should not happen for QCN6432, as it uses the CMEM read/write operations for
accesses to windows that are not statically mapped. These accesses do not use this
function.

>> +
>> +void ath12k_pcic_write32(struct ath12k_base *ab, u32 offset, u32 value)
>> +{
>> +	u32 window_start;
>> +
>> +	if (offset < WINDOW_START) {
>> +		writel_relaxed(value, ab->mem + offset);
>> +		return;
>> +	}
>> +
>> +	window_start = ath12k_pcic_get_window_start(ab, offset);
>> +	writel_relaxed(value, ab->mem + window_start + (offset & WINDOW_RANGE_MASK));
>> +}
> 
> [Severity: Critical]
> Similarly, does this write to the dynamic window without first programming the
> hardware register to map the target offset?
> 
> Like the read path above, ath12k_pcic_write32() uses the dynamic window without
> calling a window selection function such as ath12k_pcic_select_static_window().
> 
> Will this regression corrupt memory or hardware state by writing to a previously
> configured but currently unrelated memory address?
> 

same explanation as above.

