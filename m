Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419684E73CB
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658913; cv=none; b=lvAAtSRV+nhcsKJw9wQH8nY6YzT67ZgWXPMg8J8Sh6IdxlqFbCk/edjthI7iCr1Zo25xb4M0fJbdc/RS9njkUvtLwuZ5SVSXqcG7AIZIDGEwZsC4drGLJb6sAW7tZSDDHPak/YaSFHy3cSFaTgj8o4uNiVn5YTJbd2KO5mLd1yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658913; c=relaxed/simple;
	bh=qwGaYA5J8cQoMsVQMVZn6rsA2VlKVu1tTczIgrpjkX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKszb/U0Z0yNQWOEt3yJqzLaYcFSjN8PVB8gM7SxZIj3LcN/dqAk63cnOGZZLE7DrBjmLpy1prtl62W33fmw2tyrqpuHK/iSAqFHTi6iPg1wTAIgBwkSxY9wVbSXzw4wVtqIHi+ndYS1bSuzzPRiIs2uF11A6j1xT+DUFGoBrD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SoDptICm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ASzlukID; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SoDptICm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ASzlukID"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HECm5R2496797
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/+Kdrxqgr+DvSDtGHpmdyPJ+
	B7JjcHm1WIvNra5tjA8=; b=SoDptICml04LDj+/Hm62uX9L2Hm9dE6SyQxVys8Q
	k7ktWMgoOV8o+O/EpE8Qp+cXlre8FEjO/SdNH3MwBzXNJGtMoIrI6g+s6U61AQ7T
	37sYmKtsXOOYyf+0vxHw4Zkx/DAXj2rgUksaIzaS8YDdQ1RYSuIz7WDHtg9tOZtp
	uQQBGFuVRb9ybhW9TsaznIgeGGrYljvpNc4FqhDc3R/2u5yOj0kHA8VoZEfelkFn
	aPm+6x/m22buDEGhOAbyBBsu7QHewNMActhvFlBDUN2LjS2ijS0PaB0uKAevdswT
	3p9MyAqJVqWMTrNpTIsXcFnVAALR1pKtR0bo7i2f76CM3A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grhs6gbyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:28:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936708f129aso160037785a.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658901; x=1790263701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/+Kdrxqgr+DvSDtGHpmdyPJ+B7JjcHm1WIvNra5tjA8=;
        b=ASzlukIDuxICcITl9iPYDV+3iYdUNDfD6gkUS5UNm09dMB0oKW4FQUuQXlVzfzoaAs
         8GSpjmCKTXVkNopmgvqh4ievCT03QT7L+ozm2IcaxZz7ms4FfUWG693BSA/GBSNlOevM
         CFzYLdpphC4X1fW8mAJsYpt3PCaNu3Dke0niWDDipfvFVRM8SaVgm8/1+YQpqZLXRg8E
         5P0F3b9GZnWn/GyP3x9tjdpCMxYuHikEw60C+O7nC6Gw4wtQWSvnKz/7AdYseAvfXExx
         Bb2TOg+32dpl/x7EhJS7d5C2dlDyv7FafrI6pjOIW40qNrB1/sIAj1YI4rLnhJXR5Kwz
         OoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658901; x=1790263701;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+Kdrxqgr+DvSDtGHpmdyPJ+B7JjcHm1WIvNra5tjA8=;
        b=tg5hhVSgU3uCCfBeLXFDBYAkrL2hVdL7tm2sPjJQwX885Y04SaOznHxB5RugBQnM0r
         mHgzI8wm6szec7lI1MXeIP0uFpkowxs1iHRi8NrEJqZhehWv6Kd00r5wRjDmW8MDNgOP
         dZ37ogNnIm9VWa3TFMdGX0bXYsIZwtVWGO+2HPqvGHT4+cMHyExTffHvSKeuU0WWHzQY
         I9KvmJMz/eSvdyBrQJqH5nD3mO95wp995ENebysjyJUKOfXV3UyBpPuOhoUsO7iTC1y5
         XtblzSIanJl4sZQYwmLSz3YZ+y7J+DjntPbPb6L3PZxGRtSi3vgB4sByhnu3Xza1Z1L1
         QRoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzB25jkvuKmdfeituQ7Ji5WWuStgfPEutHJXGep0BwoMEPkRK5PUdO4+Y3jvQ2S5TOqodhC5VhKnAt@vger.kernel.org
X-Gm-Message-State: AFuF++kf4c8xGlXOHB1/bmI/j7RToiD43TC5vUPKeECtC4Ffe5wMpVCO
	uKrG0MW3quitwtnshMtfTkrIQz7Ekz+qcdT7l2/lIdCK3PFoG19JuK4mfoVUb6Zyfr472KjO3gP
	bQ4oM6jIeFU3IT1kgTTk6ppG9tsq0pYlnqgdsh0Kt7MJHcrD4iE9D5GYxjbbSoMzqoUJxn6lJ
X-Gm-Gg: AYBFou3Dd7ObL1S6IApkpDY3GmwhNfiyP/pbVaYkRT4IiFigfi+Gl/8j8SyIETJT7iD
	46pWM29XjfyfKPi5NlwM3Hcwd+mkkz8q25i5Q/bg5/NUU/98Ko27VQLtva6nF0+1YE9qiBoUhbt
	vcu8xPY7HeqwZtNsuIANPSkYelmRLyFMVJJ8SEZjxk4rcl9murmRFiio0WChNR46hEXFH4aSkmF
	8Zrq/cxxWkInHTySONpe5qfLFxmRgklnVQkR39GEU/E4PaJ+71l4O/Jwjyrxx8kxtJgOTUBkHLB
	CaEqV2Cqp/dIPbPl4q++9fcjOAEu5Lv7ML7sDbwC8Z+MewBrFMR6PF8JvQifhYMz7EwX9guwYaB
	zRcpD3mtH0S6SvR8=
X-Received: by 2002:a05:620a:600b:b0:939:fc74:b6af with SMTP id af79cd13be357-93bb76bb19emr1300810585a.11.1789658900973;
        Thu, 17 Sep 2026 08:28:20 -0700 (PDT)
X-Received: by 2002:a05:620a:600b:b0:939:fc74:b6af with SMTP id af79cd13be357-93bb76bb19emr1300804985a.11.1789658900484;
        Thu, 17 Sep 2026 08:28:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847ecf52sm135817625e9.2.2026.09.17.08.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:28:19 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:28:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 3/5] arm64: dts: qcom: shikra: Add mclks pin
 configuration for Shikra
Message-ID: <o4tjzh6mufahuvhllyxse7p6vvbmbnw4mlqg5zrmgyqa6ated7@m6rmnyse42g4>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-3-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-3-9b9596221cfa@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfX/T/2vtQr0QEn
 U7uh4902XQX6aC0W4LDgIfoF2SOB2cy1NO4eUMIaSHtOsRVcev+1RhMXAjK89E0Pt0BNSkopQKN
 kxawvEdv3FlOkQutnGN/qBJr7UjdB8mCa1N8fgJcP492Tfmbw5iMvDrKQNJMRMDSrBhULs5FQuB
 Oz2DOvrPC5XPvLNQ2eErEthVcEzmjuAQovUiwKo9RT5XcFooL7rRozqRVUsNYKK+XAxEtPc68V+
 u6p2YE/6/Zzw/ijyQf9ssYlJ9jMVu/+2iWbZpAjaFXCW8dZs9PfhvHtLG8VB3fBwPl1x7pr7GBA
 jlZrz067cMJP6v5iACknweNeRRvjewvvyrK3VSBI3dxn7CRANzSFkItuQTQShPBQ+Kix6/CGDLp
 +PCvDsqeDyRPpYavs9h0TQifDat2zxp+hJS3ylD5NlgvKB2dCTEMSs8YG3TSWC6Pt+VOWMHVGyP
 8d3HCnR8UJgxpWBObuA==
X-Proofpoint-GUID: 0uEuGuXp6-YTNGPUpfFnK8NgmceIld0X
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfXxc1XrRZwAVZF
 Q8hB4Q1pz0B3yTdbisWWEHAgrpG8UsmaPjGBV12zuLq2wmAUHPmjV+LCJ7T/QqURYrVMKK6J3N9
 vo0PzN32nFUh9B0XOveJeFyZAquGrUI=
X-Proofpoint-ORIG-GUID: 0uEuGuXp6-YTNGPUpfFnK8NgmceIld0X
X-Authority-Analysis: v=2.4 cv=cvwOAF4i c=1 sm=1 tr=0 ts=6aac0715 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kTwRDD6jQfcqJCPQX_EA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170218

On 26-09-17 17:11:02, Nihal Kumar Gupta wrote:
> Add pinctrl configuration for the four available camera master clocks.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
