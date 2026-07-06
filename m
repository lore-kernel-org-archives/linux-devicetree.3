Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8679E3F99EA
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326813; cv=none; b=lKbC6D8AvOdXY4cVIJjVZVigYBSdLcwKNX/zydiMZQSBdQCaCU6sdRSLI51qXFN77hirEKjQuPm6d9SQ4ROtmRXjvGJqE4woi3mo1CDEf33Y4k9S6pU62Do9W/ki8Qq9WISslW6hu+enRu2VbJ3Y/sWvp8b6A8PVPWbUiCIqGmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326813; c=relaxed/simple;
	bh=DqM9Vlg2aPZNJnQZQ/VsD7QqBMtacZIbkNCaz+Jkhl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXww1HuJB+r5zzphdxbb5UvhC0jY62yBuYPl1vmmqLqEIUAQipQPIHdiWK6svAfxQlY2M5ozCZilrGhuF+pvPSqWTY/CVc2rhnUntxJqEbBRmavAt5nJPWoMrqZgHsBMlEaI2LbJSTCf0AVi6W2p7f/ADofhxn8cxdHWySzj4dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qajac89C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqUY0JAT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qajac89C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SqUY0JAT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641Vja3594266
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 08:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o70xj3GpdXezZ5BGktCYKLqzHNkNrH+alBnatmYgxYI=; b=Qajac89CIUayPVvV
	pPzl4yBtgQGpOPBxZYDseQAn/QwNnVLfX3tsct9zjrKkDLurz9d9MNZFMP2fYcZi
	nadTXVu2qYityg1O0IrK8YYGeVv8oDucmTn1MlsX4telnjO1qxYsFkZrJO7rwne5
	cFxIug9ksbnj7Dv47112BinAQrm5mpm0jm2V1PCI+yWGQiCQYTXGsPO8d3ZuJf1h
	TdqD9yvlU+xm0H7lpUdXzAhReFF7yZya2ByTzznYK71MxoXwgMch647CATqABW+6
	W8lWjH2stE52wGDZEw/tXDl3vdVYRbO30cvH5uJZMSpcLzJWEW6QOpVMjnUv6KjB
	xTIxMA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgwmpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:33:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c298a1b20so5788571cf.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326803; x=1783931603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o70xj3GpdXezZ5BGktCYKLqzHNkNrH+alBnatmYgxYI=;
        b=SqUY0JATQOz9b9YjRXgIlyilDHcyoPe9aCpJSfpMPekywPek5L83t4oeAy5XRwX3h6
         3ZkPlx6YFTGIC3Jrk2G0RMr1GW6zKVbBYY8iO8RD5013nTQ465frsLtp+eyyc04dJrQ4
         XKgcM/WaV+P9jO5U+6/6icFFC1YbimTTBiJE9fC3PqZIgp6slXwD16RgYK8bFNhEYkQr
         juw3Iw87yGsK54GqlhSdAUdG4HCRN8Vf9asDx+RSgugAxWsYWV++OA2dXQz4bEgCJDsF
         ePxrSbESdKkoOYrypxjbxPDfLtGYFGPPdBdLgoJFO0UEuQj/9GOZMN3eIEXfF5VZ6hWv
         TBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326803; x=1783931603;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o70xj3GpdXezZ5BGktCYKLqzHNkNrH+alBnatmYgxYI=;
        b=nKNCiPy63oaxPPdfqGkkAm4sJViZxPj6ZrZnVqPYcHiGwOWMaa35J9vcsSwbeH9FJZ
         RQuwayWNZfAe8OJR+SYE8hC1bhEwTeq1+/r28Xf/itNh0p5ksP/ZOa3qkhYjqC06XaOH
         JtkaL4MaeXYMkv6oR7AZ+UuxDiVgaGWr2JY4GRQE6RElnmHimqvHazvtE2WkOAFm9E7U
         thfbaqjjbrzShEwcYcZsSM1Y65DNzrca+EeqflineDUBUApjZja6xq9vOa7oPvZSLgst
         v+4MadKZAltWLjvAf5EDxS2zr8FpEGKv3H3FmT9WYQMJdUeS0/jiD+EFcktSNooliFtT
         iGyA==
