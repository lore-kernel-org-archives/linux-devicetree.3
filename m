Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0092E7F25
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 00:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783385443; cv=none; b=gKuH3jgTRcleZ6rTeoL1yWD5iI8I2ybylZ2X7WKUBGI/qrxGND3eGMTK/zcfjcHiJ36rilce9yzUuJnWqKcnOCe5b6rZlZpclgvjwUjCQvseNOzs+48Q+esK+/9gZy6G1wWIKUzB88rN/0QfKAjWkRvNJj+H2AF95R1xUPLa3+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783385443; c=relaxed/simple;
	bh=WHXqkGv1+op9/RSasjwk83MuEuNNutgpJOBEdXbkio8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXJaUXKAoOIEqo8mQcw8fqLgRqi2xHZ1zgkvucMgcFbtdag7YAkOCwHg9I2PFeXa8M0Rrt2ca0XOZlDiFtotbRdTV4aa3rw846+ttMbWR95nkWfOdOdg57XpXlti0D11Lxn6cEPAc+NwtJX0apFE74EFJwko8qTdeyEWoZuu0eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eJTRIo88; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCv0yccC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eJTRIo88";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCv0yccC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEOVa1613953
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 00:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kbaBHhic6gIIK0cxoTZmQQiR
	L9kgLJaSC+bKDRff9ZM=; b=eJTRIo88ZURLWQ5Lyl9WzJI/vCIsL6m0r6me8kbU
	E6GGdQxMA9C2sXJtRQxlLfHdSaxhVMho6axkjBVn/D/ok6EG1VXKL2iuAtAk5hdT
	8rVUBU7dMOL7PMyJCqzDhdveUpN3UDz1Jx6fVCpQo4AK77kQy1vhNGPuUkhS6oxR
	c1ijkLM58/VN0muS1ZQhuxyqEXvwudTJ6PJB0y+xIRGzR9YzCVwyNlQcntYYXr0X
	An0I1a372TVuEtU/Gw87JbHDk/YN6Xx4iW+amI+o3Lzox1waLgHqJYMvF2P0ZTyQ
	wOQ+jJQdcf0xOVOA1PJBnEbT6MepevICsboXtqDd0oLIdw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h53uy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 00:50:40 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963b099b539so191502241.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 17:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783385439; x=1783990239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kbaBHhic6gIIK0cxoTZmQQiRL9kgLJaSC+bKDRff9ZM=;
        b=RCv0yccChR2Ymy8WCqksChat3HWkRQFVXO/unKBCJhvHLz5+tyL9k8mI2/c8Ehyjc/
         LuWcKAqHIT5+tnQ4USdHCiBbnMryHChVatvcvC0ASgSgL+g8bxs7WUt9MIaeDVViIYs4
         Pse4ReN02sqHqeFYS5IzseOAsf+Gm1RcZrSMFdewykBVIx1EQpeAOnsKEVMSIz9RnC5v
         V1dsnwPp2qu0GzlaNopVbmQ7JaRk28VspR6ltIUUCkBQRjY7kzCMoW7wqCbuaN8Esp6N
         SOmySE8DJkp7sA0MNcRlIjdoPjo6H0FlwVxkLXm5+FLJe1XmJgcWUTcyyTAmh6Ipd8Vc
         9dOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783385439; x=1783990239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbaBHhic6gIIK0cxoTZmQQiRL9kgLJaSC+bKDRff9ZM=;
        b=KE6E75kAiMU+oWPbN870fPj9tG+B7FWYTl1pmhkqLP8A10tqxdBsmXPuRJm7X4I4So
         95FYiYK3IsAEWugJrO6/RHaSZXpiVeHb75KvocqqQRnJ9SIkpAfg1qnO6PTv1JcRibHF
         1S9idphHO5yzG9GfmYUnsX+fjMa9TG9LdM4ztegCKF9xW4ijN0zYY/eA0RGjPWS/2pQG
         MhR7J369qCI/mR21zQoauJ9gzr9INLc5tOOnt9YLu1Hzu1P2J357ohuSq4i8smyJr/NC
         EXHPHCjTPQo4BvcpvEDGKUV2+Dy9kCSPN9yRE7mg868SGWwt4xCtI0hRneUsf1PkmUB4
         hJzg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1rZH1Ns/Zx4SGfPRSiTyD55YVWmWz4Kw0Btl6xXHSUskbBV4vF+DMU2XC5KqIrt9V58Y0eptJ5xZY@vger.kernel.org
X-Gm-Message-State: AOJu0YxdPs/Ql4s41fpLwvGHUHewrWrA7Lw+q4F7lFrkhIazyCEH5lMP
	YAXmEO4wJ0xHEwWY47g0busPMlyKUEcOjlASDW2CjZe9TZEOuJtgUvAmCyMYjgBW1YMzaHmDLs2
	RsQugFNFTzagEceVwtsGfPUe+XkAqWmRXaT+ra8hF2qpXQ1BrlgpSakW3HZQVjm4l
