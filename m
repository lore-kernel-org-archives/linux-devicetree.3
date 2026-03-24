Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489932517A5
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774315222; cv=none; b=gcNksffZ+Bdq6MpeHe8oEw98xmfE4x0JjDVBLcq0jn0bpnFJrLA2vTkQSlziNmLe8K+iIuA6Nji4Sgr1ZCtYSutRh0Q3C2yrz4y/q/jlTjONfpNQ91ew3vQjouWbAkx4iJpW6ekfSKZmyHXTGbYl19t2D//a461IA7IPJkd6Kf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774315222; c=relaxed/simple;
	bh=7AcDloYlbqh5oVY63/MUJbPKuyPcKQ0KypBfk6uLxV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzC62bXMrtRYiDdsopW2grcI3s5XXUGpLLLwcilPwiUvGCK3cIutXFgHnDzx+7wywcqGa2BCHhs7FQJkvw/SRCptRdHFZDFqpy9KrRjS2gSgFiZtvP3XZbDkLsgINsd6xnqI++IQw14OVk99anpNTvPRS/f67lyUb3dKLXIIltw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zjm8gTIU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IuqREtLH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zjm8gTIU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IuqREtLH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqcw3943589
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JyrOfxSQchyqJ1Obc3zJ2UKA
	7v+UsW8UYvgtSqzGnKY=; b=Zjm8gTIUDhNp+ppYUAa+v7LQp+s773ygf4Hcd9Qy
	vDUhfhVUoNyPDkjbIsAH6krW2nQ/4VWj5IEHPQX38zOU7mLJz+fnYLgVaPxv8A5I
	3X1H8dd3/wSV3NzjApritSs8OMH5qIA0Xsxsu/u+tCF4Yjkm8CGvMTZxhUE+SI1V
	+2qqjUgv3Y0/WHbKMYnG6KZRT9wbnInFCgn7EPNpiQ2BTMx6zsCx+MsPnjfI0Rc+
	B15VlcbjHEKscPs+fxceJ6vJ8VeyU3bQJqiww5BNM9DEUYRA6UvFdCIgn4P1u5SU
	IUEk1WKro7qSoUfSbjgva0i+heHVdKc6BZ0/E2PvzFl4Jg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vktk23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:20:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090cc6a7d2so296096941cf.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 18:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774315220; x=1774920020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JyrOfxSQchyqJ1Obc3zJ2UKA7v+UsW8UYvgtSqzGnKY=;
        b=IuqREtLHI2YqF3QMaLGnneIsGmRMGWyO51o7gdFHG/Zi7mx70OhyiFvgSevt7Q8kiD
         f75hKyLaQ293dHWWwUi9+Uo6dycbSpj7487VF+Uf2zxYOa7BqpGKOX5jLj5Sz2f3BaPe
         KHmqbDxtpsEQ45SU+hbDMZhCyklfCC2mPa+O52PwTcB/ZEmqRvKxV2rLCfi9d5xSO6si
         b+AVkq73Fvzy5EKKONkdzzlpCLSvII99qu+IppKZb7OJdW7AnqJyZHQv1edSOs6dhbl2
         j3ap2fpAuhybpVhn5byZzdp294Odob3VUBYgObh1a7jyOYWvEQgS04nS6X6HzCW5e7wW
         Iggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774315220; x=1774920020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JyrOfxSQchyqJ1Obc3zJ2UKA7v+UsW8UYvgtSqzGnKY=;
        b=BB2tZQFPDbRVFHvvnrHDxD7SGzXzlSRCTupuHhsFkcZrkw4NdfSYhFh9CLCd+U1azq
         Qo4NMPK7ZfN3ATBWTe0cDJX6Te9kXSXRRPAVRrmIWnmebw2GsijXBUuQ/AGjNNONVdiX
         vN/hG/fJGbdRKTs70jintvxOFh51AMZ3WZQ+21xwm63HnRkAZUF7XWVwJLpzn90gFNd7
         mEd/Rsz9n/9CFyA0IR2d80dssaxXbpqT2WfGQLcUMaQLKrMwXGTGr61/twaATB73cZXy
         Q7i3gyc6NOREvhdXvv7vOaGw4FhpjmPKTLdy6JxGY0S3jqz5ywJQRl7fF6wJsVrlB8/c
         81jA==
X-Forwarded-Encrypted: i=1; AJvYcCUcuoVH0Sfhuu5VL+bc7JLEv+RRj33oKF/qP4CcaQngiAH0Ooiww+hbiZTeIm7yVlMSllyeGv9D+nj5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2/puzapzxPLBvx8TXCq9JNjZpNybPOp/uUGj1BGvTj5DCvBMT
	1V8rFAdqgluYgr3mtKFOF9pedgGjmhPcn8fdf+R1yZ/24b8f04skYtskKQdMYqf3ulVSS2jsqTs
	YJUOt0FGCOhankyNNb3ANmMX6QVcJbkx8ZkuTG3St+rrT1CzkMoh1S6YbNvUEeO36
