Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A6B47ECD9
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842629; cv=none; b=lSsjWJRsJ/XltTb5RrAtBUEV7cAwFafHbI9kvUmZLefs9/IZ/hQ3LVfrjf64oGcA2x1A2WID/vqBLw37wQCjQcFS587w01eBUGg1kyDuCw0FKjWYfXpQCVzCNjjSdjk53B1JKNATMSzBCZKoaz1N6LMLrzP5yhlxSfSZBrsa5GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842629; c=relaxed/simple;
	bh=gbCeaYueb4U1C77ekL2Y8TdW7/dkPJFAfNT4ZOSKnSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l36dmqsU/dQ16BBa2osXU0fU6F4BbpckBfmY71n0lFJaGGU1VMyDBiRObywxq3tzILcDq4KzwnLL7nkNgKzPU5x7C8vTc/jWuMOh1ObBMSUs+8quKwgyDr+BoCRzTjmmBtQIZX9eZF/aKng5mtVxr87pCv+amk/bMLhZT0NNFfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDZDMFNM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PsoHlJvx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDZDMFNM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PsoHlJvx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5E4f41848041
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tPKz/HiMLs53acXB1JMSjHsFsUjIwUH4RFDs98hoyA8=; b=UDZDMFNMrbZGhPao
	cTnogM+rZXlQkIBdBYdLOPBs9eIxerykN2lvqlvTJUedz0z5tB6GggZZKryPXlnV
	cro2gdDnW8LKcbFKGHBDIQ3Nvnb5Gz+E6xsb/KPo2nRcp69JKW8m1YqZdRj99geK
	aQGwbPPcNqNfCElL8b6InWFqJsk93FkcqUnmDLU2JHg1CS7hFvwynPqnG6ZwdvTI
	5RjjoqnC34ZcxdJ1nWsTB9gnkEdEf4ZfnCN6vBXY0zgVrUl8UyPHNfmsxKJ5Vfru
	HtnvFhnoBDYw5R5aonKFE1mIYTg7Owp5bolKKYrSXP9brOUx+cJLQS/0grmHGEbl
	TIpXfw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t2w4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:57:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e429ba4dfso19765381cf.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842626; x=1779447426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tPKz/HiMLs53acXB1JMSjHsFsUjIwUH4RFDs98hoyA8=;
        b=PsoHlJvxxo9+oVSd54ERB9GAwJDFSwFXtKZFIySAyhZ5+a5yXfT/YqhoEG1lbJvwzy
         HtL8Nm0ACHLuk3DIr0CJ6yCa+rLB7yVAUBKmj4SOdlXafkDAAwIdhEn4IK0VDmwOdi1C
         ssxMa4sfp5AP24Hu+VgVKmSwPFdlgeGXoaw2HqFhdtfIgplTZu7PGZPUDSTgmOSALPME
         OB7FPy/SfI0UShsIU+1Yh9fR3bdSt9oKdn+oYaex8EHmMk3yOJgBhoaww/i1g8+tPkjD
         vlnRD8iqlXzPmDS/X/4npoldIAYSpMejSW1QrdEgQcf0cG6LOCi6CTp1ygKElFUfBeVI
         +N6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842626; x=1779447426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPKz/HiMLs53acXB1JMSjHsFsUjIwUH4RFDs98hoyA8=;
        b=iu+kFXGfJBV0C2RL7gtwIX1hWnC9uXGaO0oBqHR14VnJUR+80bBbqcABMYmuXTWgUe
         LGTODGW3x17saEP8pzBuVVBr/Ic+dW7agxKdLLkVGS35BU2VW/DZozPe8sKf+qHXK+KV
         2tfiGomTpcMpC/a7iYlgshmOYuHNx0Fjheo6m28wwf3rzpCnqvAhAhH2csvewFA7rndi
         I0wIdPweAZlM40oH+6nunWR/QP6qNcGllgsyeJw0+qv81j2DJvflWM0/zt8iD65U7mhT
         U5if0WOURYRL7LCUVEtW86St9A1EPvvw/rYX2L9TXQLd3eddc644qImoaAp5IvxjZy90
         BtsA==
X-Forwarded-Encrypted: i=1; AFNElJ8i9+EDHudZCgNZiRjhEvmsPKh/jQu6d+vsWv8mfouZzAYi7XiJju/zt7VTbwuFRFb0VrTDZ3vSMzkI@vger.kernel.org
X-Gm-Message-State: AOJu0YwzDmZDoPLHEVe2X2yYA4YFi+F+79HIRULW5ZZbpWhlAEWe+2OM
	t5TmKnsXffES+ttLdlWZYcpBF5oLeDN7gk97OawFeNRL1vGysISbi8mWERm1HQKeG68lAyyAuBN
	/93AUMgg+F82goHI2JOeinhMfqmOnxGVt45x7r2F9r38HRsdC8YR0eAT2vQZgI0cZ
X-Gm-Gg: Acq92OEnK0OUmsPisJ9y8dF5ETWd6wUadC5Ir0a67kff2XHaGi4AA1rxeT0oRoesiQM
	dNMz6kchtRWZSDZbf44TFpDjofPSd1FwG/B8O6OKCsql6ObGlxVaxxm9rkI1wl2iJKCq/33Vpva
	ZRiioQEMYYoIZ9DgXwydr++K/cNv7b9o5vpLynNMjtiX2e07Kk+kikzJVPzdRdmBJG1KSxsP5F7
	594yfz7oMcDt+pnn1cCvY4cUapmd0nj1ccMBMZdglkGhvo6ZcNe9Y/XmZgc5GCzx9I9EupZDlkQ
	0xV4RnP6hcoWk51R0imGNvURbzJ+h+7NHIfNjWeAQw0gO2yXHOMMJPq88FG8Ok8LPDnEF3Gke28
	IbyqLBuH9IEU2r9JEr6chcKNHij/gKirbLIgy7AWhueUxBUswXqd81/RmX7T4ItDb15aHlN2eRl
	18Ito=
X-Received: by 2002:ac8:5945:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-51659ffa7abmr33292831cf.2.1778842626270;
        Fri, 15 May 2026 03:57:06 -0700 (PDT)
X-Received: by 2002:ac8:5945:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-51659ffa7abmr33292501cf.2.1778842625877;
        Fri, 15 May 2026 03:57:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311660f6bsm1834858a12.17.2026.05.15.03.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:57:05 -0700 (PDT)
Message-ID: <826835b8-e760-4b71-ac90-4245c0878594@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:57:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: kodiak: allow mode-switch events
 to reach the QMP Combo PHY
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mahadevan P <mahap@qti.qualcomm.com>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <20260429-kodiak_v2-v2-1-c3a703cc30eb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429-kodiak_v2-v2-1-c3a703cc30eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a06fc02 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=M33i-PvshYg3drt0OFQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfXxOl5W4ExpmvY
 Rq32odTgp9QLjXGb6LTE4rQDgRtBWC0kq5X/zvLCha6Q34uncYd8OXA39grxM58TAF+tFJEV0w6
 B+tHlX0HoSZHknIaiD+KyFoK0gjh9WRcO1BgRSL5EWig15aRO/pufeLl/XVF90oZQoOA3L0Ha+z
 9EbuL25DecjNboHX4q/wYpoXyZ3AJApVneqDdH0q6BpBVLx8uKrffysDCVLLRM8S3AytJ6blWAL
 +5BvicOq96LxJDE1LsG1dVlDmip2NjsaJ9dyvBa4fJwQxwOViNejaPtL6itrMEiZtzMmqwj+iNO
 jwwGXGgdSn2BxYc3OI02YKY/BnXGXOIeAHOuYguQxGi1PJjafvvmSTeeEEmbtfdVuQTm13fD74F
 Owrpfp6//cMirTxbCYJ9htvd2ss5m6PVNIyJMGLPU+txLM63Dd/q9qGTUKhr7JyX3Z5liWgnjmG
 75b3YOM5A9PmQmZ+Prw==
X-Proofpoint-ORIG-GUID: l5ZDHnVVPeSt0J9frM9R6qquN2_xnLF2
X-Proofpoint-GUID: l5ZDHnVVPeSt0J9frM9R6qquN2_xnLF2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150110

On 4/29/26 8:40 AM, Mahadevan P wrote:
> From: Mahadevan P <mahap@qti.qualcomm.com>
> 
> Allow mode-switch events to reach the QMP Combo PHY to support
> setting the QMP Combo PHY in DP 4Lanes Altmode.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
