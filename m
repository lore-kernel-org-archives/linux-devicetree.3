Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59164395ADE
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 21:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783373833; cv=none; b=e4ofVEJJQRwwL6plcuvIWYv4hPPy/bumvYyqDGnWLkD0YfrRYnXqyFRS3vHSoZ2LxK9G/NTKip/NANIXENYEzeaIOTEiXXYejBkq2POMv3dBrSANs+7XXKZXr+HpqULWyNPnaKnRqZoIR3CsrW/cGeQc9gXbQPqHey8UDvLlS40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783373833; c=relaxed/simple;
	bh=SYSTzYMV9dZlGM6XYUNUNoY3tliyo+BItosKaSVA/LM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R32hQxIWrJWYOm58Vp36DjQu5eYX+IftUag1bgpi3zfyIUAM+AZYMloZ0nFdda0Ks9QtRnvSctD/d4oRx9NxnB7pbOwjVyXsPF8j8cCpBCBX+XzRDvv9EqJkuE+K23dhdhKlEds1KJBQm5auR9iBOR1+ALfzCmKSXl429ZuLkSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/g9HkW4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IHbh4n90; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/g9HkW4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IHbh4n90"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KDuIo1566450
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 21:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=51ioZRkWsr8YoDDsIq7CqvS9
	RZMTHGeh6Z7fA8LH+6U=; b=n/g9HkW4D60PuJ2NZSWDYc5hRIKJKU8BpfsglSw1
	tgDVNoy5flTOTKVlT92I2uQLIGcVUu2ceQOuCoueRx6rIxt2Q1eoJ27LvZq42NJA
	CsLnVxmG7WgXa1AdD5pCbmD0AsVUpfVNhuyW8ugquMLtNlIHlaFapc45+Ey6Ms76
	Pou+uFpaFih47E7zYwBfx9KzzuBFtU4rQEWG2qgVdzRq/W44hUCVTIhpTMqdVM+S
	/k6TUo3bPIyriitLltZgudduDaZlT2ADkEIglIEwQAlk6VkEm/UBWVYcQWXqNS88
	Z++6Ff3ySp5Kfn7BE5oLSq/bUjeCr8WYcPG1g8veWZv6qg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7kmpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 21:37:11 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9693cc255cfso3427081241.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783373831; x=1783978631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=51ioZRkWsr8YoDDsIq7CqvS9RZMTHGeh6Z7fA8LH+6U=;
        b=IHbh4n90u+e4+S0vdeITa0VbGoNHzb4i8pVo21G2nV3vkw26ZBuVv6YpPyu2+lQWOl
         y3do+dGopCTIRt58UG9nISCVS8RzxEia2i80e27nW4Xm9pg/QBOl78jEri0+azBkgnou
         Z6Tv4AxINyhqzNwQR2+8hFejLvEpKiVRKJOlxJzODCL2LUcXvtYF7Psx2C2DsrYWKIc5
         9ac8F7njmW3OdmFbmh6RinmTE2KMJ5cK71onUGZZptBOpQW4DwwciAD72duk5QeXNowz
         b/MuqSZJLy552vYALDEATiNoPeCo9StnEzGaNiSFgVMufDqG4QoZvZhF4EraYeJKuPQF
         toxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783373831; x=1783978631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51ioZRkWsr8YoDDsIq7CqvS9RZMTHGeh6Z7fA8LH+6U=;
        b=rZJaaATeDyMmlRVBZkVQipfyIATXgB4xDJtoJbvmHc6AlOc2fzmsW+g+szNlDbopZ+
         JBTzFOR9YfZMJ6+HMh3/SHcjWG4wZIYhdgV9tcFdKUoDNEmenh6A6QTtVXOAbmy3LQFe
         oM1gl9PY34SJ9nnkRObVOOL8GjlJg1yMIpINaA4pKJC26+oRN+TR9UKpVQPdWpsFSjri
         7Xen+EFqSo6dorfgj5O9uYGHuU29P9jDgraQ1DGj+2X+2ceb+OABxzCvkwALm3VkDdE4
         01/H7SK29Xt9pnz8YvjL9Xz8lJAV6gImP0OkzgxrJvQytBTKf9dfrDuTHlj+H5vGHvCu
         PGOQ==
X-Forwarded-Encrypted: i=1; AHgh+RqaWjsUw+vQLevQgSmThhx3B6+FGiQQyQyhu1MgQGkpgLZlsFb8OCKwp9BVWtyvj5fszPh8dK8jVcAw@vger.kernel.org
X-Gm-Message-State: AOJu0YwQBJgNS0lZ4YUHKZNEIvkXQ1XNQMyVQoogpp5Ey3T7T11Ejsye
	/s4XIwaKEwkoe45zE9iwfHAHukhzLmOBNMVShS3Uf9p0r5zYATrkBKs5WeYK7IvL63iH/XOkLCI
	ATFQd9uSSEAbW+nnwBV84sjRbvYLl7vAHML2orC1+x2MTO0j+0zahcAblc3qbcspb
