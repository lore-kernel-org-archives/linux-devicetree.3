Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A20F40910E
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327475; cv=none; b=cOs64GnXsZMZhs0ziqOhpPufB04m+3uZQYOAyKJreI+tg0f+Mv9dJh5icGeq9/7RA0g3JaxHo9OaMdpoK7HS1IbJ4/c7j29kbDZRMGMVjPNiZgxLPQqjuWoQgS0+9UXEb2boG6PB3hJRblrnXXc4Tg5se8DboLY030EmFdl4aSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327475; c=relaxed/simple;
	bh=oK0NQYPrvhisX4lCBFAC7QmI/WS2T6aMcGlWsYUvpP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPCoPifK03IMCNBBIyTJL0sbwhUlDNXNTELi0jsWoECDXgDfpYwSyrCEUDlmFddmZDub8onaOy+JBOL6MZLoN78mzWEZxQKetpfp3XmbwLrM0/7omDoKz1F+fQgqpobZSSR5H7C+HstOo1rFhEywRf7nWDhN+WpP60cnTpg7YMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBg5WWbV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=POYeu5HA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBg5WWbV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="POYeu5HA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66678GTt3976376
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 08:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z7ewoKopFZWDSHXaKQpbm185Ui8l9dwnR4N9LGUyBmM=; b=WBg5WWbVCp2776Y0
	GL5MhGPOmGbuGB1bYx85IqFwSE/YFbWe0cwzCSx1i3UCsmY/uYq7VE5bvpvbuy2S
	cog0YFdB57IQ+RCJd5CjP54/2i2MDUtgcHLzY12hTt4iWBp5e7t54UzUxGucerVZ
	/OxxEHL/x2bp3DLwZLsCk4+HjNqFxcz7IPRV+cTW/6XjwnGkHpGyyCK0gAEnBlN/
	mDVZaZXzu6DT57CTUO77jc6AfsPXKofcXNOrlfdPrqpRTduzHt+66mSlxaaa9Baf
	AzjJR72lfUpiZHX1GVfYSkEUAavCp9yE/QHVdWMzPC6naR2UTdk5ArV0wpOixKxc
	ee/SAQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7gcfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:44:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe75b7dbso9114621cf.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783327459; x=1783932259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7ewoKopFZWDSHXaKQpbm185Ui8l9dwnR4N9LGUyBmM=;
        b=POYeu5HA2DzzsAkbfxgZlQAZDxnA4FiwgDO3nqAMPv+/5AOzbhhWbcrDW4Ebw2H4Ix
         iRq+nv9Ci4PV15pdZhNrzjChGpxYkb4fDJWDQxUqP4dceP82gBGcu+5gwJmI6c5cQB+j
         iSRK4LhOebTW0CrNv5Q9PVf+ApaFV0cygILXRNkPwZZ8NMXk45bql2NJsX/up1eiJLaH
         EaBxiY42Rq+DZaiLio++tYOMNKTRhiQ5AQdHdhhJ0ruX8wJVk4Gyt1G3FagToaE6SlzJ
         8z3yWk1LLUSklwWgR3XGWtzJ+vSxJif4hp8Y5jfUHtHEgqYtag91MHjF3dTeGlIHKVy4
         dRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327459; x=1783932259;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7ewoKopFZWDSHXaKQpbm185Ui8l9dwnR4N9LGUyBmM=;
        b=qrzCrpmQrRt8+cntQPF6hJDL9D2c3/1wEVX1CGJY9Hw3HNab6mipNqHFKcBY/hC7RR
         UCyEhzLqSJD3wMz68kOIOWUWpBpDvEeQ0sFd/Uzzgco4+EKRBF6PFZW3fxL0yW4hrD/H
         J+WsWVXnlq7r7wCauKwoqpG2cl2DvSvs2rgUZod0DTKc+C6/Ji/S6eL6w12O/hakjD1T
         lAh9NAGtIS3KUv1ktQlRH7v8YV3f2AGwPk7VavmxdQQ4uh/neB0YEAOEzYOCxiM3cuvT
         tXvGLUVzz6fCAw+Zkt48Ax1OHcg/YWwtndUWO4+EkV7TgJIsucl//20fPcT4/8wXgorL
         wzzA==
