Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0C93BAD91
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271572; cv=none; b=Sh3i2UKXfMkp/IJsiIVoo5FC/SZqE6DRYUFptLzcqrDPs+tTcC/Om0Qx+v4Xj1fNqIaRO5gsbJ1CwDAtBWEw4GrmhJffe3bN2IAvgMWJqrSEoy580wIE0DRn2f0Dp0cYiIF8qpKeCsrVCygjyd40KEHlGi0HtnlezxeqTyg8ISM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271572; c=relaxed/simple;
	bh=xfMKL3ZvNmS2lDaPseQ+L/awE2GSBaHnumoj9DXHwsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TxToJnQmAvM3DqPipM5i9jKz1zbWVlVb7B41MSWXJ0XOZYr6P1dsJdh+dVTIJluVOznITrjG6VwGe+a0d5sDr0NXhh3FNC5mI8Xl93M9SRA+v07Rbp5V8xAlfwJGJsJFr/V5YF7eKIWer1Sbhtqmd/PPW8OPYkV1UAgZooLcBkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q5Avz6rq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9s2dgtj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q5Avz6rq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9s2dgtj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6urIH1238004
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xfMKL3ZvNmS2lDaPseQ+L/awE2GSBaHnumoj9DXHwsw=; b=Q5Avz6rqxR5pnRtQ
	9IQVDFhq4gVLETl038+PbBqvocCWMW7w3IQXowNqi6u4BAr/ADYIQXXIM+xqWW3j
	QmVZH2OuRXT1JAIQiAmjtEJSirqEG5dDnOfJTZreXBQ5mbxa8Q1oybNE1cEtFTmB
	9lge/Y6jqcs5Jez2oae3Lbr8zA5dgcpieVs4QeluSkD5ShPhTJq+08Py69M+WGJD
	GnKygHTgMDDua6Zk9PxJ6Qi0Dk6sLXEAdQomsHutua2HVbEsFWwBoEQHcNbXbPmg
	Mek7+ybieyDLaipJm7ksx/DJnsBgW7BoVeU8hjGvUkH2NIqVEs3j9gHR42JIgOjm
	7R8xYg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3sv92t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:06:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90fef17f6f5so119671885a.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 03:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271569; x=1779876369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xfMKL3ZvNmS2lDaPseQ+L/awE2GSBaHnumoj9DXHwsw=;
        b=N9s2dgtjQK2JKJiEMNVfhLpmHpXmiOOZVuoW3HoSd/FUQNKnaTA1Y+ipwtQ3I17yrS
         57Brj92CIpeLcRlYt0dx7VXfKi6vJeWukqMXtCpZNIYo6aXY4HQiqU5PwaSgy+w5Pqh4
         SzHXgGITds6c7QIbwGxS5KhVkMULfNMTMk4RB8GOGt8ZM7+N6bIbzFOucQgZwlh9USMs
         Jx768eHwE2/ckiscEH4JiqKNs0s3rWXaDNMPPZsrYEPnL/sQ98pSzVTIZUtqNJvJ+wQA
         b/q9S0BL9p88tn28F48O57lkxh3XkyVQiFF+Hys9qap+u+C4YL+2oWQD+4/DxHnIIWTi
         s1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271569; x=1779876369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfMKL3ZvNmS2lDaPseQ+L/awE2GSBaHnumoj9DXHwsw=;
        b=UYz4dSD7d24TD/aBaCdKlszZJ4pq5iG3s1foIGRyGNhv/oZAYGk/q+VH8Jv6uXfMsR
         duTJXvubR8Ez+L9bi8+xZBvSvarBpzDIDGtjMdJoLYIAGuPEdIfmVAyNeHOP1ZuBwPrE
         SCX3S/uJOvTRXwyUGMBYAswWWc8M3JkkH8maIYwrUcMYqIe7gsJx9MT/KfMU+R6o2Huf
         hGMIedXTh3ghTWR8w2JvKBDacAFXRItVhEgqjwt/aTbZtvy/CQ3nuCXf6YawnuBTQD4j
         Uwini8ChD2jGgURWdkHWtOkrpGuHOZwcYhMhbA3W4Xg+HFc9vMJeliDtBtXeDMv1T8LA
         jEFQ==
