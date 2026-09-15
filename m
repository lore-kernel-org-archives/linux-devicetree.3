Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AA3272E56
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459587; cv=none; b=XU9FZVh7xmW7YkoLK1vLtMCv1b+9k2Of/GmWzryOp3b54BUm+NZ9a9AZF4TM7+hYLDz83RH1QHQa9VV1XGep5rtLLCPYErh80xCeKhAV/5tjXoq6HfITgmPIKZEZx6dGUFFpTzaHLoG9Z0W/7bz0v1WLWDBdj3mcIaD3abq/OwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459587; c=relaxed/simple;
	bh=w2RqG3qclQ0b3vqrSZ7rQu/ZijuhNd982Z2cxVNhe9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qn49eIYwVM87KMQ047dPERnfb+Tjx40hV9MO4xaNF/vHSnSYAsQrljuUMW67m+dTdpafIJtueYiVCy/Sw6C70Laqu7Fbw0rRsmcoL3xxCEYFSU3IM+J8H1TRnIzgTAQQUdtaMZLFa99jQJF/Te/vUYjKSTvwXb+fL1f+Hb+VQmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muRe7bLc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IlEjsoT5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muRe7bLc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IlEjsoT5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZA5a2983644
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vL0BemdtzLl4WTs9lf/Artj78O0whwANYl+37coacXY=; b=muRe7bLcMrjbdwT9
	bbPfYnO3/3iqq98VbBcfNHh/i3tdzIRAFNv/8x0yL9QWeedaEBp8mvk2aP31dQvO
	09G37Ud52FQmqZdjiBAuvNFRGrYia/7vkA047P8TJTku/elO6fiByKCV5TDgzQR4
	iTsGr4855ij0i0haT8X/SuqE2qFaUTKE1HKkGkiDWfv3Bgx3vqUgB/2M9HdykAIy
	BoYpoZpntL8DbhVPjl/8OdePKZnXhtO0hcUbt7KTDycEOIaoxTi3aqzRoFAcvBx1
	8o6qoytJ/M+K0dX21vb47ZWXDprKIcv1utO63YtR1yzXRLbTC7meLVn3oDeLHVFx
	R9J1zw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpnet36e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:06:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so5030538a91.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459584; x=1790064384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vL0BemdtzLl4WTs9lf/Artj78O0whwANYl+37coacXY=;
        b=IlEjsoT5j6a1EXvYhhv7LCCb+7OmmvXJNAfWcs7c9Rn20ujyGgPin90LaBXvSNgVA/
         OOjQ0nt7WqnsTcxAGc0RiOcL77XiivW8JAw4nsLkr0akwuWJ6rlAQcAc3g4EpG8QaCbv
         eAtbZQrswrK5UVSfzzsd3i5AR7V3oaq91deu1VsSu77NC8aEeVyi2VbCvDiU5gjj9++f
         kfq51MUYRg2wwP8MyVw9a5J2MS+MvQy1lzu88Ps3QH+oxRZ5zEfOOeP8viSAdP0LTD9v
         F7MbLm1hbf3F6d9n8seCZPQPLwwht4QD73d9FpZBBq3D7dloRzpZK/sYNxNtiyvqDABP
         9epQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459584; x=1790064384;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vL0BemdtzLl4WTs9lf/Artj78O0whwANYl+37coacXY=;
        b=hLhtXvjwySnNZO8k5zh664736Rc6qmY9vbHbDkR/fhNEVrKY1tuSMFgu2TX9zghmKw
         JQMUpB9rSbCJGThzaj1eVbyPtID7stFbQlmKp8Is56ET5aIZUCzB0Gj3+VeCkdm1L5gd
         frJe+hkhZjC30LA5Jixk7kjiHwki2SqHhx2gncqZMVIWuueEbBqhA6NImb8/aHMaMcFy
         k/C7MdFgJ2PJDWVpO+ytDHbaSOlPUPmc0y+MjE9QanlLOsXhNfOq2QTQsZn7fXCXxq0Y
         2d0ZPSyxvYJ6VkI/AubI6bJid99JPd3SfkDoNO5Xz4Mfr/YkT4dbWt3ok3AXJxLyN3V1
         4d9w==
X-Forwarded-Encrypted: i=1; AKwUvBwVi38TWBH+s32ZpR8wFRk5Y6GeHnUgJMJkiJgEFU8qyLihGBLqz+ZcTKPG5C3xG90dsA3dUCV9SwtU@vger.kernel.org
X-Gm-Message-State: AFuF++nYr2EqAHaXWTu2io9q7JI6A0fbUy345RjEX/aPLkbzGUvo/Z4F
	vVitMIQUuC74G8FTpbX+nMX6NAJZVrHYv9hHyxzmbPP3NSDL0Az2Vm0iUHbeoBloniRAoSG3MsY
	CalW2ebpZdEGqOR73cmWKcGr9BwFqtapKzQGbskp6l8ZkEmaDsC04rAXYITC++1j3
