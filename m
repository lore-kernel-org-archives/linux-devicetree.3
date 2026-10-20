Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484933;
	b=S7VWI69pVPLzVDS3f749wSKXRFEsSJxHI+c1nUsqaz3c0yxN9+yUEjYYRQ7RNgLkYwrd
	 5qqMdKCL8TeIDu7nPM4+nMmBYWuP/3h6LyKSy1vICDW5jLUX38II2eZ+RZP9ZsiqEYXdP
	 /SPXQr6NlAhdHhDoxy1l8dYOruSBxvoHwilcq8GHc/x5y9MTBNaxEcPU7s/cuboa4qW/B
	 4jeEBEjpNOr7m+y2ttyP4tSiah+9tVTPKQV/Hv1Ufkoa6omSszZhOD+JkB6fmMdsbYMxG
	 WPXPoglpJ4Fa2vLPeSZ/ndL+yzLBRq0hUDjec1QD7UP5X9AetfE3ZVFFMbkCHk6pJHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KGfAPHpsq6W/DX/k0Byx8PTAqkC3r1OP0csMJzXqDnw=;
	b=w9/8Z2wYYFJPi053dRbhIFoZPAL19tUj/uQH7aR0JD7lLamtT8i7+cCR3eSS11mMCqSz
	 mra2iMfNkUMV3HjwNegkFYgHHpBkg8adi/DJYFlvlphxKUbbKTXzNT4FEjPoQTGoHT0Ve
	 +7wBS8nIy1Ys5qaI5OW9PzglCicNxwza1RXfP9Tvx6cS7nv3nQqkJUUhTkAM/QphMF2TK
	 8SCAXURCT3BX5OIfOPGLs2R0mLiHeaXw+R8Pot4RCwixmXCkAhj50T5XnDRM+td3jlvni
	 dTqFrPzPpkhqJNSctnBoa9fumhoycSv5qXQzbfFfg31Agl/GH4TyFEpsfhpNsKDx7ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lkG+4lf9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPPcrtSB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EB7606A330
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79EB7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lkG+4lf9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPPcrtSB
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8Ng061673370
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KGfAPHpsq6W/DX/k0Byx8PTAqkC3r1OP0csMJzXqDnw=; b=lkG+4lf97J9M1Jcm
	9rFwU/pY9ta+CZlYP8cdyba734bZluqzXOKHaZVvMjFY9cNTZ3g4N4J27pHDTpDJ
	KGp+pK7du9X4blUs5u0KiwWxGdv7n9oiFYG2JUWfieciXhVlJ4wEcOEYQqdMouSp
	0o53zwQVoZlr7Row84twP9dKTQyPZB5+g8fo3XkXfT0nNo8p5JYcOE0QVSXNDOjQ
	Ez7AKlSmZqHxcwIYaw6PFHkN+N4Cnpkb2xpGwuQaBrJ+aZXToBjFPGTMPQF4vRvg
	fb31HTx8bv9LEbhZTWI54XpwEas+L3AEVhEVazZ3XAjf2qpvt2+KJOXToRmyos3q
	rGgzvw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5phn9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:28:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e629c7b16so59940685a.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792484931; x=1793089731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGfAPHpsq6W/DX/k0Byx8PTAqkC3r1OP0csMJzXqDnw=;
        b=fPPcrtSB17V9olGUvvqwdz7mqYYl/1jUJZdqPUQVSN5IXo8QmecFstCzxB02aj5NNF
         T6oHPDLhHvlrXG3hcAZRNX2RBvVPiggS4iorD+HwH+j/mif1P9oxRPJN8XUeeu82pmEY
         1isest0EXYGauS7MnGnrazG1P4rUT6Trhr9mBwKKksiPOiQEcSx2g7Db4uKIX0IcHrdV
         ySR4sEE+dX5WAKullsUtuzJy+yEUkYA2nH32Ou88N3kbhMY5O4Wtnx5Aab2tWp5G+1Yy
         NXtdqh/tGehq5Q+xKXqxS130pnm/83V7TvYDsu/EgRR2GousuXZ8DcnxxXnpVRUQwoyB
         k9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484931; x=1793089731;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KGfAPHpsq6W/DX/k0Byx8PTAqkC3r1OP0csMJzXqDnw=;
        b=T0kE4/UekSlypU72krHbVFkXlVErmJBrxoXcVlJ5mteOQ5+L3IP+MeJ7BHXkDJHTL/
         tEEyDB5Xl1PHH42tRpm+zMkFYUW/a7bg6X+769cM1K9qb0uxYbhiLhM35MWSfqvnmJN3
         UNRUeqs1nqM1dBSTMGH7zBwyURs/8UPq2hh7Zd/C9DSPMHpbIfCDL2jpmy0suhN8EPC5
         eHpvE7yWhRbkWdL24WUseOylmGmOT5fZMWnBUFy60DQUHQMDRcHD9x/ze3qSR/Vvm/z5
         hkwuWPpZmwGbHu1vjUfp8k5QE9EOY9Hr64avT86dr4HD6faksffInEMhBveEnozXtdDx
         THiA==
