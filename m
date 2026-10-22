Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665290;
	b=fAjz9aFcwCbOT1w5k8yf40ILYtkcV9AYop7n6W6eYkXp0Fd47FTbxPaX+QYMPj680Pji
	 mxRNJmhY6X7rZedlzIhFK/akCdUF8ugMhknfGWNgbGzayUSCd5V+zxNLfZJ5JAKBgQyYb
	 1847rqdEY1eze7T9VzlTqzNd7JdTIBtKKty0Hpw+/pDC1yb7YmA5q9jMExbibeG0pjd8b
	 1r06a6lC/oK8cD2oRn8eDB3G+spWsVcBwacYWaJ/iGQPBenGym5EiF3PNFbz2Oxm4FXW2
	 pI60TyS2133k8eV6k27b6f45iQL4emKTBCjVRpyZZNSZPRvkPpCpbV+5/ceHulXrPSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665290;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xUL97CU/jgcRIW7BbMZRfUUfm2sRjdBbtEqx9vbcTFs=;
	b=UaAov1nZfWVbDav4QjJYNk/jtG1t5RSEl5ykoX9DGRCfAJmeo6jxiaYKEp79U4GjxM/6
	 Cs+HFisKvhB28bneRr7Aj5iKPOQLr8qPFC4p/TyBg9TWcHDD/xbA8ccbnN5cMVPpacHsl
	 l0v66/kCkCqncju8Cy75c3waiViqg2VgpFq4FDeeOP5IV/C4B00pltyH5p95zrc1iOZf3
	 XnfGL3YQWkDjZ3zbQsjjpFdiybEKUvD3CL45f/Mt8VQBxPrEoqeWqR9Uo7yMyd0XhSNyR
	 6jBkUEwj+3qGdr2nEw6Xoqm5EaqeOskVk+XXNHYDX8UwWNfiskUsV+jNkGFkpkcM/bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W90rFzBb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRM6CzOG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7546D60A2600
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7546D60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W90rFzBb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRM6CzOG
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA06i03427093
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xUL97CU/jgcRIW7BbMZRfUUf
	m2sRjdBbtEqx9vbcTFs=; b=W90rFzBb77CYwJoHUhSocLtUCZkGxMkQMwzCRdsj
	YTgZFmEuESmUhYNib+M2Fe5hWUssF2bN1u4YHPYh5/RgDYMb783yCC/dHvpPb6nd
	sd0WL5MW1iIEqqQTPl2v9783tWyLE0UGo01WQtgrY0ITKhLqnwDqDHcEroSpC7Ev
	iQ7kz8RVzoyYLbhyVo8eX6CwLk1IA/TKoFOug1lRaw7K6E3+Ut6JNmhw3d3C6wiZ
	Rw3noy/m0QZ83cJ4yFxsQZrghqEGXgfclWGmALBSEV1BZSkg0mQgCpYNAdjdQRtm
	CHXwcqQ/BAkZ3/97OUNNs/yQxM6QGZP2kc6nHxzjIDfNFw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq0reg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1e62510cso411317085a.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 03:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665288; x=1793270088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xUL97CU/jgcRIW7BbMZRfUUfm2sRjdBbtEqx9vbcTFs=;
        b=VRM6CzOGPDzN8mStW8JANjU8TeBRryMCuBBtOKaVmphBoM61nJcfkwFZ8XFZh+qtpm
         fjmGaBtjGdGd/hEzifuZ5xXzxzFGMLe9pGcIPA/tMpQOBYiyFBWPLz6TmRjDkqSIjnqQ
         Qvz6vGUN3dfnlu4VqVBXI0rKWr+vnHj6198KAQHeS0Wfp7S7X8RQpZbkZLT/zyLSz8Ih
         sc1UgPEKOrBuXPqBMTrGJI+EWHyM98pWaJK3VPeHE9UhtElmE8/WkQ6RG4ixs4jNE4ZQ
         FFhtKoWyi6gjB8V3zkUC/9w8ypkGz4FlqK0j5ohgO1wyBakCHOWFD12TvO4OSZmZgYLL
         ctTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665288; x=1793270088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUL97CU/jgcRIW7BbMZRfUUfm2sRjdBbtEqx9vbcTFs=;
        b=XI74iGb7R8PefT2sQjqrppfo+40qiXgnD0TILKa824s8rxFfHGWaH/BUOJOZFdMSZ2
         kzU+ymi/+wuiTbWskPZKQ4CViPdHK/VpDM2GTR/iWqZ2iocN1SAxCSzWCKT3KxWtS3aU
         7tZZA4IaEg8/Nw2Nim+c/2l3BfQsylHA/vX36Kw3JhV+D+NeuVXO9mH2p/ghS/QS0IRt
         J52KnSAdC7lQCh7RpJA8CTnUkVZ3OywubxdhI0JHXP4B71Ck9LMMP9ESH9euMWL8mSGC
         TfP1UQhFukWSdFm1HMA8lEwRUmLPi4fegd2BAJBHh3Doc+2UfaGr51PRJmXUxvGwchAe
         pW/A==
