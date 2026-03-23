Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE37390CA7
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774265972; cv=none; b=VbBQCIpujMvwOQ3HSIrfjaK8q78e8C/cjZCoT+WPJKSe6rRfV2E0rDOCQkxxTLn7y5eMpxSVMj8F1GL5cDkkQQb+cVZbyfXrutRI5QoUlzz5OeIkbqxnmo8iAb+yDQfw0hM+7CzJbeXGwEcgJ+ALnPTWK6X39ORr3hkmnMbXkBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774265972; c=relaxed/simple;
	bh=zTdPu2zbrYY4TzKzy//TjpnkLLgvFQbWvcqEQ9p5eLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yfc3TqZ762tLTG/Q8np8jWiJYovd8tWZ6yy25BVQ/oCOWDA+oahYZjph63BMe2+TbkXu4aleuL2aAbgWcTSA0FVbpzYYqobNgKhJsbiilNJTOG9pDRgrVibAnnbmqukD5hASP4zYzEAZvt/CGaF7yJi34rp2eAANdD7jJo5rFTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2aE8r1N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MzDgilRU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2aE8r1N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MzDgilRU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7689o1497563
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HQEOeFVr6mH2EsbiLPybn41eb/chStHBnXQxwYjTbeg=; b=f2aE8r1NiIajUtES
	pxVI5e9uzqCgexXsUlQmCKxdL/XpDKWZosmWlqVtrqJ12/bi0DAaTdDUhvyyRTgT
	QRMTIQs+rAaTqxxwq/cNDZ3AezDzu/W+19+xIs2TxtTWodYFc9DXBT5EHVfW+cBf
	hpI2LRfiEbnTrMf7QeOZiBnZzsRdF9gMY5Ye4VV/UGqg1Jv6G0InMQX1/4KXn6F5
	5XeFP2vobAsmGN2eKfFpYLMgsfIyNNUV9ysU/Ylz0uMQ01VqW5af2OLiAhnnnJiR
	Mxc+brchse9bICuSt6dskjZoZiTWZQcuV8mPEJ9BoYV1tVzCTmCzwRaX3v/jonou
	ILOgmw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghd1y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:39:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb485c686cso360450285a.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 04:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774265970; x=1774870770; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQEOeFVr6mH2EsbiLPybn41eb/chStHBnXQxwYjTbeg=;
        b=MzDgilRUsCFf0myNUAXYoa8AnS72DbEOW+tYSUqkUmqWkhH4uQieny2xgTfobx7HTK
         JklJkwInd+320+5BTcUftE0v+SeYNI9Z6vvGEJ2ZInrU1fC5DUAn2DTINXTG/t3uCDQJ
         mnCAb7FVM97Uo7YMbG+i1NNYWF/rq3wE9NR8G3sIu0vD+xqUg8s/kbLcltDn5VPaCd4v
         QK1LmjykwO+25cACqfDvGWzlZunv617Z9gzCyAAz3SVPS0EeQBkR0k73ixB0v+5oSj/2
         AsDWD1wNLuRbwosYZejBLxjcF7mV+wTsIQ8bHRCO68kqSbuKJ/kBzx3kf6xmNxIILccS
         v/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774265970; x=1774870770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQEOeFVr6mH2EsbiLPybn41eb/chStHBnXQxwYjTbeg=;
        b=O3Nfxm4+aRMQQBeRQE20uWfe0jjimIsPcQoV9wjtMJgrYr5kZJ7ln2PYRpdaCE7krl
         FPbTyhE1lB1+Lp30iKIWGP9C/BPW016OakCEl5iLaFRb/Yf4w3Txw3K179A4TAFgfo4h
         7RIp0dZLdiCCQ+qKL6Y5+/+a4+tgeKtCTaXr/Kdj8cGTBsJ/xmOmqisBbfbrGvKf0wgO
         L2nG5vPsb0b8a8FpdwokK1YYZvk7PGLDdFcvQxCGNnzVfDwMOrj8VRgmZI962+IzDblY
         jCHEj/O+iLSP8PNRArrFUQYvmIF0QEfzXEAauOAMCbN0udIGAYZyM5Ee2kYSHwfSupXs
         u8/w==
