Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8209135AC24
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343330; cv=none; b=rfEOIGG1wk/7fFxavqwYGRFh3zxSC/JRttsO9/1yxFT7HSnza2tIuDcf/WnWxiZWqx3cVLHsUsDbcW4U7vxli385peHmWum5jOdeVI/dYYAFJqiZD9Qa6f3el7w0h+6qYj3FZo77SeAwEJh34ulWK7XTltspslALniZUb+6oZmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343330; c=relaxed/simple;
	bh=ex4N4gMCKxNo0AXdWraAdXV4xtpuS2QfDzHJaq0R6ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t2fYdJerhrQygFJcf7+hdUbMLIzp6CO26z4TWSi6Q/QG7sOgN7Fp1C+nQRaBAGjEt7vkXEXGs/LnsyrJwytUdt7j1+mXABxMqqITK5YnT5AN/OBXQcRZqYABMn0T/4wQ5YtfIcfiYLfOoII46z3F2wYq1GSDVVyfCjMvU9AKE2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CuFLOUc1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RKtvzXIc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CuFLOUc1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RKtvzXIc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxFkX368946
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 13:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yr477eSsKfDPRKuaQkHUM3/l8JSKHpFK8JJwW+dZ3IA=; b=CuFLOUc1M/dPROWo
	79zZSY0nVeKDFJ65kBS4UeR7QO9PgCqIJjXTM76Y8RklqArjF6Q4/YC1e8q+WrDX
	7ZZQIrMmLUGeOsaUSpZfSIXtuBm7Lrq8XCSFTw5kOVYXszyVJCORlT5qkTbbCNFr
	xeYtbQUovjk68JSnhKviZ8UAusx9Y5VXMYHnbc7rLXFfFwBIxiKCXUeEy+mAAKGu
	oUAh9HQHwyrw1YIcCeo+7Gc74gBBCVmwp8VraB+wUpeCgOSOoxRE2RBCw8orhTg5
	CMCtKUTlq0l3Qtd2PqfNxOHC7liI2cGap0fk5Wr0jUQZHEoBtCK9vU1x0+cQng8A
	gEHUMQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h996j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:08:47 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73997bfbbdcso60863137.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783343327; x=1783948127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yr477eSsKfDPRKuaQkHUM3/l8JSKHpFK8JJwW+dZ3IA=;
        b=RKtvzXIcJO9NOIn2NNQ6OIqfIL4iDqsolXu5JW9AezFPbunflnDgC7fFrh1RMCApsO
         5u+eZfCUvjgLL7vVElN6hBZfBwqvY/C4D6pXh1MuNSxyUupJfbTP/62shgdMMJjyTO4D
         vS1+jvi24l9bYg0HUaGojDRVW3FE9J7Dr7aIR2neRpEB2KbAnQ8vGs2meFTFJPNsKBHa
         jf5YjEsGeB3yLuDNdtJhjaG+TZ9U8BTZfr4JvYaOV2vjctP7e5PzHyMLJvE59fK7WqNR
         WcWmWRXdc3ByzXQUB1mtw5AnPU5650+LlocaZSePCAyPp4dLK4ch7SLm54chek3m1ffW
         F+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343327; x=1783948127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yr477eSsKfDPRKuaQkHUM3/l8JSKHpFK8JJwW+dZ3IA=;
        b=dFToeTOGoF1bEvYl19JfO/2oM2T7VYP6X3uQKEjX6mJJdsY7BOj5w8B89vqUsCJbK2
         198rK4qBjAMRckv06tsS4iv/J6olqNF4cMtUTup7e2YkF/GaY2xSizeonMC9csOhG81w
         tB3MsM3bp+6n3d+ujo3yNNivGFfOZtSgfKta7MECqMZc73da2OmDSoD2dogjzofwJ3Wv
         IZlH4Ph/68GZaDJ/mie01LXIdAklxYKozEJM1vsp6gPoPq/wPfPKU0s/m/4FTiUO+XLi
         SYAed15gjj/FPv55kBcJHtvy6hh7uRYsISW/p86O+p8akmgQfkDGV1fOdlasJAR4P+6V
         gU1Q==