X-Forwarded-Encrypted: i=1; AKwUvBxIXraldGAyVtpGQ9dVsDPLznTRwtjgL1U2B0+12HLXNoxqQx3lgISgeXmccRTrbTHRjmyopAPyqpkD@vger.kernel.org
X-Gm-Message-State: AFq9FYJjlA7Rt6GACGP8lEpGG+DbYhP3cWkXWYvPzpzELQkPNm0OioUA
	a1EA1xBAI4DexLuKESwtMzR9AAUMcwNLGeZixfN+iAm5Gk3TaQkCeJbAYXzFy6xgHmN3JRx+5RE
	r7Dd9CxrJZ6EMN9n2bGg2rmAcTtex/PKtzzVJqFNFmwx9C3xIuuceW/H8LoaZ7aex
X-Gm-Gg: AYBFou3kMc80R410lygbtlH5ZlGYAcZFYDbXiE5qQJIGX/2TBRVSUlquf81SguybzXr
	hzfi7495O6mgyUwOln1AkRexMJLLflfDbyrII1YZSwpEQXnPZaxBydtgzmk8zOTJ/MwHnesJvTt
	cfWrTeiDB3RSf2OPDLY9UCgdfEy9jn8nlQrRVyT5ToOxuj4g4Ui3/EqaRsRED+wp+p22itYS5Mg
	NuJcL+eBZXtw0BRd1R20LYZ98x9R5K0jPvVGyTTK1HQls3Pr/U9MG2uOM6hMKeUaSSSBuS0q9aA
	KIvbpnGi357IHe5gz/6CVxaXb0mGsezWVSyRk6EWXR2AFLYVB4KMOFsVzwrl4a/E8XxiQCGMUj8
	ZNm3GrBwOfj1hwqAz4yBeNfwdUGRdFi8G1I1U82kYjbG5rdrw0PN4fwcrPut6/Pblatcgz8bPwc
	/zkKZsQWtcQ2VO
X-Received: by 2002:a05:620a:7014:b0:93c:c73b:39ed with SMTP id af79cd13be357-93f57f53ebdmr837298885a.39.1792665288528;
        Thu, 22 Oct 2026 03:34:48 -0700 (PDT)
X-Received: by 2002:a05:620a:7014:b0:93c:c73b:39ed with SMTP id af79cd13be357-93f57f53ebdmr837296085a.39.1792665288050;
        Thu, 22 Oct 2026 03:34:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa28347b8sm865280e87.9.2026.10.22.03.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:34:46 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:34:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sm8550-hdk: add DisplayPort audio
 playback support
Message-ID: <bwcdzlbrpc5jylbujixkl7vgnt7vqf6seohzeaeznunirqcokj@i5ocfl2odomd>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-2-8a189c71938c@linaro.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-2-8a189c71938c@linaro.org>
X-Proofpoint-GUID: yY6Xpe76F2snuDWQ8MxpLiaU3OHK2QkI
X-Proofpoint-ORIG-GUID: yY6Xpe76F2snuDWQ8MxpLiaU3OHK2QkI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX6Tt5O3Ob6cjt
 FToWz9OY8siO+jsGjfp+oYuxxzneANN4exgnGHLRCzknwS32enAXKi/7aV3P0US0xrBrzjAJcqZ
 wUrAQey0a6UJPpYj2Nls/Kzrprf+Tzs=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9e6c9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=hwhmpsCkSw5bT3se9GYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX7qSCycnxmDO0
 7mHAiYR4cZUQ3p6LA6cDBPATQi/+tFXFmnG5UdRn31KQGalza9TqJn6iRWVIZLmOE1MKeXwCyV6
 MYVcrpcdzMATbX7sZA8j4TVQq3nKReiJ2Ni/hOog/cc4XOAbOd0FUoZF7G9gI+pHZbLN61BsOL8
 QM5uJbUZ0WonzNBB3l29w0r6kXKXzoGnpGKzBIYayXnI5QLdabowma8noOCocpurAgTTDWdWPCJ
 g2cPfK+8JEaVlmJ6jUv9QYE0XT1v2BlU9Vhy6PcLy7r1LjSuDdw5cnje9UrmGdEUHuX31NAwa41
 IwnXtuV28VSFWBW2av47x1KGUyD1eXl491AGLe91bwHGUpqVuUFzi1lfdNYoKtTDvDfu6BjSzXi
 ZaAQtuvRhDVKFoLSqr8RyT60TZGm4GG9jrZuBChyEcGU98H5v/n6vcKSylSNbYjB1jUfjBaJ1cC
 zT8uFZ3q3NXKxpatUlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220042

On Thu, Oct 22, 2026 at 11:36:22AM +0200, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
