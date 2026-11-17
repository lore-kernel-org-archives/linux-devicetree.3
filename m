Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907801;
	b=EAx/jd6o48Vx5HrRS4oFR53qX2/oR5RDUFOdBxjfg//OduB+o84I3ZUr5wffk8GSczIc
	 ZKKxfXJKH2f6rqE1rWu/g30fJqDRnmTq+Xs01gZxazJKdZatPKRehKKkBpTkqv6/Ai33i
	 MLhuaNcArmagXXDFGwV40mYLLtm/5vO7SizF2eMPHmoMQ52Pih5ttcPZLd4wesy8hsnli
	 N4wqRzxw22e1FvJery4Gl3VKxEkScFc8PYUBIHMGyABGKT4JFOcxnk8YmAP+wfxQIDotU
	 iGLvp1AHrbtx/FmEdVUYif7CfgPI/fz+VhqUxpxsYDaOFb8xYoSqvnNAF8adjLAmIQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907801;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ur+dA6WAYMtVc8plPd7obCovC4FNAp22JeB4ajYppFM=;
	b=XbQqv9RbYlxHJtljG9k424yCZ2dkXRdfG5n2NjndX9Rw8smFAfrutxLEY5fMST17KxBR
	 KE+MxENphyd+Xb4uGdWfj/KzGid9D5mszrw5lpxUE2wxihGXKyC6w5qMvfqOlT3sC744e
	 4U8UR1A4Dl+mHqp/oGPzlyxbToDwOsXRrVkTU+8m+IQBVt6aGe5tcn4QXGDRwvmz2EG3e
	 JVkFrNt3z9qVPQc7HvQlSJ8Q6NrMTNGAI/1qE8niNKFsfeif8G4uI/m9Ar9eUdZloKfaT
	 U5vqGobIYhAle6+sJSA53nma8eewS0+bLq/zxUhBCSl8ZSIWGlVVzM1grIRZ1EGSXfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZ1iZR4w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fs0ddwUv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BCC606A330
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40BCC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZ1iZR4w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fs0ddwUv
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH533L53457899
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ur+dA6WAYMtVc8plPd7obCovC4FNAp22JeB4ajYppFM=; b=VZ1iZR4wXIYuF7yL
	i2L0fRtqiSJ1uQM1e61FDH5B9mBrH9bf1iac+Fec9nAaM/TE4E2etAgxr20LLXpE
	mDld4IsmwBWFTX83W8+cULcWocXD1Yup2NJOIx3A20yOPQRtCJpF4Dgk4AVXCQ8n
	mogWnTT85zRGhcE5hZvXv0CAFH7u6wHAg/95JMqzBg2ldM9jbggpMi1AjHIZJgQ5
	Pi5kAMfzr2jy+aXDd7drv4ZbA8NFHlOzdXrXuG3+/92r96vZuIP96ov+RnFuS+OS
	gygrxTfqsADyN6OYO5e3/CqFX2nRQgth1PCWcSvXHublVSAbV0UCd0N+Czngibvf
	oWfPSg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh8yke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:29:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so4648416a12.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 01:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794907798; x=1795512598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ur+dA6WAYMtVc8plPd7obCovC4FNAp22JeB4ajYppFM=;
        b=Fs0ddwUvwKKI+VLuerlkbxbXMuIPzbv5y65tQ03kcnSYcz1rlB5jE50MIoTCPEcs87
         wfmIhu+vxv2FFzk5dG8noe9YLkC/i6L4DKLfG6p93zXBiGpIviGuV2nrToMpbMC5CYpU
         +UE+MlgB06T5N9JP6k0b5E+J8zzY0tlUdPEl6DTAQQ3bIwqBw7Yz6DVxL7l1RIWB5zIt
         oHzJ1WSDjyT71je80qmabwp5g3cPv2UGfs1h9a0BzkUGflXe2enRnwhxntZqxSXAJ/hK
         c53AbBzKN/mf8XPsoIH8eDmGE8EPUNy5TdZsX7OqdCNKLkMD01Xc3tyoyYXaxym640vk
         gFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907798; x=1795512598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ur+dA6WAYMtVc8plPd7obCovC4FNAp22JeB4ajYppFM=;
        b=FkGdgMYk4isgv9RIvulQGGbfPhLl3Vg8shOLgYVZczv5pNTTfm0Mo9ka+wnPXIkG8w
         s0KQvLXhcXW7Vpd7EMB76tlDots1Ey42KdhwtFcYtvACQB157NgsqrIHyigmCsXGHtSc
         DxPoBa29738Q7mAsUo6X7v4JJGj/TqHYejXiTWGMzhYmeVZtMctXNCltHtRo+J7NwJCO
         mj/idKQwJaNRuCBcERlH1rYS3L6WDEwq3tN6jHLPI7v/HS7yDVPnfAentpBKLqWOc9Pp
         1ox+uAciq1JNLjsZZT8ze+mASVukMd6ZBRvAmC1nDGQCFvJpoPymF2QfeOSrInlEeC/p
         SbPg==
