Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4427A3F9F55
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992383; cv=none; b=khxaE75DBvrt3woqq4mi6tvMIIHHmWZSxjwMBRm01mnUloCtfY4Jbw+OXCxlaC8VsSGeC97np0HaHmV0tgHI6YTIDHYNlmWbHiDl8PXKEzDf5pvWUmjczYH0/9XPEu5n/jOFOp5QPjEYmNNTmq5HXSKUYoAEvS95/Poys9W95c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992383; c=relaxed/simple;
	bh=Rq9k78Hw50DGEQapoZ0Fu0uAEkGTaCUtUw4bB3S2jiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+TJa4CDKVtaW0V1zgzNNs/siQxsAH3piQ591ibhrvfUJ2yYZtUtAC6t6BgRSvHNv/fzCCwtRuJLoCp6PyCGN6X72sk//uBtjMm1Jt09/btE1JOtJ1+wO6QxT31sbglbCNijJ0F3//t6UlUV9CqiJD8/fRf5tt8oKVhtP3FdFw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nOF/aFdM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KHucC2HS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nOF/aFdM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KHucC2HS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdwxS934208
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z/ovgnuW/wTtPaDP5nRj/+YS
	TMBMRF3XYoJTwvSFZTw=; b=nOF/aFdMwFB5tAlQ8DjnZNKmGJ3IjZXda4w8wBes
	UZpbUqpZ1oOxNq8aZb2HhwtmnpHZlFZzJQEOGQjhR+paXY2aXPGbYWw6nr87WVCW
	t8HtlCvHjepDf3z8Bkn9jU/8wqSlVuDDjWnVKNcr+QUVHQwvWhDJR+qIeFT3B+8U
	+xkvFK0UxSykzDUaR01GS31A8ceevGrcsCAsdbKPBqWOVthHP9VK1b4qPgR4hPDB
	K/NPb48v81P2wX4IADLt+61aPVZi9MjoUNCTiMDWOtcmpmDjY/z4G3maJ+inbcrH
	WlK+CyOoBE/uMHU80CHdZONS0AkXjUKMKTX4qmYAciJJTw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8bagtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:06:20 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c96449cc2aso3513512e0c.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 05:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992379; x=1790597179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z/ovgnuW/wTtPaDP5nRj/+YSTMBMRF3XYoJTwvSFZTw=;
        b=KHucC2HS2zkz/lHfzMBfk02Z6+v6ogCwLq/lmYcqooBugm76IXqyW8t8FbBskwM6L1
         0Fmaf0PGbBmt06KNzNnaKAtZkt6vhiOlj4zvL/di8wY0UnEw3YKxthtSnkfiPbHUnAFa
         pBGNcb+deGuB0dRjbSW65gtglqH8/3wqu+S7gazh0IVh3j15vtq3DYrrNslktuFkKA20
         he53yIMGhSTIkJplueZ6n+fiuuNKM+KlT9FHFYrOIW9HzOVUEpU9rLReNxVvGBF26JGX
         claI+P8DOOQhR9DOsFSzN+06wry8cspwRVp9RDSl/4lbsYONfd59Zv8imhHRkAoKOfeX
         qkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992379; x=1790597179;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z/ovgnuW/wTtPaDP5nRj/+YSTMBMRF3XYoJTwvSFZTw=;
        b=uKd9T2xTaVs6LOi2igj0fubDZehI0pHZfM13MUOkd1lCxaP7b7rc4XRRGdeqiRhbe/
         PQlGJjVb+Y9ylpOHmHB3hhv2R7yJllolaFLfRqeHdFXKX7iJqDJi9GrRck1udT95u47o
         a9O6HeQakysE82Ab1h7YrVLUxZQAEL4qQBRtOv0GQUcC02MPkuWBv6nk4U+oVKLmK0lw
         3EWUrHI/mjpDTzvmDPlaAMvD/SaCFAxgGeXp9le5UmfNZtgYnY+R2s58fSKgIhlX/DHj
         KlA0o1l3P6CxrppM26TNcmt9IbKpYzA4HiFGu8924JWR5TuZmGzJkojIPocAEDPil3th
         3uzg==
