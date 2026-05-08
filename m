Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89F9370D4D
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 20:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778271614; cv=none; b=SC2bP0h6T6DIxHG7f/gYVSrU3zKJ8VT15nZ1uVPA1eE9wSTUzW8ZaXNbpxWzcLSviuaDHrjHwdNLmxTE/ezL0Jnq8lP6UJ8xyRPAhFnwxc/o73N1FjWdZOi5TvAQwLBrZ4gEQqG3g1YFyqHtJ5GKciKxqtbUrzfxWyfntzmqTIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778271614; c=relaxed/simple;
	bh=2ttoDRFvuARsXM73aSa/iyFGnllYGs0qVza3Mt5VlKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNtJA1/lxKRBzyhHhm/6TvxiWFUyUDewpE2S0CU2q71g93sSJZiltiDLnS4PZwAMFvTuAEXCqQseYPm57vUk54Gh0YfmKyTNzVlaQYncUUhgw/6CmeodqB49XYHndu1Fz4tDHRb4bKfYzkgkpwIkdwEGcdR2bdeYh9K3ZLdV0/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VAe7u21T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9x2Pb9b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAe7u21T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9x2Pb9b"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648GTfnf145193
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 20:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eo2cOr8LDHMQe3YBBwdT+ufW
	1HrZes1kP3AFsqymXKw=; b=VAe7u21Tk5sv2zpIwGJ6bUhWuVUFeT0XndTet4P+
	9Eep8twjpYbsFCH2JKEciZfmJcwDe1taNnOnwCqsWZJWgC3YlrQVZ408StwSuWgX
	AIkvLpZqWnCbTQfcH0AopSeFsBa+Eynnf0ZYCyZOes2qNHLDCBpmBJyyPCM0b3cA
	mry54d3Pe7BJoKVK+wsJwgb+RAG/dsROP/9thN9+2YLzHjeAGsyDYSoxtOVzPsgb
	ZevysEOhlcZZ9fCCwcdi8+/mlvExcXn5rW+U9HaSK9T5o7bendZqUueIzI0+rIXC
	OtjHNY5JTaWS/jBSuaFXWvG3ZnCu0RgND2tvlu2E1vaEiQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1kdc0r1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 20:20:11 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-63132d74847so2384340137.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 13:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778271610; x=1778876410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eo2cOr8LDHMQe3YBBwdT+ufW1HrZes1kP3AFsqymXKw=;
        b=B9x2Pb9be+0RerTSX5QeZiPfQj2OZNhIjiqVa7eCf49qUlnFwH3tGM2SkGlbQRXr0M
         bBu4e+RNcVwdvmM3ZjNwHKVJp7tqAE8ZKOlldW36yDCji/kyjfQsfT07JWFCINkezSrw
         EsSuM48bjRlqGg5irFg386HoXw0mGQPhkcK4vgTitoxaHdnrvaEbvkljLRF0jTzrmO9u
         erEyve+L3dVqy+AObn0kZuAmyXrZ5NhmeIru0C6JWH8h8qIgw30l7oSW00sGpzvd3+YK
         dsNw7ACoUDt2r+b580qiv+eeKDXU1mkpCAiv1Lki2QvWsKpbWavg1QlpNE5a42UThJ5G
         2SYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778271610; x=1778876410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eo2cOr8LDHMQe3YBBwdT+ufW1HrZes1kP3AFsqymXKw=;
        b=c8JL0Iv6E7E57TGDAkwLceVRH14bbc1YFgODGT8OAtV36t4ICjNYEVmDRGuPxmaYNG
         QIHR1PFxppnw5S0xPebnqTW8lgZENnClzOU0s2yoWmtFxNoBT9yG60FOy9IC0PQI3JPI
         yHjz8tTKRCS94ChJVpsR6Lwhn0w4GWnZ1nPeTvr/EpYwWsyu8zHXPrHAUedZEmF1AvlT
         ZHveCguJdltb+3t2gEXvfylpLUcRRitQFNP5v2qs5/OEoxEX2UEcgPr/Uk01s+NRofI+
         uavhIuoJPfK/mDb9ADtpPndiTkKIGwdqVMQ+XLOTH8xwxgfl2r24JxEYswIsmwKuxnQB
         Jsiw==
X-Forwarded-Encrypted: i=1; AFNElJ8iXpp0m0kLnras8wwAE8FXmCwMdmtIfPafiiJdryCHb7UKXDdmYghROQGln9ea2rZadj/DA80RjJ8P@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7PicaCwWthdz8671Ye5f5eU8YcU3VKWp5kw/A+D+f8nC6Ej1e
	hb/4O+c654hpve/qbqSCzn7siKft3zx3IjGKwbF1e9K3B6s1L8wQDzuXxxoNz02V+L5yrBmUQ8x
	TbMno//dAKcsFkIBQZwSh9OHnr6bhTKay5zFx5H5xWa+FeVBhApf2p1i1AoXCRf8U
