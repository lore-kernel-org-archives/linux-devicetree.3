Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26AD23E358
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039317; cv=none; b=Q1DUaY25pGHQno7kM97+hEMnesvFX7X7BC9iJxSyWLz2rC98L7FMVYZjETnnz8LlpIdxPptsmI6jKSyOtjB/Acm5M9E7XW+9/eyk7bYU4abnF7BHbd7WrMpgm72S1Y13xC1tJcDCj63rs4lCzDickSydK3ceUhDwIydpyAJMJTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039317; c=relaxed/simple;
	bh=JJVvs8EUaddgUJ9aXVzqVHjbQkgsNK68CrmK7RkmTJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKsPK70gCF/Fwr7vYNhVRt2YeMSTXXQZ2nvSxPzFwWq/hR1tjTFsMSUSB097ClCm8jfviN/JR/lzegSYu371QVG3kjBPKnx1UoHonOxlt01E7NllZ34svCA56NTADGClPS9vHhGOZ8Or07+B8+GRwvl0aqOLSfYoXHnHui3x400=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYoMJOgo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8Pr02zi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYoMJOgo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8Pr02zi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H5R0sn2975188
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ge/u/FoxPMtAYYqSHirTxFEl
	gHYs0GUb9O+1nJcyRys=; b=QYoMJOgoYozrIjeSBncJR/hfIYTkMgRtZKu5qLJs
	+XC5RQx2VqcM30rG84WKVK8vlBWLZbAvkR+XL5zZy/5nHpXagKt9AF4Vo60BLQBR
	8w2jzdIahHL5IKCvKMBlfT1h4HRxDALhIacbBcSZyUShSDW0WH8aBDECtjldAs9t
	HsQplNamxhnJrS8rviHXZZkaAC0gim7CIigQt4Who4/9dW51S0GoXT/pi3HIWjiI
	KZ2Ngvh6otsR5hvIepXk8OmQQHjlDnmnZfTtbQtI/SFVKCnZJSIxqLXHpJb/lb9u
	+8/dq12yT6B2RoVJt5YspVT7TGetIotsjxUQKhylgty0SA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcj5m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:35:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faf575af4so47242311cf.0
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 10:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779039314; x=1779644114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ge/u/FoxPMtAYYqSHirTxFElgHYs0GUb9O+1nJcyRys=;
        b=J8Pr02zi2rt/8b09zgqG/QB2VXpVsOPXAWVuonVBYSLROA8cRcbI8Grbm/y1CkGHnD
         WT2fhaoV+DqZnzCnNaRRB1mOC7ns9VrS7dJr1H16yECU4Me38JsRyeYYDlKObt/2g/qx
         VW2S4I9DYpiuBXKxALdXORsFmobf6s+C2z0ssPcAK3Qqn66rYJzynK3vkm8HorRqrLws
         9/FIQaC2KgbpDa+51ZQhWe7iy4XfHGAgs/KnQ/OR+jKY4i75lBHoU6L1aB9YL5GQoTRz
         3fwN3DUXTloIslLqWwaxUu0x9j3Z+QCvVhJVYdWVAyiGjLUYHhTgM6A36aYF0ALetrIA
         Ne0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779039314; x=1779644114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ge/u/FoxPMtAYYqSHirTxFElgHYs0GUb9O+1nJcyRys=;
        b=IE9MNTEqgG+NgF4pYtHnkCZjYNe0LIe8KPoe+Ji4t3AtKlyWE0Yngychngohc4qoRZ
         vPLtjxp0UPXcrbmyF+ZMZDfr8CPO0cQUvL/MLDvvbPm4o35iCYhx+4srNZaZG4331JIJ
         qnDc1+jfPj2y4Zwedz7HyfNVVCm/UgOXqe6HPbKy/nY5KDov0Qycq53GvqrB6YPU/o8P
         1+Eo/4Ky/WzmQzB1j84qFycf6Uk23n7SE1I9JE8rbUuKpdEn7jkkV0N0gVbrHih9soTc
         LKsmUmY/WoUuS2sEE4mdH3HIsKWZaQ6bkHcDSYuVHOlyewYe6aSh5bSspPNpXivfElbL
         kPXw==
X-Forwarded-Encrypted: i=1; AFNElJ+tP6tkUl7HtfCjj8YDiSiHpcVwKz4O1TRToktXwXOmZooIdzk3LzJp73lFL923Xl4BdJr5EqJzqGnS@vger.kernel.org
X-Gm-Message-State: AOJu0YyUUMOWpUMFufuQZCQiK9sVw+FxjY/NUEDh+FqF9J61r3/G9fgW
	Y2fVn8/40N2ns7vJ9cURbmni/rnGr5gEVzyNThhrFSoERIzVC+hNccbb+sJ3e/GP+kiRk7JOPeX
	IK4mKrvYCK+dW4LDrSfS1H6uXevtGDOT6f8/WgkDVwonx9Dh/B2lkBr5XzJP+bAkZ
X-Gm-Gg: Acq92OF9S2iUQdavxvht5xcvs4wg1AWLQrNSDPWdsbi9bwV3D69yyEQN0uCPg86Wutr
	iktL+7TpLTWbdzIjf7udap9yCjFlEmFFuC4TXCa9ZQc79SyYtPhBeAtmdisJURaew/zKZt7pwen
	FSsRDUYJRISgaFVd32oLctLnPV2VizEGGo6zagUlN9KahR66JbknIyZkK26b+0vttkR4x0ulaXN
	2TbEZHJClZ0uRjfFJyyjNbhQGEi066HH6LfIlVed9qLqg1zTXtD1z3C6oVdT5IoBjT8n6uBJs55
	VLwWpTq0IrhudDKYcjsjMc+A52vdRkIxTSlslmazL6jzdPH6xLVbD7JNgHcxa/SjmZs3EWmpBeR
	aJEkZmUOFAVo3x1AkV6PIgSKtxACMHKTjc7fFDia815MSUaVsKL2RvakkDljDijeIEqCN/iPiWQ
	BJgprzbVzIYsics4pdErrUnol9RgrvVXpJyjo=
X-Received: by 2002:a05:622a:28c:b0:512:e813:7ce8 with SMTP id d75a77b69052e-5165a2674admr179786921cf.54.1779039314147;
        Sun, 17 May 2026 10:35:14 -0700 (PDT)
X-Received: by 2002:a05:622a:28c:b0:512:e813:7ce8 with SMTP id d75a77b69052e-5165a2674admr179786551cf.54.1779039313601;
        Sun, 17 May 2026 10:35:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91e2b6d78sm2783884e87.82.2026.05.17.10.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:35:12 -0700 (PDT)
Date: Sun, 17 May 2026 20:35:09 +0300
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
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 06/14] media: iris: Add context bank hooks for
 platform specific initialization
Message-ID: <sqjbcmcy3wohzdiftb36i7ztfyt2k7mnxkrzxk5yuocpe7kfy6@ev2ouxxnf6cc>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-6-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-6-f6a99cb43a24@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4onoQIyjZhVBmnAsRPiOmDOIbL5RMq7p
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a09fc53 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=KYVELAUBrDEXRFeio5oA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 4onoQIyjZhVBmnAsRPiOmDOIbL5RMq7p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE4OSBTYWx0ZWRfX+UVDk5jDho+F
 aymEXuzHAdwelmXhZTlJFugzs5rIsq7557Xm6o3Ciw6sWbcDr94kNtsKjC3Jqq+BSEb7bk5bXkE
 n3IRsuSMhjosZUuM8cubs7RoGhLM0ddJHK3Ezv3jmNdaRRw0fOfg8BWdWWXBhtZ86dnO/vLqpYR
 7jw3Id3lEGEgVZj7MGfDHmvVut2xlWHyApT0JABdsAkq5/jPReBHhqMzxeetTAr1AsfQtbvGYBF
 yccVcVQTdgMc+hWZtKFdNFIek1k2j4mH0t8L8s+sSN4E7e2LRkQLIbfcWxTl9SZNRTysim1RS+7
 s+vsf2Xkn+Aa8Mewfu7LjrICLMu6gI4HRYa27+2CIiflKf4BfuddiNwzUwkdPHp31sHBQ2XjimG
 TkyS50LGo0bJxBqMlBfyMIX8YWUPhifdlwdvbrQNfAfswSqle3ZRmFMvM1HiZwY3j+JsmCfDhPZ
 9k1JF95GqCzFWbxY1mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170189

On Fri, May 15, 2026 at 04:51:21PM +0530, Vishnu Reddy wrote:
> The Glymur platform requires a dedicated firmware context bank device
> which is mapped to the firmware stream ID to load the firmware.

Why is it required on Glymur? Is it _only_ on Glymur?

> Add init and deinit hooks in the platform data for context bank setup.
> These hooks allow platform specific code to initialize and tear down
> context banks.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>  drivers/media/platform/qcom/iris/iris_probe.c      | 23 +++++++++++++++++++++-
>  2 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 6a108173be35..84fc68128c70 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -263,6 +263,8 @@ struct iris_platform_data {
>  	 */
>  	const struct iris_firmware_desc *firmware_desc;
>  
> +	int (*init_cb_devs)(struct iris_core *core);
> +	void (*deinit_cb_devs)(struct iris_core *core);

Why are they being added directly to iris_platform_data? Why not the
vpu_ops?

>  	const struct vpu_ops *vpu_ops;
>  	const struct icc_info *icc_tbl;
>  	unsigned int icc_tbl_size;

-- 
With best wishes
Dmitry
