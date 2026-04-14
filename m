Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4826F3E92AA
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 15:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776180026; cv=none; b=sdPFhu7kuHkwamB9uPg2xtKUa7DYNoBzpEhtY+H/gpzLkbj9vaKf+m8DLWbgIMv8rGzCrEk2RZOvLIhpaI9Of6Ol2DmZ7TvsI7iNfr8TJ94pDmoDCIIU4n1g68cMiU/09FYjgU4Jg1tzKttzU6z807QMqQkoVOclqkgALc68T7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776180026; c=relaxed/simple;
	bh=ZVhgbifAln2OzcbNbG8e+t48xa3IPnq3A4MkqBC2ucc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYdkvhmorYe/I8BZ7Xs3IougSjmWQxqTtETkwFpwtvgdUnyT1w+ybiUi9bzQFT3w+fmW+i7MrInhyjz/IyJ4iuBUnY/4iUKivUUcjN1nbQ3VYWpyNQ7cUX+9zs6bQ7F5gj7eQOIv/J/qzcHyTj2X4IEgLBz5gFJKzs3YwZ1pqx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GXyQm6dq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnCQLQ0R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXyQm6dq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnCQLQ0R"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBhnPE395647
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 15:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eRyLpOe3BxkDfC/79y4mRDy2
	zo6Mqv/lVSOI/jQ5RBo=; b=GXyQm6dqs3c2KrXG0JeQqKuLblcaKvc25vRLgpdB
	p/hDom/XzWvcBuES8/K4MQjLNzj55AUP15ebX7HSketu3jDDHJIotKgl/BH1UeKW
	IQFDj0Hn1xo04LEqA9ZbEHtSCOiq9JOFTfH/kKLj7zcyBf3hHiZWEanwLIxB8GG3
	I+5kY46iJPqpYoX8PYicVau1UDbgvRWEg2R01CDOjkrp3IZhAkcbCkqyD7nPDJpc
	ZTZmm/ZD2LQVbND8jAlkpcwHqHLSY2k3SQznb2YAtXS7OK/i5Km0OmlgTJ+59Mz/
	pURjQBAanOS+FhWWG9dhijMCSmCxzjOE6/LiKekIYcw7CA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870ua1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 15:20:24 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-610503b660bso1462154137.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 08:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776180023; x=1776784823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eRyLpOe3BxkDfC/79y4mRDy2zo6Mqv/lVSOI/jQ5RBo=;
        b=RnCQLQ0Rv1+QmUntSt5hd1ns0o6FnDGOdMSOgML+n6+gPL+XHRTajgQOBjrsXb22g7
         F3xDCoxW5gw2uQMwaRtBnqcCTNWn/jY07UU6gRr79+ElVc6ctEQzxcnT+K9BBtxLZJGC
         n89JQVNLzos72qsTV7eRfLE0eyYc0r/Fgzk0A133Fl+kcj1U5VX+sGkGoEUYUrIgtXY6
         Pd+L708lqmq6y4uV1Pt4Pdv+Fc19plTHwA7o+cKFoCQYuXBYDuFSVTv+V61794sv4Bw6
         WqJHU23HprBWBpij7x7AvGhqMFF0E7p7GMrgBLIyv6QoSrypYXtTpXOyotZNjFR+wUTz
         /+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776180023; x=1776784823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRyLpOe3BxkDfC/79y4mRDy2zo6Mqv/lVSOI/jQ5RBo=;
        b=RbEkpSCNDOeJOe+RnpJeyz8vozqVPZw03WNOuYrnyKDYIqvY7pGIZ17o9MAY5XinC2
         yKLCSMgkff5a34tTBLPFx8DYGaUZhsC8TxK8vTNjyvnimJMlf1xoQhnk42S6tAeJU1ko
         GbtkWL59AX7JQDLrTMO961UcwaPtX2HU9qThOu5pyhqTSw26nlikrFx4+XwLCb0OzkRr
         oaYgS9iG7P96wzVhnzQYVzbbe/syAU1ruCAqdVw7Qngd9cID3Gvfz3tpjrWkQTYap/3l
         22XLB8HOyygq0zUECdpdZd1vgE2RMDS4DHVIkQbxsUbA/iPIZ4uRMNAmYeEUihBGbeBl
         5Xww==
X-Forwarded-Encrypted: i=1; AFNElJ9TqxZPr1U/y1tufhuClpSDOLESDaEzyOPyu/oGOOEPEXWjhemiFadkIyGKEyT/RXo6rKq7HK2S/KO9@vger.kernel.org
X-Gm-Message-State: AOJu0YwVCV55e9TWFpzvehTgaduV2dNXYVoMz407rxIn4j3C3jqEYERg
	5Xc82Pi7rj6YXQkvqHIawMqxclmoqNDHAC+bQC6+oYNNmLhhVLlzTMsmIdtMxG1nRYZwGuENl4r
	4fuTu8/+Fw3mCIQyhfcEbrykvpXM/b/adVWfzKE3/+DUH3BnBFUZuIJPJeI+FZrM/
X-Gm-Gg: AeBDiesOwGFOxAsQu40iQX58bysWB8hJGCj+nHjR5I4KeT1JYEw/JQk+wwgKTKbYCrC
	Il/zzGXXJbSALxihxo5ruLOkkw+Y3GA5Abuy0rSeq/aYb0JJDDo56wrPeuyZQ01Q1hcVXqz4E5L
	JfzxyNwl2IWaKqXeNztJtCL151vlHyOW3oQF62FGxhaltkA2jbKvYs+76/6D4u8sCrIqHJLkZFk
	iHVi7Lc4ovJLTihW1GE6SURIjvjI5s2OeCQOFBNnazPkn74D5yf91eb3Por9MxODHf2V7Wtb0/0
	RmH1UF0M6pQaUhZ3AqNf0nkb0SnlWY9sVfgInGVL5sRP5isWZaCoQgZWQMqG+N/fYzAgKzKM6Rd
	NhWdxih/EcYV4tpLmlxEG4tEaNJj4CgATuDjzDtKEfgyLCA9sOQtsKr7ltRqEklkQoyuUQZW9gN
	l3xkzt02GV4JIL+jWZfHCuTYiLP0qtGPN7OIQMQUcVpgbbIA==
X-Received: by 2002:a05:6102:5e8b:b0:608:759a:53bc with SMTP id ada2fe7eead31-609fb5713bdmr6999562137.0.1776180023367;
        Tue, 14 Apr 2026 08:20:23 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8b:b0:608:759a:53bc with SMTP id ada2fe7eead31-609fb5713bdmr6999473137.0.1776180022703;
        Tue, 14 Apr 2026 08:20:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8657esm3314870e87.12.2026.04.14.08.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 08:20:21 -0700 (PDT)
Date: Tue, 14 Apr 2026 18:20:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        stable@vger.kernel.org
Subject: Re: [PATCH 06/11] media: iris: Fix VM count passed to firmware
Message-ID: <otikvdonnfakykra57z4fingdyfm7xebw2h3lmykzk6sbk7emq@xptiwpx5lvjl>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: bg2oI5HSuW-oLVpKe8LLqhs-E2OmkqW5
X-Proofpoint-GUID: bg2oI5HSuW-oLVpKe8LLqhs-E2OmkqW5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0NCBTYWx0ZWRfXxtOcZQtC7+Vc
 572oAYc3iKNyfvxXFHrddW0q2cUpHKTj3Oyegl0DH/Ik08x3dlHHBfwIcBw31So3D9lJ923gmUx
 IWpQBC1OOhbvXQYWl0mOWtjf2Mh3sB1mLoT8jvvbu6+J+MNTUcPiC0LHx1CgwxmE+3vYF5P6Uui
 jyFeHQ/xaQ1bDduJVY/HCNOZU9cEzeuKYUYDLd1MGZPAgbaspTWlzoBdJ0SagqFKQf3/ixR6b4q
 u63gJYNUvUKUVjWtuKZqb0ByF4ocn5rWIrmGDT4DCYUymmS2UFNIaKMBNo9gios33IlCg4dwBf6
 VKZ7UdtJtddMt5Ljd4DHeeMlmLiEnAmlmzAEGPp77DH4/pHONm/KyLpbuyyf2dthlIr4gpiwrNZ
 7A+toChWgfUYIx/PxHntPwlZStUinzgO9go66gWMYISOYSc9sySKEAM9bV50/EXbQ16GbbOu7UZ
 CrkOBLtllIFLl6aOWQQ==
X-Authority-Analysis: v=2.4 cv=MK9QXsZl c=1 sm=1 tr=0 ts=69de5b38 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oTq01oph0ifE-MoszjAA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140144

On Tue, Apr 14, 2026 at 10:30:02AM +0530, Vishnu Reddy wrote:
> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
> the number of virtual machines (VMs) and internally adds 1 to it. Writing

Does this apply to Glymur only or to other platforms too?

> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
> remove this write to leave the register at its reset value of 0. This does
> not affect other platforms as only Glymur firmware uses this register,
> earlier platform firmwares ignore it.
> 
> Fixes: abf5bac63f68a ("media: iris: implement the boot sequence of the firmware")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 548e5f1727fd..bfd1e762c38e 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -78,7 +78,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
>  	iris_vpu_setup_ucregion_memory_map(core);
>  
>  	writel(ctrl_init, core->reg_base + CTRL_INIT);
> -	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
>  
>  	while (!ctrl_status && count < max_tries) {
>  		ctrl_status = readl(core->reg_base + CTRL_STATUS);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
