Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900B318A6D4
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749482; cv=none; b=dweNf8cUuE0L3PPmt5nZ2FPapVmdbq4wcouLUYxkE0uY4B+D57OM8kfgxLKfdsjEE+K/RJET/EWZIzmhnuQSlqPJyooCWp+vrCzfAqunsxBfReWQfsP9qcJplwUX/JKadW0WhZXt9fT8VzNaARSFM3lNt9mg9ah/y1MTFc+8aCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749482; c=relaxed/simple;
	bh=B/QVNW8c9Yt+HEi6DqXYIndWDMwJZmax5BegMSf9VVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gyfeDkeOapS8p37X9c6WxLoRO5F4gnTOEd8VdAiKy2/sr/eDqK5vdJZ5o90xvH1NSXbeb+5zEP0hiG/EZKOE9yU2PB2RDTXse3mZQnqq6of9+ZDwWLozkW1XCG+cI0EzOA0GaMcfT+Jy3I3KAl+BAmJEoVVp2mminY4pbfMox78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5+EhYIC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PRjuWaCw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5+EhYIC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PRjuWaCw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCCGDX882045
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0C0iLaZ2vQND+BywaHWsCvdfSggpZz0Wz6j9aE4SHDE=; b=F5+EhYICABiU+9Ff
	NQX58fKSxGoQO+rAIB0Mjg/415Dqh4JVJ1XzCvYQ8HFCQNngp0vjZr0vkFmaE1bg
	HAq5yB4EbLfpI/8mXzPzvnTrSsFlrKXqs2kLqg5bSCvfjSJqcqerltVEVT3J/8l9
	M108TQ4JLyIQLG6h8Jj0nMhQUYZEEmE3SqIu8i7YSFynnqryuil5mn7f6xOniS/r
	X3fcRpCM15tVMbKhz+xJIemEuARlP1qvGIFg2Roam2VPX75ImfB7wc3Xk/3jRnOe
	MM2cx+52Z0uBR1hH3g6iRMWg3YYeTr3r5+vSw/TKk3afLe6P+80HQbXkR/5mkNEf
	0+n6Vg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r0k27y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:04:39 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-977c5e92ec6so11506241.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 06:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787749479; x=1788354279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0C0iLaZ2vQND+BywaHWsCvdfSggpZz0Wz6j9aE4SHDE=;
        b=PRjuWaCw699Z+MT5Q1C2FgYghUl4tVdkBkpGwyR78A58SEy3ObwY6GXThjZc4u5/jS
         yLMXCRGekex7eSOl530G49+uNeH0jWp6OxSSV57WOAmXlb42aVaYgsy0A4PjFLrlFv/1
         pufPhsGj04rC9ZYqQwQKfHbkCZLSg7QhQ9lEYvD/Fn8UUhGlVxemKDPtEQanuImnTu8/
         1GzKH18k3F5IieE1Mr2QfIfquiV7REz28z6i6nJQdAiRQUU3A4irg0g2+t3clvoEZrNy
         xfMaKPb1vgIBnaTqwdhpO9fnDDQrWWVovEyThLmrohfeRyRIsSXtBH4UWH45LH0L5phG
         uGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787749479; x=1788354279;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0C0iLaZ2vQND+BywaHWsCvdfSggpZz0Wz6j9aE4SHDE=;
        b=bFRKt58bmCDjy7QTByfVldtnmIp5HQQQsgGF0pfm86y77BrDZU0W9ilIorn9o+NpTM
         6IcjoiWkP6PSRepXt931TxrSFC8SXTLGvKwZDIUh4KUUUHsgzeRDPExGThqN61Z7RgR1
         bjjt4YDrouXhxh/9BII4oOAsyg8RH3XUjBfYbZeuXqIyYeRc43WVJNGFph12YmmFlXhh
         jlSu314apjTbjSR80CGpJfm/nnYkGIwPrL25zY1UbQemp6VSjPT7/PghD9jY5Qj7oGMs
         lD6pGUKqjWVwh/iTRZqPHUHLTqDXPv8rV5OqYRRre29cId81SlvhFtCMWWrSnzL8q97t
         nPag==
X-Forwarded-Encrypted: i=1; AHgh+Rru80JfQS+a35QYbdHGdWgdHXPiQUT9pXE41d+ssl6r4HPuHuDI0/HunDUX4hwc3JcEBbUHvgNqXkwP@vger.kernel.org
X-Gm-Message-State: AFuF++k/xNS412VmewXHODsXflaGG6ec4frwl5KiY1Ut4hjowE+OkJNL
	Y/7j62JXXMV12ty7bGgkGxgrgSV2I0ntK1283X9dNbARQ33X4dRir3A5dl35uP01VVUkgruis0E
	HkuVLzWPxbob4m/net/Sl6906Ux4zsY9F8uNx0zsR9x+UfxMtdoi3QvPCTaXeTJFm
