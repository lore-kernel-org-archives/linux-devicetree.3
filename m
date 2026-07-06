Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5FF2C21D8
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339326; cv=none; b=PjJvfG5cQgZyikKimKxpZpQnYn/dgkY9b3KjC7UyYo8QVu2ySB83v9j9y1R7X+yupfC2VbmqQEJS7lQZDxDL0jStD/jRcwehkongliwmMRFLFbznjYUAJ9Fd12CkQ//hAuNe76DujIS4/jQUZ4OlcJcJOH79T3LXU6JRMOJaj2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339326; c=relaxed/simple;
	bh=ibd9j0TYhA3ef6VnnsN6ZGeTU9TDGcUj6xKZLhqifXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fwKXP1UHhxVo5Jbq161Quq0FblLHPvQyDq1d5QaBCG6x6ihB3v3GnaU+SFz8Nwd1oC5nNgc2HD9kOOapp8K59qWLjq/jSpNLztIwzK+Ax7voteyLcuwopwobRSe+icrJ7Uyxb/yc74c1aPe0Pm9KkNwYrskwLDQ6NcfD9hFqmcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I/2Ep4gQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UiziOe7K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I/2Ep4gQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UiziOe7K"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax9w6391062
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 12:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRfU2tL6xvmoxRw85U0zq8PguQiagILdyl9QqLKfIk8=; b=I/2Ep4gQUtfyQBSC
	nORKngLwgB1B+83CKEG+wcwb9jvwmBHNmIfUIblF8x1PEQjfL285Evu1KUJKFCW0
	AbngmzoJhZpN2c4ApkUIUtmo5G9DSL5wa23P8qrrsTNcjN9smIuhNcPD1nJXk9uo
	6vx4+uwOb8S2lJG4siYDCb5fp0QiUtC9j093TpUpgjXkboZR4CKZ9xcXkmuXCzbF
	Dd3eB7vHVG8W4FsoOpgvL0R9oiSDb3YK1X/He5a0ygbw6kxzR69Jq04TH89jQaKM
	7GiXmLM7Y40fi5NV3TauLMjysN0vOLKWPObi70UqokqQNi4SbhvDItv4tbtg6lUD
	4eKt4Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgrkq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:02:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccbb61893fso2520145ad.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783339323; x=1783944123; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jRfU2tL6xvmoxRw85U0zq8PguQiagILdyl9QqLKfIk8=;
        b=UiziOe7KqWeIgee4Yb63U5pTcrbDWGL3GqwFQMab5ODaz9pF6ZiBr5MyAoCkEv6qKi
         sBqUBVpcCFYGhhPvh6r8PFHCQDNhfIWyqvbLP3tHuvlvuukyYsxyAdWVzFfou4Il0O/y
         ++tjNkZljx5Peg4ZGutAru3ic5Fu2aZskny1B5jIGg1HUrryyeB2f2oGGnorERHP2Xw5
         KwhxYiQbqXbo4yJdq7qs0uhXWJcRtKVjSPKY64YgxbaDt2Ie5T5zRH0+cpJAX8tLpYPk
         5ta6oZ8OXzq2WVJYmsLUYMGoqXRKMDzC7COjeJGfvp6HVwO+ZD1wD43gHQoQbgjyp451
         16Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783339323; x=1783944123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRfU2tL6xvmoxRw85U0zq8PguQiagILdyl9QqLKfIk8=;
        b=QmU/5CgC70YNOTn2SJF6sjX8vwiaS4lqmRufSzd7BhnBDl2ukkhT3K6pDZQHj90bdt
         Avj6K3qatZ11umjVKh/otV3E8lc67AzBdqG7WnvA+89X1CEec87XfC2BiTSr6cjD9x+C
         CTlFruDxvPCzqyEDLKu/0C3QTaWBw6e4O09MwoQwJE6WOFR/R4Qastn48zvYZqY/TLg8
         EgvhPkWGbSjm/r5hvwuYasQFUydL8H82G/+nExmCPjRQW32WW/+50IFJN1k4tfwM68wk
         IAmgxpwU6/G0P2Mb3o3CbeLH2av3xLFkoom37RqLVd+9yBQrtPReLlNfDJGnmd705z/C
         Kwqg==
X-Forwarded-Encrypted: i=1; AHgh+Rpc6GX6L9GMa7wxbNJ3XFpZr28OMm08gfAXE9NRbM0qMQKIbpWb/jpaJ3tF6RXl59d8Fm3Ct7EZzds0@vger.kernel.org
X-Gm-Message-State: AOJu0YztGxjSQUl+3vJQxmYRUjrMkh4R2Qs0t8XE5PqlRgC78C58Eitj
	mrI/HRBMSipUiYCHAR+FT676rYFaYXjZEd1ulmkYxvMTkOpBWF+nq/h8F70+GDpg50Kp/qcJ4bd
	Tkf4/rEBoHVABdlPPA1BmSFo64tc88CWfXrKBteit/NGNhUXgVxL0mYwCPSiNNzMS
