Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F321B808
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 02:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775529894; cv=none; b=lvPtZarIGpego169RSMHytXDDCfR30CZ/4Xzd6E/Y72Pef6N5GD/whviDNGa9hELYzpSZd5672erCLm84avDgjhTvwgOs2j0swZPH9RujyZTFtU44X//DPhWTUhQtcyIsZiVUc6uPcq6gG2D7DgwFCmXG6njqD8TPy75FnZ7koo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775529894; c=relaxed/simple;
	bh=YTTUS4dKbdrFclyiuTc0LyXDlRM7xWRQBgFkBbr/f0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AI+Ou23IaHsuwtpscFZCAwcFJeRvsBEanNWpcwmsC7T7j0EH+65MiYxNzkNYmhd1KAm/oAfxrQBPhXRZAsGL7ppgMDA3lV7R6K3CrcWwwi2S1vBcaRwBGBWktlhpqpUSyMvoB+fChfw3mL4sd+Rg1TcKx3O+Yln4/FDID4KCYCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQ4QOqIP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVxbjLmi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQ4QOqIP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bVxbjLmi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQAnd1405862
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 02:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jAyngMCsjPzTLmN8SWJDtHWahHL17W+Hc/zSrSVW3hw=; b=AQ4QOqIP9NjjBNcd
	wIbSxpXdWOycqRLqMrynlo3iftndQDWM7X195S1xTnk4jXdHHSX20gWgGUkvkjj1
	IxM4NLprnUDpxACuZMVFDux9EGawO35mKB7sedR5D5uC0vfWjsAYQMb3gkxRvu4w
	gFm6eXkISsZMmn5wpNE1u+GGP34koNdsx4RCODEp+onj9gp0navmLP+3akKwmNbg
	Y9pFlPmJojGiDrUyIvxd8dWtecmpkb5woKTSuHYgofrP9RLU2OKE6oVDM5nJ7obO
	NTdT/Nu6fCcXuOg+UJ+td3xxZogn4cHCddM0EX3wGJwtzhqCwWO5c+bpNqIKU+2C
	jdB6CA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrarq74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 02:44:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b256ed2cc8so50616425ad.3
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 19:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775529892; x=1776134692; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jAyngMCsjPzTLmN8SWJDtHWahHL17W+Hc/zSrSVW3hw=;
        b=bVxbjLmirK5OmWcSyo9zPuipqsP4dnAcY6U9Phyq+S/HyGdSGxt9CwWPH0vcEysCap
         wWFlVTQtJBn+aUtgifYwdIfkZHk7syrz8VPLAqmEepf0/4COY4xF6dUqFDtXi8U4PCzP
         U1DVIasE7sTrD8jCLB9MZnRqGsYBomWymRTlh6ShDfTbACWvc00oZ9iJff9Y6iaZvaOc
         Ymftftx2jZ+LXUwF6zceGOMM+cN4exwQ91IbWhi0L1SR5hJM5hAZJazP/IoZ6WLvd1XH
         L6nZad/NMuzpxAaAqksW3kpsgThExieNZ8TFMuKyFVd4uoIsweBDSq+qiC8Y0ebKgP9g
         0qVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775529892; x=1776134692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAyngMCsjPzTLmN8SWJDtHWahHL17W+Hc/zSrSVW3hw=;
        b=MZmTFFFhPkPDtRHNYfgtwroxIsMbsmM1k2jl7t9mRssLPwMILGmSs5Z6WF1aZtq2jZ
         viSqAKuz6t7mVQ/LSlUBJmt1MfR629KH28J/pjp04DRdsog7IX4/hmioyuba0FJwMu44
         UkQ6VEwiYniFcbmILeyp/Y38ooZtqbun5oYyZrUBHVTeo3slz2S2YE93D55Tb5ivJORe
         XGBw7pcOHVSWcHDKZ11BcPG0fDsE2sz4WR1iBsTea1Pu1gZAx42ungd/xnkUrtaKzpH8
         6uIEirebM2Ddqzkw6EvZOi5CdaiSx7eIVHEbWVQvIKggZ5n64+CFAwtaCUoSLgCTMWYe
         d/Kg==
X-Forwarded-Encrypted: i=1; AJvYcCXBovACgwT+0t+F8/2GPmw65J2AuwEcVInSuHleoJiSwAKVw3Ni3SLrK18NMWgzM7c294hellmDDXPP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3rn4NPVWFVh8CsWxFk7C/GTDTjMfAhOD4dnLNtCVGLO9jgO6t
	csi+Nkp/k+ABweJuVElDofV4vB8m8lHlossZhDKLoAlE2eShs/VlDB683icqZ9Cb7XJtHIm8P2z
	J7Obhdfjh0aATiLsUnG2TefdCAkLC+qMaT50ci5GjrsiYPhNNbg/wgqe7bSVTCpfo
