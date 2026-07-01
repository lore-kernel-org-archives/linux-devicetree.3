Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6061F3DEFF0
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898680; cv=none; b=r84HFK+QDP4LsivKpyl02EgobxN6VvVUjWSTz81G0g7JeOxXH1Buie6jR4psb9PLhH/wVUUy2UYm0XTvWbMgpripQ1D+egpWMaIhHuKFnazynuqEcJHHUMpn5bVMADaDD9svmDTcky9fj7eNzF23bS4VNHyl8/gUI9vIHMrnEWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898680; c=relaxed/simple;
	bh=IhViHuiHD+4a/eVxtydhx8UFtN9IIBo2uUmeHl4uCmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bXoaoCTHN4jKASw2iOH8cSTFAGyMTt7Spftkh5tf3EjPEVeLbDxj9uzuhwCH3DBu6BsdTzKUXjiYJsghbnvzZm5uXAZawFkbMSTbohRL53VvFjVIlO68D33yvlhQs3TdBgTp3CO8ToFXotEjy867xuL2C6oFgVkuY3r6D/o3hkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KErIeuBd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YsMVqnfY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KErIeuBd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YsMVqnfY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618G2AO455977
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 09:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dkNSglQHh+DSrxluFJY8Xgw/XVzoYMUDesnUTObiszE=; b=KErIeuBd/daoSoDo
	ZrtlSGcQRj5csk6Thc1M//qNfOV0CqfHXWZPoig8YuaDn161ujoI11E+U3Y6jaTb
	rHI8gqwQpcSvVgX7YaYG3PbGom0IDhAqtWFpja379j9Gs6e4SC9mw4aZZw4RUnMJ
	GzxoAIqBD8jv+7BeZx4MGzX/W2hAbe5XkW7xaqzAigRFnlHRv9pup/MHaUlUXoBh
	Iz0BWg4M35Esuv9ZMofta2QkNfVFJ4xp52xYiw0DKHObcFAofH27NdwvWFtMt7oM
	9pT82fRWFXLq6G5fRILy8cBbM1D4/RYGsvE/10dZlEQ+iVwsfg5IwBd59xqNBi7R
	mjT0BA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwbasx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:37:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847bdf7a7afso106539b3a.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 02:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782898675; x=1783503475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dkNSglQHh+DSrxluFJY8Xgw/XVzoYMUDesnUTObiszE=;
        b=YsMVqnfYSdis5EkD3HYJI36qswg1ArR+fBi5DjbdIerqES2QCRU6gAA5W87OEBnelI
         Val/zuDGYAGOOs82jsXMXGXsgE7sRrKD/akZdFkiWdkv1WhkB2R1P+9vauaDGCOgCDVb
         qovnw8KTyTH6zVuXEFYiVQdh8Xn37vQ5+zZSxzr9dR677iGz0vug/nt2U6Q79dxt2Omk
         lw1lCw0q0oga4iBUbPDkuAwMsuvErVH/WhVbW9g56H87qsLbvDWGcs+BPK52iVL5ClAr
         QZVCSHL2lw1amB87eikn9aBOeDhF6A3FV+6VW34tJGfFzvdmh90E25hVn5XRxTtOoibr
         iaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782898675; x=1783503475;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dkNSglQHh+DSrxluFJY8Xgw/XVzoYMUDesnUTObiszE=;
        b=fcklh9f1UefxRgFuPt2fe++qBTaTDYTRktUtnf5kb7FW+seYoVMGzvgQdC4Y4Jp/Ky
         4ZMsw4cjhkeXrs9zUY/5E3mhXnhrcGbMe/ndis+7KZvi9wD2zmWmnEvyiUovwZjXGURx
         6O0VurRcjfQQwA6I+Sz8dOZ0XHsrWPZTxMzXfCa40TLqnxpCC3ZZlQNJxlGj4TZINHTz
         4f7a2+xKi3tmo1RUgXRO7wjuYCM3Q6J0f350VrRSx5ABfKgELZ0tXEQQfgCpHTi9gw/L
         o4mvz83vuzxTchxQqU/MZWpijG6Lz0RWOZsj8Ww0W+5dlz1124LXKXdOycQ9S49SgBZv
         R6Fw==
