Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49AC241690
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 04:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774327712; cv=none; b=apSBGxTapZlT82oI+eMuxLQgjLbM4f+FXO43dM0GHKQPQJrWNd9Rb7ZS9zTui0s9uMyIZ4T1rrHchroXbIQRw5w39UCHDW2HhKMFgIm8LcexzkkzWf54K44d4cnzGs7E+ea/wGweXpBKy4rO5zhRU1lBwxpZ3JhDoKgqRmjpbx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774327712; c=relaxed/simple;
	bh=MqY0rvVxZ8EWepxH1jMTKMbCOC3ejPwoTXI2X/mtWe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EWchz18/hb9LsOqH+vabT+mkO0SptrY8I8tuSeblhKMcTP+rDat8bnyvoKlV8NxgyI5xAPlTrfzpDsksNaEekMM/Oj+JWTGNdhibXE4rhdwVmeIvw+6MBy9SiRrclpQcA/BeoOpM8W00Eq33SElnVL/iOXRMR1zMZDMmt51gU70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfwQtmA2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JqO4ukrt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DfwQtmA2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JqO4ukrt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3eqO2943589
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 04:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zeigFvaue2fOm1v1THIQ2tyCHptET7HZIXbAdvlVh1g=; b=DfwQtmA2Tol8kT0p
	AyfPrBdbO7Pg7VbmAULGksQZ6QurwM65gWFE7oNJkgDyzwKoiVeXJLGLiNMwYDw7
	P+eI/Aqs3BZsdC5v97cUxj0NqiYgBqoERnwM4UpjDhd36IIpBD6BAQwO1OLCq3DH
	NoHgCh2U125+kq8tAXfcqg9F7YZe4/j5TGinmJ2UwkcLCD+T/7qLd7PRlgEx0bLq
	wxQ1C0I25n2+pZSHBg80E34lf0IE+gDgHsQ+8YgC306yGx/3rsqRVP6Twt2cR8oJ
	ETh71+liKIfWTefm08atbUCwZZbb+bKwPe0lxI/zFjCGsd9xTxTdPKZEJbDrpD03
	6BAcQA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vku79g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 04:48:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35ba4bf54beso4463239a91.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 21:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774327709; x=1774932509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zeigFvaue2fOm1v1THIQ2tyCHptET7HZIXbAdvlVh1g=;
        b=JqO4ukrtShsLrUtUAa0RKlwIXTo+wmaNt6wi+/OC6TUOZWHM6uXh6f51fjUWv9Y/nv
         O/mKVclMwIJJErLx7fuoDgznPj9/h2kKvmJzp0hsk/FxjIkIbXIhvtXr2H2kDq+mjx27
         Wh808su2t9gjAcARo6OjIPG4wV8aVmdDWtubMdVgD45B78Cv3C7DFYjNbDTD7c1jc4r+
         T47qrYmULFMxHdsfBzdMWKfc9X/EAk6k8fLlEGUvX69qv6pSviFx8PWkxaxgvUk5SQZn
         d4/WxWEIvawNLEVoO/25NW4DOLbkd03wPGZi6dYLFe/gBuE9fkdln04nZnMiMGEmVYsC
         25HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774327709; x=1774932509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zeigFvaue2fOm1v1THIQ2tyCHptET7HZIXbAdvlVh1g=;
        b=iHprEpRqU4dv8IxpJRL680j/mvyK3QPZdTYNlp86Yrt+Rkms7QzEOK4L0wyuk5p9Rs
         EVCEhsDqCRlu2QwE+3DPvK2qTH9A78SFiQeHzxkMaFBAEDrp28ofYu/Y/rozrvshaI4i
         Fksz2OCNN64cuor27aVOtaho9826zdw+/xNdWuh8D/uX2QOgPTEHVYevJuGjTaCzg7wM
         AGnW35qFJmp28fk3MDFq4dBDYQNY7POFlKyR4Xu3+5dyHgexHdnvpyOdGzSzjs3yIFdi
         sDjn/iUgWR6IyatHk5rkVexEhvhBvTIKSBoXp7oJea4LP8w2qup2GoO+YCDZB2vEcw6T
         gCTA==
X-Forwarded-Encrypted: i=1; AJvYcCWerHPso8ZhStdJNFYn5gYPHLHth6ldA0MDFH19/L2wBSzZ4Xn5SV9zBfhTFFHkodOBu4HF3tB237Dp@vger.kernel.org
X-Gm-Message-State: AOJu0YwR9c//9PUY3Qa8ihg/FSD3ozZ0CAvCO/9up8QSvIe8Lr0NFuoF
	fyUqlmPmM6RDz/on47bhlH78GW/26Hhrev8hI/Ud6vXt/yoeDXCQBulhCkHb12VVmTXhVJGODCl
	Wfr9nkt9FOPQhlnYRY9aIZxw43SU5rGe+2IOitoxQ/JfXEeRcjWQ2N38GI7dG0CMT
X-Gm-Gg: ATEYQzzqJ6BM1ut0l76yCSFDu4Uv8e+t7xJs5HFGTms6lacgYweinOK7FnZXNtPaw1G
	OiOYOvvh6XaeaME1DIbKaU1IGKSIF/CRK4Kkbs05jG1wHYHdmLuIA7zYXLOIH34SeQyZDji2w/F
	BjTUa8w2uUr3pcq4KVRw5rIP0dhcPG/IHJemnk2xdV9bcuwKeN2v6j4Rk3Y1Ebyd9mdjcwkZuyk
	BPsps43ZAD2h7c/Z7CBMbCBOxfYVHtUOvKqPguzvSzHws1oD8XA7zZOVPZeIsm497DXs9cfIiN0
	qMdhtsj/rkZw67mWY6bTM1ifl3MNYBW4YTkLrR0FwHmTzqvGAx7xoEfezryDp1R1smkyX4QhwOh
	f97Dlbsq+NJdOdt7lutwyWStq1Wk6t1mwnxzqEXhTq54lQNdKEa8G
X-Received: by 2002:a17:90b:5108:b0:35b:9cd5:232e with SMTP id 98e67ed59e1d1-35bd2ce4493mr13430856a91.29.1774327709467;
        Mon, 23 Mar 2026 21:48:29 -0700 (PDT)
X-Received: by 2002:a17:90b:5108:b0:35b:9cd5:232e with SMTP id 98e67ed59e1d1-35bd2ce4493mr13430834a91.29.1774327708987;
        Mon, 23 Mar 2026 21:48:28 -0700 (PDT)
Received: from [10.217.223.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c017477eesm386657a91.1.2026.03.23.21.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 21:48:28 -0700 (PDT)
Message-ID: <7d797c67-25b6-48c9-b98a-4545de86e45b@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:18:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] soc: qcom: ice: Allow explicit votes on 'iface'
 clock for ICE
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-2-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-2-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAzNyBTYWx0ZWRfX2Pk9dMtI9h3G
 2NyClqrjp7mCrqD2kwO1y/arxeueHsQ96DF/LpWsnMPc/YLWwJjLPRyWzEw6dLGKwXX5/rfsLdR
 w0yYW7d6slJ3Eb1jSX3fOjWgXfHylz0ZQJV+hrNbj71HOaJgpXnVH6pltTxWLtqBTaKDz1QSxrX
 pzetahI+PA5v83bY/biAf4xIr7CyeO8wgrfXuMJlkSC86buJzSE/ti7cnDSO4z0VPnTXt9gkpzk
 n3UOpiUAarjtNIFet7vEgEyCwcxJp2ay/oKPulAYdZylsBtEU3OUYi2FIOB7PnXG+f3N6126v8w
 Sq1oK7EXByrRh0ga0pe1Rq6ZoO1pjPd+wfYv5b4uCWpxe2RzAs7A5r/lLBBOuUQHrP4bBotthlR
 kI3z94pnNEMaRKre8kOlhVKHo9c1HbdWjnEUKB/Fydpiav1LtiEtRTkfBKicUaPvt3Dol19EZ8d
 24g0wMmSo61TaaQH2Vg==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c2179e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=SBCaeXWvHhY2KLIX7PwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: wH-nugtzb7oz2fxwhVm7LiW4DorWytiJ
X-Proofpoint-ORIG-GUID: wH-nugtzb7oz2fxwhVm7LiW4DorWytiJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240037



On 3/23/2026 2:47 PM, Harshal Dev wrote:
> Since Qualcomm inline-crypto engine (ICE) is now a dedicated driver
> de-coupled from the QCOM UFS driver, it explicitly votes for its required
> clocks during probe. For scenarios where the 'clk_ignore_unused' flag is
> not passed on the kernel command line, to avoid potential unclocked ICE
> hardware register access during probe the ICE driver should additionally
> vote on the 'iface' clock.
> Also update the suspend and resume callbacks to handle un-voting and voting
> on the 'iface' clock.
> 
> Fixes: 2afbf43a4aec6 ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep

