Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A049547C11F
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093162; cv=none; b=FOE3VFz90adVtBMA/x8xbLd5qBGkCQ1LsI+dEVuTXyLgRaN5VPW2YlU+jRUGHrpknK0CHrZSwlGtUDn2XREIn1kFxKMiLO4IRqxe/NAThQoJ9gzmYPbDVWB5C5JnqMgbh27KAGjrKP1UL929EwYs/Hc514szRPzWph8Y04rdio0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093162; c=relaxed/simple;
	bh=rNkK8sT5wuOA9IxHlcykcIXbvdkf1C30+zMq1b3ID+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIsTUysFCrRwUBFnXzyNf/b3Jbf4k7nI1s0TXE52XfQOnseTz7NrOPlmW9SqkuKFXAMaxjP31ZjtZnuBZ1VN1QjfdjdEx4wvIKtZFaRIfWjj+5LiH16MTsR/oFSnioay7Hkrh04tlvgA2b2aXNEYoL0t4b2gLnSqDIRjPhAoxoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SO+dKuzx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbaP3CFb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SO+dKuzx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hbaP3CFb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEikMi3924100
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XLUNTUDXdFhA1icixcnyozcN
	bkzgegFZZBk2svM3Bo4=; b=SO+dKuzxyL60PkWEmSp1SRuJjcYLPKy961Eleun1
	v8MFU5dy/4leFkwqOwdVBxM4txv47LloJ+gFO0T/OPKLGk0Y/sF+tJJQxUXPI/8N
	YY1Z3Ulbi9+EOntmycFyQuyIBOGgEjh56+diT40ZpxirL0NZNTWcEZ3nO33CRIfb
	tFrUc2Pk+dcNvex5S4twUBf1ht0Qoup2CB8JKck5RyFo/s7dYKck+20O+QLLYmaq
	H/AkPC9BAXflidl/+N66NG+0/1xm3GT6ybCZUiSvOhnouSVEdtywAlo9mkXOOuUh
	hAelbW8bXPWWERfFfZ2RkvaBzGXVE0N+6OF+UyH4Nt0qJg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec0hgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:05:59 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9829a8b46a7so602292241.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790093159; x=1790697959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XLUNTUDXdFhA1icixcnyozcNbkzgegFZZBk2svM3Bo4=;
        b=hbaP3CFb503mm9Z3j60DJZCBOSRAIrngTvS34DjnQzoPInyplHUxaGuaUkW++N7Pla
         p5i2t/ND83PAP8IMw9mMa8UwalGVfCMN3Q/TYXZMtOcoV2TxN/4d8D3GIglunH1+1Xdu
         7BmSrQU+acggpjaMF/04f6XG2AXM4yQaD0sWXQvmNURkaGThgKDTl6gOfE1xUP7BFbGO
         ZeMxzbM3aKREOB25KQ3USzcD3J4+faF3vKJU1RROm9nBpBla1U5daNGCxN7SN3hx5PWT
         3AB1HoQUUGX1BJZUNekuE3yGjNeXLCIXAKsdVGD8JLVGC3807JZpKHiKqaxMbZedID2m
         wwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790093159; x=1790697959;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLUNTUDXdFhA1icixcnyozcNbkzgegFZZBk2svM3Bo4=;
        b=diuLgKNHEu2yY5ET7X7jn2qiczR4uVdeiLwCxdUswU8Q06mkceOTMaLTCYmg5xmpg7
         K3MQIEALubkpr87WEoClfV3UgCgQUxxsluoLZNpDRo4xfLdOQ3617kseAL1ZWuRRMKeL
         mmz0KFl6+Qt1kuZ6zfDTB6HBebeTB+4QG6zRPxprOri8+EXWItCzp/Wss4vewDgeuKdm
         KyVlLJzwEfkOTmTewNirn1FLu98+C0jtvaeebICtcKohkJrzWQ5quV6+hV8YQGQFmWaq
         xNGd3zXSkZIt7AVIE+3kond5aBnU7/63cybjoMvCJrOaKrIQuhCSCZOfVzCACwqGatUB
         7TIw==
X-Forwarded-Encrypted: i=1; AKwUvBzyj0kPRNRNPW5TPnUe8xb9xQ1D+NdQDqW33pr124f5UVari2cbH8++LcCah6NqK9jsVbxUP17IjQur@vger.kernel.org
X-Gm-Message-State: AFuF++kpdI5Vm1GlM8dUwMT8bspP1JW3XxB6t6RvuKYLyZY1a+WzwtAM
	EORriUe9xK1QayHWVma6DTP3+uSgLwD+sTWFM0FkgDFhTw5RWdwNgsnVTdbWzEPoBRjmpJ2ZIoW
	JFQOfdvX9h+J4QybNt6xQ+Pu3/hXEOjisfdEdDASADAdkp/v7BybnVXMWnFOB3dgq
