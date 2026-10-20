Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483797;
	b=vWMuHCc1DjjChMEe44CL/vNdDoBMLSjY0l8RP306874tIgTYMbGeH3mYnze7IxiraT/D
	 dTOH66+9jhYIRQbVibjdyD4ydkULQkjytBP32WbgwaPIFYSBfvUBTGLYMxr4C4h8diDI4
	 U45XfDgsLheU94kQ6NK9TtZuabscYLj3MJCU14/oej22A5BaCugke16RoSU/Ckg/1oaS6
	 IpFF3gQftwEPfy9Y5QCTy+ritvX/JvLrrZndnOmMQL9K0n13GvDxDgqb04LuL1/oP8n+p
	 ntO9YmEq4T6sxA9LdKCqpbMasDs3K2GN0yrFdcZUsWumFhmdFhO88okxaKM2cMQiYFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WytZL8CPn2x2UqBbuwhWlaP5HNZx/Obwas4Uf3JOylY=;
	b=VG1e8Gj8twlcntl7EKSnOdO5YWGKlfBkyVdzv6Up/lbD42OIeyfSPbLFoxChx+Nmjz2u
	 qL5ZPlTj32OKhV93j/K+d4uWWYkh7cv62fvFp5jKVNJ2VpN5BbY4N2OjDTUrbbNnjTFzE
	 on3s3Nr0YyItfU4lPgQaUYR/4a40tA9GHoLQRMm3M5vf14oLZ1eYvw3y6G5v7z1fdvPSP
	 vNfAdQviIueRubUNDW1oxjyHhLLnVx//31hfU8TJKhFJtgdiaHwFJAxTskvc7oBnX82KL
	 jD8gw/IlCWvTBl09Drx5Hjs3WOlsp+mdKpQ1r5RMG2AJbO32YPz9h8xXjjzXUlIWV7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zqy8yAS0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhL0uyRo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5FF606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B5FF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zqy8yAS0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhL0uyRo
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tAps1211063
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WytZL8CPn2x2UqBbuwhWlaP5HNZx/Obwas4Uf3JOylY=; b=Zqy8yAS0HNfPZCxk
	5Fd34JhwwivmBU37ziGeF/JjsPsdKLEfmviRKkzXEEHInkcH0Vxy9MrmD8+AOdF9
	SkyYOO2+OvLs/YqTZjOFIg4y/iKnNTwNZp8xAsCZjj8+pPrfxhOTVWjwP2l5RkWQ
	h90v2uA5p7foKwKsihwSWWRRpDtOGoNJ7puC7vhmabpFKd2oa47viFsLBl515v/X
	kmrR+fr/9lKrURe8HuZt517CzTaxXTqcswB+0SOH+zSmdXBYfY5RpcZjrGlFg/Rx
	2f/ud8VEW4TLDJ4oXNMFM9ApnhSyobvYFScjBY5XBiHgy+fDPlceIJ6qLYHjMhsV
	obMtJg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p1j9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:09:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536540909e5so4842961cf.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792483796; x=1793088596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WytZL8CPn2x2UqBbuwhWlaP5HNZx/Obwas4Uf3JOylY=;
        b=fhL0uyRo4rFfHBfiJr2o5gZoaIQ16uaEeoTvFph2LLUIGCRp3MegL440ikZVqrzIUb
         55eMCzUMIVfBWdZB3H5ecuOX3+/N+9rCs0yz5BtWc/udP5kvrQL4sfrvhcO5x12sw42Z
         Sp+lJVSwQ7KHvr/eCrwbaOW2cWUAd+SFqoqWXND1aFfCJYY1SXpbSOJ2W8vQ+niUYUYe
         9z8ydNWEHyiGrOMy3E7tm8T8n1pV1opvAIbTShc87QzSgOzYVBLnDjqs2MsOUX0FmPsv
         XajUTU2kABHursV/iQTARiHWqBEMa2fhL+BBIlIvp6uYah1/Cu46htlf+npbbH/aftLQ
         OFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483796; x=1793088596;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WytZL8CPn2x2UqBbuwhWlaP5HNZx/Obwas4Uf3JOylY=;
        b=j7aDCnNmwC6NWQuvBu5/XhLfVJRLFkl0gLU6dd4e4GAiTgvzAACLPfOYPW0YCjcLrI
         3E/UanCWvAVrtHWi2QoIo0j0O6yk7Lroy21nhC7Cz/t+KB4c+YdFCapLd/H/RcIP8RXC
         GvO3NtESfQ2N8TLKeQ652CI2ilTRUVROZuQvNaQDahAFpQmjEkPebHgRPfEdW21D0LdK
         SP3eOLj0NDStnKXHJrcvob70ksySpWQ/rG7SN+LTPeNgLyj+hMw3xYeIQnZ5XRuZ+2uD
         EGyYEz5xbK8DKhgWxYXWrWU4mr3DLtGs4cTO61E/HKskhzUKVznraVeEbmqn5ovOmOxK
         dR7Q==
