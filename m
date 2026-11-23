Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413787;
	b=ay5h3YUXuga7217qymdn7U+7w6t3zypYWIyS7lk/T92OD+jpLOjK3MFO3AT8rviFeTG0
	 1OIWjNEyeebgjqDaAx80WEP2CBf9GRJexQwQRqqcVOuaCti+T7FHOyCEFuUpxnVmMWRrl
	 ruEa7K7xiLSXC+gG0BHgqCZ/h/P8pJCQFLoqsqpstM382rOz6j19vWlqIkPW74Dp98oMm
	 UaFUzv+6z9npLdYp5hWnFGqiqe/UizpmY8CGNQwqv728g++6wwjyw24vE1TwR+8oc4cLN
	 CFGOgvkY7msimkCxu87QPh5WEtRES1pcVBv5XCPtS5CFI1aLq7bpcl+DWWwwPXPiGiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413787;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5IDgReFQA2vWDiUnvoHTagyG1mytZGfUwD0jbnlahlY=;
	b=D14th4E+JnWlKBbBNXq1GAZbzm3VA/H2Yt0ykQyYnXVf0iQjwtZizn5VC0MAKSsQJVvU
	 i6pRhgE/g9Ec7dhaGPHjDsn2u39xBAeF9PpRJQqAL5GtARnlw+wIOGyOewx+vitJojoB/
	 k3RgRFseDg7IFAae0WVAuVzo7fWINAiSGiFkYuRJnLucAc50y3TsNaTZh+kHhEX6gpOOZ
	 tGDro9EWYgZTycGa3vJHqYuutvNSbfe+TgGZhn6ankc6le5LczLtOxzhcueeTsvScOsBV
	 Ei7FKkhemb+qYteanGt2+3CiHS1Oj8IqDfwnOdXOohfOCRCF0GLfmaIGKNLRKFDkPXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="UQH//AXu";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dtHwMEjG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63473606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63473606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UQH//AXu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dtHwMEjG
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN51L6i1265322
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5IDgReFQA2vWDiUnvoHTagyG1mytZGfUwD0jbnlahlY=; b=UQH//AXuHFDcMGY9
	i+8SvVLh+VQRzl+8kTdEJIWwGVduX9zad2EuVU5FDBdCdrrSMY/BK0A+SjUCMHru
	oS8oe/wilNUZWDskM29SCm8jtgX2Knr6SyL69UeTPdCrxrxa+23fJl/+Isp7xnm0
	Z90jYQvL9Eo/j/s5jSj4LX6Os0ApSy8yVJWG2YQv8b0FJ9LJyH50M/2qmUYAj3n+
	viK886wf1NfLbCdSXu2UV5opl+pQeQ2i2ytvRuso/vxrs/+irTGdoo3Y2fTB3Zv1
	ZDXyEj97NulA6lgBDGMOvkK8m9UGSzykECT13nHVLuuEeELThN1JIgDJpZrIJvc1
	Qn5xkw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33h35cw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:03:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdacb64970bso1757305a12.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 22:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795413786; x=1796018586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5IDgReFQA2vWDiUnvoHTagyG1mytZGfUwD0jbnlahlY=;
        b=dtHwMEjGXsFFzSLfDPzVIUvRwUB2omVtz/gV0OmBjWrenPTTBRY4jSFt52df8rj1gD
         x1q26GOHg19sfcZ432fFCM9SmFFir+ykX7pK5fIC/oaYP/1RV3k4+NfVL5Q2mucXfGGH
         PYJ2QihjF/4X2/GZMyRRpM3BgXSHr5dUHuQYA4gfkgm68rDmPu0GlsQzBOA0j4qNLD7k
         80bsQ+c5+QLgk3WFXI7taVNiHxZC2XeCk+PylrP3MI9hdIAZ6N2eZ6wLuVeFBrihQrmN
         utiivSc681SfksJfAsvG2Lq8N+UAAgUr+khXZSSDzRfMYIJg4KKOxuHn6XRB4m17MCBb
         asHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413786; x=1796018586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5IDgReFQA2vWDiUnvoHTagyG1mytZGfUwD0jbnlahlY=;
        b=ZOzxuq5sGVofKvtarKPPG2w6ZaUrmc3Ca2sNlaJ5S5eZeZajmvg5fG2BihndRsDbtn
         ja29sCDT/Z5vjgF5qLsN10Zazivd4B7DUcJ6hBOpybKn0jLipsmtlgwSQXe/FrqkbHBf
         gZMfqIsBtFDuPmEt58XiQn2fp3UvoNxKbLa5P4vsUz1TZooaODiU3PqiJONbUNIYxH9M
         B2AyzNsp4EFLEvozz8SMTyMpbhsL5FWMXFYQ9HNdMr8S2sDTya+Il1PbXBlj5YAanMp+
         t51Nl9A4G7byPxwj8CNkS2c2KsoA352l0jA+f5ksr46TFh1kHzgNKHhEZdIRgb6tuKbE
         awiA==
