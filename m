Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3612ED872
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 21:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868324; cv=none; b=ATb+hAs1Mvrby9rmcT0BX16rxpsaf8sF5Cyzvm6tBntVLjW9r/NTm8TxKJb0CMBd4G2Ma1k/25rhgm2+zSozEELMLktO8Ex/Y/FPztU/myzkSzCphyyJqnui9DCj0Vt/iaazzh9AsSDHi1OsrimUipWdI+tsJy7Y0ABUd6qLm5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868324; c=relaxed/simple;
	bh=VAgBwjDSeNlnZ4qckfBu5Y1PBlob+5OYl4nU7oWlIok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZKYmKwS2Wk/QVOe3qwTqX03y07Gd68XLpKFEXm0rxVcMnbH3xliin024+KR1TVbPo2507t0YdGF3OFrxJ5vhtBnFbn2qg5AOsJ4r14LdBydvaRBL+7NRXRT2ojLkZI0yQmQIi7c6KKkmDu9NL6VWnZxp1iNV/naw+ugA+mL4zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4CVZ1tY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fh02D0AG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4CVZ1tY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fh02D0AG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657El1u3827191
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 21:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=92I4yuoS22Z9HO3EyiCCTVSZ
	iS8+EKZGlOF800tslZs=; b=g4CVZ1tYnf18m/FzTun8nLzBWNZ8weQeE2NaPEIq
	F7ZUCjB7roM0/g7YcSURCGSxbZVUUeaOZ7SIY/knkn+7Fq3hiu4RVJH8PzWnTRcy
	Wja6yNcnIBDLE2dhJ7nCCOg8tWbwgwkeJQXm4B3rYK/49AmjqJ+Af4TnmV80gfM8
	+8ONUWSmeFeZrbZBRRRZGSBaVXLpoXVfzvIp37kIIEpXu/uYFpulfMnSUpLscSDM
	uvWRabQGM7R/TWt0kz8JRrGKaaYZTQ++iTpMasWy1I3SPh7FeEBruIiK6qZ25Jou
	fjVbnFXfdWnfUlESk0Btt7VlWPq3BTTjJIArA6moBnghug==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6crfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 21:38:41 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59e6c1217b6so2817840e0c.3
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 14:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868321; x=1781473121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=92I4yuoS22Z9HO3EyiCCTVSZiS8+EKZGlOF800tslZs=;
        b=fh02D0AGrJyq1N68SnhKekMJprPOEEEq7b7rtHLA+idKa+EDs8X9riTIauMEbvqG+G
         wFvrEbgtbXCg/FK/dsxGG97VFDEsgwXn51HVop5Yj1Cwpq6rLyRRIoobPj4zsDh4Kaa0
         KV9V9kjxodKZjDsO3y25w9/fsTfAQ1fDkyqvEdsU0l2R+L+mgPtOdvJlhfKb57kop0fl
         ldKp80nO6KRLH9ITKPFpX9+JA8qzKy673dGYO2dBJckyAxNUAUpUMrgf+vncrsNw10IY
         3eIQyEirYsPL1/l+VZlwjZOpgVhXhwtPp7iPsDGkCTC8QiB0onqgsweBtMl0DiLK5DJH
         xWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868321; x=1781473121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92I4yuoS22Z9HO3EyiCCTVSZiS8+EKZGlOF800tslZs=;
        b=a0pWCLrUVs/8LoBnJgAA8j7SkEUAtx1wWHvzEUVBZXugpCV+mm4Arwr1x7lln6YxW0
         yjK96hecT6OIlU12lY53pVax2oQ4LECTVFwlTlBs4c3AL+57xXVb940KAZ59E2cu24XK
         9nfagzE9JuZdIP+7UIH3u9lrHoIa3xhEFlEA9BvxjSIKULQdfapBZOhCQCLIH3YET+Ce
         I2SrSrC682NSVo+lQT1aeL3GHc4bkG/ECRYa+UyaQlTN9lnq6EDd+ZEbBWNjhVxxvdMQ
         g6MXZdQD45o2nLW4LFoN+w+eikPSThi/nyArDbl7URizcALKhE5SNfzo6eMrFeyOAHx1
         Onow==
X-Forwarded-Encrypted: i=1; AFNElJ/mDFUyXraVtHJ9pfBIwZhgXsLn7CAm/ZqFIBuKhR0uAgUTWoebkyu7wmCC65k5GhfsG0LVkVEDTDNX@vger.kernel.org
X-Gm-Message-State: AOJu0YwgCOxt6vDRxSZe+dLxpmlIqiThdCrFUdLb3IcgS5Nhf1qNu5ha
	MnOXJW44wojcZGEM1poww10Wc+VCaWPkhSRZj0ZLCUWGreNUAOwHdD2HnD10SAFRUCbCn5Z0SXT
	6guMKVFpuP+OUCezyY9KBEIKbAv6gTw2+YV7kWT35uTNxjgT5xFWPQCbmHEmZPVBo
X-Gm-Gg: Acq92OE8n+gAiSBtdk85iWVT9oFnHT3sdBK3dEQttAm8GztXov+hKThIP8HNoUMW1n8
	q2ERsMMPHdAQUuUtYTVBnG4iYC7uvCau1X62AsE6U7qeWb5u7Uh39ZG+DVy6N7UnANtAr55vElO
	HPJi9VNTOt0AFc//rjKyxUfvkdEZCtwuSFkmDemrEvol+l6PnCeuOt1LLw+V26MCbbB/HhzrNM6
	gGEMV69WDYxGSLW6YRDwZ/urDyL//Oiscc9CwUIxQkr5TcKylI7eoSCKVZgyNbZ9meHYkhS//OZ
	cY/WZByGD8+udsXzGmqe92Dowge5FKMcrPrDZIyeBFGwBwyoKlDeO1oMvypS+Ge35LCkFuHb8js
	6n3YLeTi/Lrmxn8pLhbIQX7vrsakm7BEwwPD7R0VNnwnwrEfwJpo7mWnc2p++6J+K42fNtjWmJF
	sbPWIaCg4OzadMxtEEjtKhAz/fxZhrGZdWMiJUz/KbobtSaw==
X-Received: by 2002:a05:6122:54a:b0:5a1:edab:f216 with SMTP id 71dfb90a1353d-5ac5197b908mr5984186e0c.11.1780868321405;
        Sun, 07 Jun 2026 14:38:41 -0700 (PDT)
X-Received: by 2002:a05:6122:54a:b0:5a1:edab:f216 with SMTP id 71dfb90a1353d-5ac5197b908mr5984169e0c.11.1780868320935;
        Sun, 07 Jun 2026 14:38:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fdc6bsm3299246e87.29.2026.06.07.14.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:38:39 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:38:36 +0300
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
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v7 05/12] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <7jqvyudwdngiln4mv5752qpv37zc7fu3donqrzzpjt4olug427@5lcbz27qzumu>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
 <20260603-glymur-v7-5-afaa55d11fe0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-glymur-v7-5-afaa55d11fe0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a25e4e1 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hsWotPrWWJX8LXFSPeoA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX0pmI1PxbD4iU
 fnbXwwURXIcvmMFtQ3GBc2ukpZtwlz1dP5e3KrDPvHNWhge0F4pD+vyqR2Ma1UqjaDMDojADlEQ
 rkVqZDVFiy1TDl+bGcFOEPI49dtNns3DuTn6c3+7AmOE0WKv9IbyRbWsqkUcFwg/9909FiwbMUh
 9z23hn9LWpObwju/IAXe8d+d01wARbLFVhuOJuQxqHhnc2UFOfb151mOb/17UEmpp6wJ6mTxPry
 CYM1gVOtD76aBaPmOCBr2xWQT8ZiT4W95JymeEN4n/LKVq4VCm0zR/0uJXXKmcNr/5eLSj2w3mP
 PwtcFc1vg3gAN9GNJ+edYRd5mjVWaoU1S423Pxu2VaGYW0VmgYsrn+TDouCJHI0Vo9tKU/M/Gag
 5cjwPHhILNVUOBZXTeeedQ1VPlzQ5f46gxYSftJCnqU4cfLMkIOjv3ITH0RzP1JDwGlzFeaGhKE
 tT2GvYxK9Eg4Uv63/RA==
X-Proofpoint-GUID: 587LDlVGJegizSmF7C38sKgrUt6DlXfn
X-Proofpoint-ORIG-GUID: 587LDlVGJegizSmF7C38sKgrUt6DlXfn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070217

On Wed, Jun 03, 2026 at 07:48:43PM +0530, Vishnu Reddy wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> On platforms where a hypervisor is present, all Secure Monitor Calls
> (SMC) are intercepted. For qcom_scm_pas_auth_and_reset(), the hypervisor
> registers a Shared Memory (SHM) bridge over the Peripheral Image Loader
> (PIL) memory region so that TrustZone (TZ) can access it, forwards the
> authentication SMC to TZ, and upon return maps the PIL region and
> triggers the co-processor bring-up sequence:
> 
> HLOS -> Hypervisor(SHM setup) -> TZ(auth) -> Hypervisor(map+reset) -> IRIS
> 
> On platforms without a hypervisor, Linux drives these steps directly.
> The SHM bridge infrastructure required for this is already upstream [1].
> 
> To isolate firmware memory in its own Input-Output Memory Management
> Unit (IOMMU) context, a dedicated stream ID (SID) is required, tied to
> the firmware function ID. This SID is specified via the iommu-map
> property in the device tree using the firmware function ID as the lookup
> key. A firmware device is created and mapped to this SID.
> 
> The presence of a SID mapped to the firmware device via iommu-map is
> used to detect whether a hypervisor is absent: when the firmware device
> has a SID mapped, Linux manages the IOMMU directly; when no SID is
> mapped, a hypervisor is assumed to be present and these steps are
> skipped.
> 
> Extend the Iris driver to support Secure Peripheral Authentication
> Service (PAS) on platforms where Linux manages the IOMMU, by creating
> the firmware context device and performing the necessary IOMMU mapping
> when the firmware device SID is present.
> 
> [1] https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380
> @oss.qualcomm.com/
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
>  drivers/media/platform/qcom/iris/iris_firmware.c | 73 ++++++++++++++++++++----
>  2 files changed, 67 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
