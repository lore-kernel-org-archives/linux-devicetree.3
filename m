Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E453E51F4
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 15:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776179263; cv=none; b=RkKGKf2AtLIhXgvMDr2LLAEY2NEj8vTYSVlCb9jLdiTRRviiD9hIP50sK10Ho2DU8njrtIFdnSCe4C4wtckvmR2JGe5pI5vKBUotvXEAfFHcfyaWM1Gtz2Y6VNoE1Vion3hQLnr6Owb256zWeRZNp2cnprX7+/j7krek9uWc1A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776179263; c=relaxed/simple;
	bh=1Skg35o4gzaEBl/SA0WgGy1u3loyQSqtV+weaqFKwIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awLAx1y7OLHpwaEWQKU9gm/uN3sJBLxdpO7WTMVCC3RGAr91O4p2Y5KFv1eQds2AiCGQx2+qPcCzeeN1/+yERPZsqH3JRl5VT4BVPBsWOs8XJlUbpp18Uatd4wyq/NzxllVFtOnuct1UJppn9pYF2vGSIHQj2CVH/Qn2KiK1ojk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HcMztV4I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CxpOAEbM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HcMztV4I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CxpOAEbM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ECHKLh3157265
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 15:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FwHJdsDcQ45697KmlXXjyx2PvzjyhECBzef7owi2Buk=; b=HcMztV4Iinl2W6o2
	G0j0GaG2Bv1W+A/SwN1P81x5ftK5ya2IfVoYBrTc/TTiw3UzDYZkrVFi40NNUXVx
	O2CNvOkd2IVtIgWlUmyUQ4xzzhgz0X89p8ev5ReEQDla+kBJ0ACr0OGE40jRtl6E
	7N5Qa1UU0zEqL5cygWzVAOVTQvjUaVxH8Bb8Qx2qyD5iDQAG4hbnahC6cYwJSV/Z
	PASK/w86s9Lbha2/1Iv+PGx8FnmEZiZUh+L3nxpAzeR10Fimml/N8UeBgwYIvmwE
	SX53WEgGsqRMnYYDVf1EYJ+iEu1687qEFmnZqokXNJP/RfP7rvnsF+zgacq+frPy
	y+MYQw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86bb7sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 15:07:40 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4638ca66624so997337b6e.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 08:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776179260; x=1776784060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FwHJdsDcQ45697KmlXXjyx2PvzjyhECBzef7owi2Buk=;
        b=CxpOAEbM+Rwq0dsX4t7+bUm+8DperOn6VKGhpOgNV5M/IpbJaUYVt3kRzpHn9AKLDL
         6DK78qpRmOM8BHXi7biafPpaspwMEfz6E4XELjpavG2USpVWCg4HyDJMN7tzEUZTuE2J
         nDOf2Vz5n8+RA6/5y7TWG/AY42egoF0/ZCroDup/ZMuMlMXUSj95R5cf1d7WckCWXAIY
         bwTOrVHtt4x/nYtb+MtYheV8kel1kCh4+IVCwPsqvFXlyurw5MjDCzIGJx8gshZllbBZ
         vJzqVVQ6ZAPnZpBtti2NKetLUdstjot25xY6FTidXo2OGgFFS2+MbXpxx/+sU917rcqb
         Ec6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776179260; x=1776784060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwHJdsDcQ45697KmlXXjyx2PvzjyhECBzef7owi2Buk=;
        b=fnS43TIa/JQQlU2V9G9WpUJkAW0zmip3/8zfbIFaZbUXm9uhhYO0tGIMhwA2ISC5i1
         op8d95yuOsHP1x0G/2dgEt/gp0mwvCkstO+ItjF+3Y9V22fiwPcVdH5atAlYnAVJUxYD
         ObmWmuduYU4T+MjIKN9xraKBe9Li/ZkaBAMk2CfE6jUXDcOwFNzkZa2a2dDboLfcPN3k
         G+pU0h+zmaKDZV+YKhsp3b3MVAvJF5o0FZd/gN/b3aH5bA/9m+16RwrN08KUZyRo5xjK
         dI65dnxH4t/k+kqOlKLNi9WdE585R9VZ1opl/6ntxRBpKaHwiVujeMdWaosSdiyNSmbU
         Z8UQ==
X-Forwarded-Encrypted: i=1; AFNElJ+EV6X4+7QQILLSE6396jIVLgWEzr+K8QEdHx3u9vIMDNLttO4nyybqYQhpn0ppwBE/rZsljKNS1JM6@vger.kernel.org
X-Gm-Message-State: AOJu0YzhAryPPqrtfaBlPtJvrSRL4vDZhvagXZYQwhdQnUR9xGcXS9UZ
	EwwOH3ltXdVvvP9Q88OzxVMkknf/94tMUhRjkZn1YW9jG+ftcX7CQavzmvWt7LaPtwHuRqq9pyY
	kyxXAiWowK7M5yDWF4w8qHppD8O2Hum5t+4bYDtd5TsxyMtDZ0/13R3YCQhTpDmLy
X-Gm-Gg: AeBDieuIMb2Ra+X/rN5zwMKvwPtke6wLeZTzQet3Uuw6rKnpDI2z7Xu2cLVzq9S2AUm
	UBdsRGqSfrQ2N1UErifjQcxy+uYGOwzld17RwAxEdsQc9zToJsDQ3vkEjBq1tGwq+aoaWp2/v5X
	OJRdOBYzGdZ+V8lXJ/cCV5FuhPD4yh/7+2Qu7cMjNv94Xjs63cq8ZWAEubh91p+cSNSDvwk7g84
	zN0nq3K/kkcFoptXP2DYGikLcgk23pTRCaTF/g/Cqww6Y5O/VtjCWDkgW4W6VyhpwHqRyfF6zGY
	AYsCeiK7OpI0n6pT/9jbOFzG6mhCbLDw3Z3wV4XG9qa43gyNQLQXujSINnWFXeym7lUgKyvv2rQ
	Zu+YacWUIea1gQnVhQoIW5ZOn6ZJi2yTPzvvLnewEYQ8uUa6vCw/2+GnuVNCdob++K41ZOi9H+d
	pCxxZxsW88r+wKNg==
X-Received: by 2002:a05:6808:1456:b0:467:df85:e243 with SMTP id 5614622812f47-4789f00c865mr5015504b6e.5.1776179259981;
        Tue, 14 Apr 2026 08:07:39 -0700 (PDT)
X-Received: by 2002:a05:6808:1456:b0:467:df85:e243 with SMTP id 5614622812f47-4789f00c865mr5015490b6e.5.1776179259429;
        Tue, 14 Apr 2026 08:07:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f189esm399575766b.58.2026.04.14.08.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 08:07:38 -0700 (PDT)
Message-ID: <1bf5b11c-620e-4d81-af33-a987136b0f21@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 17:07:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: Enable CAN RX via GPIO expander
To: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com
References: <20260402105253.3009382-1-anup.kulkarni@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402105253.3009382-1-anup.kulkarni@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0MiBTYWx0ZWRfX4B1ST3DZ/Hp9
 hj49n1FFJT2r1AHcEg3IW33U1LegqkF7FE3DXolmcS/RBTSZJzcq+zbPuGak8SRi+IJPlXh6gEo
 2yUuaNc/BuKFT2BiAZbqFFl1IQt8WnYp+gNVDiWjfV9Y0YmV/XkuWlc3HsLFEFBw1jZjfQ2ppKI
 lqgyAEuu1g3HlnBOwReRmtNWELjFHYKJ3af5gcny4porbuADBJs30ETYvnBE8XKO0LT/eJKsdM3
 c7G1KrI8PCdAQ1ddbSWzqkmkNwa/x11fEfhLX3BaGWKBgqCADaJ1ZdmOuNbC7TYHAlr8710niAM
 3gIPdDpDgEtP2f1LNm1YrDm7GCt2evtwvn8slMY2i5WY5KXDtGLEMLDXKsjhcNUM9m7stXkoMSf
 2N0K1vmVsDe0fdutV0+1J2FUoqSHkCy2rM0l560+pSLIEDMdWP7HZqSF522tPGQmsOZPARPcrYu
 GS/imgYF4fpQ8qSO3iw==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69de583d cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=NDwzWBFMEALbooAduq4A:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: FA-1C1AWRAdG20i8JlmztWRdfbxME2-C
X-Proofpoint-GUID: FA-1C1AWRAdG20i8JlmztWRdfbxME2-C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140142

On 4/2/26 12:52 PM, Anup Kulkarni wrote:
> Few CAN controllers, part of RTSS sub-system on LeMans, route
> their RX signal through a I2C GPIO expander at address 0x3b.
> RTSS subsystem is an MCU like sub-system on LeMans with independent
> booting capability through OSPI interface and supports peripherals like
> RGMII, CAN-FD, UART, I2C, SPI etc.
> 
> Describe this hardware wiring by configuring the expander GPIO 4 pin as
> hog with output-high, asserting the selected line during boot.
> 
> Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
