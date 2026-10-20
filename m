Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503633;
	b=ZE/iF1M0UgtNdUIHHqSn04Y2WIT3sGJOrYn94ZDcifZJVgOhgTe6gRONsqtGq2eTGiYi
	 rBVCQyLhs6b5yrwFgq+iyDEw+i5UfZEXDylf+MD0i3loLPolh7IYxHiXp4WjqsZyGheqk
	 zHEjJKIenpWEvvJeengRP8jrc7UuMMzEe3+Sda4jK9RsOF4s0IBRI+Nw9QjPhvFlzaJcM
	 pBkOrpv29mUOY5Xj/VrqustaHCN+jaVP4H6VcQlyURVMa0+ZFkZMcshPiksX33SlJHu9A
	 Mi+ltwiaFoITUMNV61prXhpF5SeShn8zi6Db85PXLEv4V7kK7FVsXtBcKtkFJZvnP0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503633;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kjoD4zTcGaDNKdU4jZr6UC/VbdfZPGCSWwgF9INjzk8=;
	b=WMhBbx5VvOl2OphwqLAaBuNm2u7sZDNmtpf2msQs64OWN70EHSDLIrJApDLTNECwvNdE
	 mDEMShFCocZznyBYReBSCGIvABVzbfBr2rqCFzU7Qyed4LW/5qU3C76jDiciskGNS1N40
	 kM9GpswxE0tu96Rxnhv9GWBxJf+iN0dWTxzwhNVjsoeQ5mjZi3Nx5Fd2WwDFlQqV/a0po
	 LpFh2KtdR+5ufUiQKgXS3PdA4OiXKTnOf4BRKMKMyWzOHjB5/gZw1/CFDSbFklZsydMGz
	 S2QRvtwVH1z9YmMrLJ4eRndAndboGDDoLV7eBHcykCvg65o+HBmYQxtbgtCXL/dgBcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J+lSBTPp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xerno1ll;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8E2606A320
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF8E2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J+lSBTPp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xerno1ll
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA3QN2298913
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kjoD4zTcGaDNKdU4jZr6UC/VbdfZPGCSWwgF9INjzk8=; b=J+lSBTPp8au92YwL
	dppsvk97Ir47oVbGtiv4KOuchx4pkFy9PDd8bUDY/mrhbW7QzlBWHrsqzh0dck5x
	7IzlATfYdGkklpaYWcd5nA9LdnB67rTDl2TIACrLnUCUOvDd6sWMcZE5ZGDuEMty
	hUqwzKLOtAAOBfYG7bHhnKgceozxVduKkx4PUZC25GtJQYGwb1BV8fiRBK1r0cf0
	iv/b0KGakppcxeBIeHsO4x0jqOOrLlhOl5x+yw/UTuLNk3ZrVqFrB+SyMcqY+hSM
	MXbVsW6ZsvndvWOR6HUgUll/1fPAfha0V6025kI0nN038Dy1piNrlSV2bLWX8uYc
	JHWeGA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pjqj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:40:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917a04d1cb2so8947486d6.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792503631; x=1793108431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjoD4zTcGaDNKdU4jZr6UC/VbdfZPGCSWwgF9INjzk8=;
        b=Xerno1llNzdwOOSdwYCePrFJkureNneXwLwss1gnlmYvtd/qr63/KTHUUC0hDUk4UA
         k++h1q6CRlQ6V9WrP76XucKfxDD/qrfoVlJmdXluLcwlgyxQTWwLl4UGrkCHz2qT8YyJ
         TpP+/wdMKPqzVluqoMr4TqQnd4Iqzzj1x16QRrdDzWLK3bnG5fCIjPac2FoQEcU0AVLQ
         q4eJ1r7rBH4ffvRrrJYvQpLWd7w5t+SxkwMCu85ChTT7HJqeUUNQGnIhWfitZDaICJCm
         RAvhSY109Ncpk7pqYob7bfUcc5HVFjhU/I4KotYJr9VD3EEOY+70g/MZTFHDte7fuwOi
         wTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792503631; x=1793108431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjoD4zTcGaDNKdU4jZr6UC/VbdfZPGCSWwgF9INjzk8=;
        b=xLgKvSigbAeiXZNjymCajr4K07en6tjiRjjKAXP1zVMGS2Jmf9OPlCVvpVqqWUfLaG
         3CHQEfIQKr2Z64kwjgd2ssDAAktx5BaQmO1SC8MKal1tdsNUKye2d3JN2pcY0PZn6vyd
         uFgwKkGCk0AnL1LJdNv5CxU1fazE7ADJyAkRg+q4OttCB/HoSZin5tsEQza7nnW1mGa0
         RPWRp+mc5VcxjhsjhzzpTUt+b2HoTwE1/TPAlvbsb/28EZZqLDS0FYIicerYKvuTvYNn
         I2it1EgDWt7rrdPy2bzKuoS6tx/lzy7mCFb1TmRQiuj7M4ooymTrpxMXr6qQPyNJEJUE
         lZ4Q==
