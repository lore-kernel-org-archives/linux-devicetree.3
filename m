Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364869;
	b=QYX3ZIDFiCHNXpSF2pDLS9Y62J7mKXH27J/6V5pXFQEjmMHHVZ7gwjKnl0ZGxd20Veex
	 wnWRs4ViGN8UxVj7gZjwkQFMn0XVL+QvW8MimtwX8zD6AOYgDj1rrQXrj5fsYd5T3+bwp
	 HnLTMpUFuKWTZr9JzqIXJakH3qTy9WIN0GMG6xWN6mbR0jD1RKnLkqdKiMfA8SAwccwmm
	 XRkjjFjkQDUnMCjrRuVg+mRzKgeCEEP6ihCbTShOH7Jzf9IsDBaF7dqmWxnOLcdbpidLC
	 ezZHrz7jzAacIxTK6f//MtxJS5pswh0TH9s5lQEWwiMmBsVztXCdsxgRP2IGO3Jla1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pJN7OniSPVy0+buIjyCXoBHR+lwJ1eKIsrybnLKWdwo=;
	b=lXBvUQKYssUv3AuX6+rkxOE0+f2FfnlGse5mtcuG93bglOxClkR4Glv9IHhePkYNWrff
	 IpZNCIH9nhbd18Cn4BA7+l66eonlW6o8LJ16XP/719CxTbS1Rtsaqz0HqM5KftN17TcSe
	 w80NBlbAamhMwu+sWEq6TydF5jZkZOQKjlxcYn2fFIBAFfWbsUJMhPndFRC3EFv29lOl7
	 9F39p7ml3nNUe5w55z0jxQ9WnOahqQnLgblbHGmyKnqkcT8MhROzPZqhUWa/IlWCQtRwD
	 pxTYDzTP9FX5YcoWfU2Y7sIobSDZ49KyZGxMyAd+Vweolqnt6M5aXLJOXSV4lOMA1Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R2hgXAaz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R8v9JfxK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74258606A31F
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74258606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R2hgXAaz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R8v9JfxK
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG4Qe3142141
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJN7OniSPVy0+buIjyCXoBHR+lwJ1eKIsrybnLKWdwo=; b=R2hgXAazkcgtm8S6
	6Ksjoa2s0v3Zvffkjb8nFWNB1d07jrWfdScfOLB+Z9x2QULsUNeXsCt9oLVU88oY
	xWaOVfvb8EmsamAGr98O9YwOywe7Oy/YvTvtipITnfTPW10m+QIV6wdpE4ahUt15
	5E6WtSAQSYPWlriD7RFSBuTZTAO3aFoCOV5Vch+C2+vtPysDhgN65866gbmqlGKk
	UXCe+oWmM4be+XGk80BPxE0rRNiaeoB6jeAwCEdVWHGQUUwwElB4X6Qpv2qz+htK
	/rotaXpto/KIXKWRo3k1E6CHwcz8jzAuOurL6aJp67hwL6JobmYPPpjMWUv+x5PO
	R2E44w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk2ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:54:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93df7a9466bso9174585a.2
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364868; x=1793969668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pJN7OniSPVy0+buIjyCXoBHR+lwJ1eKIsrybnLKWdwo=;
        b=R8v9JfxKQAejQXPmCEnLiyBW4JKjzFFB6T9RHAriZ68xz+pcUxMWCaP6Zvmk+6/dG4
         JoVbPnY3Yq/LhBDmp2IEaJFzxaJptaukKzwBbVjNe9R6GU1Md7ffD6sWDthM434OZ0Fa
         /qhnBKUofNum0Nxbe1S41162OjrZDBSiFaUXeekD6ufYT/1CGVqU+Gm/8xJp5bVNGgFk
         FRUnmCsDXMrZbvE5IF+3DTmn9AXJ5UmuUbWy/n1fdSfooeAunPPpc9j30kMcHyZ5Q9eC
         SRvWCErc0XqfmHeyeoLpWDmSBzyH0kZUgJrluizfwKWKECqrs1DsLXs/r4tHdZJNsK07
         c/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364868; x=1793969668;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJN7OniSPVy0+buIjyCXoBHR+lwJ1eKIsrybnLKWdwo=;
        b=hvRrow2hlCWT7SuUXo/1Ed9VWtxFbVkWkw2LmJwLmpvWrj+hrJ5goRu/TR3ybCXw2a
         UKwWmw7GkFdjo1Mehy9Y9t1aLtGZBZ+t6Xi5c4o4Yvfy20wh364IEbtOogfGN4EodeAn
         CymaUrC+tcOkJ67IEX1TF2Tyim4Fh7ANQYt9V3pQdtgtiSJbIA6PhUD0+LeO3R7YGwI7
         N5W5duyDitOh3JmuxK0oHfja9PCKoyapNy6l7+wCafnqtLEkIKQHL7Ug+1LAhmhyc5Zy
         v02nr7kj8TnNjrwxRD0kNyYsKQ+UkAH1EEIWik85B+VLsy7gqtljIS6sqGSyZJ1LHKrr
         obLw==
