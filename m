Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5E53644A1
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730542; cv=none; b=ZJsr2/VQPNaXoIxI9+xAYx9vfSGrF2UfPgGYFeXRhkiZZ4W7ifJCcZDT5OxiXJ5NePBxztiXBBt3In9OCd2Y0nr83DeUqHZ4nRx8MlA3h1GJK0ZlV06t2F3xC3NdGZhze8AEVNf/+q3t0PltbXhVdpL4FqXDfRs1iEVueIu7EEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730542; c=relaxed/simple;
	bh=lIBETdguojxD/3hcidUjQKcTFlkGNY5+j8vydzjjxho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moiq7Rulc3MuU+aVMXNZNlCy54fZI/HwQnuHU4H2t8Sh3I+bGVGm5BQ05gSA6y0+LTFd3Tu1/JKhQiSgFZ9t88w4gfSEu3AfjwzmJZOntUsVgrZp7c2wOGGCt2Qtv8bIVAdtUi0DGSu/ZPjANf//wITadTSYca7AFnu32GhknlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o9Gqrv45; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EIds3/Mt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o9Gqrv45";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EIds3/Mt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT3cC2646942
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Db4jdjnSqHZXgefBgI/pneBX
	20fscU+O//6vunreTmg=; b=o9Gqrv45XXFyco6x2BDWTwmHC8tL1CeiMgVwKaBa
	Pnnwg6hL0YHeXy1HmiWpM40KNhIXNwhyjZTXembYjwkq40TvmNdoJgpnVdtjo03S
	GKhGTs+5iaCZpbB825PAauYb6d+T7/UGMKIYikgPwnXMgrWBcJxvJNMo9En+bNpY
	ZZhmKKhtsfDrdauW8xKHqJxtn8z8J8i1ockLHzVIggdrExdgiLfpfC0SpCP6Uxcf
	2BvMGjn7Oej85aOf2QwJ3epyTyyn9Zlv4nVN0GjCZ51OYn90zPexm0j3c8Ig81mv
	MA+q1Cu889ay+goCd9jIzWIBV4Qv9jPiCES1nJgyhTERgw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trwaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:55:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4f27f49bso121795985a.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 03:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782730539; x=1783335339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Db4jdjnSqHZXgefBgI/pneBX20fscU+O//6vunreTmg=;
        b=EIds3/MtetH2pvl9QHtoEtb3HqMbp84HK0SnEts0SIAJH0y5gzcPOqjI/zo0jTKa9C
         D+Z+7EjPYNkyE5PfZ+5uHaV105pKQEvQZj04rwZRvfqzqS4EcgubN7FcW6MZSvsbMPlh
         i8XDc6tF5StScLa5zxPZgEZgCLeFLROdRO4Z5Ppyd9uaDOT09KLO4RSZ+2VeSMvxJdfQ
         WI+ei7RAsjA/HGzaDyLkcxruSpkXwBy2p4EbQ6FHrc+uHPL/Fkmhw8du1BTc226tEJS2
         asvCOZW+7y4Fu0AnEp0zhMUkrToeGuvBJKXmVXc77SRk3hGTS8RvuaLQDZbTV/4ULel5
         O6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730539; x=1783335339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Db4jdjnSqHZXgefBgI/pneBX20fscU+O//6vunreTmg=;
        b=d4py1WMU14vSaQqZhsR8VX788A4+vPWBp2+hrGri6I8iETCbRwC0vPJl92PdxOvapo
         be295BEeFZfLyPIDOq0koMLvNqkuoRu2zz6wuVKSPKixqK6QkG7oJCEYDoJu6zUIgrmj
         fyjm6vP2mRz8jiqiMjZA6FdheYYVMz6gs3V2g5HPFJMWmkEJXtewd7fn+S7w3SYLdZR8
         WKMmIEM6aF4JcXZoR3K45uFq1ZulQh6XzVFhELgxjMrFQVcpfRak67wDvQMKUWHy0cPU
         jXlEU8OhWNSjbdWjZ2Na1WVy4daKcILNLsd2G/v/F2/jWX5Z1lELI6Z3XPH5WnOZY57+
         T5FQ==
X-Forwarded-Encrypted: i=1; AFNElJ9mVKDwPAVBsKleKD65laabyB1oTwDQpdQL3t3ilz1J8A+e6tRIUAhYlSFKFp7TYTt9QbVdx+VImMyj@vger.kernel.org
X-Gm-Message-State: AOJu0YyO6QMmvzISrDwSIB+k9aoGHCBTyV2QG9PSD/yGCkIAn/a8NR6Y
	CAqK38xEFgIJ2Kt2fMssLpL/bFNBQUBQTtEJdG8OF7sETam9Iud/xfTNH7Swk3xJqi1QdQty5mA
	QC8EYS8NQhZ49MV2V9v709jyNBmCZRAZ6SC9naRjumEfYKznyKZPdXL78l/yb+QJH