X-Gm-Gg: AeBDievWXsKboQYj3Jx66FdCKghVl8JnCEs2iyv6Qv9+f4R6943KiGQx8Y3J6aMP7CF
	kZYgImutAvwZXDQlytKuS0YcpH7l7Klg1hz8lCEsu6xszkIvDHmMczG1UKjd/UpHp5WbXSuoCjf
	gCBHvF4PVMvmMqdsug7kjGD2/8FtsimEySynzsUAJTwQaxRK/K1yOL/vOxp65I14QeC8evDrRU/
	qZyfr0srgrzzD82BF24Q3ppjlFGIpCpicxAd+KLBUP6v6xvfmzprgv2nPKGgfXUMNeXbRjqH5Vs
	1Fu7y7WD0xYAE/rCSwiTM6i5e8VBYKagElOq6l7JLMNjQqQGduW3s3hBClnQfBIozexbxAEnrFO
	noqcv7B2Nm88jLBt/76+zR2gSiSvmipp8KifUgVELw5HpqMM2z7dIZ5x9/i04XblvG2LAo/vj0C
	sxQZTYOgDJaFB9wDuh
X-Received: by 2002:a17:902:e546:b0:2b0:6e8f:8e73 with SMTP id d9443c01a7336-2b281926350mr156600855ad.44.1775529892095;
        Mon, 06 Apr 2026 19:44:52 -0700 (PDT)
X-Received: by 2002:a17:902:e546:b0:2b0:6e8f:8e73 with SMTP id d9443c01a7336-2b281926350mr156600435ad.44.1775529891436;
        Mon, 06 Apr 2026 19:44:51 -0700 (PDT)
Received: from [10.133.33.209] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274756621sm151304355ad.20.2026.04.06.19.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 19:44:51 -0700 (PDT)
Message-ID: <cb6c9710-3fa5-4113-aef7-d2cf2bef5214@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 10:44:45 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-6-0a91575e0e7e@oss.qualcomm.com>
 <adPI2w5tVGCdo_x3@baldur>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <adPI2w5tVGCdo_x3@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wxWFGUz0d1oiwEu-pFgSmvtMdqNhXqY9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAyNCBTYWx0ZWRfX72JkF28k8roK
 Jo0LdhEa8hn2ITKaBVYcI0BrM9f/toG7JqhyU6VEQ1lmyWPlxcTZ0joB2bN3XRZboW7qSFvVQHN
 z6sVxYurnHUw7t2ffHy7vceZqWHWCNjkJpDxDSrNJoD/mHlOkNonVcWWBPNSvp8/inFD37AiPtB
 YYDB6SIFBq/zUPUqCvxKOJiyHNRJuDfHIkuAGEYCyIXPAjI8YlikJQww2LFOUYfbS+VIbNNvSsQ
 dK33nO+bjzQ0orftfjGy9pZg8K7fsa7uctcZM//FQPVfObph+BM3fFrXYalo++lSlkZZMmBoqep
 k/1CNQxnHOypfPBCBbkj383O3V3+qJmJiGd89p435rIH9fNEUKaAd7w6MWl/vUAdKscEiG7roRX
 Yz5XJ0vKMGa2gvX7N7BcOc6+LcnCi7RhqSx1exaU7ZREphf5BBdRBgA33wpnfGuZeAo+nfKACWB
 kRwaenn5o6jb1gTqidQ==
X-Proofpoint-GUID: wxWFGUz0d1oiwEu-pFgSmvtMdqNhXqY9
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d46fa4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tektXMGjzHmvKWkVxE8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070024



