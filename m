Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3B41A2C04
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 06:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775887466; cv=none; b=doBE7AnK2WRMOzvx69DRd95yIN9+PWRJlge2K+rG8XRhY34Xcx3HlPOLKOaOKwnwNGwdpxaiv+OnF6kEW8RwN3RcliUdm35a0DQfvczsWfX9qRTqxv2hzWi2WWEhgxeWRVcxWG+ttR9g0zHXcEHhk8RHaVkT8+mUYQON8V3fcYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775887466; c=relaxed/simple;
	bh=leoX91N0hGjzkz7DHrAudWywmbfdQiKODCjCk+R2eo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nKm8uavoKagxZFKBQJPOXswUmGFgTg/OkWFtaQA7f+in/vsVHI/qZXElrcBYn126RCXU2GprT3XtLX3M7NSgellmNf72Fxj1LRg3qdSPGKkm5o8w2fqDwbtf2VnUZebhTQ4urfiZnZbpfoXWWsg/XBlgeiy10ISlOY9aYyQ4EbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BETG5v7+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZwgAlyk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BETG5v7+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZwgAlyk"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B4lPcj1836090
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 06:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vp8GIUTb40BDitATSOBzARgxQcpi+zKAPKLqD7NwSW4=; b=BETG5v7+hpuF1lOW
	AyaEK+L2c2rFdTo5PxJ4MqAjcezxfiQPWeDzMf0YmeDds5GGL8uK0HThXQr2LtVw
	XBCtGLTUPbzcLcI3CISmV7Seg2LBee0vnaRt4dh2GLNnYH+TF8hEI90KVon7Mw1m
	zSm6Yeb/x17rsRHSxxRjY1JDVs9u1FzpeDkx0LMHrFQ6o9f/+ixKrIGqgkze04Do
	JIy6GWpCdlrXJkIugBxEe2/Ar31BUNIEc1kF750OwER9CcuusgGOepQ6DogUktMN
	v/IutyX+E2EGbXjJwrchkPdIT7g2IH3D6Q8pFhPQiPB9kN6Lj4NkLnexe6+CSCIX
	wjkTHg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffk6g47h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 06:04:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da1c703d1so3222071a91.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 23:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775887464; x=1776492264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vp8GIUTb40BDitATSOBzARgxQcpi+zKAPKLqD7NwSW4=;
        b=iZwgAlykmcnnnfrvnfg2nDVqdtIF/fpQxi1O8R2atlZiJW97+m3ICruK+/hLYnyZYc
         GX0LSCQo6yuJ2W84JR8DeRkXn0qP806bRUOpJXeKWfIUqunY/+iBybmnPHGhra6zYmlK
         Lgb8Acgy/cKpNKVFQmnMpt/KGtSzXQrbARo+YxH8lsH185NB9ycZefKi//NHKmTaP7d0
         P25iBBnKmhsc2+j/u94Oy9pZwaF8dycVVKhLHKS0xf8j6nD7HVApjFLh9sM3SmVGtr8W
         j9TOOVHebjvOTg9ToZGj+H8DOW4bSrt0U2CmW0KxrIiGvTCCN1Si95FhpAUaEMIKGFBq
         SBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775887464; x=1776492264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vp8GIUTb40BDitATSOBzARgxQcpi+zKAPKLqD7NwSW4=;
        b=MSfJ4zDyQPeHGyb4BLSyZYmFoBrffyUlP3XtDbMtsH6mDAivtN0wi3Pa4fOUqL8zWe
         E5p4rKg+Ou9KwpuRqwlMQ7E/FP1ZMdFItxZBVgVmBVB3i0fCA5ov34QYiD5/zhN/+vTp
         nPlskvwynRgyBxr9vDzNj94wP3MEy74qkd7nm2bDTKm5G932vhh2DqiBgAQybdzntAYY
         g66nse/Na5ZOrDSpGb6bV9qN3RpsuiJudZtLsxXF/qHALOoe3SNfFF9GtXgMQa1HLyCm
         WDe/qseeq4PUUlVtx8aRSRSmIAlNr+zyCbTeGZCKBkBH1VRkDth6SHWn0toRb2Sfxrub
         V9AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE3GbJjM3vh3YIlgckhShH+L2sdfbNCu7SnIY8P4XamGY3cnD5x/Y0n4Ao7wTMj5mZon85i0XfhICg@vger.kernel.org