X-Forwarded-Encrypted: i=1; AKwUvBxp4mYlsD9wcw+gXSAxysWsjDQmjmyYhRk71DxmF0HETgo4aIjSvSyriXQGXBTcwWB0w15/lWWHxz32@vger.kernel.org
X-Gm-Message-State: AFq9FYLeL8MAsIM8XFxDRCq65k1HsgKfQcuILtBgIbf0G5N0exjoSqWx
	laLTqj8lC2ye/k25ZnkYJijAhqh1KEU55YuNlVW+10X/JJRfkc44guhE5rHVUF4lq3v9LFlzdbt
	iAPbAKjPYWz9rpGAXrk6SVNV/X/uhAg7SCzsx7umfonf31tp6zR+9nXnZI8KfN+dj
X-Gm-Gg: AYBFou303zUrPYXZLj9Sc1ws+mz0LL1uDN4d8rZ9LPGFsOswrOr9nhOTnFTrtCGqDYR
	V8CXoFuG2vl+ykmCu8e0vunRzA8KBL1K13QOxjzD2KoUtulVeT2RBXY8Dd3y2NSfRxbeXCktLSJ
	+FSQGSQ9mju0IaB9Hvr/URr4PXaa44AJP2vLcmKyTq4qCkJ+Vo8fQKwW0FjfEcDCkExw6jZ3hGo
	i/53k9wjYZx+eB1UvRU7EI80jtKbPnUoeTc9QQP/XSaBs7JJr5jfpoloDAxfgzwsYRcxoPnM2Hu
	6BBZzpGLImTBIwBbzbWsTjzn5mTAj+C7jQovi3zKJTgedOMuZk9KVJL6aQ8UQ6ucFYlui/7hY+R
	zYi/mv+WoEmXXWk+oCLPNNQ==
X-Received: by 2002:a05:620a:3190:b0:92e:6485:f640 with SMTP id af79cd13be357-93f29d216eemr1869318685a.4.1792484930900;
        Tue, 20 Oct 2026 01:28:50 -0700 (PDT)
X-Received: by 2002:a05:620a:3190:b0:92e:6485:f640 with SMTP id af79cd13be357-93f29d216eemr1869313585a.4.1792484930511;
        Tue, 20 Oct 2026 01:28:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b0f75sm5026181a12.13.2026.10.20.01.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:28:49 -0700 (PDT)
Message-ID: <ec5ae206-beda-42d5-b152-91c457218374@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:28:44 +0200
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
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp: add Radxa Dragon Q8B
To: Xilin Wu <sophon@radxa.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        dragon@radxa.com, Daniele Briguglio <hello@superkali.me>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
 <20261009-q8b-dts-v2-4-eda11e5dea8b@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-q8b-dts-v2-4-eda11e5dea8b@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad72643 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=6_vhy4Ov9suG7DV3KvwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 9T0soTIPWlGD1leZu_YrwFMBwG_UZP-C
X-Proofpoint-GUID: 9T0soTIPWlGD1leZu_YrwFMBwG_UZP-C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX8/z+0PEKbEbW
 h3l5XIWjHQV96dKk8UiS9KxgLMUTZwpmiBzgDfNJveHEefCNsKoYeN9FaOe6Q8Ls2QMM3fFruwb
 k2zVOhfpjkFZ01xfayu4C69DuUx+73LPfzHk/Dg+K5pwGk9QN4WQCxDE7aqdqdOM0vT6GRctWnO
 so8qAuZlMcJ2y3kR/jEAMo4OeuAo1UBypa/wMg14auza/k0Oz+WFJ7qcwaxnZArxzhFbTDIU7g9
 HO6pxgUNgPUUCJbgfNg5mBckgHOTCN3xwbYsZrvWWTiO2V8JgJfe25y2uK/2Fa6aNyQdRgQKzA9
 Jb1NosPmMHSzsXq2jbfAVKNw7udnyn97P5j28siD1084bsNxbMNB9yuBqms0HvUDSYEv/vNvAW9
 7CxV4oobF8ksLK/QevC4xqo8r4pg644gUuBBP/BUQEyXw9/52jFnKZfqg8J6fhQKR5WWzE4QSd/
 3TxyOsZPAHUc4/wgm+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX2nEzHiCK+2dV
 k+eNEJYfbdCb88/hwKXWXIGbG76SxCGaRlyE2dPZ3giHsReZkZSpSKXLrbgsocLKOcIgagqsSuv
 nnKII3IyK8sL23XsDYWCeOQMuCMtjWU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200033

On 10/9/26 9:55 AM, Xilin Wu wrote:
> Add initial device tree support for the Radxa Dragon Q8B,
> a single-board computer based on the Qualcomm Snapdragon 8cx Gen 3
> SC8280XP platform.

[...]

> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";

No i2c bus and hpd?

Konrad
