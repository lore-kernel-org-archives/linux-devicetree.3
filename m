Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2932E228D
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 19:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776194836; cv=none; b=MaNuphT/PhSvNCmSWBtxpsztAOc+B5wIfBVLp5RZv1ShBo+m1lDDu7TScMq+OsY+NZ434VWNzb3TtzOYkKNz1fHWJ3epKzxaRZ2BZh2Xev7JYWg3vfMQBOrLIjMCywNJ5gptqdSn/N+XxRsFKjMfYTdWRc5QGmWDS2wM+Ho3r1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776194836; c=relaxed/simple;
	bh=HIxYCzzwdBgIIgcddlq2kTcmNf7WFHQffDvd/3eoxAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCWJiNSjmImZYcckTocaLw/jmngdnrVzlrX30i43du0bqNrWQcjqe/uVgMYLmuFabDGc6Q4/jHta23+St5SSUkis9kOOopJO+fPG8HxcgqqD8zaTWKo/9BMcQJMGE5qeyEMsEAHeVDEpXWxSVvaXxJ33Kso2lrQ0EiQgLutFjaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l6AfA2/R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MTRsoGkX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l6AfA2/R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MTRsoGkX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EG3Tk0966180
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 19:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RoJV5yRb42H7Wx3oSKEa1Xz8
	MaF0ZY9VJkqL/VP1l88=; b=l6AfA2/RuDvL8DMDwNTXzJ1F8ERMizpydS8tAZv0
	RJFW+4K8S/INQ8XFSVc8fKS/jcI3cinKROir0uB4NWZKNg3eNh93dp15EDzABRzY
	IzIuRzWPsBZ2+jyd2VxxnjjntcYsoSBwJg6cYQ99AimfYPq8ZM0p04xSe+yCzy4U
	Q0iia4Gg62U/Sv8TD1NSfe7JXVwccAsxQiiVjhyyew/eWNghJbcHM82dEuJT3Ps5
	cifPRiYnK04zoLg3LNeLpUiA4rNt0+53BsHGt5k62cDPQNdQNGimvN4mFuUCrsL6
	9Dgo6zvXDafPcRgEsTrdUY8+r/Gbmen1IUTa930DgPVWrw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrs1rssy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 19:27:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d6bf346adso112696541cf.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 12:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776194834; x=1776799634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RoJV5yRb42H7Wx3oSKEa1Xz8MaF0ZY9VJkqL/VP1l88=;
        b=MTRsoGkXXkYthuy9nBYSbkC2kHU7jsll+YdCLjTsADmJ5C4DclaJjx0Y2ritTloGSA
         qPQv++IAJut9Td9mpxklJx4FaKNHHlulrcL5CDcvf/rQ858NcgAudMmFTlaIHf+uSQfz
         T63jkLJfHpYq14VuLC0e8Wzexsd7aNcL5s8w8CAB54LLZ+NgZStYMQMYMFW1KGw7ijSO
         RTBB2fx+t7oz52njjMHrHAoJhKdO+aRtcB6gTE9Q2tGv/l9Ur+GAh1lx6m54buHndMq0
         j2aly4Uu/bRzbK5zo1PWZg0DtVkONxzxOzVVgwE0wP6qoKIH5YOsGntDizuiVSa+Xxsu
         UP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776194834; x=1776799634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoJV5yRb42H7Wx3oSKEa1Xz8MaF0ZY9VJkqL/VP1l88=;
        b=SLH4LNF7G7LX0raiATd7ZMzF4KPQDQAnIhjUyL99YYeddfLW9zYNE7k2xUCV9jeay/
         PFXYODiLEa1l5TLyerwfCN6I0kAg0lC3J/GlHJR1RCGcIjcXDK9/TnVMr+FPLvFsWG/0
         2QGZjzM0wHpcPgcg1iXaBiF6wz8q7gQCebFc36ZcV/8W3C38h4YlbioSBQn2LaICWJqJ
         xjwsy9Izwo7JIi4LyroSUW5/8KzMfkFaNhtNYS88bnrDKZf8Dz16vPTCQhVPIB9dgJFm
         I0Wogzf5XTesschySzPYDGz148G+acuCzDpQjMq+fNlHqq2mH5i0dLAnc2zK9WAQUWF5
         rUsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gvXJoMVXtlFnvUQb4E9WsmDeT42ecdSe5HhNWrwqV64d/FvtQMCqSyjbaFo8xdEeS31VTRq8RDLiO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4rNJD6VE24DNsj2o9AIx33qmaKwCbeymi7DVMIW7gQLy21FW5
	BCkuvybXY3xgKphNxfXRlKijzK8Yq5USPlyj6EZktsSWDKPALr/dLXTodrxo3QJOI5cNaXNSLOT
	H1eV2EmWZSuF5Wy3PuJv1UPIJfhaUBgk2Qr9O1ghBf/uRAinBj4ZSUYAaPlGsoy+K
