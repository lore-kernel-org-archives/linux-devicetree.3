Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D66337AA6C
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 10:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777890304; cv=none; b=K201tSfQf60fOHxxf+F33/h5l1rq4Z0X4KdLVmurd3ynljvFOYPOqnW60lcQMqxEDE0ay1gS1Ebeb0kddG+/1k/vNKlqsy7x7kidF2e6lFpqXYaN3fn1oquPNy2NsRxcgI8PC/GgMFkf0Zx357ytx+sjSQDNGz9wTfR65IXs8eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777890304; c=relaxed/simple;
	bh=G5UkDjvm4pGJkKxheq1dNGkApCWNOQfhfYsh7AP4tus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K56TFqeLlzC2CN3NAetKxxPa1qQ1liaAwmQLJ0+T+FfAulkufUtGM6ulkLagpohHH+SAKMkR8jtZNc+cmDTEPVG9cZkR6gsIVzl/Kl2JDhshmI+0SScxLj6x9JvEk4onIAtPC/NKXHJC2yrGRe5gnlCYVrzI0kwnGnTPxZKIoIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ATbPpfwv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nn6Q+xz0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ATbPpfwv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nn6Q+xz0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fNgl2539078
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 10:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Qp2HIk/eByZ7E1zxRzJhLfk3lVphz+CVpO9GCAUHrU=; b=ATbPpfwv4+pYSEjf
	sjX06TgO62+XC7kzdsMEuLXrONGiVaPnR0yXxdR9UlUceSkSPNso4FNkvWGYXMDb
	sJRz7hjBwJqQpVXKcbpcP9AOhdBKt7DnwBQgQm4AWjhci+pyYTeGyvVaWpRuFKfy
	UCL7OQX/wDWv91N73YazpnUN7l6uHXO4w6o17zpOYoRdzbLJBScTDPnUtUrirkXx
	Y/0RxmUpdzj9hxxJfqa+SwofAVGGx2LZTALlDDFhjurlUZ2E+ZjjHwOSiYeONs65
	9ZdlP0yj7R/dtlqXG5zoHpaeB+8O/Zr5ts1kxSLbA3eqiaOyQZrhWVAMqaUWjk2o
	9aMJsw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwxk1b4cu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 10:25:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d45ebdbc9fso105990685a.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 03:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777890300; x=1778495100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Qp2HIk/eByZ7E1zxRzJhLfk3lVphz+CVpO9GCAUHrU=;
        b=Nn6Q+xz0asMdrzL9amY/VOfiVzf4EOrpqoRG5LEpj5vmjJsO7Nq1PFG1Z2WwklW9+Q
         hj2iV5S7n220k2nKx4awa4T7jr85NuNrnwIZijq4l6ngBmDoPIvS7R7hen0qBS6abrF1
         8JpsTcZxFvgGLHm09xfzzEMFs08J9lt5ehebnwSJkACQFE/4IP0VrHO1+p1fn40U0NZS
         Beph4B/5dCcTu7gZFdLE84sU/QZutHrkXibgz4PkNkMlbyemh6n5ykmJtnGS+H7Rybsv
         jv2pf6zc3DcjC3sHP1GeLREsLIwmQdH0WpG4RyeUwZcaAxB+ajDoqxgxuQMH7Mh61ef7
         RM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777890300; x=1778495100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Qp2HIk/eByZ7E1zxRzJhLfk3lVphz+CVpO9GCAUHrU=;
        b=pWB5r+wKBmjpLUiaevSsm0RI7e1UTC9LJ7VdOHZGhRLRfsLabp+twoW+75b65R7596
         aODwNkccfNRpM5hMLW9RexR7d0glYc74J2VaScH6OF+Jj6NSQJizHfgzKRDWGOzEk327
         fYsjDcH4Gt5w2IRZbwaxAtH8YKoujfRWxmcAVPVkCG7cxkL+gnpqofd7h0YEnbNgr9jt
         bxefq9OEgdGYMuByDs9BafjUwLGOJGj7+Zg2a0hDQSBGEPpJohcc3RiFqUhL9Q/EuaWM
         TQhiBuFkcxTszuBuMPRWRCR9s7t580c+bFsei5DBPBhW1EKc+FnCrcesIfmDVmza5ziH
         UAeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/RjyxugkGBA9aPSv/DGPyNceVqFeuQVwHs1FV0V46Be4kY7kQ+RjiXEC/BQgJ6K6gEX1PndIDRM9Ps@vger.kernel.org
