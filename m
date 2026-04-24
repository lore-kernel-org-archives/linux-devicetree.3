Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1CF2BE057
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777032217; cv=none; b=oO50VaqP06H97yvplpBJKmc9PngkuPbFyx5lZpSDd8PVOCGh6VeLRq4x0pvlBlqK0ZlV1eWKxJ3QD0EAn2a/7Z6pPXeEqhijAXLJHmwFKuyhUo65Kt6IQ+MOlP+zjI5XWmKExshqdRpJlG1/0/7W1oEvQ/9jf8nJ/3gWPj6eQuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777032217; c=relaxed/simple;
	bh=P03y8Cz/PQho1qaJY+z7AEvcB9WS9ziyAKvPnj3HDQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RApyf4QsNH5Ys24mex869pGXU3xZyMg5G0DHpSVfpOZjrTIN+MsOAeP5LUpSRuUuYXGUqOJIuDFwr3gbmEBde+qypwo5RhJIs8a65etnG5kOXaVT6K6HU1GZkdPNHB3chGyNhUqAQpMOiRQ+GIRb0WAAfwk1pzD6QexQKfs/Dhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IaoJALgQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DzfPZly5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IaoJALgQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DzfPZly5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7ILhq1888440
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UqYU+UVD7SqbPk43y5btMoFYViDdfcSDL9l/g8yShPw=; b=IaoJALgQ74anwTfS
	qnzcMCSb9cSiGZB5L14Gt6WN9GPIkXtjkpy3yh/+Prl0nhegxl+oEAu3V4x4pR9B
	nZFFt+aTha0RYuOi1tR3b49G3Vmwn4DOCopva/o+7aaHE2FQVEJlHxBqHWZRFrTk
	LygjeliOXF4YU8UWRl+mHuXAZm3QSiOA0yw1r1/GHdMicWq0+B/ZkCm+m2OvUFCX
	JM5KSg/YTyxVibTDISaCyDmD0YZeO1qAVYCfykn5Skon28TRTUgDIHWsSrNqTiPU
	2E7rzhcsR6KOKqDpLI9+6yn96QT5YfnLM6QVWLkTbGww9jqAIEAk86IdABczP4gA
	586/zw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqp9dvjh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:03:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eec753a7bdso115214485a.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 05:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777032215; x=1777637015; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UqYU+UVD7SqbPk43y5btMoFYViDdfcSDL9l/g8yShPw=;
        b=DzfPZly57mHccVfn2gEEQnpr7jfLrjGtM6vLXovz5GdJJ83F5sk4IplaG9AnoajV/M
         9OJaJIWqMjNMHmus5n9AJMoGKLuuJwPX5XkedMScnxdVGBgNKv4QopmS8OZh3Daz09YT
         GkLu2vxkh1ECAcoXslJT+BVGb5iLyikiXzq+4PA3Kiw8wtiadnByakx2V9T2UH8s+Jkr
         x4gK2TIAfoAirE+jl0FskmeOawniq9vMe2J5VjBzcP4ZC/J/BDVhleHkuiZMKb4IziPE
         O7180PGRKcmiLvS/DwVZnDDErwIiSLC/DPeTQFUfS4lOAbzw1NnyDgPLEPkfOCNMO3XY
         df5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777032215; x=1777637015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqYU+UVD7SqbPk43y5btMoFYViDdfcSDL9l/g8yShPw=;
        b=nv2ThyDz21Y+QpKzKGVM0EhzRRV83B9Q0yZX9eK5O68xvdskY/PcSrUgSwsfARPxJW
         ekKb0Ck90hgFWhceqWraL2FiVey6MdHWQe6JBnj8BlUCOW8XjgXzAHXtyl0SO2M+Ksx0
         AdjiC0WZbKJJwQcfbqzKiKxE7BTRYVaYn/HUBgPBMGE50kIxBgp6PaZo7+eul7nplYzT
         IPvUfAvuT9+rLctChBhdL0bMERtjMvKF+22O4XcsDuyrh8RjRYRZpSQAVcrrkpaJsfUb
         4wbq4T+M4aO/iIw+uiHaxy2CSYfs0ZhX9YqTDhvjJRaOXVwSC1vgfz1/c5/a0kGfpLMF
         lVFQ==
X-Forwarded-Encrypted: i=1; AFNElJ8D/3IgWpVXICsT5xYna6CxAv/vV59F2i6IL5I6500KOsKKA/C15EyOImDGrNr13Srj/AWlwTV182MF@vger.kernel.org
X-Gm-Message-State: AOJu0YzYX6YCNfFg2DIvycefGsU/ZJmklC2/V17PXRBYMZuRCtg+Tom1
	0nu17q0ptbH/jbDbC6gJKPbbxYYpmUaJneJ0fL4nrrlwJcXqsqNwhc9gHpIM+uSTjPWwWIjt4hy
	sXrEO8nWNpHHwtoi769oZVtOLb6sLFSap9T54eCqPeRqcbfyrfSFfBMVvvLCuI+fS
X-Gm-Gg: AeBDievEuqQJNaPbnJ8FMNR3mpqx+SNtFXRXg26eIj0URnLOR9EMTUwUrtixj/tr3e1
	LikKmEyB60XDbwokBkJdSAVmlRvDyQn2g5q+Mary6lu0LhMW6jPlpnaoHbqbnA8Pl8eOVS73IXI
	f3q2NZeWT7f6KGS7bI+vzSI816jONMfB8ILLh2ZE30PjDwrquZTOoMZ1uD33XguyOdqfrM2iN5C
	XlEVRsj+muq2Dud+e8zVHnm5QPQP+W7dL8N+3QF2/DpfgO3AZjHEnO47+XiU7gPyPoOTZoStb7r
	q5lnfe8iijs2XkTYp3LP7Xzu6jtidI1F5VxFLoRfrAIaZBiOTPBjT0jSSC/6ITW9QaUP44OG3Te
	HIrF65plcrbrRhhDHy6djV0RMCTuFsHLntLgqSLBH1EqV/0vXyYQK7FnRtSiO/yvJL1iosVRsAk
	ox8VlICPVXHCvNNA==
X-Received: by 2002:a05:620a:2ae8:b0:8ea:c7a8:5065 with SMTP id af79cd13be357-8eac7a856ecmr1607169185a.2.1777032214986;
        Fri, 24 Apr 2026 05:03:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2ae8:b0:8ea:c7a8:5065 with SMTP id af79cd13be357-8eac7a856ecmr1607165885a.2.1777032214518;
        Fri, 24 Apr 2026 05:03:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d51820sm5008447a12.22.2026.04.24.05.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:03:32 -0700 (PDT)
Message-ID: <4d1d71e2-18e9-4262-9dbc-4e05cb17d5a1@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:03:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: kaanapali: Add qcrypto node support
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260424-knp_qce-v1-0-813e18f8f355@oss.qualcomm.com>
 <20260424-knp_qce-v1-3-813e18f8f355@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260424-knp_qce-v1-3-813e18f8f355@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3JlQqE7-7tYL35ASrzDdXC9XBhTFGgsd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExNSBTYWx0ZWRfX0EQBSI4PE/dy
 0aRHz5+qTJxQ2mcK762dXrpNMP8IN/Voa+veJbjnbbB1qoDSoKCTyxqaFF7tX7fgcG/3tfXeaQk
 Ml9p/ah8TV6YNwz9MamU7e4Px3fX846mqhGlOIBpsHWQtPQakYc5tP+K+xZsn78GSbiGTvE8yig
 iDb26bdLV0kdbWIGRy4LlvCo42IUVFYmNSTTXtTBQR8rNRAwjYu2YC3lcR4eOVqy40eZi6RaaWQ
 7b9s5mQo02rV1+l08lew5pQxldstb19SN9NnQN8KQxS7ADeOco3faRUXzM0v/Y4vr4KeVaVBXhD
 3romInruntZu67OsELIHCR7/Q7/ZlYbzULIM5Yzf6eFANaQIt18JJMjD7fHRA3jXpf21hubbpyv
 E4pw4lm7PAuATAKQcn69F+co/q6JgD+0Qn6skoVUF0WvOjutJWGxuXjqTCRuV1w9tYk0rEdPrdP
 BjD2TOXGKvtYhWQ1B+Q==
X-Authority-Analysis: v=2.4 cv=fP4JG5ae c=1 sm=1 tr=0 ts=69eb5c17 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Vc80FJqyMH11bIRubAIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 3JlQqE7-7tYL35ASrzDdXC9XBhTFGgsd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240115

On 4/24/26 1:34 PM, Kuldeep Singh wrote:
> Add qcrypto and cryptobam support for kaanapali target.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