X-Gm-Gg: AfdE7cla+7q5emD+cCS1OJ0FUVAYFyldiU9IZro20RLKMcWQA1Dv8eXXjdEDDuoZiOJ
	obDeuUOAUJilTjq9fHOoOGMTdyzKu+1BgjxeTHi7bBqSoxq1dMykHusm75qwU/kNWdICNVAW9zT
	sdmFV7wh00pqZOowq4SDQZbde+j2QpQ3eMXf+QbZXFs21O51z5YCVKCSVPablD7/35xEZ7al+ST
	wVu6ejDS8SNcTV4qPSjCWRI3a4J4ZhlyGNzIAlP1gP4A/Lp7b+PjLM8ffeOARdWY2T+hB087T/U
	dta0xtmayo2EblXqQwGzALvAD9hQV3Dbx60ZzNQ2LPDDRy0zR4nuf/dmA5RPZruFp4yAKxxENTp
	GmRJ7KJHayvaJy8HjQs8pehfztnJd7eK78gltVFsSULsbHfoclgyvaUKyX2gLKHcDy3HkezPPIa
	yr1W/Hfc5gxTLImNCkUsaeWndt
X-Received: by 2002:a05:620a:4625:b0:915:9fba:8794 with SMTP id af79cd13be357-92b3b100986mr1468650185a.6.1782730539461;
        Mon, 29 Jun 2026 03:55:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4625:b0:915:9fba:8794 with SMTP id af79cd13be357-92b3b100986mr1468646885a.6.1782730539022;
        Mon, 29 Jun 2026 03:55:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aeaf86e52asm1836247e87.18.2026.06.29.03.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:55:37 -0700 (PDT)
Date: Mon, 29 Jun 2026 13:55:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: purwa-iot-evk: Add Embedded
 controller node
Message-ID: <poam3wo7qr5m2xmnicptfz4dpkacfqqmr7b2vxvqifwykpn5k5@tkypv7epffmd>
References: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
 <20260629-ec_support_for_purwa_evk-v1-2-e082b70138d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-ec_support_for_purwa_evk-v1-2-e082b70138d6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfXxN7++H7dLFeC
 et1LofSmFSxiEWDM5aMw46OuskntX9+ZqW1HwGTo745UED99bmmskqzBAYABZwBeeFijgCqvVNa
 XFBmmsMyf7LYjwawLR0Ul2wEonRcWqkAA8qO8c1Y5DOmwy6j4UhliVT3nhnJmv9IOP9HAtdC81y
 2bn/+rwb6g+5susEjfEXyTZaD3XYk/cokZBBK11lM6wVE+PaiKpV53wI2yO0WPQBza3cnDTdvCq
 tGK6eYiLXECahL2GWkpOJGCx8ZlG9bG5ldj9omrwpUSETobpLC223D1G1jClGnA0/K478A7sz18
 K5oJsYtpbOTFipTkhiLA2TD/l44aheX07A0XfViNNlVJxXo5/lIHoSDpkgPsHtlbZ3eMHa2KWeY
 4O+zw9EjE5Y6SDzzTLDgR8HEZDQvgC2lyxBThOLdxP624+Gge4d9zg9FHigUQazEn4L43ZkqkMB
 2dBtglj6XzWdlqYWhOA==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a424f2c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=7wtgjnKuI7ixzQLi8VAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX4jXGiW7sFlWi
 xkPjEECxnkSMXwrpIZhIp+8Xad5MnAZ+aXnO+OnPh84mnxrUZJXxtbDYDEtRPmGwBTkhCDYk9/y
 O9M4jZVw8T0r8Z42J46esnx4EsLsanU=
X-Proofpoint-ORIG-GUID: JC8GpUFrQ42OGgqYbJdvgyKEtEOWUsW5
X-Proofpoint-GUID: JC8GpUFrQ42OGgqYbJdvgyKEtEOWUsW5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290088

On Mon, Jun 29, 2026 at 04:10:18PM +0530, Anvesh Jain P wrote:
> Add embedded controller node for Purwa IOT EVK boards which adds fan
> control, temperature sensors, access to EC internal state changes and
> suspend entry/exit notifications to the EC.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
