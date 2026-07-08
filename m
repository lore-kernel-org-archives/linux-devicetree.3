Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B7B2FD7B1
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 13:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516607; cv=none; b=FjLs7J3DsPZzVdSMOlC0UXDVgNdjFfpKXtkCER4OgSvysag9teEuIuEffx60gOCHQbMPfutS8Vpp6mPuunjPSVVFC8k/AVXzZf/pzYtUI5R1DXc+9o2i28fWf3T/6PRgN9y2jW2zC8xoaktKC2nq49sr9zZyxN3vTzWsBeNFjrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516607; c=relaxed/simple;
	bh=zJva5cAsyjmzVqBVumTX5Zywhnrx7uMtvJBFxDGeIMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cqcoOJ5TZT41VVSKpK4QnKaX64xgmngFtZh5riFsfSfUD3mz1BOowc8tDKpL0nlepfjdCbk+Fw2JSTy9s8tuiQicFtoUtAn6I3nc1P4VcLznVSHVpL4eh06jtkLrqUqdZGAfkf43p+s9KLfTOm76XilzbdwL+AXJ61TrcSlmC5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VteuG32F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kj02rgB+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VteuG32F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kj02rgB+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3JEo2666207
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 13:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXzmEq6LO3fIlF4Ec7BnotwtU4WcSRjzWN/rTY9gyJM=; b=VteuG32FZRLC87er
	yf2b9CrafHqJm1QWxUNNEHbAnav3n71OmWW8m+kxEVDFgkmHT9oPlFEm3BvyHAVX
	sO/0i88dVGTYPWFP/z7MKEDMbrNy3Jjo8n3bfhtxXIGr7DDL7DuENaeMLnR8IaZn
	tPdiTCAYGY9fKEKcORew7h/KBqBMmhP8UboEZ/A6y5qw+oyABiypxIjA1x9vfvHj
	wPV0Sfn0jQBh2nUTOwf/ClmrcYj3Tp5oeVKnnjIQ5IFrD8wEN2VoIXWu2RUiYkIK
	p2cphXlgQuSrQI+DzYVEn79nE2jxp5NFAA6SxS5f03TV5y62EzXTvaRXfr+KcK54
	WRx2wg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hguafj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 13:16:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8efc8d8e897so2760046d6.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 06:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783516595; x=1784121395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXzmEq6LO3fIlF4Ec7BnotwtU4WcSRjzWN/rTY9gyJM=;
        b=Kj02rgB+kYolpgOfwPVbqPxMeNZmWRe8SB87z1ZuFl9qMguDM7U5GVCNcue8SPMwFn
         fBlkjHQSwVJ6nyAU+dYdth9X5QX+5+AUCZeumH7cIJAZ2FZ5y9cB8skOKd9OeTKh9+pV
         fQVcOpeO3bsr+SbLGE0X9jjizTnmbH6P7NqMsKA7rHcbb3JpfeIRIKJj6jLPrpbcNGqQ
         oBWBXodA9uJxSrhP7CH4dPOCK0boD9hSMge7R0VlzgL+p+iKJk2qnHaWXQfJ+Yr/uVgE
         mX6za7qdUQLzBdlDAUCLwN2vwbBW1yzxpwtLy8sW25L3ZOaDCAELitr3TyC40TNeAqVJ
         828w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516595; x=1784121395;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NXzmEq6LO3fIlF4Ec7BnotwtU4WcSRjzWN/rTY9gyJM=;
        b=bUVyyfCFTetWGBN5WVIL/gl6e+x3t2JEUKhB1h2DZ1jg1jgAw+9Djt+6TI69jbI58K
         hOQaZgvbH0DEW2OiOdIVb1pAq9x5y/ARBaDh6FGUjoCQW5Y9QrffL35ktBOkK8QydDGz
         v9+EsR3HfYx9aOxakksgL3t1Y7262+CXNPDC+LitGwHJq8TbDsOiyGXvnzNUF3VkBNE2
         Iw7O3HUz/xVb7Fe+tau2QRSiD8/hnPlM6bNgCRUvz+jUITmXt12gRZzQEVC5VzDFCAcf
         z2MdUi9cyn4hAbSAC8eWFnFJSC6Jv5iUEL0HRR4oUTEwknRKcUZmSA++i8o1V7H3a1dI
         uQ2A==
