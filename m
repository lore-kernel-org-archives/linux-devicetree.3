Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2313D3AA4F1
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 10:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559247; cv=none; b=r/ft+mQjylMR9DnNrEwe3sjDi7/5OScnf+zpUif/csHmxDKwHqRF4dx1lv32archSDPoyqv8KaZSkiOuEV/2tFgl24Ili70Fwf5EZD8YI10CkQ1AIHKZ5+bnu/eisazswgvvXOXo6QofS+jguujFUCGc2KWpaZQ0Ke8WeYKmXGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559247; c=relaxed/simple;
	bh=cDtysJFCTVlhLCi8K7fMRs2yFDSXsxiLpHPhAa2G8wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E7O1ZY6fRpvzb+5VHV2zBJpPX59JXkk3hiVazsK4qILAWTSDkD1R5zXZV8DYeixDvZZW1BTCLhjtgbABwX7owZYWmuiszFmkJLxcnekAlHg76phNr+qh27KdNUnO8xNcnYj9te15IffPyQARKjJWRubhLOAwLx7MzRx6HwxGFmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C5e8x0wC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JfsQHdkE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C5e8x0wC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JfsQHdkE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376gdBE1584423
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 10:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CPhQgmTX2jRBkQjnSifEgvXH19lDzdJqEWxJWe2dowA=; b=C5e8x0wCsE7pASpX
	EX9J1nM/LxbA5gFqR9nk5PRPJXjgcOw3Wss0fKWlDDKAdI+qE695J36Vtl4ZR76n
	Ha21Hgp3G7o4jC4UieYwjkhP4rvdTaNgQPmTYmAPYIEh3dmE53AIitFJZTZo4B4J
	wQdYiGWARC3/ug7A63SVWc1n7e8unPgvw6ggUZ1GgNKjUsysE4BRmM8l21Fscwc9
	XSylcDGPl+fksafYsfex4+SEOZXyjrN0LL4qtRto9hW6Qy/UnHvfRK7tHQoBu/H2
	dvyXu2kQ5FqfJSQtMz1yHCPIrTOnkiftIDqBvb2b53CYUcErVmQ1vw6xWNNu0rAe
	pZ9J7A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9tcge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 10:54:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b33a19837so18430941cf.3
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 03:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775559244; x=1776164044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CPhQgmTX2jRBkQjnSifEgvXH19lDzdJqEWxJWe2dowA=;
        b=JfsQHdkEgobnULVkreiVrAUAmM3SJIwefzeBr32iORMBQSipa2Z9dD2qGHBcOGVXGY
         VWRL0U/69FgtmIlDylONR+ELPSpbw9dH7VtseINS5BCvvt1xChjc+H7xXsdS1DG4shnk
         iHI8zcIeFA+slBMHEgZnFcD8xyQzWYMOkMjHaKQpBiQ/34UasAqn9F2jkEck1to2oDm2
         7wID0n4swhY0zyeymDhkUa0xAhabbS7UdGXvGTPptopCZeCZ1nNp7ARDWIv9vrcSLlfv
         ftx/CdKDy1qeRu41gLLIT+L3ulMBAYQNcaVhm4xYxOkbvFTw01Fh6EMWBD7Dsuz9BRQO
         KH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775559244; x=1776164044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPhQgmTX2jRBkQjnSifEgvXH19lDzdJqEWxJWe2dowA=;
        b=cXLau7CNsiROUzfjxnslGdha0yVF5AZE/1ihArYgbSpIy1deNn5apiaG+5Zqh3lXIS
         jXur8Cvsl7aPc+SZaKfCCv/VbM7ZtehKaY0BfVKZein7hb+oJWA4Gr1K011nQQ/TpfMS
         N9OiNfkCxOFFLoH6uxAteAnTA9G/Nin7Y39vWvjVW2b0YQPBxE4yndfEjqZBjIxmE2WA
         Jfke9VJsv59aEsWLLG4v/bWRhRrUXCJedPnjnS5/TF5Clq/X5V5vPrXTHf6MH3h5tuil
         Ke1sxdXvlnZzEL4aiJc+8XN02kYzp/KmaAVawTB/9QaPufLI+wyR+ovQbqd6dgv0B9sH
         II6A==
