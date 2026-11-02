Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623372;
	b=l0sc+mt4wd4k0iJ6MQI749MweUos3kV4aV6aedwurHOlqGLQDX91bfJ8N3iwoaWNqdOH
	 Elg+fBn+FhVIhfqgVA2oWfPYHHN4sfuffg1WCvVFcMDTsxCFWqssT5qaqGLzYGuLJTHR6
	 c7XutRwnrWHZNSBfjTEg/jFFzzG5T2vak6h6lZCxAcgQXS4+a/i6jPhu568+9U4iScc7f
	 gWUuMzUTaJr+4DiZzzbt8ExltrZAnIczGAWmbcsNg/VVnnoXvfim9elSleTU2hR9jOX1e
	 oOzQSuA1U30mGlKlnNDFz4TwUO1OfD5cnKBRvyYcCFTKLxg5X5AO4OzBwenn3FKfFzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623372;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SfJHL+LnVRB1R76oNOPPOaL+uw2rvGjVXvhT2Xe2FZo=;
	b=tSnrC4AoC/bdx0Udi/KXinfq0pP2RcqP79FUrltawB4d9tD/SDj6xdEV1nJL4bWfpcbt
	 HTwcKc6XMh8rf3hZoUJBWdgkiANMoECoUaXQzKxK/jtigrE8eWZi1sSKqey7DivfiV7fF
	 ClPZYOhg5dvivSSVaipPunB4O6W2czCIeZAlrtadAamOPoJVnsEE4smQmB2+qk83qeY6d
	 PgL0XP99p41cki3uUg9goorwtxFxrO+qOXhOyvp+tTbhZwJ1yOEgHodZDnayUv7kvLvTT
	 OMZzPwlEokfjl9emzWwS4LlvxDmkVF3qevD0Yk3F1Kadvp734n6l2XzAy4uWNeBE1RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=imzn9mgE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uwy0eDKL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5307260A260C
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 12:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5307260A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=imzn9mgE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uwy0eDKL
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A3lG260584
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 12:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfJHL+LnVRB1R76oNOPPOaL+uw2rvGjVXvhT2Xe2FZo=; b=imzn9mgE7jpQF7UJ
	l5NhN9P2tCVnLxb4TdTBR2FOSNJYdj8wTOT26//AF1GPF5PuPIQFSP5ViGDCvCa2
	4mmGrgG3D6wFmc0KCDipUueSrm3NRhQkBzh3GoNpLwmwC9BYu7cq7Ua57vaYcUdl
	7YgM3f7Fj1J108Q1ZgoO2WvAuWPIwY2sapviVFR5lXCi3+SLKGXIo/izg2gXY3oL
	7iTbK1ENuliAtSaY73WLoFYMb56uptzP5XHbepiephZGbLxaLYsO/JhzEU4QKGII
	YlJK7qieMGwQeYo3B/Q8gJ8RC+Ywd4G10lvOIH5zpCYXkTkGoH1cH/FMvobYmo0l
	TdgZ3g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvrt9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 12:42:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53630cded29so4828631cf.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 04:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623366; x=1794228166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SfJHL+LnVRB1R76oNOPPOaL+uw2rvGjVXvhT2Xe2FZo=;
        b=Uwy0eDKL817AUB94HBX6tLm3kyv3bSLuz66wWOUaCe5TwmrFzkWAadRaZj2aTLi3Ed
         nN5vH486S6zUvguBMIf91IPM9KMP2sXLUpfl0Qv7dj+2jUJhoa1LEGs9a0dla5kpOGo9
         mpf9rW9yyfURBrM22xMqFrNpsGNSk0l3XQY/239vjpV+VobsFQNxeK0fmVno6sv9ghP7
         YYXAkYvjJUOFnEA1Zgj+tP0gSn/OxbM+VA+++g4GyjZR/8MeNfLV1rKOgCCSxhia4W0e
         n3btgkFqwSu9L3gcmT61VsxngpodCq8lvlmZiV51O959CXQid2Et2Gxdh9t413bsuBKO
         Yazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623366; x=1794228166;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfJHL+LnVRB1R76oNOPPOaL+uw2rvGjVXvhT2Xe2FZo=;
        b=OHM9Om7Yc0HG6mH45+x8eImewMny+CcX2rvEJVEvMpG0QiRyNib2CfG79QIeQt6eBY
         3QeU2OlgE66SnpPOd07iNwSqChb+PvD1y8+Y17FL5wajNngQP4Ax0I4aQByvayVOOVmy
         kgzzNYL+JHhCdOfTiwRTm0eDWglihj5kKVIu+gIxMA/hFv0h2lvQZVZxc72ymHp9Kmhb
         jFV+VpCT9uJFkpLBKIgShyhUg3BCUiiqtQoo4XT5c2asn/8zKAkZ8Upc19Nv7yxB/IDb
         dmORdHjMlrFSQEl4X81w/iGBsICdcd+4LAQMUj3aKC2XzmXoeCykWPTa1YTeFlUfUYDu
         Q0Xw==
