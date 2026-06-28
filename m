Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D38372045
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782687191; cv=none; b=QhjE7Yjbj/vJ6YYL7E9lEz17cMX8nkdbY2exZ8tlrlwWlnRhHglnlufZePnjfvDebcFNjk10AOhiSW2RISoA/n51zyH2gWYfQyF2yuK1qPgpzaA/VmP44E3Phl6buAmRhan+CGjx0SUEmhDOf6DplGH3ofio3IR8CAyVfd87Mqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782687191; c=relaxed/simple;
	bh=HNBGEhE75qHKo9m4HubnNX79t3k9BMJ4QWwlRdp5z7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dldtq+F2lzJWgGX2S1IBIv5juh8b7BC5HWOInwI3rkikoNorYi13q1utZIEtyYc5EryYS6GgM+Pca+lB8Xj1a47TCKdFkcGbs/duxOmvBpU64KosT+Q4zeBEdmcDVS0gJu0K4hJj6t72QO9T4ZMtf9uHqyKLfwB2WrhJgSBCQjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pvl7WW3d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=La1KSvc+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pvl7WW3d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="La1KSvc+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SMCaKd981892
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=08I0qAKNeZ3YtOQJRXgtfOdK
	vyOV10uVclmPREP6adU=; b=Pvl7WW3dnynCredS2uHbctPhs2ZIcn/foX1a5uxN
	zcZHYX+eSKnoreYOzg6p2aFMO0S//CDSm32s8rFWce47yEUHLRJlb+hAsq9D93Kf
	+iNcyG+eJSdIkCnoINhR4J17Es4oWxM8grbCLY9tfO552TGnref0Zd2lUub7vdYP
	/8GQAH3IMA0TKPyW7Ks700CYqm5t9Dz0haO6q8w1eNm1W+vZMCV5PdU9h/UR5NKZ
	ukWrE9kBz4x9OoEDpulG2AjHkNm6NLwPi3xYMphAvhBW56U6PyDj2EXAb+9lfZrY
	0LFQDrk7FlUHB1sMDphSHYUg3lP/0DveF6UR97jSvzug7Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a3s3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:53:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92d1cae5740so104406885a.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 15:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782687187; x=1783291987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=08I0qAKNeZ3YtOQJRXgtfOdKvyOV10uVclmPREP6adU=;
        b=La1KSvc+jFy7p2tDVYRH+FfsnwjuEjHSbaYFWuQnXFnn/BHkEVftzAUQ7LtKocrh7A
         Ofb45FP7N/9jSzrBuWbhF4xr8vWhchbOgNP+YhVYvqXjwtJ8FWOP2yu5HdegIPjd9fDZ
         6mm7IKtLhiC0cT2gegvDQmo2zoscWnVuIBUdn7nfAeNf8UhmZeNydRihSp5zdq0pa3iB
         7RNhgAGLNeqxxv2a3tXPwkX1Um5T+W/4nr1JwqzH9Ggw3gB7IQYvLDkhi4iaVs1oiv66
         YcjQlfEQcLFwdQRZENahW3ckBldQ8H/1ULzK+WxSRqQYQH2av0YF3NQwLfvXXoxro5Ey
         rP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687187; x=1783291987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08I0qAKNeZ3YtOQJRXgtfOdKvyOV10uVclmPREP6adU=;
        b=hZvl/3rWkoVvBGzOeKY40l0QtW5p5MNFyFP5KfPwKLzSyipzKgrhh8/Dnp+V8RJ8P5
         lI8EtEKYfeEcPO5qyk4UB//B1FkvR5BiqO5fqGP5cMZsYfPure6eP9gKKD6OHcd8CXzY
         Obtxn3yJuIbQ4kTsS0iKzTDCc3EoBmhhMQEv2nlQc4Jzcli3/LQ9qyysL/lwwQaONWHr
         BywuT/lMLiXrYR1J7FUrlBy+zWXjqFVgYqZ0dWZot9Ao4s3i1bONLLNezIkGbW48ayCl
         e1FTp2hwQYwVNh9am9y/JG6cTMU5O3UZzNM1IW2I7uulUNPuwuAp20HgrRxsLX/JTeIP
         Lmew==
X-Forwarded-Encrypted: i=1; AFNElJ+vlVDjO+oI7wAMv21eSGqptvHoC6hDdgSZD6ariBNTyoZf6ldWlx012w5jQIjgSg0r3UA2Jf41kmT2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqsid7GoQooMFIYBuePX8LdLAxd1rQ2k9VOV7qSehBPXXip6xo
	cUDwjPeIL3l5P27crr064ZbxBtyYzd+ZI4E65uRAYcPcJ440peTF5TggZ+XygnftIRIVQlEW5SP
	pZuUm/YoLLMOj8yaBdSX840QFw2VdPhhY+VPcpv+kGcYRrwbNojH1QIhYvkYBiZpp
X-Gm-Gg: AfdE7cmM6OU/+wOTM4EohnTzZDLLXzZBzQEeomMdaAd2/qFGOm0yw3eOSpxnJOUcalh
	fmGs28BmjVjyif0fvlxAdmTG7bgHJcvihzmDa/TxrF0cPOCHuB1fI3y2BfSsFG74ka+fmx+ToVp
	9pNscPDEjHOyKAV633dr9BZTnQuNNBZEGBR6IL2zJ8EWgXVUcPRbnnz8LDOrBAjq+S7EACxEha2
	wDOkFe7mmJRaBUHOAhp4eZYuj6momjv/q7rkeG+Xs63ylo3no+VR46Sm5WhYwZnW1XdCNX/wASJ
	zILJqo9u6LMelvnc2qvrhiHk/UK8n8UxfPeXwbyci6IfsgcXQgQDkmXuDWiglaN1j1ceaKUU6qQ
	9a/a4oD6LN+XbUEzIf5G1Rj8do9+a1dQe+M3n+t9nrkaExZ/YF5ntYlxTQwnZ+1lqpBhbR6MqvH
	s9lnWo5b61B67RxbvcABRkEwix
X-Received: by 2002:a05:620a:8399:b0:926:e8e6:36b2 with SMTP id af79cd13be357-9293d5b1deamr2010753885a.32.1782687186687;
        Sun, 28 Jun 2026 15:53:06 -0700 (PDT)
X-Received: by 2002:a05:620a:8399:b0:926:e8e6:36b2 with SMTP id af79cd13be357-9293d5b1deamr2010751585a.32.1782687186041;
        Sun, 28 Jun 2026 15:53:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b18370fsm68823601fa.36.2026.06.28.15.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:53:03 -0700 (PDT)
Date: Mon, 29 Jun 2026 01:53:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>
Subject: Re: [PATCH v3 6/8] arm64: dts: qcom: shikra-cqm-evk: Enable A704 GPU
Message-ID: <ga2yyuoob5jcseb5xeeumbnlvsxdhmnrioymbd2bgskpuy5min@miczr3mmgyay>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-6-9b28a3b167e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-shikra-gpu-v3-6-9b28a3b167e1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDIwNyBTYWx0ZWRfXz1snKJ2mmAE/
 dFFhRh6cPPCVAmt4M0t92qc8hLhdjzE/LnMAgMWF+M+7tXc5br4hd0TxJBKj1ZsTp8WSXpEaKtQ
 qthjODNHO07dd5+CCsMKz10dRUUTfwrogNhuMB3MNCmSLZ/KPYQpHb44z35P14mLUlXd4ziT3rc
 LP7XHTdK2cSm5rgmItU15X8Z6A/TT03G7qAkOpQhTIunRPGAsh7WTn3vxh23YbsmTa1eDMYvnPo
 iExnqS4QEJ1zy2/5Lc6k5hE+adnnLJkD69vSQht8vGk/WUFitzElkWw0GA4vw5I7Dz0jMDmmTWR
 5yd8DqigoTe7O1MgBWqxHiNXm8iJ6goYt6ACuaeRS5zuEyCgWhhe1VwmUMvX6swZa2epYaxB9LI
 9PIm5gvLww9ID7P1/asQIiRZQnnqm33RAuQJHVlDzPS+4rYuWL7jKMgGXQIr3CBcc9W6As9FjBj
 zwyvSAIJX95wpGJOYUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDIwNyBTYWx0ZWRfXx2ArE94yYL4l
 s43TtqXrL9zJVNs/0z9DdB1+UgcD3ZckvS0fiZsDPJfADA3/7YCEDvgKFP1v9dAmfMNX0MrMMHc
 Fzb6SBBrVaNIUFYDfrpXXlboFSreo+Q=
X-Proofpoint-GUID: nk5pWuSyokNF1sAW2mzM7uPXd5JkxP9-
X-Proofpoint-ORIG-GUID: nk5pWuSyokNF1sAW2mzM7uPXd5JkxP9-
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a41a5d3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280207

On Sun, Jun 28, 2026 at 11:53:59PM +0530, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Enable the A704 GPU and configure its zap-shader firmware on the
> Shikra CQM EVK board.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
