Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2403B42F1
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 05:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783314883; cv=none; b=SKmgEv7Y8HufSWN+hP7kyscS53VdeCPSG4OPSYwt3vtTOdaX0OcEaclXUP/Jo5akQt8sZ9skvS1r2SIZcchHEAIhG/OhJSQic3J7ZlfSLOe5K613HVAsvh8k5mW+Z9bihi4IWWxEEqujxbFvU9RBLg3hjOZTSeHn+aS3fKDTD2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783314883; c=relaxed/simple;
	bh=43ten+Gz/F2+MVp56/Q5AodSmF6Ff70fegkfs3rK5Rs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QKUgd2Jr6aGcZLR9fpTegRENodGMea5TSt9mgbqcz2Y8fvsMaJUgHBGnM4gPSDkALibjkn1vFl1Z2FaPNCL1WfgPzSAeQGjDEMol7pXm4EQxT4eWTpfUfeGE/VMi2Y4AjZZMCUBfwC0l9/ObFspaYcu7kFuWmJz9zIXe2pW5iRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oexoi/IK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imRtolRn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oexoi/IK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="imRtolRn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641c023615546
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 05:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kYIs6wSazNxueEfC5imZ+rnvShLGqCVrBmYh29toab0=; b=oexoi/IKfP1qRu5K
	BlcxNHcj210n77IvNeQKzmT6enZEjddXuJqiG8DNsbmPhr98QhwgIaQGc8i0gA32
	n+b+6aVuVc3neYXustu21UlWfWiQvr/60lQBybn3ykVb5PVRRZK9Qm9Z5pBUq/qA
	oTSWicaKasaXsHvk2CD/Xr0n+7SFdXgb7xmXHYZY4vb1YQMvXCXVMc9x9NGUY1Jw
	D33spxKjKh3W2zvVoPkKCtXRTfNf68RoOTn1H0LCXC/G6rDXoxxtjtc3oe0+c08T
	DNuRgpX6e3zQoiqk+HDtxVMlm/XbllGei6GY1wS+rj51I9B1eUvtVrTwLDCaIzkw
	QfQtiA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3ce8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:14:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-847ac21582cso2750160b3a.2
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 22:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783314880; x=1783919680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kYIs6wSazNxueEfC5imZ+rnvShLGqCVrBmYh29toab0=;
        b=imRtolRn/ILSsxiYCVNduscAn2eJv0H2FrX4qdusy24dvg5XeKDAwZ8cRSStofQajm
         7EH+635EO17FnaqP/N+y3XMAzmVOyRe8AcFg+pzyDvSkzAU7k95g4PeXqGm4nODtUlPf
         UBZqNts0ZC+1zaf8F+Ei4qr1C+ZvI5H2QgvnIpxHmYm7S5fmlDm35yVyXr1VqbrIrBu+
         fVCUjR7Ht0FZZROJ320CYWvpgli2e4kc3o3fP9W4ou1eyIvKMhkTg+0UrCZTBzzr4GYv
         L1V8JLlrpDBHVSKnLRP6V0fPntgx0jI66rWv4A5MRUmzWyu5cR/YReds5BhK4sVoWbMx
         T5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783314880; x=1783919680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYIs6wSazNxueEfC5imZ+rnvShLGqCVrBmYh29toab0=;
        b=hMe+hxRl6C2g5pfaufQKGb6XhGf/TOTVOXAt+yYWKXpxkaJp9i/GdVzo6k2ldu4rI1
         jW+fVE5kErk2n1CcgjOUOYJDRmdQRIP1NlLoPVl+BBxF6fE27co+rKSw1AVB7/oYdE9i
         7k3NHMZ3XL0hQSyStuRfJIZy1JhIlN1COR8/zilNXTr5iOHFy7Jwv1c6j/eX1L3z56S+
         H4pJDG6EfpK4K8o5tfJ/BodDi4RWxRguGZbP2N2XRD6za7hYh+pgbJTvdOxQzxY2ojov
         YYZnp9UOTHL7Yd3MQrANg1nR1jNu1JqMGSD6fn71U3RLhilq6gkhegWPjdYKLQ/1lzYD
         BFQw==
X-Forwarded-Encrypted: i=1; AHgh+Rqc1qce2PU1L0zoiBdJtVJqIUTIOJp9XVfRWrVknS0yXPtPbWhgyntuXr9z5WeOXiEeRq7d/Ih9LQTp@vger.kernel.org
X-Gm-Message-State: AOJu0YxoxnsbshgmAmGBx2J1ZzA0mpAAwM49GYbxAwkmNyzKdXhFT6ZZ
	FahBErLPqgPto7Ekiu+GzcbC2Ttzp6GYoaflFDfDUhBtkXYj3j5P4FOHRuac1ibHA5UFMSncUqk
	BsMZ5kVzW1yACGkWq/H1dv+MlXYJI8lRm/E7LDkPHNw/BSdpeA4zPfkhUDIuS5Xjc
X-Gm-Gg: AfdE7cknrPadp2mcXxwM2Gzhfv3neA7xKrYzf8dRTZ44Oi62KYOkJbwtK9/AvQxhsL5
	MBZOBqP5JisIC2c+NFeWH5Y6mMJT7V/fjc3gc5tTXGYTbHzMlUp40n9bZokj08VJQDcvsmiYUt/
	qP5TSGNZiLhzqO2hpnS6TtRdIR4m2BHe8j4oT74D3l4gG8LpXh6RQSZ7eDB/fbIOiQ/A+3+jzGe
	jpZeKvT93zH0mMUtSY9nBL8koI3acqEUOw78FDY2h0v3n9/ihlmVLcgP5MkFlADwe5r/EjxB8hP
	LbsxH0jCCL64dHwe15AVCneAMUY4I2ixnXwGrBex71BBiRNMakv684GXt2MI4jnegVUThvwYacg
	o21hdz2hGfRzxEu4mN75FRhedZyXNaNoEsKem4OFf1sw=
X-Received: by 2002:a05:6a00:4294:b0:847:9268:d73f with SMTP id d2e1a72fcca58-847f6d5dfd5mr7123210b3a.9.1783314880428;
        Sun, 05 Jul 2026 22:14:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:4294:b0:847:9268:d73f with SMTP id d2e1a72fcca58-847f6d5dfd5mr7123182b3a.9.1783314879970;
        Sun, 05 Jul 2026 22:14:39 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4986bsm3015278b3a.29.2026.07.05.22.14.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 22:14:39 -0700 (PDT)
Message-ID: <ecc468fe-5c19-40db-8df7-4c57183cfae6@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:44:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] dt-bindings: dma: qcom,bam-dma: Increase iommus
 maxItems to seven
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
 <20260702-b4-shikra_crypto_changse-v2-5-66173f2f28b3@qti.qualcomm.com>
 <20260703-steadfast-greedy-seagull-ad32ab@quoll>
 <e53f9b7d-66f1-4922-ab20-f6e66015c912@oss.qualcomm.com>
 <0b182566-2a54-4e31-9a1e-40bdbb0f4a65@oss.qualcomm.com>
 <bb8f2283-93b6-4ea7-ada0-875778c89b3a@oss.qualcomm.com>
 <95251d7b-fcdb-40cf-aedd-a60773eb3136@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <95251d7b-fcdb-40cf-aedd-a60773eb3136@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA0OSBTYWx0ZWRfX324tUM+ONkJz
 yjVz0zWz+VM7SF4hb7qq22CePIp4sp8hUkmKbbhYzH6Nn1BZg49Kt5FZc7ToV8Wr15jhSYLyGpB
 dh2yo9cdFQzkcvixcgOpPhGgJjfpPoE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA0OSBTYWx0ZWRfX7QS8SxwYukiU
 ihFB/H4Fg1DLgTGqHWrmcQg7MUNctoX8RARRNVjMiXEqfhsRFMRcWVKUiMttW2WSBNAcmPMxWoe
 S9rZlvoCKw+L5VRHtyMPXaMaX2kzpZRKiNjjoL23PybvmVecFJ/vorBOlYY+cIhrqY+LYdhVwHp
 e9nchabobadu1+Sj8pdEt/4d8j9zOUQuD36Q8qy+RdcDp1qiIhj1SktXIvntzcTjH71GY7F0H8f
 KDzkYuAbDzOUnRuVp9UlxVxvGWGN2n2HZGAzgmjNMY2aZHjBwDFLVsHYioYXN2bkEnasjjUlUiy
 5f5u4IWUFRM5BiKNnWnijl1+swMyRYSH9zhJ+olD39gioowoEKgVMHOxaSgEDIWO8Cx+ZIbRM4D
 KzwGsaIKwx6A9RJgQxBzyCO805so9WytohetwM1q8q+WW8B1YTkC5OjmvZcQXrhn7GrYUu3tLEl
 uEzib0xBaCgHWmL/O+g==
X-Proofpoint-GUID: L1xH83HJcoLNKQ-hb84489x5cattadf8
X-Proofpoint-ORIG-GUID: L1xH83HJcoLNKQ-hb84489x5cattadf8
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4b39c1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=dAOp68QCQ5i3jAq88wQA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060049

> From that answer you should have understood there are no warnings to be
> fixed, no warnings to be mentioned, so that commit msg should have been
> fixed.

Sorry for inconvenience, seems i misunderstood your comment.
Let me update patchset again and repost.

-- 
Regards
Kuldeep

