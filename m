Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365745;
	b=tB6ljstiQcVQ26gXUI+eNw0DybdoReQ2YIioxqf2ZUj6oHe5AF3LegPm+irPFjZejn4I
	 CwDNVZexJTSpgk4dE83i0u7cOrODBVhByPJgZZrKzX8IwjkT3S10FEJ6+ujPQ/oP7CMpX
	 IFy5cvivNaEOt67M/EOw73eYQDiwhUH2wHe+I06JNJwR+blCWzf/mETmKi1DI/XBokK+N
	 rNYEQt7ctauskZZ/vA5Ib4xJj3j88mY7Op808jB1nralGyH00sZTv5umKdjfZiaNJVUqF
	 bfPz9d5LsT1DkaWB8uz7a4EowrkJNM5kPF0gYHkDng/p05FGwvW7CgGUK+HnveVvWsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365745;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y4P301YqaFnb7KKDE2QgQixMk0k7HBc05iLOcpHCCho=;
	b=HUnsybS9qf0qbDR79B5VG6DSw1zlhRPwR9OKuWxPHDFwQIyjETDJ1DsSbnqFjLV2lJd9
	 UP/9iHupOun6+YV/o+n0hce3NHs7BAhdROvvdmATe5Fj3ZB13vss7fIU2XUccdfrFFCo+
	 XRQz4ylhdeThegyC7sLGm4e2uKbfM+yv9V0+rrmPKBBSIkRJQpOds13WCyDXK11OXqijW
	 WnkKWJcQUNV75gw3q8nuBB21UGElBf7BEfS0LiS8VVqC8JRmZbf3rtvOUnV1L0BeRblWd
	 s7FtWIH11dpF9hFQnnmXxGOn8iK6tTNAqhTGvMO59eK4lVaRZmdLpAJFdTyDdkm1Byg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jofX2PlH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CGG4eFhg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78569606A31C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 13:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78569606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jofX2PlH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CGG4eFhg
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG1el2071574
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 13:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4P301YqaFnb7KKDE2QgQixMk0k7HBc05iLOcpHCCho=; b=jofX2PlH9sK44rY1
	hTJwH/V8S1h2Ehj/NWXUdY64MVX3m+B7He4PrRq6Yb9Iekg2dQxrn0HvtZI28zJ9
	RRcY15pL9JIX/ZRIW1lSCPl2zi8c+svbt1KdqyBn7OuE618BEsyNZA/awYfXJfHZ
	x394lXmUJwAi5oWW7Y3mnrQb4mhpf5ALmAZkfuOBe1PS6soxP30XEchqhEVQXb8S
	6wfxhs5I3ebouclMOJoynZoJ8Lm7FMseFxIg3Aa7qkHnSU7I8HOiGB0jkDZ1sMbu
	mKCDKfioiruMwPg2jwuK8B5KLaUXuIWmy2seuAdgtrA912gg7ClcJYCBdXlsoH4r
	r9G6wA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p36gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 13:09:03 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9833e1390beso16883241.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793365743; x=1793970543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4P301YqaFnb7KKDE2QgQixMk0k7HBc05iLOcpHCCho=;
        b=CGG4eFhgjFpoCVhXhzoK7DzZqrspLx156azgmt8v84zkPP8XRAjOHqYpMQV6a/yZlW
         ZqCtlIg39cs7+vE6cD0Bimac8XPWBBwyfI/jsiK10gEDqjiiDe0yaahdMTZLj2BLsFwu
         czhBf3ftOZ4awB9FjiAEfZl/FAmGPBVN3vnosXqlbnGcrvK8mPD0zyfC5zBBATsqZ5ME
         QBbAF7BX1tXWg+qhLASO2jaOYB1mMlp2oTZlvyY2YddfFzl8CrX/SyiiE8ET9CXhGTTz
         CyOkKd1cDy5dt4k12lA/MLBh06tvJ87ZY9su2WJf7D1zEaNzDBTvLBKhxUYqpHUxc8GD
         qDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365743; x=1793970543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4P301YqaFnb7KKDE2QgQixMk0k7HBc05iLOcpHCCho=;
        b=gdTX1yu1NgZaKZKgV0QJ5J1sDguaWB3Z0i2/EOJ1kROaRVKf2yFrHHB0/p/2vZsiN+
         k4goNUhYekL5nJ/ZC/pvi2x2eGLo2v0SD2oYDnHJO8VLhaJfhTVRZhAJpuOalgqy8NMe
         RNBBI0eF0t6l35sKhsj2KsSys4Z//xHqgSV+Wk8bJopE+TNryuLYmjIT8CrD6HTDRHRb
         LQyRvLIdyWvDtry3ozniO3wcQdF3oGCH3PUJANs0ZyFz2KZ0fZCMrcdOylh5hy08juFz
         gDsjb/S9bqC8NI2AAdCq3iXjpam9H77yeWCzpbrP6psEgbj9TcPqG15+Rdf+4G3s19dh
         5eiw==
X-Forwarded-Encrypted: i=1; AKwUvBwcoBlXuIzbvvTBTI3WiRtIc8KR1PMpjh5X7gkDundyipfXlyKKWdVXBH5RKiMbvctdeJCy/QWqAZOt@vger.kernel.org
X-Gm-Message-State: AFq9FYI0svKXpaj/eTa7OlioPbtj4J4NeNNjmmjq9RwvehkFNA29NtFr
	Mj+1xTXcoRtLYG1BxieA7sX+B1ZzU7pdiUcG/jzcf7f5wVt8lzvZW83OVGgIDjXrwU5tZmd8Hum
	4BhkoT1qszMs4pjYPprXqwCFRCgEw2KPqFYr1o6GOAoecj69P4blbZT6buzpiHdg7
