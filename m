Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F38A2798F8
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 17:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961746; cv=none; b=deAHvHF7o98RQa+PDZREx/18cQEbUFOaP2royUG8+pQGLca9LOhT7U3EqbkbYMad3MLdcSa/rIxFXVQkz/Y+NJ1p2A2KqDil4qMH+Vtp9GW09QPTZjbKha51L3j1DjBw8BQ8nzjPoR1mdJwG9SapZLdQTTP9sQHizQ9gjHFuasA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961746; c=relaxed/simple;
	bh=wfkQTCtihLuQmkMLSwbhTu0nmBiQEOBAVacLI6it58U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tPmG5S4qYlk5vdv+/GYvv1z5hBUC6SGpwaD742u1P1cTdXbh8Rf8t8If/mOnqhRTJ7U6xUDPKWEeUX8ZdYjfJZ6wKz03pqgxYmYgksMejX6p35D3SI17dWDV7qoURYddcYNbXk10M0mnBLzubOCCGcAAUEIoiTPyPSaHAOCkW3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f4b6DvWM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JxquiZya; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f4b6DvWM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JxquiZya"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H6MQe1675861
	for <devicetree@vger.kernel.org>; Fri, 2 Oct 2026 17:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tR5tyXwtqll8A7xHJC6SBeUbgFbK2QmhJ4Eo1XroUTY=; b=f4b6DvWMKkZ4SuUv
	SMc4ECK+16+u/XjEnUJDUXU+RI6+O5P66DCqWtdKyizQolxNe3p2Mwck6Wa8oaD4
	wjPrFHKxekDCVFLvUR+cPZQ4MuUVYVxQdmhivEcKAdEFbdoVkQfk8IP54PHrbrfb
	kLZ2gCEFqeVdyyyVanpwKo0k1SSsDj3FD4robtkr1ahtQiimE+nwOxNU0zHmHMWo
	vS6wb3pslb0tUU0UTYd1XCgMd/U7jXFFNT/N0DGbrOsU+XZ1lEp9zxQbB/3HI8Rj
	ji7jgi9eJcxAemgb5C5ur3eIUgt1EAAoG9ASxaZ64nITp7dCN+J23IYuleYZwOEA
	iNxwIQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ft8rajj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 17:22:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39b6416441eso209040a91.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 10:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790961736; x=1791566536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tR5tyXwtqll8A7xHJC6SBeUbgFbK2QmhJ4Eo1XroUTY=;
        b=JxquiZyaLYW9rEi2BLzsb9xykanhQc9wqF1DtFB1YKeNcdh85W999oi0wS43RhXPZ2
         IwBcdZRvuFWA7oTyRcNQ5GCaRVNAVDE0gOl+XeXyuqx/CclivNis3HyQwAuvvAKM7guE
         uTFZPkDEfqPGn+hIgVJX1vEp5SoYHVCVKd35CjxUwj9SPS9ayMZtXA2h/0GSr0AYGFpL
         rUsTdrvX6Qz6JxaeQQNJnZJchmnJPzh4SX4GAj5qYQXBAKdXue3uPmL7e2R4krp2Cfl6
         0n4wgTqcMuzSfqsjj+omFsiqp+PSmz8ba1O3NxKkO8tbJLcbSGhJgbbfQ5fsm7lOIK5a
         Wlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961736; x=1791566536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tR5tyXwtqll8A7xHJC6SBeUbgFbK2QmhJ4Eo1XroUTY=;
        b=SNNpVW8Zq6kKBhJAIlr5Yn0Hr/6L1BLRefnAH4aeVLWYNC/dLfceT0c4M6xS7VAJ4r
         30UaUeXGE1uhwyEIt8BY6OZqfnN7fXmsfCfsTsCiPfU4EicliPNJX0FP6pSLL5Wifr+9
         69DBSSpOrzCCWxVyzvab+wIarapDKHO52XJCZM+uc/eBdbLk51cQNCQOg1geIQ5Shba7
         +K6UNxsbJIrbZOntki5Dgx5/QPNBOPyHBQchSSNodreW37DgrkSz0sHq9ZaDLCsIVoo6
         k5mzUjQNzl7sMpoaPbUOFUa49ZZHCXYPIQJQQ96g5uOCxLId4qoH4OY1WvG594kQ7eLT
         SqJA==
X-Forwarded-Encrypted: i=1; AKwUvBzjYbWznjbSTn4voxSE8e5TLihtTqM3851a3OkQiTqe5NiYcAOYUP8vSdfsYqMNBNDod/+nNz4EZ2m6@vger.kernel.org
X-Gm-Message-State: AFq9FYKoDfcOUNHnxiStjyhCAfW+MAZ/4lDLO0v7NfQGb+xPndQL//oy
	/9H4cq7Bk2uDBT/pvqk5wo1kuIawNZeAdDHL/l/t4L3TQ4c5+G2H2FD8bHo1uDpsbBKRbii+OgB
	fJzl6ODRbcpmV0Zc/FWgBfDag0hliYjLuK8Hk2CQBnnNiw+W8OiwW42AR6d+vZJhO
