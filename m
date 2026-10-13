Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881F74E13EA
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889241; cv=none; b=bqxnHbBpbL6hQI0kKhib4qLgTrE/l8u9Pq+nSy56wPA2E6RkLaPYNsFoxyD9wuwbvtlgSRVOp5Teh30g3Mtkla7qFKx1/EwZ5lxQj1irgQGPnH0BqgQWa3qq+mSNS0lLJFCtfh8+DdJ1piqm8A0RIgtAlC8gwvoRsvYraz72vnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889241; c=relaxed/simple;
	bh=20UCt5A5N9hrL9kRW+9ruag7btP8aGZNt5TXFD623hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YLxvxjGNSm8iG7P/B/M3J3w7ZHsSm+pKvfR5q15ByJ/xuscCNoXyMtPA7eHdbMOKXLgozxMafpCLI0UtS/SSealp9mv0b+2xdN2ky4KIMeEnU8mWkuXNhD2HyMPew7YGz+srSeXlLRDsTe1PusttVwaIYPY+qPG/n/Nn+8k4nd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=of2YIvFn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P3CIxTME; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="of2YIvFn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P3CIxTME"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D944GA483032
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TGBKmg6i2DHwrZUp2sIicFVvMg7ugGymVJnpQzLwHyY=; b=of2YIvFno1pf8F2Y
	3nvEWP7kx9POMncPPbYB2ufRRV0DjGknhMGU5j8fyaQsQLJikbmFG8ErhCFkJK/h
	UcqLuQyuUA/pQ/P2W0lKk0aMLehNPyIlkj0hwRWkShDoxqO3Vu3XDZu75G8y/m/V
	Zd1iWw0AEfzRazADDzxV4k8Q3eQ4DSR1Zb2ehfRbq3lghikvVxwXCkMH5+oo/AZa
	lZlwqPboM5AUsCXzIoMD3WMME0NCaO5O6WbREeON38rsmnJMUB/iBiGFXelzPk0a
	fkgj4DP8a9WZ+aQp5AUtYABb6Iwg0Am6boWYVftM60U5pDxB3LfQ3Ov7x9NRxmVA
	4yMcEQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hpg8gdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:00:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39512608fb1so4628330a91.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 04:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791889236; x=1792494036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TGBKmg6i2DHwrZUp2sIicFVvMg7ugGymVJnpQzLwHyY=;
        b=P3CIxTME8kPkXPrQtYMGzTMs01lkdooXSmmJXtO2pmq32dFRrkQOoWCuFw4uZsU5e6
         L2E4A9GW3DpYZTENfoEA3Kq44btvK86f9Rok/LUY3dmamRrUYiPERe5365awY2gWvM2J
         /NbqAY0mVVhgVj6WJVvZRgXOG4YYS04Vg/mL4n5nkZP7p9vDEei1Y8zvtbmW/317srRr
         7mi9hkQ1cQiGZ/uAbj3dH62bLtnu6o5MxuNvtgrTk7tFvw4JCv41RR/IX47Ac0d0/jcw
         ye+jwZGpfx9eAUirAfAqy3PihiUut2wtXqkiZN+Vvoqlw+CEsTmBl5x80MZb6XItWcVW
         27Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889236; x=1792494036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGBKmg6i2DHwrZUp2sIicFVvMg7ugGymVJnpQzLwHyY=;
        b=nvEcEDcRPsVJr7JbfXKSA5Y2QfjXctHr5BeEFCjErAT0OQrQc9hW6QLEM4SQRjTa0e
         6Nnog+6jWjZfMWQMjNoLAYbu9L9hFDFNqHhABQ5nSqaz7F+k/0Y3/hs55zewXPL09B1X
         x8yFQV7cN2P+uNUD9kyPG2yic0z74E5xpvn7magcE7cLa//7Etpc5+iZMvyEhAx5tFW2
         qBpOneCWu6OEL+D6losoTr4Mv772zBw1QAgZmlkCRm/EtX53WrXwk1HaxyIV7E/ciaZ6
         Mtiy4aUtuKG2U8525X5y1twQOofB4YsBMdMugUTLgqOu3hNeusHe0NBXquu+lskFyEV6
         oCWw==