X-Gm-Gg: ATEYQzzCFpgZiJzM7/R94ffMRyULpV3/zfsLKvWNrzWhUe/1yIJg3MkmEkCi8MhtqBD
	DDKVp/0xd4aBuTXUMKSlqhd7n019E15BDfCUmbN7deTvyK8ixTMiPkEPvPa5PgIOsXA8FdlacVz
	apVKgEeiFjRKBod7kYh1jQtMOv6UrLUAR4Y3ZBhrqR0vlCzTfdciIhohEhQED6+IXE1h97Hmk+c
	3ona0Fyhn/3NydgsLS4YwzGAte4wxbUXzVRTCb+VNAcgVBRUxF8qmLxC1pnJQIYoaCdCwMWQvA4
	Kgyez2zwu74yeDVgMkbwMylC3KkTl07nBqHpcrL4mAuAL74CXXOw02UO1IrSxSFJO9Ol+SWtP1H
	LKXS8pC+g/ErmOY2IfKIsXvut3U7moaYGvkzuIzt40yFA9ycwktFe+dwygmknvOeQ9NpPiparfe
	SF2jR1YGcFWhWSXoyzFPMGUM5bW4f0/Yqbv1s=
X-Received: by 2002:a05:622a:4c86:b0:50b:4d27:bebb with SMTP id d75a77b69052e-50b4d27c6afmr132824651cf.14.1774315219668;
        Mon, 23 Mar 2026 18:20:19 -0700 (PDT)
X-Received: by 2002:a05:622a:4c86:b0:50b:4d27:bebb with SMTP id d75a77b69052e-50b4d27c6afmr132824421cf.14.1774315219241;
        Mon, 23 Mar 2026 18:20:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192ac4sm2937732e87.15.2026.03.23.18.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 18:20:17 -0700 (PDT)
Date: Tue, 24 Mar 2026 03:20:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] arm64: dts: qcom: kaanapali: add display hardware
 devices
Message-ID: <vqj2pvtjs7dgkr65e4mzt6ezoxgq5gl5kyxbbol3tbtvw6bltx@yhf2x7oix2ss>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-5-70bc40ea4428@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-knp-pmic-dt-v1-5-70bc40ea4428@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwOCBTYWx0ZWRfX0cEDYBpi0zsf
 tLb2RqnT1Att2fHOfkRnMLsMSYHMzH+cj/e4u8PMgplUX+1b3POax3eW/kTe7/vvfV2+Ot80LI0
 MorfSCABuR9A8rMO/K2k3NTkbjVLZQut4frIWsRVxfDxrs36/bKyYmG+G1Ry1S5i/CZcuxJDuOs
 z2EvYS95m8+3pkZnpzqxoLiArO3P/SWagyww8U+niKcjwu5bZ0D4VtDXM08dF+c4r/SmOxR137D
 UELU9eq4DAtK35E4vtcVUve5Kt2EfKoJMmIAopM6dvv0r8EwNugmUbysKbcNO8hg/5DAMiBSLdS
 BKVgviV9J1Wz/NjtGast4akEY/wEVzbb9MkbdRUhFwmjFZb6Q5aIeAkGJBZyUBd8lFBRxmGdkpY
 rmookxsS1Mb0+D9YUM6D8/vqE+hOi4z1d9fT+H1i2NG7OpIq2vYLCVtBzCe6kBxGFNqukBioyZP
 ai18JGw0drdsOTKR9wg==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c1e6d4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=LbeyiLmEbei7xv_c5ycA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Oev35yQ3s7a7RRFlxeEfIwJAdXubpPHE
X-Proofpoint-ORIG-GUID: Oev35yQ3s7a7RRFlxeEfIwJAdXubpPHE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240008

On Sun, Mar 22, 2026 at 11:19:45PM -0700, Jingyi Wang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add MDSS/MDP/DSI controllers and DSI PHYs for Kaanapali. DP controllers
> are not included.

Why?

> 
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 242 +++++++++++++++++++++++++++++++-
>  1 file changed, 240 insertions(+), 2 deletions(-)
> 
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						dpu_intf1_out: endpoint {
> +							remote-endpoint = <&mdss_dsi0_in>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						dpu_intf2_out: endpoint {

Missing DSI1. Please add it back.

> +						};
> +					};
> +
> +					port@2 {
> +						reg = <2>;
> +
> +						dpu_intf0_out: endpoint {
> +						};
> +					};
> +				};
> +

-- 
With best wishes
Dmitry