X-Gm-Gg: Acq92OFpxi08RCAff8GzhflEBvHzwLuukoRfzRvOhEVu5YjgA5NCplKoNGNV1cYXJ73
	0XrazZoLqropK0pTDIzS7Rn5AyJPDYnV5eHBgFqRzasVv7aZFElwb9arkKMQqtJNU5ukqDXXE4D
	lGg7epc+8FUnDMTWF5tjR0hZR0nEVAXLZeWPX1iHNiuo2shvfGDutCFgLLEoKC6J957Vb2gFVpq
	L+OytpgxhbKi7ZpkomOP7X0EZ/9zKTnwIZcMy5h6EPzB57a5bQ8yCdDxPi/E2aEhkpMAnKJCN3K
	no0EKbBJQHS/MUjDwlYmSEwXRT/j7mjTYzVoKRF1tttAiH7OB+/wFXPDVfNpcmEdF1DH6cZuION
	dzykILoJnqS6pJGjWyw+OFds/GaFol/rEeH7a36Lft1Sc09ORcEvkSNjUnsmGzPCoIm9mtSy0fP
	EpoSZo5aZAZZ4sQU1O9ueBFAHe5dtX/sm56Ko=
X-Received: by 2002:a05:6102:580e:b0:631:41f9:ffa2 with SMTP id ada2fe7eead31-63141fa0939mr2402750137.29.1778271610156;
        Fri, 08 May 2026 13:20:10 -0700 (PDT)
X-Received: by 2002:a05:6102:580e:b0:631:41f9:ffa2 with SMTP id ada2fe7eead31-63141fa0939mr2402741137.29.1778271609727;
        Fri, 08 May 2026 13:20:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955df99sm797786e87.45.2026.05.08.13.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 13:20:08 -0700 (PDT)
Date: Fri, 8 May 2026 23:20:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v5 07/14] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <elhlmmmisecn7vylpsboiicn7dn4umrggktabyixthmevdv7eo@a4keayee2um7>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIwMCBTYWx0ZWRfX2S594peYlZsB
 pqCcbtpqTr90dyzaa8vniHmOCNeGBuya33eGO6aHiNVw9IrwHjzvIevLA2ZH9Rt3HLjS3toBfQA
 SgWykb5TUTs0RAP555ij3mDAiJHbm8FkiJKlXkoQsqbttQ6r4i1LHqICvwKxRJ9KOOqTupB6UjM
 JE1oIJBSC87Xa4tMT3dWg9mlWqeb6zw/04unJlhMANWLnBA2uIZDBXGPeThlTW3NKURfAotMo+b
 jX6190zJitzXWtzuZMou9Oi1szbpuJ0FDxGLlJw9ys4MUxpx86zDKXQOuB3qt4pn1lOnEQH9rWD
 T9ZG6SlQmM08MFqG+YxjA2q2OsxVXxhBvW4xYy1QdABObZKC6el4Jwe4EnFykMubeOnjLbr+4Yz
 Z4xh/se+RaFHuDQpqE6lDpX2e+Bynwq/cAQjysIbpZg4xmNL6aS3PynsSCkzLXWZ7D+Cx3qMAJS
 1m6+GnPbmtAjT34xLwA==
X-Authority-Analysis: v=2.4 cv=RZOgzVtv c=1 sm=1 tr=0 ts=69fe457b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=BowHXwPdtatiOUMbaTwA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 5tbfyo-kUsss6b_tVBm2KGjtQbQwN8gf
X-Proofpoint-ORIG-GUID: 5tbfyo-kUsss6b_tVBm2KGjtQbQwN8gf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080200

On Sat, May 09, 2026 at 12:29:56AM +0530, Vishnu Reddy wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> or QHEE), which typically handles IOMMU configuration. This includes
> mapping memory regions and device memory resources for remote processors
> by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are

No the calls to those functions are not intercepted. Doesn't hypervisor
simply implement the SCM calls?

> later removed during teardown. Additionally, SHM bridge setup is required
> to enable memory protection for both remoteproc metadata and its memory
> regions.
> 
> When the hypervisor is absent, the operating system must perform these
> configurations instead.
> 
> Support for handling IOMMU and SHM setup in the absence of a hypervisor
> is now in place. Extend the Iris driver to enable this functionality on
> platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).

I fail to identify, which changes correspond to this description. If
it's about the PAS context creation, could you please be more specific?

> 
> Additionally, the Iris driver must map the firmware and its required
> resources to the firmware SID, which is now specified via iommu-map in
> the device tree.

Why? You miss the most important part here.

> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
>  drivers/media/platform/qcom/iris/iris_firmware.c | 72 ++++++++++++++++++++----
>  2 files changed, 66 insertions(+), 10 deletions(-)
> 

-- 
With best wishes
Dmitry
