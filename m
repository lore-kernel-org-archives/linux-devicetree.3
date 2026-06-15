Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D433E7BCE
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525966; cv=none; b=HVePS70v/qm0WV2GIwwnS74rRscMPopsXpk2dzkGj26f79+L5TmpQvKiq1U4gUAtdw85M8zBouJIefUOX7HfhHT2qzGgzvM6D5xQCb3U7KXxpN0lzAp8cw61VSnqLRqL+9AXyIY/iSF/sD6jR6ccC5C5fYUGAEc5HmN7y1wc8bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525966; c=relaxed/simple;
	bh=7FmCLHeh58sbTqDhyFlCcWfDhpGagE0jiv3A7Fg0eVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CjVFA2VwHNn9n64SB35Inq9IPiUK/6k3pyWGOqVOAdJUX7cOIjeH9bOw+8e8NN0UNUgFqjdCDwbWGh4k1U4YXqTZie0z/tImSOivvbB89HU7B9887s5xHZJKFg/Pfq7nuSlx9bviJPPRA+MK0YEtWlUk1DPu4r76OlKQh9vV5yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NoxiD0B3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=koMLwF7H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NoxiD0B3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="koMLwF7H"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAobuu3956158
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4KIiam3l7WE9M0XsEr+loFMQinsori3CfSieNhHYSGg=; b=NoxiD0B3gaaM5ukL
	HOJoThSpC4ViINmRuVTI1X7MHmQgJYvpI5Z3lIOJhUeMEfq6A6pi/ZfM+qq7/0zY
	L6kXnoNxNzd2Djyo4bC3lBRLgUuosf2lk1uSmTIexGJr8ioJEm77gX6h6UwkQ04s
	Q9RQAthFcftNoRix4fKaBROeyoKO5rXrfq27YfHXu9xno2dTDImMxA54TT+qqbCF
	+SC9w5fpYJXSmRV3POQ39wGZhzY3IZvlxZAX9cM2k7z8qtD1ubzIwbZFAx6RiN2u
	k1F79Xnfnp6sS1vztunGg642vbmeZplU0XuR+UPuB3PvCqjFoCq4noFUYeI8XjlY
	ZyD9KQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter00kvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:19:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccd1c3b9caso12835916d6.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781525963; x=1782130763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4KIiam3l7WE9M0XsEr+loFMQinsori3CfSieNhHYSGg=;
        b=koMLwF7Hc9o9Hf5DtwTF+gwgdMF1ZGxaePw85o90owT1BWtOmOYEmwaacsbjZS+b/U
         sVYP8IcnFvdTNp617EgGBMN4cwXpEw1O1bctpDC7qYZd+qQoIe0dslhvzXIjuq0f9HTU
         /HMrorvb2jVL8jww6LV4a82uXeS6VoMODmLHxQmQvZDkMWB0GzJkGUhUNuDbn+8SJBNs
         o/yJslIK00vA1Dt8Eu3pW9N/8mUmRm+0zUFCTxJeBOHqcMsDt/eRQBdqpuNNqLXfB7zt
         gj79hdNlEPly3A44WuiF+dl8N2SXAFBTp1rLDIP0lb/VqdPQa0qmIAaxDgoz7A3jk8XQ
         bNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525963; x=1782130763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KIiam3l7WE9M0XsEr+loFMQinsori3CfSieNhHYSGg=;
        b=j7PC7UNwvUGaVnxjRMbN7TWoUCB4MTyHGIbGhrVb4Rr/uLbEfu8yNNpTNrLYLnNxFy
         W1DSZQJnXM0dZVlbRnzLvLytvkcGqDfdBHlDlLSYrSsB+fV3hV3P24iNU6HGw1FdR+qb
         BqZySlTVyHfUI3pz7kjPvJF1KWqvl09fwNSkEgmiZ7FcMA4clLrDoBQahNb7Z8QwC7vy
         vtRIvFCwBMx1EAN+c8OVgL+zo11u0ApXuY/ZdZrRx4oGX2Cn2tsGPx1J6nDHydHV+DQy
         zpswtmrjhhW3zLtAQQOpqe56+62UZAsUcnAhtivLP6wy6aX5DGFaXnC11VYpjS0q9QXI
         63xA==