X-Gm-Gg: AYBFou3y+f2julMywjJUfUmfqNWomIucI+PDIvjo2d/5p0uQrybJeoDbifHa5onKs7Y
	4UJgTBtqdkkgwKpxlEH6+m5uw1wmNbbZzZRtTGwqIzlIThM6/qxbA/T4Mxz8BQtJ4qE5N6gsuzN
	nHiPxWXZmqkUDy+6CUxviAAImUYrntnL2ZprNwg3OVK4z/2LLShrWYHhXSBXOPu2GBx82hv5d1M
	52i2aFMHmqYyaTZeFK4KYR0msVs5OOziYvOARu6ye6W48KGyJl/DSmKFgAYLg3ZS09a+A5bY5s0
	Nl3W4ZIAsNGHeWUzrYOC/8tlaMYEFPIx82QFDYAqO/RsxBcu8CQKvIM0oqTsty/t5qAQ16TFECF
	27jume0g2+8pyKNGzlu2HvcLzFKUyL+7+LbeK7rRHrc4Z6XOiQNM1sfMW7E4yKighB0jtIdq1rF
	UEvoz/qh9wNQQ4
X-Received: by 2002:a05:6122:1791:b0:5c9:c60a:e9ac with SMTP id 71dfb90a1353d-5c9c60af4a1mr7516314e0c.18.1790093158851;
        Tue, 22 Sep 2026 09:05:58 -0700 (PDT)
X-Received: by 2002:a05:6122:1791:b0:5c9:c60a:e9ac with SMTP id 71dfb90a1353d-5c9c60af4a1mr7516247e0c.18.1790093158307;
        Tue, 22 Sep 2026 09:05:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8552e40sm9743e87.9.2026.09.22.09.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:05:55 -0700 (PDT)
Date: Tue, 22 Sep 2026 19:05:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: shikra: Add MDSS display
 subsystem
Message-ID: <4adta4pixcnjza26rwjx6fxeolthe2apcyam66nxbstrkbanzp@jevuniiarck4>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
 <20260916-shikra-dt-changes-v4-1-d5d5c3ffe070@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-shikra-dt-changes-v4-1-d5d5c3ffe070@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzNSBTYWx0ZWRfX7reQz1bY7QLQ
 +L9uopfKok5OBSj4KMCWIpZkjtw3tYKSNQOD//POVJ9Wg+2oLy1+OEfHDTsFFt0q7zBaMZ2VxIj
 V/LYJBFZYawTQk0A1FrJnN/58IOf+MUvhubAMYZGuKG6z6F2QzElh+h+mTNxyOouF3e5ar0Zfr3
 xwg8wOsObA3oacO+3j9pXk6dTqBhrSaJVv9LykZKtW28x0MtRN1k+JljU9/XtyblSXYBYY2HCDI
 WKGQNj1z3i56FPmVgNqQT+dxPp9ucTGqO6yjQaCan83GZLi1wPOpZNTBJ2IOTH+oa9WzgRXt0zp
 6geQX1Zxz9sVRv3gH7waHcWdXFia1Jjurn03u8qieExklUjWygL9h1FEeZoev90Lwa2+7pc9OoS
 jGhLPm7e8pw6E7lG9G1qvUWr6ecTWx27QjMZrwgN43Ku+tRqls1QQWRqK9gWeCDFICAxGDkixfr
 KfORS7WtKutVpUEax2w==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab2a767 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=X3kk7DLqdN3b1gy5tGEA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: p-M8THx0d0uiCh_TicY6dEQIka1xcLyp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzNSBTYWx0ZWRfXzy7fjwtokcKC
 5PPbK8X8PY0zTysHKVrCGrhIuXhxhzdazxfVvPt/VPGFos9Fnkmg2u+6lfLgQY3bWr92yHupDVd
 h6cDs/zNeWjBeadCZtWQYg7dR2bwbtI=
X-Proofpoint-ORIG-GUID: p-M8THx0d0uiCh_TicY6dEQIka1xcLyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220235

On Wed, Sep 16, 2026 at 02:41:18PM +0530, Nabige Aala wrote:
> Add the SoC-level display subsystem nodes for Qualcomm Shikra:
> MDSS wrapper,DPU display controller, DSI host controller, and
> 14nm DSI PHY.
> 
> Qualcomm Shikra uses DPU 6.5 hardware (same as QCM2290). Platform-specific
> compatible strings are used as the primary match with QCM2290 fallbacks
> to reuse the existing driver support.
> 
> The dispcc clock inputs for the DSI byte and pixel PLLs are wired
> from mdss_dsi0_phy.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 206 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 204 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
