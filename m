Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEE442D6E5
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 19:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934409; cv=none; b=JZ9ONnjpRrgKG8UAlOCjMz4w4Byt1sIh1j1llU0nvzqG81/YFE1nMUnAoTGSnLw2VXnrGwXKG0MhXFSOSGGXBkVp+/HkFnrFay/Os8S9wYqwE4xULvajfjPtyjBq8w/Uk/uQ5JPXU9GzH7ltVTZ8QX206hs3KpqHD5Codu0cAHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934409; c=relaxed/simple;
	bh=a23jdrqBWq6EO2LiBZ0pax66Ab0boOC/BeNF5PRbalA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mH/j72PmL7lHIMv2odUv14j1OhwKVOrI+sdtQmx6AF3+k6fLsZh6JTZkaKhMFI3Nt2xme1UOnAo1FNkPZodYYjNPPTLRxg6UGGTy1WgSvK1HIyAgCwAg8flKULpnIbSRWlAi91FnnsABOaOGDtdTp1O8ZVxKIRNkEDYcZQGX9WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QnaQZCpB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Of3YgymY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QnaQZCpB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Of3YgymY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmrQW1692307
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 19:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xVQF4e9EW8E2bpX2p4bPCu08t6dKiQPvFzboMOSJ3kM=; b=QnaQZCpBjNZW20uK
	qlVocGGU1nDOdgpkoTumOHuHrgHZhhKS5ppy2HiC9wIEzDt7Vi+tJgxDeagHUxqG
	NcWH4fawO4LGohDQxmGXHr+/qUKVFXigcehoLRF3TNjlf8/0PcjyfNg+/DY7aRlf
	1ws1s2HPa3TjPYXvVaswVxWpCKc0JhcwwfJzFC46ovkVEol1gueB5zQ0iia4tw39
	BuBKLFUAwnSyNAjwZnDmUL6KdfAHIv9WCPfh2MQBVMHClGx2t9hvCmKiZ7tWU4l/
	1D5acq7GAWZpdwNE8h0WMCnO7IR5gGceqIclrRLceafp6wQbPDvX90vHdfyUlz/7
	uFY+kg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0tkbk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 19:33:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e606e8f3eso96516085a.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 12:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782934403; x=1783539203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xVQF4e9EW8E2bpX2p4bPCu08t6dKiQPvFzboMOSJ3kM=;
        b=Of3YgymYtkNBnicMA6PulHTPAI/ZACSbHkGkEIBCI3FL1rB5LqorfBVnYg/BWFCdXb
         ErqOCoSwoX2IdO5HvG2EoyqBijJX35xh9FnLORJ+Kcn3nFaCNmDuZJJLmupmVVVo5+7p
         dYcrveSEOuWrDrsyLVG5AAw2O+4QlwwW5FTxP6O2t5L4AV9srSNtR1kSatIjdgNJgrJv
         L/M23fDiuxTsReIqTCxNbEM95iAcHphVI6fBJCCAioKG2/yOgn1o2vOidgI4tbOIAlnF
         JFPOwxqL+5viJieg2cS5dDnqgCAtcMVsoVPucvL7FHLbojzeLuaDSmoqxNv3QJYZTinJ
         18PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934403; x=1783539203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xVQF4e9EW8E2bpX2p4bPCu08t6dKiQPvFzboMOSJ3kM=;
        b=jtZO15YrKNAsNTdFHt8xqqqsUyHeu1zi79SHiv/g9emXbnxnFH8xh4rpGc0AzdaKte
         CJHbR7oQyhvk0wZluPGsulAFEKSpY6yAMVqDHeAaZuJz9OKMYmlBrpNj5lTFObHbfBoP
         9en6rmEBmIU5R6sp5iB0mIqs9um/wT9mVrO+olx1GC2z5Hkd7QaBb1MrPZH1lB52zNMa
         89ZTbR4yNojl9kOL7ZHsAlymbAZIWqRJPo/2JYF1IFX0/3xUfv7AAJtkqt4LkL8ww0Lk
         tTKXEJfnT6yqB3s4URDftE7byqMsfw+CXk7wwFnU89Kxr2EANSPPZkjULaip9HyeMogW
         fVKw==
X-Gm-Message-State: AOJu0YySOhai+VuAZ/NWzyGowSrc1zeoICFHzyeogEL8K3j4QfMOmrDB
	zpk8+MhzM/O+LYXWvUzdx9Inx5sjmUgdPqP0fbi3LAnLc1b85x4IonwkAlygJhIFJG9D++/ISMN
	/Bh/vfdpRGPrJqa087+bEOxM44FQkQ4HVIl4XE8ZeCw8niTox5b1Y6jbJAxxvWT+l
X-Gm-Gg: AfdE7clVJM2SIkLeE920KY5HGYdvzsLeBFbhtm1oxXt+aOXH3vnTLdj+iQ+k1jVOpUJ
	50J9g+XdR/1JZljdJVLC1rdDjP+H15D6wgcuOd1cMxucyqvk25z5gmgH8zybf8Or2I35MCltg4l
	Lv8vVAFmAUJYiPEDuObQE3FHN72Wxx1W6SlmF+QKp5FW9qihaJqKYveW4uc+Pajf1BHzYn2an0W
	TH4YF/kTRFBkBIzeNjdqUfgwLs+086gv50fL5penhr+fARo155dgR7T9retE9JEMuEjuLK2dhqY
	YLw7zeiCD7DzIDYJUMqH6a7Hz7YrHzxh0wRSjb5/wGsqPKWwIzHzs8OEhkYbAjSOV8ceei/jXJM
	2Hw7WKcI44YBzvDjxsc78aKcy6iyBDlBbjw7/aQ==
