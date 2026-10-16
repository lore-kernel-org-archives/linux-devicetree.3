Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8D337882A
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140657; cv=none; b=JqLAAQMD3rXFvBK850Tg7TJZ8lxHCqIqWKcczHnIc1M9ycYV9vBTfQz2TQzLiRMt9NpHNiIx5v5YDwDv+cJFkyCbInvr/nkSSQQ9GJw3Duxs9+vzrPnOBr85be0PqklJkHGY1HGG17XLfxpcxSrgbOjz3loGFz1vqPEsGCg6A7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140657; c=relaxed/simple;
	bh=hVsOcmkcXmATJ/5jgF/IOTC8llyCXFVJa4pJ0+tKRcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+6K+iakFZKQlD0TpRG1vmLavDps7Hs35rsdFR4uz8R+7ildjqruRdY5qWqTH6JcfRKTMOBKc5Qw1hV2kUVdtKH0WPL0nsEGYy3uUQfcdYD0NSd0wI59zVuUFIOJ75/A9y4L5MrYaqpoLkptb0tZn1nwyx5D3Ib194M2MIRIy/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epnIfv2Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NjbMzh1c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="epnIfv2Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NjbMzh1c"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lIxJ303520
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hVsOcmkcXmATJ/5jgF/IOTC8llyCXFVJa4pJ0+tKRcg=; b=epnIfv2YPnCmZH3G
	XNNFK3X9+iLNlMw9bySonTiztaHiOiHLZducHovrRXVO83TVcR9IebpsH9GhijAg
	WGnaUOt0FKU61pSwOByAe3Yp16zTI9lseO9husEoPIf1kkNlm2Q2CPHWVvxbPKnm
	5iuLwek/AslPSNXeBrWwWeuKVk9Ql0v26n+8PnG/IFWYdgPugJio5aXRSJ6mbw5u
	JxIc/RzQzGTfq5vmP7+3qERXKcQVzOgBNinaNvfG08IoWwQjMRzgeJwcEgjtDaSN
	59ksRMbXvQscr17XZBQzAj11vj4dpXYjMXf4KZuv1qernIKpLl6raAmbNDR7ml2I
	Oy564w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjt90wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:50:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5360b8cf8f5so5011401cf.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140655; x=1792745455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVsOcmkcXmATJ/5jgF/IOTC8llyCXFVJa4pJ0+tKRcg=;
        b=NjbMzh1cqYUy/y7g8N4HcaMO2PeMvLaqeVNUM4stQ2KWu/+kOauoic2Prahd0hSk+K
         Xt2Cf6ZXN2TYhpAcV5/W41ALPfiUF+CBfoEFO5PbuvQHFYdy8Lubp8zqUO4Gc/v6ZL1X
         O83k5kUf8uL0xSnG2e67iTOP+IUBZ2BfwBFN50RL49jrXUPSQdyMytvisK9RzH7vzNpg
         l7cEan8Xmu1crOs2sxyf1ZvpCUdL3ghP6lS/N0z6TEDZShYPrMPYOoyA/bDnqUxV4PcD
         RZRVfrS6GcPt9tOkuWxk4n9xScldbZ4XzKs3XJ01q+I7v9ij4S1SLQ5zRfQjF2xzOdXQ
         /vKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140655; x=1792745455;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hVsOcmkcXmATJ/5jgF/IOTC8llyCXFVJa4pJ0+tKRcg=;
        b=do+loyQkAG3rSvbGe35JOQlmLdcDXf5mkzKKwDvepXpvvbxcQ3C/NyG+bGntV+Un3W
         mZEOQflcdtQ3jEctCUk7SP9mHV4EACI0Ec2uJLqlZQlluIJoKLbqWdVILoxB6W8lMTax
         4uXzjjiwrqPd41SEaUUoPyAAhGXZfNdOzOnS3EImjIYctpitZgdidGfzx6gBTyKNexsa
         MgL6JLm/QPY4DXkY0uY8kPy8QP4kURk954y9FPN3NV+nYrM3V4emS5yKuIVkk4m/KfBs
         FeiQpf2b6/m6dSmh7B/9szqKyLKECOQFQy4loDGdtd1rPI5HRfR89uXunDJs8GmTP5Ek
         r7pA==