X-Forwarded-Encrypted: i=1; AKwUvByfhJY+//FhCc0wzuvF4VpIOITbRAuGG839P0DkWl8MoPTTGr0UoKY2p430uf8KpbQbYF0f+LW2u96W@vger.kernel.org
X-Gm-Message-State: AFq9FYJK6+tufmHP+IyxD8cmeusmGShMEXDkbByyF0wBnxc3p+5TuNWr
	19dQA4A3TUYV5szfJDIqXso5eTpoRgg1tCightkZUARxm3+KfQD/m2Kyoi56WxGH53t+I7RNKpj
	iaz4HAv1JjNigH0QXxG60O5xKG/+EFcgDXHz3fQ1xMYQ3e5cJrK2MAjmWjsZPs0dg
X-Gm-Gg: AYBFou3TNx+tDnALrRwUigejMYKFdUa92Ynoz9qaFJHn8a+941FlDropWbNKtoJ4msK
	yq5Au+kcP9CfjSkv1nO4A+O1lUj9L5uD2TELDITWzbvypVh6MzI10h2HLxgJu/qw8bKuqfmxeq+
	ahU7CYcafBAProvc8qqSx/y6jvhVHaQZgeOY94LP+NeSk19s0TouV7iNTzmKQ8jFq3uzTa4/qEO
	7mtlwxSboXDLf2Kbz3kCgwk2xkXNqlS5Xz7KJaOQcy64DlOljrn4ZJS1AML9HgoF6/U7ZM8LytH
	gQ+PjInuwY3U+piX/rginFq+RuPtWsZvt+x35kic9jEKmBRG0sge/TiXOnSWS9u80Kue617pr9q
	yaiK3RbKQs4F68fKqDnL+mA==
X-Received: by 2002:ac8:5a89:0:b0:536:34ac:1a1b with SMTP id d75a77b69052e-53645d3c8f7mr186999281cf.2.1792483795524;
        Tue, 20 Oct 2026 01:09:55 -0700 (PDT)
X-Received: by 2002:ac8:5a89:0:b0:536:34ac:1a1b with SMTP id d75a77b69052e-53645d3c8f7mr186999031cf.2.1792483795094;
        Tue, 20 Oct 2026 01:09:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c0f2asm461081766b.62.2026.10.20.01.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:09:54 -0700 (PDT)
Message-ID: <0504f1db-991e-412f-9f7f-2840beca2ea6@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:09:52 +0200
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
Subject: Re: [PATCH 3/4] arm64: dts: qcom: msm8937-xiaomi-land: group status
 leds
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921-xiaomi-aw2013-v1-0-a0c3084076de@mainlining.org>
 <20260921-xiaomi-aw2013-v1-3-a0c3084076de@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-xiaomi-aw2013-v1-3-a0c3084076de@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Zkzx-YAgpipCw0jt_FPs-mkLHOxIXAsD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX5Erzu56KPUjl
 S9v5b/JmLx4tc4itnwfkFtntuGyfKjdRRpGoEV+PVI/1gLcjYBMv9e+fJxrwoDWK0qtKWFKJi5M
 d+pMjXchB4c+KfnYxfEEqsQaQpnGtzg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX6RFPzZWXPsl1
 sTw5UopuozsdQQtehgQEbMnmKLVMUYw0Ml73cCnIG+2M+0pwHaz2QaviExbkUYDCqm4IUc8itoR
 tNbyRbo2b6N93SD8tpT6fIeAyT5rblAfwu1EhIZl6TutsAKWe1tAWErgyqIj93IaO9QqhHoGgaP
 /7rMlWti7IYEWt4qvBG5JDvhJXgAk54+ChhJpVcIFD8GBenc2UMv555pAmYlSAq1li+t7KM4JC1
 WcwuNI5P7f77ZOFivzx6JgrIHIcZKeTy8a3AIFieUNSQB32tS9iLJRt5w0GNku3OXVApsrHotYg
 7x/TIezgQbi5qI6nuT6EpfP2P9XIit7eJ9unRAE2u6lhyXDqsmDjBK/WjYj3KytLTB6/TEkirwv
 RfBRiwNQGYfbu8ORaiUChcqlhXeITqFpZipXxl5QP8vHUIOI9AUbOB+Wr5ZwJn1uX1PIrv9tgWB
 OanHoi69cgYnKKZZOqw==
X-Proofpoint-GUID: Zkzx-YAgpipCw0jt_FPs-mkLHOxIXAsD
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad721d4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OuZLqq7tAAAA:8 a=enxl3d4HI8DR7CG5SUMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=YF3nxe-81eYA:10 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200032

On 9/21/26 7:43 PM, Barnabás Czémán wrote:
> Use leds-group-multicolor for handling the RGB notification leds
> together.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

You can update the driver and bindings to make the LED controller
itself accept a multi-led child

Konrad
