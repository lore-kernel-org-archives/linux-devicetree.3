Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76CD33B6EA
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 18:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778612047; cv=none; b=WlMZicONvCbj5k+e8etbTu5hAR4wJReKJjMi+0U5yosbfWX8EwaCJvz/r/VHP3+tcUSlNVLTTFwd3QKOdtfcl1+HfJIU/Br6ajT+BGyoY57Jyl9RW+m0Oz3VwXZStj4nWEyNk6mgsWM2+wYGAdHfddz/nWk1qJGPYvWvS5g89sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778612047; c=relaxed/simple;
	bh=tKyrrqOfAoVx0tAbfJFrj3PvYSlb8iMK9gZ64+0KzMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJZV60oyUhuYq3HZV9m7+sJ8yugYtuCZoUhiVGG5sJQPo5pNy4x6W/WzFPSrAD1sNazEyY0opHYYZl9lSUVC/lHhjXiKWzj53saHOsTYMQ42+3ZWzZO46PDtH/uklLIesW60wBj3yTUlrRFOxc3MEnnL0GnlWp40NhlxoI02Z3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WB+ckbmB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tch8mq1G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WB+ckbmB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tch8mq1G"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CHGtsU740351
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 18:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7Hs+/WgVqjszPCwR/UM5TMDO
	2DCmTwzkLyLf8OQpdBU=; b=WB+ckbmBDFy6xh9bMQWS6dgp9RUXz/Tz5PiWMnCz
	AedJeCNeYoyzT64FadeyJgZqrrjbDpxeqVx7QwAnIAd1RF1Ov+/yOcFWnM1hEpuX
	+cRZ2cmlblor3EV6XYDZrKrzErEB0adQ0MddN7T2mvZSU777LpAQiRHuRqxdNICc
	3VZNml+Zc2XrmAD3VQSJb9/Hr+uuUzzmKGiKbm8aajTvYyH5F1KOvIhQYmRoKMjl
	iXrKulyGlyYV99x698s6kIvA1H8wqipu7kT6wxcNfonlWtP8I5bT1tnicyeN9qXV
	Gk77cY5Zjho69wej+Q2WmO3rwkWB+7gBMHEscq+kqM0nig==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rht2jt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 18:54:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fba8d8c40so26955291cf.3
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 11:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778612044; x=1779216844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Hs+/WgVqjszPCwR/UM5TMDO2DCmTwzkLyLf8OQpdBU=;
        b=Tch8mq1GVeXfY0b7TFIL6pGbgQ6Pvzen95Z1q7QjXiPphb0lgeBMLBn9N34BTtOy+b
         YckzQhMtQepaGLr3BomJLcEAg/r3AJ+mB3yloIhOmsJW5YMz03SaoVtGkD+A4Voq/REA
         VEHEEjnfpuExvx2iOKl9CJswR4v0T+ol99ez4LYZ+LUwoP/BFwK+/1BfnaufmbEM5KI0
         6TaBvJ5bk8LbXRPsTYtulHnBRT2eSKkja5CcFaYx/mkHWXa3MTGMAClNkQfU9sxLPAm1
         aUFAvkLIP0TnAVjoJuRCaLZAEiYEgJyz0IpHNIV16yJlBeudNjbHJo8dfY8v4v2r1bN5
         H9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778612044; x=1779216844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Hs+/WgVqjszPCwR/UM5TMDO2DCmTwzkLyLf8OQpdBU=;
        b=BJ5RdNqs1lnjyMCbtsDmahVp4qvfjxpRrQHZMWah6AS3wI33HTZp/9qgjyGNrwgFhr
         9+S9msx3BPS4D9OTBib8u+IQMJL0VvLUmunbqPFzZf4CD4TmYUGvzZZL5h3ODKvDMz68
         QKrXzPWgRoXmVZsVzNz5+ZvWvwAsGEG2kA9zj2CgP31k2REgLhxGNvoPZJFhIswu3HGA
         8PY7Q7QI81U6YRDXZSKCDP8KC/H85r80wCj84Z5HSjmDhlG+zVEAHcMVKHkemfj/+dx+
         lHF2sBCcTIri+oCzs7h4EdcFcjwq+BexurV6H52Kt/3Q36o8Mjs4/PYq/iaetcP9fyJv
         yJEw==
X-Forwarded-Encrypted: i=1; AFNElJ9O9JcoNI3G952pOVUo9OakeMlX+0FdmQtoFDXq5aPMYn5zjcTSfu/JkFSPN/ICdjgMn4dWrjmuhVVd@vger.kernel.org
X-Gm-Message-State: AOJu0YwxvPMvkj8XUafdm1J3i4r72BctM4Rek+4/4ZziBnMNm2cTiJfU
	31ot8IhQAH7C2z4rGK+J81bPUDj09jHPQdrHzXDq8rWa7eksEoS1QX06wfLPFDi0c1nY1pNqJR0
	FVsoy7QlUvMPJgI9ETwTQeehCGiY3mLccRhJdo83mWwEkeqCW+bY28zscK10Q5gtI
