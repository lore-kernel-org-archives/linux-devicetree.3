Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9F127707
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780578261; cv=none; b=t6cV2/JTLjaNyVmqOdYxRSazHGPraOP+FtrFgPwJJhECv9E2ogGSHLK65gDZY0Ums1Gkl+UdjCwDOhfeC7EXpVERA32ZyzykTwzGsF90sFisZr1eeClXTbVCd3lwERFZ0lmWVgMvBriQuvx44QONU6/yKCR3Eaf2BGuIx9rAd0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780578261; c=relaxed/simple;
	bh=0Qgo0CRLvNENj48KGFAn4sGKVbbqGjtUkT4DIcxEHz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/Z7/xCpD76bednatUPzfxWUNrQRlKl0mcudW+o+XXWXAOo4VySFm/VgkHcIvDvlEIl0Z3BpIajA+a9vSGqvQ/EEB7lgiJ5lc66hcZTyT09ak1skQdafDWfqPXltrvqOcTloNx6xRqdbBzXiQ8riDWsQNLuqpnqme0sLoW/B/ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LYGFz4HC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/T4X2SV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LYGFz4HC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/T4X2SV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548boAN313666
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 13:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kygRY4F7eJ1NPjqjo+XnXvVI
	c/zT6FpT96y6RC3eCRo=; b=LYGFz4HC6QJIf95dQ+rkttk6BETSr1NO4PX6j884
	i1GC+e+8AwfzwdeAFnf2A09YFRF5Bgzbwsf55VHhjnBa5/usR53MnALGKwOnRH9L
	1HvclKZU7w8ZrvhbG9z7m+8pwlX4iLH7dtBy3svAUX1e2tpKcZ6i6Fm5fNsyXBbT
	0XPdKKQ1p2KWuDbq3pCNfJhckX9oB2B1JUriTePpqGxX5x9sWAlCU+rLL2LOs++8
	IbWLSW5qiApcqzMWdAaaDaz3+P+OEHAtMIS0HO6E/zMarcZcPAa58BDMpV5yy8AQ
	z2GiLgjfgTA1D52q4ES+HSy34wcFSjKtSxJRkGKObv0sdQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy5v2g98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 13:04:19 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e6fd5f007eso1271924a34.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780578258; x=1781183058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kygRY4F7eJ1NPjqjo+XnXvVIc/zT6FpT96y6RC3eCRo=;
        b=O/T4X2SVA0s1WihEtOLIv2lcX0Xy3IkjCPX8aSpZ7aO2RSAbabTeAcGBCzU+Kts8Ws
         +6BcmmfiRZlyy10mpznyUMD9xXfWYVj8HJBnlo3aFmLNbt+DcH68fwBPgcnxv3yhZhLx
         x1W0TkVscfe1wkdjHaiXD7j2XWc96FEu11ijECB6fa+c0aBb8wBBa0B1v7xxfhqQ6ccA
         5GQRTCLuKHCPYgByU4ZC8phG9/7x/1lyJnMs8GKfuA/FQwpaZVSqN4JDNgPZxNS6tcl0
         BBmFnrn4Bq1sPamTe7jufqKdHBul2Va2wiidhibLuZY6j0HY7JAhJHu2XTaNICiNx1ZJ
         L2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780578258; x=1781183058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kygRY4F7eJ1NPjqjo+XnXvVIc/zT6FpT96y6RC3eCRo=;
        b=byVbqo/+te973zklNL0iKYAD1zdLDNSsMD4ZtTShfcCtdZqxhr9iyvpbSWyEz8Nwk8
         TtazoBZFShLZZYV7wANdovx9K/jHIy8EbPGKPELgmWTtRAM4Tj6bfq986mPkq3CTQ+W6
         19bBdob8g1V7wjegnrTih+ILNNQThl657MS7o3aZGMb2fGv5Vz+cBHl1vFK3lNMV+J/N
         K6x2oXzxt4wjsZXhmav7JQSbXRzW7JXLAnWKD39Y+Dcfjn7yk/SackEz/iO9U2FDBXNa
         e4RYqoLWHgFWS8AfBDPrd+If3Ti72r91jq4/BSBSE+r1Hmk1RYsH3+9hadWdGyV0riNW
         0yEA==
X-Forwarded-Encrypted: i=1; AFNElJ8CLzsKUUW62yo0J81YIlhyDVxfviwSxIPgs+1cLozslgg+wa50i9PyyPtFlNcytBll2Cm6MftCa1z/@vger.kernel.org
X-Gm-Message-State: AOJu0YxgSIARZlRxpoVRICZLU+oq4FgrHyYjhibn/7rQzZcU+YQsHWQM
	R3Oak9PP0pk6ntnMFcnsTFzaQzqMEq1hNIWsolfVygu1PC1X1iX3cJNHTKuourIIZ3VEKiJM1Uk
	fdJkOAJaHTgiJtjWML2xmMyhsz0zBM/nCbCXbTLpARks4Wy7BeSvk2Jt/KfQXNBbI
X-Gm-Gg: Acq92OEko17eoONWp2DdiL3igoTBlvdWFkW1bDeKkBXVvHMgS75AlsX6nkxN1Zn+rqK
	yQECTD87yDY3fFMQOH9RKd24yIlUKgvUAsgbTnKmFBu3RbVENkzEgXReRnkKq8Jc8UHFKX3NVBn
	nGzydxpyXQM/yTY/odZ2GsVAt7ebC5lK8lcISgf+1KTtV8UmypYuXH29S9G5v+A4uEhJxq0xBVa
	tGtZiY96oWtPjl1z0kvWzUZau71pL2GmX8Zxy7n4tjnB657JCr4K5yAS0yWKNc8jKg3uCZgubyp
	rYevVEND83JjVgKS81UW5MR+TGYiX+8YAHSqKMfuOiaR6cMz3sdYt21Fk+A747Zxz6ezFc4tRbs
	3I54y0Kb2gdse71zHmWV5acD20hFKCzGecKei9fiWKVJY3LPju0Lt/iDcf384Xn7ANzFz1OiG//
	tbPq6nyJM3VNtwuY+wgLXBe4nTpe/rolbUDyXeebB56qtPVQ==
X-Received: by 2002:a9d:5e0c:0:b0:7e6:441:cb4d with SMTP id 46e09a7af769-7e6f91ca449mr1449291a34.3.1780578257750;
        Thu, 04 Jun 2026 06:04:17 -0700 (PDT)
X-Received: by 2002:a9d:5e0c:0:b0:7e6:441:cb4d with SMTP id 46e09a7af769-7e6f91ca449mr1449240a34.3.1780578256962;
        Thu, 04 Jun 2026 06:04:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b907269sm1197378e87.34.2026.06.04.06.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:04:15 -0700 (PDT)
Date: Thu, 4 Jun 2026 16:04:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] soc: qcom: ubwc: Add Shikra UBWC config
Message-ID: <nkzfcmzslcc4e2kp5fv2i2grb22ncf6ewd5pn57wy5tdth4zrt@ddrquhu4ijcd>
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
 <20260604-shikra-display-v2-3-b3c1b2b67edc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-display-v2-3-b3c1b2b67edc@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyNyBTYWx0ZWRfX5yVklvCNcZX/
 LBn1mTAyyYQpS1fY9dWtOq33cDfw58EUDgUjOKVIRca7kOsnNyVpbgg+c9yzIwPFKJpkMhGYE3k
 dbIf0mwiej4NxVtr+hUx30owVAwamOdDK04a/yzvdTs2RYZC92lWaHXnjEdnA0bNnla/HvE5A+w
 ijP57MRmc+Z0fsyo+wdx2BOmH1Ar70PjJjD+vN9uWmIQT6K8A+RtOItQvVRZhr/DK4lGjQax9/K
 Og5CKLzBGtKB4Hgq7fTNzypH0FIegXS1ccwcePqX9a2tG7NamfyxhyQG1/Cq3V73iVBvxmUpiYv
 l9aPNpJ32TrWJ3pvNMjCYeMcNWLK8acmiVDQJBHvi8e0mRtOF1q4bLey2rqtsdQAIEkLcsGGQos
 dndeThcZ2wmR1ytTGZ/oQxO0EnPUi5au16HVbMN8b8VKABCu940ryOK/x04qh9IGwKC4Gpio4N0
 rt9bn7CFHFpC8ZJ9jrw==
X-Proofpoint-ORIG-GUID: mAtEYPAq3dQrjf19LavIrswdnkHig8hF
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a2177d3 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=2Uxw_1zm03w2ut2Jle0A:9 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: mAtEYPAq3dQrjf19LavIrswdnkHig8hF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040127

On Thu, Jun 04, 2026 at 06:00:49PM +0530, Nabige Aala wrote:
> Add UBWC configuration for the Shikra platform. Shikra shares the
> same hardware as QCM2290 (Agatti), so reuse qcm2290_data for the
> UBWC settings
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
