Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF6A385D66
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 17:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780075869; cv=none; b=aphQ90y0tT4HKo7WhWarfCW945gluHNmBCdH61TrjHn+UpXcvqggmJpB3A95U5s9DjQpBkSFvWPcEcrzNKT86zAIkhDvfC78Jt9sAIq9OR7wBq4jrg4G3xl2zzKMyFXS2TpNwfID3p3SwLxUHt+4er4Kthj8QdAoCqf2fjuqXoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780075869; c=relaxed/simple;
	bh=6XtuzAYEfFRw+HYYz42AkI11W9apPm76m7J6y3guol0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgbc8ebw6gBoOZkHadwAsPN12WZNpjH88yFeEWioUeqtGzkw76wo7Anu0JF8s6iEAbtTfcPuZAnKRNhmev8DT2njzGyD0+J2dRNddfR/7gTL1HwazNIkWBctqR5nYNItKC6KhHn6nGN3IwHgnZiHKzR2qwpV9ASde30KRvRMVrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4esPTDH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nrufv9zF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4esPTDH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nrufv9zF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TH8e4h2857353
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 17:31:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fJDR0H8V82XJxR0Z1RuppBFcrPl2HmqD7fethUF331U=; b=X4esPTDHlq+Rsv8C
	XbAcFT9hcaGFg+2OcBQjIPdDp0LQGn9CtGtOcrfjUnQuB0OsJ4FLm5a7uqYd2R/A
	vviQZtUGLD1Zww5tRizwiuO+5O9eny4ME6bhlPQoEsnHbs2mGGhv9yOd3K/MkUyt
	no1dFEHBlc21336KaM8+mWwh3RoF7mhff+nlFlO18jFuFoHAmAMvogt9wso9ZZ7V
	J3rdS3i2lzRxvNslmAh26ZCFT+Pa150ebYXyp79xHtxLIgzZzKz01woDGCwutUIu
	DJTF0TgnuC5gcTBNHbSy0NE+L4zZAlMM2vOAcW6aXypzOx+S9KnYiKqunG1anTNy
	5J33Vg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef4jj379r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 17:31:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bc7f9b2213so105589865ad.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780075866; x=1780680666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fJDR0H8V82XJxR0Z1RuppBFcrPl2HmqD7fethUF331U=;
        b=Nrufv9zF1QfK5xsRcVoSjI33YXOAosHHvXl4KuQXm7x4pUdsF81Xxma2cAjQKapoN4
         0yigDKkDm08nIJts/kJyBCcQc57MrEIXrQGy14AnRY3MjhWkUJxnVvYdrYE3KV2mZMwB
         RUJNhHzJJb5ERltg1WpgekVtqcqb48klwOIrcdt5Lxjmnxyswa3abBMdzg4vty9PcWaD
         mc6ySFj/K4/4Z6gQE5tuil01IhgjnzK6y7nPkZMdc3+ww0Frv4YMjdMdv2cFRWRW6gy9
         5J5/tX2BNuqfFHJ13wAikO7I0NclVcTStKKA6gXDmR/Bj+MM8plecWpIPFQRIWzLcm17
         vwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780075866; x=1780680666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJDR0H8V82XJxR0Z1RuppBFcrPl2HmqD7fethUF331U=;
        b=S6Cv6j9yF59hEam6QyCA0IsHXxFOFPJyrCrSPucu5SZ44zSHK2vQNsqj7EXhpoP8So
         kJELbGK89HMRD1CeI+1JOxwV2HHp+H4PUOhmf6jIVfjYRQKwei9Yb4rdXOFpvKzYZEB4
         gdUqHMagEu/PDFlYbQ8mFG6psm7PQTqMxRcfyit1d4mL6jojHvdeeizD30EXWJ2Dt0R/
         6xdMOiD58Zo6klSoBf+9bnu5CRPfgs0eIqJeQ1abwRnOtVuASTd3qAdZmfeexB8zGt/k
         JMUkQOabro4nxHL08oreXtp7CES7Lfyi59Lka/gEhGdC54VFMwRqg+9OOBBeQScRY6by
         ob0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8k/kBEjgaGcgxWFHz3vmBhFmXbwXja93OaePztQEqqHOBRpZ6LmZUlPsBBPa4CkfN0lXzIiM638fJK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/hG/zD292Y1VZIrMBBlN5YHggIFm5nFs7lpSh20GOlNogFoGi
	CnR5vi3iv5PVg/k0gbp0+vPq+1dvlYmsmOsknFH2nx4TqEaEfmJ8EWfr4pz0odBhZcUQBcY6DKB
	f5hUDUS/jOzk7PfzuQgP4rgD12DqHygq4UrfZO2VhgDXkofIOpGNPHAR0I6n6DQcL