X-Forwarded-Encrypted: i=1; AFNElJ+5hbYeMIO3RSUVAfjjl9OljCYeEYLdMeXbzL6SZ1y4WAtb3eVn4oeBG57y+ue63qXoWIjJQR8yQNvk@vger.kernel.org
X-Gm-Message-State: AOJu0YxkD+ZSu9/baaqAj8voK5CaKus9I/8IDQHXx6kZNk+xU8tcu3O5
	frLS9a30dR3y7FDzszjHfPFAmrwq9je8lBXTFWmNsli2xgwfeAnkeCzYW+QkhPY5N4c9M8c9Ijn
	xLp3mJSU+HfUQ1QnDrP1WiPHUmDBIo4FmZq/ZUReWf4GwGIQsfsQ5sr19XQZhf9Xf
X-Gm-Gg: Acq92OHt17hj31meCpKPEAcAF6UBWmtLvcidQqVd9FxJSbkHUjBhMSml4uxqaQse1tb
	BwhpFiMBvVr7mgKAHuPtd6dI6ViwTporVpWr3GS5CnrnTSnAjNQt2mO6+HLc6rcg3u7nAQUFHWL
	qQdq9gYQkdTpSVHP0rJkV25safHElDb1+3mwKQeZTL8Bm3hS88hSMS+SDJR6AOYJtbbeV17bN4R
	xjhwQ6arxTJcvDaxqpwG+eLZY9bDakoYpFcFjXsAjXbM4dRUBDD1BMgua64AyZhqVMoVcSigvzN
	T4+Ipk/MzDJAwZu+9SpbFe2WXDlaWKl7dqkqbW8Ilg07Vj/co/U3sKKYuUBRjghmbauCZILD1aI
	F1XCj6wG56BETCvSiBVKGfp2Onh8FN7dLIHireXCv/uFR4w==
X-Received: by 2002:a05:620a:2714:b0:90f:7ce2:3019 with SMTP id af79cd13be357-9161bd622a1mr1242974185a.7.1781525963345;
        Mon, 15 Jun 2026 05:19:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2714:b0:90f:7ce2:3019 with SMTP id af79cd13be357-9161bd622a1mr1242969885a.7.1781525962763;
        Mon, 15 Jun 2026 05:19:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161f1esm2770733e87.2.2026.06.15.05.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:19:21 -0700 (PDT)
Message-ID: <ea441f1c-6426-47e1-bf6c-7c7f2d8058e1@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:19:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: fix PCIe SMMU interrupts
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260611-glymur-pcie-smmu-espi-v1-1-5effbaa3e1af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260611-glymur-pcie-smmu-espi-v1-1-5effbaa3e1af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zScLcw7Vc9ZsZxfCRartZrWXGRmkzEte
X-Proofpoint-GUID: zScLcw7Vc9ZsZxfCRartZrWXGRmkzEte
X-Authority-Analysis: v=2.4 cv=UPzt2ify c=1 sm=1 tr=0 ts=6a2fedcc cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NAC2ETaABoKmWdFWtrwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzMCBTYWx0ZWRfX/UXWHnFCWo8Q
 s2ig8joXfXa9y+FOZ+0P2/wO/Nr9Ruab1pgSNoMfvQDai396pk7mUlboTlWUFp6YTsyT6AlrAAR
 xiBnc027fqeJK3S1CtFosxQ7lCsyu6szaLFhgyfXSF9aQQNrhpEZMZlhETXCKqWx7ew/8CnvAvQ
 7JxhielgpQcIdr/7T32osqVd45uA+oDo9eqIXwtgwiug9rs3/Mg3gyPbqIbs4js25XN7/rwAoyX
 ryzKcpFr/UKAv8x8dRjS7k/t7dcZ4EEUYI4kzGcHFV0kH/ce8GWgSwZkhlLsZ172wCnmVcvYruD
 n94KBbKeyLgbyKP0LE0/GjZN3eQxUZMRV8t05/rVfXFTIbcvxBEjCFTSUI/d+pbqd2gIQvk1sIy
 ysVcxAPX3MRHJd600E6VOFggPgIt5zBsXiESFAyGS1C4eELqaOS2TV3lvj+2Y8oO5/LsV9ZcMZN
 VAB3XxaI2DtN2G1B/0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzMCBTYWx0ZWRfXxOpQXMiTsRRu
 sjHlvoMHwJQJDdq0ZXbANKsP8wciYXvdjD15prDipNO3eIbyxoShKYHhUnCF9ENubfKmvUeR/iN
 vXuLtAqTIiR/yG5gqXZFNR0medeMiZ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150130

On 6/11/26 9:00 PM, Bjorn Andersson wrote:
> The PCIe SMMUv3 wired interrupts are routed to GIC extended SPI INTIDs
> 4100, 4098 and 4096. Describe them as ESPIs with the ESPI-relative
> interrupt numbers instead of regular SPIs 964, 962 and 960.
> 
> Assisted-by: Codex:GPT-5.5
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