X-Forwarded-Encrypted: i=1; AL+hErFj/tQDPJX/HBh7IzbGzqmgpW97XfxBwWCHWWi0Ya8LmLkDOydJqaZG2o0GFyVlbBO1zW8JVpk4M27K@vger.kernel.org
X-Gm-Message-State: APuU4Z8zzvvrV8KHR3mMUBEehiYvRH6vSHlZ9mU6hqmDo5jvQ/gE+A0i
	THqSPXt5EYuxh2PjOjlCinkIIDocrVEYKOfs/fZbNw1pPhwj7zgpfCVLSc/UELjB9IPmdQ49pBK
	0D5DK5yQ0ypY1z1xNIxBBNGf/VJKWPlES1EBf8S4bWb4fp6Jne1f8gYqX4L1m/evr
X-Gm-Gg: AZFdTZdg9nrsMdLq2VQFYIkbf2tCXx0VqJr+N6OWyYYjkadLncCbfnTuPyTAmDkzT6d
	S7AA6WzWzoS5PG2qlNau4hsIxNOhu+ElyllRKRmR4v6wFk1NdSWRIx/eKniHX5MkgTzeg4jJTvR
	TRd26otxTXlGnkg8m5FGkrD/mhdWffW6RjnWe//uB3pnm/i6a4qvCttrgo39PWG2IGoYSkPx8lg
	UCHcmkFjLvN5uqCCaQccfkQKBXWgTiFbnbKLozu2fhB2b0Ewr0hDbivGkiSAJ+MVC80eUmNdkC3
	jJ/+dhFka2FqB09PV8btC2Pl87hJ/6bGiypn9MaCmYocZtgKAN6U6qBj7nL6U3pB1GUjqyTrswh
	A1u4eVixqOiXloLJ1/z1qgvaOcopOYGNE80Q+sToABHpHLUN1oRQ9hqikX68RcLMvhSPPybBNk8
	HxtfC63WWAkK6bZ2Htedu9OYfmD6HDM+BHWKrF6M3SpHU1eVpPs2Ji7+G4iM+e
X-Received: by 2002:a17:90b:4d0b:b0:3b0:b03b:699f with SMTP id 98e67ed59e1d1-3b1b089e039mr13890138a91.1.1794907797897;
        Tue, 17 Nov 2026 01:29:57 -0800 (PST)
X-Received: by 2002:a17:90b:4d0b:b0:3b0:b03b:699f with SMTP id 98e67ed59e1d1-3b1b089e039mr13890105a91.1.1794907797252;
        Tue, 17 Nov 2026 01:29:57 -0800 (PST)
