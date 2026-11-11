Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420511;
	b=Zkiao6/whl6lDLDQVR47DEuwqmGsfS/TYJtMvBi84wYJ5rhTq4JSwVH5Xr9nEVaNQ/fF
	 43B/qApcQSSdN6oe0O47MVmuuMYEVPVMN5Pv82Nz4bb14zt/xjI+FZ464YSCKkLlUmMZg
	 7ruf7AaOQTucMZtephX6WKkejknwuiB/ygEY2kd0OOqCvXRMF194LL06KHMqBPrSHY+cZ
	 6N9VQDoyFzcCMMWjj+0NIMd00mRIEwIT3Bl0nCnOWf56cm9QsFxJJwkuOr0gBomTeT+xx
	 v0/YeSULznQH+RBndXcZmQE2EyoZyRSgN+96WKwTvDZZrOKRHsLkkC3fzCFapmHNZ9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420511;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Mek+GhpJgbAlj6PFKAaMZa1L4pkrsPGjFMnbflusKoU=;
	b=dMPEiizlXezi8tYCANR50Px+4wBatZsQWkKUtRXbGEWwUOlnyNKjZMFGokEDH5AqqGLS
	 sVJwmbeZmykntJwb3LU/yj6WDFMoBLf+bG+q0hkHvRfUR2bYmDTSMlGTBQO+0qNamZYMW
	 Qq4blcCdegzagxffmQznQp7WTuWTLf+tMKn2hjK9PCCqmMcdzkEkVCvdNjegzwTRiyhpz
	 +xP/9VOvaPnKL/Fs0tdGyiDWnnaKwqQ0EwX7eylqa/REzcb2/P2K1Gf+9SVLemNTA2Q7h
	 PIj+dnfR66yqvuC647uk4U2JsEYxoJtZO0waNqS0FvZm8fQrX2F7xyN7ERwXkzqOqmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HkRp8tNl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=USZQXkZt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4F9606A326
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F4F9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HkRp8tNl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=USZQXkZt
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtF7C3680741
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mek+GhpJgbAlj6PFKAaMZa1L
	4pkrsPGjFMnbflusKoU=; b=HkRp8tNlH/IHx4K+SnRTdTHTNZmewDVb125mi4ug
	0PNYhPRbnIzlTF9dttHZ2bv7GvVrhlYbAU6zCArXK71VDab/lX8OkmFNzgq10Hs2
	TqRgCFQnVPisJDEHHu1wLnwuDBZIXnfB3zRlmeFTKOkb/y0l/AVKVoOBA1bNDOl/
	AGns92zlCbYMecR8cQpSHf9FXLmGLBOS+D1bJoS2rkeRN6k7ViMmep8m1i8vhG3z
	+t4IyK+O5SlJEiJ6fg3U2Tq9Vg+oprgYeIyXycLOUxvJJFyD7i1EsFxc/gCI4pqA
	JGKB5lDNX5acXmPJg/bu2SE9u/jFTagrp7HxN3070qH0qA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1512bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:08:28 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99939c0007cso700154241.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420508; x=1795025308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mek+GhpJgbAlj6PFKAaMZa1L4pkrsPGjFMnbflusKoU=;
        b=USZQXkZtLVycy5Vz/3x6ZU2k6y206q2Gzc6VpDYwi+JihZ+B2TGrRGQG2bL7rmJbLr
         cwqYjkzsYlZjf3zw9eSizLUjnpWTIgwMnRKyI5hcrbqd3aUWuKRCNnMXXrhGHaWx/4m/
         7TXgNd9GS9swz/b2bKKp/bxPplqt7yuDcMoBcNBV/2qBMEwmtXSLBoJQiN0H82gLlm3w
         JVFLN+K6FRNW/70A3+cLD1B/0fZD90V1FmjDGyGTY+RSM+Gav8vi/iNl/z8GkCcivTu/
         6v99shOLb68mA4FpSGnsHOgV0WZoDZHE6GYpPhswKTbpPhmTk2aYPtCqSZ43sg04JV3G
         KqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420508; x=1795025308;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mek+GhpJgbAlj6PFKAaMZa1L4pkrsPGjFMnbflusKoU=;
        b=dZ1+S1GNl2zCeg+bs0PBvOpq/3ukJ8uHOO8ulyFtTNoHRBGe+QaHtw+dyA3FU2F1sx
         Cz+hmzkZR4HTnb4LJViTRftR/bOhlkXgnbaldSL40O7Xlmj8xTSInOzqTmzosBkp8bw6
         nRO3ZST5GGIthTAmvNeKEJ1TMmWBhbyvcnO0kzJN8StWL4E9HMM3F/9g6hxISB3d2WFR
         x6m8bDVfqwTciyYk/lQWuKLkePnZQpOulLvxawLAkV6JT2nf9aP97W+fILleZ9D6wNri
         hJ2LlIO+0FYnuWCEXyWiZAGR/3zEt1awdLlaRKKVaDs8EzDEml0ehm8QR5FOz02S8/Vl
         oVHQ==
