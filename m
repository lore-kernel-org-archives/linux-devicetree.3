Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483082;
	b=VagrvSOIpzyuBrca62vcgghRFgVj8Sj7VkUHZ7lx/mdqZAZLbD5o4JzFC4btNJrKBJ5M
	 506m9gGd7nAR1gwMRd64d3LTL2PU2gVl/y6374uvBw76bDoKK1eHmngmhLA6bBykcxakG
	 AckdiWuDHzQQQfWHFksXsdPfcJasjm5CzzxmMJ6PNrKqkaqeNYCXBOj9/5rcPCC3gprAf
	 fJ+85p0Fs3ZXWR0fcazaAwxOQEY53s9S5EOnj+UA4Ufb0YVH8YaF+4IQ5Zx80h7KResVE
	 a55bHSL6JHnrBFPIL8Lz4vW2mUeSp30rHMCh1tlyTO/LTWauySGDjyXpsa7p4c10aJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483082;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G3WyDIFGwvzASNJI/Vjyj4QhfCstvrtuJBWM5WfABQc=;
	b=tZfbQREdbtpyWeOpAJq43Ln9olpzpGdtOmsqiqpiRugUxkeCFYHrcgeostBpEoP+zml2
	 hd7L4X84WNbm2TBzNth9UsdpQC8s8zTvCuLVotkmGNwo1W6tKk3fHpB1/iFE/+m2oCRBM
	 TqoW7VPTjZu14vYZ98/RQitWny9SQ1sUDRtlCBM7USnHu9U6cr623JuVDhLmvbwtMZ8CK
	 PVooiw2dc8FGKHlN4WSZcpKCeWvH81bI9uarv9URjJRzhSDbQ1TPslf98qsnGtOLMTqMv
	 GcVFlKw+DqH8cZHKJOwDdXjShB5/WIYymASgePjwGnLxpPdrNFsTkw4Rw/8Kv07KD9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cfscsYbp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UT6Sitmm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6995F606A31C
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 21:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6995F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cfscsYbp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UT6Sitmm
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJF1gF3532948
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 21:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G3WyDIFGwvzASNJI/Vjyj4Qh
	fCstvrtuJBWM5WfABQc=; b=cfscsYbpsec9HVAUghcqDLk1GkfjoPRWcgsNbSdA
	B9hcnyI2MIKFlurfd9j0Xr4QDHssmu20XO0LiLSYWGpC7sHjGDiw1Yk8WvcQBysK
	6/EnIvKoZg3hLhhqCv8NRfdRVD2yGWHN4K+qLjENYbNY/gYmJi1kAysZ/KJzQsg4
	4D8DZ61LSUc1PDv+psXFJdfvsxplaIb7b7M9/6oUvl34It1OyXIq9rFukGiOzU0y
	EBkEhSsYmY3Z6ZxYkorIL7WMyqdNqj6Pw/PAKvt3xkL+RdgR15PDMAurujmFBskx
	qVd9Zp3OlmW1h5DQwz+aeaJOPItSCpvAcGK902Cw3k9OPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6j8dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 21:44:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944138ed63fso299600685a.3
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793483080; x=1794087880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G3WyDIFGwvzASNJI/Vjyj4QhfCstvrtuJBWM5WfABQc=;
        b=UT6SitmmfMTjrmHFPLL5aDrV/T4PWs5ITVUV4L7V/EXnfAwufSb5vUmHtgAierwI1Z
         GKwPEVcjwBjGohmH0x7v7yswp8mA30INc0CG2zgH7frQz48SbeYwzKJliRnbGKpVN8ar
         Z1OtuaYBqzUvIH4N5cvDMyR/hUghhFQqG1yqFVX0W1zCpiZQUHeMCwHhOsPCI1V6tpe8
         LBy4x+JwNvKHyyKGP3pnZ55baJoekZh1bi7Qw5lpZ6OIdQn8HKcEGfdk4JeIWNWC0y9N
         1WrSzddehkd7CYqYeNCbXuoN/iEqUPoIE7qKksDREuItPLqWEQlW4a5ydwjkdQS0a9Zn
         hRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483080; x=1794087880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G3WyDIFGwvzASNJI/Vjyj4QhfCstvrtuJBWM5WfABQc=;
        b=N64Jd6JTF585Hb/eHyGtD1ntdEbEfdWfNf+RoK9YsxXvOa5k9OFDlchY9pbFB9KqmH
         YIJFO//evvsW1uGoU9kebGynZlbpMJrEBSORAaeTpPyb7u7ES5bxODiJvEFdNQDCKS4X
         8SLRbOa7eF7lzBkFcVILpV+mN3GQKOXKl3oEYu+O+dO8J99t89J/fl+QZwgSnXHERJKa
         I5GkJ8XG5AUaOtmRbBNJiIOX9zAlAKFYKFgeiKqCSCXldW3ulrbPkHcdCa21lg3abY88
         jE5FYEeKGMUh83k/i05KilYEeszdePSj53VFRcBvxIfDNIltUyTr2p/yln+Pvfp6ZbSk
         xqzQ==