X-Forwarded-Encrypted: i=1; AHgh+RouGnYxJZRC36NRlYlxOjR3+mLV398LX4k3w9plFDKT+YRIgW4Czj/FM1S7nJhwFVwnYGarJU8uY2dH@vger.kernel.org
X-Gm-Message-State: AOJu0YzSiWSBBP+jk7dX7LJDT8RAv5gueD/aBVtg4KxMRXopmXqJqxtf
	jYqU6k790D791f8UZ4uLKDi2kl6BJQ9qRwv4+sUsO7TL6sr6bIyysyFP/9FMVqR5OLRa4U69D8E
	Kn7bnOr2D54lYq0i5OH2VOPygnc40YwOhjWJKm7+SWrsoFscdmu8fhCNI4VWIfIaL
X-Gm-Gg: AfdE7cnK/7pBVhnhoxEcu8tgPOwi4e9Fs7ZtArM5yABPXoq3cYC3M747ncyplXtlh/c
	mSTwEk7oG9VK7FUr4M5jaYWi+UdbGSdNnLfF5TxBa0e0kM366srZ/zIXjZ3rfORgeCKyEoQYJij
	jpQmMjgHj8P7ihFZT0Elze/V5a2t7oAoY6ClBGGnXlLIRMUWxhzP7kqmfHCk9GqpM7TTD/veXNe
	nivxE3U38t07GOKG6K6Ap0I44XM9LhvrzfFokBtFM45UhteXC+JhTvsTin/TxwdkmtPkO2qaaLC
	0MwtWpOc6uuub4jwRNHv1A8tL1esG6TIeKxeR845zaUIM1dcnh5yyES4FFrnINQIGD6xK/zKqAp
	V0kvQG3iOKE/ncw+CamPYdCdESZO1cbznyI8=
X-Received: by 2002:a0c:f405:0:b0:8f0:24d9:364b with SMTP id 6a1803df08f44-8fec3bfbae8mr18446776d6.7.1783516595480;
        Wed, 08 Jul 2026 06:16:35 -0700 (PDT)
X-Received: by 2002:a0c:f405:0:b0:8f0:24d9:364b with SMTP id 6a1803df08f44-8fec3bfbae8mr18446606d6.7.1783516595095;
        Wed, 08 Jul 2026 06:16:35 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a3652a02asm7016471a12.11.2026.07.08.06.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 06:16:34 -0700 (PDT)
Message-ID: <5bfb3aea-4836-488b-aaa9-ad770baa9c95@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 15:16:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260708-eliza_evk-v2-0-c599246ceba1@oss.qualcomm.com>
 <20260708-eliza_evk-v2-2-c599246ceba1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-eliza_evk-v2-2-c599246ceba1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hWIX6-_ouIAYOVJUDvS05YMQqYyakRqu
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4e4db4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: hWIX6-_ouIAYOVJUDvS05YMQqYyakRqu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyOSBTYWx0ZWRfX8R9piThhCr4u
 ZfmvoGsHGMrchWJ22DAJqwPF4p8lqnmHWekS/dkWhdfLJidAj42tcLQnCrqQrP7HeJUJpCHxVvr
 +rR9N7GJ5KRNAweDSsfAP6xPcLTgEYo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyOSBTYWx0ZWRfX8ZfNYyDchp90
 AQ3xDpO3EvtNDxjnWWHBC5BWANE2jzwgVE9as0/Eo2bUy/iFHMqyUPsKwL/xaInAhieMAuPqLD2
 P2XmrnjqhDGXo9yV+/XFYGQDgD6Tntu19UCnrJepE3m7DSvZzDwn1NuKi1MGjWVFk9Rkr3PuRtX
 9TKIOKt31o7yMrIHq8D0xZ0CvKS8NmjUo5c3iI4287Mn9EfZ/EIT4n9DnNRrbw3jegbRLrYwNF5
 LOQsmekPIMIN2A+7ldVIPL4U7IXoaSHUbCx9osi0UbvhJLfyeyJefJbliZjFt5l6/6PLK2Xw91B
 qoPldLYwjcstOlpMFDj6sfCp/r/hk34i/jh/fm/nq6OzsXuu+6wWsA0wp8WR3JvzVOXVWxM8ujS
 CwCR93lD4oROKUlTRf1JV0saTKVxh2sgnhg+NFgAOf7xjLd3aYPNPn2LeGP3r2/+Wm/b1vhzf/o
 Lpi8TCm2TL5RWa9lX1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080129

On 7/8/26 8:17 AM, Krishna Chaitanya Chundru wrote:
> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
> 
> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.
> 
> Override the base iommu-map with the expanded set covering all the
> switch's downstream ports (0x1400-0x1408 SID range).
> 
> The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
> switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
> from the PCIe controller.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
