Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CB747125D
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657939; cv=none; b=nfJ1jpvqDJ+Hh5FkosGiZhcsbSedYbEHFtE5g7PCPzTOYD/ZTqofuhsriQv3ipJrhmA3JLiSGzyeihpd3zeLcYlBZ7vVFUjSgoSDaERnf0uOUEdNdf/Ga7HWBat4NuL1JI2kIzWGFJ5l2EZyjoDFLIRtnJrH9MLsrxwkXzLDlOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657939; c=relaxed/simple;
	bh=CU5DqXpod4KJ7Wm4KtKE3f0aR5l8Q52YUf+L785YDhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6SVXNwEPAHCrg/Wk15mO0ntIvuTNb5ngs6kBVFJSmbG3nj/urvst0eZYJhxMxNJmYI5RAl5GiWb0f5M+bCke32beqY4vF5kK2cfQBnwv1sJQs0N3tD3YOV33lWK4oYLozvVModklaQ7iKK+om/4pENURhbP/thU6qU4u6vlX48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aa9dwQfD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4UWHYX5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aa9dwQfD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4UWHYX5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2r5d2418748
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4QBS1Lbjs3T8Bi8cwftIEYn+
	AAPcSxijVVdaZ7ikGUg=; b=Aa9dwQfDhcfc0r0EcjH1Xr3an1xQ+QC34uzc2ekz
	CmiTn907Igw+JrtVbV2NiDLgtFLn1Sev3arqXzpS158DGmPt8IgPbUxQid3E4vV0
	HegiAZFvCKlS6OxqPOZPGlvxs5yjxi5hnq2n6fltX/WEl+Pg8ljHPHBydu/e8yaD
	WLZ52/1TcJRcXCFgt1laSsBD+ddh7Ecx9Cs0qOjX55quWGqxyf2EeAgyZLMD5hyn
	Q+gVjv0JNxan8+FvnbIQhROHLuHbLNNLal7piX4huO5WGXuQFCFMialWog27h1S2
	9E1nWVhBOM0ARQUK16gyIUZzRzycqsHEjFXEnG/ig9kJww==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs9j5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:18:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1b4d961dso94799951cf.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784657937; x=1785262737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4QBS1Lbjs3T8Bi8cwftIEYn+AAPcSxijVVdaZ7ikGUg=;
        b=f4UWHYX58lJNUkKjBrSYXRY0jwDaCDA0R9pB/jS67uaDLoQAQ++7MUBq8WM4tfa+Md
         c1nOGnXtiqF391KwploKIVt0pCFBnH9X2vunwhL/+9fVB4ZiwCjPH8MBagrrdGzz+gC+
         u4SNtX5GIrZ9afQz3/4rQ9xCkc8hg0SW7RCu4/wi3cBfDYIMEuNo6fdhlYg7JJkQFZQH
         qioFyztuL9cXqBKw7oneIDrOq01tmC1BaZ5kGTpiE9ViAIdElhZWRBgoG7zMfLIQAppb
         Nynig84ZcvNYwzLu0kEDAzRcKjA6CK7u0vYWj06bquK8vaBBcm9KQCqHFK9nhFE4/WrW
         c2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784657937; x=1785262737;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4QBS1Lbjs3T8Bi8cwftIEYn+AAPcSxijVVdaZ7ikGUg=;
        b=nvlB8h1odrgTJYMCmclb0wOc2EFG5ArZHJVizNmF99BXdgOEYR8DOY21duU5vNIHry
         /wwwpuoTwTX+8GMwQ+TJICs8ub9Cf3ru24DGtD4rV3QPDfAuGsVli515uonfLbnpgMbk
         sadRspS3Zykj9p+GsQzOux+1YIq/cJ8jtVbkiuW8UxVbZuD/6Alu6dvvIXi1ZyQaxgjg
         BKfZFwXYWpxICyUlpeyDYCyHVdj7FN4K5xUDMA0EYZie+ju/ENefSYsE+++TNyYxt5Hy
         yLUbNAWVjIvcOCQfdymLQQTwIc4gTzpsIFleOvDNiDHmiFgHF9qiAuxmvsNzt+AZjY/Q
         p+ug==
X-Forwarded-Encrypted: i=1; AHgh+RrdJHUMtGvntFCjG5I3BjnCVNWX7K2DsvMV2f0ARmAajf6EKhOgJp9FLATjaLJ8nVm9o1efQPRK9QFc@vger.kernel.org
X-Gm-Message-State: AOJu0YxdhG4hyAXFsb78GyKFC9TEPevfcG8TXj6pGRL3ZFbpU+RNIQtt
	lrWleBbty1tHqRFwzpwpJp96PXZ8X0MN633KOaJQVJDyTJ9h1LkcTfpCoEJmpaBTflooWLd4ekm
	C+9sQ6aVbPCYnehQ+dAZYFbuEClTFgSjYRwUMUo5EOfERkRuXhTTETQTkWsS8Asms