X-Forwarded-Encrypted: i=1; AKwUvBz3KNnOmtkAUUf80GOHIQyU7BDUjUgpI3Ssqb5UFa5UkXBZU09c21qT3ZBgZUpfqAcq2+0y/IWQ8i0u@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1slQP2bwNHgY344CH/sxRm21uameHvnwhriVt6pTz+ZgrM575
	W7QOzls9mIIdCwoA5ql10PuHS15vwQF+IsFHTTsXRdhz/f2GBmPs0FGNqYnfa32n8geP0M4QZyC
	c5avysXmI2toEmxG2IO4d1IDYm2tLJmnGaNsNjmNB1/azlPWwqprjaJO1nvhCur6c
X-Gm-Gg: AYBFou2RAvmnhY+MtNQmXsglcbUVxlyaD9tybRwzlxGJKrJQRktHg/aploqON89SRqy
	rcXLRD22Vd4op8FndYfmJOKHWkjv9ymNRx2fxMBaKFlMnZCIdtJUZ6LQ2UyTCNQ3tYZbG7JU+Kl
	WbjgDEwenohTF1noE8aK+pEwEr2MULxJBmqsmPe4Vh8Y02/S0dU1eb2kggBaawXVjREj9nwagaS
	6MputNKdvYNq1tgO6rV5Qmp2/O0cltdXTJPKOhxBrKG6xXCMGwcoAFY/vkgFMFtSvhw5EuoszO7
	m293+OPuBiA13G95tIqrLRjMSJNtlLNK4Jgiv8CsTSdMwJag7DP7UW67WXfRVNjd6SirZTC1Wv3
	ee4PjSeH2+EMFaj6rZgvxc2SGumTK4nTmvg==
X-Received: by 2002:a17:90b:5343:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3ab3a956dd3mr10381526a91.10.1791889235903;
        Tue, 13 Oct 2026 04:00:35 -0700 (PDT)
X-Received: by 2002:a17:90b:5343:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3ab3a956dd3mr10380961a91.10.1791889223940;
        Tue, 13 Oct 2026 04:00:23 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39822051sm9247853a91.4.2026.10.13.04.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 04:00:22 -0700 (PDT)
Message-ID: <3cdcacec-2da4-4ee3-abfe-09427afe4154@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:30:19 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 11/17] wifi: ath12k: Add platform MSI support for
 CE
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
 <20261008-mpp_bringup-v1-11-2c5797b5e4ac@oss.qualcomm.com>
 <sashiko-outbox-164035@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-164035@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fyOAeseU7J8CE0MFtpr76MXfWVYm3DeY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX12zj0uDe5ZjH
 jyR/aIPDY2hB2Wm5GOI8+wDg3ujifJwQlJHffVwPB0aNntDvOLtaroDYA26Q4KDL6l2O9iWX+2H
 PA7m5h4d/GfjQMJae1+PoeYNIvQ8Wcw=
X-Proofpoint-ORIG-GUID: fyOAeseU7J8CE0MFtpr76MXfWVYm3DeY
X-Authority-Analysis: v=2.4 cv=Z4Z5j3RA c=1 sm=1 tr=0 ts=6ace0f55 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Tyqs917yuOYvDiiBU9gA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX0NmAuh2NJFmn
 JEnFLzOTALyNWk8M68j6vHNO5jj64vuTPxk0O5MQ/ABanNiBrOYLypWJ0Q7enINzIiUy5ztlmzQ
 z52wNpH+UaD/870j4jUuut9WLGnfQLyneUd0JiG16vC5YxTpN0YOwWMk43KJffrvIEzSQ6de2Ob
 UrZjfaCe83nXJfe7nRm3wTTsD7Jw4btZhP0G7X+K2s8HNnh92HD2kIJi3IhuX7MbP4ZehL4sUHo
 8rft0L3Xn73/CFxPcxMQizssugP+/6cYKNaRYoNWe47ZpAPn9tVP7nbk7EWmhjkECWkgZJpHHi1
 DguOxzScvuccSr+D5K52IEKQ9vU5TuelZkeTSbHph1EKfR/mlp12sRQGhCM3oXbxfJs7F9eioZ7
 YscmvapntF60u+v/QuMgC9ekV2FbRyM+ADkymcByVEv/M5f5Yzv9Jeebwv4Pgr4dkIH/rOXGkXP
 PGGoBeubACXotNBOctQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130043