X-Gm-Message-State: AOJu0YxmWw//iLRsAqIUxw/cWVU2s4Y0x5iUXd7KSWpOTnkKPJLIn2SE
	Ljg3z13P8Y90qqa1YZ2C38sm1DQRMSf7BkeOK1f6eOW32vYzUCEUkfd0Yoy9k0fLYS1ULTcSlc/
	249IWepn2m8TCvxNGeR+xQNClkxb0631MhZbM97KumMs1WZrkTR3h/eK/9FS4XMD4
X-Gm-Gg: AeBDiesDfSX7WdEuo4D9TsBxNElbPwk6YgDiiucPxmWJvsOTGOrpz3kZjR14Hp+gSVH
	CXEoRJEULamjM6dnpNEdmem/f7yhNCojA/s3tQNUAfcOlgi8+Je2lvoY0nZZoTsE4yOMQEY13w1
	Diw29UvUhWqChzE8LWx7p98OHUxKKfMfL2IE+dtDmIoEseTOCpV4R2pgMtTZoEbLCp0Gx14z5Xj
	yhaJOjS75jQbVWY13bDd8ERnO2XIG5DoAeQyr6KYoQLwwQ5K/yMNxWz0LPhjBImEzRUfqKkHXQt
	93Tlt51oEAAxlI02p+Uc/njPjLJHKhpoNyZPEoNAOFc0ks/qi72yMoEmi/PfaVwbHBvaP6azJob
	ZeVxO01jg5BTHrwCN+rm1L7UMamiPZaFMB2SPKSUYlObAXTFBWVx0fO9cFDw2HqCpK2EVe/B82c
	dwkD6HfCyfEg==
X-Received: by 2002:a17:90b:2d07:b0:35d:a3b4:2f0d with SMTP id 98e67ed59e1d1-35e4274e1damr5727820a91.6.1775887463295;
        Fri, 10 Apr 2026 23:04:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2d07:b0:35d:a3b4:2f0d with SMTP id 98e67ed59e1d1-35e4274e1damr5727781a91.6.1775887462566;
        Fri, 10 Apr 2026 23:04:22 -0700 (PDT)
Received: from [10.133.33.83] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e42e143d8sm2058886a91.4.2026.04.10.23.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 23:04:22 -0700 (PDT)
Message-ID: <ca268d5a-f55b-4f6f-ad35-1f856446c261@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 14:04:13 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
 <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDA0MSBTYWx0ZWRfXyX3HMm8rMmW0
 b3tGNGXze4AHS5G8HKWdvUdM27+lOT70qGFL+SiLilw9L2+fsz2YfItYQKRoR6DR8EvNUSt/orb
 F5cxhmbPAKNWep5xmC2hCYiJEqON5r3j/SS4aBhI4gv0M7a5fxww9SU/s/hYDAFa59kzyNJFWw9
 vUA7ZGhmeQbfycJw6PxS54mQIUSRX/8EeyMA4g89ETfMDp/bpXFuQRbg2yWVcxf5S6XXFOvo1SO
 P19ldIXL164vbzCk6iA0YLfhlGsaJf+9BOYZDlO4kgGpH82QHzlBQPtee/52DoSO/e6WFpwludU
 ujWdwhU/tar0l7/KgDHQ7JdTSE0ml5/2aIKp1hhoezGDiA3uxRsE4pSY1vAyph8oQcAdgsJsfjS
 AteP1tgz/mMRIGCK/rPUbh3ukrFApKFd6Z346fkZltXHbHiyZfDtha8jWFiSenaIrXJuBDdmNo7
 xWJSDwFXEpTB8wb4+fA==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69d9e468 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1_lOvLO235_I7qwuQ8cA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: gDbRy4a9YOSoeP5dWd_ov3MTNy-wIk43
X-Proofpoint-ORIG-GUID: gDbRy4a9YOSoeP5dWd_ov3MTNy-wIk43
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110041