X-Gm-Gg: AYBFou0Dca9yyIXQ65k9ed7JbcFxZ+/OW+QcnGxw9cosceyVFjMROsuhh4i8gkcZQB0
	OkEr+RSLPEBm6BCqNfZI6BNCPnBvnM+HtsZjVFpbTapkUWowyqLSdFNsqGuF1p7UW0F3THiV6Mw
	6hc4PpuLowFX++xdLkY1pA1LHkILf9y3sbnLuT2OjG6ny1ze7njVK2z+lMqQ/0lqsS5NFXsFSW2
	ajMJaL6u2CjooAmk6AaZ3QV3XBAYI8fU3XgCQOigAq66GX4lAlR4KftuFFIWZomDNj2n2A03vpA
	cdxGZGeLXbiLbQEJC+2avW3OV3hEu1KVTXkiFbYyCvhDK/tPErtt7PVnrYEEzdcFK77Bq51NmQX
	vRyJYYw7sljLu3JqDwtokGaP+S+QT/7xwsq+Ut6nsnU89jPAVWT+mwziCkPkm8aKkALH6xKY=
X-Received: by 2002:a05:6102:868f:20b0:7b4:f1cd:80dd with SMTP id ada2fe7eead31-7d0727a54dbmr802583137.1.1793365742033;
        Fri, 30 Oct 2026 06:09:02 -0700 (PDT)
X-Received: by 2002:a05:6102:868f:20b0:7b4:f1cd:80dd with SMTP id ada2fe7eead31-7d0727a54dbmr802519137.1.1793365741491;
        Fri, 30 Oct 2026 06:09:01 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7b01b5esm605327a12.20.2026.10.30.06.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:08:59 -0700 (PDT)
Message-ID: <3f11cf8c-db2a-4243-b1f6-7f2cb9a7a87e@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:08:55 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 05/14] firmware: qcom: scm: Configure LPAC aperture
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
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
 <20261029-descriptive-name-lpac-upstream-v2-5-a21a5c850961@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-5-a21a5c850961@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MiBTYWx0ZWRfXxeVTJQR6/TDF
 FHpoLbvoBiACsG79zfHszzduzhwjG4Sdb0oyESf1Q8tU9ynoZ+IM6wAf9HGUToFXppBtXhVlBlB
 yitiAE57avJDWQvqsj/VI54z0NpwZzUZwh2PnVOIhHGlcLHMzn0tcl32MM6Uq8wzfRsCYsR0zvY
 E4nAFMi0n25WXi93A77d4EUAeW1nFiAkcyM3ZnYx6J6gm0MuHF+/vvVFw06D3oL+4sG2Ok1SvkR
 RoEo9m8xSqVV3+OVbULw2UfgBCscOd4W/KiCOg+JdMm21PcZsSv6gLddC9LTUR8peu6YmdLKaSr
 dSwlbPIQX10TA5IqCxqjeUF38pA1z+mTF2w50Yg9JrEL+++muTBYFz6Xl2tftrZcm9/p0FjH/fV
 pzUb9vg0TBvTOoJoy807QcZu7DduhW8Djz/f2wxChHqkiM7aP2d03G9mluhQmscBC5uIy45fqeZ
 Dj5LjwtvDprArUVWrSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MiBTYWx0ZWRfXzp7EeEOoD3dC
 l0KtksWgk6CNnF1if+M+8c5dSL1Q4DgFKIFPII4XGsMlcYYHwSuvHqbC/U8ruH5GLtyk76Lyttb
 3ZEOZTJjzB29ukHM5sw86ViZgRhTNzc=
X-Proofpoint-ORIG-GUID: F7TpOu1o648QqchB5jSCQ63gW5CXS__O
X-Proofpoint-GUID: F7TpOu1o648QqchB5jSCQ63gW5CXS__O
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae496ef cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=HiRCik2jR1DMqHai1FgA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300052

On 10/29/26 2:52 PM, Anna Maniscalco wrote:
> In order to be able to update the SMMU registers from CP for page table
> updates we need to configure the LPAC aperture to include the context
> bank that will be associated with SID 1.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c        | 18 ++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>  include/linux/firmware/qcom/qcom_scm.h  |  1 +
>  4 files changed, 26 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 9b06a69d3a6d..92093399f20d 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1204,6 +1204,7 @@ int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare)
>  EXPORT_SYMBOL_GPL(qcom_scm_restore_sec_cfg);
>  
>  #define QCOM_SCM_CP_APERTURE_CONTEXT_MASK	GENMASK(7, 0)
> +#define QCOM_SCM_LPAC_APERTURE_CONTEXT_MASK	GENMASK(7, 1)
>  
>  bool qcom_scm_set_gpu_smmu_aperture_is_available(void)
>  {
> @@ -1229,6 +1230,23 @@ int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank)
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_aperture);
>  
> +int qcom_scm_set_gpu_smmu_lpac_aperture(unsigned int context_bank)
> +{

Please make qcom_scm_set_gpu_smmu_aperture() take a parameter instead
- bit 8=0 is QCOM_SCM_CP_APERTURE_REG, bit 8 =1 is
QCOM_SCM_CP_LPAC_APERTURE_REG

Konrad
