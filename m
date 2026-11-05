Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854403;
	b=gkJRm67GYfZGFT8Nsq2ODKQJRoMlu1yNLBSYD9KpmZdufzk97QCz83deHLvgE5c+s8d0
	 s6YCq8byYzgJAvjjKxzxjST8dsik/RLr7NH9juyvDQos5ILPmzRf8qUuqD15nf2J3ejwt
	 cw361QkE4Cxqd4z+67h00eSdH7EAq2QAhFbXLqAE/xuXuGHS2jL/1OaxvJUeKm1X9CsU1
	 FKqiZBgp8dMC40/tEMzk+Z5XOj3bWxGdr43dfb+FyM+U9XAt2gNdAwZ/u0rHpO1M/VroZ
	 2O6s+0UFipHWqumWr1fEjSNLpyAdQy5QoW7WqhbHG+auYATCfsrxgos/VTaTprsOHpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854403;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fPlQhV8mov6VQR2HZD+E5xUAjFMGU+R9aqhRi7OdfI8=;
	b=Igz18OJVxOVAo0e2S+WgNStaad61tVAkQBuz/mMlbb+S41HIB+Gkt9s76G3eW8PtpBlu
	 1MMyWLZsO+uOPLOD/oh4c3/0ROioNdhOAaWe0N0r0WLWgogduFWYWzHtgFQELoiKq8+Ba
	 c98nrbqzICTzS8aGrVXAKxI2HgcWQSvpKTU5vapTski3M7snWbbDupWDM1v/ED8KxxCLu
	 +maaP7/bbFK3hSucXdj2+l4tysBqqhM3775tp5W3Eibbe7otPK9K0jul0aKOs4W9zUgZj
	 H4KkGSDjA82Ga8KmvBSxkyJxT5CytEWbHJ75pdechvLVfwsFnz2Sp7CZpUcGOhYa1Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PsAd5QlE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QWoYAPAV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9F9606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 04:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B9F9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PsAd5QlE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QWoYAPAV
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A50oTvw207928
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 04:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fPlQhV8mov6VQR2HZD+E5xUAjFMGU+R9aqhRi7OdfI8=; b=PsAd5QlEZCKvLXTC
	df1XiC9Lc9ayduqrRcM+GKwblhbZdzHctI+UHQVOFcwIwf+XVb7KIKNTobDu3/BQ
	IgNh7gX+nFT/88amd0pt9AVlj7q2Grs/SV+y7aKBYOmvUhEzSZx9rF4qpdaWXWcp
	xpamF5N8G8zq+HwVDTA9QT7HEbfkv1o2i9eq1zK+LCx1vUlSJKJrQGEk2D+YrAcA
	Ri3PHByCTJeIVHayreB5GYIB9iF7RHPfxiMQpq/M7E02n2m9fmwnVrvuiYxFY9YF
	XQMN/oEMnW8KXumTKG9wlFV3gj5I2qBeta8/G/eMcCGh3MQ1TLWQWFDXqWYO9w6c
	joC3CQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj36fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 04:53:21 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b20a4b5f2bso1809663c88.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 20:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793854401; x=1794459201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPlQhV8mov6VQR2HZD+E5xUAjFMGU+R9aqhRi7OdfI8=;
        b=QWoYAPAVQJA6Tuc4nUJOR3FdPmT/sWD83dGW9+EZYR3oWrDS5WZrPKQe8rDhR9Odub
         2GBatNWSBPb9TIwO0XSHK3QrNTEvVXKF8/66A0ZOm69rjEw2+0H7Nxr/itF7i2504PSD
         kutVdcVYgTurzWDoI/KvfOtnZvnlMC548b9EvgAdR5+jEW/g+GkrsCMVS322/k2pXUrM
         zQ4C8vNetw+Gn91466m6Ksbotg/JJA8gAbVamPQANLBX91gU0ML9+LzFjXmzI6kxiqYR
         xwvoqgJjM1e9ryNQ/2SbPxhvCezdohE/T8zJPs3OESGTnGUfOcaWb1oQnqA3aqBdKM+k
         3roQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854401; x=1794459201;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPlQhV8mov6VQR2HZD+E5xUAjFMGU+R9aqhRi7OdfI8=;
        b=tggUHA3vSBFyZLIqUmfTzjNuh2Ftr3vnOFLaQEHD4hL4Hq2nfQTHTH/OfbP+85lU7A
         E2xDFbZQfxTItXI4c427f8PoXIQhzk9NAajkgAxr9WmQjGrStcN6kfhOjFofO6DS3mzn
         I+XjN7kjpluN4TLvuCqDtypRjP/wnvIqZeMLWSC5mt7bXT2dulEjRyVrl0XD2Nr5dhRu
         bGyf1RrMsxKCqLzwKCgeBSbbIcDfqdfBTAoBrZS9xAovVHB7LDD2VWkz1klNJanK8CS8
         wbFDsxYD5j9vL0NCQIq0TORQVPBEjua7p8v9ZRWXtLpweRRk7N6r9IqhYhTc2Ay6r7pq
         9Kcw==
X-Gm-Message-State: APuU4Z+onWI/Sv8j7b+ZAGEDeukeWYzERPhUwi+ojAN5sNIvJoW70N03
	LHWzjuumw542zOOZUuDp1bsF+ZJHHBGOdyLKPUC91fr/A1Rb2365NLARCp4oq30pMLSPHzbZfzF
	MzAcuPsJkkaOEa1IFGHfTZ8uTJgFrVcQJiQOR3RpBRICtje0T2yjfzchlisqWFx2v
X-Gm-Gg: AYBFou1nMIAPfdrjih/aGD+M6m2vaRYNTNSwuJwPgoB73b+Vm/mIRtGoFXYgXzHmwxc
	md5Dh5iL4VwAD1M3swyeLIaPwbJgH3UkVjidHK3P1oW3Ma2FnjzIVTzxH8KmtfsPk8QUJ8fp3zz
	+K0Q1ph+4IHxESeMjiC5Q9/ZFU1A5U1L/2oOlREkdUlzGa24JSk5uj3ATlQL4VAVUy+cv4q5R6F
	7dYSQYcAEFwZvIRFNL/ekEJ+/uUm8XywiFAOSv2bIKWCd8sLLbyBLWzHSNAKoIOzxu5SEBMKA7G
	iEa82FD76vNtr8z3cg05bU3KbNzARBZqxE3U+ui1GA9afSaHn+9VyrV9uAWUWxJFfpLhvFScqzy
	dRGcSacH7XOLwhJooZQ50tuhNck+9iR6IMhoYyBVj0KabY7gBVKcgw32JQ+jAtccjE44qbLiYXz
	nYWaFU
X-Received: by 2002:a05:701b:42c7:20b0:1b0:f0f5:e38f with SMTP id a92af1059eb24-1b0f0f5e3b5mr19777832c88.34.1793854400671;
        Wed, 04 Nov 2026 20:53:20 -0800 (PST)
X-Received: by 2002:a05:701b:42c7:20b0:1b0:f0f5:e38f with SMTP id a92af1059eb24-1b0f0f5e3b5mr19777797c88.34.1793854399881;
        Wed, 04 Nov 2026 20:53:19 -0800 (PST)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm12722647c88.8.2026.11.04.20.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 20:53:19 -0800 (PST)