X-Forwarded-Encrypted: i=1; AFNElJ9AyqiXyarGoOrgmyyEzs+3U/xEurD9lykLJ2T4Q2h2MQ5X3eSK2P3Jeih36TjfbItQwHYC65+FewLX@vger.kernel.org
X-Gm-Message-State: AOJu0YyPS0vi3gALYZeyOZBspXW3NzJuots+J1ASPfn0+5fDdEhyYVFJ
	Wz9H8EJWYBF+jkzhIqYhLtCLBKtC4WLvyzkTrfbDneuITPaQ3ywzCpGMTGmsD5+5Ie2ClRLUIB4
	HT5rik7Xq6iMkGb/loUi3uzVc45/4ohmXcNSDTrMGkGJg0Hz5bhl/jZEI1LYbOhhx
X-Gm-Gg: Acq92OGxhi7f0ot9Q2B0F/QfMQ2o3rGDFFvYfzhxwzQPwoQ5dNDpq2mZJT1zv+EW86U
	62fwPOqxKV1g5Fimx3hp+O04UO/IhsRsA5LUkIVmdx2DzImrMcOM/c/DsSnsVRf7Cw0yQ1eGu82
	0Tb6F8ZIgGLACqKEE97xtG4Pv6szFfq423pygNB0pU5lryVb75vbNf4kjS7aEoHTebOsTX2SuxT
	FlU6xAYHSOQ2VcK+e/OFb87PjwWNQ+ps+XkOsb7qA23an1OTHmwsgI41KsMb/A+dzWW6ReDyJRM
	PLhP4BA54KonfDPXiXoexv+Y3a4vwndSTVLVYtgRYtjmzO2421rSkCp63Jn8SZq8ZCBAoCYFMxA
	ViE9h5O/b3pncbhulsB3r6gP8MnbhFV8ZngBd6FuHX6BIEGhmqB5dYlegB9CIdkDKuiQg3QBWyj
	MA5xhPEUSVfy5qLA==
X-Received: by 2002:a05:620a:31a8:b0:912:bd42:b478 with SMTP id af79cd13be357-912bd42b714mr1955368085a.1.1779271569006;
        Wed, 20 May 2026 03:06:09 -0700 (PDT)
X-Received: by 2002:a05:620a:31a8:b0:912:bd42:b478 with SMTP id af79cd13be357-912bd42b714mr1955364485a.1.1779271568497;
        Wed, 20 May 2026 03:06:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b50a34sm7741312a12.7.2026.05.20.03.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 03:06:06 -0700 (PDT)
Message-ID: <f214d60d-a0a5-4f5b-bb65-8ea9d0bc858c@oss.qualcomm.com>
Date: Wed, 20 May 2026 12:06:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Document IPQ9650 Compute DSP
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        sumit.garg@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260520-ipq9650-remoteproc-v1-0-542feb6efb2a@oss.qualcomm.com>
 <20260520-ipq9650-remoteproc-v1-1-542feb6efb2a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-ipq9650-remoteproc-v1-1-542feb6efb2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zsbNX-6yLc1QQJGH2tEZy05_TUzMnSIf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NiBTYWx0ZWRfX3uvWEOV0INtX
 +kOqRjeqouxVReYMPb8wRZIVyonvyd/YfEAV/ByJ0et8gWYKAOFLj0wi8z+0f3bPY9MtwUTZeR9
 L98zRBt3vlhnMTQ6tuh1vEi90j1r3a6PcuPobY1nkrnlUqoeRDiGr7dVdmrCDCvl6CecWlISoWb
 lhlyLhQHwiMMto03e4bslIXo/OPhQ8ZVTuU+nVd4Mh6X7cDp8YOLyl+ysnQMh1U0jhVm19H/wuT
 0Gw+Qzd5JOpiR7wIijYRK7VkWTASRwhg8K2YOxyEMffXy/1LXCu4rJMmgFzz45iwm69tIQO28z0
 01sYIKGKP13VGTcupamkML5GgOYNDMJ5YCBOevkQ8petbSywXD+l6ZltHuFF2dbByr7D0xk3eMd
 o78Tvdtx2RQ6epzYg1LteXd9LORu0LpSXpyuodpf8O8gvwAvviP6iHNJZFNwjJpXOgHaKs1q4xc
 O9AOEyT2yaDgZajTImg==
X-Proofpoint-ORIG-GUID: zsbNX-6yLc1QQJGH2tEZy05_TUzMnSIf
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0d8791 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Hw3EFhnQ2gplOow3SDcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200096

On 5/19/26 9:26 PM, Vignesh Viswanathan wrote:
> Add device tree binding documentation for the Qualcomm IPQ9650 CDSP
> Peripheral Authentication Service (PAS). Unlike existing PAS
> implementations, the IPQ9650 CDSP does not require power domains or an XO
> clock, requiring a separate binding.

Your other patchset made me believe there should be a pair of required
supplies instead

Konrad