On 4/9/2026 4:52 PM, Jingyi Wang wrote:
> Subsystems can be brought out of reset by entities such as bootloaders.
> As the irq enablement could be later than subsystem bring up, the state
> of subsystem should be checked by reading SMP2P bits and performing ping
> test.
> 
> A new qcom_pas_attach() function is introduced. if a crash state is
> detected for the subsystem, rproc_report_crash() is called. If the
> subsystem is ready and the ping is successful, it will be marked as
> "attached". If ready irq is not received, it could be the early boot
> feature is not supported by other entities. In this case, the state will
> be marked as RPROC_OFFLINE so that the PAS driver can load the firmware
> and start the remoteproc.
> 
> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>   drivers/remoteproc/qcom_q6v5.c     | 69 ++++++++++++++++++++++++++++++++
>   drivers/remoteproc/qcom_q6v5.h     |  6 +++
>   drivers/remoteproc/qcom_q6v5_pas.c | 80 ++++++++++++++++++++++++++++++++++++--
>   3 files changed, 152 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index 58d5b85e58cd..52247c17c38a 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -20,6 +20,7 @@
>   
>   #define Q6V5_LOAD_STATE_MSG_LEN	64
>   #define Q6V5_PANIC_DELAY_MS	200
> +#define Q6V5_PING_TIMEOUT_MS	500
>   
>   static int q6v5_load_state_toggle(struct qcom_q6v5 *q6v5, bool enable)
>   {
> @@ -234,6 +235,74 @@ unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
>   }
>   EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>   
> +static irqreturn_t q6v5_pong_interrupt(int irq, void *data)
> +{
> +	struct qcom_q6v5 *q6v5 = data;
> +
> +	complete(&q6v5->ping_done);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5)
> +{
> +	int ret;
> +	int ping_failed = 0;
> +
> +	reinit_completion(&q6v5->ping_done);
> +
> +	/* Set master kernel Ping bit */
> +	ret = qcom_smem_state_update_bits(q6v5->ping_state,
> +					  BIT(q6v5->ping_bit), BIT(q6v5->ping_bit));
> +	if (ret) {
> +		dev_err(q6v5->dev, "Failed to update ping bits\n");
> +		return ret;
> +	}
> +
> +	ret = wait_for_completion_timeout(&q6v5->ping_done, msecs_to_jiffies(Q6V5_PING_TIMEOUT_MS));
> +	if (!ret) {
> +		ping_failed = -ETIMEDOUT;
> +		dev_err(q6v5->dev, "Failed to get back pong\n");
> +	}
> +
> +	/* Clear ping bit master kernel */
> +	ret = qcom_smem_state_update_bits(q6v5->ping_state, BIT(q6v5->ping_bit), 0);
> +	if (ret) {
> +		dev_err(q6v5->dev, "Failed to clear master kernel bits\n");
> +		return ret;
> +	}
> +
> +	return ping_failed;
> +}
> +EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem);
> +
> +int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev)
> +{
> +	int ret = -ENODEV;
> +
> +	q6v5->ping_state = devm_qcom_smem_state_get(&pdev->dev, "ping", &q6v5->ping_bit);
> +	if (IS_ERR(q6v5->ping_state)) {
> +		dev_err(&pdev->dev, "Failed to acquire smem state %ld\n",
> +			PTR_ERR(q6v5->ping_state));
> +		return PTR_ERR(q6v5->ping_state);
> +	}
> +
> +	init_completion(&q6v5->ping_done);
> +
> +	q6v5->pong_irq = platform_get_irq_byname(pdev, "pong");
> +	if (q6v5->pong_irq < 0)
> +		return q6v5->pong_irq;
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, q6v5->pong_irq, NULL,
> +					q6v5_pong_interrupt, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +					"q6v5 pong", q6v5);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to acquire pong IRQ\n");
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem_init);
> +
>   /**
>    * qcom_q6v5_init() - initializer of the q6v5 common struct
>    * @q6v5:	handle to be initialized
> diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
> index 5a859c41896e..5025ffc4dbe8 100644
> --- a/drivers/remoteproc/qcom_q6v5.h
> +++ b/drivers/remoteproc/qcom_q6v5.h
> @@ -17,22 +17,26 @@ struct qcom_q6v5 {
>   	struct rproc *rproc;
>   
>   	struct qcom_smem_state *state;
> +	struct qcom_smem_state *ping_state;
>   	struct qmp *qmp;
>   
>   	struct icc_path *path;
>   
>   	unsigned stop_bit;
> +	unsigned int ping_bit;
>   
>   	int wdog_irq;
>   	int fatal_irq;
>   	int ready_irq;
>   	int handover_irq;
>   	int stop_irq;
> +	int pong_irq;
>   
>   	bool handover_issued;
>   
>   	struct completion start_done;
>   	struct completion stop_done;
> +	struct completion ping_done;
>   
>   	int crash_reason;
>   
> @@ -52,5 +56,7 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
>   int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
>   int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
>   unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
> +int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5);
> +int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev);
>   
>   #endif
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index da27d1d3c9da..34b54cf832d0 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>   	int region_assign_count;
>   	bool region_assign_shared;
>   	int region_assign_vmid;
> +	bool early_boot;
>   };
>   
>   struct qcom_pas {
> @@ -423,9 +424,15 @@ static int qcom_pas_stop(struct rproc *rproc)
>   
>   	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>   
> -	handover = qcom_q6v5_unprepare(&pas->q6v5);
> -	if (handover)
> -		qcom_pas_handover(&pas->q6v5);
> +	/*
> +	 * qcom_q6v5_prepare is not called in qcom_pas_attach, skip unprepare to
> +	 * avoid mismatch.
> +	 */
> +	if (pas->rproc->state != RPROC_ATTACHED) {
> +		handover = qcom_q6v5_unprepare(&pas->q6v5);
> +		if (handover)
> +			qcom_pas_handover(&pas->q6v5);
> +	}
>   
>   	if (pas->smem_host_id)
>   		ret = qcom_smem_bust_hwspin_lock_by_host(pas->smem_host_id);
> @@ -510,6 +517,63 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>   	return qcom_q6v5_panic(&pas->q6v5);
>   }
>   
> +static int qcom_pas_attach(struct rproc *rproc)
> +{
> +	int ret;
> +	struct qcom_pas *pas = rproc->priv;
> +	bool ready_state;
> +	bool crash_state;
> +
> +	pas->q6v5.running = true;
> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
> +
> +	if (ret)
> +		goto disable_running;
> +
> +	if (crash_state) {
> +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> +		ret = -EINVAL;
> +		goto disable_running;
> +	}
> +
> +	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
> +
> +	if (ret)
> +		goto disable_running;
> +
> +	if (unlikely(!ready_state)) {
> +		/*
> +		 * The bootloader may not support early boot, mark the state as
> +		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
> +		 * start the remoteproc.
> +		 */
> +		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
> +		pas->rproc->state = RPROC_OFFLINE;
> +		ret = -EINVAL;
> +		goto disable_running;
> +	}
> +
> +	ret = qcom_q6v5_ping_subsystem(&pas->q6v5);
> +
> +	if (ret) {
> +		dev_err(pas->dev, "Failed to ping subsystem, assuming device crashed\n");
> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> +		goto disable_running;
> +	}
> +
> +	pas->q6v5.handover_issued = true;
> +
> +	return 0;
> +
> +disable_running:
> +	pas->q6v5.running = false;
> +
> +	return ret;
> +}
> +
>   static const struct rproc_ops qcom_pas_ops = {
>   	.unprepare = qcom_pas_unprepare,
>   	.start = qcom_pas_start,
> @@ -518,6 +582,7 @@ static const struct rproc_ops qcom_pas_ops = {
>   	.parse_fw = qcom_pas_parse_firmware,
>   	.load = qcom_pas_load,
>   	.panic = qcom_pas_panic,
> +	.attach = qcom_pas_attach,

Possible issue in the future here. The kaanapali_soccp_resource does not 
set minidump_id, so this is not triggered today, but it is a latent bug 
for any future device that sets both early_boot and minidump_id.

qcom_pas_attach is added to qcom_pas_ops but not to 
qcom_pas_minidump_ops. When a device with minidump_id set uses the 
minidump ops table, the .attach pointer is NULL. rproc_attach_device() 
checks if (rproc->ops->attach) before calling it, so the attach callback 
is silently skipped. For a device with early_boot = true and minidump_id 
!= 0, the state is set to RPROC_DETACHED in probe, but the attach logic 
(crash check, ready check, ping) is never executed, leaving the 
subsystem in an inconsistent state.

Thanks,
Jie

>   };
>   
>   static const struct rproc_ops qcom_pas_minidump_ops = {
> @@ -855,6 +920,15 @@ static int qcom_pas_probe(struct platform_device *pdev)
>   
>   	pas->pas_ctx->use_tzmem = rproc->has_iommu;
>   	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
> +
> +	if (desc->early_boot) {
> +		ret = qcom_q6v5_ping_subsystem_init(&pas->q6v5, pdev);
> +		if (ret)
> +			dev_warn(&pdev->dev, "Falling back to firmware load\n");
> +		else
> +			pas->rproc->state = RPROC_DETACHED;
> +	}
> +
>   	ret = rproc_add(rproc);
>   	if (ret)
>   		goto remove_ssr_sysmon;
> 

