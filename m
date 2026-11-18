Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997767;
	b=Y/bR2NZqXfg6zb3DYZakJ+2HbBNuR11Cg1PJGbKiAE6Hpp/Fogawf8RkzwZ5dRank4XT
	 wxJuO9hI0V7v3G2Zo+hLdZ6+KqoTl9lvfgXso+TxA79Vq+xLCTATUr/1pwiYj/cTxFj55
	 eWJ2wW7WmXVDOGTa9YxOGKkSD3jE0c2hpuisDOLVYPw7zS5U+MMSrHz5/3rMdyehDRTHW
	 nicIHzbSaocwzUkKf5ac6I8jFVoLlfXEyzAh5xAlyAuEV60KgrDJ/Xf6M7Hs+aCi7bIq2
	 hBDzieVr5ACIzOrvC3Yjz6Bu/KWbzf+eOavazxqpYkwg629v5yR+w0F+FerSNA9ui+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=F7HShi/pVHNTYdg2FinqmbYKeZfV6jrr8hz1Nm2p0Qw=;
	b=znZhNYFGWOXirGARi0hLav4oFCBSv/vkiqnlcB3XZ9g66IQhu857Ee4eGvHVVOWUVYqJ
	 HDDGdkX5EgjDNWPf9xCU0v/902wATr7qeX/wjI6BNaRKkxgSChy8cr9xB3lGdRckhsAFP
	 XerrvyVGvPL+noBFfTkznFpv8C8kJ8hD+F3sWAuAXELOJqIrQe9L+Ufcv7yjfi3ru4vcx
	 tPwzrASCXgESbPZPzG7l18qbRnijoWJQWVc1HzzxB9t2WyDlPoylCW76eYVGkG0NhRH8u
	 sDEjIdJJKKYCucPrVUSPu8exfavUB6AWIwdhQCNG9cvKWXTpUPP7FHJvIwFPkyVUT0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4Nn3l1f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J18DB677;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579B0606A334
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 579B0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4Nn3l1f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J18DB677
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9kIRd4082316
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F7HShi/pVHNTYdg2FinqmbYKeZfV6jrr8hz1Nm2p0Qw=; b=D4Nn3l1febtFyFRi
	pjY89QCokUB76gdIDWbw/Jlk2J2fk/Lkphk6iJW4JJRmCCtq8eTHfdWy464JwlwC
	s5eclJPHNEJKDxXMGplCyXEQU39bmxmXJSNVBlSa4AVZzm4/PVzI4vHFgqbBfsDK
	rLMg9Zqo9CMqcOxWOMuLeFVokEVcp0JenBm8AEy0nuQODmRZrOfYn/psrGUvZgbz
	ZL/uP+nYACkMN94hCrPb1eaPeqbMcmv5gO7VNgsTnh1WkREz76uVbpaxhSvOeKkd
	gTNyzgDL4qmmqYe9JrGgrPHK2ER5BbLtDG6K/p7H38mWQx3ROy7ajCI9nVh+WmNg
	eks9sQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9jgrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:29:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2efa9aea3c0so10724265ad.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 02:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794997765; x=1795602565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7HShi/pVHNTYdg2FinqmbYKeZfV6jrr8hz1Nm2p0Qw=;
        b=J18DB677osKq2zpxOq6sSxfpANEcR08Tjnl0NrdRgo9kAa2dEz8aHjUrneXm78uz1d
         r0rVORWgAnPIE7/avsfqAqbihLb1ZfFwBtr3GNKBUuOqERwnyd/sWtxy9sJGNQugB7yp
         moOF4o4QC3VBL/qslMIAk4VRwhmvLVjGsKzghsxHqXgX/ATZ6X4IAaoB0LikXfZpisG+
         p4SDN/JuPNneZfy1siQFrDNbvLRtsRD+BV22zHLMNNCpW16Pty+sYnzuuqzlH0qJqkSJ
         JL263jJ38IqlaHk6gkj0eXjUDnSzs/KM/9NWhdmEcWPi7dcZLBSSYSPjIAobGGc7Emd6
         EDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997765; x=1795602565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7HShi/pVHNTYdg2FinqmbYKeZfV6jrr8hz1Nm2p0Qw=;
        b=lvocW8cBjnljIyMbCmT3bNdGN7Q7gOK6TWxX6KEhE6e/hnOgv+LUmtdYsvFD6EerQ/
         FGM+7PYLdR4Nn9Z+AC4i8dGl1ktslNyzMpXSM36kbrk04GJADgUUaCHdT+Ze3QLMUz0x
         hA1MViPgyD708+QgbTNc6CEevudQA8MY7hk6SUkt3nrL7+o4i/Hu7AOdqqllNuvGnojb
         UhSbZDBfK2wkbRO/MBSO4tg/xyHTlcdgjgQUiJYEl7ilk1jpu73rvl1KJMZ94f6i2mut
         W1ppbOjwckQo7mDPic3dTMoMSG5fGo5ZpEFM/BVJcp41uZXTwixfZECx6DIAXyJ6fE7F
         jBzw==
X-Forwarded-Encrypted: i=1; AL+hErFX1a6EegNRcWL8UzGN4jykQjFanSS43YC/7DoA8CEAWjiIF6QhHtVbFEpeXTDEwd0vJO9M/gKPsheG@vger.kernel.org
X-Gm-Message-State: APuU4Z94sSpWtAVwB2zKEBvppNchgRvl2NKDkCAUKyozlgNDH3CBlssI
	PBDj40a2OPrP9Ddu1W2o46ZX5fzvWUcH6CfV81hFQJVb9ogF+SBrALRAZKWm2wFvZDnQ8Qqr5yT
	D+VaCzknsOfEAwqsiuxCSC/oUxLnKy6CNifSTvX+m+0IW6ALm9ye6SoipiWZIn0vC
X-Gm-Gg: AZFdTZfx38G/mTLjKTdtq0fEYbIzzaLKNDRP03l3VKEbvHC53wpeV7ivXHtTOPXELZF
	NU9aWniilY7r6KkG+pw0abFhi/eLe5WCzDujK0h4N1uSebuEpyqNSwCY1h6Ls3dEgAHQCqM+Wo2
	fCEiDmBZlN/hWKXHR/BN22F3lSXZXE0Kgjmi42Eq1vvxSnDaSXsDtomCK3/bXTz5VbX/8rj2OUp
	XGHCxks32jXGHv1EFpGr5Tw29rznmp1XHCkGzdxR0NnkTHKol5HqvYGUX1U/M87Onix/vxMMQoY
	alCSWJ3qSuyQLWW1dThNlZkTZKv0OE9q5igAo51MI4lrFQZ87LEtm1lmILTwi16K2wv0UNaNFeL
	58BsTJLNcGst2+KxkQGDBFp1OxZMzkpwti5Ma1mFwXAS1bElQ8MtHZbKJEWeYrytpJDroOu5CaP
	Myq2tXxWxjzLNK0es+A5hJZQwfoJJhpPW1q4ldNuSWQQt/2m3t5aGZh2nINsnO+Q==
X-Received: by 2002:a17:903:244f:b0:2ed:379:158d with SMTP id d9443c01a7336-2eff73f1eefmr24169905ad.9.1794997764941;
        Wed, 18 Nov 2026 02:29:24 -0800 (PST)
X-Received: by 2002:a17:903:244f:b0:2ed:379:158d with SMTP id d9443c01a7336-2eff73f1eefmr24169625ad.9.1794997764427;
        Wed, 18 Nov 2026 02:29:24 -0800 (PST)
Received: from [10.149.122.146] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6115452sm11186825ad.16.2026.11.18.02.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:29:23 -0800 (PST)
Message-ID: <cc64e5f0-fb82-41eb-8f26-6dfab7cd0791@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:59:18 +0530
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
Subject: Re: [PATCH v2 3/4] remoteproc: qcom: pas: Add coredump support for
 secondary processors
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
 <20261015-oob-support-glymur-v2-3-715435f52dd7@oss.qualcomm.com>
 <20261117081011.jcuxog7ixwbfbyce@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20261117081011.jcuxog7ixwbfbyce@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YnyS7dbX9NEszc3hrJFJa70U_ZP9DiFD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0MSBTYWx0ZWRfX8H96RZ8wc76T
 ETd2BwVFsGDWWM7e994vJeyd9GRtR9lSHllbS1VGgUbuozZgXYb6FfHQrcfscFuQu2L2/6Wj1b8
 ebkils8aKMsHQS+t+JZDHfiOytw//rs=
X-Proofpoint-ORIG-GUID: YnyS7dbX9NEszc3hrJFJa70U_ZP9DiFD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0MSBTYWx0ZWRfXxGUGQmq2jdi/
 TKX+iRfbRVpZModG423FGRkHOLr1lIAsEBX+7ttcBsbLZSVJrTFO2Y1eXBodh1K1ogvCnu/a4os
 5vM8xZaEEj1ba7bCuZ15RjcpktkKG4c00kW4iiMiJjMIlZpSYyjKFXSvQUAeGbsnOU6wog4jy44
 4IvmH8W7QeSjioyWsVA/tHqRjblab0nCZiomS6zjxVO9ugchFfezRwEtR/UfBadc+bH5LK380Dv
 icI66n3Uw6dgaX3/udNu7pJC35XvVTj6DkhY65lfaUcRI8tE6x0zBMBi753ZJNVSomctsGaZiw2
 15q3F8AoHbxJDgyN3b3QLidnALJWLE+21x6uts0X7PCxrEERNdRqKS306wQ6Lq4821tdAhWffWI
 M0iXcygRF39cXfvlMAs3l9kotogOTw0cjNvQCc5avSBIn9E4CMnugKfZaVSaY43EouAKvxQsSvr
 M3iJMOaUA0BROCiQ2CQ==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd7e06 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=xb-HvuPonZpJoasvX4gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180041



