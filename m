Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6F94DB572
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 17:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618740; cv=none; b=WzYyKVxevHTS+LKILDY+1DxYWLyjDsdolkZdaTkbnWIa/2/d+gNenTHC3+1YjcDwo7Z8+Q7GacTl760nQOlGf7Zu8rAASMxfO2zfxcRdgZ5boxA0UUvdtcvOao3DbvISzLQYJx/OuSPv2SiO2JcRY9Afx9vLSOk+EormkrIRsUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618740; c=relaxed/simple;
	bh=poQEktvQ8sK43PpTgwOxeKI8wVy+YV2bLxGSwCH7GHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SK8+YOSTLNVpq5HpDVRHNZCpRbRaVzeHhdyNtVWX8fI/i3RY0qA+x9LVMJBCNsI5PlxS/g2UItRc6bdLILAwsijseZMf3MMi14wjk4fJwhrHz8Sogd5fuMsGz52VEtxAaxeUR2Y3GXk/1ZvPfYRqfyJTGSRVWRXDJlC9cvvEHhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftqehzNw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YQQbhbpM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftqehzNw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQQbhbpM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HX88i2374378
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 17:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	poQEktvQ8sK43PpTgwOxeKI8wVy+YV2bLxGSwCH7GHE=; b=ftqehzNwDrLobhv4
	vCTM4xJnygj/lDxiYk6CGUqJFud2/Dsfcjt9uoRhyHSDTky8/QuAgfbfHiQdojST
	ScNAY6h7BxkoFEFIdTefGMsTqkhR2TQHxaOUQs1HX3/xcW+P1TTgDBtA4PevIaWL
	xzZ/9SvvSuMJnMZnMv8PEgJuu+q0/laSifSpleWT2wX5y/JdjEBCLevR0r3mMnGz
	eU5YvEj5+bk+eJef7tJxYUc/ERFqi68gimbLRyJUrhxodvuXyY7+XvX6viTUuWuf
	Of9folAN3n/b72YL4fO06hIiEJzFbs3eoYx1TpzJsPncr3Vhf25JJtfgByXqS6pK
	dsXn2w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg5gmm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 17:38:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bff5c7035so432321cf.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 10:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783618737; x=1784223537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=poQEktvQ8sK43PpTgwOxeKI8wVy+YV2bLxGSwCH7GHE=;
        b=YQQbhbpMPSSVlpP3yWSUHfCUFcLz75LhA8rEteJ2PgwLCU2Gsqp3g+7gYQURC0zBEz
         38793eeVMNbWViZT1/2b/smlwzV2uyciDXH/pIjO9dYytyS3vE+5lQpRrR3S85kwDiP/
         Zk632OHRIDZ+UWUUcNgkipL1cxeXat2pCex/hxJRUOPJLW3ErsRraO4jqF6GztNaRtH4
         5ifHjnVJXoLJ+FipB+V/QftG2psM177+wtqegWAbfQdy0ixr4yxX7BnoG7KLzdrBE6DR
         VocIKIw4U5iyxV08/ToOcS88reKGXtvDNTA6gjL1g8AHoKxuRzOi6n+DyKFAtO5muh2E
         l5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783618737; x=1784223537;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poQEktvQ8sK43PpTgwOxeKI8wVy+YV2bLxGSwCH7GHE=;
        b=RLGnzIFE3S0XmhFgzruCGTlDE3FXh5bvOB6Ft0Chao+At1H5NExVlWXAu+IxHG9FFb
         zjqds7dZwgRDSrPUVEscfAfFqSw4kSFVflEusV/Hos0jVAdLYcicajVZ53C+0WhC6Tos
         knqy9xtx9ZmbHdkx4gdujJw6f0I7O4ba2ohET95ONa8cSF5z/7owYraxDNLqvNBbSf+a
         zdCaYI3TS/fYdmDMPhho5ZIxN65xjxDX0xumMu7BTkVLtn1YYZ0LHEozoIXTTvHvNtQH
         pEgtJI7506+GoI1P0f1B+Q0yBOYgBW+qbb3OyXzVJ9N95lVuza6dYUphBR7yKah+KHkb
         4p1g==
X-Forwarded-Encrypted: i=1; AHgh+RpNnj/bF79hn43cWJ2QSKRLg6FPoTnc+E6wutQzO6hkZiLo1aGv7VPBXfASgBJ/jhxchXAazxtpp+qC@vger.kernel.org
X-Gm-Message-State: AOJu0YwulGD1zs+YZ7zPLmfAJN9Lp5/NLyNshTdqae9Ql0ebRYjJVKpI
	i5Qr3cbmqgT0ydjbw/P433Gfe8AGkY9zuU7NktoHJnRx/GULYxgQaH3LSjfuab2MYQxPxOD+U4t
	7ucX5zEtzhUsghDT6JiL3d1tembnK/k03O6rpgeFo+M+uDw/s9iIeP3OMjSlna5cl
