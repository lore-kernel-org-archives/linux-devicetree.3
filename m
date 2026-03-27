Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CADA3451C1
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 23:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654501; cv=none; b=dRWp/8NltUS2BSh/Wzf1L4OaTGedc5GgfvzA0vTC15VCp7SBE1bfQlxiXXhIWqNY6tF95d+miG4mu7M8jVxaKprSRJwNYvblr8HFit3y6ogUMIsNtFT0jVf/bYJsqovZYkEEA+nOafIvFq2+rmFoGAWlT3vkvMvnufumCcACE8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654501; c=relaxed/simple;
	bh=5SfqcZmm7pV88JC5OG5HsgWb0I/z30fDoitR58+0OZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G07sRdnArpd/BA8CCECR+QYjxMH0h/JH+6jDAiUe3h+ZLoEQSdX4ufUs1s9rXTnuK9slz1hslCy6GzZ2YrutEmvxkmIyMVssVKd4lYFMbNM4djFnFyt3YKin+ay3dVyB+zo0PA35dCWwF7/zZCPm7e3q6lJZ5u2HMVD1gpt/4ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f/eQFagn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VXy9RFhS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f/eQFagn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VXy9RFhS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN3qKl2860078
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 23:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/VoCIrpAvd+Z3bHm8hG5MCfI
	mTIzBCTyZdUbxL+dMhE=; b=f/eQFagn9LvK5pMVLF5YKpnIuGilmhSBi8khBOZ8
	HTSF2IO1nu7aH6NxUzBFwypb7cKXlNrbLvw2lONDmOOAbhv434S+9XpEjHJlc7NV
	GpmwPGa5Vj8usbyN2eMOHia5kuLo3MT8kb9CsbllBBvEhVwLuGHaocYSOUgIISOf
	9fDs2mv6hcnCBIVSoGQwkYZscYWiu64vIJgY7w7py/StkZCQyFl+fDtgtNluwYIc
	qN1HpHqhFgQiNRyrTYyMtv7XdYBxAQUB301AnvoZlAiOaw3039T9rlRHqhyQAtpu
	n/3oza+nvXecDDudeSf5UX6UKysgjGvimb7ETLiO1yX39w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5w30s8x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 23:34:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89cc5305180so8887476d6.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 16:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774654498; x=1775259298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/VoCIrpAvd+Z3bHm8hG5MCfImTIzBCTyZdUbxL+dMhE=;
        b=VXy9RFhSl2JVeoN7z2O4spG/iocGOOahkFzp/cRHqxBrMep7drhgEE9Rbt/N5CXhi3
         QP5lXOpeXfsXWAV5jooGyHo9WAFH+62M5PhcJFszzpGMlvX1x/H9od3tVj5ZPrLIxLtb
         TdadABRCxbowWDq1pxZEWOm0nYH3AFh4g/wqYgc1W8vf/jBmyEOfOmejqzEWGMZw/2Yr
         RL55jc5TQdI70pyZo56ys6iklVqVV5XwvOVQik/I4w+XfNw28v6ezRqNEA3L6EK2GOij
         +LcwSMKKhtoGlV4a/RrobZlT3DZWww7zF7L+RwdzEjslS8oqx0Y0+OmKNdaLnTNHeiHf
         AsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774654498; x=1775259298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VoCIrpAvd+Z3bHm8hG5MCfImTIzBCTyZdUbxL+dMhE=;
        b=Z9A7XkbbHeCAmIZ0CPzidhKEc7eyhkck5CFjZowBZ+gmX46CMFV7jDV4DHQ3E+H8+m
         +jg2geRjGuQ+bXLmb5sOvTnfA0JNzRG8gDqmR25OGG7VNlTzaxdQptcWLB7e8VcsjXbd
         CHFnH4nInlNzkAs+2E7r33j0jHn/8SoxWHY2C0PlFBmTw2HHAkgDbJzAm/+Aj+4ySJoJ
         MnNLGC5c2Qpb0TtTIqVWl/kXsibLDeAxoeJo6OuVP+3qZxxLND35b3CvfK1rczkrmVlB
         BTMd/n/rhcT/dEtnonq7VZQ3+1CyLkmp/brjesJco1oX2sVtj1IV/Z8penIfZVOACkMU
         CKpA==
X-Forwarded-Encrypted: i=1; AJvYcCUbLuZwjoBHPXA17z5kijYb2dR9WONilDTDhgkmpS8XCFoqfgzYhEew/vQF0cl3IWrOoNXSM3tMbaFg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3htKkbRecAxL3XBQe+lpBbgtixOIVcELF4xz5N1CJwsWTvYvQ
	LexPVzuAVv26ldYZG3TkTJfNNvibpYmjTRnVXkPc/i0nfnMQjE+v1eaiAaB1ncc5af70EXozoLm
	QCcXnOces6YM3GyBQjoZ3wTSs1m19vsGspkyUJI9rXpJNdf8ZBgLnbMzCLNubwxAh
X-Gm-Gg: ATEYQzzuoXeW8XZaiNLL0zmVQ3np6IDShEPquGu/DytKlCFWDfrSPL1mjqVVHedt1PG
	YA6Fand7XAlpg7fxuFI7m8sSbc2VArRzRe3EwMK5EgwVpUqtvYsMjUhNqWfwDOwSDP8OuHrFd1O
	VWOCjfZQKGu1K7ouKAcZy/uOBpWZr3H3I/7Pvia8mJxfHUINMeQhBzZCmIxVPdJmIO8FtJYUQKq
	LBCauVBoE/AWMui0fKCizFuFSCH7iOS/TuCOwQcGEiJswq6BnSonF4dvIopwCJc4IOkBDahUj3H
	leiCK/TRsNhCeiHB30xXw0J2Rpm/bo9gs76xGPQQxWDMzKRL17ymIfkIIrY4ZYSoqe3KbJny0Xh
	inwHgtAaiksOL7MUJyDVcpQuv2LOGUmkGWgrGPWyUV215e3gjm/UzPdAxnhG+iPbEWWRFDmZYRA
	/0zyFsJ+/JhLQMa8PYyz9zWpX/1iG1svg0O5E=
X-Received: by 2002:a05:622a:488a:b0:509:1b01:8926 with SMTP id d75a77b69052e-50ba37efac0mr58001311cf.6.1774654497887;
        Fri, 27 Mar 2026 16:34:57 -0700 (PDT)
X-Received: by 2002:a05:622a:488a:b0:509:1b01:8926 with SMTP id d75a77b69052e-50ba37efac0mr58001091cf.6.1774654497447;
        Fri, 27 Mar 2026 16:34:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838b8db8sm1192241fa.29.2026.03.27.16.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:34:56 -0700 (PDT)
Date: Sat, 28 Mar 2026 01:34:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] arm64: dts: qcom: sdm845-oneplus: Describe
 Wi-Fi/BT properly
Message-ID: <umsy2om6l7ql5pxtm44jmlzpvbq4frqzlbqhncajl3nuiqfwie@6qaoost35glh>
References: <20260327-wcn3990-pwrctl-sdm845-v1-0-3f5c34e3fdd0@ixit.cz>
 <20260327-wcn3990-pwrctl-sdm845-v1-2-3f5c34e3fdd0@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-wcn3990-pwrctl-sdm845-v1-2-3f5c34e3fdd0@ixit.cz>
X-Proofpoint-ORIG-GUID: GddCTrfRj1WJ4aHD-6wyRBp3JTme4qQc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2NSBTYWx0ZWRfX8aIfqYWjaCid
 Pb/7uDGv1W4mPId2P4Qz7pzVpmrPE5E3gZJrjlmFe4xSu0ErX4Iwp1tOwGtIt7bRuxdV2WPiZIy
 xfQ2HXnqjJfS+ufa4jjDgeLkaiFzGKYwpUjTbBOsMRedS5z1p9XMpLRJDoKkL2FEvR0TfbNfu9S
 pSrZ61MBvPvAH3H61kk892dNg1WA3ltblSZViOjWXwXKNH5YVsGaZMZWD7mHdDG0NrFQsP26vZO
 uNQJMkwFG5OcLWFRYV3gKvPlZYJeA6hOZgZhgVFOmi3fUjWtfgaMPiYNMcUEcaoTHvVnuD4KG3g
 QwSM/YdhrUjBw+wqHBezbjKQ9HqokRIcNwlVUO88PmKskiLAidKQBZ8wBcImDMLREovWqDQnifn
 HxTaium7qS5R0XDE/gi6MgMdnIt6bRRzdapeuyh1XtXLIFDlvGRt8QfNo5+67mTp4wwruL0M1/s
 xFPxQ9PlgjMPypjOK5g==
X-Proofpoint-GUID: GddCTrfRj1WJ4aHD-6wyRBp3JTme4qQc
X-Authority-Analysis: v=2.4 cv=F9dat6hN c=1 sm=1 tr=0 ts=69c71422 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Cb6hrz4NNR8bXqT0X9gA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270165

On Fri, Mar 27, 2026 at 02:07:09PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The onboard Wi-Fi / BT device, WCN3990, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree
> and rewire Bluetooth and WiFi supply properties to use the PMU LDO
> outputs instead of referencing the SoC regulators directly.
> 
> Verified against the datasheet.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 65 +++++++++++++++++++---
>  1 file changed, 56 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