X-Forwarded-Encrypted: i=1; AKwUvBw1wP0cd/fpA1csnUYqGzmjsgDKvG+T9IZcq85duekIxRmyDwzt+G/+arYSQgnaHrCsguhN2e7Mwx6n@vger.kernel.org
X-Gm-Message-State: AFq9FYL5unlLJ8zTkgJzjAequijiVqe4Ci254iqAb0jzSZQ4B7cgQ0y5
	zPn+o2jq2P/7/2YNrHd3fL1wRn82rzZ6UoI3neGfrOQebbiTuCdByLYjyVjEFzlb0MbQ7Ak+C7l
	gqE7wrdH2bwxFssPxhPUiYPC8euENINp4m79y0fkr6wrmdaWD0DN4RWSBXvN1w+Zk
X-Gm-Gg: AYBFou0SIsGnNbbdCuOtGW5IMQt2wQPNxKnIBHjLydE9rtsoUTOo0GkS2uh6pShnv/R
	831qUs8VIH5NMm0ULsJkZta3luMdjCpGFH9c8UJdkaYazkTNtlUcZE0kkNEIBMqxzNKBpRqRJeM
	uy3NJvl6iPriPfyhPFQ2hT6lKZeAX3IKrSNq6OhU20KVvNjczsXyHF0pzIAbH0lUZ380/bgnBpd
	c3h6WBG8R+0reuaLfuURrI+OtNkMO8Q10DB5RHlC68HNvfYUsy/+6XhV/A3nUaGa58hJ6FU/1WS
	orj/yY2kj56R/tKAuR20NiyrZp6STAcf+mRz+eQvpOegzT3Yi1gYfDV6LYfYzkBKdbgbfAXq0Xo
	Ye0aCRGTlMVNR2tSPjc6xgg==
X-Received: by 2002:ac8:5f0d:0:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5359f069904mr444285131cf.0.1792140654542;
        Fri, 16 Oct 2026 01:50:54 -0700 (PDT)
X-Received: by 2002:ac8:5f0d:0:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5359f069904mr444284781cf.0.1792140653931;
        Fri, 16 Oct 2026 01:50:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb1762sm52191966b.73.2026.10.16.01.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:50:52 -0700 (PDT)
Message-ID: <42a66c40-4185-4c70-a26c-75705f891263@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:50:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: mahua-t14s: wire backlight through
 pmk8850 pwm
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261015194732.64428-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015194732.64428-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX/QqCB3t4btrr
 llZusVbsDc3gSkEZbdhknI3wY+44dev7tN+R+XShzHDJBfZNJ5EY+UpYZMU/nKTtVbzT0B9Q7u7
 d0cMF087nXOCJ/BY7Zsxtb4I1kKrNuUpx7p9OgOzv9BAMSHvIL2Q3NFnEfs9/UPmbUol/VGxSeP
 msztzPpwv4SxYgGnrxM6paoUzn0QOHZaJZdtaMPAlJ2ECaHj/9tzfBOFhE/LhSpUxDMwReESDkO
 87KH7u7IVxMQFhMh5PEau3SG6z7JezZezXh5UQpiSs5vBluBgVUMutIrqq0GSkyoq91QMZ5OJWc
 x9gG+KoRdTKOZqa4vy3BtTzOpOY3zOtr1Ur0g/ifW7VocwZgpFsTFmxQ7cwQyIRU5560p5r6GM3
 RW8A8aDg3qrE/sgcF6l32Q8vQKGkN5R8PVG5JFj4rePmbtK7kJvHozBthUBjFG1UKWxADiPSg3G
 O7agnznSLR+zg/gqevQ==
X-Proofpoint-ORIG-GUID: 05GcGjnC7rNf7SulzPnGkniHqtk7SV9B
X-Proofpoint-GUID: 05GcGjnC7rNf7SulzPnGkniHqtk7SV9B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX9llfynVAjr28
 LdQqkaFg+rk1DBp+RPioFhd+eanfpqgab5cPvN72XmKX5sfb/IbjhF3cBxoreL6+2ckOHwIOxeR
 XB4vcDumMtnMSFUnlE8dMksNSIeRGdY=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad1e56f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=J7U4xS4vm7cozkhYKksA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160035

On 10/15/26 9:47 PM, Srinivas Kandagatla wrote:
> Move TLMM 18 (EDP_BL_EN) out of the panel node into a pwm-backlight
> node and wire real brightness control through the pmk8850 PWMR output
> (EDP_BL/PWMR_BV_PS on the schematic).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
