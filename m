Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027487;
	b=UEWxKF0zP+mDvMHnmn+noXlZwPnpboFaSq9N3l3XM5Yn4p77dbu5fkx8V7gcOphhst/6
	 h1tiS156RvBsz1UJlaJD9Nqu5TRJsO/t08fdt02zykFSBGjjKxkoSPGavk76lom+h03vs
	 501umgGtowZMwulKB7n+2eEMA/CCq/LplRF+sr9rFU2Vo6LssjsMa6zFKRbuheDJwnpjc
	 kxozH9BrQYu2cLzWr2AdaifIN1z85soWDfOh4yqkCDG8Gq2WzdP4jCUkpPn3+O1Jfgs2p
	 +E17fviqajAgWcyg8U0vnHwK9ln5VRqEDjxpyMjXF3dof6d6tbm/Tvs9KS74Dxl/OTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027487;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=a/1FJMohcTZY+9QiEVW33qHS2hIU0UKeXROf1tu+3XU=;
	b=TDdgWEySg2NN1CdRHmGEsnvBI1xuBWhhUELmn+/mVz0B67BrVUs7mYdKFKsGNwyWJTP6
	 QTlwM+o3QehDKn+yE9vEw3/uF4ZTa77AWJ5fHwZdJGti9M+sVeDV6WNYnlXG+v+6T8aux
	 sL0mZ9vM+GEdwh1IMlwC6Hcvzhod99eiM80n4U4FlK6DfaHu4n3Zh+ZFUr1ABioZImrvQ
	 JQ6/Yllbhj7cnx3U2LT2CnI2P7ORBx/RzOCXjNPLzooQZT6PA/rksYV8m97OxhuBdGlZ3
	 8THQKo5QNMWbfCz0ZoT8YCF/+ku6pTlV/jyMV2JjMYrQehBz1EkKcoYGOEDdZFr9Azw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N10e3bat;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IWH6qJWr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2D060A2603
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF2D060A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N10e3bat;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IWH6qJWr
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHGAK7401627
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a/1FJMohcTZY+9QiEVW33qHS2hIU0UKeXROf1tu+3XU=; b=N10e3batxmo44iLK
	e0ggGLrFGUVup8oItqLUH94w7nY6RAHtXIuHt9Unc2uY6AcvHHLBiPdFxWNULtPg
	j6Sc4+X/SyXwh7OlgxOem2VHCJRbZ6VxZy7hDxiSaMRRA4SpjTfNT/yk9hCRW5/s
	1wKHdF3HQEdHFh2vixpA1/iCP7JOKCLnAuE1nrKpJ5XBbJpzdqDF4YExSah1eLwl
	ke/XIvT82L7xdeTB31pxziL+/qvoAYbvilwRs9t43KVum3xyHgI6IGJXazuY24LP
	A8vD7V0pC4GZDlTfulL91iLC38KbVNCbcLV2Odpo0M1x7s3iwO7MBDzEUdJSGfLP
	M6HrBw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1e5qs2a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:44:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2efe2a88b7cso7329585ad.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795027483; x=1795632283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/1FJMohcTZY+9QiEVW33qHS2hIU0UKeXROf1tu+3XU=;
        b=IWH6qJWrkwmHq2L2FKQ9cGiD33E5eF3VC6BRzsORepISu5GcHIykkXDwdfRA/wMWCP
         Yj2tiE16mpC4d7bH2bTWHmtafnH2ggmPXx+nxZRUSNTU42MPqs4UZVtLV3SVTHvb5RWm
         /OPS7Qf6RaW6zp5lwE14HoQ6nS7651X3BWmhqTMX8XyETYkKiRpSKYbOBt45T/9AW1O8
         SIzbK46kV9eX3KVc+UdG8MTBE5xZjpTJwNEOoEYjguJV7fxzLNRC9nooS/WrP1HAJ+2g
         9aoWoDBorenuTHe4xERZJu3yqPY428Z/1F1CDq/ZSuICGOupTVhnaTxzi78EP3XSHoTV
         DGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027483; x=1795632283;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/1FJMohcTZY+9QiEVW33qHS2hIU0UKeXROf1tu+3XU=;
        b=eReQQv52Rf7Ecamj7O9EUQRQF1DT8CI1awbETSQYeDMwZhcxxVP7CiKWmFP4xIvGWa
         kj5Hl9j2fg6LVIqr+Hqlzok8B41rXmmjvbEjh1VxEctIBRQH8dAwCtookSVn5NRGC/fI
         G3LGA/XCzbvcsWvXjDskHH3jpHZc3zbqEFG+d/vnXJ+yDI12ldYWVPSqR9jYuuzq9yGP
         SuNKkFvZM+LY9MHkJmIDp0ojqHQrIO9mLBCnJGnZuEcO/ODm/3DdYdSsq8R9gSq77H8d
         2IJ3kCf+sGz3pvMf7LFwtwYjVsQfw8s4u3TTYwUWsAfFFwctwKxwXyNTG4AT4adSLUww
         ujZA==
