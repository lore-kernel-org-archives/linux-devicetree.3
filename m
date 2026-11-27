Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781244;
	b=jaqO4Rf3lU3loBwEObOwFy02y66gchV3v4a+fJSE+WgeX5hwueCRklINrKw17aaIYcAc
	 ZQiXj2+guSoZU4xEzpeqlQN+HeTBtg6KENLnbXa+P2m/+sgqDW0KcG1BZoj2Ty8EDefk3
	 G73D40DNx3EiWrj4SttIv1nYHz0lVel1RNm2UnMXxGdVP2nw0cUlpIdwxTiJpxAo/MEk7
	 VJ0RLvaAuOWFlPnFKefOfVWaV7AFKhbtwUuCuGR5FebjR2Jajsk8sL/0+mv0uCY2SMlTk
	 YV/dOGwa1zLNkv27IOu761VCugPNDBc3c+xZdPH4QQC9BRnM8zVlz/xXlWREbffK3+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781244;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SOyvDr/OZBYmgAj7NapYrDKSeLtN84nxi5oDtZUBZP4=;
	b=I2mrqk7MukJINMxA9l/c9hKVFD8D5tBaUQRe1E10W2LqOYNEv/Z/LWrvUWcCbjsELJyl
	 M98JdQU+nxOfFazW1mAmLICB8Cs5ErUne3X2jGVaP7yU08fc4J3riyeLAaXXOe29b5kog
	 Yrdc96jdXTlKGZnvx83814Vv9omgpZZ5jkLfJkWMTgbLR6wn2UNTF9B0fj6zSBSHm+lap
	 SUZtaT/yj4pmqQQQ4Xuc5Z4aTwzYbiCUPCagBpiDd/DrUapzOsayuZD3zYC/zwiEcwtsb
	 68r1TNb7Bd6uHJXnbmeNwaJqGD8gD9bkbjX6Xdv7q4W7pPk+92Xdf7x1CIuxsY/lLcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kQ2sDyDH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hWKR7Uq6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB38606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFB38606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kQ2sDyDH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hWKR7Uq6
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApDQ91047237
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SOyvDr/OZBYmgAj7NapYrDKSeLtN84nxi5oDtZUBZP4=; b=kQ2sDyDHBMC66aOU
	gd0tesO1tntmzSFbpZE1WyRA7TybFx1A7bW81OXNR2BUgZuBQhdXlOkZQVDaQy4B
	8Hyn/d8UFdOcE9CW6/84nJ3RkHCGctCT7UEyPaOcfpqGtg2beKDAWLeFdRIzFwZx
	vr0Cu66TI/S8rkbrzA5mi4OaMar/7ivoyyC3ujWLpDp92Z8vL7oKA6Xpxof8Danm
	oaYog0stZcVbI5YUWhyDe+eUpxrq4czjWopczQk2VUee2FxfGKQZSfr/7NceMRDL
	2PlDPLB/un7dMPRSdqKhWbvWLvvjryGg+vvMC0vXzO7yfoJsbf3UmhUhLFcgVgcW
	uSu7Jg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqkv7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:07:22 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-71ac8a00173so423565eaf.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795781241; x=1796386041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOyvDr/OZBYmgAj7NapYrDKSeLtN84nxi5oDtZUBZP4=;
        b=hWKR7Uq6H3sVJlnndSCvKtFOiR1+riNrKq6aTBw/WLEnatgpWDbGdX64vHP7osKZiM
         iFcu0OAFqWB8vvCfMW411rLY32LDuwuJAoIqhzMrItz3a3jgYWTVfRuP3oHnu1g8CkGX
         xGrvkyLnBpojP48BBeM/8XfWa1Tx4sESK0jzqOX/cvdwZi1CCb13L6+zV8i0gwQO5B3u
         eSBH43eIIhoQRuDAktXPKU2ZgOIXdGASKOUIAJ/j2xCcWBPhdMz3SbEBGrGSOPTX1lvw
         8tylAXd/BSqtWIXqxybaUSXf/PZ6MN4pYoKyx/oL8UDicBDdP7hkKPtwHUDOCETHm6p3
         hXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781241; x=1796386041;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SOyvDr/OZBYmgAj7NapYrDKSeLtN84nxi5oDtZUBZP4=;
        b=Y+UBTxayquUMDxen6wW6WUDC3sKHLoZeEb99O6/rKVsDkQgtmMq06ZNirRpln6oRe7
         6C9vJ/5OSmDmCzxwDNPASWthnioW1ZiIAr0gi3NxUtziUVAaToN96fT/agXlb1L4OWpx
         UbFu3Qdc+Pu5dFcYdHelPdbWLpDyBpNx8QZzLp2kN48MIt7aUxXnvIg5m3PZurnao7Vf
         8FGb+0KJBbKmDxv2CptF77Do5xZq3uKdmAt1/vBTMFC6qBtxnKdDLBfscLlYvegUhFgE
         iHH9nwKHNsWIBUrM8fNYvCyTtAf9W57g9Znr2qvg1J70Ollc5jLhwgpMiDAlwYZTGhBL
         kGAQ==