Received: from [10.79.117.97] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2cca15sm3168270a91.11.2026.11.17.01.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:29:56 -0800 (PST)
Message-ID: <aec5f47a-fb16-4115-bf3b-fb8aa1df59de@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:59:50 +0530
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
Subject: Re: [PATCH v2 2/4] remoteproc: qcom: pas: Support secondary images
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-2-715435f52dd7@oss.qualcomm.com>
 <20261116184430.iw5or2qzet2s2s42@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20261116184430.iw5or2qzet2s2s42@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xkSD_eUQ90yC5-hU-o2CXjX9j10QxgYM
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc1e97 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qdZlMzF9QyhxS7BQ5S4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: xkSD_eUQ90yC5-hU-o2CXjX9j10QxgYM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNyBTYWx0ZWRfXzuSQuF0HyEYA
 WAu1Ky9DTSE57NYjxr/Dz5J4vXoP7Ba5wTJkshRJxOeYPrrurGXxG96fYw/f2kNyFpydgrJbHoF
 94nMGQmvrNzjq+zPzHydCyVMS8fwz0Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNyBTYWx0ZWRfX9zw7+Wg1iRwl
 xXz+k9xjdrnPRTX5PBZlKr6zp9QNTQMBrbdX/RX8L93j6lx67Vl9ttchDyFGiSE+ERjjhTEGfLQ
 UbjRP/JKtI0zkHp/44nz6HR2GHrzkXU+wVFZHzrdTNmHn5d0B8o1PJKtf7Wb6phlg5F3v/ILm2s
 UYeZ/tF4fUTU655b58fxVs1gudF2Lo4x9879QoG+qZ6VOe/q5LZ7urBT3eWUqLXMBT6vP0JGOBA
 K6ZUeDhGF4hF71ivW1e9CAfQkJqpmfRb18vhPuKWEmsOaFwqxWO0bsJKdMFgz+VRzwJVVJESxmn
 erL8r7uXatxZfyTOt/7fNr5mgjTYStJwtQER3PjyG78IAfE5KornW0KhxHMkekpcPvYayf0sUyK
 tnLagdxsgV/Kfsco/mt2+/fkzsu28maunTjGni5C2ezPgn70okVNt54yZ6kZMUwxPp/hn6Ge0pL
 pWz2U5hpBgRU0nVaEAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170037



