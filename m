Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249662EF67A
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 10:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558321; cv=none; b=BkAIs9qUTxojf2Bqhe5E2Ban77p7x/bu1yduuaFaiENyYm3JTVa3kSmROh6PNN8U7ltAp6yhRDo6oh0rQBFi6dD6yLbJp7TvhXJBXF4rKQKOkmA9XYaYNseOEnbcPrhpPDG63vZWbE7MMNr7fbkwaICq0fJw0TC2whobhuHvZos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558321; c=relaxed/simple;
	bh=HdXSkosonXwRt8EKMFBT4Dl8Ut0JRx6ooOJSJZ5hKCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hxNHnnIfvsnoSwCIn5lIveQflkY4SWuhBBHRQI0rIe5MR20Mn1QOPD6f8nI0tTq33uD+z7tkSGVCtusM7aFTxypAaQUA19+cm6yiymbDEG0WLIilw8jcsoH/KpiUm28al5YD3LsYuqblwWEeV20GTDneQdVeloVXIL+BPaAQjsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XSqxaE5q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/oq53ck; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSqxaE5q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/oq53ck"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376lJMj3536830
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 10:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eMQSditiu6biUTQUGCeaE4++hNauDjMmd1RU0N0xQ3I=; b=XSqxaE5qNMlGt3Du
	0i7W0ViLhUoTLaSjZvfRe9IUlf8APpcZ3m1EJsNAjy4B9cLBnHurX1LXIH+GdimN
	dz6+/4IcFGLMTxPA0AWIuhGToSCvmSkj/vGqDgtuKIhmXcbmFGI2oJyUn3g4GX7f
	9eFfLcz2EXdwxrhFrQU6FyLUSTJIr8CLWtRlcYl0FgV2EZq3A1CyzRZRkLWJ9FrY
	/XhAgjvHLKgaACIyy1Vmwxqa1Xu7GotJ2it0p61djnz/zIjOUBizivpRch01x1VM
	zd8MVKxVGQb0RMQ5JCBQu9kxaOPDbXQygBSyoEBPrlBpyRGJUgbT+isbXZQ6kGVg
	33pbKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra2b0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 10:38:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb39de5c54so161829485a.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 03:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558317; x=1776163117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eMQSditiu6biUTQUGCeaE4++hNauDjMmd1RU0N0xQ3I=;
        b=J/oq53ckb1Z7dWarFe/C7e6lLNEmC7q+e1BeVNwoJIQlCqVc03BMCzxWJHzv+skrSu
         QGJmOozeErsNiCplAYNnmGPLt7tD/+QVeAh7AieSMLKCtkb14jvoLIUS4AImbt0ikO3C
         7IoR58rlAvhIFUZf1N9cN86mEoIQ6c7C8aQ2wvNSssN+kTM/H18Ge3JlzJWWMB7AjoY1
         4ysTykfnbq1VKLbnH6Q0ndvToIbe5kQIjlPZCTkTLVbJHur3n7zEIIX+iGAdjAoCUlaX
         7Y6Bwv0z5WU7EAdI9L+Vn/atsrMMNid2f4BTEriP75UDI0VH8As+wQVTL+LCfRCv0NXd
         rmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558317; x=1776163117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eMQSditiu6biUTQUGCeaE4++hNauDjMmd1RU0N0xQ3I=;
        b=Z66dkfvHmPME0s7X0NsSEn171rY4EhbkZ2UMK1mTWzJoorowrWAemadRexrGHVQa5j
         LePx1325ww7AD395OX9wOajfcywK5/zGhgz1MwKs2xDdRi8hiiCFLbWFmcCCfVMmXxsV
         YuknBXt4zg8p2U0WGGibjy2ZCQgJcv36WNigz8la9pHtpJBPfwFeOpStcopHBgxcjgC0
         OY4zvIIhQBCKU8M0HoOdSjvs9g6WlOlH86ZK/AEx1eG2wcKrnK+EAyi9XgJAXlmJtyZr
         R0qwDzlYmzQENaF9imN0ePZGVS3ypP2EAsGqetK+FFeSEIuihOrfAE5JQncEgGBjFEfk
         6h9A==
X-Forwarded-Encrypted: i=1; AJvYcCUWB7qGgQ80uhIrh9LKb7oJJvg6U9HiqylSMvx0a0uo2UZDopr/xYPSBNcnm2kvs2NBADu0CRwSiL+E@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4HBBoT58qthigk9851NP7/LyNKuuYOTNo+Xkw3Zrx4JiFCCcy
	5Is6rJMiIw4Hb3MW0bgar5iWwtmqnHZn7OQ72cgQ1Ob5XmSdU2b472EedqLU83dzY7bblGoTrhp
	wmvVkntRW1cOrfgfJcus1W6m28pl1L/F/K1e07qW7Zlz5IpBiFicGRYcYMHK+2C1j
X-Gm-Gg: AeBDiesFqgLrmZfdUx4xORPp+ZIwqroTh15G6ZNzlgSYKZYLVhFVHbeu5hJND1oGBGN
	MJ5108U+k3/qAluVoDa+3C732C1UGWdPXz7gJCJWKli/d3YQ/zklGrPDDcEn1aelKn3pS/kjfkN
	Mafo48lbdYhS12KdU4ZY5BfMXU/b+5soYlIMKyDpModVpuZQcR2tb/IaVO7hWa+AiiwD+cTNHWM
	CmcxvpkTJ+cb2T6IjlLjYwW87bXvtE7DswZbvwWf7haD8DJ/oBm+AKtXhHhtYi89NfrlfUqyPS3
	Oc8xlLrnrVlAHMz+kYvLmO/XJ6LC8X66DDnogJf/oJO/REHClaxygpg2pBXC3+W+8ecY18FWUx/
	LDi42S8fQqL6eKjgBYMaETVxyA2btzipBUBI0B+Tq/YsH1QNHLVKwoncvg0lT15eZOjQxrEdeLx
	KiW2M=
X-Received: by 2002:a05:622a:258f:b0:509:e68:22cb with SMTP id d75a77b69052e-50d62cd9f4dmr183427831cf.5.1775558317003;
        Tue, 07 Apr 2026 03:38:37 -0700 (PDT)
X-Received: by 2002:a05:622a:258f:b0:509:e68:22cb with SMTP id d75a77b69052e-50d62cd9f4dmr183427571cf.5.1775558316457;
        Tue, 07 Apr 2026 03:38:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99f80esm543484366b.18.2026.04.07.03.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:38:34 -0700 (PDT)
Message-ID: <31291320-cef7-4043-965e-8170d9a861ae@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:38:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus
 controller
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260403-can-spi-kodiak-dtsi-v1-1-4055e67dd3fc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-can-spi-kodiak-dtsi-v1-1-4055e67dd3fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bn28qxuzD5pmCUIpqgUQN47JqTFTiNhD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5OCBTYWx0ZWRfXwdT2UnrKCPsD
 Jn3ckufvsld5W28G1TEoXaxS6DOJbVJia/jV5u9VPt/MatdODS9/X+nNJqBUnQxV0PkpuIK33MJ
 vfiiTXi7PEx/jgZqCzkatalvEjRFEZxjhroTfB6hfSV3NQKs220QiC1ILh6AEuYbFFMCqCEzb2g
 JFT2bHznfClAExfUAX7c4OcJFSbKLxXBvKSvstyHrglyV6pzmo1f0G82eNtjmIoPFQ6lx36OAeZ
 w8+7JcWdml6wUjbTsg5kmY2U/hIERA0RccsuIji4+bYkMl9Sxwq5hO2xM9TxelbJBLOmIlZOHAr
 BYe8zA9ymezAfrlULbEHb+CL8orI2k6sVyEeNkj/Goq8xi2aIw6h3vNR5GUWcH1w9pDVmWxcirS
 jiVQkraMu7eJQxsroa3hFyNIuzPFzhwkY8mCoZFpWKnZmJfnMjTafGaAhQJjWKLnITLyNdD6zDa
 yQa2aHgm3uH3EoKrL2w==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d4dead cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FBG4kKiRHSUkxbZCjDMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: bn28qxuzD5pmCUIpqgUQN47JqTFTiNhD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070098

On 4/3/26 8:40 AM, Viken Dadhaniya wrote:
> Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
> The controller is connected via SPI3 and uses a 40 MHz oscillator.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

