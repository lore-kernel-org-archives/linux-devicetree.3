Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB89337110
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 05:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776750923; cv=none; b=Gn2RnqKQFfUmlGx2PuDdtvtXVkTELRT5STfEQz5Oh1YRTB3LF+ZS20VHoyDZLYfbWNPpY4mkOknsTj3+42DSeACXZEPrr6MaQKEUrL50yd5kRnFBBlr2xo/HS5ovSIsrDi9Ao3DI1WAC4dBB+MIwtuSo0zBNl21TXl9V0481OrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776750923; c=relaxed/simple;
	bh=DwnoIcrwC48DuenKHaAGt4VITzl0FvYLmEIst6/KvsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaQ6BdpOAgy9WtrEPCMuY2gEPH7RGWyxXaMEVeLNprGI4olAHaE9XLqE1em/EaTGTltkDGevoKIuOeiZh0FiLVnLHjDn2uOHIfNgt0g0dfAoRAAIglcytfiMeNfPgm3nLhxgj7yC937b7WvWZ6seBg/n2bjtNmsPx9SyRVPf4mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVeNUxub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aroRNJxZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVeNUxub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aroRNJxZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L0qeEf2281695
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 05:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZLmjUEMZaBOEwk91cxCa7Dkj
	0p1g4V0BPoDXZ0mMsMk=; b=QVeNUxubskdrZqCWL3n1kz1kL5jOjSaiPtB3pWnE
	kVJ60PWiSwI14o2PjuT0a9TcwEmqMNhrmOoLPlRVDgGxLgFm++gTxcLlV1lseF40
	mkNlMSVwpbX4Hhj6Xd0F1zUk500+hY5BanH0G2FCqC7wziD8h7UZNOH6iArWqtqg
	m83mxOmCqStHyEd4j7RM5BEXZoE+9eTWjjv96LoZ2ZxhcyQ7Ig/wkh2pzTT83Mx+
	cKkXZn4v6xgyuSpIZ9tFIydRmkx4hUj5C4WtPwm2jvouOVosmWUfOGEa4I0vDEaf
	0Dn4/GrYEauqFRpO3iN/5zZvmjt41rLbMyMB+YskCV4Hlw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh59c0u9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 05:55:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fae95c82cso6853501cf.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 22:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776750919; x=1777355719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLmjUEMZaBOEwk91cxCa7Dkj0p1g4V0BPoDXZ0mMsMk=;
        b=aroRNJxZsgGS+P3mZw1Yfv6lvr6t1ozx8whZMrw2hq40gPGNdsMayEdphf1Jz6AMFk
         Jq/2RNwYFsYO64VPgAuho1GKViv1duTZsG+iBOemze1Xfx29tTakHXCoEKEdq/h3dyVB
         xAH+/1KNYMccaJFuql89JR5o6eR6d1QLVfCCrC64+RrowzddM7OmUNz78s+KABJBVTzj
         b9xTRHWKv+bgKuMe/FhZvuxTmDJZ7Lstmr8w5vv42u3R2/y5zmjwbThpmkGXw3aDP61l
         H3ieOYm7OJ7t8LrbjW/MdmmqcVQGKPzXf+5M5FOcW/HYXjJmw6a0MtzcDB8sszJw3bDI
         jAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776750919; x=1777355719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLmjUEMZaBOEwk91cxCa7Dkj0p1g4V0BPoDXZ0mMsMk=;
        b=phT2XJPJDuixPtBvvHTKl8XW6OE5NApMEepuPcP7SWp4sjnb9IskhwZIpZvnjeCvpV
         lHUMmfnesewH9fFPIVNvN0jPXhQrCc23Yn05Vr63vRYDebHtpKNrcH5jm+Gb8zYjrbnm
         3M+YU4T1X4Ou01MFUxP0S2wmDWC42/DL4QXAW252Z/gTR2mf6aPLIT7UaabHOA+PfXlp
         UWUbcrmRt9utJvp2IJ8iWmTikDFjifyxDBYN0nsYYUCaCDKnvh9vNdSOWeX9bMW3XyqK
         sGPla9cePWpWC/YZQi3M8BkX887bVKRFza0JgbL/T4VzENM0wX9b4hx0/ZYnC/2Rja/0
         WfRA==
X-Forwarded-Encrypted: i=1; AFNElJ80gop62YLp6RbGOI2Po4VaGXk0zImwWGERS9bI1ccj4vVT1ip15Ur6j/2zr9AXbst1W4ySqcm8hiI1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3utgUu38lFRD3N3W1FgHyh2A0pZvGD3F8APygIeLwUYPgQS2K
	O7susEJK51csrlKuvokhoOSSYm38UbvQayKvpLXWjtaX6aZNtFhPpwQ2GdnVf7ZvtXrTiect3nT
	ABBfDIGXGB4Q/HuK+Qpmje9p8OrOLeuq/J35wLelZE9DByXvP81jxPv1wlP8TYA+l
X-Gm-Gg: AeBDieugtSMgcaukbhe/VFLR4+fJatavT23ZGr569X+BKnnFdOsiL2o/ZnSSz78F0jz
	JRJYNeNThzOEhxD4rrc9cHDUsSu5D13cyE9kH+RZyXATjPVvFg6Z4upt5IgmPZnBHFLvrVimWfg
	VKq89cXKd9e2C5woHeNwlua2VjawD1moik/U3S2Lqg63PGaW1ZdjOdSuHZ9tXi5TFA7DyP087g4
	tI1M6hIO7iQeTgWbvMzpEEF2fQXZdLs+sshybaY40II1M7dl50wsEOFc0t1tXrLGkZtnSnqpZ0V
	FIssuA4NXmqE1baWcg2ME2hupPZwFZj9a8iRyqvWQDsG5utcelBZOq1pM5qmMzGASLrwhmLCipF
	8Re0gX83NYzqd8R4/aaK9rixw+izukOuT8GHNyDewyEk5AmM=
X-Received: by 2002:a05:622a:1ba6:b0:50b:1e5d:9930 with SMTP id d75a77b69052e-50e36eb86f4mr249982781cf.58.1776750919057;
        Mon, 20 Apr 2026 22:55:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba6:b0:50b:1e5d:9930 with SMTP id d75a77b69052e-50e36eb86f4mr249982501cf.58.1776750918542;
        Mon, 20 Apr 2026 22:55:18 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1249sm31437198f8f.5.2026.04.20.22.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 22:55:17 -0700 (PDT)
Date: Tue, 21 Apr 2026 08:55:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] pinctrl: qcom: eliza: Split up some QUP pin groups
Message-ID: <iksogquo33tsza2dlw2dkkb3siei4zubhtedjubpnvtmuqnwda@enqxfehgojjz>
References: <20260420-fix-eliza-pinctrl-v2-0-b68329fd6701@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-fix-eliza-pinctrl-v2-0-b68329fd6701@pm.me>
X-Proofpoint-ORIG-GUID: EvIrDAZICqW1FMScj0RX28k5h4PryiKx
X-Proofpoint-GUID: EvIrDAZICqW1FMScj0RX28k5h4PryiKx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA1NSBTYWx0ZWRfX6BsLcdXGOCVo
 HqalEyBthzmuXooRBO2UIYpeoP5fhZme5AR2YZi7Sk0y2r0m1uRH8fmDZO7wE5QAgkFfxJQuHab
 Y64Uco1XQW0xG2uRtSGlkP65TiTJJueU4TtYezSTMnJ7+7uLMwaXfmOYUx8jyKUDy0gWxD9KSJR
 RNqGyokH2AjVandgOuqaah6giK/G3OkYi7xyrz8MJxmlkUQ3zrd0ZUvUGAsgcRHiPoRU2KOO05I
 r/fB5EzYCb/B2X1vPSi698M6IrxQ+tRBvkwuUrWajuxB7fMqFDHExqHM9/qlrz5Fp6+SssHhiDu
 I5im803kNfjpgd3LlK3SKSg1e3ps/o1c7qBeSPw3oPUSAA073Fb1y09q+F6hsDREO4ukJdETpLA
 IRnKVpCb9BYGbwvolsITy32g2JQvyNB8CY5mhZx0aHlJaCaANJwBlwJpeAHVi2RM+yMc6vjTE80
 NG7giKZ+4ZKsAWUmp+A==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e71147 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=-5iab5_emSoejSdK0CYA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210055

On 26-04-20 14:27:46, Alexander Koskovich wrote:
> Multiple QUPs have lanes that can be routed to one of two GPIOs and
> collapsing them prevents devicetrees from requesting specific routing.
> 
> For example, a board that wires an I2C SCL line to one of two GPIOs
> cannot request that specific pin with the groups collapsed.
> 
> This series splits them up so devicetrees can request the configuration
> they need.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Nack. That's the downstream way. In upstream we group them.

If you want to play with the WIP bring-up, here is the tree we use:

https://github.com/qualcomm-linux/kernel-topics/tree/early/hwe/eliza

Qup nodes are already in there.
