Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228C93E8685
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776178711; cv=none; b=LfusFqGypwpS6EugnacwWmBl/CGmpldnH8fH5E0+2HSh4lQJ47Vf3eQT7gMMiIbsICx0zNDw00vNGTVUdvwQ0CYlOO7asETxRG7EEsuYg8VInCoHS9ZMh0CXuy/HZ3foq4vsDayQV1ev1JyVPhRjr/nLKH6D8s6eAu0R2efvDVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776178711; c=relaxed/simple;
	bh=i1Csr8ki+y8cyROepemokKn/ngdpl0aL4/C6QWLBpto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jncFB6BWM4RQO1X5wmyyrDQzRC7fr5SXmqkLemay/GRugZh10QUGld9xfsfOsfGEe1b7Rb+ta8q9OZV3Xk8Glpv4XnvlFEtTKH39NctZ30TQ+1pZXWdZqcoC5WHfLcGW6k/qjpql5t6kxko0coL/eIXN3gp6gy4JIfZPx/6fo/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NxGN6TGb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8b5V2B6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NxGN6TGb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8b5V2B6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBImHa363173
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tkoSZb3kvTNlmZwPdIvijyts
	raxI/vhZjNBxJnA5UZI=; b=NxGN6TGbHvZAjSwkDzGILJ/R5FCJy3KP8MW4WmRW
	TsD7mkNyxyCcYVy4OEBVkdJqrUiFzIoRjGuOU8QGxuxk7n4PtlWIR72yKmmDmlWs
	m6uK7zlrP9DTa/bccYj18y0K8SyPrxL2u/+MC2Ysy+Nn+7LYXY8dFAeq8u2ipkZG
	O1WWMgwUJSwXbGRxp64MPCcPPNeB7mSRNzleL8gvQIf99ZGY4VpQsRfbtLFfZPXO
	jVZZ9v6WcxRuoVCI7smxN1RthA1HAhdNVcF8eSSLmv6WC2AYi5U+AWfNGFY/3D6K
	vB4HeXYN6TrTeZCJWYA3EVFAcYp9LLMo8G/0AxGyk+0a/A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870u87s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:58:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50dd17a71f6so72524161cf.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 07:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776178708; x=1776783508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tkoSZb3kvTNlmZwPdIvijytsraxI/vhZjNBxJnA5UZI=;
        b=J8b5V2B61JQtQC6yPspuORBGciqVp2JAWVp/RvJ57MjD9QJUUH7WmgrnpEH/ghY+XZ
         cpdnzc5JG8Vi6/DfsbKTyMUiPvd33CkPKXwmhefJvlrrZHH0OCYP857FV/J7KACwIL3t
         YfS0+rhFNPzk1+JZUTES92Xw5/e+tV2NQGTYhSxwuo3PAyoykrHGrsn8Bf8iy4hRTa7t
         PW9KsZ45phcTfCuemkS229U2dqt3KvUWJEBCF+GEsju/yiKQolm9ZEHO/mJJcpZZ4h4c
         o76ca9lx6Z4GbGD2nV8NGH7vjMf78qK7r5l6LK0ffyr/8MzTLPbjpOxj9/R1+DSUZ9tA
         yTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776178708; x=1776783508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkoSZb3kvTNlmZwPdIvijytsraxI/vhZjNBxJnA5UZI=;
        b=p+Dei0IxcyVVQTJKod3qafXFvHjxjKmbuDOiUAGxiXaPWyoUqZL8xohtDw3FBBSlBH
         50Zk/Q3UsTHMq4dLm/ekQQP04oZuFroC05dfvX+s6NvppR//6TOi39Jx5JxV5GhSmgHS
         TCCmGACJjIS/KwG1YpI5gj+uf7GK/NXVvR/bcFnxErRa/Y38Cvoltlq4uHI03Ube8qwk
         o0hUMUkPtXK6P8yQzpCacGbFouJrcLJnzkwSUstNNXGCCKqQYS220fKA2xCQ4GddhQgi
         SDQF21JV3pMY/wdw4LgEjnt0sRu17YRtSPUMoHVqqq6Z0yVnmOx5snRlNZrNiXKi6uSW
         uqeg==
X-Forwarded-Encrypted: i=1; AFNElJ9gbEnrHCdwQo6GccBNeZBJVW3If+/Uky9rqIRbaZYOQy8csPLMOzsfUDyvoXGlUEH+01ugUgqJ0R8s@vger.kernel.org
X-Gm-Message-State: AOJu0YwV0FshvhOWbODQgvsCx50T81neXkWDoqHY6pIUdx+eBMUEHJoU
	McmCvOyatSHRfiGKB3I81r1GqAo/7MzaansvcKr1I3FF8BeuDRoE33dvcTdpg2J/X4lqY2swBX4
	fSf9YNW+TMRl4/usDxjPtns3v4cBUmvFSoeCfQGOhZvreZ2wZq9u3on0Zimnu62vW
X-Gm-Gg: AeBDiesA/iMgL+gbvOw6jSxsxCADrdKt26+QkhGUikIYfjBHlECCtvHBsWXAA00rmdw
	J0O6mT/5L/eDgCQ02LVrah14xWdLXlY3f57N1laDCRWWaMOo3YEAvn9DELYtCFF7LVfgBvOYZ25
	h2JbuYzYc0CXrSPu8asRjHmWggKbP5W/bGWkBSd63NX9RHhU8JRM7KSrPyEFB2VxiQ2A9ZoYH83
	c8sYTfzABVhEnpX2BAIgOPaQXSuK7/XmIO7NJtYHzBFQOGKvFArd/h3AhhvH0cvDVmSadYNp+pM
	1UC81uMxihiGM0xZ+oo9IFpWd1EaOCL2Yema53jr/HESmcMVUkUbFsIgdkBpzGc1MvnChz8XZet
	1/hTf9wORx35ud+XqTVc3qDTXSA3/gr1tLtib172o8K8IgWU3SihZK6v3LE+qhFGF02wwBVRwgK
	pWR2O3fbYmy9xg0PVMfGt6IE/H4/YqaQcn55+NprySegBb0w==
X-Received: by 2002:a05:622a:130c:b0:50d:a8f5:fa94 with SMTP id d75a77b69052e-50dc1acd87emr301738251cf.21.1776178708442;
        Tue, 14 Apr 2026 07:58:28 -0700 (PDT)
X-Received: by 2002:a05:622a:130c:b0:50d:a8f5:fa94 with SMTP id d75a77b69052e-50dc1acd87emr301737861cf.21.1776178707976;
        Tue, 14 Apr 2026 07:58:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49545b48sm28069341fa.22.2026.04.14.07.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 07:58:26 -0700 (PDT)
Date: Tue, 14 Apr 2026 17:58:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 0/4] Enable audio over HDMI and
Message-ID: <eeqwsvie5j4b52ufbxy6bfddlgsw5fswbcx2omzwi2ik7hdzhr@ku4ga7eeklaa>
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=C9vZDwP+ c=1 sm=1 tr=0 ts=69de5615 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=ZbuxZ4Ij7ejS0DuN_rYA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0MCBTYWx0ZWRfX9x4Xotu0N1of
 ljCMMWmsNoPcQlhkQBKgH4AhZlvAx+C1ZyASZGekU66sD3PSPLkOCR0tTp9DQ+Yldw2OZ2ZO6Cu
 T4rNlr29fPQe2xw+3djmREYCJXrMNP4ObZfGky4pTvcWC8r5PaaZ/s2ysKQvsL1Pg8oi9S+hs91
 UaL8CYZXYFAMz21vJa1HmE/W0cQg/P7uGMgRWBrLm9PpK4qxsIHo/4d3jdT1EBcKqaC5eaUPNq7
 bQtFw2+FSRHfHnqdFiUZB7n+OWBB1jUh+qY68Stt55ojTQGiFEZMaZ5G2/UTUcAtgfzHCUBei1n
 aG6vmJimbpvEqvMop6P65ZL/8kYB+zZ08WRtVeCEu19QLqPpwdtfs318OHgumbqse0oX0Dmehvs
 yG6l4NAbZRs0ZuMkN4/xm+gYb3vzc78lK0BAvuZLnBRapOcgfr7P/fJePjP56K+TorT8ez1HxzY
 ar0oGKIrVcGvlX0o4cg==
X-Proofpoint-GUID: U0F7wierhSRKnTS-mpN8jia9LGHZB81S
X-Proofpoint-ORIG-GUID: U0F7wierhSRKnTS-mpN8jia9LGHZB81S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140140

On Mon, Apr 13, 2026 at 02:19:33AM -0700, Kumar Anurag wrote:
> This series adds the dt and driver changes for enabling 
> audio over HDMI and Displayport. 

Do we need topology changes or UCM changes for these to work?

> 
> Kumar Anurag (4):
>   arm64: dts: qcom: Enable secondary mi2s
>   arm64: dts: qcom: qcs6490: Enable DP audio
>   ASoC: qcom: q6dsp: Update bit format support for secondary i2s
>   ASoC: qcom: sc8280xp: don't force S16_LE in hw_params fixup
> 
>  arch/arm64/boot/dts/qcom/kodiak.dtsi         |  5 ++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 59 ++++++++++++++++++++
>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c     |  7 ++-
>  sound/soc/qcom/sc8280xp.c                    |  2 -
>  4 files changed, 69 insertions(+), 4 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