X-Gm-Gg: AfdE7cloQu3HBiGE7GPVok3rrFJxaJ2cVV+ynK/Q7O3++k0Mg10QiqxfgJmRmuDUtIG
	p6HlgHLqv0Ih8697vz4vyUN62xsT2KmSeea2RpcxO24/oPvRQ3AYZYpwE9EvavnGZOoUglEhOvU
	JgArwiW/t98JMqeJUYtu0Qp6di/AtESySFQc96hQJnURzU9BrLWAbhptOooveOq9xrBOo8uKThi
	DmfMNUadITkKB4zeZpYdXrZBoj8kdKi9SPCOKlAhNeYlewCZEplZST4HTVNiwdZjSCEIqqKE99m
	ASOscLuqtECK5+O/9SuCLx3qwYJTLGTBV0PgO/+qPzhPzlqeaO8abrUCTvfBm0bKJ9W3d/dliQi
	9YY3K0wwB32+iEr0eTeJZ63u0+VeAINld29cdTWTaXanrMLuVpj5yg0iSxBmG8AuuJBnga3iPiJ
	sinC6M81q0xaJ0CSJiCa8J8XIv
X-Received: by 2002:a05:6102:5e96:b0:726:cd42:d039 with SMTP id ada2fe7eead31-744b7e0bec0mr1289302137.24.1783373830711;
        Mon, 06 Jul 2026 14:37:10 -0700 (PDT)
X-Received: by 2002:a05:6102:5e96:b0:726:cd42:d039 with SMTP id ada2fe7eead31-744b7e0bec0mr1289236137.24.1783373829228;
        Mon, 06 Jul 2026 14:37:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8c3asm3167623e87.82.2026.07.06.14.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:37:08 -0700 (PDT)
Date: Tue, 7 Jul 2026 00:37:05 +0300
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
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH 2/8] drm/msm/a6xx: Rename GBIF_CX_CONFIG to a A6XX-
 variant register
Message-ID: <hahn2b6uu6bwzuext5jkb34zbs55yerrkfpdfqpd4dgzprywcy@wqcw6w4bkjtk>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-2-c9f1354dbd29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-eliza-gpu-v1-2-c9f1354dbd29@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfXx2s6DCmNNxyd
 XEUvwUrgXw9toDUZ2BL2Re0Q8bCmcbVgyj5Uk7HRGWH/hDImxm2TqKmiV7VyXrr/fPwIH+o66uT
 jX8AYs9V4/EuzoR7ldlgMPuQfGNnFI5qHHZ84YjacBeojQpddvK4CXonDK+WyCmVnTfuqwvy754
 9RX0JQ1hv+m0yuIgLNVNAUjGtROAaUJaw8dBEPsOnYgU/h3xHTMHckcsTOFJbTzqTU6z8PgaOlQ
 tQIAuwgLQnr5lUk+JfkSnKwt5NAVwJOinwHlV3rvNtEYHd4jdaQuPTsPlWH5p86h6jqHrBPh7wd
 lopx9sVDrrfx5Q7jNcHvPR1vZyAZu3tao/GoqEVe4uJa8xuMppUrvZ5k61pCh/LohkTB6uCU/yt
 AqrxTEBNQ0FPbV+/dQRLGeZ7kwbxkTHKGCc9SsHlIEP/ZdaSWOtMz0/pCn2ipJf9l6p5OrXZX1J
 o+mamgf18Yxp9CcHqcA==
X-Proofpoint-ORIG-GUID: DSh2ikhMJggPtiga3ciWnydZ1gTgV5t6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX6jJjHTp5pBzG
 Naw1hZ0OCQkqe6hda5qx3RStPK0PXNnnN3ewWpJGqRuKsg4Lr5gJjq85UiipuYdvuJg25nVZ6f5
 76FQEl1QU7TyfeYLtg27HCL3InUq1Eo=
X-Proofpoint-GUID: DSh2ikhMJggPtiga3ciWnydZ1gTgV5t6
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4c2007 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=3yiLn2T9MxZ6V1egYJIA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060218

On Sun, Jul 05, 2026 at 01:44:17PM +0530, Akhil P Oommen wrote:
> The GBIF_CX_CONFIG register exists on GPUs prior to A8XX (it is used on
> A722, for example), so it should be tagged as an A6XX variant to match
> the register spec. Widen its variant range from "A8XX-" to "A6XX-" in the
> register XML and rename the generated macro accordingly at all existing
> usage sites.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c     | 2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c         | 2 +-
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c         | 2 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