X-Forwarded-Encrypted: i=1; AKwUvByJjbrwGD+ID55H8uIs/leYDMnfLobQY5ngPReA/wiBo2VZiM/8kAMwceO1yPj78o8Yk7GKBSQipMPm@vger.kernel.org
X-Gm-Message-State: AFq9FYLpH4Vqp7DtLNU+lqbWJebw8bKnme1QM+AucxWkh/mIOyXmmmYG
	9bSF/DzxLLeDjp/uN6uj6cAXNOjR/nq5+dyh7eo2jd8C9MkgI8Rn2KsbiJ8hT0DjO1WBoWk0VVA
	s3j39D5itYEQSM83sJdcRfycFtOaxY0dOVycNXwAaeJ/IWzSwyzMQX3h2an4C6536
X-Gm-Gg: AYBFou2+wvOJI2J96Nf0aYQyAZsDPNJEw0a7TiK/Pr11BzN5NF0YUlpvMdqrbkVVtL6
	ryuZdcV39jDTU9NmIrodz9i68lBnZoHFb05ons/AU+iweadokbaljpOPtu7agRGcGuGoTIid6k9
	w54ApU3UUaXyO5qDIK4xQEe2EqHIIKezAjIKl7/X7GNUcnD7sp41dNcbT25xFVBV9A6xrC68uHQ
	XlTyKzTz09B8TUhpWvHscm2mZiSeL37khw1ilSFDh6cIEHVFeD2p9SQtosLiFUJlsD2B7GRcm6u
	Bt56U745ywSwt+EgHom85XmQygwfHel8lahsoiHtn88B9MPYdzWRRxZ7lDe5IuFLAetPyQ74BI8
	Et23lAd2ILAdZ1xMJdBccWw==
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1922212085a.0.1792503631144;
        Tue, 20 Oct 2026 06:40:31 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1922204285a.0.1792503630475;
        Tue, 20 Oct 2026 06:40:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb165bsm477628566b.71.2026.10.20.06.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:40:29 -0700 (PDT)
Message-ID: <d3670f1b-57ba-426a-bdfe-be560740f516@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:40:26 +0200
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
Subject: Re: [PATCH v3 0/3] power: sequencing: qcom-wcn: support SW_CTRL wake
 IRQ
To: Linghui Wu <linghui.wu@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad76f4f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=nQyRZacoh_ZcsPQd3roA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: pWL7bKDdYvwgKSkzT0IUQmON5HcNooxO
X-Proofpoint-GUID: pWL7bKDdYvwgKSkzT0IUQmON5HcNooxO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NCBTYWx0ZWRfXxaA5yW+AsGt0
 RdniSf27Zi88Zk6w38kyaXnMHTR19ya9p8HFFO69SsPHXJYxWdFMn5T+MvffkrBPyGRdmIavQgv
 bD0rhWAhVMwyyXzp2ao37540uLloOC3BKATWMOwFEZ3P5pciYEjk7d7FJZLrfpi+17sRkYc1DTg
 VwNO23VP6XDiWQe26oi6XP1I9nmZHR8bNxM9F8X/vv5bagVshysCZOxS1YmE42ZC+1JyaBwkI6i
 IDqzUmWZKFULDyQ9n6bfusUQHhQkoIcumZEln5EfsNtCIKDYzD7iF0dKervLFulNIE8u7ApI0+o
 afRXDRv86m3yYswDwc8bDZ85OFasYVqrf3BGsoOoBHZ7Tg58TBvWC6B2zLnkZ4NelGJjy/prOTA
 nlPtiOVhEi8wbMTMK3y/5VepL13MKXJjcLgIFHya3DaM9BP0Yy0t00HUF54OAwrGssqukmAQ1FB
 rEcfiwjHDf5TUrCTCCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NCBTYWx0ZWRfX6JcCpjb0+ojg
 9mf9P5lW2PfmIiDrr6PwJGihT3+h9UjwqayrCxGHd7qBhhtc6go6qbHDLvpMsHPpVGPD/TZnve2
 Wkk9BBFZzwiE/otyEzXWQ1Zu+xL1sc8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200054

On 10/19/26 11:39 AM, Linghui Wu wrote:
> Some WCN3990-family devices use the SW_CTRL GPIO to indicate that
> resources need to remain available while the application processor is
> suspended.
> 
> Teach the Qualcomm WCN power-sequencing driver to use the existing
> SW_CTRL GPIO as a dedicated wake IRQ when the power sequencer is marked
> as a wakeup source. The PM core keeps the IRQ disabled during normal
> operation and arms it for system suspend.
> 
> The series documents wakeup-source for the WCN PMU binding and enables
> it for the Shikra CQM, CQS and IQS EVKs.
> 
> The series has been runtime-tested on qcom-next and kernel 6.18.y on
> Shikra hardware.

qcom-next is currently based on v7.3-rc4 (for whatever reason) and
has 1398 patches on top of that. Please pick the presumably 2 or 3
you need to boot (I don't know, I'm not following shikra) atop a
clean linux-next/master and retest.

Konrad