X-Gm-Gg: AYBFou2wdI9iNZMAsjHxByInodQ1PQpzbQPZfoVEd2RMAhjLHxScPKIuOSmW/xl5axo
	pyHpSFURXEl5BsDmCYwCe+qKiYncFCSa0OLh6iSNw2fQPpRlvgQlu4iCOw9NLtUVZyKHeRLpDk5
	oxwDsK41m09OOl72ZzXkWUIJw3vodIta1n3pMLdi+AAlOU4TLUbEogJ+WHO19+3wT3fKOb0BEFW
	TjxVO2Ajj7n5fkiOCxr+PcAT5zu3Zso5A9IzBCRzcIHjmzy00SxofWJaKjtVmWSDQf5NRd25FwD
	RnJf2GqGMiu8volWQpGnw5cARZInv9PLxMFKWfhGqFsP/nvbyAUS6imZLDxkZEV+n6xwKVpzITM
	G5bL9xIeIg2/nc1Vu5jc7MG3EWuec
X-Received: by 2002:a17:90b:4a4a:b0:3a6:f90b:20cd with SMTP id 98e67ed59e1d1-3a6f90b2630mr1609525a91.6.1790961736185;
        Fri, 02 Oct 2026 10:22:16 -0700 (PDT)
X-Received: by 2002:a17:90b:4a4a:b0:3a6:f90b:20cd with SMTP id 98e67ed59e1d1-3a6f90b2630mr1609499a91.6.1790961735611;
        Fri, 02 Oct 2026 10:22:15 -0700 (PDT)
Received: from [192.168.0.195] ([124.123.196.90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43a12c9sm10811502a91.2.2026.10.02.10.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 10:22:15 -0700 (PDT)
Message-ID: <3acac1a0-a64d-4549-946d-874df45c3dac@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 22:52:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: qcom: Add lpass audio clock controller driver
 for Glymur
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925084635.112399-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260925084635.112399-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: t-__dd6UegR6qRPCaM1ozCgQwUcVxmDI
X-Proofpoint-GUID: t-__dd6UegR6qRPCaM1ozCgQwUcVxmDI
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6abfe849 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=3s5aCXBOHJDmPDD1+4kJVA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6XYEiC8ceDmu1LDSX3kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2OSBTYWx0ZWRfX8Go72t1y5v23
 jujgn9Yz3GH4hWBWiaTGCaIY4aAlp2XpQxkNjm7kOZQeEg0gTEb/tLuRcv/R1nSiQK/IOWbSGAk
 W/ouEYBU2wqoGnNz3eXydi6Rq/hKJZI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2OSBTYWx0ZWRfXyr2y/ZxCHiwu
 SOh4Q75AUf2x5HQY3Bjts7YCojBJP5qUX7DYE8lLlzp77kRBq+6clBA+r6oKbM29kEcAqW65Qv+
 leqMD983zOKot2665fuh/Jigkk1YQwpCkVPzmR/qBU5utvQOMmb6XFFcObIVjjktMnWn1JX377C
 gHXxF6gnlqwMFyvzAvfUX02Wv1/t6YKK28qwOsxPGSRKkgCW9WAtQ9E4Sxlp3QvIzOS9norJY2T
 X3MhWpZfTsKLn/jJbC9AMpZHVOYDR7VW10N1RBPTX+BMWIp/P8LDkd+4stEo3j40D2eGj/8tXco
 QO9/X4o7RmuSRVKjXelI9bOlSfgcJyjh7Jj625wOyWblbAHuDOuLd3EZALILO9INkMnrFav9vPT
 nOGSCjd5A193BP4M7fzzc2Myl+0NT54FopN/6Ixhrwgwc7QLMXHcwsqkyl/CVKOhQrlBwkmjgWm
 UEk2qW/wAz4euLXw8Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020069



On 9/25/2026 2:16 PM, Srinivas Kandagatla wrote:
> Add support for the lpass audio clock controller found on Glymur based
> devices. This would allow lpass peripheral loader drivers to control the
> clocks and bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig          | 11 +++++
>  drivers/clk/qcom/Makefile         |  1 +
>  drivers/clk/qcom/lpasscc-glymur.c | 68 +++++++++++++++++++++++++++++++
>  3 files changed, 80 insertions(+)
>  create mode 100644 drivers/clk/qcom/lpasscc-glymur.c

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>


-- 
Thanks,
Taniya Das