X-Forwarded-Encrypted: i=1; AHgh+RoSk+JhXYIS2eiftHbtvosM8qYpp7G9bXXMgL0J8fB/cuR6O2E6ZwlEgHLU09wsgNNcwtwbR7W04vEA@vger.kernel.org
X-Gm-Message-State: AOJu0YwRKBOmSxpqKwAt0C2eJjx2uLYIkx8X0vOjSgTqtMZddnnU/NKe
	wsdKABy5LQrRKr/Z9dsFT8C/6t38pcHXAdyPbGLVsPvbNj+ixbfXu/KGWE5Xfq6EVmSSpmdPq5S
	RZCx2XkXWpyLg5Da/mgqr5dvKqkKCEPOWn/TuJEKEL9NOIoNGw0WOwjNbF4BCJbd1
X-Gm-Gg: AfdE7cnHTizF/s2fR5iRY6hR5jJJf5FOUS7aJ4y41EMFccrN1nI7eK3dKrgNcJOL7lP
	ZJdX2iwmz2fmzEhRXRB11iDmCxGUKMKfB6ZTEQEKNSGBZUJQBXjGiiZmGN7yl25d2hAPlKceP+7
	0Ztjcf/jmbz8i8TKLqP5NCAJ7OCVSKkNH+QaXXU9zeejhcq0U5UFyiWYyNUE0IfasyYe0V1Sgiv
	zuhMWmQaRElUKdJ8bw/uGryL3j2jDIi+uLtqHqRGJaeexm7GRPm9LREHx/0cleAMzMdTWD1sInM
	GeoPF/2COTPycA0b5j16D402gqaIqBX2RZy5FGrIjVU0v7JbIbUz56TzSVyVsCdHDwvWfM6Y035
	L2GyUCyiBAtANVo7zXVuhJDBQYGIUaf7/nbQNc2SJypw57wkIShaQhqT8UvzqZvDWwFqEZyeSIy
	rE
X-Received: by 2002:a05:6a00:2d9b:b0:845:ec35:6d7f with SMTP id d2e1a72fcca58-847c082be1cmr558472b3a.4.1782898675318;
        Wed, 01 Jul 2026 02:37:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d9b:b0:845:ec35:6d7f with SMTP id d2e1a72fcca58-847c082be1cmr558440b3a.4.1782898674611;
        Wed, 01 Jul 2026 02:37:54 -0700 (PDT)
Received: from [10.133.33.21] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fffa4f0sm3710945b3a.19.2026.07.01.02.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 02:37:54 -0700 (PDT)
Message-ID: <83ff7ae0-1804-4528-8897-bc5fc93373f9@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 17:37:48 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
 <20260623-knp-soccp-v7-5-1ec7bb5c9fec@oss.qualcomm.com>
 <20260624080833.wcqaxuhlch7ljp2c@hu-mojha-hyd.qualcomm.com>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260624080833.wcqaxuhlch7ljp2c@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8v6S9lsvmc3gtMhtNn7jovcH7N1UFTbN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5OSBTYWx0ZWRfX8C7qaX6YuW6v
 3NEmpygjsKGGmuH9fi2aRSFEhNqdeY/FohC8bvFfnxzpsNp6NiKNZy7jV0gcbwwYn+TqlAfWE76
 GTLoJ+4bna0Evu6Tr28JIX9EwcsJi3U=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a44dff4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=j2ZC3VUGMi8-CnbsNg0A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8v6S9lsvmc3gtMhtNn7jovcH7N1UFTbN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5OSBTYWx0ZWRfXx9k3O/2TqkGM
 +bx/7loxoGMoM4XbkQuqJr/5LoZ2inl1RUH8WckkX0D/Wtr4W2JzwSalk/iXxV83kdsOJnOawA6
 OFLURDffesVEitJBOglzwtXOqjPKrlH2OXHeLEPRQZtDrUy9nUS07xrLzi4ATjwgmmnA9zlpikP
 ScPnXgcWA3HK5j5Zp3l0WYzh9dbn+B6LY2Nu0s0ze7zbwwrjQkqWnn5VW2greg6HMQLBjCSyt+1
 oWfDO8YXVmGyQ+tZ4uvSTKXUMKHBqDqo0kckEmRgT3xArDEwlDgmOF2lZsL9wSTYXxxVsRTEYnp
 VQKLHXuWteJSbpWJ8ZP6ypME+SGS0gNhzMzIWuzBLof0vJClhYYrp39aFQUd0zUabTns7So6Oag
 SiKgurXJFDMrlG+ugBxGUA0ZsxNhhNkCLYpmzCGgRWM4Fr7QlJsBdkLGuHcltyVltdrTdY9tPtA
 pc7uMD5wSBvy9EKIHow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010099