X-Forwarded-Encrypted: i=1; AKwUvBznjYdeE2s3O8G1s9G2ohYSixmzbh9qN/pfgHxvQb76fcPgpGySFXhOSg6nqdYbZXYAxvbsGo8dMOwn@vger.kernel.org
X-Gm-Message-State: AFq9FYKYDQ5R5thEgWh4lDH/Yipt786bzBnEAsvtoLqK1KRf0sHY3+ly
	YHSXj00rszGTRo5xIwY3kfRUEql2GDsPJG2pEEj9jSeFjSMyv4F9UoGQdNgwmYXwA8rVtMvWYYW
	vATj6FHHpqlt4voxin3ajVKpN9CFhCzuPaPbuQeqcCrXjmq03RaOP+0H3X6mVfiNx
X-Gm-Gg: AYBFou2zjGxMIfHqgnC/zFW+yoPiJCR9F0YCcIR360qJWRNHWMlq6bpqRTPEBx1x/Vb
	+i9zn3MY7S2nRZDEywgCp329acmzYQwgWNJO3ookvxl/KDSk2DUE5woFay5TEWSGIPHBVQ8e9Jv
	T+QNgiEB3ZTvBmUFhsZ3kSkFhNOx4i81qtKU0CeCV6mTHBHk5NzpnTHk07kH9yYSjNHudUOH8p2
	2y36WlLN7hvsYlxSjKfCJDvESQb22oRwKCZhpFmtRtYQ21+AItovhXguKKiJFfrrDx9ayfaNBe/
	SRfJvJ0gQQH1RzbFMEId52GBxEYWfr2HC1VkWliBsoTZOo1fgpgLbFc3tfcn+ZWBLAk1D2wJIoO
	lLD9LPPf+TDL1gToRdq0o+9dN6YLmEyLjpg4jOoHFzHtjgSdbmYpV6jYamTXRwfKckJ3SxZbYyp
	tkIIQNwpQA3ej5cjdJxzJPb0dIfQUfhLNTQDYGGIzH5Gkrqz0ouZ9iqDlBbqpR5g==
X-Received: by 2002:a05:620a:4720:b0:93c:2c15:e510 with SMTP id af79cd13be357-9442174eff2mr1120358085a.37.1793483080521;
        Sat, 31 Oct 2026 14:44:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4720:b0:93c:2c15:e510 with SMTP id af79cd13be357-9442174eff2mr1120355585a.37.1793483080047;
        Sat, 31 Oct 2026 14:44:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074666csm760682e87.67.2026.10.31.14.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:44:38 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:44:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ishu Brar <patches@brar.si>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] drm/msm/dpu: Add SM7250 support
Message-ID: <zmzl7btnsgzb7ywrescyvtuksu6edrch6i6i5euhy2ven7qmzx@xhgfspbq4q5t>
References: <20261031-dpu-sm7250-v1-0-159f403ec405@brar.si>
 <20261031-dpu-sm7250-v1-4-159f403ec405@brar.si>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031-dpu-sm7250-v1-4-159f403ec405@brar.si>
X-Proofpoint-ORIG-GUID: Oj7TD8U8jC5BGr8TAoM1CBp069-NQXeT
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae66149 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=Jal6vLO4qNuLzgKlUnIA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Oj7TD8U8jC5BGr8TAoM1CBp069-NQXeT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX5v/Ta9PXv0KC
 VbCYXOg+QbeT8GvwmX+F5yrT4uxKQJAey8rtWFSujzODZJOrB/pHDnYNczvGSmPPkMoC97debqz
 6JWExMJt1F0J+9g/QCL0U6YO9Og2Abw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX1z6gl0BeGvrD
 VzORwoc5a4+nDzzHNb9syuqAu6PpPELjFnzFIJDHiqdJPxBnYJ1eogqXbPWop0sMb8Ipyzxtw9N
 1an//bMQuVrFFiqNUj2oqIbNEVTDQegtIMbONEcgReV03Q58cP036sx+KpCEFGXfZ7S1RzQG4sz
 PWyq7zshJHTQgfk9jRco4KyGxpMskjd/3pS2dmJh0sXPAoIwgiqW+wKI/L8vnXbVYvnsROSMvbc
 MU3+9IZXj4x2e0IDH5cvkFKPvIUfP12c3ttM+2A7WKbhPtgPBFOSXBMPPs0omIvcC8knbNXryPC
 ciYD7YAitkpClCmkX+h+WGtEn2bh5ZOfMmcoUJsbc61cN+YerkPTJPXwMrhWKhL/FGNmZdkU9i3
 rQRRElK2grqKf+ZxRHrc/ScOylFSSmrzSBVeg63XARNy1MYkEKVp2XlNOOlwfPyvFAIo0j9npHR
 PvQACqQoJuzYWIeAsBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310086

On Sat, Oct 31, 2026 at 01:23:40PM +0530, Ishu Brar wrote:
> Add definitions for the display hardware (DPU 6.1) used on the Qualcomm
> SM7250 platform. The values come from the downstream lito devicetree.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_1_sm7250.h | 311 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 314 insertions(+)
> 
> +
> +static const struct dpu_sspp_cfg sm7250_sspp[] = {
> +	{
> +		.name = "sspp_0", .id = SSPP_VIG0,
> +		.base = 0x4000, .len = 0x1f8,
> +		.features = VIG_SDM845_MASK_SDMA,
> +		.sblk = &dpu_vig_sblk_qseed3_2_4,

qseed3_3_0

> +		.xin_id = 0,
> +		.type = SSPP_TYPE_VIG,
> +		.clk_ctrl = DPU_CLK_CTRL_VIG0,
> +	}, {

-- 
With best wishes
Dmitry
