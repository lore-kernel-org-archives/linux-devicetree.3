Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484B443030A
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 22:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783376614; cv=none; b=TBirXvuf/LjWeDEarBlNjW2RZ9pGdhu0KrLne7imf/gF9/Tx+52sIPCsdqom7XyBRFbk3kHgwjEahyXhtigIWUH/uMdwUAQ1F1SzkKfoXRhmNdOo3nWHu8R2BI2R8bw+0D8Q1qvCDQ6d7zFAWqK9R7mXqculL2gh9lNKn7mVJHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783376614; c=relaxed/simple;
	bh=an1W5Mo0/xOtBBJU+PkEQmauIy3QAIV1aElRv70z4cY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdRrUyuzGb6a80NgNk575klBWU5q2DO6In7k+FGkRYPyHMuTZwBgJ6N32VaGYKS5MzAMs9im7UYzSmexQrZCdh2AKGnDzht+bov2e4CAxp7uJPkPJWk4dKO/SSZwq5thGO+HDgkoN97cc2eeSqQAUKbIEC+TggvdWtLyBVirjsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cgSK9Zar; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eRXA0AzE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cgSK9Zar";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eRXA0AzE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KE8lw1654907
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 22:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WaWa4MGfpSWu+L1vhHqpxj3K
	PWIdAgUllBsZqFOfmBc=; b=cgSK9ZaruPNrvWg45rTPSYJSJ8Dc3RHumZCRnjOK
	NWnu9BNkdVFvmhjtJE0lr2KMhV3K3FS2H3UWrrlOes/jZbpTWoVSK+7CQE+ZkEyB
	X9FuO7DgCt79QhhUiDI63AEYK6YH0y3ZIBhByuw8a1S/16ieeFh9DvJ5FmAnBbdX
	8NaX9xNzjALX25XL+rQWFDXRcOTnvPnOW+8h3NymVxY6mDYsgBxJ+8MpdOn1/mzZ
	yP7+iktuSg45691PNUAl7KPBHod6Ija6bHExpwZHYu5AcHFH/vMQBv1NQlXiWO+f
	bNKRCpazyauYqKT5BRdYbUg53iatMT0J1ArsC62QEY1oHw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpk7nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 22:23:28 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73883529f72so3832504137.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783376607; x=1783981407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WaWa4MGfpSWu+L1vhHqpxj3KPWIdAgUllBsZqFOfmBc=;
        b=eRXA0AzEE1J7Ej2zpDcZQoRHvgvhkH08qVz6Ugi8ofh7iNNfw/UgrWDr6WdxqaZBHj
         TWE4G7bpKqw3zvtlAHcWp+GCVg6QCtd8IVEH5MjIjG3U4RIYE8WQqg4BPrXr7LpqfOUz
         Y/HHMo8sWP3F1Sveo7V6julHnMWITrRoQl/ArCFoKSkIdt0IzR2nQ1ZTpci0b4UTI2O2
         9pmYn+mFeb0JXLM8j/2K3Ulfual7pL0efmuAc379knM8XSmgsvNgFz2+n+XsVfooyd21
         FmqPhI4XJhJnICvaBe/mvUpUbFTM9HPyX8/Gv+ZXUnsBbIzKapkc3D+CUkxFCGG4zYio
         mT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783376607; x=1783981407;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WaWa4MGfpSWu+L1vhHqpxj3KPWIdAgUllBsZqFOfmBc=;
        b=TKx+Ju6yd6kJkKzYvvXv0UMORzxa3GfXPGiBR7wQjWIzAwghV/6Lcg6H5UrnMKe7+t
         ccY9JDJOZFA7+VSIYxlM/8kSxP322wc1u60qla/57Msp8OQ4i4sEmdP1W8AgznvHylIZ
         gkJRzjAoeOXOd7wQ+vI7LHgZz6vFXSQF4CLIqgEi2SW5TqYpMJd6xujTkn3LMgAHNFCp
         xGQttThsrQqbYS8golyOtSl2zSUeFgUzcwFNOY37gTCDoXDnFkFbLw1bRnv+iranYrFa
         m8ZTJQ555/ifz2GSoUjNXKJkpXgcrbaCbYJMBHjGE41Al74nOU5lttVRHkQUeG78tOQj
         w4dw==
X-Forwarded-Encrypted: i=1; AHgh+RpRdrg5co9Fs8SF/QV30IsSeEwFiPsKUbKtC+H9kIGaEQ2x1dqXqDM6lb5Mc6ou+OoQ+K6rnjOEWeGX@vger.kernel.org
X-Gm-Message-State: AOJu0YxSgcb/7r342ijgF/DAeuuv/eoYxA1cYEHK98Q+NFclBwYpUj8j
	GPNj7x38c3Z/xBl+0wsCam6vEWAIeJQ3NY3SsPzcQs0nyGUCZGmslg/7hevsnpop66dfFeOAjTl
	3nOBidP/aF+0D6WITpNIoNeMzcfoKRFdRPKnb0kQmRbFyXKyNBm2CeyWXxqrtWkGd
