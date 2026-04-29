Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B7933BBC5
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444698; cv=none; b=J0SlUjTZy4Vh+yrYrJ7icSupAZgVjPu5sBnDT40tzxUl/L74VYfMzNuN28ez0SDEZ5Rl6HbjYAUHiguM422oSvWLZFoytPUyeEedoxDd5YUUojSQK/MHyRTfEpi5n8OFutKgcWDON0Qpllax1kOdt8cKpzIIWwuaOOLvcXsvuas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444698; c=relaxed/simple;
	bh=XhmXxHf6t9X/qq4rm1vOj8m15iNiJswZAQYxVRMNVsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DfaaTv9fl9fvxb9CUKeNyx9X2UcuU3OYmY5IVWKPA8LcAdY+h2hy08j0IPi+3KiykyO+B8wKvWjN6DaAfoR1UNWyxJT9LoIFjMwCl3H5APbLo97He4OcQPBvIeP9kF54Dm08yzEgBUIv1RH8igasytgVKeuXLzPJYGUDQL1L43I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G5XP7k6E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=itV31c6Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G5XP7k6E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="itV31c6Y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T0oKif2008553
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5AyjVCMFNf9lYbonwqaMSJNI
	FMhd4UQ+yRvFcbIuSqI=; b=G5XP7k6Ea4Q2PX49nngybUtMP+RdBOJ2H8qXHnQ4
	RaZpHb8fgBFTzucSvCCdCivwHfICDmypRsi03z/xeDnazyTNi2PvfJTz4q88JA3J
	qd9ZV+ZAuLxDXWSC8rhRpPlNwuxPpfjUPotuFNU2i21hU3llcLLy+/PM82qMQbPY
	c0ueXDvLKqMtE49Ff/rbziVHUzXpiUeT4pZyhbs5wCQdz/eA8YjlZp5XDFbyfdt5
	2a5uSPBaFM5zGTqROnoQT7HRZIZl9i4sT7T0OwNhdKqL6OFiPCFP+Gon9lVIXxmt
	WzxwrYTkulbkp99UKr8+3thjMzWpoiyh731+0J0a3EJE/A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du7sx91er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:38:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50faf575af4so93043601cf.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 23:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777444696; x=1778049496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5AyjVCMFNf9lYbonwqaMSJNIFMhd4UQ+yRvFcbIuSqI=;
        b=itV31c6YxZtgOzHFivHoIbQvIey/dVuGge5kjGNmoCn5Ikk/Se9q7GErkm+4NbBx2A
         Z1HsoG4aJSRIRndKsviscKJzj3d5HcdfD59+E9jtyS4iZHGeLBL9t8woewlJSI1RQsZB
         2RMLAXnf8HVSCs874/arNn9f01hU5hkESnZRdGZTe1MNWVAV3teVf1oagioCo6X6WJ5D
         qB33qks552M9lqJk2BWNb7LoUIpGpNI99UOSX4YyAa9/qKArJQMDvKV6z4xBkj4odmAM
         sYK6cWEw0/shupDFut2KfBLGmXhqK4K8/dGZ0+Mj5r9L0OkGVq1bPSMBQ0wH1AknbhKd
         NxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444696; x=1778049496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AyjVCMFNf9lYbonwqaMSJNIFMhd4UQ+yRvFcbIuSqI=;
        b=nc0+p3I1pXswKUPtLpZub3KVzxV3UdOtER6Y9H+PEArnHU9LXV802XYXDtsYngSsz9
         juusvwjEFYrjCjPY4Vi9bKgRLIClNqToiSDsxofkHnoLBDEXCwP22Xn9pC53rG/yCrOq
         96kFiyU3tgvAO5sDg6qU7PQ7J3VCd4mTHHHmbwTmduZvfdW8zYMPl7rm+mvW91QuIgqW
         Epx4Qk40cRTXFFBlvQw+HIbwtXH1SJ70PTbQzEGiLMnDQ/rb9n2naBRxH2O2hNgxCdNJ
         mgkL12Sid+OpoP71APDuPk/JLiNhNqPM3DZ7pO1imf0kH2V1ktj5GwxTzv1mBDl/3EPI
         1DiQ==
X-Forwarded-Encrypted: i=1; AFNElJ8C6UQECHcfJskF2ptR0NaMAE8Dwi0QsOMwe/JjqSr5b1sLZPBm+3yDAyUKe17LS/plVBlNPS+qRAru@vger.kernel.org
X-Gm-Message-State: AOJu0YxHRtNUlONwAe+P2Uo0kSMW1kxGP3Jdfz4ZNDwEppeGS3dpedOg
	nhPI1AYt8WbgfNVwzvs1aKahmpAgOoCGLjpsKCfXV2ULcfLJ+9Q0V2Btw9f82qMB21N2cKG4ALL
	ky+zA5JGslCGPe961/XXKrc57xIOkmaT4kk7xNCZ5Cs2Q6wKfEWWIS1HZiNkrUf5I