X-Gm-Message-State: APuU4Z/gxLQhvoyBzWVR7bvNK4IFuZ/kaVFXffEDPkLZprsxsc7QXOUS
	T0QrTDezOfEYQ0g3N9KlS9Cr0qAA4n5WRFe6AB/0bCvxt8kBsyggcvRjqDQKbSC14t/wU4tfRzH
	kobPDHh0Oel8R95w01EfYxzfuVdxiAU+Uw5XTFhDC/5GWhvj0q1wo+OPOluLMaF1C
X-Gm-Gg: AZFdTZdD7VaiinItfTenvVR+Lbpl9wF/ybzT6XzOh5fH8BHBzpj3c0SOemYG+XnaMpk
	JuNgqLJALA6k6d1td7D9RdF3bjHhTgsjj8RwWtGqoqNlgOUK1AE4rgVn0fCyWHmjxvNuYMQa/+s
	SEVAAoG+FlRvc5vfM4UCeyal16/o0u2sztctunPOlLmhJ2gghrCrU+Xz4Br3eOQtL6eKguTl/3v
	gZPeRnR/gU8InRwo/lUUvDRuU4fYucrCKMwG0ji1AehSBMvE0WLqYRhbKIfZjUUl9+4QvJpzmm+
	aZf5cho04tJzj8ht2hnOUL4MGnxx+85UEdw1ntlMn/tofYAvszTM5/KRjdgYqpSC1UZAO7WkECv
	s7+KJvR5djauBnvpHE6OuPk8iU/US1+9b1PMYTxm1qqfmc+TzKVAog08JPukqbSSLSjTNa35ma5
	gTcWhELP7QtbAY9975feW/r+v9aXaKZz+Qq76a24sV2lweAlaW4gKj7PDvrStH
X-Received: by 2002:a05:6a21:4cc1:b0:3e0:dbf5:59f1 with SMTP id adf61e73a8af0-4014e6565eemr9235073637.91.1795413785762;
        Sun, 22 Nov 2026 22:03:05 -0800 (PST)
X-Received: by 2002:a05:6a21:4cc1:b0:3e0:dbf5:59f1 with SMTP id adf61e73a8af0-4014e6565eemr9235061637.91.1795413785267;
        Sun, 22 Nov 2026 22:03:05 -0800 (PST)
Received: from [10.79.117.37] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077babfsm4983851b3a.5.2026.11.22.22.03.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 22:03:04 -0800 (PST)
Message-ID: <e2adf88a-ecf1-4f00-8ecd-db925f3189af@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:33:01 +0530
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
Subject: Re: [PATCH v3 3/4] remoteproc: qcom: pas: Add coredump support for
 secondary processors
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
 <20261118-oob-support-glymur-v3-3-2cbdfe208d56@oss.qualcomm.com>
 <sashiko-outbox-221408@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-221408@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EsxHPicA c=1 sm=1 tr=0 ts=6b03d71a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F5Z3lxpYoBKdc1g0_kUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: I7c-l7yzMb-0pMOo9U4Z-dAczv8yPSL7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX+qgjam0p8Elh
 NuWhtr558tbbsiTttJ+MjgE3vGo+yv5qWJPn1fN9a0l+Mdq39wk/vzTwg1yspvNmKylDoKqlY4H
 AuyeLSJHFjbWMGeny8HvuXM45gwraOvh7eagXdJqPs7evwU9mMUCo61FucWBagiRVQrb2fXucpu
 fBG4ddBj9qYfdp81p9xke9RHSZ64M8aI0HE05rQpDsfcUPrOG/X1iX19ZHt1Fk37G7cI7k4+k1G
 CLylwnhTAjg7S8LdzZN4rM/NIPn7Q/b3c1S5sGmla5//hTO9wL0WHSfkMJbsapgOdcKcYWfoFYp
 qDAFljQq7PRR7i3hISNYJODxvRyXsfwj2JLypQdFHUTiIguf+1YHx0J5oTcsOZ16syKrts9QgTR
 qvQEuUsD/UPcJuR7YMae9eSvDnrG2ULq6zVtd92ScXMjJD4vtf1ijpuChfLn8iOpBjAUwGuQ79+
 W8T9BdSwl1hCbFTk3Nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX3gfU3laiPqsl
 zdyki37ygHQicpcQ4VLbMG8Tbz2cK77sZpDGIQW028Ni/IaQgWQdgp1D1YQcrSLdQSuSIkB0cKJ
 iyvF5kgu1KcDk8Yt/p9W9GCTlSAtqnw=
