Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769488;
	b=GdFIfuH133BaU6LJY7HmYdTDcM6yVUOWUDpxxeLSmnnvrhKZx39BnXFJc2dRNg4uTdNo
	 w6RLrF3XbL89y1Wi1aSIyP+4VZj8SlAlHmvlEkq2JaASG5hItDbSBKLyBcrvQ6b7R5mx5
	 Q9NiMo2Yv/PAtQE8qWpckgLjdujVgEVC2CBDlcxbXvw93O5Vp48CXUmOCvzstIAw9WkhU
	 wnvYJPiPsg7DJsGslxmi5vo9e9ndhdmgRkbGpDr0B2HqIate5ePOT5Zp82ZRTIodhraJB
	 SZGX6tx0QZWV+y43uJVl2sST7I8JhNyeqm8Q5JWypnaK+9aZttbZcHfujRwqtD3QxCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769488;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ncAkwniUiKCZ57s4pfRLhFI/iOUpcsVyWReMCLf+sjA=;
	b=gqfz6w5A4gNpGjZBG6aLcHcOn+MDIfolYEdagx5UcgiNwvQVAf2QkOEP+18eSJONTDii
	 r4OZKRW7BhI52jjJN9jGFZ5Q8vzEGzF4W81wVWVakRf9yTVsOYUFbxFiWB73ZUDMwBQDn
	 hP9cDbjWjQoDkLpAasdhyt1yHL+u1uv6p61BVoiq3kOadfRd+pe9iWBvrIX6L2evMO9nM
	 gOWVf3E8DhgclY3GGOfYMmbzPV6YY5cgJnGqBtjBsQsljJnrmTRcmDtPIizLWyT0lBAQX
	 dqlZR+tyra7D/rGh8y+zhkOddz0FGzyUCa+iXOncE39i8G7XxaZWs+R2/NihLTev0nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YcLlb51+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AhJ79DrL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E77606A32E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25E77606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YcLlb51+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AhJ79DrL
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GVTl1780018
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ncAkwniUiKCZ57s4pfRLhFI/iOUpcsVyWReMCLf+sjA=; b=YcLlb51+4v2NN04o
	5zS4k2bopuvWlh0VcLauCjavalzbzCU9Iy8GINWU2h4Td5r1NJIZwFQ1+QXRR57u
	m7qMUP/fpXMOUP+7bXmAOR/n9daanr1Y8T+Mw7J1PhYavLzenv/LjNw63Q4UJWCw
	ifdHNBr2S8bG+IjxAuBgqGA5XXqI3vWC9UnP4+TzqTJvy4UkgN/coQYDa0gTBeUQ
	wMXkXWBjodLboeeksYpKcu43tzkdy8/S89xp9TUYLj0GRtrBZu8gpucgtv73SsLD
	UQ1YQ5w3LHIDBn5YKZym0GD5pwHZmjogdqNm1s4uErA2g8mzfZd/fFCWEBUB2aQL
	A4nhEw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhgrbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:51:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55b9c41fc3cso21594301cf.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 00:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769486; x=1796374286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncAkwniUiKCZ57s4pfRLhFI/iOUpcsVyWReMCLf+sjA=;
        b=AhJ79DrLJvCCLFLmdZiylIbV7d9OBRpjMNHqR+77fh5G83JYp2w5xdN/13YStyBmZ7
         LqyKh81/a104qLuUEHwcJAZZSaIYvKh2sAGQvCho73cnXwU3q32N6S4shB8PhDhIqjGJ
         1KNUVogAq0y5WX67mwTgXcZeAFGWuxwHFrYGvF40KvqU1D8FSMVZtrLFTSde1c3FePg3
         yVv32XQjuG0qUcsedBxmprP5D4KMeEiZ/iOce1U3azDnAQs9CEJwJr9XLRVRN3x16OVq
         nLwbWugz2GaLcmuhGeFYKhZVZ1aD8L+Q7H9pF/wXn6lMyYc4tAtS6uG01RA88+aZ/aCH
         M9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769486; x=1796374286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncAkwniUiKCZ57s4pfRLhFI/iOUpcsVyWReMCLf+sjA=;
        b=JBim/XxnQPHEhhNTi42rTxBI0SJr3sKInLWlt602oiaPpXSF4t8P9772qPw6KhkyFV
         PSz9h4V6N7fi3lCGng1BXDsp2QirjbaLDsgONtmycvOSmGLd5we4uSMv6Z8pk5QQkyQQ
         PFZLlDm6RNYp9d99GcE0YaqP7myK45r93pmQUaXKOS5JUligzCq/HcYEQ75T7DPbQDM5
         9VqOT+Cns2QkbWnOPnIOj6qjqfoi1w+1aXUsQ94OeGsMtVITzLCxw72hfGBOVZgVbtVf
         aUElDKT6z4ae5U9k4gLS8npT9nTRIcEmpECrQbTZNtCsw7tMUy35DPcfezdrm0IxKO8m
         PWRQ==
X-Forwarded-Encrypted: i=1; AL+hErHNJJZh0qwhgY3Q9xFlwj8AAGIttAP3nLLFpBVxQB7r104IJ4m9QZa1zKMq28egHLVkFgeriLBRrIld@vger.kernel.org
X-Gm-Message-State: APuU4Z8BPU9rlK3iZ6aK8wEFLCHDMT05UhYTK0qw7r56ofMGmcZSNcak
	mTOwWNDIVfNJ7m6ZSRsMWQgXSCbaKqQ8nT4c22ALpIuPWuB/OHDWE+jih6hUVrmBNPSNjV6S0yk
	crRv4E06P8SSnL0zvCjW1DsCQE3GBDCJhxtlTASIsov5hosDsnqndYl5svWf4L1IuffkqKp9c
