Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A2E27FD6D
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 21:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868919; cv=none; b=JxOQwW9+Mq8zCbr4xRMXJuWbPerohuh02IWnlt4Rt8zHccx2lgKirySq71qL4FuO/q4xRRsg22kcUHQHlbZDKXzvJBOZRgkLGbXrhCC7pu8fM4soa+AkVKKFEPzCaAnTnrXrHJXsUuAcMUiF2vuCEj/CqHUkXkN+V5IpOEXpATM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868919; c=relaxed/simple;
	bh=ILGDiyBEsByOArbZlYQlWsMFoQKUuCbBihFkErQKjAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uq6rZoMmGO6rDaiatutLY3cTFvQ08XL07/W8++nUqsm4AfC3J7+wpEv4EwSO52vhJrMjbdxTXuPUh0qsGMhpSZQp+CjsP9BOsXSojlPFo3qnKJxL0Rxb+2hBoa5A1lOfIF/Z1zdiI+Aeh/OjGcVjNYfR9tFY/tBgI0+Afbu0fTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o31dCwrl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBZnyaA2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o31dCwrl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBZnyaA2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657JGwkm878068
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 21:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o1R7z3tNM5aYb/NUqCfxowaT
	LqYwFCZn/Sdm9gTMZJw=; b=o31dCwrllcRSjxrYsp9xT7mw5iSnDJd1/XUwA/qb
	pjD0ZCyizmJXpvr54oR55PxQ48xH9I3GL77WHFMZOl6Bk0hbr/3w+K6IAN9klip5
	BJuzV9wx0CGLgkocLCtIhiV698S+dFCzu/qLhuIGiw33of+5hb5AnJGXn5mTiPeD
	3ZL4j8xbhLUUKuxEYkJI8diiOesTv7fIYzXkjjrJF2Y9yyN9KeHyp2E/ls9w02pN
	CnHfmibEFRba4sGZrqxsHMVbeIgx2Tn+UyPhZc+u+6CIFFMXm0INcjry4jT4ynK+
	L8C8Nn4MpaZzoVHSQpWGn+lsxwDH4yBvxNgut6GzRh5D/w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgvjd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 21:48:37 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cf37fe12faso1526418137.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 14:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868916; x=1781473716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o1R7z3tNM5aYb/NUqCfxowaTLqYwFCZn/Sdm9gTMZJw=;
        b=LBZnyaA2ZIqQnkzk3ccOAITHPMc4/yHGnhqBGq/dX1TquvPzsH3bF2qocdw5bt8B/i
         2vJp9l7C7cOMV8uk+lOrYq9+NdtpuneP9ks/BzNkSbx0qzVT0ElCp+nLLwaggUU6JZbi
         +JaPkQd8tb41x1672Ws5WKRydTrbVCHyBO0IUUVFyr4zI+R5D+vHVBthysmqZ2dWrVqC
         1depjGgDysgZ1FOCZPv6eZaWooam4gs06Q8/95nirbqYuRiEqqqMFIqI9pEwF7FW+oiP
         O09NkLNFK9S/39QjR6oCT4j0AEsMNusCvYWBaouDDVA8B50KSRMuHPqrpYqVp9NGg982
         +PkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868916; x=1781473716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1R7z3tNM5aYb/NUqCfxowaTLqYwFCZn/Sdm9gTMZJw=;
        b=W//ykMhRMbfgSG8yr2EMV5WeGughus53aUVoS0nyCTqUrZ5HmU70ZcTZ3FgLeG21Tq
         a4KKsEbAxcuIa937red79s0LB/dLPnUFbqfTf2LSeV71bLTt+N/A6Y7cwrC/Kd6vHlqa
         URsf7y0kiRAIcOB1hoNwwE1o8h5ka4s/HK1txBMpvXG9PouooqOHT8UagaI5P84+ZBhG
         C6GfUkF4HBDQk7meivT1ZDeRjqiR3tN+/aMSr4rK8blx86yvTzM+StFJDiYCQQZP4Iwp
         FQ8WLJgfA+y4D3D6zbMbpjZQC/vym+W9D5yv2VIuYJa6GAkvj8CQI3Jtzalii3Hjh60v
         553Q==
X-Forwarded-Encrypted: i=1; AFNElJ/mwBSl6j8C7E2vVSe7RdJfwYSzEuCQDBAPC9r7JIHs6ULm8aFDwFSlQEbMKFitXrCXf3bewzmTtmrr@vger.kernel.org
X-Gm-Message-State: AOJu0YxHvuThDXmBYWUwqvC+twM93j8J9q7qJI/kFb8iVjJe6UTpiEqa
	fUzwHgQ7c9ZowQGlymiFSXaXPW/5Ii8FdzDLypfselD26ioJWwU/viDQOCpE9osdYrEJhT+JoPm
	85U6nXQkkazbvI0UyxDGA0x7oye+nckOGKy4UvIcxPEHbl2z8RfMVWIICRptIMC/X
X-Gm-Gg: Acq92OF6iAspSSm3Jhz/iOgeHw28aSOyrw+uQNTQhZitqSqJ73Y4sXZqDx2aFYzJWZo
	XIVMxegM1aAjRH36riA1Kc+/eOlWTC+oEcAx0ZJq5u/FK4aKIjhaV8NyY9glaza8GfO6EMF6Q8Z
	qUsG0q9i0xdgXqYRrVnZlriBJgda9jxWr3MDn/jlLzxNI7WzqTES4F719TgqodiWNRNGcm7/hJL
	K/dPhCQKT9d4WDYXpzL+vTvTqZu8Mw2cqAT3pKvVfkAx5ElMBBE5x41bW6LHdwZ1P4xDvml2RyK
	OmRicCOWyVLwbfHFPT5mcnMsEONmqKWhchvlLL0FjFNCUDse3CGwcBS3GJaEDGPahQ9EfFw/ShB
	TJweBGSlp4n5HpwPPSJVA32Csp6/99AIPptYxppbCXN/NlymTOQXXjXyOGFQkbfJ6V0z+SmP9Ts
	FOAnFsa6Cfsf4eNrfRNqJL9LfqzsWDdvzCefmoKDIvi3Kmog==
X-Received: by 2002:a05:6102:5094:b0:608:9a34:c8ea with SMTP id ada2fe7eead31-6fef9971468mr5613946137.10.1780868916293;
        Sun, 07 Jun 2026 14:48:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5094:b0:608:9a34:c8ea with SMTP id ada2fe7eead31-6fef9971468mr5613927137.10.1780868915837;
        Sun, 07 Jun 2026 14:48:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbcc7sm3322124e87.23.2026.06.07.14.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:48:34 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:48:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 08/12] media: iris: Handle CPU_CS_SCIACMDARG3 register
 write via program bootup registers hook
Message-ID: <u2mabnpmsql2mfnonw7263b4eb6wpzfdkdmn6q5gghutz2ir2g@ekr3bdwxa6nv>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
 <20260603-glymur-v7-8-afaa55d11fe0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-glymur-v7-8-afaa55d11fe0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a25e735 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=bJ2oX7-cLgL2xx1Iw9EA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 91HappK5pMym_y5MdrVow_LOx878qw9y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxOSBTYWx0ZWRfX2bC3Bj7Tq29b
 KxLqDt+ylATix6S8fBGcmDT+0yaJaKC/B5EJVpxUTY46rh3SDgF3ugEtbr2GKUWGRMUjoddbxEi
 PyulEEo3ebfu4e015hNIqpcOrG3tJjIHinjqZpbMpJQiCxQ3v4mrcMKg/qGpvjWzo0qqMGJF+Vh
 3NEH+Ool1C0LuBBSLG0Em0ShW1dgzRj8sKyDScDJhxKDHZdLmWD6xtPz4L3tMdYxMlr82T43coI
 IPWm+NXX3hahF7v2yU9x8drI6dqY8wufJZ+rHcKY/uuzhiuz9IsEEDdx23z8u6RNmyUQ2DzsBZx
 JlVaH04M9h5uewXzss48o4SFsIVqyy6leCvc0dJ8Uewhj87JXlbRFGXuOwKXPEBC1gwnJMThgyq
 zY1QdZ/O8GHZqhppbVjQmBJU9Pc0mHN2no2xzKgo8UCIGDtjGv08Vhrqwmmo/9GvHBGZhUkP1NY
 0oDwdmTGV8kYcmlwyYw==
X-Proofpoint-ORIG-GUID: 91HappK5pMym_y5MdrVow_LOx878qw9y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070219

On Wed, Jun 03, 2026 at 07:48:46PM +0530, Vishnu Reddy wrote:
> On the Glymur platform, the firmware reads CPU_CS_SCIACMDARG3 during boot
> to determine the VM count and increments it by 1. Writing the default 0x1
> causes the firmware to treat the VM count as 2. To avoid that write 0x0 to
> CPU_CS_SCIACMDARG3 as a Glymur platform specific.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c                | 6 ++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.c           | 4 ++--
>  drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 +
>  3 files changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