X-Proofpoint-GUID: I7c-l7yzMb-0pMOo9U4Z-dAczv8yPSL7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230023



On 11/18/2026 9:33 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] remoteproc: qcom: pas: duplicate dump segments in
>   qcom_pas_load() on recovery
> - [Medium] remoteproc: qcom: pas: secondary coredump after masked
>   shutdown failure
> --
> 
> commit 18ab6cc078bc90d357be63c7984c43a899ef428d
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> remoteproc: qcom: pas: Add coredump support for secondary processors
> 
> This commit adds coredump support for PAS remoteproc instances with a
> secondary processor by registering dump segments for the secondary
> firmware and mapping the secondary carveout during coredump collection.
> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 1c8c0c22c34d1..a167bd6072c94 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> [ ... ]
>> @@ -336,6 +342,17 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>>  		}
>>  	}
>>  
>> +	if (pas->secondary_pas_id) {
>> +		ret = qcom_register_dump_segments(rproc, pas->secondary_firmware);
>> +		if (ret) {
>> +			dev_err(pas->dev,
>> +				"failed to register secondary dump segments: %d\n", ret);
>> +			rproc_coredump_cleanup(rproc);
>> +			qcom_pas_release_firmware(pas);
>> +			return ret;
>> +		}
>> +	}
>> +
>>  	return 0;
>>  }
> 
> [Severity: Medium]
> Does registering secondary dump segments in qcom_pas_load() append
> duplicate rproc_dump_segment entries to rproc->dump_segments on every
> crash recovery?
> 
> Primary dump segments are registered in qcom_pas_parse_firmware(), which
> runs only during rproc_fw_boot().  On crash recovery,
> rproc_boot_recovery() runs rproc->ops->coredump() and then calls
> rproc_start() -> rproc_load_segments() -> qcom_pas_load() without
> clearing rproc->dump_segments, so each recovery allocates and appends
> another copy of the secondary segments and produces corrupted coredump
> ELFs with duplicate PT_LOAD headers.  In addition, if
> qcom_register_dump_segments() fails here during recovery,
> rproc_coredump_cleanup(rproc) wipes the primary segments that were
> registered at initial boot and will not be re-registered on later
> recoveries.
>

Ack, I will register the secondary dump segments during firmware parsing
to prevent duplicates on recovery and clean up registered segments on
failure.

> [ ... ]
> 
>> @@ -748,11 +787,28 @@ static void qcom_pas_coredump(struct rproc *rproc)
>>  {
>>  	struct qcom_pas *pas = rproc->priv;
>>  
>> -	pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
>> +	if (list_empty(&rproc->dump_segments))
>> +		return;
>> +
>> +	if (!pas->mem_region)
>> +		pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
>>  	if (!pas->mem_region)
>>  		return;
>>  
>> +	if (qcom_pas_has_secondary(pas) && !pas->secondary_mem_region) {
>> +		pas->secondary_mem_region =
>> +			qcom_pas_ctx_map(pas->secondary_pas_ctx);
>> +		if (!pas->secondary_mem_region)
>> +			dev_err(pas->dev, "unable to map secondary memory for coredump\n");
>> +	}
>> +
>>  	rproc_coredump(rproc);
> 
> [Severity: Medium]
> Can rproc_coredump() read pas->secondary_mem_region while the secondary
> carveout is still locked by TrustZone or the hypervisor if shutting down
> pas->secondary_pas_id failed?
> 
> rproc_boot_recovery() only skips coredump when rproc_stop() returns an
> error, as fixed for primary and DTB PAS IDs in commit 9db31edf92dd
> ("remoteproc: qcom_q6v5_pas: Fix error masking in qcom_pas_stop()").
> However, qcom_pas_stop() overwrites the return value of
> qcom_pas_shutdown(pas->secondary_pas_id) with the subsequent shutdown
> calls:
> 
> drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_stop() {
> 	...
> 	if (pas->secondary_pas_id) {
> 		ret = qcom_pas_shutdown(pas->secondary_pas_id);
> 		if (ret && pas->decrypt_shutdown)
> 			ret = qcom_pas_shutdown_poll_decrypt(pas->secondary_pas_id);
> 		if (ret)
> 			dev_err(pas->dev, "failed to shutdown secondary: %d\n", ret);
> 	...
> 	}
> 	...
> 	ret = qcom_pas_shutdown(pas->pas_id);
> }
> 
> If the secondary shutdown fails while the primary shutdown succeeds,
> qcom_pas_stop() returns 0 and rproc_coredump() reads the still-protected
> secondary carveout, triggering an XPU or stage-2 access violation.
>

Some shutdown-error masking in qcom_pas_stop() predates this series, but
the added secondary PAS path can also lose its error. This has to be
addressed seperately.

-- 
Best Regards,
Anvesh