X-Gm-Gg: AfdE7ck1QCdKRVSRgAgQPDA5zeceQYwdvZAGB9Xdsiclr7MoavC7IyH0WUNbZIKAQt1
	L6kkcQntxrPyOLRVhAHfeGxh8XHc5Jpt+eTieajnswwe6pn32OQZyVGgyNHKZUEnHyhU0Gb5ek5
	LQkan4WYqIjz7rSK1+g4xSnPKSSqdHuoSTlkzJTZ5vB/xbnS3zJ5ZmQp9/BkdBHbB5t3Vh6wsZZ
	ecR9ONSq57AhKLrPLdunSRvZFslJR/tstFCIS6V53t9yk/+Lbiia6RFMxioRUOgFv0Lgvcz9HrO
	6fUGybcuazNEQ6J1D4KOvJVUGlroBiPzljtSLDouRoGWyAHiU8x0kGjTlSJBo3rCRpSL/UdSRMc
	W6sj9fa4gn6ebp2bNdpTWfzeMQMSTr24+D7NCn9WQInT1Qm6fn3RsgGy200EMZtfVP/bVGghtcP
	JgeelcFmSA3G4g2kEjNNhn7CJu
X-Received: by 2002:a05:6102:3244:20b0:738:9c72:58ce with SMTP id ada2fe7eead31-744c238cfb9mr307044137.12.1783385439564;
        Mon, 06 Jul 2026 17:50:39 -0700 (PDT)
X-Received: by 2002:a05:6102:3244:20b0:738:9c72:58ce with SMTP id ada2fe7eead31-744c238cfb9mr307026137.12.1783385439176;
        Mon, 06 Jul 2026 17:50:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13770a1sm3261848e87.20.2026.07.06.17.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 17:50:36 -0700 (PDT)
Date: Tue, 7 Jul 2026 03:50:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: esteuwu@proton.me
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 6/8] phy: qcom: qmp-combo: Drop qmp_v4_calibrate_dp_phy
Message-ID: <jnfko7lrdlda6qqc3453c4kjmmh62e5vd5pcj2icbnvu737wi5@qttiawd4vjrc>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-6-37e2ee8df9da@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-sm8450-qol-v1-6-37e2ee8df9da@proton.me>
X-Proofpoint-GUID: zIRlMiprMQ7GH3PBFwHLWjQ-WnYA805e
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDAwNSBTYWx0ZWRfX+A78P2QQvetn
 f32yDFQbql4DEE0d6JGxIhA9eCU6LJkR8x5/xceX+THxvQCUb49TkQW9WLZ+BIwmqdmUQE/FiKF
 TExDLHXNZhKNWjfLPBQ2BbMbEf8XZoo=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4c4d60 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=0gM5omY_zckdEeGsnHYA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDAwNSBTYWx0ZWRfXy9IWmA8dDfhX
 Slg2dgkx2ChQpSqYdAf4m1dgPY7pLUfIPST17xi7g9OuldEttM4hsGOBp6usBNoqmW2OK6678df
 9GMZJ/GaZNuL7bs32XjBojL4qAmNpSDP8KpBgQ/VkNLbLM1pg2RBmEdS2BCi7kO8kViw2aiAn0e
 umB6yqtvW3HqWf5/QfF23R2m4Xv3ENyKXzBNte0risgiGEcMK9X/PfdvdE/msHddeVj5NnSEDAl
 1p339zh1XE1q7UiSkSSh1EUKUqL+ni2Z+OyllFr++ogNHWH6TBZxZrVpgwO8pNx7/cVlBa9f8jD
 CcnzQDbecBbiXOlR+RbA/G0n/L9jorKSz/rwqOLvIRbA5M4FgrB7QY9X7Avz7TVm8fgFCDWcQil
 mmLRwq8aSrP4ZlBY0M73eQYn/1UTnvhZNY1dHOX37Ept9e0GervTp/9Iq6rknfWHcTayTGa0Ioj
 vPlyAvyWMQ6pQOTUR8g==
X-Proofpoint-ORIG-GUID: zIRlMiprMQ7GH3PBFwHLWjQ-WnYA805e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070005

On Mon, Jun 22, 2026 at 08:54:27PM -0400, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> There are no downstream device trees that specify five values in the
> qcom,aux-cfg1-settings array.
> Plus, after cross referencing both downstream device trees and entries
> which refer this function, only 0x13 is specified.
> Since 0x13 is written at initialization time, drop this function as a
> whole, and remove now unused variable assignations.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 31 -------------------------------
>  1 file changed, 31 deletions(-)
> 

Indeed, 10nm and 14nm PHYs used several AUX CFG1 values for calibration.
PHYs starting from 7nm don't use this calibration.

Fixes: aff188feb5e1 ("phy: qcom-qmp: add support for sm8250-usb3-dp phy")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