X-Gm-Gg: Acq92OHVRYtYg8G5weRbAQXIKL3eCh0JeejqKOchBh35pfB0LJNUzJysgiMC6LRxohj
	0lG8ObTe3S5GJrKwiMM6MxC14rrSI11/bp3Yw0XWs9MY3M2/OqFRM19uR9BpiKM8JFT2qqkl+Ff
	t9hSvH924P28+Znz/oBXGo9S0R8eLQAHVPaxHSzIJ8MXQRCor6FdUG78ci9mHBmguB2jYqzGUS2
	OTOjqVAJbZoib9eCs3H9jI7/9A+ZFyJUFZBTIcAPpuGA0hIJ4Zr8XBye1j0JV2KoW1fdSC9Qwau
	l8dElmOjRaa0ZiXJIld7S8W0qePlDzvnDlAVDGZDixwWr0btgLriHY9wVAE0ObRuydDBePJG+lG
	U8pE+3ZmMjIxOkYOpIBamLajzJUB36VUN4NSP2PSKNj9ziouafA6RfjUyXe8PeZjzyHEosi1Shd
	xva7Ffmu8+dbD+g3UseTFRDVQCFGUPBaHa948=
X-Received: by 2002:a05:622a:92:b0:50d:770f:ad23 with SMTP id d75a77b69052e-514d1c943c9mr57408271cf.26.1778612044164;
        Tue, 12 May 2026 11:54:04 -0700 (PDT)
X-Received: by 2002:a05:622a:92:b0:50d:770f:ad23 with SMTP id d75a77b69052e-514d1c943c9mr57407711cf.26.1778612043598;
        Tue, 12 May 2026 11:54:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f3ae30sm35328071fa.14.2026.05.12.11.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:54:02 -0700 (PDT)
Date: Tue, 12 May 2026 21:54:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Add Eliza-specific PM7750BA dtsi
Message-ID: <lr2i5wufo5obwtlmbh5rittebohbpazfpgnlcrlia4usnyacvr@z5r4mrmewymp>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
 <20260512-eliza-adsp-usb-v3-2-6420282841c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-eliza-adsp-usb-v3-2-6420282841c2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE5NSBTYWx0ZWRfX/f+i6UKVA6Dy
 4v8k3WLoAi0lFPlNEdPUsiEvgg8BmHFn21deE063sISKor1ZLaW/NQ+JAl3nZ/rkgMJrlQILZLp
 Opwxr6b2H6JtkKcpUtktGvMUsJ2dYKKVfLBTa30rjzdVvzCEvzHJVOEblE1SKlsonMvig//T4/3
 AMtk9gi0z8zdvFCXVBMdCGHwV1apf/wpIVUoc0XMm71C+/CmQPTtyU+Aw3rGIebX2npr++O46me
 dJTMrkPWQfkApvsEWAJ90ERDHC9gKpozPcj+92ETUJ8Kxy5cZ2AjZI4/8MWoAFtfB/kS+jbi4vj
 OG2XCDxC/Re7CFgWWZzO0WEu1M3rGaywbA3yWPP5psvkp4mHOpvuvjF22FueY8dqSmOuiks70yJ
 V9z/VpCIMKK0RbspZeEOuQk0tuozJQ/oaYqfURXZXW6+tbOL8IqkGVb1DaftMOQs6T+hM1yDsE8
 1GrmElGb1J7nuQcmFdA==
X-Proofpoint-GUID: EOYtO4qfFWzHFhiuT7mMelW1gM0awewh
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a03774d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=vUDcbcqZwFPzQ2NBqxgA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: EOYtO4qfFWzHFhiuT7mMelW1gM0awewh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120195

On Tue, May 12, 2026 at 03:26:48PM +0300, Abel Vesa wrote:
> On Eliza, the SPMI arbiter supports multiple bus masters, requiring
> explicit selection of the master for each PMIC.
> 
> The existing PM7750BA dtsi does not provide a way to describe this,
> so introduce an Eliza-specific variant with the appropriate bus
> configuration.
> 
> This duplication is required due to hardware differences in how the
> SPMI bus is exposed on this platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi | 69 ++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> +
> +		pm7550ba_eusb2_repeater: phy@fd00 {
> +			compatible = "qcom,pm7550ba-eusb2-repeater", "qcom,pm8550b-eusb2-repeater";

Nit, if this gets resent, please put one entry per line.

Nevertheless,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +			reg = <0xfd00>;
> +			#phy-cells = <0>;
> +		};
> +	};
> +};
> 
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry
