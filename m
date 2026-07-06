Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08DE389111
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 21:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783373478; cv=none; b=VfpPHu2FUZ2deFx2kgQkSnqCiO6uqSpRlPraXrF3s99fzplIBO2wQCJz/zS+A4zL1GFuIQDNHJYSlFyMUm2dGGVsnKOHpzdQxsTn7CzNRE0fZin6jUy2VLG6e9QWhRgaLab31HetthdsPmu61H1z1DKqIlnXhn/Kx8iT7d9tO0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783373478; c=relaxed/simple;
	bh=xBky2n9+WJ4//uNEPF0wJ+LgSzOYLiJKpO4h7lh9jyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZ26wxjjoGbv+WDWnB/MoGnQlPp/zYQS+VzSajVXGmouBvLhdScoVmIqx7cwdqAlYgTuDr7dWmSvt9TojJe8Dr31vww2yI6WxrdVmdWx2bM5RCuosEqOdp8YOcB2c6+CFzzK9DIuf91k7JbiCXxYNQsBfkBGI3Nt6LWw0gPSwww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EM4BFVw1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aE2FbxZx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EM4BFVw1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aE2FbxZx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEI2E1639872
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 21:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fzc0UyfTLrZB1zWo/aKngVCr
	9fX2cKPgrJwdh7m6pAE=; b=EM4BFVw1U6C44bzQw34O8jRKusvwreqOly1nZt1U
	oUhDEvwvB84iMe50TpYtYotIRmv6LnsjGV0QrJlnDBBMdEGm8fJuwvUR2G7hXQDw
	sh5GgBKavN6YTF4EHHthKno/Sbckz2rDTTyEtWtmYfUfuudttKmfTfXp4H2BeP+3
	QlFwddHyHWpvXpQr6bE8Jp57G4SbtS40GCN3Qy5/04f1pSHm+4PkBsUmQAjwpwW5
	j/FTha4md5OulfNuShjkXnVoz+PBxXkxtV8Fy89xQAUilimimyGvgJp1W21383Cb
	q39IfzkWdNNWJRfy8bbOZqXLtMps+PbzZhm8Q0IYgKzADQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r2ww6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 21:31:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so32498491cf.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783373476; x=1783978276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fzc0UyfTLrZB1zWo/aKngVCr9fX2cKPgrJwdh7m6pAE=;
        b=aE2FbxZxsCtwIXElh6o1gfYO6knoMvuFMAug4e05BDyQ4PpLvpn+F/FySq7M1T9t/q
         VwAlmW+xVGiUePE/oo4uepnaNt+w1NiRWAjE48CQezYJvUVleJsnx0JhQWTyx1ZNj7NT
         RYRR5JP1WLtwTmZyoigSDrZmzlCh2HwPbYjB3ar9WIRcWHSx2eBb4z3X9eQmlpsWdR1p
         9TJkRKhinX/8aBZLI01NzZs0K/F/VIYML6SuKv97jg0odkrpTZj7wdlgdAHfEyBx44Av
         CXP1cVocw2+Sg/tJ8jN69/0F1HWH2YgWijKWXxssVQYe2qOeXPoKxHnk03J86LG5f17a
         Rrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783373476; x=1783978276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzc0UyfTLrZB1zWo/aKngVCr9fX2cKPgrJwdh7m6pAE=;
        b=KHLoyaWPgMz0kZvNBhfyfNz8Pwk5HyvSRzQY7+y3BFsN2+qMO+bmsP6gZ4EabX5Vji
         Tebdite0oMUjjvYnkF+nIoVZYyrZ3569gghtaAc7xcCVCzG8EsoN2WRoagfLM0+Aiv3v
         gND7JaE4pUzZkmXT+zWY8BxNI5GDaRpBFFiy9voBpz3Bf1E7csxWUMQBW/7kfgMgtDUt
         +ZQ1txpbuZSJXWDF1QM9rEHxbU05XGJ/OcyzOZhrenCM6lP1qAwRIxoBc1ZHd+ibuWLc
         tA/aJ5RvhdXhQqJWOdTFrhU4OeGWsZ7OxgEO5+f13NNLrZC6qkcRE+XLk2JigBg5O0V9
         86Kg==
X-Forwarded-Encrypted: i=1; AHgh+Rom7VxAkm8WU6oekmLPZXKqaboubN+ZEw15PXOqUb+x0bdfAihkjWSQ97f9iL8Ks0vRMIEUnqnGNcC9@vger.kernel.org
X-Gm-Message-State: AOJu0YyFBOdMKfaOQCVzxuv1rezl8GNhMX6EY5V1apG7+vxMdZ4+MDTU
	F+OTj1wiAFT4ad+iEd4mXxpLhYn45LT2ICVqbbl7DWFP5FYwVFugdFZqwUcWhLLr37h29AmvAOn
	pTTURcBUxnQZi0hKXjpriN6VnbeM8FQFGPSbuv53oA+pgfyBD3sUBTc3d/NmrUUHK
X-Gm-Gg: AfdE7cmrFQgMsSBYMBOQdwPryJsi1vQasV870SOOt4zxw5Dp0SVvk33al0OmdVVDBPv
	J3cplVG5RBuANgpLReAhKpIq3v+UBcKQ1PWlC8cKTJt9JdbLm8fI8jf5POUemk5lXaC0KRGbrXS
	2/hC+BPhjmhNFF2hX9HTxMbngip9fFqNR9R09XarlU5kdAQfmiJoARRDZItxUcc86h7YNrm124S
	xKZJ/vt4THsmsWVlSaQBVDRVZZAjXCwqDOvBUMv0M8ehhqxM5qmaxVQdjPRCcF+ObxE2V998E8o
	VeOR6lULganQ19XNGLgtv2rp5Umi/kE+GNhEginxlHsrU89AGKV4F/30KmJ9BagVXz6ONlnrRpu
	dMyzFvtUUX57GHyeKQpOwy5Q3QWGw+IOCigcfjmcGqvh1KU8XlfWTwFXUpHhU16bEJ3e+UTta8R
	pTakv23/Ii2/7hOpeiHXU0pymY
X-Received: by 2002:a05:622a:248:b0:517:8011:3a4b with SMTP id d75a77b69052e-51c747be066mr29060331cf.21.1783373475653;
        Mon, 06 Jul 2026 14:31:15 -0700 (PDT)
X-Received: by 2002:a05:622a:248:b0:517:8011:3a4b with SMTP id d75a77b69052e-51c747be066mr29059761cf.21.1783373475081;
        Mon, 06 Jul 2026 14:31:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb417sm3124713e87.50.2026.07.06.14.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:31:13 -0700 (PDT)
Date: Tue, 7 Jul 2026 00:31:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Qingqing Zhou <quic_qqzhou@quicinc.com>
Subject: Re: [PATCH v2 3/8] arm64: dts: qcom: kaanapali: add the GPU SMMU node
Message-ID: <u5jvkfixrm23gugwlnpwq3ov26gf2yqf3pjntcl3k5t5wormet@powdt4jkmqmo>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-3-6ac53de56314@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-kaana-gpu-dt-v2-3-6ac53de56314@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxNyBTYWx0ZWRfXz16EZ8pt86mz
 deWoJgbCbaf7oEACd/IPy69OOJx5ULJ3NrtveLVCSUt0CCEtYxv5RGxok2r2IDFzo1XzaUTHw0I
 liIKK0g/wmDlHN8anYASanKJEi/TtBd3TuMHp2i7B7RuaR2HgcHc1UBHJpjkJFuzzWPlQ6n/V4t
 KAtoyW249QqtlesHIa9DVcK1hTlsgt0MS0gLeO/aPa8kY6Qd6AuEhNu42AaFGz4w2NQcJxN0R+U
 e/gfnF6tpQ4OfFAmPjCkNFf+odiAKvrRrKTxyzxrLVPAtgH60x7Ltj2pjJI83yaLKJpB9vZl69o
 ReyQxfrM9z32he2hlndscFPqhdNLs/RUDBMgCT8SunoBfEGW2lUkSPLBVz9xlfzPc8up6ZQW8qP
 O0ok9KPLxTy6OEosPmR4kmBJ09RINqrNWQldGviOyhgvbH8nu5pf0eprG2wQGhg24LBFO2c5mhj
 JQ2JMIsGQBp+iewWVAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxNyBTYWx0ZWRfX4mqloMHdSu6k
 uEuyOxVnwHkgAfz9zBbcgbSCSs3tIDYqOfa5SEnqbINTNd2nUN5KVloyEd6OIqHKYILAUJrLMIO
 cRhoyAvrJgO1Fj2IiXX3agd1uoMI4BE=
X-Proofpoint-GUID: 9Cnlx8On37W2RD3BeueLmWznjVY1wyO-
X-Proofpoint-ORIG-GUID: 9Cnlx8On37W2RD3BeueLmWznjVY1wyO-
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c1ea4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=8h3n1EBGBd86Ebf8828A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060217

On Sun, Jul 05, 2026 at 01:30:07PM +0530, Akhil P Oommen wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> Add the Adreno GPU SMMU node for kaanapali platform.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 43 +++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
