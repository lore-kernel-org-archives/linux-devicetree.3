Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A8C314A9E
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 19:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775503652; cv=none; b=g6pKcSnhWeCI6pkG9FoISTln2xLLpZcEofgkwuneEGrWUzSx4/8TEMW6VartTafaBEQoNEF03c+JRdGop+Cj8KV0vcCzlU2kpUlPazZVtPIZcB65r2UxKNvWyiucvOQdXHlfGha1AutPjrVhHwHOgltD3cE7Cq0sLExd5Cc95Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775503652; c=relaxed/simple;
	bh=YpKg78k9g17RGqBonjvseVXzFGYAPpTjuho1F8e/Gk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvyudjE7kYuGCeDdFX73vQJezBUp2MDfsVq6pl+yrUgSuEjrcKeARMLhBHyRXplv4avXiif4TVs6ZsJ5NduPDi4Ib/Zvw7UpFYNsrgYiuOcfupa+GQfE/2loBK+dNIDN3ZY8tyBlXSEB13ffAhrCVAbcIbKOzi3f5O1ZtfTZ1KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkVsGjP1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aWXse0VE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkVsGjP1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aWXse0VE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636Ig1v23056286
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 19:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kcO/fqqHmUCgJe8Nz0+pajqD
	r+nZpWXwsojat+Hfj4M=; b=fkVsGjP1ftkIDKthDN0dugfv3K161RZ6w5PxRfUf
	DgueNu8Rofrt/pKjz9KSiAEDVq3yNPcY/TxpKdjeehhmfU68gj2Wxi7w9KUk9ZGg
	ywjEIF4QwBLo0FvLfsFWt8bUXWf+UNQDuiZjn1Gka21AcICTN3z7tS2aGW+Q7ssa
	bn9ObAfshCx4Onr1k1CSJSX7Ppko/eKtUwviMjFimhbphNoIC+np0kI4gOyqBRfx
	DOZBPaQmYdYGToHntKPGA98loY/rQmJi31xpOgJn+bwfM5rH/ZPc6BQpVBCN6PYy
	A0tWRpS3H0BkmbGr6jHSjpA6PoSaTq44u0aQ9HclDLzkLg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dce5js3hq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 19:27:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d5aa81907so15121721cf.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 12:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775503649; x=1776108449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kcO/fqqHmUCgJe8Nz0+pajqDr+nZpWXwsojat+Hfj4M=;
        b=aWXse0VEZsKVITCOfedGNT869fTApdgIjaS51PJVhwe+obWny/6RxjvPBEYL5WiFRS
         Gd1cgQI5VyYr8oL2h6XdT3B0gsGelnRZU+Ne+TpZECtdRLpo2lyA2yBz1igPm9ztRQwv
         l5oRBYk7DEqJ5jIXaNoojKDk26BXwjFMBhDQXtsyTGScAqepu98Z4L97NJRholxw9FSV
         oo+RdLjr5rrM3JeE6+87w0INItdIVnRg5gbs+CZNNMPqqJrcNeVBYzFxILugIKgTw3qC
         uJhKOulzUtXjLkmc5NuBpW6uit9oqh+5oPCdq9sDSmNawA9iB49QlrlHvbbgS5ocE2iw
         i/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775503649; x=1776108449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcO/fqqHmUCgJe8Nz0+pajqDr+nZpWXwsojat+Hfj4M=;
        b=MiN3KihZ2iEkO5JgJTSHS7WtwldJMGhwbocI3cUxnX5SiDEBpkKsLWdSPstur2n+zW
         KeTLyjUHdBT5TXiyYsWSm9+r1PTAgI4U+CeOzss/xf6DWg9OJgzqKfAg4oAehkFaG6BG
         I0CjPF881PnH8XvwNcOAcT90PVlMy7o0m8Tulqypw3T8vu4Pa36b1UFuuJrTmF5lAJBV
         9qRuJCLuYcvYfd6ISwM/4ZygNfGQAAUp9MwMMvTeb9dlI6NxJZhJuog3/JLcAd+3g6/K
         MD7Oj982H6sLOjtPhjcUXlKPRGpIGlxFPwEQWrCb2ekfzLbdS90A8LjjGHioeKJQ13bO
         YTPA==
