Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBE43B6350
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778533127; cv=none; b=YUhVOy/sUTcai0FPjYqiICy6OtGXmlDAeOT+xytNxQByu3YKIn/Z//GMq0C4/wZdeUrXUmlLmU5aNu468CgvF39XAcufmkFNQW3T9mYNDFDTd7j3ZcV09NYsUopoLalxNnN8zhDa4aSNE1hLkWR6CJlkqGZB+bp+iL7CqwCh3vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778533127; c=relaxed/simple;
	bh=IC9p+yFW23kXHm6BAxrUgukG4Y6HX3/Ta/4t5+nKG+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JRoH+6JOmQw+4/mYujI5+AuEB6n+Ji4K+IUr3eX6CpIVzISI28/6FCxuTgbY/3Eyju2Nc+e96iEzySAOxLpOgBh8qzKdwUzjb0QLXWmc+EA1rCjYFsLtN6szE+43HTFEvd3lqE84wv5APGCEMvorcdCJKTAmuWMiBq3EkRAE/CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V1u1rJGz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UccRG3Jh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V1u1rJGz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UccRG3Jh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6cLV3444270
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9/p9ARwLXTJwRe2U4yqJFSD8BOX1Dr2lRgTY9kR08Xw=; b=V1u1rJGzXkpOMKlD
	cOfPNOc3SI+WgeiL6w8LZEK88483Jj6Y436ZC2KgVgtRP5eSCGuYYYa4hCRNot++
	a7Dn38LfNGYNHcm6ceOch8+oALHmCil0JIcW/FYUrnFtdobxMhLbI9eB4N/u0Z+t
	BRMKglshERHgMZXlJrBsCSd4wzu92v1T2CwGpOpVPpsUi1tPNBhrpj1E+14NG8wt
	enlitUK9Ni8A0Lj7HdLxEkBlchsv6LUV0w07uWySIACTJfLreQABjhN9EuBIeoZj
	Q56/sIFi7RkgDDM5iVecXvgc8NKWT5BC4bn3I0YbMNPur7eGv9K5tRn5CBC96V+U
	4qwa0Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0g72g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:58:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-83cecc22d5fso2077566b3a.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 13:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778533123; x=1779137923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9/p9ARwLXTJwRe2U4yqJFSD8BOX1Dr2lRgTY9kR08Xw=;
        b=UccRG3JhNRSOZX7QuIS/F7vupKa+kQLswqqPi+4L6c/X21PxBf/UY5SWydAUGOac1R
         KEaUZ3oNMiplyAxmqGDAR2bvCso9/RAhtyVazEF1VG+x8ft73NEOCFaAzsgtnrveik/T
         CLjXum+yP7TXQ5KNdQA6A6104lm+qmGl7Sh32HDCTbc3zKQiQOxECTW0gwoTed9o7Rs/
         ddCctcY7qtWj7upbj2HPBqPFkNFJlwa+aYxe7PhYPg2r7/ZUZSfMZ8yJoeU9y50psaDs
         xSB4UrdWEt3JsFChIp5lrqCJL/ajNt2OkO5ovqUCoWnfhHy61+P/EKC5GOyVUGK+QoU0
         v7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778533123; x=1779137923;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/p9ARwLXTJwRe2U4yqJFSD8BOX1Dr2lRgTY9kR08Xw=;
        b=lHhPxlKcC9ykOqb6QRNIdJ0q1GU4CyZKWv+dDc9HrYUIWos4XJrTLbYh3zc0WbOdOd
         nH2w97B9inIKCDfdwzUJiwv4iijY0iZPo0Q5CmgcQE3t5HDe/tHSWiJYX4D20dFNU6D7
         f+9+1optnzooZ76c9xFTt83QHAnpza4vn6o0thD1pm3MhP3yci1998aQKvSVU8H4a9CU
         Vf+uJhHptLts4RiJCve7nOHad60RMkamUuF1RjWeOo8J8mLQEHWjBCtIdvY0SPMXXB65
         xLJJTv2iPX15kKIN65LoTsd6F/orL63BgDT0KbZfK0HXOpQCpgcvOEvqK0HzrXmHWYTk
         3Hlw==
X-Forwarded-Encrypted: i=1; AFNElJ+cMOW9OxBTA2eNTqsGV0mxuiAMfV33R1D+UBXIBa9TMCci/wyO9i6rQwJ4AfV8j766hKpoF6b5T3cy@vger.kernel.org
X-Gm-Message-State: AOJu0YyXzQHqKU2A5Da0HkEvGdVTS1SXeMrd4piR169gb8jF8tcxt9sU
	mTpR3tgRLVm4XG/mo8qLRHZTrpCIYAOY4V18aH2HdW9HnZc8LAsTpxOqmqLDRj5rGN2xZ6u4kEw
	Q9QTXeZURatVLNJL3+h24Prh1ndtegnzZVKxlxOIvZEUvbzCz/g6aYBwrL1vmbgFw
X-Gm-Gg: Acq92OEACEO/w0DHaQIreT9jtkALeJ+rHgbNR32iCRLSqP9vtX8dYz6VS6Pifk9uCUv
	F/QcI67A7Qbd9jtwH0nktenAl5w2PNDR1pHy05uf1ZqSwbVGqIuJievfZUPVelHW91W8DqL6QVg
	9ycDG4DX8Nop6DyDECknmT9YdEcPdyplwlB64HRUC5NMXLQT8zI5uMdva46ii5tSVHdFTT+jKGI
	x/Qb3qfqFD1D0V1dbJvVDYPBED9Br7HqaTRKl4oPoHCQZKcLe3c1arb8HkkJvNAR4hAOI78GIv6
	zBpFTyuEdneQiTNyZ02muvsWnGLdFWdtTF2HJXVPLJ7hztDDbB3C7J2po6i0SwhEEyDtoegee1s
	PZybuXSr//5o8/5oQOUwdOBIHhjgeY8eUDV1H+3GW2jkv
X-Received: by 2002:a05:6a00:428a:b0:83d:b11f:7979 with SMTP id d2e1a72fcca58-83eebbf4d69mr76932b3a.29.1778533123251;
        Mon, 11 May 2026 13:58:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:428a:b0:83d:b11f:7979 with SMTP id d2e1a72fcca58-83eebbf4d69mr76903b3a.29.1778533122756;
        Mon, 11 May 2026 13:58:42 -0700 (PDT)
Received: from [192.168.1.3] ([106.222.228.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f049sm24664326b3a.7.2026.05.11.13.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 13:58:42 -0700 (PDT)
Message-ID: <b0a99bbf-d916-4990-8ef9-2db428192e94@oss.qualcomm.com>
Date: Tue, 12 May 2026 02:28:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/msm/a8xx: Fix RSCC offset
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260512-glymur-gpu-dt-v3-0-84232dc21c03@oss.qualcomm.com>
 <20260512-glymur-gpu-dt-v3-1-84232dc21c03@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260512-glymur-gpu-dt-v3-1-84232dc21c03@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V+xNF+ni c=1 sm=1 tr=0 ts=6a024303 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=1UGwFfo7D6NxPCeOlddrGg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-ol3qSTvAihUzIL2rFMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: Len34561xFXONsq6V2PWK1Cmj27P6mSP
X-Proofpoint-ORIG-GUID: Len34561xFXONsq6V2PWK1Cmj27P6mSP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIyMiBTYWx0ZWRfX0LQGx7lZxaik
 9zoXFVNTkxlW1NxFFHhQzYS0Kw+tJAwxgVyfSyWMKEiFVYVtSTPr/89Ai3K7TrKxwpc8jX8nSyx
 AEZ0ti36dOtRfhDZxOc67P6QiV/oNXRsZv8nDbTyop8uYYLfzDhYiD5JLKzRmzBMxFe+dOf+pP/
 pypaZocVTJgWackxOg15vTQr2DGA3DWAmhppvzOsyphaji0KUcnpxpQ9W1ekaERc7E+qlKIYPcS
 7gwOi98xx701QKzu83ZvyE9g+U/9cu47Oa6hler711ASIrk3KLRDN4TmvpU3Y76/lBDZ6c7WeZF
 WG4LIxxqeipIceMoDQVktMqPoYqtWCyMQ9tSrQ0O/lSlK27xyc09g87Qy1ph5wbgAR4EHr4xij3
 WkxcyRg9fSdLJkKFzhZEPhPOjXWZdZbwlwMHPg5+th8dmJaHlZWdCI8KF4OIOAywJDEgaT/bm/s
 kpmxZ3lvB7rBFeaX6cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605110222

On 5/12/2026 1:36 AM, Akhil P Oommen wrote:
> In A8xx, the RSCC block is part of GPU's register space. Update the
> virtual base address of rscc to point to the correct address.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Missed the Fixes tag:

Fixes: 50e8a557d8d3 ("drm/msm/a8xx: Add support for A8x GMU")

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 1b44b9e21ad8..cab4c46c6cf2 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -2357,7 +2357,12 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  			goto err_mmio;
>  		}
>  	} else if (adreno_is_a8xx(adreno_gpu)) {
> -		gmu->rscc = gmu->mmio + 0x19000;
> +		/*
> +		 * On a8xx , RSCC lives at GPU base + 0x50000, which falls
> +		 * inside the GPU's kgsl_3d0_reg_memory range rather than the
> +		 * GMU's.
> +		 */
> +		gmu->rscc = gpu->mmio + 0x50000;
>  	} else {
>  		gmu->rscc = gmu->mmio + 0x23000;
>  	}
> 

