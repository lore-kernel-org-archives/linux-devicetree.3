Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871A6367B85
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 23:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785886696; cv=none; b=CiX71GJJ5qjI82s+sc6SwVXCNlOP8QbfUC20gWBoPbhpuIl1GzpsBhqc9NmOJAcCgC2x9xGX3IWsL3kz4UInscVq47nr4jiy0boU9dBwpNNSwpIDwwxf+N6On9Hen8CymReqRdg3Js4NyKf5Nv2Ohu9LcoYO8/euzfBk0e3n8sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785886696; c=relaxed/simple;
	bh=FunpkaXtNrX8UEfuOjGUq+jQa3LfT2f4TXRe05piSuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIICghzQvqbHrPTifIK6mAyvEPUMLtL01V72qoRRla0YwKBgg+3bR/rmAFOmDIHZvTrKgRinhQezOV6fRkmtSl3LvI5iEC7gi/5mdYZI0Efb4utmI2w3dDC4HI1lBdDI9nLb+8b/scEn/jKQlaHZopTUMko7mA0GYLqnwzsjmmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtfKplyQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WQwWFnF/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtfKplyQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WQwWFnF/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674NGilt1090112
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 23:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tCK3SPQ5zchCrYz2NKkSth5I
	odtFQPccsfX2kI83AMI=; b=mtfKplyQITFzqsT8gyatEHQFQypJkOTxkJyZH9Vr
	EXpZygOHC45PxKrUA1Zr4I+OHatWhvffLnhT5sivFXGC+BVsIHyVCn82oceSG20D
	1SZ7/Q5fMzReMtdyhviNyec2ZJVFZBJ2R+Sm/7/8j1jw3gRxJO+xU34iw66FI/uZ
	RUm9tTz/iuJ/VOtRfQiow/MHWa3tMm3kVm3SGYKOCnyPi33Ym5YWzp6OczzZJcGS
	gL68lRi+yNAZDzBKmGI3MygEitEXfCLbbn3lOXSmuRKq1r+1h3QxTEvRWyENvwoo
	grZDCfmd+vJk43cEIeoTa9mscDy4BHDn8Km+r0SIr/gswQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3nsjub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 23:38:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bff5c7035so5893311cf.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 16:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785886694; x=1786491494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tCK3SPQ5zchCrYz2NKkSth5IodtFQPccsfX2kI83AMI=;
        b=WQwWFnF/NGM1Frg0w4rexSgFaHOvnaPMi3atZNWZqZAQEXj0qC2YrhKQaUaGSBT51n
         5d1Q1Cz5RmYzivPrc6gyIQXONcKHYDer+Xq78QP0LPDBFJU5kVn0qJYNurfTMmLfZqOQ
         PYwZezTRARsZvdvMYl7J9fHKgTzi9UzP7C0V+hle1tI/+/mzrrFVR0o14OjBvwzB8whn
         tjBhIh0W4Wx95twaJmbpEAQCuG3F1RVQJK24b8LnR5w3kAt4L9hqUp8G3ZLcdoB+XnHI
         CxZh0KpnOeSzeKZd+BotDxoeTjboQ71b/l08MgJQpQ6BODx3igFL7wdgAK19vaSGep+i
         9uHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785886694; x=1786491494;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tCK3SPQ5zchCrYz2NKkSth5IodtFQPccsfX2kI83AMI=;
        b=RjyOrO/bF1E9fcHXS0Ct87YPfVp881UceQ3m29VbXN82mCohDKcY3MmlVeOZ3l4BT0
         5NJf9j0ORNI3wMPxI1teuvPB+z2xE423pBc1coJkDPtfWQrDUZetzw5AAOZp7y+8KXo4
         Z++PRuWUM2sOTN7EuqRlCTbH8kTi2faDm3D82oNpOr9NiHNaY3iE8FtLjRLj4RV5XA4H
         9VWdrpca5P0YWcl78DzT898Xeh7leEotFuG4N7T9RnDitFRk1sHOEsHTH2jcvxUQImxq
         WVFF5wrWYAeCeaFsh0L/iyZcHWxCzlw7eutIjbxW/dgl+gLvcrS9MlIS4uTQ+gsgabKF
         e0gw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1oRvmTOaWVS5x+BGmYjyvik7Wm09+hBRk98HEuzZyH3Uy1zyOaY2EfT1MElBMYbZEk7N11jmP9vM9@vger.kernel.org
X-Gm-Message-State: AOJu0YwKvlrjucgPn553qy272wjJnOGpmEzt77UDVPYvUXZ6qp42MK/z
	6uiHKM7PHBq5MMdTKfLwnZliKrR/1PsaKy8wKIfCpG1ym0dEpx6paR8bUZWb3iIA1FWYWOh0fwZ
	8gy1yngm7W0ktoXGqYPCuLLh9dw1YNGSf7Aa02DgK9n+sAlWieWkgvwWc4Mo3oszW