X-Forwarded-Encrypted: i=1; AJvYcCWUdc2a4dht0QKZhOSEhkm7jeQDeWTSe0s0jvGjEjefGkKNZpHLqCL90xHvSseqsUCYWpZMXnFImAGD@vger.kernel.org
X-Gm-Message-State: AOJu0YwICgPFK+xelSN62DXpkcIj6mN/15YO+SEsTLPqiGxgrFw1+Vlz
	aPgAYc5xBPxeJpVH8N+UnJ9AaKX/5KiZ6/43HXR+qEK9Flk0zYJXCqMd2psV0pxyT0FnHyKPWMx
	AGS+xcQy8/dmx3+72zviTaP3kDC/S8yOJxWYTx0BqswicFXzp8FdptEmpcR5WlsTp
X-Gm-Gg: AeBDieuw8aGCIet7U8EfT7nELBvfSM3LY33OkgiDZWURdjAmkYartvR+4mBLDvUa43R
	Da3KmpEcBIDyoTTIy5zAxB8dBGezNlO6klx6iVsTxRiIJdSrNkNAsqua2/4mFvbvo7uGG7jIH+c
	PPT3cZZRU5s0464X/nuLvhqksoCP3uEmzr7U9LwH2oYDphWRaAmPExrmvcefOui9YhlAd8liAxo
	51HZrJqJyDBVOdeamhIVqugIuK+3Q8P8FMfNAv2wFTHWUShPl38G9KA7olILBeaVl6JkpddlCTl
	Um6PHWYKvD7UjZtZ6uDwvs9sXjgAQw0jZYLfz8Pz/zGFcIpOh2j3T4w64B53vb9GrDQGVguH/0B
	DfY0WLy3dNxQFsRD8e+mPxdAWW2j23iKoc928oK9lfw2cyefhSi15VXlqmFoAnAY0wlyrrD+Ghp
	NLS/1mOcUnnmpmpWBCC2TAYvSwC1GBZd1lguU=
X-Received: by 2002:ac8:7e91:0:b0:4ff:c08a:52c4 with SMTP id d75a77b69052e-50d62772eb2mr215609911cf.18.1775503649134;
        Mon, 06 Apr 2026 12:27:29 -0700 (PDT)
X-Received: by 2002:ac8:7e91:0:b0:4ff:c08a:52c4 with SMTP id d75a77b69052e-50d62772eb2mr215609621cf.18.1775503648625;
        Mon, 06 Apr 2026 12:27:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc6094sm3644119e87.47.2026.04.06.12.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 12:27:27 -0700 (PDT)
Date: Mon, 6 Apr 2026 22:27:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
Message-ID: <i5zcd6ovkxbfm533cq4c5jtnxdxdd4yfsa4vavsf4s34ydjboq@4snhfwpqxlmv>
References: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
 <20260406174613.3388987-2-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406174613.3388987-2-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=R9AO2NRX c=1 sm=1 tr=0 ts=69d40921 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=edOAiv4QBLOMXHKBau0A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: vCpdeSFu5Wu9-J8Xq7hnowCejZV1rN1Q
X-Proofpoint-GUID: vCpdeSFu5Wu9-J8Xq7hnowCejZV1rN1Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE5MSBTYWx0ZWRfXxP6DOaWnvwxw
 yf28jcfgOc1rqju4tWd1rD6hKCXwlfxOvqfDANv5xTB+NgULMRECB4JG/zkZiBqDUta1KwR3dkw
 BdFcSjFOmVT6DBPot8ArkZ6fMVwzus5AdqMM4PRxH7KoRHJhH7zua+yyl944OuoIAKaVVvf13Yb
 1IPwnvFdC84vVWNEQ9E0PEqDr7X/7u6uh3espOFmedmo2UYSOPQapshGw5iWgIwqizpdKmIkppl
 8lL1LFLzI+I3VrvUGh+bFT5ypWuFvP0TQRDff1G3pEVTRvrZjmRaeGBONmH3TR4HcRkbSzCQb37
 aeg2tueV2H9mUBP0hzLqChryXM7o6jWaPsGdTM8mmY77Na6by+4YRBDvhwMxsAMo68OsNPxb3Jz
 8I1cJFeGyRm9OK0+Rzu47VP+p/8vIVIwmsTu0nJzfCV7YHjw8eIj/DXMr7lcZ2eGVCPlDWRWj0Z
 FO0AG8hFE6h1MqFNnlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060191

On Mon, Apr 06, 2026 at 11:16:11PM +0530, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Add the base USB devicetree definitions for Kaanapali platform. The overall
> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> (rev. v8) and M31 eUSB2 PHY.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 154 ++++++++++++++++++++++++
>  1 file changed, 154 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