X-Forwarded-Encrypted: i=1; AL+hErEg8BEf/3nIErcJBonjppSDiGA0PNkJQAzdhjLQiNePLDl4xE6zWOdOpUq4mPvcVtQQp8pzuVqfu1xb@vger.kernel.org
X-Gm-Message-State: APuU4Z/ePyKfiT812Swr25YRi1HUCgiiuxCXth9rw4k66EK/WToO80d7
	Zk9VFEj7qhQ2RV7xhs60kKwWdeJWd/16M9PEb0qMq3FY4z2synQvQcO/QDDtuO8shNpmxbZjvVN
	09fi9bVaUCdjKFdR8lkUUQ4k4N4YUg3GsMlkXbwePnPWT8t7fL5cb07P7g9od3Vdc
X-Gm-Gg: AZFdTZexOuJ3CpQBju4ZlMdjLJPkxWYKRujN24TqehsEcqvfQC+jHEIUDEICrXP00P0
	nqeOmD5rQsETaonupNkKZk9xPDmSVTaPhExR2A0+J0hzEYLxz3n3ggD8AUnluqx30fxW/30u7ai
	FzcxvxTzC7XiB5HtEmQDRwmyyq5iDqwBOtX6UTCNGezHItcxHhOjB5YPaPI0UVCAoJpX1iElc19
	DWuZ1QAIMx7QMnrp93Arzb2Aehs4oZLVXk6P1PJY4LOszxp26CckdHemEtrrmjbHl5utYXYUtUv
	Ulsc2T9SqDbU71F3L55RiTuSPYPHTw4Nap7X5BUUBugIErqnd9Xct4VxP9DzG+tEbFF+ueolkWJ
	KBdn455DOFTo/DgL7RqUgsn7lD1+6aW7tZXZ8zVb/HnQvATR8JJr09d1KOok5U6a5b4O8LPD7hg
	==
X-Received: by 2002:a17:903:32c1:b0:2ed:1b26:2bf2 with SMTP id d9443c01a7336-2eff7100c7bmr32660385ad.3.1795027483405;
        Wed, 18 Nov 2026 10:44:43 -0800 (PST)
X-Received: by 2002:a17:903:32c1:b0:2ed:1b26:2bf2 with SMTP id d9443c01a7336-2eff7100c7bmr32660205ad.3.1795027482912;
        Wed, 18 Nov 2026 10:44:42 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6115f28sm18076975ad.19.2026.11.18.10.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:44:42 -0800 (PST)
Message-ID: <069c590a-7b30-4985-ab83-56150efc8009@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 00:14:34 +0530
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
Subject: Re: [PATCH 2/6] drm/msm/a6xx: Don't fail GMU resume if the GPU init
 regs SCM call is absent
To: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
 <20261118-adreno-scm-fallback-v1-2-e99cdbf3121d@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-2-e99cdbf3121d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: d_Lo0Z3NZUH6HBtWCDqXerAltW9ZRl7O
X-Authority-Analysis: v=2.4 cv=c5Q+0h9l c=1 sm=1 tr=0 ts=6afdf21b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xDuVsFAvjFWeh2iC3aIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX3QasUQ96ZZH9
 5WZWmXeuv/ifYAzhvv6IIRcdvWhZ4dOAUNZ9y7RygsgumDEMJ4EJssWr7aJSo+SMtxZiduM0h8E
 eBb366AmSY2XzvYtZBaHczX2/tap5oM=
