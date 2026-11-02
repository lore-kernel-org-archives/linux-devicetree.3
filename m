Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618224;
	b=ozhv6b2N08Ek/zvpfpLN8dS1z4UW4llhB1nuwKiSTEflf3oH1KHSy3X+B19HUTI1ywaD
	 LR1N3a566n8ZgX5jt7oeCV00QlFDjidFKKGLL5NspyjW/27UxEdj5dPVrF92qVaeAN3i9
	 OUA0lccaXXGb0wk9SfFxCZlXXV8bySvKcnSubXn6tKckEbYo39xC9BcntoC51niote3H8
	 j1Jh369PXdKU9Gu3nAKzd52jKFF0vPIoZkdWrHYrLBoJCrjWuNlGKs419K2PeGwKKGjzH
	 p6wi7uM9R9Y+eBq+PTOE/MuVL9Kp2IzndS5lBcvVbAysJk19a2Pe6UZey4qli1Qu1lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618224;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3JpSK/PSOs9B6sxPxLv4vXarBNGl/WfakaFeWieUtzM=;
	b=huQNwC2X2DWKDqagxmpueUCW17tS5rptofZgayOUQNf+abIlVLtSM+ID9eqYOO49+6TL
	 5/DPIBa+wYlCc4wbxKWyC21EgHUMRGTSp02AWBuSZ5MIKOoSWaGKdrLIJZp+yLoIz02AL
	 tXK1zom4wcFJyZjgBhuLtEnOZC9tBeVo0O58P0ZljTX57ivNgJzAvwp1N3PdGice1vJz2
	 v5wmJgsV9wN5nFTzW9VeoSOmBMJj1nweR5XszJY9YZVNEEeQ1r5uRtpY1TShbg4WflI+0
	 DnH+4n6ABTl9+SzEB3P0ZX4OGmKFkuN2FZ7U+6RRZXinJ+zNZFgeEDdIOlG2dvWXe9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R3Mf98He;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cdbLfl8o;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99033606A329
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 11:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99033606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R3Mf98He;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cdbLfl8o
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A1PQ3402501
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 11:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3JpSK/PSOs9B6sxPxLv4vXarBNGl/WfakaFeWieUtzM=; b=R3Mf98He8uDFPDkp
	mX0LgsDZpt4CIg2VXRslVcqCcaACWLnI/UNZxF2KwCuh63/pJnxjDWBolcvpD5ag
	jJf8OOnllV5aMs6cc6A7DvvDfRxGsHMLOdyvoJW+Lf7opkjK+su5soyayr5Ko3Kj
	FNxl6xS09vWsWBTEYoDGtA6w4JIVdzDeEjkTIbUgT0hqqLN1PCAu9dAV9kzwXS0y
	YHaiSu76+i4F1FYV+0kLr2YfYBll4tjiSc8SpW0GXaDgJzydZ2cCFP+tHRzhDWiE
	FrrVRgblbyiBsqQiDhj2W6QZoaRMwz7Of6lGr7Cb9r6+TV1VS/nXfpMFdE98F/CV
	ezJcBQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8trk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:17:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c99c10e33so7831116d6.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 03:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618222; x=1794223022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JpSK/PSOs9B6sxPxLv4vXarBNGl/WfakaFeWieUtzM=;
        b=cdbLfl8oV1LZQ4T3hw1k+5zxYFpxPDIOz6grdIYD0tgdKKb9iFNXjQkslrDpxzHJOt
         6hprDcDlvK69X6yk43jdOHe6ZqoO9/rotka6WkwGxwigbDIcvpSA44hmmbotg/q79Vv5
         BRh4jwRKTcBgb+nKLc0u0M4Cm7qvcTilerYPEqtnBBnqMnMRjc4F3EwV9UmJl85nG+nx
         rZ6SCpuR4EdVa3rR91t4L6peUBedWcxlALqraTDLQpw8fwtgGxHk1JkXo+u1XU7oxeI7
         P7e5TNiKqLGg7x2RjoHpXBt02GKF5mia3i/nIVupNhZEml6WRkAruc3N3wzkYDpM+7NF
         1c1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618222; x=1794223022;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JpSK/PSOs9B6sxPxLv4vXarBNGl/WfakaFeWieUtzM=;
        b=2hpoKAAu4M7Oz22cav77wzoTao5gCcftdKx7J9LYm99SPTBJy1o3QkkenpsVZKY9xm
         U3wLAxLRwdsiqglNJkfzAVbyMouWkNLkfOcuoq4aQfPWR47JYnIaFm0XW66Z8liKdUwt
         C19SbuUpJU2gWIvByHTTCZKRp+r/Uc1NZZ8cvU6ljDh2DgUZbWee8yY/kjekEvWthEio
         +ieFMNTum69/NFy0U/x0rLTeW+dqVVUnEbfpN3hS0GZdjC9UNbbS0XW0+7y38wtyRCKt
         Z2aw9z84DQ5Fxj7fvAKNjfkUlrhVP01WeI9eBVd8KkHWSw65xE6VWxhFrSFm4Cy8/5Hr
         NMPw==