X-Gm-Gg: AfdE7ckCeFS+L2IKB8FUr6vr727w1Gbl06huL1M0Uw8g9P5VaJTIU1K0KnWtSZAFC7W
	EaCGZgpBS4xwn1GQJ8S6mNnxFtbWEnQzUCZxxfWD+gmAxy4ZDRP+RM8MRIq9bra+57HFlC3ZdvB
	yl+sdubfuFwweej8kbXA1nGxV1CWqMB1XTP7FDPrc7doKbDYPY75w3jMSsPaeedLD2V4g/ptNlD
	UvIJyIOB9RwS4BZLCs/kP1od8pRJHg4ykSCfcYb7mtYxnxuMqX/bWKWnPB6YOgrBURUCKqp3FAN
	aSiVnvSLqIzNGZ7NJsFc3/G8+qCjWOxHIDLG0AAxsv0VvS3Yp8Y9q4JjGEjsW61wNBa0m351MnA
	zr53pGVJgUA5KBrU934GZ1zESGcXt5R0PbWAhsS5H1ng=
X-Received: by 2002:a05:6a20:2589:b0:3bf:b3d5:ce2d with SMTP id adf61e73a8af0-3c08ed5080dmr302591637.7.1783339323350;
        Mon, 06 Jul 2026 05:02:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:2589:b0:3bf:b3d5:ce2d with SMTP id adf61e73a8af0-3c08ed5080dmr302556637.7.1783339322904;
        Mon, 06 Jul 2026 05:02:02 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb10645sm6364018a12.4.2026.07.06.05.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:02:01 -0700 (PDT)
Message-ID: <4a2a6773-75e0-49b1-8e47-a9094d84f5ce@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:31:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Maili ICE
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260628-maili-crypto-v2-0-f8ce760f71d6@oss.qualcomm.com>
 <20260628-maili-crypto-v2-2-f8ce760f71d6@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260628-maili-crypto-v2-2-f8ce760f71d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VEG8XS68vqN0hKDiAFqjnQwm9P6iUSbl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyMSBTYWx0ZWRfXw6jfYqiFDfVI
 AVrslBp3eJCYmgZTDWesfXUCKlPVA1wrtqR13Rhiydf2LRZqWr+RPW1n9EUTi0P+5QyGb1k7Oug
 zE0X1gEX6cugQ/UTnqthrlr5waOYGXpf9AVHKBnzR+cIrACMmDR/Tem+AskVCcoqJXUtGMn3OdC
 DywJsu2iR9yyTXJUdcwCa/KNKUi+v3q+ccm7Cts2uur6OcJkWdCmS8SgO5O5te8bj6kP1L84Lzk
 gFiyvBWlSCSgN9Ubj+XinRjUXPu6wRz2stGzD86tb4X011Y7rbUmu+xf6lR3MiGiBw4LbxdY5nC
 V6Vv8r0CKiK/NVmUMuRWOY0yvQbjVNG3Dgu6YqLYEsGXw/VU5iPYKjOh8UQPXHEcOL1ouoQQtCM
 qyozjBFTWj7pMFPxac4weUJc5T0ixgGKwZf/mjw5AuxmJTQQZUgBy3Q8KoR6t0NetTs5DdkX5OE
 c4eKj1zmXkdMDbeo6Yw==
X-Proofpoint-ORIG-GUID: VEG8XS68vqN0hKDiAFqjnQwm9P6iUSbl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyMSBTYWx0ZWRfX0LYAHOuLAzVX
 33GA2B2Yi+nuqWR5LJ7HNZzZ3uqWdXQ8mfg525YUdt25nb4jLmA+U5Vu9PLN0K5WJp4VBuDFnKX
 KNR3UAxZBEQOm8pO6+wMTBr4/BUpv5Y=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4b993c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2m2jUygTAEm4Nlw8oZsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060121

On 29-06-2026 12:14, Jingyi Wang wrote:
> The Inline Crypto Engine found on Maili SoC is compatible with the common
> baseline IP 'qcom,inline-crypto-engine' and requires the UFS_PHY_GDSC
> power-domain and iface clock. Hence, document the compatible as such.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> index db895c50e2d2..d80f8445393b 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> @@ -16,6 +16,7 @@ properties:
>            - qcom,eliza-inline-crypto-engine
>            - qcom,hawi-inline-crypto-engine
>            - qcom,kaanapali-inline-crypto-engine
> +          - qcom,maili-inline-crypto-engine
>            - qcom,milos-inline-crypto-engine
>            - qcom,qcs8300-inline-crypto-engine
>            - qcom,sa8775p-inline-crypto-engine
> @@ -62,6 +63,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,eliza-inline-crypto-engine
> +              - qcom,maili-inline-crypto-engine

With below patch, maili and hawi addition can be dropped in the list.
https://lore.kernel.org/lkml/20260706-b4-shikra_crypto_changse-v3-1-23b4c2054227@oss.qualcomm.com/

-- 
Regards
Kuldeep

