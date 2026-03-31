Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE873ECBD9
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948511; cv=none; b=f1jgBHTpYuzaJEfaRA2hySMjFj08GmPizL/lCtzEN00iLlKeI3l1g+tPqLtZ+WRddbTE8K0usDEGtvwyaItYQRz3BmiZnUIVEDqO1nHAbjVdyzk2AM7Kfi+VVh5U/9HfliNfmy1EKzxKRBHlbXIiafHvWx4DFPi1tQEp5q0c5rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948511; c=relaxed/simple;
	bh=7I8pgnyQRdO0BWjCySzAKVzNEcTZwP41eAknZ2uNTnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OzAtKkBD/h7N3nrKbG5kY3iB096f191O6yv3xTlVVLG5kGtmGdkARF+ZEJ/g9O6iVyq9M+0DbEJeB9wmgXZ7yNV6nCpvMVxMvfhW6WbMFzWUlF+ZTe+6IjVuybgclsTZk/8HDEKzREgsR39w3EncJdyotmoDDGXW0yBQxSMFx2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MpvhDN8s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ilUoY+yH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MpvhDN8s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ilUoY+yH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8jtA42049401
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GbwdIaXcDCZ8n+FwqzQDt59cvTDUlTONjPmNtjHi+kE=; b=MpvhDN8swqnPX4ql
	teCten82I5A52Ha7ymmO92XlUNrgPq45Udi2qc9Rl8ONGXgbEcpDq2HMr0QCex8/
	Lgcrus8BhmK+hHIjlENGD/H6RjR/6wP53HzF9hDZBlOmu27eIvjee9yMGwhGYw0H
	q/L/pAKlOI7dseEO6KNVwHiZaqqsVFXpYO6fTCZdtCw2bSsT4ZwqWOJjVD8w3eEu
	G8JAIRjYGsKQRxOBdYZrQ7ETI/d6tTHW99akpMrqTDF0lc8AIETMAXXPK9PoqVk4
	NRvEwD+mauFKpK3zQ9BodmG2/o/fPyDVvC1phGKsnsvh9I/E3KFjl+Sun0XJONKg
	WhyhFw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1yr3uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:15:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b2d5e61f6so15880841cf.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 02:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948508; x=1775553308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GbwdIaXcDCZ8n+FwqzQDt59cvTDUlTONjPmNtjHi+kE=;
        b=ilUoY+yH0qx/7V0ipBMOb1RFrRTu6FfnhM7nUQ4lxgJLFNHgAA1z5iOnoBRwBXeC2w
         W52kRNQXVHHmYQVF52KGmPgQ4wM/0A+Clq3raJ6ILejg3SLQRdS2cbgBE6TZNDxaD3iz
         nhGLWnRsBobx/1jBOlKbF8de3Ry+bM53xYgoRPz6DcpCYhKRhSiyHMT1vUOp1bJdilSI
         PXRNC2JWoBTJb2aoqplJCcj49G2onBzAxZkW0LH60nEiLtzL/sbM98iVPa50V71otW76
         3L6blV6BJgEKDi+oJ7/ZT078BvyfxlOb5naverRfCiJe5gAxrwkoW8/ZGt6WvdRECD3K
         eEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948508; x=1775553308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbwdIaXcDCZ8n+FwqzQDt59cvTDUlTONjPmNtjHi+kE=;
        b=nlejyF6Ik1H4wANsho78Aa9UA/O9UVVt7pP5E/mAWL6knhiKMLkyY5VQCJAHJ1HDUV
         fMD+PfF5o7+kVHw2q00Qj1dsW5dROuEop8YiQA0aHQS8S2AnfdVdpTQz9+BF/h8I5tmX
         t3rmTgM1nnfJQ4jcLuFfVWY0Gr+fxlXkL5thkEalMif+3Auhga0CyueuAaVk4Ag4o02R
         qU1z0JCS548bvVfOGFE0LYSTy2ZZt1N1mvJcLeH+khIVwddQ3LcWHlyFFaCtZkznkxWe
         NWUBoHPh7TYebT3ikukanGVFp+ewC53QjP9urK7Tjk3X63Lqbz6YNRCk6zlHZNBrZdwH
         waPA==