X-Gm-Gg: Acq92OHeQBV0y09lZbvt73n67Ey3flo3eULzI9M3McxiC3rLBKcT//RRhv8+gxdbSmy
	IHtpq7hvS/IyuKxB6oMZgJP8xjPHhiYU1voYUbcZSNjiq/quDPXyk4iE7cmy4idnoKdTlwqF3Y/
	fsHN6QmSre81GlgIs4+XgbRA0I3ub9jDYEOqbTnNzJ1mMV9oAGCuqOebJMZmhroDeOP6djTOpmC
	J4LZOGqh1v9ZaqRhzPHnXP8pikYTMWiZn9pwlnmmkAZvtJ8vCgTIGD12ZatWXI/bGvgqCFk/AHo
	J4vWSA/uEuB1w/YFpgZZHhT9+p4CKx+wplyrDpsSoJoPXInEC6GjsJIcBCALM7OaG7VEQSFjIHn
	WiREwrJ6a8rvY7oTpAuzqaMPKI5c9l2M7bphLxSVFJI8xV8eHti3mJviUqjzM4Vk=
X-Received: by 2002:a17:902:d50f:b0:2bf:2015:5ba4 with SMTP id d9443c01a7336-2bf3682a24bmr9445205ad.24.1780075865561;
        Fri, 29 May 2026 10:31:05 -0700 (PDT)
X-Received: by 2002:a17:902:d50f:b0:2bf:2015:5ba4 with SMTP id d9443c01a7336-2bf3682a24bmr9444745ad.24.1780075865095;
        Fri, 29 May 2026 10:31:05 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.224.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e71cbsm25476575ad.15.2026.05.29.10.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 10:31:04 -0700 (PDT)
Message-ID: <bc2aecf3-fedd-4b15-8e69-33ca928831d6@oss.qualcomm.com>
Date: Fri, 29 May 2026 23:00:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: shikra-cqm-evk-imx577-camera: Add
 DT overlay
To: bod@kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-7-645d2c8c75a7@qti.qualcomm.com>
 <178000731452.4557.8537369407478321842.b4-reply@b4>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <178000731452.4557.8537369407478321842.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE3NSBTYWx0ZWRfX9FqVK1sY4K6D
 Xm+KKejqbph7YOfO/EW3N/gA9V6mRkG3YapoRMjdp3WWM0U/xXEELL4W6NQP82ibjusThll25Ob
 N+P6k9ZE20LLZ7EhN9DvFLrEtWKuzUXvq1Q7AR6SySf8N4U0nkQIG9qKrllDPccOsL0lgTktFmV
 erYvO175bcTFurD/2HL/RfgWcTBxRdU5tE4pNHFzvb1wvM0QX4K+L+3IjRE69SJFhDUncosvgRk
 aLa7o5RcNH9DdZSU/dwHKXpmxyvXfa483XMVDLj1jIXAdRwpGJ6kUfWYY1eRQA2o1nZMIAIr9DU
 WLVZIAXiuYoug0jchDFPdnBrtb2EsDeIAphB5gHk9/o2Uh30hvP6Ho1T5kRMlSKBGOs5ORmbdlS
 mhOFMXzzTfHyj7tbXKIqnCm4owyBv8iFGpXj5+UBaVnURvCQi5dm2EO38LX+t8U6xlfzUFbH1UZ
 y8Rj6/K8SKSj2MN9ztw==
X-Proofpoint-ORIG-GUID: ET77FY1CyMLt2iY3maPwQIlJSDFviZHz
X-Authority-Analysis: v=2.4 cv=Tt7WQjXh c=1 sm=1 tr=0 ts=6a19cd5a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=tDSAgCU/rryVExTQDfsVjg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=iShi-8OPmrKBgnXoZJYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ET77FY1CyMLt2iY3maPwQIlJSDFviZHz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290175



On 29-05-2026 03:58, bod@kernel.org wrote:
> If the overlay is not specific to board then the overlay should have some
> kind of base name shikra-evk-imx577-camera.dtb
> 
> This seems like a minor nit-pick and, it is 🙂
Thanks for the review!

The overlay is named after CQM because it's shared between CQM and CQS
both use PM4125 PMIC with identical camera supply rails. The only
difference between them is the integrated modem on CQM, which does not
affect camera hardware at all.

IQS uses PM8150 with different supply rails, so it needs its own overlay
and can't share with CQM/CQS. A generic shikra-evk-imx577-camera name 
would be misleading since IQS is not compatible with this overlay. 

Happy to rename to shikra-cqm-cqs-evk-imx577-camera if that makes the
shared scope clearer - open to suggestions.

------
Regards,
Nihal