X-Gm-Gg: AZFdTZf0nFImk9FaXRK23wwiB58rpYmLfVgB2QLH+q9dMphKNxvH3A8dS8iLtUpHxDF
	bkDTofUfTTKn+yeIjUzhRuft7dlUHNjNm/3xLOLlzwW/owmZN3zu9JqdH0FxETIhl+5lTh4qdSw
	ckbVtkZ35xi4Rdw+3xczu6c7SMejH0a7uCPafl806LcgkzcSRMNw1iDNHdR5y6v4nYkPiJMtK8s
	Xkot7/9LvwmCWNX2coW6f4hqE0S4c0TutBy7WbFPNWjkdHEI3nrnvLbeOOAib7hM1Y4JHoZvDxQ
	RJQu9pk4lUmX8xHPbISsRjLlFPiDMMCIhlIVb0mPbKqmy/tapEU1E12s1JzVxRXtmkiqDZan2Gr
	EnOo46QXZoInJOCekgmOZ0Kg2Gi+KP9EEjEy2De6H76aUxoYRYNxfAnOruQ2VbSx9E0sr6EY1KT
	5Br5cwmO8=
X-Received: by 2002:a05:620a:a78d:b0:945:c5b3:6356 with SMTP id af79cd13be357-949ba8aecbfmr3881940085a.2.1795769486555;
        Fri, 27 Nov 2026 00:51:26 -0800 (PST)
X-Received: by 2002:a05:620a:a78d:b0:945:c5b3:6356 with SMTP id af79cd13be357-949ba8aecbfmr3881937585a.2.1795769486037;
        Fri, 27 Nov 2026 00:51:26 -0800 (PST)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm260458785e9.3.2026.11.27.00.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:51:25 -0800 (PST)
Message-ID: <dd5b2309-fe69-4c78-abdf-8be998247c62@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 09:51:23 +0100
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
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add Netrani TLMM support
To: SignKirigami <prcups@krgm.moe>, Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261127-netrani-tlmm-v4-20261127-v4-0-a77415255784@krgm.moe>
 <20261127-netrani-tlmm-v4-20261127-v4-2-a77415255784@krgm.moe>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261127-netrani-tlmm-v4-20261127-v4-2-a77415255784@krgm.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNSBTYWx0ZWRfX0cBLH6nsguGc
 lARA3jJiHgMBjcO/zanvOG6gJRaeU00i4qkKLXu8iiAY9su+390aJGhpLFFUoqCEJ7P5NtFUE3C
 gXDOzxyZlsrW5a6U8F7xvtYOf0qpgeo=
X-Proofpoint-ORIG-GUID: bJPoX5VclvHRxrvDj8hBhA7KukTWHPen
X-Proofpoint-GUID: bJPoX5VclvHRxrvDj8hBhA7KukTWHPen
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b09448f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=1w543XZNT9zSpPk5rH8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNSBTYWx0ZWRfX/2V8Kgd0pAb1
 qdUKk7TjWX66/tPzGsgnQZ8NZ40FEFsKShKCVaP97IEbVV3pZXj9ULYatRh3oBAYUuGfm+E0MYp
 ZFI7JfOgcoy9o733bO8X562iMXGLdylrJ5bopDmFaLbxaCXFvomIF6/Sm4mXiMBNa2+SGcUWfvB
 fapQ2nwLJqL1YbXI0MVjfllzGKOxdCTBhoKdrx7Klip3qwiufDtvh2JbOOQXTOZg/LWDuqvm9fa
 2Yow2GGwxSpjG/Lv+xnwaMlhdQZfmmZw2w9kzyFqfyMBqAfpK+sssYjWLb5rsz4WpnE9JACtB91
 wv+Wm9jlxcwvmnmrNlewnPDsPoExzXyCvJoa0/jt8tczw2YctzQ+5lV4DNoY81JfVtd9sF8wyFN
 v8AZQGFPL8pj7cybP72og1peSc52q7m85y4tZ8ix+d+shed2QD6Ycqw+Nwg3mnz9XBGUD4r+QHg
 1aOtcxRT3pOHN3gKmRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270035



On 27-Nov-26 03:47, SignKirigami wrote:
> Add build support and the driver for the Netrani TLMM controller, which
> provides 142 GPIOs, pin configuration, eGPIO and dedicated SDC/UFS pins.
> 
> Signed-off-by: SignKirigami <prcups@krgm.moe>
> ---


Feedback from an LLM with doc access:

Move gp_mn on GPIO18 from selector 2 to selector 4.

Add gp_pdm_mira on GPIO14/selector 4 and GPIO15, 17/selector 3.
Add gp_pdm_mirb on GPIO59, 60/selector 2 and GPIO61/selector 1.

Add rffe0_clk/data through rffe4_clk/data at selector 1 on
GPIO76-85, in order. Add grfc0-grfc9 at selector 2 on GPIO76-85,
in order. Also add grfc12 at GPIO86/selector 1, grfc0_mira at
GPIO87/selector 1, grfc10 at GPIO90/selector 1, and grfc11 at
GPIO91/selector 1.

The rest checks out.

Konrad