X-Forwarded-Encrypted: i=1; AHgh+RriQB40ujgHXwcxW3hUKhsLrtJUcEEmLwOhcUyZvCn/qR616bJuigsMDfSPGdkC1aANnR+LZ8TBbUmP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Nh2xnElKH42XekuGg0F0f5Rn9KFjrODApI/ilkQcdtt2h6kg
	aSlOszqt3WYwxmyCxHmY9XEo4HWcW3VHAU48EV/YIjQebyfz5K63MzZWnbQ5tZB0AGU7kzjGqex
	dycr31Jq2nfRf22p0stifld3zIQarcQri8lWUT6peZSWkhbCKkTMJYzqCHFayj4YV
X-Gm-Gg: AfdE7ckJoo891nhcsQ4JPzlnvzqmGfeYE87YdM+ekrDalO28CSCCj6TDLH0zgyMbozn
	1Z0F83AObU5HHFPyGkOa9l9H4GMurK2qshB+kF+/j3bDj2HI+wgEpW82bRlXyuviCl+Peama6C1
	do1A+SylQqDwbxQHsr5dXfiFvvYmc0BsiQSRDlQaOMmy05mH2xipnJbWIeAsP2SzDrOJSAXloOt
	59FtpDIAbgELGBVJUh3NTirUqdZABmEM3eS27XE9+Ni0hZzTNkawoSM+uGZqg+8kbDS95SKPkFp
	Vqm9ugZv3tCUfARpQ7P1fezn6dx6ZqlVBM/SBIslJANPED0gX2CqpS+jMQy9+r5TxGRs4DeXry0
	hXOrqt7rPHHsiukUo5bMXIrIjEZ2MAPg4BNg=
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr84275761cf.10.1783327454085;
        Mon, 06 Jul 2026 01:44:14 -0700 (PDT)
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr84275551cf.10.1783327453661;
        Mon, 06 Jul 2026 01:44:13 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62fc72dsm702939866b.63.2026.07.06.01.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:44:12 -0700 (PDT)
Message-ID: <93b78299-866f-4a3c-9423-a990d9a7d4cd@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:44:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/13] drm/msm: initialize LPAC ring
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-10-01d50c3e0c99@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-10-01d50c3e0c99@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4NiBTYWx0ZWRfX+bTuS/6uLTBL
 fAJ3PXIA2G5Sds42PuqvjDt3dlCu+TlHqQgbgeEKLYCMAvJsPkv+ABuywxpT24co6eQIDFAgeMs
 Hct9oQuf1FkcKOi6k0E3/DWqABMKjgGdrYWdIrydwGs7bGnbTZghQAoGrYbCfCwd7InMXx9d8wF
 3cr3FixJnqTrt7d5AufvxfIzjTI0AoRjouKDNoezlJadHCSEq2/2Xq/8EJIx8T/PscPE6JXlHEp
 8fU1KDZWnWWmQLS+ZH8cupY64ufoq8zl7DhGKds7s4jQ1oqgytqkRlvnVFKmZ/cydbkFjYDbVRc
 OxQj1UsRhHlvhtNJYGGL2b6QNFYgqauditU/tdU6/W3CxQG9Lxfo4/R9T4+n7gvlGMoeq8865ve
 I620kqrLCZtv+FQvLqUW15sQJdHLbScd91h8OGiI/MBLccy1T/LwmdX7+asuQR+rZMF4I8sx69V
 4hqjWzVgj5LCDnuvWsA==
X-Proofpoint-ORIG-GUID: QoAPfJPSO8b2grK1PICdr0yZsgCFGYrh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4NiBTYWx0ZWRfX4KCOulFauDPh
 nAa/fBD15VbhpCtyzyR8O9XEQHFhaTgHRptqmxR8L9/RqQvWfYJkTwpaSSq2oFVeuyg5HnbYVRU
 Esw26X6x/ppB3ABaOPrOi08OeQwHJAo=
X-Proofpoint-GUID: QoAPfJPSO8b2grK1PICdr0yZsgCFGYrh
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4b6ae3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=NiyOziKYwqrvXK6gfTIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060086

On 7/5/26 9:13 PM, Anna Maniscalco wrote:
> Program all the register needed to start up LPAC and send initialization
> sequence.
> 
> Additionally, now that the LPAC ring is live, make the code aware of it.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---

I believe some/all of these writes need to be guarded by if (has_lpac),
as many GPUs lack these registers and there may be side effects on
others


[...]

>  		a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
> -						      sizeof(u32) * gpu->nr_rings,
> +						      sizeof(u32) * (gpu->nr_rings + !!gpu->lpac_rb),

Should we rename nr_rings to something like nr_XXX_rings
where XXX is some uarch-generic (i.e. not SQE because we also
support pre-a6xx) name for the main number cruncher?

Konrad