X-Gm-Gg: AeBDieux8zgb/dq7us3cQrxpHcnG4sKiVEg3geMSmrDLsXfJGWvTx8cPL6s5vJZX8iQ
	mKQzENm+lP0acroClMFKucibGuG/zZV4IQrOqVU8SiQmYWecRq4UbzOS7Kd5oXyPhBtzbqwcekT
	qgRjdLFylyOXp22XH4JqRgFaHn4bfFJQ9DytTlYukE9G420zqw+OLy6tFdud+00UkTvX85QaGJ7
	O7nyEVBVZTjlJTwUnRhSEEgESBJUmlKpVZA/94AUJ2ItHwOvSBWNrcM13IrcHg/3yihUpJvEySH
	culAjeNOVQ4RcjRMu45b+ViZxK0zncFawg0Jl/cSVA9tZjHMX77cJmbuMcga8Z/nT3dB5nMDVsp
	UQBQk7Dat6TGBDPboSs4YOEFukPbJt9G2NULntZT7ZvzOh5g=
X-Received: by 2002:ac8:5912:0:b0:50f:b003:59d0 with SMTP id d75a77b69052e-5100e12587amr85875181cf.21.1777444695843;
        Tue, 28 Apr 2026 23:38:15 -0700 (PDT)
X-Received: by 2002:ac8:5912:0:b0:50f:b003:59d0 with SMTP id d75a77b69052e-5100e12587amr85875011cf.21.1777444695415;
        Tue, 28 Apr 2026 23:38:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7217c56sm3327821f8f.20.2026.04.28.23.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:38:14 -0700 (PDT)
Date: Wed, 29 Apr 2026 09:38:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
Message-ID: <f7xiboo5wtygvrfbb3uvijebvn7cdd7vj3awzq7vrxqzj6lv2v@7idpzmlscuo7>
References: <20260429-c630-fix-idle-v2-1-ac867dad6f21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-c630-fix-idle-v2-1-ac867dad6f21@oss.qualcomm.com>
X-Proofpoint-GUID: 2ba-d9AKA8bLsjlAZT82C80Kd8wEzPSN
X-Authority-Analysis: v=2.4 cv=eeANubEH c=1 sm=1 tr=0 ts=69f1a758 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=sKc_6r9Q3NEXqvRLBRoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2MyBTYWx0ZWRfX/HssH5Bo9Gkd
 VqwuJvjAirLpRrkAeD7ISyZUOpDvoOoghJmsHGNoVT14iaGo+T5FdTp3BL1o/y18p93OWfokryQ
 mmmKk5FOq0azh3FCi28i7uAUKtHVEyEq5rJ+YNNBlUST7T0R/84oK2KCqr+9LzhrxZIEUyb4AfD
 0QocKzacyTn8qyUfOuNb7h8dgPFzCYVD7MZ60vaNCksthqXveXbji5A/5tTy9yAhZq6urV8ubXK
 ZeeZcMIjIDVp7Kmcnep2DHMBGLvQDOvXvp2p9lbWvH+cBL2U78GRAjFcKsCjb+Mz9+XElhFbAFz
 LiEWs6yRmQfCLhjqemVoRfH3U5p4jiGS1m8wvclB3wMVgBBZfWaH8bOu5OTnsxh9/CtP+6YzAds
 /eBRuEK8wVeO5HDeevk5JDEYx5/OMz/LWXuTNNXexwf4Dup6s8tcTIUcc3DumN73HqHqPnOT6Wh
 Vsm7MXbcNYJf7Cwe+vg==
X-Proofpoint-ORIG-GUID: 2ba-d9AKA8bLsjlAZT82C80Kd8wEzPSN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290063

On 26-04-29 01:27:12, Dmitry Baryshkov wrote:
> With the default PSCI suspend value for cluster idle state Lenovo Yoga
> C630 isn't stable enough. For example it might reset if display device
> isn't probed early enough. Drop the bit 0x4000 from the PSCI suspend
> value to make C630 work in stable way. The bit was found by
> expertimenting with the cluster idle PSCI value. Most likely it results
> in the less deep sleep and more energy beign spent in the suspend state,
> but it's better than the non-stable system behaviour.
> 
> Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