X-Forwarded-Encrypted: i=1; AJvYcCUOCj5nYuhLXvqg0/oat/HG8l8NsMP+BrEDgnH3o7us9LyYPscu4sAvx38E5TrImgWdE9ChqgeQJWcu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ZWYrB67qTk1KAwj9t077cRrfW2SnSv6ifbjcSGqUsw4FYGcC
	N1cebWZqVEUb7/F4flmLPJzka6y5OW4ZuUTNcNPL/z1npAymAw20remq2nUtzep7IfL+ovXdH9U
	U9PjvLfJNpKVIfBjgWO6TqE7M+jEkA/+DQhOP8T/cBgAhKjTuUbh4fPdYKo5UG7S7
X-Gm-Gg: AeBDieswv5OSgkjupczSPgusW4MVk1XDHd9JId173H8hPfklTJIBSi6FX0l6RPEaWkf
	UfHJ6pD4wlUAncRYRT7GMWl4tUi2C6ZZqSb6rh/dEgWaV+pPDyCN8gGPXmwP6mw/Xi+aWA/yRR0
	yQi0JD22WAxQwO/G5v3rI+6T/WS55hncmCamA3g60hOw3lKoxccPyhOe73OuPHlDV4yMjZPPxXq
	OPGPTJQtHPNRRy5Fkbts7fuGlFbMaVUrR0k0orpf+S6+yHhbSBaeBG+8or9VfJEmxqwyeMwNAyO
	DC30zhzQEvdGlC5S1Crt+dSuS1e1naykdmDF+xSbhLWYDDptVmp9n39S7vgB1GaJG3FFqp+R7TY
	5YgpTflrETd+My4vHRY+Ytz9IUJ28Qp7aCdXrPuYexnQ+4Gz7OyKL5UWarAEFAu3s+MMf7Cbh5U
	eIbEM=
X-Received: by 2002:a05:622a:2b44:b0:50b:92cc:f879 with SMTP id d75a77b69052e-50d62d201b3mr165487931cf.7.1775559244453;
        Tue, 07 Apr 2026 03:54:04 -0700 (PDT)
X-Received: by 2002:a05:622a:2b44:b0:50b:92cc:f879 with SMTP id d75a77b69052e-50d62d201b3mr165487681cf.7.1775559244047;
        Tue, 07 Apr 2026 03:54:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec58f1sm551798566b.33.2026.04.07.03.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:54:03 -0700 (PDT)
Message-ID: <03f8cfc9-4e62-4181-8108-7cca4d48445f@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:54:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] interconnect: qcom: add Hawi interconnect provider
 driver
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260406-icc-hawi-v2-0-6cfee87a1d25@oss.qualcomm.com>
 <20260406-icc-hawi-v2-2-6cfee87a1d25@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-icc-hawi-v2-2-6cfee87a1d25@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d4e24d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=X2bA-DTC1ecWuKQBpGMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwMSBTYWx0ZWRfX1Z92Fubs9psD
 Kmtw3Coeq2/aH4HpBKevRvwRUkFouQ2ygfOAW3+yLDE/CCNQGHw9JXK5C77ziIQyfOKTXVWpISE
 7LimqZ8omwYmWJ3XOEB/OWRdbuf/tz9V84b7aIIzwmtMyZqqgHcHDvCYT3xNdHViV710EsZ0otG
 PdO1Rle+LwGCejEfp5DsqxV1ujNfkzJkMR/nVqBKprqiPYmh/57BdrwdwxYElX/hllAfird6Kka
 vbVt+o5jc3KKDLGVleCbkMOebBOkVXQMippiHj9yEz/TsN8s94cV72BEE7bm17yxXcbjYU3UXGE
 9C7sSDe1evDw0NapLCmuGkYZTE4RA/xOOatarWdyjiyYwRbNNNA3UdtzlTnJsRJR4arxXZ9jndO
 B++P02BgiZKoWHTFS1v3kgwVvtOZYyJ97uVCZWEWKTxoZ40ew9ClHySwHhpvpZ+f6BjjkLQC5iQ
 J/tIp5UwDJInEQYneDg==
X-Proofpoint-GUID: c95sU6i-mEjEOgUKJ1mn0RZ23x2iOOZG
X-Proofpoint-ORIG-GUID: c95sU6i-mEjEOgUKJ1mn0RZ23x2iOOZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070101

On 4/7/26 1:04 AM, Vivek Aknurwar wrote:
> Add driver for the Qualcomm interconnect buses found in Hawi
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pair.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

You lost my and Dmitry's r-bs from v1

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