On 11/17/2026 1:40 PM, Mukesh Ojha wrote:
> On Thu, Oct 15, 2026 at 11:25:51AM +0530, Anvesh Jain P wrote:
>> Add coredump support for PAS remoteproc instances with a secondary
>> processor by registering fixed dump segments for both primary and
>> secondary carveouts at probe time and mapping them during collection.
>> The attached-state path is for debug dump collection and does not
>> provide operational device recovery.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5_pas.c | 102 +++++++++++++++++++++++++++++++++----
>>  1 file changed, 91 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 0bce2f0d5b4a..374cafd04b62 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -117,6 +117,7 @@ struct qcom_pas {
>>  	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
>>  
>>  	void __iomem *mem_region;
>> +	void __iomem *secondary_mem_region;
>>  
>>  	size_t mem_size;
>>  	size_t dtb_mem_size;
>> @@ -162,6 +163,28 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
>>  	memcpy_fromio(dest, pas->mem_region + total_offset, size);
>>  }
>>  
>> +static bool qcom_pas_has_secondary(const struct qcom_pas *pas)
>> +{
>> +	return pas->secondary_pas_id && pas->secondary_dtb_pas_id;
>> +}
>> +
>> +static int qcom_pas_register_dump_segments(struct rproc *rproc,
>> +					   struct qcom_pas *pas)
>> +{
>> +	int ret;
>> +
>> +	ret = rproc_coredump_add_segment(rproc, pas->mem_phys, pas->mem_size);
>> +	if (ret)
>> +		return ret;
> 
> Why qcom_register_dump_segments() already does this ? why need to
> add entire region ? please modify qcom_register_dump_segments()
> according to your need.
>

Ack, I will remove the whole-carveout segment and use
qcom_register_dump_segments() for the firmware segments.

>> +
>> +	ret = rproc_coredump_add_segment(rproc, pas->secondary_mem_phys,
>> +					 pas->secondary_mem_size);
>> +	if (ret)
>> +		rproc_coredump_cleanup(rproc);
>> +
>> +	return ret;
>> +}
>> +
>>  static void qcom_pas_minidump(struct rproc *rproc)
>>  {
>>  	struct qcom_pas *pas = rproc->priv;
>> @@ -577,16 +600,38 @@ static int qcom_pas_stop(struct rproc *rproc)
>>  static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>>  {
>>  	struct qcom_pas *pas = rproc->priv;
>> -	int offset;
>> +	phys_addr_t base;
>> +	void __iomem *region;
>> +
>> +	if (da >= pas->mem_reloc && len <= pas->mem_size &&
>> +	    da - pas->mem_reloc <= pas->mem_size - len) {
>> +		base = pas->mem_reloc;
>> +		region = pas->mem_region;
>> +	} else if (da >= pas->mem_phys && len <= pas->mem_size &&
>> +		   da - pas->mem_phys <= pas->mem_size - len) {
>> +		base = pas->mem_phys;
>> +		region = pas->mem_region;
>> +	} else if (da >= pas->secondary_mem_reloc &&
>> +		   len <= pas->secondary_mem_size &&
>> +		   da - pas->secondary_mem_reloc <= pas->secondary_mem_size - len) {
>> +		base = pas->secondary_mem_reloc;
>> +		region = pas->secondary_mem_region;
>> +	} else if (da >= pas->secondary_mem_phys &&
>> +		   len <= pas->secondary_mem_size &&
>> +		   da - pas->secondary_mem_phys <= pas->secondary_mem_size - len) {
>> +		base = pas->secondary_mem_phys;
>> +		region = pas->secondary_mem_region;
>> +	} else {
>> +		return NULL;
>> +	}
>>  
>> -	offset = da - pas->mem_reloc;
>> -	if (offset < 0 || offset + len > pas->mem_size)
>> +	if (!region)
>>  		return NULL;
>>  
>>  	if (is_iomem)
>>  		*is_iomem = true;
>>  
>> -	return (__force void *)pas->mem_region + offset;
>> +	return (__force void *)region + (da - base);
>>  }
>>  
>>  static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
>> @@ -598,10 +643,21 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
>>  	size_t table_sz;
>>  	int ret;
>>  
>> -	ret = qcom_register_dump_segments(rproc, fw);
>> -	if (ret) {
>> -		dev_err(pas->dev, "Error in registering dump segments\n");
>> -		return ret;
>> +	if (qcom_pas_has_secondary(pas)) {
>> +		if (list_empty(&rproc->dump_segments)) {
>> +			ret = qcom_pas_register_dump_segments(rproc, pas);
>> +			if (ret) {
>> +				dev_err(pas->dev,
>> +					"failed to register dump segments: %d\n", ret);
>> +				return ret;
>> +			}
>> +		}
>> +	} else {
>> +		ret = qcom_register_dump_segments(rproc, fw);
>> +		if (ret) {
>> +			dev_err(pas->dev, "Error in registering dump segments\n");
>> +			return ret;
>> +		}
>>  	}
>>  
>>  	if (!rproc->has_iommu)
>> @@ -716,13 +772,21 @@ static void qcom_pas_coredump(struct rproc *rproc)
>>  {
>>  	struct qcom_pas *pas = rproc->priv;
>>  
>> -	pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
>> +	if (!pas->mem_region)
>> +		pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
>>  	if (!pas->mem_region)
>>  		return;
>>  
>> +	if (qcom_pas_has_secondary(pas) && !pas->secondary_mem_region) {
>> +		pas->secondary_mem_region =
>> +			qcom_pas_ctx_map(pas->secondary_pas_ctx);
>> +		if (!pas->secondary_mem_region) {
>> +			dev_err(pas->dev, "unable to map secondary memory for coredump\n");
>> +			return;
>> +		}
>> +	}
>> +
>>  	rproc_coredump(rproc);
>> -	iounmap(pas->mem_region);
> 
> There was a region it was unmapped once done to avoid speculative fetch access.. we can't keep
> it mapped all the time..
>
>

Ack, I’ll unmap the PAS region after coredump collection.

>> -	pas->mem_region = NULL;
>>  }
>>  
>>  static const struct rproc_ops qcom_pas_ops = {
>> @@ -1133,6 +1197,12 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>  	if (desc->early_boot)
>>  		pas->rproc->state = RPROC_DETACHED;
>>  
>> +	if (qcom_pas_has_secondary(pas)) {
>> +		ret = qcom_pas_register_dump_segments(rproc, pas);
>> +		if (ret)
>> +			goto remove_ssr_sysmon;
>> +	}
> 
> For early boot, we don't even have support for the primary image
> itself for the first crash as we did not load for its first boot
> up. So, this is new and you don't have check why do we need it in
> probe whether it is early booted subsystem or loaded by linux
> Also, not sure if it is right to dump entire memory region.
>


Ack, I will remove probe-time registration and add only firmware-derived
dump segments when the firmware is available.

>> +
>>  	ret = rproc_add(rproc);
>>  	if (ret)
>>  		goto remove_ssr_sysmon;
>> @@ -1144,6 +1214,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>  	return 0;
>>  
>>  remove_ssr_sysmon:
>> +	rproc_coredump_cleanup(rproc);
>>  	qcom_remove_ssr_subdev(rproc, &pas->ssr_subdev);
>>  	qcom_remove_sysmon_subdev(pas->sysmon);
>>  deinit_remove_pdm_smd_glink:
>> @@ -1169,6 +1240,15 @@ static void qcom_pas_remove(struct platform_device *pdev)
>>  		of_platform_device_destroy(&pas->bam_dmux->dev, NULL);
>>  
>>  	rproc_del(pas->rproc);
>> +	rproc_coredump_cleanup(pas->rproc);
>> +	if (pas->secondary_mem_region) {
>> +		iounmap(pas->secondary_mem_region);
>> +		pas->secondary_mem_region = NULL;
>> +	}
>> +	if (pas->mem_region) {
>> +		iounmap(pas->mem_region);
>> +		pas->mem_region = NULL;
>> +	}
>>  
>>  	qcom_q6v5_deinit(&pas->q6v5);
>>  	qcom_pas_unassign_memory_region(pas);
>>
>> -- 
>> 2.34.1
>>
> 

-- 
Best Regards,
Anvesh