X-Proofpoint-GUID: d_Lo0Z3NZUH6HBtWCDqXerAltW9ZRl7O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX+B8UjVGuKCSk
 Z/IPHrvefIjdl5Npo9Lm2qc+s+leQ+Ecf5DbmjBReb2u2/D5JD8weEX0IEBUi6J/dZ/9DVWAyV/
 8RzOsEYbTn/bRxPNxGwLsfL53k+jFxMkZP60HGS++G2OIQ/QoJsMrbAD8iKaMGJzkSFOmPdCWrI
 pTQapbjJ4H1r7KotCvyzE21LSYcuaDtnEJi42+5UZ1zn181qKDdAkMzfWR1bbK8SJPVPd7I6DYb
 bIBv9Vmy3SCTk4ZShZabB0Ue+R2wvUCG4knFHQvTDzTtFvPIRfnKcXnZ8o7G/FI/8oUH4bWQt9t
 A76/0Nh5TjyQ1+gNlcJiX6+rEeg4lB1tvFcjOwmD9Q7xYGhnCvRj+6WgaNRkL/yFwhUC7WgZbmT
 tX4EJEoECBaVngF8erJJProy+QIQUYyaGRODD7JL13CZAUYq5tM0v6ddj+fVD1PKTi7WV98eWal
 M3HCBurvIihvUtbY/Qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180074



On 11/18/2026 6:38 PM, Puranam V G Tejaswi wrote:
> On A750, A753 and A8xx, a6xx_gmu_secure_init() asks the secure world to
> program CX_MISC_SW_FUSE_VALUE through qcom_scm_gpu_init_regs(), and
> aborts the GMU resume if that call fails.
> 
> Some platforms have a secure world that does not implement this call.
> The call fails every time and the GPU never powers up. The fuse
> register is still protected from the kernel, so the driver cannot
> program it directly either.
> 
> If the secure world does not support the call, skip it, but still read
> the fuse register back. An earlier boot stage may have programmed it,
> and the features it enables, such as raytracing, are then reported
> correctly. If nothing programmed it, they stay disabled. Log once when
> the call is skipped.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Maybe shorten the subject a bit. Say "Make gpu reg init SCM call optional".

Either way:

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil.
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 0fa2d2091f3e..95636dabee38 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1249,22 +1249,31 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx_gpu)
>  			goto done;
>  		}
>  
> -		u32 gpu_req = QCOM_SCM_GPU_ALWAYS_EN_REQ | QCOM_SCM_GPU_TSENSE_EN_REQ;
> +		/*
> +		 * Some secure world implementations do not provide this call.
> +		 * Skip it then. An earlier boot stage may still have
> +		 * programmed the fuse register, so read it back either way.
> +		 */
> +		if (qcom_scm_gpu_init_regs_is_available()) {
> +			u32 gpu_req = QCOM_SCM_GPU_ALWAYS_EN_REQ |
> +				      QCOM_SCM_GPU_TSENSE_EN_REQ;
>  
> -		if (adreno_gpu->info->a6xx->clx_tbl)
> -			gpu_req |= QCOM_SCM_GPU_CLX_EN_REQ;
> +			if (adreno_gpu->info->a6xx->clx_tbl)
> +				gpu_req |= QCOM_SCM_GPU_CLX_EN_REQ;
>  
> -		ret = qcom_scm_gpu_init_regs(gpu_req);
> -		if (ret) {
> -			dev_warn_once(gpu->dev->dev,
> -				"SCM call failed\n");
> -			return ret;
> +			ret = qcom_scm_gpu_init_regs(gpu_req);
> +			if (ret) {
> +				dev_warn_once(gpu->dev->dev, "SCM call failed\n");
> +				return ret;
> +			}
> +		} else {
> +			dev_info_once(gpu->dev->dev, "GPU init regs SCM call not available, skipping\n");
>  		}
>  
>  		/*
>  		 * On A7XX_GEN3 and newer, raytracing may be disabled by the
>  		 * firmware, find out whether that's the case. The scm call
> -		 * above sets the fuse register.
> +		 * above, or an earlier boot stage, sets the fuse register.
>  		 */
>  		fuse_val = a6xx_cx_misc_read(a6xx_gpu,
>  					 REG_A7XX_CX_MISC_SW_FUSE_VALUE);
> 