On 10/8/2026 4:11 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Resource leak of non-devm MSIs and IRQs on ath12k_ahb_probe() error paths
> --
> 
> commit ad41050e8b81bf8d1dd6e4fe6253604d235fd347
> Author: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> 
> wifi: ath12k: Add platform MSI support for CE
> 
> This commit adds support for configuring Copy Engine (CE) interrupts
> through platform MSI on hybrid AHB devices like the QCN6432. It introduces
> an IPCI MSI configuration, allocates MSI vectors from the platform MSI
> domain, and registers CE interrupt handlers using the allocated vectors.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
>> --- a/drivers/net/wireless/ath/ath12k/pcic.c
>> +++ b/drivers/net/wireless/ath/ath12k/pcic.c
> [ ... ]
>> @@ -154,3 +155,157 @@ void ath12k_pcic_write32(struct ath12k_base *ab, u32 offset, u32 value)
> [ ... ]
>> +static int ath12k_pcic_ce_irq_config(struct ath12k_base *ab,
>> +				     struct msi_desc **msi_desc, int num_msi)
>> +{
> [ ... ]
>> +		scnprintf(ce_pipe->irq_name, sizeof(ce_pipe->irq_name),
>> +			  "pcic%u_wlan_ce_%u", userpd_id, i);
>> +		ret = request_irq(desc->irq, ath12k_pcic_ce_interrupt_handler,
>> +				  IRQF_SHARED, ce_pipe->irq_name, ce_pipe);
> 
> [Severity: High]
> Does this leak the requested IRQ on the probe error path?
> 
> Since request_irq() is used here instead of devm_request_irq(), it requires
> explicit cleanup. This function is called by ath12k_ahb_config_irq() during
> ath12k_ahb_probe(). If a subsequent initialization step in probe fails
> (such as arch_init or core_init), the error path jumps to labels like
> err_deinit_arch or err_core_free.
> 
> However, the error path in ath12k_ahb_probe() does not appear to call
> ath12k_ahb_disable_irq() or ath12k_pcic_free_irq() to free these IRQs.
> If the device context (ab) is subsequently freed by ath12k_core_free()
> while the interrupt handlers remain registered, could this lead to a
> use-after-free panic if an interrupt fires?
> 

Thanks for pointing this out. I'll address this in the next version.

>> +		if (ret) {
>> +			ath12k_warn(ab, "failed to request irq %d: %d\n", irq_idx, ret);
>> +			ath12k_pci_free_ce_irq(ab, i);
>> +			return ret;
>> +		}
> [ ... ]
>> +int ath12k_pcic_config_irq(struct ath12k_base *ab)
>> +{
>> +	int user_base_data, base_vector, num_vectors;
>> +	struct platform_device *pdev = ab->pdev;
>> +	int ret;
>> +
>> +	ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_IPCI];
>> +
>> +	ret = platform_device_msi_init_and_alloc_irqs(&pdev->dev,
>> +						      ab->msi.config->total_vectors,
>> +						      ath12k_msi_msg_handler);
> 
> [Severity: High]
> Similarly, does this platform MSI domain allocation get leaked on the
> ath12k_ahb_probe() error path?
> 
> platform_device_msi_init_and_alloc_irqs() is not devres managed, so the
> domain must be explicitly destroyed via platform_device_msi_free_irqs_all().
> Because ath12k_ahb_probe() does not call the corresponding free routine when
> it encounters an error after this point, are these MSI vectors leaked?
> 

Sure, I will address this in the next version.

>> +	if (ret)
>> +		return ret;
> 

