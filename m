Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F3F38837D
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368391; cv=none; b=aApZFMXgje+HwfOQ5LH23v5TR7HpJwKamY4oH5aH9DTENDOLIKrBM7RHbezQohC3xTOyhLIzl4DRfHfJJlfTk8XePS+5fAMu4DqUPX0FT09/CWVDjT3WT5nodI25IjGPr5uNQCdm4/z6geq+RznyaWMQL/2pOCBEXRUtn+4wBVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368391; c=relaxed/simple;
	bh=Eg2lG43N/VHS8i6b4DH8RIP6IFimeVpvYdXi48F8ha0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y6hSyMCYChMLTGAPQh3pKc591lsbFOyI6oiPGmKZ7z8X3ZRABPdNXu5/J1Z9O+sB1CsRgnH5MQbgh5FhQ2zX0UU7kM4vS0E3Puc06P5X1JURO/i3MOvJYUYc5/HOqlb/MTJr268tHbvO+Vufn846o2T1ADqXmMeea6boXLKCK8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gk/a7l16; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIIkcAmp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gk/a7l16";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DIIkcAmp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S8lqsC3123620
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HyjdbPLliIivgY7PypN29wpd2VuYq1oJF8VtJM2Wmmo=; b=gk/a7l16EoEIiRgL
	MX6732IgjT2uh3l2g/Rcq745tAhNNFgijEci5wJwesFXDTA6/2kePrBknSIblB5r
	i51PEd7qPU7LDR4c4FCbts6UnksdxAt494l5VcbALSXS5kAQykIPPQmEKkV2dLWM
	0S/3Exa4342O9OGbFlKOEZ1Wr64TQVBUBZaC1YAccdCLmt8L+pTo2Aiu6eJrkEg8
	a/6yYL0qMFQURtgpX7ss6iAZ2GsCvfmLJ1qdEMs0z/iyWu3hba/e3RuQh4plBYH/
	o6wPdIwbltzmSKUw9iEQCUHAyczwBnEOoHoCxCk0Y8Dor8QvbhCSRlQbN9iP5Fx/
	3sqaGQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgmu5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:26:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso105314161cf.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 02:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777368384; x=1777973184; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HyjdbPLliIivgY7PypN29wpd2VuYq1oJF8VtJM2Wmmo=;
        b=DIIkcAmp9OMShlg9STvMq8JqsKAorpeEaW75U3z9M6IT4JmXUurOKTJbbYbNEwuUce
         rnUQMdeXDetTZFGpXW9D6ZpU7xI6wkP6jG+fPCjyZj65nE2RqIt9ZKDhs0c1dEHIcgAh
         x8DJZXpUfG+ZP2tXbAVaSPe/wO4K0nuLu3PdOq6n7ub3f9itmR4J9JlPTSeHGu6LiOtD
         sSztvRLslGpFM6Jx218eKbMXIZjgAWIRWrhcHhjvmGy/HMrmQuWHMwUG8grZBVPS8Gk+
         ew6rhCX8zj9Hh2VGFoIGvx5psmDVXRUZ9gBujj2Q/uclY/SOT/7zaohaMXcgCW9YFpFQ
         HvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368384; x=1777973184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HyjdbPLliIivgY7PypN29wpd2VuYq1oJF8VtJM2Wmmo=;
        b=W3sGdYcthODjUoURcktPFdDHAyP22Spi1vl+Flf1P6mHk8wi0REG/XUg6CRnU8iMYA
         DnDHYFF1A4iu07ELXrGjAWAE/nw8Eck9zCLffv6Avu8gHLW2qwq20LQsP9aFbeE3+VPC
         Z4XpJq9Bn9s9SbmBTfwrGqI9bN/tT4uIf6+GBUaGIDjNoJ8YB3E1iwLxST+Ew5wL7tps
         iXNhfyAH0gsB55buyD9NEbagwIjD7XK7wBkDasqJMcC9dr3BVRY6ROUDqAmKSEFYEs/N
         rjdxhBwVyYH6Csaxvf45wKVlrniizpAFit9pbniULcoCzejVec7t2Ly9nCwzE1hZFups
         yb3w==
X-Forwarded-Encrypted: i=1; AFNElJ8zqMFeBT0Vb89E532DGnvAaK21txoJD5dgj14Oref3V35AbaUl1ZilHDeV3eQ4jfphQFeCYQdPmRH3@vger.kernel.org
X-Gm-Message-State: AOJu0YwXE+FliYES7uV3zXxC29DEuMNjWiw+n6JwD2izdJpRkfOBOAZj
	FOW8rVgkACTySZ/rLway786TSRlhTwy4OPcHJYLNYPYlPbSlbjp9ee24RmgFi0/gn0YXpzjiS9E
	88DbzHrmwYVqw3XPTuHFPDyrE6vCE9lDxKXFtlF7+XvYF2Kdr/RIImhd/mqS5iTA3
X-Gm-Gg: AeBDiesCSj4zCdW4VvJFU3JORa6/DFheBwkkthuaQA3F6KostqpMWmbChTcGcqZFYci
	p3Vp90vU1E5lRnQyS/CjZ7fzpvd9Kw0xxdtDxhfeInQ6F2oEhCIW1uCqQfBI83SQeg5SpHnUtTy
	7qy0SVIOEAQhEKbGfdkvGu8xWuNm7ng8D2SRp+FfnaPfLahfYuRHtJYt3HPCwffUr5XhFaslscz
	SYOiPhCsR5kPQcG8apPmpeS2O0jIaBcazmohQIc/TDnsUk7ZfZPSjbCzJl6VPQT6q/Al1tcMZYc
	qrOybx+fhE0x/jJG1M6H+tsloqu7T1LP6eAtSbRO3sFOw23G9vFx+fblynDXN9oRbpPS+rkMQHO
	DenGrYvExfm5ujaRl170GdHu1BVqrVHPqAcwO8Yri1jnPJSRh4o61+8/NQbdod2YvipJJInDlsj
	jIsQFF53Tqk2RUfQ==
X-Received: by 2002:ac8:5905:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-5100ca28379mr28497011cf.8.1777368383854;
        Tue, 28 Apr 2026 02:26:23 -0700 (PDT)
X-Received: by 2002:ac8:5905:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-5100ca28379mr28496821cf.8.1777368383440;
        Tue, 28 Apr 2026 02:26:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80b8869a5sm72736166b.43.2026.04.28.02.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:26:22 -0700 (PDT)
Message-ID: <ff8abbc3-171e-4881-aea2-8a35ba32086d@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:26:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: monaco: fix wrong connection for the
 replicator
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260428-fix-monaco-coresight-dt-v2-1-2293259bbd10@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-fix-monaco-coresight-dt-v2-1-2293259bbd10@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MiBTYWx0ZWRfX0KTJa1cq3H9H
 xVRLe4g6G95Os2F8U/MFAWNvLpnSUhTxIYx0A/tV2frkjkTZhLvdHrrNUYsto8du8P5rdHJLdDg
 D5y2SDuGj5yXd+HVoRQf+TJ1F1fp7lrJC1dhlfIhACp1qMvExg2WTbbGmo2HQ5wkt8ZPb3tdVRy
 BjqOjKwjBqGNpb7NbHu5v+/pWTgwfW0aPyWTA7DjCwq/mx4busL+S7XX6c7wqpBvFoxtmWy8xB3
 5Au9kjHIofQPf1KGXPowaWfJkOhjwdL2dLSrWTSEtHZsJvrHsJofsGAuZzXd5oVj9oi5RwG6GTp
 pvOoP76bml78PEva5iQpv7CAd6mvQYU8yrJJVEntWpCdbJMQTK5Uu6ta0hil5XkA3docopCV0g2
 SoDXmOUnRapiYnYNNe7BjuuvaSWIOqH+4OOoraKTl0FbmWZljSMCWDdCzmFDp401+ni8JOHe6x0
 3r7szB14Kp1rJgOZ6Jw==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69f07d41 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0F69lvgc4v-fuif56SoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: RFbbedS_95IaCxj-I5eBkTqxGXqUc-Mp
X-Proofpoint-ORIG-GUID: RFbbedS_95IaCxj-I5eBkTqxGXqUc-Mp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280082

On 4/28/26 7:54 AM, Jie Gan wrote:
> Fix the wrong connection for the qdss replicator device.
> 
> Fixes: 4f791e008807a ("arm64: dts: qcom: monaco: Add CTCU and ETR nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