X-Forwarded-Encrypted: i=1; AJvYcCVlG4CDtdRiavWiOg00WXPNoHbxcMM3WsvXnTutVdSpL+xXIrFZ4V3Yp1ExArQJejmzfeVklbE5y6b6@vger.kernel.org
X-Gm-Message-State: AOJu0YwsY/XvTsxysXATlCXCRhGahFfVhvyjpUR4JNKNZLpHfDvlstRT
	pN1zshKcMFT87l2VefHKYZnz9PcOVC3XwOqO3s9f38pInSHL2ukZSUEGzGA1m6n/H/MZlfPz1VY
	TJN1c6rB/p8ASLUUCwg9e6/HxZFOh40RMpkkK+HBDCTd8YxV2rfaAnjqjeFJ7+DP7
X-Gm-Gg: ATEYQzzdhOkWHFkGCAVFkurzeUH4YKAMKh5lZEQi32zYsOSNpgACxf4R5oudbuuqhMH
	zxJbSYkYPledpKP0C+Nv2U8g5NzrmAhf4ijF4wSiP5F7BOpMdEAKvTq9BbVfJ2u3ZjJwcu6hFLX
	gqdz0ZWFgVMfkeGhNMbMH3TNfT4Wiz02dtLk4/TEFwvpxS4SuHEl2guW6908EU7UN4RH6X3GZ9n
	cCjX+EdjnTyesHO4ohPBgl7+WdH8Ql80bZULlykAHgoEtcKIX7Sjl56RdzP96eUlPp8STV0GpXM
	xUCKsQt9KUvJtBcLa669hN605DNAItTAF6zFA22cCsRvG8tQBhllBfl3Op9ELcgnmybhEgOdsCX
	4wYXmHrppz/d5SuRw61F87W9o2eHRKfCb8a2s1W5T6/LwADtW1SHhB9do104TZksUCRyrDzbEOK
	scxbE=
X-Received: by 2002:a05:622a:5c8d:b0:509:e68:22cb with SMTP id d75a77b69052e-50b374b1751mr138865881cf.5.1774265970280;
        Mon, 23 Mar 2026 04:39:30 -0700 (PDT)
X-Received: by 2002:a05:622a:5c8d:b0:509:e68:22cb with SMTP id d75a77b69052e-50b374b1751mr138865581cf.5.1774265969893;
        Mon, 23 Mar 2026 04:39:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d2390ec8sm3631663a12.25.2026.03.23.04.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 04:39:29 -0700 (PDT)
Message-ID: <bf383595-0452-4f11-935d-f92f2971670b@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:39:26 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: purwa-iot-evk: Add SDC2 node for purwa
 iot evk board
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20260323110017.2527956-1-sarthak.garg@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323110017.2527956-1-sarthak.garg@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c12673 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=AmaZaSnaQ4QkEvLBHnQA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: pS14LoA4FvnKjql4xi9Atyl_iqUDi0yg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5MCBTYWx0ZWRfX8Tucf+VY8QJI
 qy8JDLOV3dB3N6c9+qtOyRl5YN0wsRksCKsFGI9ayiTtHxXDsegwZSJUhOJwmFMxizw1GY8L5Kr
 t5inksTUw8ZJdynfnnGTIR5XTM59J5mPHR/ZyJU10JJ30L3I++tCYto4PdtgGzzm3pKvrWhXc4C
 O9iadPP0lnWKSFWV1ulyWDM4FXzXVnGCuODSoO4xGUQm0sWFPGVRV1pXrmz0LCPVWhkwrVIlata
 ld6r3iKKuzBXr99S1OoPiYohM8x0wT6ZdUhbiV57eLpUxLfByQn7TWC8IDoUrhgJqPpcoPMMfnq
 Ymw+0LT2l6/qCdnzhBLIA6RLj4IfPyBc+Eg97V+F2mDzrX7h4MlCtUU/2VtQuwBqepTYI0CRyQp
 lFL87LGofGhnTtENOWbYwS4CSkfNpj0bzeKUnB8Sb3CWVDmRvQ5m7wKszB3hrVLDrdV/1458LMo
 WIXTkrgYTN0qbZiwjYQ==
X-Proofpoint-GUID: pS14LoA4FvnKjql4xi9Atyl_iqUDi0yg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230090

On 3/23/26 12:00 PM, Sarthak Garg wrote:
> Enable SD Card host controller for purwa iot evk board.
> 
> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
