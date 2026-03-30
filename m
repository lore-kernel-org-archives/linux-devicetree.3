Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABC2377023
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 18:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896290; cv=none; b=fA8AQssQ//+XKVSmwuTSqHMldqVHh3dMOBKryQLG9Muu9tOqDVVegKziwJNt1TVPgR9OiuLsmAVnONRjxbqhFkH1KW8dZy9OXIzqpwlNp/F6zbC/htcUBrWYyPFZ4xSlOkKN54uHIsYGekFYtOESp1w8V+T6p15Dh2nm5cJOJSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896290; c=relaxed/simple;
	bh=gXLvk9dwABkJboVSApMGx/J/bEviA8VAdA2daXR4ogI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3noB/pZ4Gz5kk5eGSprdZ/4/pcPXkBe9oOJbCaBSsAvKfnxCnrHeZkEdcrFJ68SJbuRH1HU08R0V0wxMd5CD+0uUAZIXhfKByHQzs8daVwFI3Ltnv/X19t05+nYRrwjd58aRmb1K1rfE8rWFHGKjGc4gPHktAK+Kv/+T+MO0+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ksY/POPN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGba8TzC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ksY/POPN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGba8TzC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UFAk3s3539570
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 18:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U3BypvaiCzdl51LZPnxaZahf
	WScLov+LNP9bnfOVtuA=; b=ksY/POPNE/1HtSSApgA6Wqp2dVJZtz+Do/AeK7Fa
	NEedQBsGiSj667F1q2lo28YmuenIN74OjV8v2+g0vHsOK2331050pcSBZ2PrXR1x
	mMSkEthlO+7IzurTyYjPNywl/EG67aUUfrCTDZzqbSKdnsPMhbGJnyRpAWCXmf82
	TBEvtj3ox+/sLYozrTkimfpSB4krxO5f3diROLCGKm8rAv1awr3M4lAub7DgQYd/
	IwgJpvV25+RKEfvu3zbYLUggDVfvOJvRZOVbvTf+DB5oJAjG11JrH42P8gdYWPfN
	7PREuajkpCwEGVIpajTybd0JiUUn8GT14VbsNdaF4CErzQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q59t2d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 18:44:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2cbe7223so157429801cf.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774896287; x=1775501087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3BypvaiCzdl51LZPnxaZahfWScLov+LNP9bnfOVtuA=;
        b=XGba8TzC5PBPOZMs3Ux8RdpvgZ6xPz/JC5abxnGRMD47Bp1uDFHmmrghD/2+giw6QU
         Z3yoio06JwvVqRGdWYkwSsVYtjvGBKkYLD4pTjPtmvWdQz6zHIP8ALkhpNdmIQKHcNEm
         SUIHRLZnsTmk2+H1vjMMb42JSM76hVmil9/cUChh1GHUdnbqFExXrdX512v51XCqDwAN
         4+wcd+dT3HExjAScwZQkQndLcIT+lNhnfdIUpVnbsYWjq7iR+7FrgdpVftbHzdmoae5T
         7xlszuw6aCuoIPm1Jd14LiWygYNohJF+0ghsHTw8TpvNLtgK1qegZIsN1xyr4NyJiH/8
         tEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896287; x=1775501087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3BypvaiCzdl51LZPnxaZahfWScLov+LNP9bnfOVtuA=;
        b=E9795IZGKi8lugrlu48tXCHnxY3Mj/UWCNiChRAx3yqK1U2eZ4FDQgejifegNAGzxl
         GgWgBexBy6wupeWI2MlPKHVIsYu0h4O02gFcGV2Ct52P/lWgNAbFzWiiCsjAyZ4Yc3Fd
         UBzjjBlCSDRxigejh1c1VBuYYvDcsr5Swa9YLnE+7J4MvzZGP2G65mTJlpv1q7yiMmh0
         U1vb8/M1pwiH2BGWVxGqOUEYhRbJQXOMl728GawOKSmCPaZl77cU17G5b8fWI3OIO2HK
         j5abtN39C4c6tUhkQ8MeAc5tAqYsJLbLL77aPAS0qzBIpR9qnC0x7n9wREuqdqnJbx4r
         LM2A==
X-Forwarded-Encrypted: i=1; AJvYcCW4VAvWuC6p2dZ8048dNuBQmVJaJTg7fqvwRZSA6qz7S+NKcEbCc25hUapRP3ELRxTu8HcK7HgQj3bS@vger.kernel.org
X-Gm-Message-State: AOJu0YwTl4qFOJ5s4n1x2hjOgiOsPuwTYSsmZq3j54pbvgZJChTA2c9w
	p5uMUxb6b7tgyIzGGkRUcNtYZEjpYJI4etMh/H35iDsc+te1k6mGO0go876DRlHIW5RYvvGU1iW
	KrPMbmZLQqospgDoBfztFpHhwwtoP7hdqBfMhDBU1zRSus4STvOAokQ2xWpA+p+us
X-Gm-Gg: ATEYQzxBIHD6PEGJDHMZ9O2ZGD1fMnCVvVV4I8RQ9UR+Kzzmw0nPRjPCcBdDpb3sbeO
	91R5icldw43vwpzPzXTpGrP8TjEFHnPoYHH6RUxLkaDhWg1tCPHThS1bvfBm+uLWy4pBUP23wub
	XovFj1ZYkPzDfFZHEQ2/7G+tIzq8FVvvOsXKVcc+2Oo6E0+YXUg/d5wSozuhrsHU2ZK7/GKNe2D
	VxsC8ukqwI1aPZnjM6KZQfgQEeyQjFnV9ahe+wnu4bliBlqVe30Bo5DGfz3dxs1vXDfvnH0IkZD
	GvRickR1ui2928pK2g+uCoi5Zpg9ydQFclzGvXNjGRwrZXrz02NwqWY3vhDW1xLHRt2GM6jZfZW
	DjdDl8taMSoVnl4Itmf3eGp9nrbncGsZZwv6SPfXk9+LUC8EuvcH/20TgLsSLbZt4YxRiHAL+mb
	7pBNbVC4yGSZOHIYgm110nQ7jpMOvLEX0OYUM=
X-Received: by 2002:ac8:6f0c:0:b0:50b:2096:4950 with SMTP id d75a77b69052e-50ba3901112mr190709221cf.44.1774896287387;
        Mon, 30 Mar 2026 11:44:47 -0700 (PDT)
X-Received: by 2002:ac8:6f0c:0:b0:50b:2096:4950 with SMTP id d75a77b69052e-50ba3901112mr190708831cf.44.1774896286906;
        Mon, 30 Mar 2026 11:44:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f4373sm1904509e87.6.2026.03.30.11.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:44:45 -0700 (PDT)
Date: Mon, 30 Mar 2026 21:44:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: sdm670: add thermal zones and
 thermal devices
Message-ID: <eid35hd36p6xnwgztvgdemyc4yzdnk6vdeu6mtd22ap3e4wg7k@l3r35axludhy>
References: <20260330165237.101045-1-mailingradian@gmail.com>
 <20260330165237.101045-3-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330165237.101045-3-mailingradian@gmail.com>
X-Proofpoint-ORIG-GUID: 7odPDjuteovC-XYWzKz9gMHNmgfpU7eO
X-Proofpoint-GUID: 7odPDjuteovC-XYWzKz9gMHNmgfpU7eO
X-Authority-Analysis: v=2.4 cv=EcXFgfmC c=1 sm=1 tr=0 ts=69cac4a0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=M8YKDcNaA03c_0jmb2cA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1NSBTYWx0ZWRfX0CxDdgsCiOne
 lEL/OSRp1AwieoRQd16CTMeIz64y7EAvvRlP/0H7pYKwC+FxLB1k2ApoPM2Bn6MnBMJdNbH8uoV
 7/LOvrUo0aZ2PQPCwMhNza6D4T2HmoGjpMbIatSR6lca0gj0Cme5N6CrVnxnGqj+TXYLHqWAvu/
 KdOIe3dLK0bTswRXkWumDu8gSML2CWwTJEvDUfR1GrvxbxoxSJ//X1vXzcQ75gVUvxj275Nvn93
 AeZK2MM45anPRf8cr331iTFXMM/YOHyRRU6KS26KyaRCnHd26Mq2m363zz9JaZ+YaJ5K/k+Ei9w
 3P/gFZPvjsM2frpkciyEjrM9enitdgKAmblR4ackCvDWTCAB7qV7TAeIwcZKNx8Jm8OJ8Qj0mBV
 7p/XAc8B9AAdp91JyDZQOo+pGGwsrmXvE14z2svnthFmcgxsN5GjypdMQH4SQ1N6OmKiRxFe22o
 1f0mSov1Gm0dgRW9eVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300155

On Mon, Mar 30, 2026 at 12:52:37PM -0400, Richard Acayan wrote:
> Add thermal zones to safeguard from overheating to high temperatures,
> along with the thermal sensors (TSENS) and CPU frequency limits (LMh).
> The temperatures are very high, but should still be safeguard for
> devices that do not specify their own thermal zones.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 400 +++++++++++++++++++++++++++
>  1 file changed, 400 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