X-Forwarded-Encrypted: i=1; AKwUvBxC59iAXlnX9XZYOSA0m3KQkps8I/OVKs4KF209xsAriKizk8o0d7gbYgfnO5GsGncfv4xDMN3JBYq6@vger.kernel.org
X-Gm-Message-State: AFq9FYJuT/d5Ay30eP5MfppbsUnRHOuooVaLfEj8B7jH5L313qRWpi/E
	vVuTZRwVSyQVlT6DWIhiKy3NP+cvkJIzNqu7n/+YuQ5imtUs6avFOxNBiFcAZvu0j3vYMuVrhWs
	sdAlO0xdGvVzKjNGK7En7yZGLZMdLThp++d94GODCurtF9m5Z5mucYejsQUY4/r1/
X-Gm-Gg: AYBFou3najBc1K7RBTY4T1qjOPw5+P3Wd3KhO3pWJ5crN6OA5KvMIx6y947py7YApwU
	cO1EQQkFnjbK9+UepfefMTK+SbD1YYxBnf+W/57PiYW+GsLSUIlCQFfCNwy4PTCT/fsrxkfhu8c
	dsL9qfLFJCO6QXe6V4QxoE6EYbe++amiLcKOmHaqAZ001gbdSftwq9Cgpd5KHCKt3wjrDjWrrc6
	tG63kRpNIMSTLZPlhFFHO72DrV6xJG1j8KbbL74MABlazBVwHvyDDqogDqZz3W8AzpO6gvD1eJb
	7X8DXhd/h0OXLgRfdRIzxajt0M5HW4oTXb45zB6fWYlJy4vlWe8nvGV5srke00xqe/ccwwXi90y
	3BTgTJ/UerAMRyVEFjwzWBcATuawbv1VLf3ambVOfkuIvhtMHvt7tyLzP
X-Received: by 2002:a05:620a:2246:20b0:93f:1fc5:f07b with SMTP id af79cd13be357-9442151da69mr1608067385a.2.1793623365406;
        Mon, 02 Nov 2026 04:42:45 -0800 (PST)
X-Received: by 2002:a05:620a:2246:20b0:93f:1fc5:f07b with SMTP id af79cd13be357-9442151da69mr1608063585a.2.1793623364967;
        Mon, 02 Nov 2026 04:42:44 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc18e78sm399183066b.9.2026.11.02.04.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:42:44 -0800 (PST)
Message-ID: <99023059-0d9f-4ad4-a861-299006ae32a3@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:42:40 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/11] arm64: dts: qcom: Add initial support for
 MSM8952
To: muzafferkadir@mainlining.org, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Jassi Brar
 <jassisinghbrar@gmail.com>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-remoteproc@vger.kernel.org, linux-input@vger.kernel.org
References: <20261030-msm8952-initial-support-v7-0-ad748ace375d@mainlining.org>
 <20261030-msm8952-initial-support-v7-9-ad748ace375d@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-msm8952-initial-support-v7-9-ad748ace375d@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae88546 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OuZLqq7tAAAA:8 a=pjH4mUHWGEoP9p1cUU8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: 4tEZgse5VKPIVfIRbK7eKbc4IbptbRxZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX9R49CiUliiQF
 aiJ9hCVCDU2fYty2v7Z0Sr+teqmllUwGIZp83wFnmM7HGwn6DowDPrAiN6nz6VQ6ml36x3rI7G4
 4RK/JGkt6XJoXkVNIgP2+KHBXPKxp/0=
X-Proofpoint-ORIG-GUID: 4tEZgse5VKPIVfIRbK7eKbc4IbptbRxZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX5eFzAUUHYvGm
 IY8nv0tVZVyC9HvZ3BvSFzXf4Nnix3kKcit99SZ1iXyRTjwbVKMb8aSbrM+mORN2Hu8LMPlKoZ1
 nJoqTZvVcafQaX93Y8OEWdl0JYkxgtj9xoeIIbo5BI0knX3pk405ef74N/Eblr0ss4tZK/CFbtf
 kMaahW4PuDq4QqArPU5Id4rLkeVEQY0WHsRFWj5+hj8hydlMnCmkPmiE9m/OwmjIJkl2fzOqFvj
 wp3qwtvXM0eOmyFiGnOCCY9+vg7f9XFJEO4bhUlYiC2lYEkAytiw98ReH/2tG2fwFSLFVoQqeHu
 /0hzHUJdmKa6Wp2fJxej+F2FEjFrDALcPOjkTPBjfuwVy+Ilw6DlAsfIWOUUEJuSVxIr9E4NQd8
 UzY9oX3TqKl/9dS6m5fE1cJGBv1m7wBV/p1EDjJaHC7Vqvn8Yi3a9wdOGiDuYE+KF+O6kJHMYak
 hu7dHiNM85/Qdnj32Og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020050

On 10/29/26 10:02 PM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add initial support for MSM8952 SoC.
[...]

> +		mpm: interrupt-controller {
> +			compatible = "qcom,mpm";
> +
> +			interrupts = <GIC_SPI 171 IRQ_TYPE_EDGE_RISING>;
> +
> +			mboxes = <&apcs1 1>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			#power-domain-cells = <0>;
> +			interrupt-parent = <&intc>;
> +			qcom,rpm-msg-ram = <&apss_mpm>;
> +			qcom,mpm-pin-count = <64>;
> +			qcom,mpm-pin-map = <2 184>, /* TSENS UPLOW */
> +					   <49 140>, /* USB ASYNC */

USB DP> +					   <53 72>, /* MDSS */
> +					   <58 134>, /* USB */

USB DM

> +					   <62 190>; /* SPMI */



Konrad