X-Forwarded-Encrypted: i=1; AL+hErGC7bGOKRK8JrkeIeFiH+/Hy/BZ6d8vYlzH6Bitf8rybWSWnKqKCToB7/8BLuUn0ErITGO81YPfgJzU@vger.kernel.org
X-Gm-Message-State: APuU4Z+jL34QWnirqwjbMzsD1cGt8yWc5R6oSrOPvOCOHESLc/Mk1MX0
	M1Wk87LAvEFUNF7TGUyMmx731POKyoPRJvX2xiMBF6Uvc5McwTiutOpsmddqR7H/skuGbwvaQJE
	TsVHAHXg0raOtQT8RUyibO9JSwEUXh7I65pgeCoj3s9Xur1WynNpQDW0Zg42lM7aG
X-Gm-Gg: AYBFou1MbHtYpJpYr4ssY2QsVAyviU0cFEZ/dLhX8VIlQOZFgzYTLyJzGj0fgAeCjZX
	z26qHQPYA1rbLJFvBGaNoYoVYGu4DZ0OuoQQ0emVXc8rrJV7utFH/9ybmN7xEni6iZIuGWx730w
	+30Z3xFYjrzb9csrtyvFXX2pQC0FQKHgKHz+vhmnI3UbeHqVbrGvp2doj0e6IW3/rDvi5j8rZSu
	HQCDqnNLunqtbmg6c7OyMBB6MYP/nbzAP00qbUOAkq+Vgg3qexhqcykwRAljC6hSAHxlxZK/VOT
	1YUYZW5W/5dVJUykWsl3bU525tw8TX3NJAqjkvcoOG+4bABijGLNgDFF5paO1085ShxKtVFKKsw
	7rB3vQ0oAvPpmvWacLN05vt1AAvjfKaWEkWFIgaC+A2fOnKbCFyVCGW+2HDb299Ysxdmq2svLgw
	ozi1mIWonBkVxQ+9l2QO/5ofuOAOsWy2oF6E4Y29gzKvZsOgxLvi/ERJJK2azISA==
X-Received: by 2002:a05:6102:334c:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d50615aa99mr1096403137.37.1794420508147;
        Wed, 11 Nov 2026 10:08:28 -0800 (PST)
X-Received: by 2002:a05:6102:334c:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d50615aa99mr1096382137.37.1794420507572;
        Wed, 11 Nov 2026 10:08:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae09224efdsm13131431fa.14.2026.11.11.10.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:08:26 -0800 (PST)
Date: Wed, 11 Nov 2026 20:08:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8996-oneplus: Disable
 disconnected DSI
Message-ID: <qobhsifyot6ahopugvgsmtzvd3oby43vg3yhjxjf5r72zdohhz@4r4et7fookge>
References: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
 <20261110-display-msm-of-graph-v1-2-0f3106f817b4@oss.qualcomm.com>
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
In-Reply-To: <20261110-display-msm-of-graph-v1-2-0f3106f817b4@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX8hK3fz0Tt5TZ
 +asv6E+678qVIfEHJSwMogLvrnUH11wo2cFJNobebnscrl+wV9pdrBYTbHn8OTxQAghLbxWCiJ8
 jyBYadaay1gvLksjEsJR2mc19wGiT1Y=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af4af1c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=udFPpGrmtiWedX3Zxo8A:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: H7tF5bm_XGIA3AIpSLAopGRw9tGpNPrd
X-Proofpoint-ORIG-GUID: H7tF5bm_XGIA3AIpSLAopGRw9tGpNPrd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX1BpdlxjFBsy5
 G5N1NPvr8FYt6jFvXFvHYuPQGPYeC0GRO+GK/LeRBDgwsTfMtJ8TbBBxh0K8rRqZGyKBjvHs9yh
 9AEhJZihLFXzfLQ4EUyCQ3w6DZOHvq6aj3+O9vzHq3lLLfew2PIvpRbnmQCLJaiXBHJ5I3L5Mvz
 Q4Qk0yXhTl//vEBlajO1Utk8iMf37d91GYR8lk4m8KahKl05uFHFTvwDU/5mGMUaM2xfQVP05+K
 LR3pm3SSCnj+2Jdfn0UuyNG+qKDGMIbMrv0KIyaTVQMruWaFS2pyG3Z/P0HZgQz4yN4R8fDL5X9
 w0F4sZ1Et+Pfco1Lp2W/JSVyOSsOi8RSAxVmmYgHl6kQOIOvQTlNcSBZ2+PA9d4Ys158DsQZHBi
 DGJI8eWvW/UQLUiFOjenqKBDbM57ysFh8uqFi5YgiG7wlGT8OCSiYq1bP+v0asjc2fXWpMUrtB6
 uOxXNWwG5ndVDUAF8tQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

On Tue, Nov 10, 2026 at 01:57:43PM +0100, Krzysztof Kozlowski wrote:
> MDSS DSI and DSI PHY is useless, when nothing is attached (no panel
> description in DTS), thus should be disabled in DTS.  Linux MSM DRM
> drivers will also fail the probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