On 4/6/2026 10:59 PM, Bjorn Andersson wrote:
> On Tue, Mar 10, 2026 at 03:03:22AM -0700, Jingyi Wang wrote:
>> From: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>>
>> Subsystems can be brought out of reset by entities such as bootloaders.
>> As the irq enablement could be later than subsystem bring up, the state
>> of subsystem should be checked by reading SMP2P bits and performing ping
>> test.
>>
>> A new qcom_pas_attach() function is introduced. if a crash state is
>> detected for the subsystem, rproc_report_crash() is called. If the
>> subsystem is ready either at the first check or within a 5-second timeout
>> and the ping is successful, it will be marked as "attached". The ready
>> state could be set by either ready interrupt or handover interrupt.
>>
> 
> The whole use case of early booting SoCCP is to get the charger and USB
> Type-C running early - so that charging and USB Type-C works in UEFI.
> 
> If SMP2P indicates that it was booted, but it's still not there...then
> there's no reason to wait another 5 seconds - it's not there.
> 
>> If "early_boot" is set by kernel but "subsys_booted" is not completed
>> within the timeout, It could be the early boot feature is not supported
>> by other entities. In this case, the state will be marked as RPROC_OFFLINE
>> so that the PAS driver can load the firmware and start the remoteproc. As
>> the running state is set once attach function is called, the watchdog or
>> fatal interrupt received can be handled correctly.
>>
>> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> [..]
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> [..]
>> +static int qcom_pas_attach(struct rproc *rproc)
> [..]
>> +	if (!ret)
>> +		ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
>> +					    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
>> +
>> +	/*
>> +	 * smp2p allocate irq entry can be delayed, irq_get_irqchip_state will get -ENODEV,
> 
> This on the other hand, sounds like a bug in the smp2p driver. If we can
> acquire the interrupt without getting EPROBE_DEFER, then we should not
> get -ENODEV when reading the irq state.
> 
>> +	 * the 5 seconds timeout is set to wait for this, after the entry is allocated, smp2p
>> +	 * will call the qcom_smp2p_intr and complete the timeout in the ISR.
> 
> If this indeed is the problem you're working around with the 5 second
> delay - then stop. Fix the issue instead!
> 
> Also, this comment conflicts with the reasoning for the ping and the 5
> second thing in the commit message.
> 
> Regards,
> Bjorn
> 

It is a design in downstream code to avoid the irq is not received when
we check the irq state, but indeed it seems like a redundant design and
I didn't see the delay in the test for the soccp attach. So we will remove
this 5 seconds wait in next series.

Thanks,
Jingyi

>> +	 */
>> +	if (unlikely(ret == -ENODEV) || unlikely(!ready_state)) {
>> +		ret = wait_for_completion_timeout(&pas->q6v5.subsys_booted,
>> +						  msecs_to_jiffies(EARLY_ATTACH_TIMEOUT_MS));
>> +
>> +		/*
>> +		 * The bootloader may not support early boot, mark the state as
>> +		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
>> +		 * start the remoteproc.
>> +		 */
>> +		if (!ret) {
>> +			dev_err(pas->dev, "Timeout on waiting for subsystem interrupt\n");
>> +			pas->rproc->state = RPROC_OFFLINE;
>> +			ret = -ETIMEDOUT;
>> +			goto disable_running;
>> +		}
>> +
>> +		/* Only ping the subsystem if ready_state is set */
>> +		ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
>> +					    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
>> +
>> +		if (ret)
>> +			goto disable_running;
>> +
>> +		if (!ready_state) {
>> +			ret = -EINVAL;
>> +			goto disable_running;
>> +		}
>> +	}
>> +
>> +	ret = qcom_q6v5_ping_subsystem(&pas->q6v5);
>> +
>> +	if (ret) {
>> +		dev_err(pas->dev, "Failed to ping subsystem, assuming device crashed\n");
>> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
>> +		goto disable_running;
>> +	}
>> +
>> +	pas->q6v5.handover_issued = true;
>> +
>> +	return 0;
>> +
>> +disable_running:
>> +	pas->q6v5.running = false;
>> +
>> +	return ret;
>> +}
>> +
>>   static const struct rproc_ops qcom_pas_ops = {
>>   	.unprepare = qcom_pas_unprepare,
>>   	.start = qcom_pas_start,
>> @@ -518,6 +603,7 @@ static const struct rproc_ops qcom_pas_ops = {
>>   	.parse_fw = qcom_pas_parse_firmware,
>>   	.load = qcom_pas_load,
>>   	.panic = qcom_pas_panic,
>> +	.attach = qcom_pas_attach,
>>   };
>>   
>>   static const struct rproc_ops qcom_pas_minidump_ops = {
>> @@ -823,7 +909,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>   	pas->proxy_pd_count = ret;
>>   
>>   	ret = qcom_q6v5_init(&pas->q6v5, pdev, rproc, desc->crash_reason_smem,
>> -			     desc->load_state, qcom_pas_handover);
>> +			     desc->load_state, desc->early_boot, qcom_pas_handover);
>>   	if (ret)
>>   		goto detach_proxy_pds;
>>   
>> @@ -855,6 +941,15 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>   
>>   	pas->pas_ctx->use_tzmem = rproc->has_iommu;
>>   	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
>> +
>> +	if (pas->q6v5.early_boot) {
>> +		ret = qcom_q6v5_ping_subsystem_init(&pas->q6v5, pdev);
>> +		if (ret)
>> +			dev_warn(&pdev->dev, "Falling back to firmware load\n");
>> +		else
>> +			pas->rproc->state = RPROC_DETACHED;
>> +	}
>> +
>>   	ret = rproc_add(rproc);
>>   	if (ret)
>>   		goto remove_ssr_sysmon;
>> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
>> index c27200159a88..859141589ed7 100644
>> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
>> @@ -1011,7 +1011,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem, NULL, NULL);
>> +	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem, NULL, false, NULL);
>>   	if (ret)
>>   		return ret;
>>   
>>
>> -- 
>> 2.25.1
>>