X-Gm-Gg: AR+sD10vkR7kjN63YtwtVoir/I4Fyg2vQKAFIsoUf64I/LFBZC3ujFVhZ3fhoxCjwoM
	LOFW3XFcdD/4Un3jIEmo6ILMmy7/ZPoMJvSc+HnRzBgUKgsIvLYMm3G+aHMGt//ckANAKwfexph
	Mk6szvPmGJKrXCFKpqO3TYnd7E91mRB6Nb1hUyyVMGRNjMoArBPKO3HFgEMc6yaGJoim0NNPkDx
	iIrVL+aSUt7NWguN2lWZC9E5lPKBKSmUDFpM5U5zzNlplVXt0NP/IZCGVxrNW/J93JV7EBpcbUP
	i0MuadXq6kY4wUszwzNyFQ89sxTvmY/m6M6reGIdNSwm30AdBMFgiSuXaapX+fg3KSSvE8hGDBT
	VXFwntbG1LbH5muXlqE2ZnuSJ
X-Received: by 2002:a05:6122:2c2e:b0:5c1:24b6:a1e0 with SMTP id 71dfb90a1353d-5c66c6e06b4mr47947e0c.3.1787749478877;
        Wed, 26 Aug 2026 06:04:38 -0700 (PDT)
X-Received: by 2002:a05:6122:2c2e:b0:5c1:24b6:a1e0 with SMTP id 71dfb90a1353d-5c66c6e06b4mr47844e0c.3.1787749477474;
        Wed, 26 Aug 2026 06:04:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d671csm450856166b.3.2026.08.26.06.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 06:04:36 -0700 (PDT)
Message-ID: <6b2f4411-9c38-4b82-b605-6b9a047ab973@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:04:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] pmdomain: qcom: rpmhpd: Add NMXC power domain for
 Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>, Ulf Hansson
 <ulfh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
 <20260826102746.633076-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826102746.633076-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fPEJG5ae c=1 sm=1 tr=0 ts=6a8ee467 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=oFIQYVkMYUJ5M4t5nqgA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfX5glWz7YQV0Kt
 4JVD2hXMN+S32cuIwlgXoRQSU/IKb2fMp7iyE0x5HT48fVgktNvhF7Sq+zNofyonVfY8O3Nk6wv
 lDNdJqYlXnZT2wRYiS+zajyFGGUphbY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfX5vQDMOE+4xWY
 4irJkMgux1HYikP2qKH9s7iyD0+A8UhVVdZ2t/tPQkLC+/FzxF4IPFsWi6N1N3K+RsB2Z0NLhik
 /G1uPFUpIOUh6sRIS1wSVBQBVCld7fNxg9BX2ZFyIWsJBuLWarcmfeGG48SChPQb4Beb5U8BdKd
 M3RpO5yS/kiHrpu+bWO4AOAIly01x04VizPr5gnVOARrXOslyKwOwMFv0hmIe+cezqMtuQntDkC
 J6kcuT6vQgdjlOJAlubGnVwBqlfHBn8Rb4pZ31MgZ/EBiAtTeEfl+e16xi5pRKXZ+VUPQDnLPll
 EikPx1Md1lbZ+J3odHB76cSq2vRx57S/Vi9Inu6QVqNwuyM6r1fk3FwdUn9K31FLm7wOvL72AeE
 XJkzoX4kpNK045iL7PZGEC/5V8XIhQDWs432fqGW1EquWeJv8z3dAph4RoHbSk5Uw2PjcEHxweQ
 MT/a7tamH0P1PnLGbOg==
X-Proofpoint-ORIG-GUID: boch1LptNhta7cqcoivgGhY_bS3HsC-x
X-Proofpoint-GUID: boch1LptNhta7cqcoivgGhY_bS3HsC-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260108

On 8/26/26 12:27 PM, Shawn Guo wrote:
> From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> 
> Add the nmxc.lvl RPMh resource and register it in the Nord power domain
> table. Nord supplies the NSP memory rail from this dedicated resource
> rather than from the shared MX rail, so consumers need it exposed as its
> own power domain.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
> index 96e4bd2f5a14..717c44d1c39a 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -198,6 +198,11 @@ static struct rpmhpd mxc_ao = {
>  	.res_name = "mxc.lvl",
>  };
>  
> +static struct rpmhpd nmxc = {
> +	.pd = { .name = "nmxc", },
> +	.res_name = "nmxc.lvl",

The commandDB sources suggest this shouls be nspmxc.lvl instead..

Can you dump /sys/kernel/debug/cmd-db?

Konrad