X-Gm-Gg: AeBDiesN/tze6n/QbVaBMv72fidrd3kkDQF2SgDwW5c+iHQX0QDEp4WKIqPgtirwE3s
	syPRfcoKF+4OXg8hFU637BLGkQFNGzXxzrffA0wQzDXszzfRORc23gfvLqfiXngzOtJtb2m4MP9
	s9r3iUewpxBbp9idcINts/CXgr39YKGJeNoNjmUYB/AU9CI+kdSL42MRWEEXlfiFaDTOtbARw8C
	I7AiIlBNgWNTv5dMt7ZhyEn0QOsK2f3QHrjbg9K/MlOLVqBGDu0tFS0WCZiBGeLFFXgXX2/tTam
	DzWOPCZo3uYNJOC7vjaSvEw2FuSB4mttZ8E853lPq1PtB2oOnfNhe5J93WkqqjHBP2qV8wL2gft
	ydgoCqu1bvCHNxeIRgkvIUnS1X+wB8T5v9zHVfigpTF/vUS+laoSvZTZhiD1ABbKslymalOycDX
	JWFk6swm5nSbEEZjv91PF2LCOwFNkl8MNuwJfSwh4RLE+e0g==
X-Received: by 2002:a05:622a:181b:b0:50d:9b4a:e6f with SMTP id d75a77b69052e-50dd5a91b71mr264673291cf.1.1776194833670;
        Tue, 14 Apr 2026 12:27:13 -0700 (PDT)
X-Received: by 2002:a05:622a:181b:b0:50d:9b4a:e6f with SMTP id d75a77b69052e-50dd5a91b71mr264672631cf.1.1776194833080;
        Tue, 14 Apr 2026 12:27:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eec42ca0sm3530179e87.0.2026.04.14.12.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 12:27:12 -0700 (PDT)
Date: Tue, 14 Apr 2026 22:27:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] pmdomain: qcom: rpmhpd: Add power domains for Nord
 SoC
Message-ID: <2fue4vclozesm4d55id35eutqi7jxomwoc2fd76k4yfjvx7doy@3lfukpmsvoy2>
References: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
 <20260414035909.652992-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414035909.652992-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE4MSBTYWx0ZWRfX1t2oZxm6ZniW
 wZfU4DvoE3n8fG9smDLixRLRKyKviAF6pP2onSdefMrE6xLZfCg+KB60UfZUwUHPtvABlWpC/zV
 reoaqUXiaV7FJyMv4Fotsin4Aue9pSqD9l6Y9p1mmm/GPQqAnESNNJrNKJziNspMESpYxf529oV
 rTufXaBHjJBapgkyEoKs/sXbVqGOwUIkeOH3cKKoEyQZMex6JBrDoUeYcpwMirkIGkQV+2W7nwg
 OxRT99FJaz2lEDt8k4hHFKtfJkkRjQJQE1OVJHfpM/JOk2iTPToYhGD8UFjsUi5/Tt2m06mFpGQ
 8fe7IxbkCgbw48ySb2CWkYsRan8TDtCTeHihIiH8NVO4gsQqwgKcpz8k/TNqTrxZREdEUjO34yC
 qCoOUQDQiRFwOl2nfP4ikv2N9jW/4D8IpwFGPjESnCKS2jfuOA7WzIT34SzxqWANAFb0Fxm0bHP
 8s97RZOBaKyEBF5dBXg==
X-Authority-Analysis: v=2.4 cv=T5m8ifKQ c=1 sm=1 tr=0 ts=69de9512 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=JNP-2SwAGeoVs9V6pf4A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: cciQ7Ye-5Q7wriDqNuTCSPsopJEkep12
X-Proofpoint-ORIG-GUID: cciQ7Ye-5Q7wriDqNuTCSPsopJEkep12
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140181

On Tue, Apr 14, 2026 at 11:59:09AM +0800, Shawn Guo wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> Add RPMh power domains required for Nord SoC.  This includes
> new definitions for power domains supplying GFX1 and NSP3 subsystem.
> 
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 35 ++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