X-Forwarded-Encrypted: i=1; AHgh+RomaUiGfiYw9MjH7B02uM6sqnc0kjz/5ekw6p2K7RrL2cgYBOHuQ/T9N2nlz8FTJoxyyDd5EGqDZWsQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxFR2svmKBvx0dcYlDfEQSoYmrMMHWDFjnKddr2R/cUUV7sTcUT
	aGLCNokCd6KGh0W7+KxiSHPe3qGvaeXXoRrblogPbhtNoRjuyMpHnWdAe0VU/Hbj3v7JEf6cKIi
	jVQTwOVtRZ+I7QTM9GzfJ3JXkS1GV6rkPw4G/KDkAIC/2nHJAbIGkjQqSyFLOoYmc
X-Gm-Gg: AfdE7cloabx7AUd/bMcDwezdNI4F9OgcYJNNW4fLMjhqoMU5wkjMCykSS1eWb9/AEoF
	E7ch4jzjWSwrzwF2onOISycoHxUccMZTQUgvS4ouYJh+zeFDEtrj6eVKJ4AbCoMwUAPJtkKHn19
	/Ld6V7HmlsiDkIf2MUXqzj8j7zX0ZiDzsU31o9RB+Kfn6UafrjCCEf85diIUxiZ4etikt/NcG89
	U32wNZVsKJDc2aiQzemBnDqxU/kcVrAuTFEQVEk+EHPaAhcOkOy1XkWTIGNwTPonrLId+020+iC
	XQAloVGzjDmKkvehdPRif+RG+5GFHsNncVHSC8HPEpotNG7YOsKaJjaYLLcEf5AzrNv4WH8A+fs
	gmE300Ko0bxinc8wR3FdqS4UbiLOizNsxtLU=
X-Received: by 2002:a05:6102:5815:b0:738:befa:e851 with SMTP id ada2fe7eead31-74207ae0403mr1125626137.8.1783343326911;
        Mon, 06 Jul 2026 06:08:46 -0700 (PDT)
X-Received: by 2002:a05:6102:5815:b0:738:befa:e851 with SMTP id ada2fe7eead31-74207ae0403mr1125615137.8.1783343326426;
        Mon, 06 Jul 2026 06:08:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm752720666b.44.2026.07.06.06.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:08:45 -0700 (PDT)
Message-ID: <b541c7ff-29d8-440a-b501-592ea6688f23@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:08:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Fix pm4125 vbus regulator
 compatible and constraints
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
 <20260706-add_pm4125-vbus-reg-v3-4-999d78a87b81@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-4-999d78a87b81@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7xsgSFrsC5ip9HemSlTqKgqsVQjMdttP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNCBTYWx0ZWRfX0q2IKIClMAlk
 uBFkPXGUb+aELltvzL0qJz4L2OM0b6MszI93ViO+BKNCFUmktWZoAC1cIuVuTzg8h1HwPLmaaac
 MGjKYrVynEAW8z77B5no/hVqdMBE3No=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNCBTYWx0ZWRfX1pSCcwBfOHcc
 huOiFwpMXokJCegW5VGGxc59f2makWz+Ge4fvYQaMqjjRJSrAKaIsNKWVB1lZ6NOBoVnLlHUuVU
 Y/4/13BAO5EiKXzdA+/3dMpS+oG+y2UxQGfRiN2gjirgNjCaN5Gk/PkHs1C/cTMMd/JE71n+4Gt
 a4LDU6gCQAWOGgC4B6dvMTMRRuBiwJEijzOB3GcpQFIvh2iAJ/f1wovuo+mcgEjOfVns/2/CS/Y
 YKhnGijn/ylHgKF/tyLMduCGPGHSVGUcV/Eg1JRTkcfh//EK3+/I8y1HyduP4IVeZeVfNFlt1nY
 +JdP7hHhMYQtDkw1JXh766ay6M9CR5Um5N/pP66tHdI1AsEZeHdcm9OJra4kzqumC4/0/xqfj7i
 cAyXR9PwAcjepJFHjBQfgTyZFD8HozU4rIUYJ/G3peczZ6ZXrB6K9XC1mYIyv2kpBDZz5AJED60
 MgdHGj6olmi9LNamTcg==
X-Proofpoint-GUID: 7xsgSFrsC5ip9HemSlTqKgqsVQjMdttP
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4ba8df cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5eIueRZCLR0BMlXBp3gA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060134

On 7/6/26 2:31 PM, Rakesh Kota wrote:
> Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
> constraints in qrb2210 DTS files to use microvolt instead of
> microamp.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
