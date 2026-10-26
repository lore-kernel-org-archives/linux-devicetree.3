Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023765;
	b=0opLJ4YyBk2VQCqc1yzEin48Hs+rsWZIuchfalytfTzRaBMaEM7KxCCLtj3gNAiCmM+h
	 2JssgM+hMoXRygzLDoefimqzYSvnhu3VbskMuQuLS8Nac04t6QGqVPfQ+RKZBUHNk8SGD
	 G6+PkPOksPdQhJ84hUSGJtvZzuQ0nWxqYOygODaSgy6DwYKtq4a0skkMGuV9lkHtggalL
	 eiuUw5Q6ddg5wl55TKLF2DmQJtuSIX5sni8eocmPGDOrERSJJg6OV2a/T4A9n/7gagJk1
	 Sw/koDj0fHj6lisvR2jVqR5oC8UjyILinordFzLxkqaMg9lC12kiXeJbsfEn0iXSZFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023765;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kjExBJFPJ8m4Vc88gOC9yuQ0s1tBLMjZRS5SoMRwaFI=;
	b=LWEGQ99NUvNmu4RM71eD3kS5SPXdmfUS1e84f7HhzZdP4D6feFNzfO9qptbOEBuSW2Af
	 m/kBe28Te45DfjU1mfZ0v6jV3yUC8irou3mvp6+Tl8xJVZWv0khQwP0sZKXRLFMo2zvO1
	 6sBvVvnylE1zKTT6Ukl44VISnEL65PjKNWQGtQ5h8tgfpV33UsS6JoiwGqe8ek4mdTx5g
	 xFXh2Q2CnE2Nk4WWi06mFe/gTtLo7H6FuAdN3K86gbomZvySWvt0NPob/Kt31M6+WeT1p
	 y3x8oPG9S0brIyL3lHHBV6k9FeNWHotafrGcWLVHqNY/hF/jymVUoGMCnU/sblX3DVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aUcMW0tU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Owk7BbBn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39025606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39025606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aUcMW0tU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Owk7BbBn
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt2vJ2169214
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kjExBJFPJ8m4Vc88gOC9yuQ0s1tBLMjZRS5SoMRwaFI=; b=aUcMW0tUHWN8HD1W
	dpe1Bn6fpeQNb3U7MLe1+zdH/rGccWVqU+ga8nwyjOnD4at0YsDtHtIOmGUdA29o
	BUgmkfZ5bIn+xsqujuniL9U4ku9o2N+Z8u6HfFabm6Pa3f2AM05l+Q6fwvzFuAWf
	ZeQTNutR++4ilP/3IBmIN56q/LKITodwHih4/EIpBjgsX9fo1XP/iwN/DCNndISE
	M/JSu93FuyH7PQABjBC4beCuBMwVpvgSLFj3RZhFT1a8GHir6PNaqlKCjIkfdkO2
	gYRanFWHxQyqe83KBybbi7vLKFruTs3vVulAfWfYi3rrPgiBTPbh8SiCAwPC5n5P
	jqyCDA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u614dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:09:23 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eaad898904so84965e0c.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 07:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793023762; x=1793628562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjExBJFPJ8m4Vc88gOC9yuQ0s1tBLMjZRS5SoMRwaFI=;
        b=Owk7BbBnazj/kmdfpqpodZNHpb+hi5whsWKvGo384vGRXqp0Po4sVkSwDdGN8wUe2r
         rMicgKiGMI4lHMM3fwEfg6+qMYyM+OnEd0QTnGEu77EtPIpQ3MMx/n0OmwcjT0ZlY2q4
         7pemx4QjXR01qIWB15jyoZyKHTbGsETyXymF9qhpxrN9Z61x/D9g5GcTO/fMKRFgDlZ7
         U9UdVZMMe4p5ugAXSJnaI25MGrV/C32ZMUa6xO1POug/uerYjM3CT1Dm0BXLDrOQ/ICh
         31D4pPM62EHLhro36vJ0Mr3Ao8LQaP1E5n5Og19VPH79y8K3bE4JAgOq19bKeLQJ5xjT
         FqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023762; x=1793628562;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjExBJFPJ8m4Vc88gOC9yuQ0s1tBLMjZRS5SoMRwaFI=;
        b=0rfvlJNtkLwIVcr4TYjhONu77Mm1jDoZx2Sz7VmVRRgaT46dSvEn0ucnOSKeb+xoKr
         UDKexrfFjph5i3WCzZQ3OLuxAara7/CB+WCfusDTFXM5iVpvgwNJeLffpt++UK6r7dQ8
         itXNkLYNf+LBfvzUPqQ9csu62FUxj04AScxKGRKfBkQ3wHU5zSgfeXVphvWYJSwXoymU
         4SECLF4rutmpY5GTOKrJiVLN76vTszqvCK8TmRfNK6PVvxtYjoi0uy+Axmq6mUcuuvKy
         s3fMIrmDv+Gg2Un1Oh6Ye99bInOaSkDM22AGvfHPpML7/M6yZ3jgUkiZ9sXXUg92WEq+
         8dNw==