X-Gm-Gg: AR+sD12VLw9OOAJ9LoQ7s9Owou8LQpD/l4afNJpGWaOTiRYNhoNMru4kVZRfEvtcWA+
	mSNe9o9Wccv29TKgRvzW7gq0fz49wq86NLUys9d1FPBbLKpgxLfhnDuLOVflhUg/KvZHto7PFmk
	ljwqCeIowWFEaekc2oVJX+dYy2JoIqMl9I8GHtTgBW43LjU0wxW5BKGgoMnDhAFGTck/NQdOnV9
	Ulam8C6Zh1H+9ZebpgFJ0K4R0Bq8PEd7tCWq8StYphM02ZDOescQv2MCpae5ww26XPhGxFMHXen
	vLrVuyynrYbyTcTNUk77CPPdBxJQgOUBSAKq9MK/oyG3DQOi58nS2i7j+t3zSA+PtH9rkXr42yf
	x0tbP/xXrU/1wAkGGUBNpnpE2ctM8OO2cl99sdSUwCs0G5drufB7Ma8bavznzSjOJIKV68eUdAq
	kOdRzuofs8xHj0JA==
X-Received: by 2002:a05:622a:1f97:b0:51c:e6a:1b5a with SMTP id d75a77b69052e-52ce5fd907cmr36957721cf.12.1785886692513;
        Tue, 04 Aug 2026 16:38:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1f97:b0:51c:e6a:1b5a with SMTP id d75a77b69052e-52ce5fd907cmr36956931cf.12.1785886691570;
        Tue, 04 Aug 2026 16:38:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fb98eeb78sm3134401fa.14.2026.08.04.16.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 16:38:10 -0700 (PDT)
Date: Wed, 5 Aug 2026 02:38:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: esteuwu@proton.me
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 2/2] phy: qcom: qmp-combo: Add SM8475 support
Message-ID: <ikg6rz34bs2exae2ew6zrsnvpb4lsno6ugym3e3uxkiv7gi3ah@wogybp7c2uu7>
References: <20260804-sm8475-bup-usbss-v3-0-9a5b9ebf62de@proton.me>
 <20260804-sm8475-bup-usbss-v3-2-9a5b9ebf62de@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-sm8475-bup-usbss-v3-2-9a5b9ebf62de@proton.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE5MiBTYWx0ZWRfXzK6LrLeUQ0PK
 5nEEKdi/7DWaSw8QbtrPcnZdbOuSyYf472496NWCYfVUqGhI4JI5+9ambhcqbWw3adohVRg0hDU
 UWMvNwNJa+RlWc7fraWZt2g/LJkC7+dbqBQnSjYwimcugKGrHDplDx+U0/lwWH3NixnuFHINCcf
 98iANZcXGC6vg5DRRhxssNy2JTrisxQIw7DHMuUhp8cE54HXiEuZL5CTb9h7azbm1xKjrSsf1Cd
 mvShgEx3vcpad11QIthVnFosZm0B/mKtoAb9u+VGmWzhuOee2LY3Cgz44TobD0xZWvoJi2YkDTH
 CqAIu8UU3/+6FvjM2F65Ejl9JawFergScwY6RMtG80hXxCWXHI/pBd0mHrIKCdnWjEAItuBFvjm
 rKcDlJJo8rucwzq9aT/FfdF8atqYNAXtey+C2J0l8nNSFK1jKfYDX9z/8sSqn/TFVYA8DDrumsn
 Rj5oPAvc7juc5WONWJw==
X-Authority-Analysis: v=2.4 cv=AZqB2XXG c=1 sm=1 tr=0 ts=6a7277e6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=0cGqrpNjlybS6BQeJRMA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: v7xVNLYxUUsnjILjq2fBj7dRiplEx4_Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE5MiBTYWx0ZWRfX4UNtkG7QwMT1
 58AduBAOphFYGi5AdJFiVgfMOgjUrIDWU/RufbLR6rHkawwZI5Qer9SfRAjq14dC18/ifWwkpjj
 eRT8HXODONVdmCTUpL4F1GDdMwA9wSs=
X-Proofpoint-GUID: v7xVNLYxUUsnjILjq2fBj7dRiplEx4_Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_06,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040192

On Tue, Aug 04, 2026 at 02:06:20PM -0400, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Has been tested with the following capabilities:
> - USB Type-C at 10Gb/s
> - DP Alt Mode, using HBR2
> - USB Type-C at 480Mb/s + DP Alt Mode, using HBR2
> 
> RX and PCS USB tables had to be added, while serdes, TX and PCS tables were
> reused from other SoCs.
> 
> Some SoCs such as SAR2130P, SM7550, SM7635 and SM8475 use 4nm-v1 PLLs.
> For SM8475, trying to use qmp_v6_dp_serdes_tbl structs (which are for
> 4nm-v1.1 PLLs) causes link training to fail because of ref clock
> differences, which in turn makes these structs differ.
> Add structs for v1 PLLs as well.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 169 ++++++++++++++++++++++++++++++
>  1 file changed, 169 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