X-Forwarded-Encrypted: i=1; AJvYcCWMEQPJCxHbZXZVZWKCFtx6eO/Vgnv8YQU3FRY7to6YWskZQiMh0Khw1MqlswiJ6rMLV7hdbJyyWKLv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0nHC70FNshRCXGqezN/kQgygIpZ9HrRU3ufLfSovwECsSKNIv
	zAOAbx3y9gTQuxJunzTHzHAKNJ/7qFCypudS/A3y2XQMsywBNiRuVbT/tdhAEatjneGhk88GjLe
	YssaLuO+ImGwUGVso3DjQS9XI5EwzIlgyWtplV/+WEFa9Kfl4Ftw22KwondAu6FEA
X-Gm-Gg: ATEYQzzKSuKTlUBSH8NLg2cDh4ofbk7bMsdbuTv0+uSynDOFF0zDlNRhD9WYU8B2hyK
	RXjUnPXm/WyjkoWLTrjKn3bVRaIhXZ1eRhu4n+LgqZKNFv9xbHs8/MN42r8l6PiomZ7bOCQTk2T
	pHNmo7nY/lI/nynay5REu7KWIhO/L1kmdsgBtZGnhvyGOjvxey5X2KNTunKzftbqRECzx0KaxeQ
	SJ9x+7i9Cdrw2Cc6if/sNoK1h2bpqiZLGcw/0q8rx4rZL5QXh3ndbiCKuKAD3+S4/9S626z8s0Q
	xGlznyIL0MNGK5nkwS3aaXmfDx/c0pMrhti87j1MWjbDFrddwt9xBC9hvCfozWilQ//bs1+PUKI
	BQ3Ky9XjaibYkiPUQVjxL9nvnFC/LpP4BEoVyqtysmPl+sTU7WdkGFn4l8047HEhKNWl/4Loyw2
	kJiyw=
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr165089571cf.1.1774948507946;
        Tue, 31 Mar 2026 02:15:07 -0700 (PDT)
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr165088881cf.1.1774948507432;
        Tue, 31 Mar 2026 02:15:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b225d4bsm381743966b.60.2026.03.31.02.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:15:06 -0700 (PDT)
Message-ID: <690b0263-3379-4776-b073-18abdbf94489@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 11:15:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
 <20260331-purwa-videocc-camcc-v3-6-6daca180a4b1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-purwa-videocc-camcc-v3-6-6daca180a4b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XTNtFY8HRg0xImWR9iYJYyKdHqU1MSSL
X-Proofpoint-ORIG-GUID: XTNtFY8HRg0xImWR9iYJYyKdHqU1MSSL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfX0nC1ifgv+RMm
 SjwOt2dKaDLMpZI0NY1hpepALOYfjD4rhB89Rug6ndsanc/jR9VMdLWfDDiINV6fgwYD8e++9Uc
 eYq5JXjf3uz28wBnHaVgiMTkeFIZafLPgbMweE13BmmLrNMPQxloCPbZGvtfH5zGHH5zSM+Ice7
 z0KzMrfWPLwuzz6WYBDljuslE/tSAuirVBcHy9FRBrHHSwpbEkge9usHWCtwBiD8UCehYrlEUqL
 4o9iQiLv7Z6ntT1EBB80+xUrK4WWsSKw33HhvuyX/jXw6h9Xszcji5vROxdpFPu1cjSj+qIuB9X
 qLppkjolOeF3UnzIvrwRjTU2sTpjVpwz+Ux2XiNHBAYEsbbTj45u1f7PLs4RC0f8P+B3pWnth6/
 4atjhuBA0m0SZoK4zMW9SlcNshQT3BXevBFbMkov37Mjr7QtJY+nd0I7mJh4hHCDjtRexPANJDi
 A0qhNf53n4Hq+/6EEvg==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cb909c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=w3l1uDNNw06S2l6T0SEA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310086

On 3/31/26 7:24 AM, Jagadeesh Kona wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one. And update the compatible for camcc and
> videocc nodes on Purwa to match with their respective Purwa (X1P42100)
> specific drivers.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Can I please get a definitive yes/no on this?

https://lore.kernel.org/linux-arm-msm/382725b5-1e72-44b2-b9ae-38aea1f7a976@oss.qualcomm.com/

Konrad
