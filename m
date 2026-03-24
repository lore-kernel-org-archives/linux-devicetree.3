Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714582EBB84
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385683; cv=none; b=d4TGX/YXMVVLzT5GS21uIaF+7orII5/5kBwwh7ec68Oh2cZoHY8GrmoOxBr/Pxyx3KL6ZcVoedrynZqmuVTGmlRiCXI4hiAyTOirk9X+8Gx9oiLvPEGuCc5h80e2hYjDk73yAASmm0iqYWHwzV9gcMGyA/j01sQcB6Xeilp+rOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385683; c=relaxed/simple;
	bh=EZuQ/8g6YWZCoKUpzFC9a5Nb+hr4OHN1aUvcb/qL3TU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulnx5F0wQwWD9nrTC3AIa8vehXUmcUYe335cijZ7J0SkFNG6oWBYn/+sKQzMl3iyrGMSeKlT6dnzbGqervIqbTijGcPl/vbHi/D69aNwkPL8h5/uhBhrIhosuEYKtOi227R8qF3xxXyi4yPhlB2EqCZ2Nn4cAPrQmHbICRYYfNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1isZc05; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d9Wan+Ut; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1isZc05";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d9Wan+Ut"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCiPX907753
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=50VLUiL9bVtwtrIh3VSsHw5X
	io8fks16aePcdvBS9IQ=; b=d1isZc05NQzc/kOyrP79Yc9iOEZSejZ2aQ7DaKIK
	uu+YzC5FkeiwoyZrFg2ngHl24WKc/66i1MXJ7O05UhJ23XRPL8UXZjVGZNS539ZO
	hOKxRjfcgog1/v3Dk4+fusd3ISw1ppGd2ZLXxu7tn15jOR3A8bvRruBp8FdYpEfO
	w1N7oXrDDMYdfo6orwQollQu7Xt/oamX/uZq3qWpXmK48NDuzOuzjRtG6bnvcZTT
	Nt8uoAiWlV71C5xb9zk2wVN/M/8qb2cjX5koAug0eUlIZWCIp5Pmyk006v2QnfkB
	AIg5Ss1PnLt/mqNd4m9HvpUaxKoMSip4lsCi6tXcFyz6uw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3ukm9nft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:54:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509070bda13so9752871cf.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774385681; x=1774990481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=50VLUiL9bVtwtrIh3VSsHw5Xio8fks16aePcdvBS9IQ=;
        b=d9Wan+UtUzVcjPlJHcqU63rkXSqDugz8p0fyLB9ekdhgDCdAUKiUYT5nA/+Doc7kUs
         vZaejeWb5gR9X+6qMRjQFStdPpegVQEP9Ba76pDL7m1zM0Ynb4OggkKWkl6aUb/hq1EM
         WF0mIKjamh+oBcmTYJb6yLAP7TutUBrxTiAFUqX9yQ0p4v6QOgfjj3rbIWOIzACvGxrc
         rqXPFy+BdtKOtPhDgSIIk8II/79dOxYJJ3eQr9J+lHKf6s/YiBmrd2Dj/S1i4edNmIMu
         PRe1vbuVA78+c1QhRqmIJD4fab9a8zvoHEQh8dj0Q6TvLVpHErIxPRTkMNz6GOU7b/5e
         h+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385681; x=1774990481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50VLUiL9bVtwtrIh3VSsHw5Xio8fks16aePcdvBS9IQ=;
        b=UcWUHBjfuycPv/qiCbiHpkityD+0Q7lQ73qqbIxXklABFFEBFS+p3pkvIkgT/mfL1g
         vnbHfFd2cIlmPKJnzJ2YNw5yrAGCfTOkDhjvoBUFBbkbS2Wg/Bgc/F7H5ZAV35elCtec
         wd//B/NfqtkqRy+FPicQmKbRpHRoubVjhrxCOb3tptQu2+wdRBD3q7rB8Wg+6fGdE96R
         YkUzWeJdk9+O90vXXtODQRJ6ENeYZPe1XGk+BQjKuVfk4t2ioi/rK3kTBocqCaVvNaLQ
         22KQWalPzDD4oigPY+7sQN06LNYcA4jVnQ3MjevzUyY6rVzZnFNB2V9QKFwTewhiw5R5
         hfRA==
X-Forwarded-Encrypted: i=1; AJvYcCXNGFfFtYofc81dklcOFeC3Ic0IyLA7wkjprWEVwxW0GEx/vYu5I/QlZtP/Ni9DtLaWGEc4r8wg1WXp@vger.kernel.org
X-Gm-Message-State: AOJu0YyTVDgTNS4+fCbEWZexYv/ISQBGvUbiCAy+ouTlyolO/Jik9W4b
	n1fqKr78bFszg4hciraOaxh7H/Ku6Nriv8tAbWX1bwKa60h8cLkB5+KXzKHt8knB9R77OSnoboy
	MfewCgOTbHdYksTdmOHpjMUOceJYO+YUXqjI1CSIWySxoHeY7D00E/Gdv2z4SnC8z
X-Gm-Gg: ATEYQzyn7mU+h70FFdcjINvznNURoPx14kTMg8m5J96uXaCuP0BUY5HZT8hDvg1WUyJ
	jf73dME7Lky6rQrN84sYW7sSl11C/JA9jDfF8tznLc7b4NMZIk63gM5OBoaN3IHr2ddY6JQrPVG
	wlFfCd8jdoMzNQ9qItm34o3j30scECyV2xcrvS4KHQijhFILcCvHpXSv/lRu0APmZae2QV/vhbL
	0CPeZqCoYJCehJJbKZdRyTvAk+IVnjzMkPFsGyivCwip7MASnF59r6QOELxSpHU1BkHQTvM7Tn9
	6++Et+b35pB8HDPBumZvWOsoq+LwAVoq2HSn5rZl/iPF88/6u+zH5e4/DQahTH8XvnL1eGUzQ9a
	7ja/btHXNTk4CwJRNOWU+7RzLT4MSERdzLMxVKP+OycUjrfiEHjvU2HRON/fZ0Vb7fiL5Z90QSM
	tU8i18ct7lIVA2PtoXne3trGFucfX74tuGo6k=
X-Received: by 2002:a05:622a:aa4f:10b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50b7fb0bf7fmr17687111cf.23.1774385680823;
        Tue, 24 Mar 2026 13:54:40 -0700 (PDT)
X-Received: by 2002:a05:622a:aa4f:10b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50b7fb0bf7fmr17686871cf.23.1774385680334;
        Tue, 24 Mar 2026 13:54:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2853055bbsm3400086e87.60.2026.03.24.13.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:54:39 -0700 (PDT)
Date: Tue, 24 Mar 2026 22:54:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 6/6] arm64: dts: qcom: sc7180: Add QSPI memory
 interconnect path
Message-ID: <xxylp75rlr2r62ehqxs5x7f2gy6gezbkuil3scrql6x5o5uowm@myb3riehntmu>
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-6-3efe59c1c119@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-spi-nor-v1-6-3efe59c1c119@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69c2fa11 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=OTc-gr1R00hQmjQXdA8A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: g1McrUcl5Wpz__axbIx0r3Yf1tj3_7pg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MSBTYWx0ZWRfX/qq+xyvys52n
 hmd2ZUOeXPZm/sTsE50wBS0I4ZLM/BIGnZG8asiy+knkC0lX4c8n+kS1+BHgsGRJy6rZf7KihJS
 FCq1gAn1akZnCXQI8eca3mQI7S6nyyclj414XwAH0TmCLN8utdzYtr4Fr8mBjIDM4IBteazUd0c
 2upmFm3RHjFTvNZUnUewWMbgUR6I9BVT+ciBK1RtEuz3ZTIeTu92dcOpjfpACJuaXEm8WLUBZPy
 jjkB7fuMjGX9LkVHfJ/tQG6duX6ugiNf+21APqs/FhYe9h0mmBzUrmWrPIV+nZ+O0WPSuIVUE73
 GF1bz2l9emb1QotbAcjw9SXVL5pBAGY5EvQSeBqnO1mUpb74bcLXC6Tzwm6erEHkaqYqx6ACx1H
 k99FU4PptCO3LkoJgNtHcakhDdaOMciZPJLxPcMdH5SS2qeWVn//zatw2q5LsX3th6SHvrOiNqV
 DESgbs2HtGfdZodhvXA==
X-Proofpoint-GUID: g1McrUcl5Wpz__axbIx0r3Yf1tj3_7pg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240161

On Tue, Mar 24, 2026 at 06:43:23PM +0530, Viken Dadhaniya wrote:
> Add the missing QSPI-to-memory interconnect path alongside the existing
> configuration path. Without this path, the interconnect framework cannot
> correctly vote for the bandwidth required by QSPI DMA data transfers.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 45b9864e3304..7093b39e1509 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2864,9 +2864,10 @@ qspi: spi@88dc000 {
>  			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
>  				 <&gcc GCC_QSPI_CORE_CLK>;
>  			clock-names = "iface", "core";
> -			interconnects = <&gem_noc MASTER_APPSS_PROC 0
> -					&config_noc SLAVE_QSPI_0 0>;
> -			interconnect-names = "qspi-config";
> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QSPI_0 0>,
> +					<&aggre1_noc MASTER_QSPI 0 &mc_virt SLAVE_EBI1 0>;

The same, please use QCOM_ICC_TAGs

> +			interconnect-names = "qspi-config",
> +					     "qspi-memory";
>  			power-domains = <&rpmhpd SC7180_CX>;
>  			operating-points-v2 = <&qspi_opp_table>;
>  			status = "disabled";
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
