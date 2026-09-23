Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2CF48CD43
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165481; cv=none; b=G7nW/+s2EHX7DIJiqbUKNz6IOfLtuMZ8T9zWUh8cCcH9FHzkQSEWTJjLoL0i/7Dky76FNyhvot/8DX2Gy+BZPapL7O53RdGIpAeSVMmwANcDl69CfQSZsielhaLeuB8mK8VmtWXWGey0gBFEMSh2hlQuY8wcTKv0HOoNpTK11H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165481; c=relaxed/simple;
	bh=huFl7zPpoNDi3ZejUCdFgfxAsa+ZPgCrVcmlJh38yNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJp+fcsFC+3sD5BbQ1KojO9PZ++LiSiSgHQaa4e7hEHRlt+eI7B3D4DJcgbPBI/vEUZj6GbVfWiSzgNVm7eH1+yeC22K0F9ugas2qjK/ZekANq0k2o43ZUhqlGa8holEM6JM5u8yJ131Xp3WdzpWMpvD2p9ifkkdplhaBp7Rm6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SCOGI/Nf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TnQNvrtz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SCOGI/Nf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TnQNvrtz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbVZF099088
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8A0MKVbKWmnlKbzQw920PSpP
	eoOO0tpdgW2Ug9tAy0I=; b=SCOGI/NfAWRAzhh7yBTj8bqPb5Iyp90UuKn+E4DO
	6Fwcdm1hrjLMfKkZb9S5sRywkXQpkV5FzrE7gpGfK8U2FxZ5AGTn7FOcPQI+q1vZ
	3EOpN/KXOlzGso2YnsPnrk2cE2Oc6ptH7Ok3wcT8M0e2doxQ4niTbsAXP+gVkL0D
	L+6gueUd9RDWgJwOkLsL85fjblNDciYggzKkTLY76kiPoWTFgiVTXwRcDRJpYSDB
	csPZ5Nt8SCgXjVAn06+3O6eiydCq1+xgqLDBxfJ7uAOuv6+xUb4XdPOs95GeGADh
	ZIln7ZkzAW8FgFSFSySNrKi/aRbIg2L/38ZLMmGQWOM1QQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c493v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:11:16 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78fa7ff1a44so280679137.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790165476; x=1790770276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8A0MKVbKWmnlKbzQw920PSpPeoOO0tpdgW2Ug9tAy0I=;
        b=TnQNvrtzjDaIp+lZ7Y4/sPCbnqiL69QRShXcLefFpYQ49rnB/TxsSvABleVnfwagNl
         BzSW+2XfVcNzMVtfDYHvgQ8GCBEF0GTUyoy2plUzihuPy/yXFJzX9AM/J/aLDwamk4KX
         lf6QK+ygFITHGdXToGiO7eQzr4GlV6v8CtZ1iM+ApS8crvvXpMRnAmiX60WTz/PiZvL+
         o9o7SExbc/A+rSUA8Utd7CINWJpTdZJT74ntQM1E0i6oRGTgLYty8DaGAXZhkjl3dO3U
         ij8XlH79psRtMfMa4UQruKxVpX3K5Z3LsZTJrzCSzzRNuSLBNzuc1X8WjZ/VG9sWbQK/
         weKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165476; x=1790770276;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8A0MKVbKWmnlKbzQw920PSpPeoOO0tpdgW2Ug9tAy0I=;
        b=IPZ1Fbk+jvU+Wn3jg1+30Y/t/ogzo34ZxK8mWLWxzdqr05rDMQpTeJHhskghPWtr55
         kHTpAo7OrS/pjBxT2PaRrT84itNzDv0z5NroDfm1XBopdStesbdK302eENUsQeeoQV9w
         +CuYwlyuYMJDAH/W/GnL4c+pv+69TUEL4MjGCd0QGt4ZCSytV2akW85W03dFTOcp9Dej
         7GawdasbqdYxrnPzOiSqlBWr/sQ18F5Vy0wfznVo4mwkRtlYlmGvslKtePs4DRGH08z2
         uP1XQEG/EC3HrjWl+zlai4P3nftSP6jcePrNx4refyZxOHCWu0jBR2VS0eIMPVGF3rMY
         MHew==
X-Forwarded-Encrypted: i=1; AKwUvBw72A7BWY1LGNzC/Y2V66ntxk/UvIJM/6RyWoC35yDAf8rr+qfJlvxHqvhGejuPokcQ0mgcBK6JGU2C@vger.kernel.org
X-Gm-Message-State: AFuF++kEwoQ1KTBgtcGqg6XEzkJzizDJYq5rVVRIA69FsPp0QG4Wtnos
	uLbeSMx55OwZYYamK08JgIWEu4S18J2CC+i67OqA1wd7spN96/m2hp87vzbkC2VT45r1lj59F7Q
	QBhrKWEsXWKArwX+vKvJqA7xyU8sS2qO1LMJ+hbwo+WHG9SQA6RwU94Ht+tWHiqjJ
X-Gm-Gg: AYBFou1h1Awx/DVpibE0jIeVHPFgHRUZ0R7HTiHQ76vffhn1C31ExlOS/1TmwHMTNfa
	7i7sW1AgOii9/OIUIP09i6ky2aXxSNe9X23DBf4pZK+ItkvO4bgpzzx2ydswIqqb/ZIwZBT5dHq
	B/i9AuGmEaFF4JJtzOv8kQqeWbhoDqsu3N/U0AU2fBf3B6b2eDQrRddKR6kjZH07dWIXuMs8tZb
	DH7ZNpZnPMgoXK2L5ErFoiBNdyqiy4c9MiVBl1Mp8T+uiTJe2MSgsiJvKEHpcFvjONIN0VPiKdE
	U3ppFMEMowqItJNPrq6feSw5vVTTD/OuuMKg3ob0SM0GMEOWhsJA3u9OYgfsIs/YDDyBySTG59i
	FudeQoacPVwx5XxvK3+eWw/12jOae2VkWBSLQQ0CuaAHBtpwSMy47S/jSlr28yLmD5UJCeiR2zx
	b7ACSFF5LTl5NU
X-Received: by 2002:a05:6102:2c82:b0:7a7:198a:c2c6 with SMTP id ada2fe7eead31-7ac1ea99e8fmr1676846137.36.1790165475574;
        Wed, 23 Sep 2026 05:11:15 -0700 (PDT)
X-Received: by 2002:a05:6102:2c82:b0:7a7:198a:c2c6 with SMTP id ada2fe7eead31-7ac1ea99e8fmr1676817137.36.1790165475048;
        Wed, 23 Sep 2026 05:11:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8590237sm555422e87.69.2026.09.23.05.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:11:12 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:11:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/15] drm/msm/a6xx: Honor perfmode_bw threshold on A8x
Message-ID: <yfpkgdcf3c366giiec6p4bjoutwepvtkjf3yushbgzeqe4uygw@pnddu3mbsmlb>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
 <20260923-hawi-gpu-v1-1-0c3c79a1a470@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-hawi-gpu-v1-1-0c3c79a1a470@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX0D9lGSKrpgce
 IuzBGZSK0KRT0BCQndfCiRhKzCe77CiK+ZmY/P5KknSr5YM94r4RgmNmOrPcxjzuMeTnArEW8Bo
 8JA8hRIs7zySNOFH3LgTPjeirl6wZregBKRtbqG3JTmcKG3g4SggflXUMgA74H3OvHpdlnoFPrQ
 lL1o4bi/rqMqLXXL11G/91e6Rwg7twrYryvVpxi4KF4iA9uHbTGYpuOv0rSOxuhddN6JiyEsI+e
 eUMlpcZw9ik0iKDUArh5eXwOccUE8sj2xLVl1Chygsz+az1eWyS1DTBx01z7Y0PeBBPAI+HzRfS
 3quPAe6LlKv7p/UeizTyfqewWCHKzpJy0bxwAKLe7wkGE9S1syx3EKFWnd0CLgjGWQwhSkK4ND6
 dVUGZWXmQHcyaNlDzr+7Lsw0wLPh20vwbFs+gtCngTP7ZVIRSr6TjNUUzGXJ7V66j9AbTHwAz+0
 TS+Hi037X5KuajDRAXw==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab3c1e4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=YJv5aonfaXPMDC4gfg4A:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: q6hI7r7-kK0aCUwDvlmu_heiiBtb5qpz
X-Proofpoint-GUID: q6hI7r7-kK0aCUwDvlmu_heiiBtb5qpz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX2uvcV0s1HrcX
 9pGxA0lijd5fytAFmAizjVFB7c8gL1yjpgPTJRDbsx39U+RHHSzcc80xdmMGey4M0DdmhIXncZ4
 2R9DOb1R85AMfWmWk7o6oEEL5VHXJZQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230048

On Wed, Sep 23, 2026 at 03:55:41PM +0530, Akhil P Oommen wrote:
> Instead of voting ACV for all bw corners for A8x GPU, restrict it to BW
> votes above the perfmode_bw threshold, similar to the A7x GPUs.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 8 ++++++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 5 +++++
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