X-Received: by 2002:a05:620a:1a29:b0:92b:6805:91a5 with SMTP id af79cd13be357-92e784fb79cmr473066985a.61.1782934402484;
        Wed, 01 Jul 2026 12:33:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1a29:b0:92b:6805:91a5 with SMTP id af79cd13be357-92e784fb79cmr473059585a.61.1782934401681;
        Wed, 01 Jul 2026 12:33:21 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493be4d8f5asm146844455e9.8.2026.07.01.12.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 12:33:20 -0700 (PDT)
Message-ID: <1f6a06ca-119c-4085-a3c5-ccabda7ab9f7@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 20:33:20 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/3] dt-bindings: soundwire: qcom: Increase max data
 ports to 17
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260701163115.3701298-2-srinivas.kandagatla@oss.qualcomm.com>
 <20260701164345.938751F000E9@smtp.kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260701164345.938751F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bZcRVJjOO4GaaVHR42wqQrJs5-qMpC6j
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIwOSBTYWx0ZWRfX++fAVhhEjeo9
 O/T/Zieyl+KHNEJMOckyl4Dni6W483aAzmoFCQFl8w+qv138e3mcgl0glNgc09Xog4cgVm1W9Yn
 XNBEvZVtKQJ8nunj8nmEx9TOo2rsYdE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIwOSBTYWx0ZWRfX+YomLB4jkloX
 1bXJo41ND3U8rwJu0/DB3u8zDtAsFeCTyAPnPPu5byo9hzFeN2UBVAbMGlDsZn6aU1m1dQ02c/m
 wK9SmixImkKnpMfjDF2yNscXyHH0g6M6j6zrTBqcG+3gred5uavpRdTX8Kz0g9gUyd5U7LYB5UC
 lgO/7zbq5qnflgWNBS0gF1BAAbi/vT0e5ZpTsFaoPOqJ4DPiiCh8qeoN3eRrZQ0J9gAX2LzN3Wr
 LTRC18rtg36AYqMvpQKMjUip1Ssery0VOTMP+sMF5WpqVAwrBeTx+fEOxXRK1egfYega0c+Xqc4
 d6W8HqccsFUNMJOSlNqfyfdaGmWuWGsf76Ihe9Wojv5oUA0cs+9Ocg3uJ6JRoo48GM1Fgo4TM7+
 6QFo2hlua4afOPR4KwlIzLJk2FPas8s+uP0IS5SrUlSUEkqwLcZGtsnOHnPIF9zkPQL+CzayV1x
 fwDR6Y/cnwU6CK0bq5A==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a456b83 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nIT9tT2v_Lirlcak3YQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: bZcRVJjOO4GaaVHR42wqQrJs5-qMpC6j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010209

On 7/1/26 5:43 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Incorrect search size in find_first_zero_bit prevents -EBUSY on port exhaustion and causes silent double-allocation of the highest port.
> - [High] The dt-bindings now allow up to 17 SoundWire data ports, but the corresponding driver internal structures have a hardcoded limit of 15 DAIs, leading to a buffer overflow.

These issues are addressed in this series:

https://lore.kernel.org/linux-arm-msm/20260701193006.4113-1-srinivas.kandagatla@oss.qualcomm.com/T/#t

--srini
> --
> 
> commit bfff7ab83551c0958297b1c39b25931747061203
> Author: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> dt-bindings: soundwire: qcom: Increase max data ports to 17
> 
> Bump the maxItems from 16 to 17 for all qcom,ports-* properties to
> accommodate SoundWire controllers v3.1.0 with 17 data ports.
> 
>> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> index 9447a2f371b56..8e6973fa229c9 100644
>> --- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> @@ -90,7 +90,7 @@ properties:
>>        or applicable for the respective data port.
>>        More info in MIPI Alliance SoundWire 1.0 Specifications.
>>      minItems: 3
>> -    maxItems: 16
>> +    maxItems: 17
> 
> [Severity: High]
> This is a pre-existing issue, but does increasing the number of ports to 17
> expose an out-of-bounds write in the qcom soundwire driver?
> 
> In drivers/soundwire/qcom.c, SWRM_MAX_DAIS is hardcoded to 15:
> 
> #define SWRM_MAX_DAIS						0xF
> 
> Which bounds the sruntime array in struct qcom_swrm_ctrl:
> 
> 	struct sdw_stream_runtime *sruntime[SWRM_MAX_DAIS];
> 
> If a device is configured with 17 ports, will this lead to an out-of-bounds
> write when setting up streams on the 16th or 17th port?
> 
> drivers/soundwire/qcom.c:qcom_swrm_set_sdw_stream() {
> 	...
> 	ctrl->sruntime[dai->id] = stream;
> 	...
> }
> 
> [Severity: High]
> This is a pre-existing issue, but the port exhaustion check in the driver
> appears to have a logic error that could be impacted by changing port counts.
> 
> In drivers/soundwire/qcom.c:qcom_swrm_stream_alloc_ports():
> 
> 	pn = find_first_zero_bit(port_mask, maxport);
> 
> 	if (pn > maxport) {
> 		dev_err(ctrl->dev, "All ports busy\n");
> 		return -EBUSY;
> 	}
> 	set_bit(pn, port_mask);
> 
> Since find_first_zero_bit() returns the size parameter (maxport) if no zero
> bits are found, the check if (pn > maxport) will be false when all ports
> are busy.
> 
> Will this cause the driver to bypass the -EBUSY check and repeatedly assign
> the highest port instead of handling resource exhaustion properly?
> 