X-Forwarded-Encrypted: i=1; AKwUvBzy/G8rdXbugzmQYLWbS/u2kFuamPQiu2zBu6Hmayao3wI2FUKUD1Ig02IeIc9peMT4CARUeD0hwoa2@vger.kernel.org
X-Gm-Message-State: AFq9FYJEePC9zHUrvs3SZE1ydwe+rXb7I7qk5bLQ039bLazh4tsGwhoO
	Sg8LpZfusbnYeopHdkcihxAlypJ76U6hStoQOUxb16nNatLjMZv/1cRVTcINEaxSiA0ZVfPx4wY
	0CNIy7iEEKsAOz32CQSLO2w7ttm8skBvFHftXU/dmyg6UPTZVmQIxLiuvqcGnVu/I
X-Gm-Gg: AYBFou0u3u+s2aL11OodAo8/RuMZ7WHOYFH6rw2b93xnde4tYjCSTpvUtNFLCo9jnGd
	pLLe6+1ei7svHME/4/ViGPFr59MVWrmOE6n3b5S3Ew+UaG4mYGHgS8kLRoMCAu/bnASoZmkB7eH
	QPqjjrfEoI++0Fm6uq5AIVNH+UTcuXRYal/xzkOSFIwFryNG9EagkWenb2lL+8kSxTn7Ej0cS7s
	1UV5PaPC7NdR3yvpNcRbWwAZR89iRclcwc+9p4enIJod8+LFSvvgf+EPXdP75XXO9yULnByQzxO
	/JLjcNMyAqsywWBaiwiUCf9P7SBsNHQnCSxvCpVzJxzpRSjHXZsZts0u3Nr7IgSK57xd8Eyom75
	A1ths9tfDK5RWHKoBv3Rmcw==
X-Received: by 2002:ac5:c8af:0:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec232688d9mr2052695e0c.3.1793023762329;
        Mon, 26 Oct 2026 07:09:22 -0700 (PDT)
X-Received: by 2002:ac5:c8af:0:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec232688d9mr2052661e0c.3.1793023761845;
        Mon, 26 Oct 2026 07:09:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7b5d54sm321487466b.86.2026.10.26.07.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:09:20 -0700 (PDT)
Message-ID: <14fabb77-ab9e-454e-86fb-e5f8d0d686e6@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:09:17 +0100
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
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm8450: Add description of pins
 with MCLK function
To: Vladimir Zapolskiy <vz@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20261023163057.775917-1-vz@kernel.org>
 <20261023163057.775917-6-vz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023163057.775917-6-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KREOlbSw1uJlrkHlMT9hA5wrB0GVS0QL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfX05ra1mq+3pRq
 VTo7rROdIn2yHznVe5tLmKaFSJGnJ5H+iCo1mNmqgFJ6CL1psDJnuJMFx2EOZsMImc7HOSr8kHw
 gMgcbpLYoX7iB/26Vv6go7diAm+RZ7qNPBobe2Fj8PcSImETXNUHVcEiUQBLIgI0r/6HcEVZ0Fx
 Kq84nvom5iVZoq+zvrhqldQiV8K2WIpOrvROJqcGRiCMg3QEr19q9cCRLBROwAYN3ef33bo/Swv
 CFspW6Cy1CpkF8/B3eMl3oMybhQ+Dgk4q9VjSN3qijZizWuT3rJvg7hlZhes70lSXhatQTzbvJ3
 YJOeE4N2C/i4Y2C+iscppKHEIYNydSip+yyrjB5ZTTduTdiuPyHRyouhy8TfmGZiV6h1JFrp7PN
 FLNSiNLrTa9w9aNt1eCvho6lBTcgj+BdtaczJziEK0m4ALb3iM5VRKdEN85Vr2D7G/JeckvtElk
 vkrDGbnakLT+xf7FdZA==
X-Proofpoint-ORIG-GUID: KREOlbSw1uJlrkHlMT9hA5wrB0GVS0QL
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf5f13 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=euT04gI7HyjAtzR6ms8A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfX5ltzmnNj+yrc
 hcomww7110iUy+iym5P8SO9WQ3VbVv7iB3fKcyL5nbkEc/4z/UW1Y9xbd+Rc2K3UQ1GruM6e6fm
 92Vh+X8f3JTUbbfCUP0awxxfsaCGBt8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260056

On 10/23/26 6:30 PM, Vladimir Zapolskiy wrote:
> Qualcomm Waipio SoC provides up to 8 MCLK signals on GPIOs 100 to 107,
> add the correspondent default and sleep pin configurations.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
