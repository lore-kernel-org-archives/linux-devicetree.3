Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC963C342B
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 18:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776449591; cv=none; b=HqfEaXOtFlYLRa7uIx606n79ajDd2X3Sgp0ikLN3k/Umyf2cOrX2X7vnzYUsP9PFn8bK4ff/h9zvkB3bAUZaLCNzIqQ9TESfIY6ukqxn/upGUyqxRElyVFLcu/cpm2ojsanyh67eFjEaCfGiD9ygpLCiGFPA6ls2XAczoV2x2g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776449591; c=relaxed/simple;
	bh=5LrPG2h15eGXxjkOxde4AqxHBBlTskH/i7tWWkEAgxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hB8OPD1j+iEoz3Yeu2JsLWS6PVDC7JxU27XUMtxE742QW18NCiLZSp+Hevmtd69sgtgDy5+tE0Bl6HltWFgTkfB+qRE88O9n6Ig7ERGyWaQfly4ULdaxWRnj5fgQrsqLg13jt8ZivCMgtokxTbruqUnmj2lpaeEheN3P/kSS+A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XL5U/iE9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Skim6amV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XL5U/iE9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Skim6amV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HGMPws3190155
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 18:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X3YW+27284v+29VnXaboK489
	5T39NFY/w+2gzkPSCeY=; b=XL5U/iE9rvs2MCQi7/WE5s3SAt/27IFDADSJ2W6d
	c7vFInXtGB8bac8jQFDy60XtvtSpsPSsFINeSBQYBivWGLuvztGir1wzzvakT0nZ
	dPLShhztnOUhXOs55FUS9w3zwVH8egpYtzYaflvf0AT9hPPPn+/VlLS12q+OAUbg
	vSK4mD9CyCorj6qTLfzEn4mYsrz/z5vybA+TCWhGoOEcdmOS10qsyhBWuKT1vlr7
	Z4BrCQ1FwJLDwsIF5KMdKFoxXynEF9uVQvPo35cYdZdyyK5MOlg+pyn14ZD34MiS
	qfsLPclcyaLh7Psea6Jb2wao+iTERnW/+3ETNC0bWO5Fcw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkravgbsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 18:12:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b44f7b7bbso23367831cf.3
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 11:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776449573; x=1777054373; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X3YW+27284v+29VnXaboK4895T39NFY/w+2gzkPSCeY=;
        b=Skim6amVI9ADeZuOmr/vEPONkERuZnvCYGuSZ+fsmkS5yBdNiGd3d65SIbpq4NGwbg
         IgTIESQJ63133K1Lth9Ak4gyKjLwVI4L9EjxomOdrS8W3pBiwEljHR4lnNDXklumLwtI
         /Rp0h+g7sVk5Jn2eqZXjirpPR+I/TGw+0hAkxduOHVokUjuFB9548SOWSh2Ys59i/5Ig
         2Eyb/sx8cjHINfmv2phKQyBpOU86+4ZjshYuh01MY50pdxqOf6oIbjBTFlgPSYMmD5x9
         RgH8F3NkyGWEhNFaoDsR/MePCdkSfIlDs8MeRs+R3V5VAUQubBH9XqtvgTfKidlxMPBL
         rXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776449573; x=1777054373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3YW+27284v+29VnXaboK4895T39NFY/w+2gzkPSCeY=;
        b=N9q7exBMBtDlezs0vERPZKBEW7rP6xy8qKRldwmWZYYoySH+XgbCl8g+ym/La99XJ0
         eblKKgUK1/vByNU4b2wiJA0eYTTUVZhIqFwy6B8+uYwgHv0l3Aie4krIMPiPfvT33jcc
         XM5C8+rx22eAJVOUagfNzPXMPPSVvtBZkpU/wij9VTpd1n2RGo/6XAtZdYw4kHmYusnI
         L8ULzrIQ26rvMe8lOhZCdx7tKpdDp58Hu+tXl+lWHj3ejVI2znwLfPhuqHMddBSKLkj6
         4J91F5pEGu21W5O+1aMXgS5tILKHZkr3AH8zmNq7q0xJIuG7tWW/pXQHqcnndxQ1GoKr
         vXDw==
X-Forwarded-Encrypted: i=1; AFNElJ8jTnxIxZJVDYbmZZ3AMD2qtqdCSjJYHovf7fXdTQjZ7zU7gwTittoNz9F3RrGQHKe8ewu92lfSPUZw@vger.kernel.org
X-Gm-Message-State: AOJu0YyEXxlfjgzOGvernrQbOGXatWBdNZrpFpoHXNI7U5XOBQZ05RcU
	7Ed/lDv5cSnjSIkFyg5xEp3rzPsQUzwV4WkK5fupedRFYJlmw9Xvwa5owE7/ZwQVjh8IRzqvlmB
	4be4fk7dUn1l6/9a+ggzVvVCzzgOQ3DjmSDjFALfgPKubEe3nMFH+tO8pzgJPPgwo
X-Gm-Gg: AeBDietNOLcG/5LD8+CQZd+P7v0iLXgB2GK10XQnYXJ74kB3i771gtkUzMhho48obJ/
	/kOmgLpBts/20H/q04A9DGpLLwYYM3udtSRuKdm4QK1MfCUgh/s70ciM4FIrRljOHEh7+nsN87g
	W45pWoSvCAc8mgJHLECXREsTnR1g//8/n/06Y+MpoYGp+stQutSWQWQJ3f9VQni3g/HF4qWc2Yt
	ggMbrfBd3pb0jTqjkEJBk2XL8ymyhHJHQHoaWsQF/64f/SMGeW7Hj+mbhTs0St/lyfaY1ciEVlF
	gtYddhv5AG1/Xlb8T3DmWIQF2KkSPJ3RyuRAUC2SXvAKlQ3Nvwi/axFd1lqMW9cAEQNImCthKcz
	o15kS50MuIqPkuRyG+p5l3HuWhW1yg2RHhQwIocNgGJKo3uBd4lWc/GcmYtVItjVfQTXB0nnBEx
	gaXtivSAE04p8Kqsn+niItDa7upYHIuk+kMRCvh73ysOVpWA==
X-Received: by 2002:a05:622a:245:b0:50b:445a:4139 with SMTP id d75a77b69052e-50e36ebf0f5mr55681141cf.54.1776449572878;
        Fri, 17 Apr 2026 11:12:52 -0700 (PDT)
X-Received: by 2002:a05:622a:245:b0:50b:445a:4139 with SMTP id d75a77b69052e-50e36ebf0f5mr55680511cf.54.1776449572378;
        Fri, 17 Apr 2026 11:12:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec0c2sm595987e87.82.2026.04.17.11.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 11:12:51 -0700 (PDT)
Date: Fri, 17 Apr 2026 21:12:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sdm630: assign adsp_mem region to
 ADSP FastRPC node
Message-ID: <hsvyzibkggicvmxucwxjnss6moloujk4qk5h4ivxrzcv6ziejk@nnzx6lon3jca>
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-4-03b475b29554@mainlining.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-4-03b475b29554@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE4MyBTYWx0ZWRfXy1zr8ygMfgcn
 YadSpGgaD7paE6p1HuPgtmOhdnXhNcZqBShmnWETSbS8Z0Zthj0KO5lkss3G0Bowg4+LfkfSWoq
 dRsE7sUYGFAuCCNXJmOpP6LF+zz6EOQiEpcO0HaRv6VKj79IMchEVQky8FRL6F2FGRDIeeIj7tH
 h3GXpKX8ykj8snXLMJCmzVet8v1cc9m7ybSU11kKkfdHrU677eIlrQ9g0ClVb7yDjGRsEa/m6kP
 F4m7Iihl9QrlZtssQb3BNPS+YjnwYVwZsYYQEpDUxte1G5K+LTNtu7Km+d9ilSD+IZFl7upBYhs
 oJ49gfUXOptwexcO9PgwCwU8i4sH65V3BFABfNBzYgzb7mE/YjS00x+6hTYlB2aEuTY9SpyQh7o
 mzQylBpv4YBFjyeV5x3AQ693ZQubyoXlgehf29DGkUiQvEO+qjl3PORPjARG2N2H2piTREuJvHU
 Hkncg5D6Z+5Scw6w1gA==
X-Proofpoint-ORIG-GUID: BYaE744AKOyfTCO4S-PLhOfvReTDKKwE
X-Authority-Analysis: v=2.4 cv=PIA/P/qC c=1 sm=1 tr=0 ts=69e27825 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=Gv3PURsRAAAA:20
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=OSycEtKwGKZD5W1oKNQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: BYaE744AKOyfTCO4S-PLhOfvReTDKKwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170183

On Wed, Apr 15, 2026 at 12:40:26PM +0300, Nickolay Goppen wrote:
> Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
> assign it to the ADSP FastRPC node.
> 
> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