X-Forwarded-Encrypted: i=1; AHgh+RodRa9uGcePi/LnH+/cUidz/Bbjc+9Z1FHeKDOJm1PmwQKU4FnSZuCePxTWqo4rqjBwhYpQa6RQjlZx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp0lZKUF3rWAnIFpVogIMF7ISTuOJZZo+ikBFaRwelkV8A0zTq
	EZgW6GPkXx46mwjMn82X+zj60uh5OXsFDKbDEqK0I0YljS4sA9xhQe40IaeuM0Ke1GdXP4EG4Fg
	ToZ3Eb3+shDi6XXdqdRI4chaMqltYaHLKX6VEFrmFUZXTkvvKKZ8zMWWD3TuRnY8s
X-Gm-Gg: AfdE7ck24khkb8XHNCwHUU5igMb3dJyPJsFt84RadqhXBRImC4fgqVwNPToZpLMiR6r
	IirOz9+WnCGMvlBlFetD0ZNqMdwhgvdnXiEKLhLV4AYZ28ifss3x42E6TdMP5rblzjn4ksfowaC
	OQx6d6SOzN1dZ3B9Za6paE8gqJKzVSYALK2zKY7te2p1s/S8Z4SVl0563RE4Uy5CxMaD0sHjuoU
	QXADhhiiPGzLOcPBvO9NKBecwA98ZPzvfi8lf8E0qXNpTHlIj9aF/5ugrMnK+cRkZQBw1Tdlist
	6GmFh3ap+GdpVGEadwmjLmiapleP3GJbtXuuNLheHkqLydEQoCXgJeX7eMocDg1b+MflZr7y0WA
	/89ehwrlF73KW2Uw370Hgm8dF6nEt7CembuY=
X-Received: by 2002:ac8:5e4d:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c4bd94c5bmr87589451cf.2.1783326802803;
        Mon, 06 Jul 2026 01:33:22 -0700 (PDT)
X-Received: by 2002:ac8:5e4d:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c4bd94c5bmr87589201cf.2.1783326802229;
        Mon, 06 Jul 2026 01:33:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628d65dsm692511866b.35.2026.07.06.01.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:33:21 -0700 (PDT)
Message-ID: <15493c41-51ec-47f1-be1f-d211a970e487@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:33:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] ASoC: qcom: sdm845: use DSP_A format for TDM
 codec DAIs
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-2-3b66f33859f1@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-pixel3-audio-v1-2-3b66f33859f1@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4b6853 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=SQmynSovjKWGrNaXl4IA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: wD5J8MBUPdyM62FGxpL4WVzAs-GkSo_-
X-Proofpoint-GUID: wD5J8MBUPdyM62FGxpL4WVzAs-GkSo_-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4NSBTYWx0ZWRfX5KiCJEvJfNhE
 oEjSlwhHcvKH3q9Wrjmya7S3a3V8JymREDZ/4VMmsF9bVW5R/HA8zMu72kr0IC8jCZFlT3CPN7q
 F57E5di3bxImSpRZLvZ50gHFbh3SR2c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4NSBTYWx0ZWRfX8j/ll5f4sjHH
 ThIquv7Qp2dIZS/dl8LNBqbPqeZRFfX7zcmDaFIMp6wx4TiFhk6O1yF+w4Y235F2CUsh/xsr+6c
 nSWKiPcGb+6ll+0xSrelktr+mIkfOth/Am7ho41tbHYTlJFe6zGZgwpvoMhNNczWL70+OgVhURS
 i9zfpqFSoDpZoA0Ih+B8oBtoilo9oekvU0DUul5LriQYWNH/45Vbv4k05pPXb3CCYpHjuu0FHcw
 MpBpOSof8wd2D9wx85N1QHrz2NtDLT6qdg6O9D8Dt7U/Qxm7f9u3tgeW99CP3MDltNClOeBM3Zm
 eOpqWVst/s331Fmw4IOjAGZQLmkTx/oFo2n61oM3OEe20qbvwURCQ306lmL6ELw1/zCChsb9uo/
 xwR9UcJU9we6c0La7wZgXeKqg3oirUXnmaqpfQClN4h0Ot0QWFGA+xyZdb6Hkk0LDcBqpPLY7o7
 QiV6+nDx704TMhO/HJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060085

On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Before the DSP_B only worked because the only close-to-mainline consumer
> cs35l36 codec was patched to map both DSP_A and DSP_B to the same
> hardware register value (asp_fmt = 0), which is inherently DSP_A timing.
> Use the right codec (DSP_A) which works as expected.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Fixes?

Konrad