X-Forwarded-Encrypted: i=1; AKwUvBzUm9cq5/oZqM3y2eVcOU2HJ7y9st+0HV9ksE8XtBVboxtc5Cnq3nx8JlzVtYBZjXXTbRCHMN6O9zhT@vger.kernel.org
X-Gm-Message-State: AFuF++miCK7M+ezm6QHix0gYA+8QztsDvTMZ+CGz1yuaAjkmGwKVW9AC
	UR0wnH31nabcOi97iY7XLfkUezEdnoEQn2AJvTlOew45FFG88ZAngE+5gXdWggfKtvSYRfk6zWO
	+dJwSWkDqgxhK+UxpqaLgi/TtHjUFQK8lSF/fHSE29xVxXYVYEnXTW/aJB+glo0IQ
X-Gm-Gg: AYBFou2rdMOGKDJjERxSm6V5M7G/7UINtrHTD2HJrX5t40jYS/ca+s2DU+7Vawy97Wi
	aPdQ8rs+UzVec7sriAHJ2E2mlFBT7P16lX09pc9c+6+snJsZanViu3y1KJeWo+GHWvFhpXjdioC
	6qElOUuUGkF7jKI8iW+7lca+yEiupJ/U0eYfA0FuzwPHkrAmLozwlSbgoEfvWwMsKeKCvCWTRIe
	vJVWBRnLLMs7qXHvHlAKK9i9bQEOmbd/4OfxYkau9v/p1odxmSV3tXClkU41mcWBFxQzUSSQK8H
	QtW3iSg3E8Y+iuOwefjA3wb8HhqnZuZNUl10WqFmh1gNUdjS2gskSv+9RJivKinP5vCNskfHm44
	3Gy/nMAWvEug8NKI=
X-Received: by 2002:a05:6122:6b1c:b0:5c9:c480:8910 with SMTP id 71dfb90a1353d-5c9c480c705mr2092267e0c.17.1789992379559;
        Mon, 21 Sep 2026 05:06:19 -0700 (PDT)
X-Received: by 2002:a05:6122:6b1c:b0:5c9:c480:8910 with SMTP id 71dfb90a1353d-5c9c480c705mr2092195e0c.17.1789992379090;
        Mon, 21 Sep 2026 05:06:19 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724583250sm22170562f8f.22.2026.09.21.05.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:06:18 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:06:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 09/11] arm64: dts: qcom: ipq5424: Wire up PPE clock to GCC
Message-ID: <wjahb435ssk5wc5cdvrhhx2ac3t2imneqppevcqodonqt6zcp3@s3lxhumleoot>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-9-d242e3d49648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-ipq_clk_changes-v1-9-d242e3d49648@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfX9noY2kQm+oDR
 TP//tM34vcUOezVBN7XosOFoCfWul6MVYFGq6yLnDSOyF4NFecKdfzchYp/Poj7Mcz3z5OS+XMZ
 zI2gGfo/wSh8WhVsXjSrhFeT1UVnbtez0a4sts8GK/6ONALt2tsxc/SSSOBvA7yu6nypqba2G8i
 R8Fw/Hw/dgsk+K6+edjW77RGYPo1pj+yTU0WY0O82VB3pf3FBdJ7U9Ph9emSQOzFvbpKEab6kA0
 sta0ZmYxbSC4/OX1KsKni717Ym1Zpyw8Z+F1v/ciEjkivcagmyqD4fycjZO+hNvxQbEssNcv7LF
 Y87MWqsA8Uwg7km5o/8QEJHpeb5AeZ6zoHDJk7t7Qm307Auy9S7M3bpAceyJyxQ1PsTZO5D0J2V
 4cyPwYS9hR7JYDuSEYo8HxVGaij4ee1h24E6IXF915zwEo5jRa3qBbQhcd3927z+va4cGyNcVrV
 21ovmjdysXTFoIqq7IA==
X-Proofpoint-GUID: TOE3aR2u3cVVpAIh3nu5W_9KI-Lum20C
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab11dbc cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Ue0VUxZ6JbCSWW521nUA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: TOE3aR2u3cVVpAIh3nu5W_9KI-Lum20C
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfX33paJU5Jnhei
 XoivkZzRDjn7am2Fb72mujn5bfCkA6V8guTyD2Zg90lmXotuWbq95102bi8bPh7cBRrAdfGIm0F
 pPa+TvbaAiGCiG05zd8+GBZFjtrxPTk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210175

On 26-09-21 11:49:42, Kathiravan Thirumoorthy wrote:
> Add the PPE 375 MHz clock generated by the CMN PLL to the GCC clock
> controller inputs. GCC uses this clock as the source for the NSS
> MEMNOC clocks.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
