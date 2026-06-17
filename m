Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9D93BED76
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699825; cv=none; b=KBMi0me4P14Ailbrg4pvyT+H7f7Trv4bzrnfrBF56ktDZF8SBJNNWlVAVKh9KmIxW6FI/OxJXyPFtECT33bdjpNUk32b6jOvWwDqzg9QiyTNO/aVJN9OeELfr5eSHec+4yHE89tQam67GM7eK1iHOHfe2P2/sus/oGjCiEexDI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699825; c=relaxed/simple;
	bh=v82ZYuwMb2xVyLg5/0OZvOZP5AwSn0n8+YZ1fAkQCy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=enRdcospJ6Jkac/Sr4I6WgSwcnKPbQru2AZRjtDm3x7Gi5lJzWfqOvl1TPUCu0JXLxU1uFBe9iY7Zf3DKzd2BHWhzly53GIqaSZ4+rqmKdx8XN+WU4qg9FUHvIbvz+3t/PJFj8nfLriH3L0vF1Q4Rt9oHXXwmqiKiXScCR7igGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IkB4l1Ud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZmHlera/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IkB4l1Ud";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZmHlera/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UYGL2217728
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mi+7F6MOp31T+TaUgs/GJmAsdi52R6SY4Bwom4Oq8sY=; b=IkB4l1UdITnYKWaC
	wL45X9ePJuiiK5gOyRHxSwiI+n4rPPt0FTr2+odBJjodQ6iGXkDBzrWlecwLIfud
	XSCwrQnEbir1I52dqBiOb6pRZEpGlRoivLT3KFSyV8/R1HkKe5OZyxdOKMD8tZmy
	K3frueGKPYQ97r8q5anE2eMV4RmNAVCa28mKTo3Cljo6jUsnkjsd/eh5GUIScTBL
	gji/iq6STVXRqj/LTODJUkpSw2UBHyST7xObm3FNN14BTCkBCuox+lKavGzgHEIl
	nywgczybJ464SJYenBiwSIz+tX+P/8pR40kDrr2aARBoyVRuav3vZ91caBfKAilw
	xsq83w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueerb66h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:37:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9158ecbfbc2so45074985a.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 05:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781699822; x=1782304622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mi+7F6MOp31T+TaUgs/GJmAsdi52R6SY4Bwom4Oq8sY=;
        b=ZmHlera/RQySWCJfthUgq1crDkrNCR3DdYaZX2DiNWUInCqN0esv3SStIxXa2Mek9d
         taccGkP18cdJCClUYLklzZSzWBVUAVrif34VXJcIm+7xF1VnN1fGCnPkmIa4zOhIrTiU
         z4Z5dBqgo+/iwFbvm+m3Seb2lOQ6305QzFZ+4fSrJS0yXC9XG2DJx9h4tIZwB+oo5jMk
         3q+tmunFHqdD2qfHw1lt+w3WB41vTXe3B2KfNhI45ULagmy8XMPMD7ygh5LlxcEOJbH0
         S/fyVwI2c73XU3BYbg239sq+YcuoDTsBvcKF3gnMwXCzx00IM6HrUQvz6YDUWo7N3OJL
         yTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781699822; x=1782304622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mi+7F6MOp31T+TaUgs/GJmAsdi52R6SY4Bwom4Oq8sY=;
        b=GBwZydSGOxADLyZ3d2oyukNisydDPyvw2a11CCddORPY0g4iMiA4ApscgyjJxeVqUI
         4l/HME5Yshjjkf3Gn5G01jUjXKX1KtkBBPobMcyfodM3bf4cGIHAjC2P+OqEHjU4EsTh
         eEgdFqmn7vfJIsL10zXjU7qX53mlnPbdeNalhwSQOJqcHIZ0bvJ6MDmS6Sl3j0TCA5P3
         q8uwv4fiewzNzwGUZeJX59TSkW2D0h+fI9NjaXZjYDvMWRrCRL0v47IHEukw0WOpxecv
         b5EYBoX1wo9oAa33NStcSG6h5uErAbEoNAs9rxkIyDwZSV6Ez8lkp2WksS8UgFueMxb/
         Pk3g==
X-Forwarded-Encrypted: i=1; AFNElJ+ixBZ/O1qnG0nw2H+DdokCqKJQjgttvmQ3z7T7C0f5wv6IEPXYEZC52l7GVUkFtHG00N4qmAZmwO/k@vger.kernel.org
X-Gm-Message-State: AOJu0YzCXhqzi6VuzA10oK+QTiiN+OSZyzXKcCEzdjgT1cFzQSnNSUUU
	y8rHOzr0n7o4l9W7zQgKYoZWrD/I2hVQyRHXHzMTMSS6W1u4C7KQlXRC9pW98apeBczC8rbrSNa
	hxGlJ/vVXfPhSzhaNchKvNm9xxX2uNrijq2/Xd1So+tIP0Eg18gRaLkvwNEikIyXb
X-Gm-Gg: Acq92OHsdeF8PxNWqC4b7E3JFGvpWnEHbf0lMPAOpWZUC9M2kah1uZU8m68UPrZshKm
	QcR9+V+WoDlsTVJpS0ql1Bob4gzKfjDerXJr2owpDtisc2zyn9v+LW/74tHWGRWbadWHDm0uOsF
	gvxeh92SIKoYbAoEeLGld0tfsoooVqib9gS9iEtNTXxNwDydUEHt0WTh/j0MA2jrVvDfZsXVSrR
	q9l/DUN/JUO1OeGrmnaX3KSjAxBhZE9+CIExe6BhXUFoHCMghDclr3Lf76ji/EaknUdI0iyZa8C
	vb/IPIF51N+8OIx2qMxBTOMYJPoA3mP0ouRPL4jAAaNwonIXyBrS8F1/M3KGd/UZHbJDjxJAPNc
	kloGxuVro4SmQ0E3iUhMoVNYkzvWgDfEj/wQ=
X-Received: by 2002:a05:620a:1a17:b0:91c:9d38:30ac with SMTP id af79cd13be357-91d8cba7875mr374528485a.4.1781699822044;
        Wed, 17 Jun 2026 05:37:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:91c:9d38:30ac with SMTP id af79cd13be357-91d8cba7875mr374525485a.4.1781699821571;
        Wed, 17 Jun 2026 05:37:01 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb44208c9sm808828966b.13.2026.06.17.05.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:37:00 -0700 (PDT)
Message-ID: <d3b7b468-7314-4ad8-85fb-2f9e3e1a923e@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 14:36:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add display
 nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        KancyJoe <kancy2333@outlook.com>
References: <20260522-topic-sm8650-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-topic-sm8650-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyMCBTYWx0ZWRfX+WkP+07cvu01
 nm9W1iAVicn7EqOvcNFcNk0FxCwxtPpQ0dhER284Es+sj3klnLAwyHvcPpLPJlOwA3vVZ9gLf6w
 ShqwxLlTS1xMnmV3icElENXpRrIj/L0=
X-Proofpoint-GUID: Teo-Z6Kk4L8kuHHWzxtCydM7t3E5CdlW
X-Authority-Analysis: v=2.4 cv=d4fFDxjE c=1 sm=1 tr=0 ts=6a3294ee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=UqCG9HQmAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8gp52aLBMaF4WGxJS50A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyMCBTYWx0ZWRfXy8UbFHfT4QOg
 c3TDAG45VG2uXS25iQ2W4Ua4QUqW/frPI0/ZOx7HPS13y+/Iam/5HG8Ni3RKv7eHhb8AsLx7krK
 yogQU9j/GT82HWzxEJu+5xHasF9wMktH75XbLPSIN7oNrCj+Uc1fLnwUDVmSVEllB8LLEwpBYhD
 4dTCYd3yo6hxvICMeYPBi8ySDyt7YVZ01v+fhBdYa1H7txo0OZYdn92qH/ai2w62OSAfbRJ5qFi
 uxyJ3Ww4ULV89IfFWD+q1M5aCw6ztWGDm+HF5y6jY3GLZPGOr1kyw9xBtLu8JN7yr1cHxAWUcSX
 FudlYDBZ8/3crdqFFtAOLZfXvURnN0y4gTp9f7oSb860SV0GMmmLFIPAbKt/Tlr4S5hcnFgVsFK
 OvteNwTW7v0DsjNWq3kU8p28vUh6cVsZFAWj3QFPczJT3DFPT4EYBkEuvtw4GVTA4KKETiXC/3O
 XV0Gctxi1tUYIW/jWsw==
X-Proofpoint-ORIG-GUID: Teo-Z6Kk4L8kuHHWzxtCydM7t3E5CdlW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170120

On 5/22/26 3:15 PM, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Add nodes for the dual DSI panel, the SGM3804 regulator, the
> SY7758 backlight controller, the touch controller, and enable
> the GPU to enable full display support.
> 
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]

> +	/* Backlight */
> +	sy7758_backlight: sy7758@2e {

If it's the only one, 'backlight:' is good for the label. The node name
must definitely be backlight@, as those are supposed to be generic

> +		compatible = "silergy,sy7758";
> +		reg = <0x2e>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sy7758_default>;

Please use this order, everywhere:

property-n
property-names

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