X-Forwarded-Encrypted: i=1; AKwUvBzL+X5cNl4RZMogphg5So+lvNFrNHnU1kF0mdKUnILifEI5zJOgI/L4UsUns1t2S01eTKcTh36lHAlU@vger.kernel.org
X-Gm-Message-State: AFq9FYK04Ej1NIKsnDJvkQShIBoTplniESmV+9jTMGs2nEKBxEr9Zzlo
	Psc9HsA4q2SshFSSSdbKpAEZBvKk5oleTY5L6VQnbrX6nbAQ6LOCFHsgoMN6v7IQYJeXvuPlDzs
	YaXcpDgPk8OmMUZ6p/bRycwzJNLHnBx4tNepXo4dHvArkAd+KuD2axfM0eeX26arM
X-Gm-Gg: AYBFou0Rm2eOyKxKMSEDZ2Y8ZI//6Cg3+4qskEMjVRT1wHgn9ax6SYMKn5IvSWxAKAe
	WvBZEu2Xo4tVQo0M55y5sk2lEyHLFKLeCFiHHHEP2p7wcjEGs7e+kHXFONz4e7qrB49KCd0ciAZ
	mE/l6MRNpUruyoyF1BJbNDloAjl0xIRInlVK4rKC3SjoNbjmzB0o9fAPfd4YoLq3sIVv4FltAWi
	XtHrTeUe5CXYnFIBRRw2HKWgPTUk4hRQFn20QX7sjnXLNyeYo65pD9u5NP9f1ULPkkaX0RY4Fb5
	baqGP8F4MWbcDY/eU6dK/o/ycgUdfU5gzTNWGNZnemHZ4lglF+OR5Bg7K2MGAn0elMZ4COLycEk
	gB/IDQ5tzuVRi2AdJ7Mj1BZQiEmX/svbUBGlUN305S9unXNH1cM32cp6S6JmK2Rq5nCZ4Tnw=
X-Received: by 2002:a05:620a:1a0f:b0:945:c174:3d3 with SMTP id af79cd13be357-945c1740742mr45448385a.5.1793618221901;
        Mon, 02 Nov 2026 03:17:01 -0800 (PST)
X-Received: by 2002:a05:620a:1a0f:b0:945:c174:3d3 with SMTP id af79cd13be357-945c1740742mr45443685a.5.1793618221402;
        Mon, 02 Nov 2026 03:17:01 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd249sm375857566b.20.2026.11.02.03.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:17:00 -0800 (PST)
Message-ID: <5b0bf1d8-a0b9-4cec-b144-3fccedc77ced@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:16:58 +0100
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
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: milos-nothing-asteroids: Enable
 WiFi
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
 <20261030-asteroids-dts-updates-v2-4-66a56c537749@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-asteroids-dts-updates-v2-4-66a56c537749@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae8712e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Ua5qo8SU9V0ZK8mivTUA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfXwquXZ+iD/fvT
 g/+ic69AT7iGtRN5tvw9MyFB9eQPb522RUDq5rulw4hh8MkCCcOy9DqPSZNRq5mD5q5JItIEkiT
 JTijTW+EsShqGrXoDggl/eCHb6dvIYB6LfT2o43Rv49pYdudDqxwkyJbbwxML0imrWMb4yeHBYH
 ZaJGXr2oRYTmKS8utDFpE0WTgXIlu+N/i0LG2sKAPYMXHedXdub7xyx5/GDD0nNoti9UE896h9/
 VOrok8c2oYwMyBJU4RHdaE1syj/bsn06TMeVtXSIgRtZDbkzJDVMIuH/Q5W5mGedgqefnaNypeI
 XKYfgvpYFi9BiopYal5ZarSn1z8ocYQ9/EzybTmlqvH2C4Df8mqi5NGuAwAdr+p1/Z3KyOXWlXa
 3c1HEayQ+t2c+Tn1bO8DYYAypYiEw0FHrJBLQR6LFKOw0CQLuWbOJ0dzImxpttPtjtNK0tcDLzp
 TUiqyFqFRV6B6l7QZOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX2bJ9N64rtqux
 N5iNf8v2M2xJtz83l7HbGpB92YIjwD+H8M42UkgIu9D0Ib0yAXNf9L7B+P3YXmzN/4ZTVTMIfdi
 MpTu6kHLRqgJAIjhgyRPLyPQRxMume0=
X-Proofpoint-ORIG-GUID: hc0zfN5KXbvGRVLKVGg7Rai1poKWrWcD
X-Proofpoint-GUID: hc0zfN5KXbvGRVLKVGg7Rai1poKWrWcD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020044

On 10/30/26 11:41 PM, Alexander Koskovich wrote:
> Configure and enable the WiFi node, and add the required pinctrl to
> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
