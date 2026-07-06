Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EB03DDAE2
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343283; cv=none; b=VbEFGkgD9RqNDaz+QSjnFnBZ7eyI2BILrD6ZQTMkj14E7cfUL2wO/5NOr2Hl6LeosJbsqwyjrWD8B/jvEURcG5xO+m0zsqmngQY9fan/7ABgfLGdIAz86XQu2rKghTxehUuhJdGtXSk4M9PlXZMpjenP1hJyU8vbJG5pdupwdw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343283; c=relaxed/simple;
	bh=hTyksoAcTNb+Y+CUq/HdPXZw0RuoUg+1Sz1/5923wdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VcQyfVPaHV49V0aEXHCdU9T7WFy/YJ2mBZTgIT9SGWp4XlQ4lguRtSUvRru3kDSCtQN6fjN1ouB7Men7MtNMaW8T2RFAcb4Bt97nbY7bRegOoJMtjuAQd0sG4SRTnI/ZDnuDt6gqjjpnhraoZJx5txl29YeCdeHRAjDj7PRt9+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=COIsu9Xa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L7UMZ0oB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="COIsu9Xa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L7UMZ0oB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxR45402161
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 13:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mMLDfi/38WU63gwPqnNOo6bky+/JGzTsu6cGlW5UfBw=; b=COIsu9Xa1aol72kf
	XoyJCmc1ttvay6wZVGWAQ7Md/XVirBORzuGdoOSEXoqeDNcNlNWMlxWOaN9ERKeZ
	ix6eI6qVTwLPwIh3PtAlqXyyd6C7ZtEm4SbLAcuQBPoUxS/Tstixlbi+BSi+Trdd
	U00+wzfE8AO8qIkENvvuv4HCZrt58et5tjEHbVvEkcBRvzYeJneME9cNVxbjhUHn
	6Vyh0HdOlKwPJfhdzOeNsCqavSFzWtHZHehdTIkEmBlA/2WQkC8ccO4Ky1Jxg5g+
	bs3UuoRSP0DPfAHxa/zLd+SAt2mShE1giznTBT+kBdmAdaWrV7PW62+Ex0ssZSKW
	9q7Fjw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3grqbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:08:01 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-738be9df36fso72883137.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783343281; x=1783948081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mMLDfi/38WU63gwPqnNOo6bky+/JGzTsu6cGlW5UfBw=;
        b=L7UMZ0oB3mFs5tPIHIeybH6dyCYBvmpN+zXNPtzT4Jh7aaUjH6ZoaWgimxkhrWnuvY
         AAUDWinJPuVmeS6jIRfkQDR+XEx/rc/E60JosyjWYM1uSYs1YNZ/ho+ASx9xQuURGGrk
         3qhCrpeFMEZXvGR+iY5NVqT7UxxTZyVQ3W8lAIWNKfjgJaF+gkmR2lFJeNiKPnTICNGL
         6x+JYwMPrRkk+O40i4HrG13719YJ8ke+/Scztxs/BVcOHc4Og5NxtydzwXKSTSaTueFU
         1vt3qCoNING2aoldaQURjzYpxibw2k3gxNe6YegcHMHxvrHLjQ68XSS/HNm40LtVhNIu
         iMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343281; x=1783948081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mMLDfi/38WU63gwPqnNOo6bky+/JGzTsu6cGlW5UfBw=;
        b=GJtNmh4jy5YTUkF+mTXVOeu12jl2L/FjLhKss3pW9QXivzvdB93ibnYwrcCh9mZQOB
         kqKFfKfDUPN7JyUpH55hzVkY7+0KrLedw7QGM+AJKf0QxxwSZ1RYlzLGOmT+QgABxu+a
         QqJnPmBBwJ01BtouKttzucQVCmSNFwdi9hMRKQIgB3ZSp+3ObTgUPwgZuJWU+mD17gsG
         egFK0RNiZnoQmZYDbRofkdYeKTkGWOZbp5P2AFqXXdyouzvoRuG+fJ995EIyRNcWs4T+
         wAfpwCJ6EEQ2YZvPNZDX+tbnIRDMwtWfTovD0Vtq1ZGZCMBOuZiHGs5FKlluH8EDgF3k
         rlSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqjtgs7IpRMOOA7ro8CrARktsnxx6Kdg3qyjB/piOzmrzkTxOAEBhxjcHPQgEYvH8h1zxx2iJPLfScS@vger.kernel.org
X-Gm-Message-State: AOJu0YwXxJPzpP8Qx6789SRWl2g8nPDvC04aj809f27LkefBy6s+4cR7
	Ei5u8GWteiGmRLXFbZDf6UfWZ+EkVghm7Xz8SRO8N4LzS00xvSOuT/Smo5gTKzqGIeElaSsdQNq
	ctJ7DAJloF+fYsqwlh01oiMlPVy5VCQtTV1pBGkuN3F6aDtFCMpjs8mQlwTTgSL0N
X-Gm-Gg: AfdE7cnGvSDkAxskSquZ7q6dzC64mTUhRJiMspt3WicgJwWVjYUBhqNAlrWuAiHd8kG
	rz56fRjaoc4fz1OLRsoKjUEGkqJ7O2bpbk21YANShqqAJOdWMwHS7vIcxFhufwOHuxEPcF/V7ex
	eSg1VXJv7/yzm7vW0DwzwKaX4/LHPjrlho118Id+tlvVwenFDfhJCm4/pShvQ81fPxYX6jyK8gG
	APV/894gh2ARmx2/1sHchubu/TiD809sQnZJ/KtXgb64n/omb4b6F/kZnoVYM8lwiO9Vm1uBY1c
	OCRePrlf57GB7IQaF46FoFTab5vcyWRC8ZKMAoO27GhDyJVCJfMOj8wXCxZPNsgykFWpTy9bHj+
	dm4zy6IhxJv3AOe5OWphj1jXw2hYIe5S7PGw=
X-Received: by 2002:a05:6102:54a8:b0:72f:6669:286a with SMTP id ada2fe7eead31-741f6b17aafmr1576121137.2.1783343280539;
        Mon, 06 Jul 2026 06:08:00 -0700 (PDT)
X-Received: by 2002:a05:6102:54a8:b0:72f:6669:286a with SMTP id ada2fe7eead31-741f6b17aafmr1576108137.2.1783343280126;
        Mon, 06 Jul 2026 06:08:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6091cb3sm757536666b.22.2026.07.06.06.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:07:59 -0700 (PDT)
Message-ID: <1abf5f75-730e-42bd-b2fb-950a6c6c2763@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:07:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: camcc: Add support for camera clock
 controller for Nord
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
 <20260706-nord_videocc_camcc-v1-4-bae3be9e9770@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-nord_videocc_camcc-v1-4-bae3be9e9770@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _Mt-c_6-fA7-MDSFVdCTIlG99Pfgt3Uz
X-Proofpoint-ORIG-GUID: _Mt-c_6-fA7-MDSFVdCTIlG99Pfgt3Uz
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4ba8b1 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7Mhvcmd6cMb-wOCvpSkA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNCBTYWx0ZWRfX9hhxOOuVPsNV
 6tOeJVpQpBZmJgG3rpWFtC72IRkbhdfTgM0bLXNrKRphXZAXvZaeYgh1PSiQGrOc3U8UCT0i+7+
 dmaWsEtrIs1RxAkBLkeW/8AXuzhpZGgiKVWWrG8Xt36RcN3HyECjC4HF/z+t/2vP6L3DlL8AqW4
 FS1FBxoHj15KN33ruz2wr1NqSLVmFN2SdTE6kFeLCuRSYP2J5cI2uMYrgbYOZbhAUr6mdw/GLBB
 TLxU4EgGC+v3va/ekenbzXgCMPHLWOeAM/JqK0Oi653jVbYFKFhxUaTn/U4npTihoPtuHq0CvUj
 y++lXyEiqqYnIOxomWktOqcQsYdE1Cu2dhUs7JuouApRPniefw0DZKUFk6KnWlF+g2/doi+Tq89
 DJBr4Ac7USeguxwlIwiimKX2YfWFF9+XAyeR1aF0kwqOG+/iy25l+2IsuUiIyZqI3nYC3trWpWP
 61+oVnK7f7R8UjcRnVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNCBTYWx0ZWRfX3FDwts/cZBFE
 Jyd+PSfegZyCoVLVgMWyFiMRDjYbWYxLbwHBpctyRz2e6lSL1Yq4tI7G4kov2aebVxuk6TljWvP
 J8kaKvA7QbuGu4gdedy0FYdxDxBbhyk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060134

On 7/6/26 10:57 AM, Taniya Das wrote:
> Add support for the Camera Clock Controller (CAMCC) on the Nord
> platform for camera SW drivers to request for these clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