On 6/24/2026 4:08 PM, Mukesh Ojha wrote:
> On Tue, Jun 23, 2026 at 03:05:21AM -0700, Jingyi Wang wrote:
>> Subsystems can be brought out of reset by entities such as bootloaders.
>> As the irq enablement could be later than subsystem bring up, the state
>> of subsystem should be checked by reading SMP2P bits.
>>
>> A new qcom_pas_attach() function is introduced. if crash state is detected
>> for the subsystem, rproc_report_crash() is called. If the ready state is
>> detected meanwhile stop state is not detected, it will be marked as
>> "attached", otherwise it could be the early boot feature is not supported
>> by other entities or it has already been stopped. In above cases, the
>> state will be marked as RPROC_OFFLINE so that the PAS driver can load the
>> firmware and start the remoteproc.
>>
>> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_common.h   |  6 ++++
>>  drivers/remoteproc/qcom_q6v5.c     |  3 +-
>>  drivers/remoteproc/qcom_q6v5_pas.c | 68 ++++++++++++++++++++++++++++++++++++++
>>  drivers/remoteproc/qcom_sysmon.c   | 19 +++++++++++
>>  4 files changed, 95 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
>> index b07fbaa091a0..b0e7e336d363 100644
>> --- a/drivers/remoteproc/qcom_common.h
>> +++ b/drivers/remoteproc/qcom_common.h
>> @@ -68,6 +68,7 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
>>  					   int ssctl_instance);
>>  void qcom_remove_sysmon_subdev(struct qcom_sysmon *sysmon);
>>  bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon);
>> +bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon);
>>  #else
>>  static inline struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
>>  							 const char *name,
>> @@ -84,6 +85,11 @@ static inline bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon)
>>  {
>>  	return false;
>>  }
>> +
>> +static inline bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon)
>> +{
>> +	return false;
>> +}
>>  #endif
>>  
>>  #endif
>> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
>> index 58d5b85e58cd..a11d8ace554b 100644
>> --- a/drivers/remoteproc/qcom_q6v5.c
>> +++ b/drivers/remoteproc/qcom_q6v5.c
>> @@ -202,7 +202,8 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon)
>>  	q6v5->running = false;
>>  
>>  	/* Don't perform SMP2P dance if remote isn't running */
>> -	if (q6v5->rproc->state != RPROC_RUNNING || qcom_sysmon_shutdown_acked(sysmon))
>> +	if ((q6v5->rproc->state != RPROC_RUNNING && q6v5->rproc->state != RPROC_ATTACHED) ||
>> +	    qcom_sysmon_shutdown_acked(sysmon))
>>  		return 0;
>>  
>>  	qcom_smem_state_update_bits(q6v5->state,
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 808e9609988d..8a0bb4b2e71c 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>>  	int region_assign_count;
>>  	bool region_assign_shared;
>>  	int region_assign_vmid;
>> +	bool early_boot;
>>  };
>>  
>>  struct qcom_pas {
>> @@ -507,6 +508,67 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>>  	return qcom_q6v5_panic(&pas->q6v5);
>>  }
>>  
>> +static int qcom_pas_attach(struct rproc *rproc)
>> +{
>> +	struct qcom_pas *pas = rproc->priv;
>> +	bool ready_state;
>> +	bool crash_state;
>> +	bool stop_state;
>> +	int ret;
>> +
>> +	pas->q6v5.handover_issued = true;
>> +	enable_irq(pas->q6v5.handover_irq);
>> +
>> +	pas->q6v5.running = true;
>> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
>> +	if (ret)
>> +		goto disable_running;
>> +
>> +	if (crash_state) {
>> +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
>> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
>> +		ret = -EINVAL;
>> +		goto disable_running;
>> +	}
>> +
>> +	ret = irq_get_irqchip_state(pas->q6v5.stop_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
>> +	if (ret)
>> +		goto disable_running;
>> +
>> +	if (stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
>> +		dev_info(pas->dev, "Subsystem found stop state set. Falling back to start.\n");
>> +		goto unroll_attach;
>> +	}
>> +
>> +	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
>> +	if (ret)
>> +		goto disable_running;
>> +
>> +	if (unlikely(!ready_state)) {
>> +		/*
>> +		 * The bootloader may not support early boot, mark the state as
>> +		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
>> +		 * start the remoteproc.
>> +		 */
>> +		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
>> +		goto unroll_attach;
>> +	}
>> +
>> +	return 0;
>> +
>> +unroll_attach:
>> +	pas->rproc->state = RPROC_OFFLINE;
>> +	ret = -EINVAL;
>> +disable_running:
>> +	disable_irq(pas->q6v5.handover_irq);
>> +	pas->q6v5.running = false;
>> +
>> +	return ret;
>> +}
>> +
>>  static const struct rproc_ops qcom_pas_ops = {
>>  	.unprepare = qcom_pas_unprepare,
>>  	.start = qcom_pas_start,
>> @@ -515,6 +577,7 @@ static const struct rproc_ops qcom_pas_ops = {
>>  	.parse_fw = qcom_pas_parse_firmware,
>>  	.load = qcom_pas_load,
>>  	.panic = qcom_pas_panic,
>> +	.attach = qcom_pas_attach,
>>  };
>>  
>>  static const struct rproc_ops qcom_pas_minidump_ops = {
>> @@ -526,6 +589,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
>>  	.load = qcom_pas_load,
>>  	.panic = qcom_pas_panic,
>>  	.coredump = qcom_pas_minidump,
>> +	.attach = qcom_pas_attach,
>>  };
>>  
>>  static int qcom_pas_init_clock(struct qcom_pas *pas)
>> @@ -852,6 +916,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>  
>>  	pas->pas_ctx->use_tzmem = rproc->has_iommu;
>>  	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
>> +
>> +	if (desc->early_boot)
>> +		pas->rproc->state = RPROC_DETACHED;
>> +
>>  	ret = rproc_add(rproc);
>>  	if (ret)
>>  		goto remove_ssr_sysmon;
>> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
>> index 913e3b750a86..a0830a48b1f4 100644
>> --- a/drivers/remoteproc/qcom_sysmon.c
>> +++ b/drivers/remoteproc/qcom_sysmon.c
>> @@ -736,6 +736,25 @@ bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon)
>>  }
>>  EXPORT_SYMBOL_GPL(qcom_sysmon_shutdown_acked);
>>  
>> +bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon)
>> +{
>> +	bool shutdown_state;
>> +	int ret;
>> +
>> +	if (!sysmon)
>> +		return false;
>> +
>> +	ret = irq_get_irqchip_state(sysmon->shutdown_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &shutdown_state);
>> +	if (ret) {
>> +		dev_warn(sysmon->dev, "failed to get shutdown_state: %d\n", ret);
>> +		return false;
>> +	}
>> +
>> +	return shutdown_state;
>> +}
>> +EXPORT_SYMBOL_GPL(qcom_sysmon_shutdown_irq_state);
>> +
>>  /**
>>   * sysmon_probe() - probe sys_mon channel
>>   * @rpdev:	rpmsg device handle
>>
>> -- 
>> 2.34.1
>>
> 
> I tested the series on Hawi., it works but unsure about newly introduced
> stop and shutdown status checking why is it required ? I think, you are
> checking this for sanity if it is left some random state by the boot
> loader..

The stop and shutdown status checking is to address a valid scenario
which Stephan brought out in previous comments [1]. The more improved
robustness for rproc_attach fail cases including Ping-pong is at [2].

[1] https://lore.kernel.org/all/ahBG6jKYdSAboWjs@linaro.org/
[2]
https://lore.kernel.org/all/20260623-rproc-attach-issue-v3-0-8e24310707ce@oss.qualcomm.com/

> 
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 


-- 
Thx and BRs,
Aiqun(Maria) Yu