On 11/17/2026 12:14 AM, Mukesh Ojha wrote:
> On Thu, Oct 15, 2026 at 11:25:50AM +0530, Anvesh Jain P wrote:
>> The Out-of-Band Management Subsystem (OOBMSS) is managed by a common
>> remote processor and consists of two Zephyr subsystems:
>>
>> +----------------------------------------------------------+
>> |                         OOBMSS                           |
>> |                                                          |
>> |  +------------------------+  +------------------------+  |
>> |  | OOB-TEE                |  | OOB-Non-Secure         |  |
>> |  | Primary processor      |  | Auxiliary processor    |  |
>> |  | Primary image and DTB  |  | Secondary image and DTB|  |
>> |  +------------------------+  +------------------------+  |
>> +----------------------------------------------------------+
>>
>> The primary processor is the Out-of-Band Trusted Execution Environment
>> (OOB-TEE) processor. The OOB-Non-Secure processor is an auxiliary processor
>> that depends on the primary processor and cannot function independently.
>>
>> The PAS remoteproc driver currently supports one primary image and its
>> optional DTB. OOBMSS additionally requires the secondary image and DTB
>> to be loaded, authenticated, mapped, shut down, and released through
>> their own PAS identifiers and carveouts.
>>
>> Add generic PAS support for loading, authenticating, and mapping a
>> secondary image and its DTB, then shutting down and releasing both while
>> keeping the existing primary-image lifecycle unchanged.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5_pas.c | 240 ++++++++++++++++++++++++++++++++++---
>>  1 file changed, 222 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index ca8e61254c44..0bce2f0d5b4a 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -42,8 +42,12 @@ struct qcom_pas_data {
>>  	int crash_reason_smem;
>>  	const char *firmware_name;
>>  	const char *dtb_firmware_name;
>> +	const char *secondary_firmware_name;
>> +	const char *secondary_dtb_firmware_name;
>>  	int pas_id;
>>  	int dtb_pas_id;
>> +	int secondary_pas_id;
>> +	int secondary_dtb_pas_id;
>>  	int lite_pas_id;
>>  	int lite_dtb_pas_id;
>>  	unsigned int minidump_id;
>> @@ -83,8 +87,12 @@ struct qcom_pas {
>>  	int proxy_pd_count;
>>  
>>  	const char *dtb_firmware_name;
>> +	const char *secondary_firmware_name;
>> +	const char *secondary_dtb_firmware_name;
>>  	int pas_id;
>>  	int dtb_pas_id;
>> +	int secondary_pas_id;
>> +	int secondary_dtb_pas_id;
>>  	int lite_pas_id;
>>  	int lite_dtb_pas_id;
>>  	unsigned int minidump_id;
>> @@ -95,17 +103,25 @@ struct qcom_pas {
>>  
>>  	const struct firmware *firmware;
>>  	const struct firmware *dtb_firmware;
>> +	const struct firmware *secondary_firmware;
>> +	const struct firmware *secondary_dtb_firmware;
>>  
>>  	phys_addr_t mem_phys;
>>  	phys_addr_t dtb_mem_phys;
>> +	phys_addr_t secondary_mem_phys;
>> +	phys_addr_t secondary_dtb_mem_phys;
>>  	phys_addr_t mem_reloc;
>>  	phys_addr_t dtb_mem_reloc;
>> +	phys_addr_t secondary_mem_reloc;
>> +	phys_addr_t secondary_dtb_mem_reloc;
>>  	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
>>  
>>  	void __iomem *mem_region;
>>  
>>  	size_t mem_size;
>>  	size_t dtb_mem_size;
>> +	size_t secondary_mem_size;
>> +	size_t secondary_dtb_mem_size;
>>  	size_t region_assign_size[MAX_ASSIGN_COUNT];
>>  
>>  	int region_assign_idx;
>> @@ -123,6 +139,8 @@ struct qcom_pas {
>>  
>>  	struct qcom_pas_context *pas_ctx;
>>  	struct qcom_pas_context *dtb_pas_ctx;
>> +	struct qcom_pas_context *secondary_pas_ctx;
>> +	struct qcom_pas_context *secondary_dtb_pas_ctx;
>>  };
>>  
>>  static void qcom_pas_segment_dump(struct rproc *rproc,
>> @@ -198,19 +216,37 @@ static void qcom_pas_pds_disable(struct qcom_pas *pas, struct device **pds,
>>  	}
>>  }
>>  
>> -static int qcom_pas_shutdown_poll_decrypt(struct qcom_pas *pas)
>> +static int qcom_pas_shutdown_poll_decrypt(int pas_id)
>>  {
>>  	unsigned int retry_num = 50;
>>  	int ret;
>>  
>>  	do {
>>  		msleep(QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS);
>> -		ret = qcom_pas_shutdown(pas->pas_id);
>> +		ret = qcom_pas_shutdown(pas_id);
>>  	} while (ret == -EINVAL && --retry_num);
>>  
>>  	return ret;
>>  }
>>  
>> +static void qcom_pas_release_firmware(struct qcom_pas *pas)
>> +{
>> +	if (pas->dtb_firmware) {
>> +		release_firmware(pas->dtb_firmware);
>> +		pas->dtb_firmware = NULL;
>> +	}
>> +
>> +	if (pas->secondary_firmware) {
>> +		release_firmware(pas->secondary_firmware);
>> +		pas->secondary_firmware = NULL;
>> +	}
>> +
>> +	if (pas->secondary_dtb_firmware) {
>> +		release_firmware(pas->secondary_dtb_firmware);
>> +		pas->secondary_dtb_firmware = NULL;
>> +	}
>> +}
>> +
>>  static int qcom_pas_unprepare(struct rproc *rproc)
>>  {
>>  	struct qcom_pas *pas = rproc->priv;
>> @@ -224,6 +260,10 @@ static int qcom_pas_unprepare(struct rproc *rproc)
>>  	qcom_pas_metadata_release(pas->pas_ctx);
>>  	if (pas->dtb_pas_id)
>>  		qcom_pas_metadata_release(pas->dtb_pas_ctx);
>> +	if (pas->secondary_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_pas_ctx);
>> +	if (pas->secondary_dtb_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
>>  
>>  	return 0;
>>  }
>> @@ -241,19 +281,29 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>>  	if (pas->lite_dtb_pas_id)
>>  		qcom_pas_shutdown(pas->lite_dtb_pas_id);
>>  
>> -	if (pas->dtb_pas_id) {
>> -		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
>> +	if (pas->secondary_dtb_pas_id) {
>> +		ret = request_firmware(&pas->secondary_dtb_firmware,
>> +				       pas->secondary_dtb_firmware_name, pas->dev);
>> +		if (ret) {
>> +			qcom_pas_release_firmware(pas);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	if (pas->secondary_pas_id) {
>> +		ret = request_firmware(&pas->secondary_firmware,
>> +				       pas->secondary_firmware_name, pas->dev);
>>  		if (ret) {
>> -			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
>> -				pas->dtb_firmware_name, ret);
>> +			qcom_pas_release_firmware(pas);
>>  			return ret;
>>  		}
>> +	}
>>  
>> -		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
>> -					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
>> +	if (pas->dtb_pas_id) {
>> +		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name,
>> +				       pas->dev);
>>  		if (ret) {
>> -			qcom_pas_metadata_release(pas->dtb_pas_ctx);
>> -			release_firmware(pas->dtb_firmware);
>> +			qcom_pas_release_firmware(pas);
>>  			return ret;
>>  		}
>>  	}
>> @@ -310,10 +360,51 @@ static int qcom_pas_start(struct rproc *rproc)
>>  			goto disable_cx_supply;
>>  	}
>>  
>> +	if (pas->secondary_dtb_pas_id) {
>> +		ret = qcom_mdt_pas_load(pas->secondary_dtb_pas_ctx,
>> +					pas->secondary_dtb_firmware,
>> +					pas->secondary_dtb_firmware_name,
>> +					&pas->secondary_dtb_mem_reloc);
>> +		if (ret)
>> +			goto release_secondary_dtb_metadata;
>> +
>> +		ret = qcom_pas_map_carveout(rproc, pas->secondary_dtb_mem_phys,
>> +					    pas->secondary_dtb_mem_size);
>> +		if (ret)
>> +			goto release_secondary_dtb_metadata;
>> +
>> +		ret = qcom_pas_prepare_and_auth_reset(pas->secondary_dtb_pas_ctx);
>> +		if (ret)
>> +			goto unmap_secondary_dtb_carveout;
>> +	}
>> +
>> +	if (pas->secondary_pas_id) {
>> +		ret = qcom_mdt_pas_load(pas->secondary_pas_ctx,
>> +					pas->secondary_firmware,
>> +					pas->secondary_firmware_name,
>> +					&pas->secondary_mem_reloc);
>> +		if (ret)
>> +			goto release_secondary_metadata;
>> +
>> +		ret = qcom_pas_map_carveout(rproc, pas->secondary_mem_phys,
>> +					    pas->secondary_mem_size);
>> +		if (ret)
>> +			goto release_secondary_metadata;
>> +
>> +		ret = qcom_pas_prepare_and_auth_reset(pas->secondary_pas_ctx);
>> +		if (ret)
>> +			goto unmap_secondary_carveout;
>> +	}
>> +
>>  	if (pas->dtb_pas_id) {
>> +		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
>> +					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
>> +		if (ret)
>> +			goto release_dtb_metadata;
>> +
>>  		ret = qcom_pas_map_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
>>  		if (ret)
>> -			goto disable_px_supply;
>> +			goto release_dtb_metadata;
>>  
>>  		ret = qcom_pas_prepare_and_auth_reset(pas->dtb_pas_ctx);
>>  		if (ret) {
>> @@ -344,13 +435,16 @@ static int qcom_pas_start(struct rproc *rproc)
>>  	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
>>  	if (ret == -ETIMEDOUT) {
>>  		dev_err(pas->dev, "start timed out\n");
>> -		qcom_pas_shutdown(pas->pas_id);
>>  		goto unmap_carveout;
>>  	}
>>  
>>  	qcom_pas_metadata_release(pas->pas_ctx);
>>  	if (pas->dtb_pas_id)
>>  		qcom_pas_metadata_release(pas->dtb_pas_ctx);
>> +	if (pas->secondary_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_pas_ctx);
>> +	if (pas->secondary_dtb_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
>>  
>>  	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
>>  	pas->firmware = NULL;
>> @@ -358,16 +452,37 @@ static int qcom_pas_start(struct rproc *rproc)
>>  	return 0;
>>  
>>  unmap_carveout:
>> +	qcom_pas_shutdown(pas->pas_id);
>>  	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>>  release_pas_metadata:
>>  	qcom_pas_metadata_release(pas->pas_ctx);
>> -	if (pas->dtb_pas_id)
>> -		qcom_pas_metadata_release(pas->dtb_pas_ctx);
>> -
>>  unmap_dtb_carveout:
>> +	if (pas->dtb_pas_id) {
>> +		qcom_pas_shutdown(pas->dtb_pas_id);
>> +		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys,
>> +					pas->dtb_mem_size);
>> +	}
>> +release_dtb_metadata:
>>  	if (pas->dtb_pas_id)
>> -		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
>> -disable_px_supply:
>> +		qcom_pas_metadata_release(pas->dtb_pas_ctx);
>> +unmap_secondary_carveout:
>> +	if (pas->secondary_pas_id) {
>> +		qcom_pas_shutdown(pas->secondary_pas_id);
>> +		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
>> +					pas->secondary_mem_size);
>> +	}
>> +release_secondary_metadata:
>> +	if (pas->secondary_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_pas_ctx);
>> +unmap_secondary_dtb_carveout:
>> +	if (pas->secondary_dtb_pas_id) {
>> +		qcom_pas_shutdown(pas->secondary_dtb_pas_id);
>> +		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
>> +					pas->secondary_dtb_mem_size);
>> +	}
>> +release_secondary_dtb_metadata:
>> +	if (pas->secondary_dtb_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
>>  	if (pas->px_supply)
>>  		regulator_disable(pas->px_supply);
>>  disable_cx_supply:
>> @@ -413,7 +528,7 @@ static int qcom_pas_stop(struct rproc *rproc)
>>  
>>  	ret = qcom_pas_shutdown(pas->pas_id);
>>  	if (ret && pas->decrypt_shutdown)
>> -		ret = qcom_pas_shutdown_poll_decrypt(pas);
>> +		ret = qcom_pas_shutdown_poll_decrypt(pas->pas_id);
>>  
>>  	if (ret)
>>  		dev_err(pas->dev, "failed to shutdown: %d\n", ret);
>> @@ -426,6 +541,27 @@ static int qcom_pas_stop(struct rproc *rproc)
>>  		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
>>  	}
>>  
>> +	if (pas->secondary_pas_id) {
>> +		ret = qcom_pas_shutdown(pas->secondary_pas_id);
>> +		if (ret && pas->decrypt_shutdown)
>> +			ret = qcom_pas_shutdown_poll_decrypt(pas->secondary_pas_id);
>> +		if (ret)
>> +			dev_err(pas->dev, "failed to shutdown secondary: %d\n", ret);
>> +
>> +		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
>> +					pas->secondary_mem_size);
>> +	}
>> +
>> +	if (pas->secondary_dtb_pas_id) {
>> +		ret = qcom_pas_shutdown(pas->secondary_dtb_pas_id);
>> +		if (ret)
>> +			dev_err(pas->dev,
>> +				"failed to shutdown secondary dtb: %d\n", ret);
>> +
>> +		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
>> +					pas->secondary_dtb_mem_size);
>> +	}
> 
> Nit: It does not matter, but moving this before the primary one would be
> ideal. You can do it if you send a revision to the series.
>

Ack, I will reorder this accordingly in v3.

>> +
>>  	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>>  
>>  	handover = qcom_q6v5_unprepare(&pas->q6v5);
>> @@ -740,6 +876,42 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
>>  	if (IS_ERR(pas->dtb_pas_ctx))
>>  		return PTR_ERR(pas->dtb_pas_ctx);
>>  
>> +	if (!pas->secondary_pas_id)
>> +		return 0;
>> +
>> +	ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 2, &res);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pas->secondary_mem_phys = res.start;
>> +	pas->secondary_mem_reloc = res.start;
>> +	pas->secondary_mem_size = resource_size(&res);
>> +
>> +	pas->secondary_pas_ctx =
>> +		devm_qcom_pas_context_alloc(pas->dev, pas->secondary_pas_id,
>> +					    pas->secondary_mem_phys,
>> +					    pas->secondary_mem_size);
>> +	if (IS_ERR(pas->secondary_pas_ctx))
>> +		return PTR_ERR(pas->secondary_pas_ctx);
>> +
>> +	if (!pas->secondary_dtb_pas_id)
>> +		return 0;
>> +
>> +	ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 3, &res);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pas->secondary_dtb_mem_phys = res.start;
>> +	pas->secondary_dtb_mem_reloc = res.start;
>> +	pas->secondary_dtb_mem_size = resource_size(&res);
>> +
>> +	pas->secondary_dtb_pas_ctx =
>> +		devm_qcom_pas_context_alloc(pas->dev, pas->secondary_dtb_pas_id,
>> +					    pas->secondary_dtb_mem_phys,
>> +					    pas->secondary_dtb_mem_size);
>> +	if (IS_ERR(pas->secondary_dtb_pas_ctx))
>> +		return PTR_ERR(pas->secondary_dtb_pas_ctx);
>> +
>>  	return 0;
>>  }
>>  
>> @@ -823,6 +995,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>  	struct rproc *rproc;
>>  	struct device_node *node;
>>  	const char *fw_name, *dtb_fw_name = NULL;
>> +	const char *secondary_fw_name = NULL;
>> +	const char *secondary_dtb_fw_name = NULL;
>>  	const struct rproc_ops *ops = &qcom_pas_ops;
>>  	int ret;
>>  
>> @@ -847,6 +1021,24 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>  			return ret;
>>  	}
>>  
>> +	if (desc->secondary_firmware_name) {
>> +		secondary_fw_name = desc->secondary_firmware_name;
>> +		ret = of_property_read_string_index(pdev->dev.of_node,
>> +						    "firmware-name", 2,
>> +						    &secondary_fw_name);
>> +		if (ret < 0 && ret != -EINVAL)
>> +			return ret;
>> +	}
>> +
>> +	if (desc->secondary_dtb_firmware_name) {
>> +		secondary_dtb_fw_name = desc->secondary_dtb_firmware_name;
>> +		ret = of_property_read_string_index(pdev->dev.of_node,
>> +						    "firmware-name", 3,
>> +						    &secondary_dtb_fw_name);
>> +		if (ret < 0 && ret != -EINVAL)
>> +			return ret;
>> +	}
>> +
>>  	if (desc->minidump_id)
>>  		ops = &qcom_pas_minidump_ops;
>>  
>> @@ -879,6 +1071,14 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>  		pas->dtb_firmware_name = dtb_fw_name;
>>  		pas->dtb_pas_id = desc->dtb_pas_id;
>>  	}
>> +	if (secondary_fw_name) {
>> +		pas->secondary_firmware_name = secondary_fw_name;
>> +		pas->secondary_pas_id = desc->secondary_pas_id;
>> +	}
>> +	if (secondary_dtb_fw_name) {
>> +		pas->secondary_dtb_firmware_name = secondary_dtb_fw_name;
>> +		pas->secondary_dtb_pas_id = desc->secondary_dtb_pas_id;
>> +	}
>>  	platform_set_drvdata(pdev, pas);
>>  
>>  	ret = device_init_wakeup(pas->dev, true);
>> @@ -925,6 +1125,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>  	pas->pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
>>  	if (pas->dtb_pas_id)
>>  		pas->dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
>> +	if (pas->secondary_pas_id)
>> +		pas->secondary_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
>> +	if (pas->secondary_dtb_pas_id)
>> +		pas->secondary_dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
>>  
>>  	if (desc->early_boot)
>>  		pas->rproc->state = RPROC_DETACHED;
>>
>> -- 
>> 2.34.1
>>
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 

-- 
Best Regards,
Anvesh