X-Gm-Message-State: AOJu0YyOcQEjjb6jf+NpSUT914aENYkRqN1TSsexlpIeofeId0jpC6J6
	jO+gxAoIihv9za5L/cWz4PCpRI1ieyVTthx+4mcgOMXVJOoghkLuWjQNghkVpkfjg1ngEr7oxJv
	fKW18h51xcP+6wxdpRakot5In3x1rZ64lY8LCJVL6WdSssQOOrJnyrPmDJDLrvei2
X-Gm-Gg: AeBDieu70sKUVRyWTVUqyOxIGrHHwHegabd6G+Q6V7p1aC8MwdXqzaPR8WVE+g+UUob
	qdDB0y92O4IrDs81BOPFItD5EaptHhLdW9hZdEJdcay8aYO0In6DUNFd8x1s4nvldZFAMkPXC56
	NTl8iZeUaLZfOVnay88QcxPwDrrq0Xn6EJSfJXh1kWoFqdDWvRSnX/d7aOm1ByphBkujhC2vd/H
	4DFiWcbYEs7SCYZiqbyPZ6/mtMGbx11ETdaFdQniuzg5dRhaNf/nUcP5/wM5ZhDf6x0EwzZH8Hm
	yRGXkUARhjaqF1U9XgoQ/w20s3nvQKXAf53GIChc/h0KFz7rypu8Liaf+inqoY81a9sRfTPn55s
	43lCqZugFFmkVS4Y47kuoxL/ZSVDq87ED0nqBS5ZkK1YhkQ2+AIpB4SWw3fP+OTdMGN6HwBzfin
	LRBv+3xdSXYdRnSQ==
X-Received: by 2002:a05:620a:1a18:b0:8f8:6b36:fad3 with SMTP id af79cd13be357-8fd18f1e593mr885254885a.8.1777890299993;
        Mon, 04 May 2026 03:24:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1a18:b0:8f8:6b36:fad3 with SMTP id af79cd13be357-8fd18f1e593mr885252285a.8.1777890299564;
        Mon, 04 May 2026 03:24:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b85e28ef8sm3210954a12.2.2026.05.04.03.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 03:24:58 -0700 (PDT)
Message-ID: <592fc8c8-7389-4450-804c-10b163dd6532@oss.qualcomm.com>
Date: Mon, 4 May 2026 12:24:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: llcc-qcom: Add support for Eliza
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
 <20260504-eliza-llcc-v1-2-d7006c899812@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260504-eliza-llcc-v1-2-d7006c899812@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDExMCBTYWx0ZWRfX4L5CFu5NMmcE
 FfUYc0w0Dg9G2l/ScSqos907DA3XXXzgyG2FfWewB96zbd3aovc/vLn1/9WCw9K8g0dUjx73wKz
 Zq4wJwHUNlBUvEmJ5aEdE7V5tngzDG4k1mQlFWvVfPrh15voHLYlc1CnUpXczSujnb3O58p4N5I
 lVOYkuHntiragGxHXO2aCt8+fbeii8irk1brCYhCzKfqkQeUiCcA5+7ZrNNPytabVVE3/5Xwq9F
 lj2MiPTiGoHEDJ6btivUposqwaw2Jd7tdRflTcLYWjwzzYyR2SHYhJ5A7ldWIEbUwMP/pRhmjYx
 aGb1Mkj8qYgoOwLHl9dK0abnn83nzq6V5wvk2czf5ulktZ8LKXCPhKIDBA0HMblXpnFx+tgLfwM
 7vTG7xFSvWciZhmGM8r/s76bsMs6aH93KtAnKJM1BxCVYYmtehDHxu1DOtAHgsRFZtW9b9dczTw
 k0/L8gsDbLEOknYaGVQ==
X-Proofpoint-GUID: 56I7Wb8P8KqzQEybP5srgkGJdYds-Qz6
X-Authority-Analysis: v=2.4 cv=bb5bluPB c=1 sm=1 tr=0 ts=69f873fc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Mw8ZFISzJRBWggUDKekA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 56I7Wb8P8KqzQEybP5srgkGJdYds-Qz6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040110

On 5/4/26 12:00 PM, Abel Vesa wrote:
> Eliza uses a 4-region LLCC register layout made up of two per-bank base
> register regions together with the broadcast OR and AND regions.
> 
> Document that layout in the devicetree bindings.

:)

Otherwise, matches the docs

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