X-Gm-Gg: AfdE7cnYGz6e7FX0CT2FA85wu2RTLebelnsRLZoGfI0X9xrD2XbGfZn7zptJkMjoKac
	+WDbRq9UHMPiHUseWq2Sk33eCSiFem8R1OGre/oyHyuh/DGvAvnACRaynFqyRJRHdYdGdSaBwZR
	lYX3r6+mb8drBT2CEAUd96nZEF09ivsEscjzjjc2wwi04V6ovQsgZy8oZ7o5JrHQA4syn5fUt4j
	UbhzAQDyuDdABrzCeFGAnUbCVaJcZ1xsevcg7oZCGBWo0pvuN6t5CZ9vI8FYqQeOBeWg71XjfvW
	tYDDxrfeb52LcoSYqtX1y+BQh2t4124M2ambRlFxMpzl8Ih20YV/XysW/VTqSWCM2SArBN4GAaz
	5CvND+nkc0zCqehr67S0+gIFIrROMJbrw2Jmq8jub502xMwPlK9xPZ7mdpXYAIbrqiveezRDsQS
	Ro5viS0Pz1YSjy0w==
X-Received: by 2002:a05:622a:1c05:b0:516:7a83:8c37 with SMTP id d75a77b69052e-527a640e6eemr9783101cf.11.1784657936559;
        Tue, 21 Jul 2026 11:18:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1c05:b0:516:7a83:8c37 with SMTP id d75a77b69052e-527a640e6eemr9782501cf.11.1784657935963;
        Tue, 21 Jul 2026 11:18:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b9ac81sm65135e87.21.2026.07.21.11.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:18:54 -0700 (PDT)
Date: Tue, 21 Jul 2026 21:18:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
Message-ID: <nqxbpcwxwastqutkfkaqz4o2telev3lixgrdlmb6anftpywjog@ibfxfb4e42xd>
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TWxmGUoJz-sO-lV4KF1iVnC7z2ZQ7Njo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MiBTYWx0ZWRfX0Ue3+mLI7qsT
 QOjas97Heq2Klj7xiexT5eelasMVP+Z7araP5TkhSEeQ/o9dw2rR5fxRwQZvxxeqAH9HRsu4CvB
 QWvMXJnFY05KM3gX2W8pORpsQLc82EDciwP2WC46D3ECV+3FOSAiY2+J+MHOD7QAI0fUOdsKTxW
 PwAuvb53QkfA3srgnLOgzr5wLaxEoggWyWZHnFnueUA4H89qTcoHiPJ4SR1yfquFDHK7mh6FRI3
 5UsNI7sJvSQ2sxNmFysTEjlXm585wpd0kaTz1KPOUxAkoNH6fAeyo/jTn4b2AemKmRxp1aJxvt1
 70RWVqn27bNzdN5z2UK4/rShhfwN0FeuqVZ5amRbbU2qtGQhiOlB8C4bnjHaM5pecNuknImOGKg
 7ltqNdCOfServNCYZTiIBHCkkj0rdznmw4/q3dayhIA9Eu8a0hi/RCzKgNYNuDg4FwtGGJdBYv2
 ckHu9+jrPbo3/88Jd6w==
X-Proofpoint-GUID: TWxmGUoJz-sO-lV4KF1iVnC7z2ZQ7Njo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MiBTYWx0ZWRfXypOdYTY6hLfw
 HrvUboss+7bYQ8vvokath5zkk/6DoeNhTcXOJF0QHCPHkJQH9nn2llPl3OyGeEu65CXXUUSlkJK
 ETlfx7w9hSDPPfpfgygSJu0+htBenNg=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5fb811 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=HlDJ1ZyWpHQnnzQbUF8A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210192

On Mon, Jul 20, 2026 at 04:43:53PM +0800, Yongxing Mou wrote:
> Kaanapali (SM8750) and Glymur use two display power domains.
> CORE_GDSC powers the main display hardware while INT2_GDSC
> powers a subset of SSPP blocks.

I see that INT2_GDSC is defined since SC8280XP / SM8450. Does it need to
be enabled on all those platforms?

> 
> Allow the MDSS bindings to describe both power domains and
> their corresponding power-domain-names values.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/mdss-common.yaml        |  3 ++-
>  .../devicetree/bindings/display/msm/qcom,glymur-mdss.yaml   | 13 ++++++++++++-
>  .../bindings/display/msm/qcom,kaanapali-mdss.yaml           | 13 ++++++++++++-
>  3 files changed, 26 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry
