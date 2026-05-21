Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B953A6EE0
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779360125; cv=none; b=GiH1aK2+cQcW9NKEVbpCCGSra1rwprkdTN67wOzinx4ZTSYqJ1XJilOAa1N3/R23K5eL9HOqyAKlPhHFb588cvgPA4eO67e5HU6ZbQJrBeG2EIC6dt/PuQ2vdrgebHUYGUnDaJsDDMZWjhe2BFI2lJNhPin2RzuYKk0t3dRAjqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779360125; c=relaxed/simple;
	bh=OoG4A/nCjg1WGRfiXsW3OEJxdp06xTQX/WTx768OiUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oyOPWuY988IWHQahpW/43pJb/ER5yXFnzJFBHF4cQVeW2RtcWEwSZsFPE272M7JVQG8N+bWB1YlnNBAkgsKqahLxyR3bbBN+NBu7SDFgBuYRLtODnPVU17mP9TY/zeYCJnS1j7Or2bCCSqgcciOwP0MhBoYB0mqmvLTrjRSoUak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDxGAXEG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W0FhHitX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDxGAXEG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W0FhHitX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99nBe517710
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRweg34KvRj4taH5vYY7egOAVrFdTyCDwa/i6eW97uY=; b=cDxGAXEGlCfUNI3P
	aRwNlqP+tB4kbW9UakvqPJNYMgSji/RS+EQEN1JApVu/K4ArR9yx6psHKUxY6QDE
	tihgbXOIvQgqDR+fqoMKMnqRGShIwLNxguMLXgK8b1dWBffpyY4z1EENWdVRJW0K
	sU1Z2NZVOOen1r7ZTM8e6gXHi2yrHQxFUbszz449NYFAwSPa2SMDCDmuFUbSvC/e
	PatLI1zpYDHHLs7cmVN32oecqbZ2Z8f5akQf+WHOdybc3Y6mpkKuxtcGxeIeE2Kb
	Lv2XiN9oLGC02ALr4PUE5jcKriA96rTEFw9sYjkTVRd03elxOIsnCRArN6AwmREy
	RMMllw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa1tv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:42:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91345d517bdso125398785a.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779360121; x=1779964921; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TRweg34KvRj4taH5vYY7egOAVrFdTyCDwa/i6eW97uY=;
        b=W0FhHitXyCRbfHImf4kNijEoj42XtVhCSGedFccXHqF/4vBsLAWqynHj/ymW49G2/s
         MU1sPPdGDmdgyUvUThdbW2ARmzwGbuZts7KI8AQfQeQrygZZIcaJZyI8N77EzqPWaT7H
         caVbJrNlNdIQ+YXpnVLHKuHqgDOe5FPRPOFDYTwpAbENUt/CJIPlnpC1oYnZ1T3INUFq
         j3bFCAuFlsXRGDdDcQKxJ8/BiKFzjHbwWbZ/anRwQpuT361LsJkOOXFM9hASAOcOntEc
         i2ha8obbCKR4xQxFnkzvIX8AF/iHorTiLsWXskG/F/adIYswZal270fMz1WJPxngxuuk
         s0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779360121; x=1779964921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRweg34KvRj4taH5vYY7egOAVrFdTyCDwa/i6eW97uY=;
        b=CYnZWzkntw5Vb60z/ktorOB/1iwt+ZSRXIQqFQNoSGczDU3Nyxfez7BflSh0FVpQ3X
         /ENQRVot8YbABvHbwofWFVHX2By+cZWQJRinm5RYbU8ycv2mHzLYsCMGgCKu1YAbu5rF
         e075n/wuqenaPjhLrrmWL8YLs2YFwNOUmCFFU8CTdaaMvMk5YrucHUYdwyaU/aiMnpdO
         SCvALfYqKl/cAumlZnbb3nUEIbTYEQZTZlELVSOSeF42szTWq0nKuXhqkqiqvS7neJYQ
         EY7D1TpFM6PEmf/sCWQ4EKs3EOA5LAU7JXQMSnrZJxDaa7t6GKfYmKFwu/HzSzHqMuvl
         AudA==
X-Forwarded-Encrypted: i=1; AFNElJ9KhRuXc3BHHLpJXN4PxS62AYP6p61+Ouub/JDr4zeXlO+VrujlS8WXiCqPGlVROQtvD70fvmztfxe3@vger.kernel.org
X-Gm-Message-State: AOJu0YzM4QoOofMLMd4Hohg03DCOUx4kdkFlEL7xan4Vec6nodRU0uv2
	fvBcaEqWdyISpJWuOptCL6BDoYFlRvp8hQo5tgKqssjijGpY04YYBhj6eT1srSqKCYrT3SEdIx/
	aOieCv3qxnHe0PL5gRh7J6u+lZGpdoTpfyJu6swaLBWmJLjmmMtFS/lKuDlQ7UkK2
X-Gm-Gg: Acq92OFJgV3EhpcX9IzZ22D4Iy7D2eiRvQY0U2KEYJV5bI04ldXdH8A9kg86i8y2qZw
	1p6C/g9DNboFRO+PQS0qST7g1ikeKJtJfVnbM2jcmIlzm4I3LqjmJW715avqRzpaFCyB87TgO60
	HH+b/uBqfF23GtIfs2RE9X+/3kS/9zcPuQrnoXc8Q8hbgDtaRBxo5Y8/yv3wnB1+J3qQHTFMlWQ
	FW6rz90QLLEbCxpRC+hXc1uJ0nOu5OaiAEG8IXpZOO+9ECfcnoHvS1HtFvWc6cThxWqlbp5rwd/
	0NgM/qcVRDIqc9sChxwZUU5PUm4rjpq1pT6XTecJWEfgCEJAjZHbjL8vASn9PnYaIkI1FWZU5PB
	z0+sZhBYRy2BaX4GnI1nMCZIuloLRVH2htWT1Pya93/x+EpFTpbZ8vpPR3A0DJ5uyNV9f0+C0tD
	qW6vfasZ/hR+lY+Q==
X-Received: by 2002:a05:620a:c45:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-914a2cccdd1mr195784385a.4.1779360120569;
        Thu, 21 May 2026 03:42:00 -0700 (PDT)
X-Received: by 2002:a05:620a:c45:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-914a2cccdd1mr195781785a.4.1779360120084;
        Thu, 21 May 2026 03:42:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311670e02sm8737368a12.22.2026.05.21.03.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 03:41:58 -0700 (PDT)
Message-ID: <406514ab-bb74-4e5c-9348-64ededafa6f4@oss.qualcomm.com>
Date: Thu, 21 May 2026 12:41:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] ARM: dts: qcom: Add Samsung Galaxy S4
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, phone-devel@vger.kernel.org
References: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr>
 <20260519-mainline-send-v1-sending-v3-8-3dd7aa125353@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-mainline-send-v1-sending-v3-8-3dd7aa125353@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEwNSBTYWx0ZWRfX/NwunycKHmq7
 ol6r988hFA7qGs+cvxJk9e0UYhWsg7pJL6e7La+bXNMxkE3YpFdQpDzE2iWPMoarOTXos0TC92N
 wTSFu5QcCG/Cbgycyi+RmmbhneizVMACo6RUlEtOMhsVgfRXoMEsftxTHQC5+zPHhezeV/NsBgD
 EzyJJqHAb4NC+oBeUAMpNq/mbSOtbmGI4VufcZXsWpa9xia9V1G8Nqs9P6KL2udKKyyIZiQJfmL
 WGOPOUzj5h+E2U7SsjU2oxyCvuNIuJKJqAQjxQALifRNFzknfBlQF6IeaQeHWABvygeLSOiXtod
 yfSZQMadxO9g7xAqkaFJeRWQ1mdU9ZYFA69+MWPEf2vbbBIEDBeCu2Tl5VByn5JCrLCEhR6kbSA
 syxI1EKDmZphvH974SJBUPEpVlUwXfHVdcuI0xa8IvcRWja1hk1gfcN+IwQQJbvIzFMGOXdYD65
 fxgztfgZGqFLMaJBQhA==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0ee179 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3BB4LYrPl4bHvSfQcI4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: AocFZa8Jba8cMVXMUFsY0K37W2ufHSP7
X-Proofpoint-GUID: AocFZa8Jba8cMVXMUFsY0K37W2ufHSP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210105

On 5/19/26 9:16 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> Add a device tree for the Samsung Galaxy S4, codenamed jflte.
> 
> This has been tested on a Samsung Galaxy S4 GT-I9505. The initial support
> covers UART, USB peripheral mode with USB networking, the front LED and
> the physical buttons.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