Message-ID: <4d9acf03-61a1-409a-996a-f55fed1ce54c@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 10:23:16 +0530
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
Subject: Re: [PATCH net-next v4 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261103-qcom-bam-dmux-vmid-ext-v4-0-3690cc5ca0fd@oss.qualcomm.com>
 <20261103-qcom-bam-dmux-vmid-ext-v4-2-3690cc5ca0fd@oss.qualcomm.com>
 <sashiko-outbox-197422@kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-197422@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAxOSBTYWx0ZWRfX20rqZGhqqfw8
 YL7k+QtjpqZZrioa8u5DdOu8UZVOjPzT00QK1Pz8mrMQWKErSHEw+TNZWpkp0dMztT5I1NmvrxI
 Ny4NQxjwp08BUmMpzxWQjZ04ijMAyvs7AxojQbG8ft2gWuUe53ivdpa+2VXgIJ+n1vC4Mj9Ohu7
 rvjquPO4wXzEpGyrxID7k8YvAZDLTjbN1DVUo8TIAkWIOID97QLS7kYkth42LWcsSxqQaqzzqY7
 kDdDmqTOocZCbfiQyPaspWAeSGEDBcFu1aMxbqGA9zCCk3nFg3RGnteyEJ8wJJJeDvqXDVFqpfg
 eMXIBaoHm8PWgCGwrMEQk5sLFhLZRp2roKJLtSH6Fq07tdwAezRlkiOD+4Z3US5+rp/9pc+YMGx
 v51gb3/fx7b7PYwyiT3qoDlYhC+WLa25hglq+X98WRcsJNOuXr78cEJa0Ksi/C8NE+2U7OzXAHl
 G9A0LOzkyNk9hYjsj3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAxOSBTYWx0ZWRfXwVqpnPle1guX
 qF1KSJC1EYW+MWzPAhDmzsyJG2DjTmxVgxnyL/Z204FDjP8rDpZrgJfqlDSNRdkDg0qi7fSIDpl
 4ojrOY2vLJ+cmzc160Psc45teBaTRQc=
X-Proofpoint-ORIG-GUID: XI63uzTrEWGJAOw0hbAUtRe-NrMZEBEC
X-Proofpoint-GUID: XI63uzTrEWGJAOw0hbAUtRe-NrMZEBEC
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aec0bc1 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PDfakn4BgwhK7vJEGdUA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050019


On 04-11-2026 07:49 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] net: wwan: qcom_bam_dmux: race between bam_dmux_pc_irq() and bam_dmux_probe()
> - [Low] net: wwan: qcom_bam_dmux: incomplete vmid validation in bam_dmux_assign_dma_pool()
> --
>
> commit e5defad9cc621641da7903957a89aa1c3fa0145a
> Author: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>
> net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor
>
> This commit assigns a restricted DMA pool to both the local and remote
> execution environments via QCOM SCM when the qcom,vmid property is present
> in the device tree, and reclaims the pool for the local environment during
> probe cleanup or driver removal if the remote side has dropped its power
> vote.
>
>> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
>> index cc6ace8d64371..c9639474e58ac 100644
>> --- a/drivers/net/wwan/qcom_bam_dmux.c
>> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> [ ... ]
>
>> @@ -762,6 +768,96 @@ static int __maybe_unused bam_dmux_runtime_resume(struct device *dev)
>>   	return 0;
>>   }
>>   
>> +static int bam_dmux_assign_dma_pool(struct bam_dmux *dmux)
>> +{
>> +	struct device *dev = dmux->dev;
>> +	struct device_node *rmem_np;
>> +	struct reserved_mem *rmem;
>> +	struct qcom_scm_vmperm dst[2];
>> +	u64 src = BIT_ULL(QCOM_SCM_VMID_HLOS);
>> +	u32 vmid;
>> +	int ret;
>> +
>> +	if (!of_property_present(dev->of_node, "qcom,vmid"))
>> +		return 0;
>> +
>> +	ret = of_property_read_u32(dev->of_node, "qcom,vmid", &vmid);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to read qcom,vmid\n");
>> +	if (vmid == QCOM_SCM_VMID_HLOS || vmid >= BITS_PER_TYPE(u64))
>> +		return dev_err_probe(dev, -EINVAL, "Invalid qcom,vmid %u\n", vmid);
> [Severity: Low]
> As reported by Sashiko on v2 [1], in Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml,
> qcom,vmid specifies minimum: 1 and maximum: 63, since 0 is not a valid
> Qualcomm SCM VMID. However, bam_dmux_assign_dma_pool() does not reject
> vmid == 0 and passes it on to qcom_scm_assign_mem().
>
> Also, when bam_dmux_assign_dma_pool() records dmux->dma_pool_perms using
> BIT_ULL(vmid) and bam_dmux_reclaim_dma_pool() passes it as src to
> qcom_scm_assign_mem(), qcom_scm_assign_mem() tests srcvm_bits with 32-bit
> BIT(b):
>
> drivers/firmware/qcom/qcom_scm.c:qcom_scm_assign_mem() {
> 	...
> 	for (b = 0; b < BITS_PER_TYPE(u64); b++) {
> 		if (srcvm_bits & BIT(b))
> 			src[i++] = cpu_to_le32(b);
> 	}
> 	...
> 	for (i = 0; i < dest_cnt; i++, destvm++, newvm++) {
> 		...
> 		next_vm |= BIT(newvm->vmid);
> 	}
> }
>
> On 32-bit kernels (supported by QCOM_BAM_DMUX), BIT(b) is a 32-bit unsigned
> long shift, so vmid values in 32..63 trigger shift undefined behavior and
> fail to populate src[] properly during reclaim.
>
> Should bam_dmux_assign_dma_pool() reject vmid == 0 (or enforce a tighter
> upper bound unless qcom_scm_assign_mem() uses BIT_ULL())?

As answered on v2, the value range is validated by the binding, so the
driver only rejects values it cannot handle. The 32-bit limitation is in
qcom_scm_assign_mem() itself and should be fixed separately in
qcom_scm.c.

>
> [ ... ]
>
>> @@ -829,8 +929,11 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>   
>>   	ret = irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LEVEL,
>>   				    &dmux->pc_state);
>> -	if (ret)
>> -		goto err_disable_pm;
>> +	if (ret) {
>> +		/* The PC IRQ may already have powered up the RX path */
>> +		bam_dmux_remove(pdev);
>> +		return ret;
>> +	}
>>   
>>   	/* Check if remote finished initialization before us */
>>   	if (dmux->pc_state) {
>> @@ -845,6 +948,7 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>   err_disable_pm:
>>   	pm_runtime_disable(dev);
>>   	pm_runtime_dont_use_autosuspend(dev);
>> +	bam_dmux_reclaim_dma_pool(dmux);
>>   	return ret;
>>   }
>>   
>> @@ -879,6 +983,12 @@ static void bam_dmux_remove(struct platform_device *pdev)
>>   	disable_irq(dmux->pc_irq);
>>   	bam_dmux_power_off(dmux);
>>   	bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
>> +
>> +	/* The remote side may still access the pool if it holds its power vote */
>> +	if (!dmux->pc_state)
>> +		bam_dmux_reclaim_dma_pool(dmux);
>> +	else if (dmux->dma_pool_perms)
>> +		dev_warn(dev, "Leaving restricted DMA pool assigned to remote\n");
>>   }
> [Severity: High]
> Can bam_dmux_pc_irq() race with bam_dmux_probe() after devm_request_threaded_irq()
> enables dmux->pc_irq, corrupting dmux->pc_state and causing
> bam_dmux_remove() to prematurely reclaim the DMA pool or leak RX DMA
> resources?
>
> In bam_dmux_probe(), devm_request_threaded_irq() enables dmux->pc_irq before
> irq_get_irqchip_state() and the initial dmux->pc_state check:
>
> 	ret = devm_request_threaded_irq(dev, dmux->pc_irq, NULL, bam_dmux_pc_irq,
> 					IRQF_ONESHOT, NULL, dmux);
> 	if (ret)
> 		goto err_disable_pm;
>
> 	ret = irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LEVEL,
> 				    &dmux->pc_state);
> 	if (ret) {
> 		/* The PC IRQ may already have powered up the RX path */
> 		bam_dmux_remove(pdev);
> 		return ret;
> 	}
>
> 	/* Check if remote finished initialization before us */
> 	if (dmux->pc_state) {
> 		if (bam_dmux_power_on(dmux))
> 			bam_dmux_pc_ack(dmux);
> 		else
> 			bam_dmux_power_off(dmux);
> 	}
>
> Meanwhile, bam_dmux_pc_irq() toggles dmux->pc_state without synchronization:
>
> 	bool new_state = !dmux->pc_state;
> 	...
> 	if (new_state) {
> 		if (bam_dmux_power_on(dmux))
> 			bam_dmux_pc_ack(dmux);
> 		else
> 			bam_dmux_power_off(dmux);
> 	} else {
> 		bam_dmux_power_off(dmux);
> 		bam_dmux_pc_ack(dmux);
> 	}
>
> 	dmux->pc_state = new_state;
>
> If the remote side asserts the PC line right after devm_request_threaded_irq()
> unmasks dmux->pc_irq:
>
> 1. If irq_get_irqchip_state() sets dmux->pc_state = true and bam_dmux_probe()
>     powers on RX before bam_dmux_pc_irq() runs for that rising edge,
>     bam_dmux_pc_irq() computes new_state = !dmux->pc_state (false), powers
>     off RX, and sets dmux->pc_state = false (or irq_get_irqchip_state() can
>     concurrently overwrite dmux->pc_state with false after bam_dmux_pc_irq()
>     sets it to true). When bam_dmux_remove() later checks !dmux->pc_state, it
>     will call bam_dmux_reclaim_dma_pool(dmux) while the remote processor
>     still holds its power vote.
>
> 2. If bam_dmux_pc_irq() and bam_dmux_probe() both see the rising edge and
>     call bam_dmux_power_on(dmux), the second dma_request_chan(dev, "rx")
>     fails with -EBUSY and sets dmux->rx = NULL (leaking the active RX DMA
>     channel), and bam_dmux_power_off(dmux) then skips
>     dmaengine_terminate_sync() and unmaps and frees dmux->rx_skbs[] while RX
>     DMA is still active.
>
> 3. On the new error path where irq_get_irqchip_state() fails and calls
>     bam_dmux_remove(pdev), wait_event_timeout(dmux->pc_wait, !dmux->rx, ...)
>     runs before disable_irq(dmux->pc_irq). If bam_dmux_pc_irq() has started
>     on another CPU but has not yet assigned dmux->rx, wait_event_timeout()
>     returns immediately while dmux->rx is still NULL, disable_irq() waits for
>     bam_dmux_pc_irq() to finish powering on RX and sending bam_dmux_pc_ack(),
>     and bam_dmux_power_off() immediately tears down RX without waiting for
>     the remote side to drop its power vote.
>
> Would requesting dmux->pc_irq with IRQF_NO_AUTOEN, reading the initial
> irq_get_irqchip_state() and powering on if needed, and only then calling
> enable_irq(dmux->pc_irq) avoid these races?

The window between requesting the PC IRQ and reading the initial state
is pre-existing, present since the driver was added, and is not changed
by this series. The new error path is not reachable with the SMSM
irqchip. This is out of scope for this series and can be addressed in
future.

Thanks,
Vishnu

>
> [1] https://lore.kernel.org/r/178996250389.2160803.17277339384338088713@kernel.org
>