X-Forwarded-Encrypted: i=1; AL+hErEN/wk1eIjj8dFnKEVWGFcagy4mYXAjETzVaEXGLWNPZ07+HF4oZf3AhunJl4TPXhzWwh1bE5+ETk1c@vger.kernel.org
X-Gm-Message-State: APuU4Z/mck0vQNCwu5zE6jZdD8smB6gha/YLktKPCePTqI3h6tyHZOaM
	y+N5Y0hH3ihBE9ivqndBt2tPiaMNjIbe+QcVjLeVe7Z90Lv/W1Mm6mWtnePvHojY7Q9fduAEUIL
	DfAbZP75UsGuFDBCBkqQDFxxSvyOpCiH8wW+xVZu6xDVQ9keBVrBs+FlJbDejcxA1SIuLvuIV
X-Gm-Gg: AZFdTZdo1vZMVN2BvZs+25SHlR/WkPJhF/GDn/4W77ew6diYbPMZZM9z90gbBZXj5+e
	VHDzf4sQSUUbw+Fk53pF/tLUSZnBk8fi+fwmVktplaWjTx12DIlNPsWrlHrcA/ctg7i99Ihigmt
	YBrn0INT24HzDyhEMnJejBHQ3G80UHhi0YkehuaMtU0bNp0DKs5jtZ+DOoPe5A0nj1D9KbOduV5
	c3Um7DH95gpRFuo//1K2/Zvp7KKLo4hsTHBqcaS+5ZezzbGBwCp9NWQoPMmPL0/I6rRr18bjw7/
	ANSzXpt8DvP1Qs+Wb/H579VFJIZu09fA4ErY1f4NozNYauDbZbzEUIt+jKo/B9NiMx4rkB6Xaj/
	q1rvVZwqgJt3RkpLRceHoVAGSPdPBn1zjag6u00YGwXscPG/r/HwlnQUc6WJDAwvUOv71zo4=
X-Received: by 2002:a05:6830:1409:b0:863:92f8:b6c6 with SMTP id 46e09a7af769-86392f8d238mr1518670a34.3.1795781241193;
        Fri, 27 Nov 2026 04:07:21 -0800 (PST)
X-Received: by 2002:a05:6830:1409:b0:863:92f8:b6c6 with SMTP id 46e09a7af769-86392f8d238mr1518596a34.3.1795781240639;
        Fri, 27 Nov 2026 04:07:20 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51a161e387sm346402866b.47.2026.11.27.04.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:07:19 -0800 (PST)
Message-ID: <10915364-1d58-475a-b11f-36b41a18c9fb@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:07:17 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pmdomain: qcom: rpmhpd: add RPMh power domains for
 Seca
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Tyler Baker <tyler.baker@oss.qualcomm.com>
References: <20261127-seca-pm-domains-v1-0-013c28eafc5f@oss.qualcomm.com>
 <20261127-seca-pm-domains-v1-2-013c28eafc5f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261127-seca-pm-domains-v1-2-013c28eafc5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eJJBADgRZ618ywrj2agnA1HLvqmUlk3I
X-Proofpoint-ORIG-GUID: eJJBADgRZ618ywrj2agnA1HLvqmUlk3I
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b09727a cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2ZRMiqlpstDxVboJcQwA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfX8K592jbmOm+M
 RR6x9umbJZYDdqzS8DlKTI0QtVxmBR5Jj9bWlWE9aIgXEQC/6YdhWBZfOk9fbzRJ4V0b70LZwbf
 jB25Mu5qKnAtpcSO6Ci95uU7iMgoWLE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfX9jK7+ay/5vXn
 eIqzxhjEdbYcaiOsJKYHZjsLLi7egFerTH+vmBuLxJiMmwjdia5Ki0YGLJle8s7hBhCNlfxv2W0
 NKiViCDVIbHmie5O+yDVy0fmkrbzn7NK6qmEFUGQemyBZeRdsAGtCt9n+F6u0gh+vlKj5YZjrA9
 hXxYzOavhM6GvzM2uH8GTdX95BXiX/ADQ2EYainEGCnFvQ9aCgfT7jKZ/0q86UDyQhuhzW4zwd8
 vpedk3Vf+RlhAPR87XqpIJn8K4ykcMFbVegI5PdZHlvlabw+dABmTxC6by8DyFSn8khx291Ccf3
 NLjK34/XfFliS2XPsBX8uSPfLNwsGKDGNXVscN/7AKRFfZtavuLUlNwjUm6NlSYa2KmIIeBUgfg
 51YNH4E1OZQ0qJlpuWp2hn7UGhP5PIP0LMSnU8bnZBKwPhnJu0fVIpgzC8WSRUcOYsUavZjZnq0
 LgB/ENlktvUVii8ph0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270048

On 11/27/26 12:43 PM, Bartosz Golaszewski wrote:
> Add the RPMh power domains for the Qualcomm Seca SoC.
> 
> Co-developed-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