X-Gm-Gg: AYBFou0qmrPaPUeIwL8pgQB1fjFOufUwf5gXIN3a5hz4xJtwyu0DCzVUXNC9Ad/um+M
	EIGGhpT7QNZm/5goDGZauFQXEFf1rRGtQLGOsupKbgL7xF8T2+zzIoxub5dYImf8nU/kc4Mq65J
	mF4j6p8ObGLNEwHoTCmdxUuEJaMhCw2QtgpcmP3xlM0hwNPjwJzZwkkPdSyBbu1dJAYBwGH3JuQ
	yTYMOxYGBZsi6SXajdf/DQJr8hdvJDqpH6VThW+Yky9oOebTaQ/TfXHq6oqoS7+83K6p6k7dEqL
	/HQLg9j+GPxu1qkG1kj7qBpVT837C8dzvtJcENJhn7ejNJt2xMgPXkUA7y9Br3IK3FfK1UfthOR
	lQD7H8DBSvfkmBrLviSY0AFMhws8=
X-Received: by 2002:a17:90b:4407:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39debff3508mr11708439a91.10.1789459584210;
        Tue, 15 Sep 2026 01:06:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4407:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39debff3508mr11708373a91.10.1789459583685;
        Tue, 15 Sep 2026 01:06:23 -0700 (PDT)
Received: from [10.217.217.79] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50efsm36397549eec.28.2026.09.15.01.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 01:06:23 -0700 (PDT)
Message-ID: <e239269c-89cc-4465-99f9-3257b213b35d@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 13:36:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/52] clk: qcom: gcc-sc7280: Tie the CX power domain
 to controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-23-9d5a606ada33@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-23-9d5a606ada33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNSBTYWx0ZWRfX+jdROQfC3Ch7
 NnCwqk/SoJDoa8hHiKy5H9zNtvxNPJgBIH6ROvdH/VJ5vKa6vqBDzd2j6WpDRvUzzt95qgURq7Z
 E5bhsPWh50ztZJiQS0hlK1olj+RallM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNSBTYWx0ZWRfX+wK9HUR7Krh0
 wUNhHN4OP4e/gd5Qgu7FtxA8voiM5JAzLtaOkfyJA9d0NB9so2HjrllgX5XnFTwf73ZGPWO2TPc
 a4jL2+2X7q+3bfJP7FszAOBWKxNNOXO6kwB0l9+ti6km9DwZ+lNaHxmm6ROYifYH5XIKt9R3pch
 ociMEvK1RU+Cp/vWdjejMQ9oE3vc/WY7GWKbb8AweCd1qryaaZL4zUQNb9D8F/w3n8L9mfAhcOr
 TDpWlwFeJC61AgTmLMpBDAdMtvmhyoBD5FLPivrL0w2aD6VDF+5fspf8bA8loJQ7nHVcuJcCpxj
 v4vZJyB4nTmil15pm1lQsETzgK7iv+X+9x/K6xMqQnvd+e8UWpbt3+XskoqqC2ZSDNUAaj0np6k
 DFYkik9jAgpa9RbcSCC6GbDIVvjLO2nEHK3sQ92nM40T355YYCqRj/6VUHN5vSLuFVN5Wd9CZb6
 0CfDgvCivOiNTtABjAg==
X-Authority-Analysis: v=2.4 cv=PKKaavqC c=1 sm=1 tr=0 ts=6aa8fc80 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=8AEooqP_IvclZvvwVwIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: PLAv61XFrOXJMWcaFE1ANdumGrLNJSWs
X-Proofpoint-ORIG-GUID: PLAv61XFrOXJMWcaFE1ANdumGrLNJSWs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150115



On 9/14/2026 6:17 PM, Abel Vesa wrote:
> Enable runtime PM for the controller, allowing CX to be powered down
> once all GCC consumers have released their clocks and GDSCs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sc7280.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
> index 4502926a2691..bb8f6efb88b1 100644
> --- a/drivers/clk/qcom/gcc-sc7280.c
> +++ b/drivers/clk/qcom/gcc-sc7280.c
> @@ -3446,6 +3446,7 @@ static const struct qcom_cc_desc gcc_sc7280_desc = {
>  	.num_resets = ARRAY_SIZE(gcc_sc7280_resets),
>  	.gdscs = gcc_sc7280_gdscs,
>  	.num_gdscs = ARRAY_SIZE(gcc_sc7280_gdscs),
> +	.use_rpm = true,
>  };
>  
>  static const struct of_device_id gcc_sc7280_match_table[] = {
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