X-Gm-Gg: AfdE7cl5bkqMSZBScWmGiNvYiQ5luSeuZlI5GncP+50UWKnHczv6T2BV5ZsZQCRGSPj
	N/kWtOXKH4SuJfcUciFNgZTs3IUKd6P9v3HncrNJAGJOk2NTcQ0r9YNccN4CKADF0zDz61UUE9t
	1NNDvg34QfbW0dDhdkg54ufn0zjxuN5tj97CfjbGJz7/bcD8AWQZPGkPmSLdq3kEwnWEK043Mzd
	TqlhgdU2hkg9Ynh6JzcmmGl/5Xq/A04lLFtVgFecmogTaDgnTcRB7HpLKq5WkNii4OJYOuEvHcS
	R/HA0vHl3DfeVu9nNEODqLuwNpQxkHLUzZoIBuBYv87/Y3u6cdfMeMc8gYiEYVTLlJ55tp+7cSq
	1Ra93foNjw3oQ5fE/OQxV7WVXx3uhCXLhf+e8y1M=
X-Received: by 2002:a05:622a:315:b0:51c:8439:14d9 with SMTP id d75a77b69052e-51c8b3c2a7dmr86237411cf.54.1783618737446;
        Thu, 09 Jul 2026 10:38:57 -0700 (PDT)
X-Received: by 2002:a05:622a:315:b0:51c:8439:14d9 with SMTP id d75a77b69052e-51c8b3c2a7dmr86237201cf.54.1783618737050;
        Thu, 09 Jul 2026 10:38:57 -0700 (PDT)
Received: from [10.204.141.154] ([213.55.184.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm50653065f8f.23.2026.07.09.10.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 10:38:56 -0700 (PDT)
Message-ID: <b4c58ca0-8844-4776-bb3e-53fa17068eda@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 19:31:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] dtc: dt-check-style: Print proper line number of
 indentation detection place
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
 <20260708-dts-style-checker-v4-6-c175e6401150@oss.qualcomm.com>
 <20260708145452.E9AF91F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260708145452.E9AF91F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FN8rAeos c=1 sm=1 tr=0 ts=6a4fdcb2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=nvVmADDuAioZMzk/ZEnfEw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=WUmGaEhgzEYFincXSwwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX1jJOC1iOitng
 fj3Yx5z3wI/erQnBfbqNS4toifEIVIgjvZ9NmbGE5d70d39DCk4vxjqIYNjf6/mYPz9qySJrk3c
 GmxGSjxuDjrU5yzI37MaOG124TQh7Ws=
X-Proofpoint-ORIG-GUID: qMd52IaS4aJyLJGY5Jm1GnCWOG73cqUH
X-Proofpoint-GUID: qMd52IaS4aJyLJGY5Jm1GnCWOG73cqUH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX2v1SivbAYznV
 +GDEIOE3vEY3fWf6jkDvkIKeBYZV5fTo8DJqzQAVl22ehHb8rkLCtU56m1SzbBe/bwOIaA8IcJm
 oti/Ix5icZ0wLclV8WNmsEtw0JjpzesFUdbyNCTfDBsQa3owNDm0IXX/NV8EtRNT5nMfAD8vgFa
 CvNPnkc6WrHPPs8oAeNP7sWaMO3M4qXM83jUzX2ZeQqdfvn5g2kx6g84bNGaspHghSJ0VUHlZ8U
 f7j5ml0e/cP9X0J7AE5tw2UAhNbRmqogn2uqpvvh610aoC/dJ30sbeT4OBT4IF1A8lRoJDV/nAs
 fvXcqID+Ewzs9aa5FLuTX06GoFfX9cwxj20//bxOAT9MqKkNAs5SjuwffpMs/tFkYFGDTTGp7YA
 Q0vo645fMz/fQdQ9eLsYAvG9Q1NkOPc1IkgtgZMu6irCW08YEiZu9Ro/FwGoVcqMNDQLmgrGnOQ
 RiXHUj0l+GhoC81jHrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090174

On 08/07/2026 16:54, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] Outdated docstring for detect_indent_unit()

Ack

> - [Low] Unused variable `lineno` in `check_indent_consistent()`

False positive, IMO



Best regards,
Krzysztof