X-Gm-Gg: AfdE7clME9DuWqPkKT/ZZT6WX9DZRvO7IjTxay4FjTzdjQQA9PU5InvEMNTsUoQNiMV
	xIV7+quqx9ECIGscC68e1ph7dOkgvtLOu+Uu5a0AhN58P7lS2158IMcTsQCuCmhfhltbEha6hGI
	wiaN/qKrlDKrxxfuBd3xmHj8a8rdKBKXGydutfDH1qfUetyo1xmC3n5+dPzYihuEjINkL3821yg
	OXSoXS9b2IMkJe4DF13Pp3GMof/bLrtycj4VZn7YMz/s4rw0JcPR8BnUnSjX7g3Zq1Wt3yjGXXx
	QhiLzni3sKycVefHITaKpaIaPBwRh/bqPzwHP0gHtHqZq/ElvdXXe1BUqvzgtsKqYrriTHQgiiX
	8W08U+Q8XcK4j6C5tHf+Dc8Df+LR++OHWP41vn/PV99yAa6SV0f9Kndb1T79gKRm0B8bGSKnoOl
	0R4yOGYCQfp3njicvmKM0/jKLk
X-Received: by 2002:a05:6102:5091:b0:736:e4c0:cddf with SMTP id ada2fe7eead31-744b7b30a40mr1244157137.6.1783376606598;
        Mon, 06 Jul 2026 15:23:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:736:e4c0:cddf with SMTP id ada2fe7eead31-744b7b30a40mr1244139137.6.1783376605954;
        Mon, 06 Jul 2026 15:23:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13839bbsm3177862e87.35.2026.07.06.15.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 15:23:24 -0700 (PDT)
Date: Tue, 7 Jul 2026 01:23:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH 8/8] arm64: dts: qcom: eliza-mtp: Enable Adreno A722 GPU
Message-ID: <clfy5lvz7vm3ogw7pvyyidiujqcjxftx55p67szwgc6ivsq6r6@xrrcbfdkqkjo>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-8-c9f1354dbd29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-eliza-gpu-v1-8-c9f1354dbd29@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4c2ae0 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: mvCx2LotfhS1aW-MEwAwNgscII1ynXO_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIyNiBTYWx0ZWRfX46oG0cFhJWCk
 PucG2RD2G6mIsvR3ObFwc9TJidReQDXxVn8+Zf6dc+1ycDE4dMdG85pTu1a1nNeBN/FhqsSm0VE
 gXfNW0F+ljanM/Rr7JkFGR0EZkCBZ4D23U6vHtK/VIbClwr/DFwTBGhIYq7zEi6CZ+s01pUbut6
 AkDMzuAkKVC3QBX7y1vbJMvwaDLN349QTvHJ3QxFJKDWDdxTqFq/Pmmxfs6BAkCZ5DHpsKFsToL
 NzzshsU79My+ObOD2vfiRvDM8SozlCAIQZmse1lgZBeP7QHsXqFPiGu6v/DaJMIZMX2rUpx6tk6
 Y+ZPruFdigC5OD6pk34Q02MD1NrQoeMBgw7qYK1OY8Hb4v0AI1UlSEJz7HAa7bdVfypPLYzQzh+
 h8wTw/16iKyXBmLpDnr5IsP4cxhQJsvXYZupWA6tCk3QQdSm+Un93/QkWj+ah3lUexlAQnWrwQz
 LCtj8fIaoaq7fK5HZtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIyNiBTYWx0ZWRfXz+Gyq7CpWe0f
 7Pba6sMQNNBMC0kRczC6iieX3Gp4tYxjSP09WWBEFjJb0ts1ehwoDpKqSHabvLXVgNhUQvBj+1D
 MyLo618Gz/N+jZ64wRy65VtfwpS5Z8Y=
X-Proofpoint-GUID: mvCx2LotfhS1aW-MEwAwNgscII1ynXO_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060226

On Sun, Jul 05, 2026 at 01:44:23PM +0530, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> 
> Enable the Adreno A722 GPU on the Eliza MTP board and provide the zap
> shader firmware path.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> index 1374afd9d14e..b280d8e845b1 100644
> --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> @@ -417,6 +417,14 @@ vreg_l7k: ldo7 {
>  	};
>  };
>  
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/eliza/gen70e00_zap.mbn";

Should it be gen71700_zap.mbn?

> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> 
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry
