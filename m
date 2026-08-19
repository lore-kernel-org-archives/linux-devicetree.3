Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBE9470E8C
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787139998; cv=none; b=mMxidVIbJP96EZqkOv1LjQyCLH0RsT/hJ4j0TRkO1JRQcYV1UzOpqG2CDoFdaQ+iCCl63o7GWDwaJpRvw/X2XKlsoTl/P5vaEMCu/qrjf7hS9zN35NXhEaSY5wRNn3/CHxncTn7OFvieeV5SzVd/Ogd5nBthYYwYE1TqYxN2ytw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787139998; c=relaxed/simple;
	bh=MYsbDTf87OOeqbvae12TXtdLnG7sJF1sHZaIdOetIrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UB+Hmadvz0tJLy5u7jUZe02ORd3zowBZJTwkap/aUWH8MQ4fq3N21SJdsoiSE7ZydPLG0qDvHUn1vW4sezgHnl/ql89B8RHeZJyKa+r/JsoHDs1KSfFoLDMsMcgi8CjLwRf6g3gxD31xO0ukvya0RDyExMuEE36Ejuw1oLURIfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RKgaBRTq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jSlO9GE+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKgaBRTq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jSlO9GE+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA7d0L3661028
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 11:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3koSoptLG2t1C3ur/HWYmg6TZ1MEX2bwwz9D+ZrF+AY=; b=RKgaBRTqF1tXD1W2
	yOYZvnHR+2wzAyupCgFjvaXz5o1MpfGit0LXDmc+kgQuJ1SL8Coh/xBbpnJTFOKs
	DDIgc/TSWaBileL8imDF6ExX6/fHDQqVwmPKEj+uJx4swPgxnCjbG4AHajO1Bekj
	xwsW8usWTiqaQeARKQ2KhB0zefXGouaGUP8y8Oa8WgX2VvwET8kOPvq49I4+fbSy
	Ev9e46BUDXLF84L9MKGcioviIqFgbJLHmUjVHv/duk5fOvTcFN8Mnc1h6Cgfspb/
	9pAY5RjFjYNxs9Ixd81WT7By0bZJJw6w4NoZICrDlswcd2pl4PnjC6H+8v2MQZA2
	V6KC2A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkk2bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 11:46:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c9d953b71so1317831cf.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 04:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787139992; x=1787744792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3koSoptLG2t1C3ur/HWYmg6TZ1MEX2bwwz9D+ZrF+AY=;
        b=jSlO9GE+moYLxSyhJJct3+TCo/CNjjt9XVxW/ThyXMWMD0ZSnnyQraKLKj11EZgmzr
         M2kRrW2fyWPp3NyRlc+am7vyvyvv0DOO0Ex7CXHRDiAQX/oN+I1T6r4kIiKUWKrOnoTf
         /C2ZnX6SQwz37y51OqVOJ0zGCYwsYTZqOIL8uqK2tTJMbniEmY6x1KSWLvYc48lxF9Oy
         TmGGTj+/ZZJSeGjWlyMLXtYyLDL4XPKqOGbyI8WPMv8NuUk3FPods6HffxBP5L18JDap
         vprNa4i/Ce2Svvk92zPazlZOTWSFLhvUTXFf9KnPeqqOo4XlsayNLmNVSm9G18NLxjHr
         kljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787139992; x=1787744792;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3koSoptLG2t1C3ur/HWYmg6TZ1MEX2bwwz9D+ZrF+AY=;
        b=ivLrefbtTbpWa51XfXQ4gbqOC6kvftFcGNcVPgdxsUtiUcfJY+gqQpW9xAV+eepexq
         fi0dXWiuX3fgLmskgHDMcLWmUnEfEcDkP3fH0T/i2RAIaxOpBNd+6WOrn2ruC3v0wFmY
         Fh0ZLjbO7z2OKEC30a+KVvpQSY/pcKwULf1Sxsn6DpC1KMTp7LllJWbtVygqwTbxzLEe
         dhcE6JJoc/2ymiW9XVy38cqe27SAgx8kP4JGw4R+om7UZFG62wgJnt1BdFh8T6EJrGpv
         4w6u08MYJvV9AAqd8dWI/zxGb6+bLMgnlMoLz8WEEk70qC755HfYTflZXHGGNxLJednQ
         dA+g==
X-Forwarded-Encrypted: i=1; AHgh+Roh37k//vEWOWpTDYmPCDbxV/1NIsAJga5sIUBILqYU3FPBvG4o8kMWyMCgEom18LU9RuqiyxOIPzbg@vger.kernel.org
X-Gm-Message-State: AOJu0YyrLlM7bakg5EMjmIVJlUWifuCNMPUc5zZltthelsqz3PlqlBuQ
	+OYy0+nErb6sD4QIi/Wuav2npECFpqSXBRlM9iOUTdwNmnoxdNtJyFvoGByBp0lHWv4/Xtp7phP
	PCDsv6pz/Rx9Uln8IyrNZRf1C3RNEJC6hZINOG/WNbbOg66j9PgYz7gTsy+LXAlCc
X-Gm-Gg: AR+sD101NmrtMp7gBl5iL4/HkNYz9CGC6DyjecoWOLXtndWZYxuyPSsK45FnKKG0JWP
	Ym3tl3rV19unpDx1GCiUR6R5HM4ds31qAG4IvQq74X/leylrHfLBUiw/UNi6W/JRvSNcOAgSRbo
	WP6oWk+TY1QCxFtjLE67twQyoiRIHD0dEqcWSDEomi3HlIeNzSTYzNs+5xh8XDAXAG2zSsCmnLb
	opptmX1Yz+Hkt4vTtJ0J9ijHseN708Ahl9mCxLBBm9ytoue/1FrweyIgilgICWBPPlKheoQ165H
	DQJ2zYf+PAFseolFInA1LRzNXCooB5CU4HIsH9wvdUfODGhzT/e90luJzV35f+GsQOiH1ZtbxWs
	6SxfoA+/BJLm0wq5Qw/5nTdSG
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr26405111cf.3.1787139991929;
        Wed, 19 Aug 2026 04:46:31 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr26404831cf.3.1787139991498;
        Wed, 19 Aug 2026 04:46:31 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c78a484sm62015566b.26.2026.08.19.04.46.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 04:46:30 -0700 (PDT)
Message-ID: <40c85916-6694-4976-95be-6ce2a2f19732@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 13:46:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix missing SMMU stream IDs for
 ADSP
To: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
References: <20260811-adsp-smmu-fix-v1-1-a596d284c455@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811-adsp-smmu-fix-v1-1-a596d284c455@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NoPhtcdJ c=1 sm=1 tr=0 ts=6a859798 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=o6DoCgZa75HwP2qXs8IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 7eJ_Eq8kWQZds03gbTJq95pg_xBuKulZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA5MSBTYWx0ZWRfX7nLpi0pMt4+5
 43VxieIEHYSlXIryf188rd4S5r+NJC3bVc75o/HIUVvkzVSIxDupDtdtoWk3HKp7vC+q1EHZMKA
 qMgo6p5GMDapOIWJYi50du64HnxvfRE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA5MSBTYWx0ZWRfX1dauVtLW0OCP
 /OeW/PRtLHjF6KUN2GPssoj6mbe8EjMSFCnsycIBO4nyinZ/sBKohh07p5IqXwA5Paq6UQCYEFE
 Fok1aTyNLjQZz6f8cab8FZqDhn86Lxja+Y5hcPg0Y6OSLmern697k5DmArTt6JPSkNbMzNMeFen
 re8tpw1o3y3/WcBcq+h/oJQHr0w/XivHbot/vSgxDgrYYDxvFDiot1lDE8jkP0JrUqK8h5/B7dx
 vYM36Qv1pA5lUIgGtWWhkKWj6+wRFysvwG19oINLNDKHndT+B8AI7e7FEhN2O4W+yMdJIW5QrzY
 0iZbFLqDTVttt/q5dIX1DgYMY0QWWX39v3iTJr+IgrKGgS5+Kxrgr9Ng+q2yVNZNsbwEElKD9+t
 kjVfF/naaG6OIKvYzAn0FrQ5vqdshIhh2M1ZLdweN6tz0KUw4YhBQByBY2FFPJGjJPdhgu/Tgjh
 sW/UW9M5cJg4/ulXbxw==
X-Proofpoint-GUID: 7eJ_Eq8kWQZds03gbTJq95pg_xBuKulZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190091

On 8/11/26 6:44 PM, Iranna Mundaganur wrote:
> From: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
> 
> Add the missing SIDs for the LPASS eNPU masters to the ADSP
> iommus list. These masters are exercised during audio record
> use cases where Environmental Acoustic Intelligence (EAI)
> models run on the eNPUs.

Could you share a bit more details on how we can reproduce t his?

> Currently all transactions from these eNPU masters will result
> in global faults; fix them by adding the additional SIDs.
> 
> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
> Signed-off-by: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
> Co-developed-by: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
> Signed-off-by: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f04058d2e089..6b06e0acbcf0 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -4084,7 +4084,9 @@ remoteproc_adsp: remoteproc@6800000 {
>  			compatible = "qcom,glymur-adsp-pas", "qcom,sm8550-adsp-pas";
>  			reg = <0x0 0x06800000 0x0 0x10000>;
>  
> -			iommus = <&apps_smmu 0x1000 0x0>;
> +			iommus = <&apps_smmu 0x1000 0x0>,
> +				 <&apps_smmu 0x1040 0x20>,

The correct SID base is 0x1060 (although the mask makes them equivalent)

> +				 <&apps_smmu 0x1080 0x0>;

This will bind the eNPU streams together with the ADSP firmware stream
into a single iommu domain - is that your intent?

Konrad