X-Forwarded-Encrypted: i=1; AKwUvBw4ymWVrpSiwMbRxoVU180c2ZYg5urdVdJIgg9kmCwUFO8sxtupofBsWquRMw02zBmeBXhgXkO8E6gO@vger.kernel.org
X-Gm-Message-State: AFq9FYKM304xprXlPsNKSPVcPq8hKl+FPUWjFuvxx+eCUoOfotxQYmoj
	bZWzcTlmb/Ai3rPR0HiQI+iaOcjUDEw4IVc0UOXVA0Hh/QngZmX0R4DXesFJPGaGq09BLJk86+7
	tO77iD8SA8Fh7rDa8yZOCnZTrDujHqgWZRAzlrPniahibPBmWQDfKQ/xAFGya80dloeKp1KU7
X-Gm-Gg: AYBFou0+11FWAPHcB3QYBrxDOrLtjd0cWWaYYnFY+UaJsExM9tmL02j0X36fpp7vFDd
	ak3tngMghUXJcn4C6uRh2AC0bsjKJIZzRvm3zRHzH5NBv8EF1REYRNme8hN5T6PKzrkmLCS8PNq
	Zu6XLNP12QmoleHj7MIAsjzSgc1puQoF/XIv3GdEmeHiU5ODfKB4qcJ40NywobO+hw0DdN3pdK1
	VELCGDCYMQsEdDrMwuZqkMN106VTF2iKzDpzog7GEdxYXeazkT31532LYGTJfi644bzz1PNWFHV
	xSzWq6v4U2TbPDU6Sn0qrIQ841s+LvDmPnwx5lsJcu1FmhBlTrNVj6o4Z9lWrI7DrUhk4EPFOTR
	jkv/DHYu0FDkFwo/QX7TH9kphRIH2EmDSw7yiN2ekbflm7A5nIh11AgBwWXpHGffV2XRJ8z8=
X-Received: by 2002:a05:620a:a7d3:10b0:939:8bc:8826 with SMTP id af79cd13be357-94421529babmr363508585a.2.1793364867723;
        Fri, 30 Oct 2026 05:54:27 -0700 (PDT)
X-Received: by 2002:a05:620a:a7d3:10b0:939:8bc:8826 with SMTP id af79cd13be357-94421529babmr363503885a.2.1793364867295;
        Fri, 30 Oct 2026 05:54:27 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7ae6eaesm590547a12.13.2026.10.30.05.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:54:26 -0700 (PDT)
Message-ID: <c4e3943f-a4c4-4793-8d44-0b578fdb6463@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:54:21 +0100
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
Subject: Re: [RFC PATCH 3/3] arm64: dts: qcom: tiare: describe CW2017 fuel
 gauge
To: Kupreenko Danila <keckerz@yandex.ru>, Sebastian Reichel <sre@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <179329639684.489944.6322623410181934358.cw2017-first-public-rfc@yandex.ru>
 <179329639684.489944.11313132727575469130.cw2017-first-public-rfc-3@yandex.ru>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179329639684.489944.11313132727575469130.cw2017-first-public-rfc-3@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: y0vHcgtctXNM6y0ODkrcMjmXcWXK4Rds
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX1VAorE1TNlne
 rtWicfRs7ppPJV1sePqJxhu8DGzmASOM+b49UVMaxAPlPW3vZcsCAbfOCUQ61Y8cSpmr7S3azdc
 U7K3lsvVa4AT1nDwfQWGU8ILDy58jAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX6rfPrwgbLk3t
 8TFdpq2QIAu8Zo1lGS4bXXByMf9gUlgVJzbbdXsKR74V96EVEHgxzC1qYNsjTbE4fquOwgw2V+a
 WOsWiA8WrpJYynSCo31zDEl7633Zbj9L65iWpzjGn5IiJkk4Xk0qtMKq+jlbzI65WXz+WwPP2yl
 6/Q5VV82w+6Utz48lcRqNanSAsrZtcO47OwQBg6Agcu91H1nFXKnNrM2irNLKtTw7nGc2b+S0ok
 LTy4vsRohqOg5yRPTd/piw218KfdAiPvl/Pw1ABvahH6t6y96TO4AmHBv+mtd370LR4RTG9z/ju
 0l3RrTIWBh96CmfDU9+GzL9SbPlJ3X4+jzTdI0qlM/eluroA+h5T8c4VzMn6A2se4SxWuzbRigE
 +qqyoLAZz7FZp42spLbGzeEnHBKOIqBCldpYL7/WGpGezISeDxthBuyfF4n2cKVqGoNqKzL5kbE
 zIYX+MsHZ9xuzyEac1g==
X-Proofpoint-ORIG-GUID: y0vHcgtctXNM6y0ODkrcMjmXcWXK4Rds
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae49384 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=vaJtXVxTAAAA:8 a=EUspDBNiAAAA:8 a=ogegbmFYXjI9hOOK5TYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300051

On 10/29/26 6:53 PM, Kupreenko Danila wrote:
> Enable the I2C controller at 0x7af5000 and describe the CW2017 at 0x63.
> The controller mapping and gauge response were demonstrated on Redmi Go
> with Linux 7.1.3. The independent monitor also registered power_supply
> on that kernel. No charger node or battery profile is added.
> 
> The resulting mainline DTB is host-built and schema checked; it has not
> been booted on the device.
> 
> Assisted-by: LLM
> Signed-off-by: Kupreenko Danila <keckerz@yandex.ru>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
