Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FBD43B3C2
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787053789; cv=none; b=Xk9FDKi2bnLOlVSQ5yqYcIjQkjwShRHhs1UQ/axZGZb4lGyjq8t72KWPAjTKBmGOpcoypfgRbU9QUIzc5I7LcorG0rVxlvGyI5ZEOz6qA2Pp/nN1chuD1JjzwsMuDMoZ43/CHdGzaPb3YQISy0k2dVbH88XUbEcmi+aqJugMxSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787053789; c=relaxed/simple;
	bh=+ncQunOLg+3adZ0fkUL0uOcEX2puEMXSJ5hYj2pUepg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dMNUA6KPzeXfknTPN0yTEPBUmhGxrV2C/V7yTTStHWq2NDr9VQcpf8OL9ONwBcZoCyzv1n+zVNxId7hUp1lq3kYFC6POMr+6MFAeoL7UwmE8bzWi5uBSDlUfXUwO9Zx/TyY6KLVju6OYLkOm2F9BZqLgvuak+J6mZzvPt1t7xSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bt3DM2bP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K9/uae2y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bt3DM2bP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K9/uae2y"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABZBH3979099
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mte7UDgA0j4yBE+BWfugup4BEZ9nzYYERy5lNYvEDMA=; b=Bt3DM2bP1qDZrz1+
	0Br//RWsPBc8mCMO1oeuVkNTd5Akce1FT/U5vJ6oTp7HNMS29U3RkuyVN48KqK++
	+ONaeO+pgGpGAWnm8OSQ44vUeZU97P815tnuf4tkhhidhIR1ZRpO/yTX3PY7vOVf
	STTGVmAf3tI3+9Ot6slcgsLmXWQAUNvxNRosi/6lxs7PhWIpwE/f7YwHMOKTLNH5
	ZMb6L+dqYv2s+nCNUkThjjHWggryIdTU0DMbdtfCnHY8DQpz6PBv3//+I36INbgW
	KRfABgI/C5NZ+p0AoZXGYSFULn3k2dE9AWycTV4IqogFzvwRmHlXOwvX9srfSBM6
	HcEBIA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ebpt98h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:49:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ca37ce4c3so5170921cf.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 04:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787053786; x=1787658586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mte7UDgA0j4yBE+BWfugup4BEZ9nzYYERy5lNYvEDMA=;
        b=K9/uae2yhk6Vb2zu+ET1CoZJZZcXC1WG8F2OPFnC8yci+8ngIy6S4K7LZw8imWHAj4
         m+gU9yeZC70yAxVP4jq/FrbmDi7S8r3Os0mcobqYeIbpeCeJmOa2bd+f9rK44c12bQf4
         6+/aU9E8kRx6hjTd/Fu2D38BvndufVk0nDKIIBQLLD1E0OiuqnvIGy/oM/N++kPoTy1Z
         /+PQzGQEv4eHVWlpvNOH+DmqmFSbW9cEGshEmfaq3nrXs7ekhDhgfOlLVAQ7uJbFhaev
         jSh5MCls00IiZu9e4q9ejKDAFZ5uAMotlmRnHWjNllsvCH9spUu96tkqTnEDcTq7MxK+
         eIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787053786; x=1787658586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mte7UDgA0j4yBE+BWfugup4BEZ9nzYYERy5lNYvEDMA=;
        b=ZeVGKVqEYBpaml3GZrTgkBTsSCKrzwOa6WogVWrb41igB6Mqzejy1Jnv5jYJ+oR5B9
         uIjWIXPA1BfC8MNDJA/8h775sXbXuxTrcnSGUXV5OJDC9h1j7MVKnlpSkKkhT1+PaTDb
         Z6JyHoXPvN1pLfWbsuClvVLOYpUfSaV9BjbKE7rwJiGxYkBGZJ23I82adN6tj4apZaiF
         Utb36PKtmhBAVylnWH5Ia9RujTzoGOHP3s09/NlElpdzh6yaGaCKFTjwy11NB1oS/qQa
         gwXIOuUG+tVMw1m5GYxx2m3Hjvpqx66zSQTEE7c5gcC3x3CMhWy1azaYvMlKDgRe0JvJ
         ZXOw==
X-Forwarded-Encrypted: i=1; AHgh+RoA5qTX+/Tb0PEvqTTjWot5fjah98vW3G1kd8nb1vYKvBlqyJlikbrbH3dw92OHUy36VsmvFIXyt7hb@vger.kernel.org
X-Gm-Message-State: AOJu0YwBq/+HjSI2jsu/6k2nxf4Pop/8OoOa+tVPnYqKBDYRTF54wuGK
	VXlDNDYRutwOrdkOoAQgGq+ZMMLGPUq3zKSf4cOAYDpbb+gw9kXSoEWug6+ISm2PtZOhPM/3J8L
	njokVwl5294Y1y+xlRk7hupsCRBb5c3FGRosqKFOcTOaJicULa9dcNgzySRrd8CsW
X-Gm-Gg: AR+sD10mAYUyIx1dG7t6m6713zyKGIQJKrmwv6mGc/vancHSv4C8xp0hvElxxarfNgb
	Apev8SM+M/ZhsXFoV/0wnDvXsn50iFesQDsKjpaFw6srMv++Zxc28ZnDiHUFIZG/AMeBGKZL2Gl
	aQI73mEotAaPd8N2q7jlufIow9PDAQIWXQ174HPwRuOngEunohDLo3XURLBhoTzyr1WgrsldGJf
	EzibaCpaFOVwnVy4FfRhPN+zJFGsXeVljxtN6h0glv7req9BzlXNesg9ewLqnvsvNPxYcTN0Txj
	7fEqw11J7ZSSEjh0QwaakjEJBDbUgkPQrLh/6ieudj/2JBBzrJqBtyKfQB3w1thrnh0S/KWQaz1
	rPNey7P7jJqSMDdjhOsKGwocJ
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr157037801cf.1.1787053786439;
        Tue, 18 Aug 2026 04:49:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr157037461cf.1.1787053786062;
        Tue, 18 Aug 2026 04:49:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d851767dsm1761795a12.5.2026.08.18.04.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:49:44 -0700 (PDT)
Message-ID: <2a11fedc-94a5-4709-871d-c63c46d0106d@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 13:49:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm7325-nothing-spacewar: Add ath11k
 calibration-variant
To: Danila Tikhonov <danila@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Eugene Lepshy <fekz115@gmail.com>,
        Vasiliy Doylov <neko@altlinux.org>,
        Achill Gilgenast <achill@achill.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260802133203.259734-1-danila@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260802133203.259734-1-danila@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XsXbmNWmTt5bggiHDqEFSMFhrTbNyyfp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NyBTYWx0ZWRfXxHtglGycGxba
 mdHtyV8I3ocV2VqkViqFp//0U2QokpBGKXqdpTV4IJQphhAO0/2/KK+We41/bHog4DSz5yZ8MFy
 KDvOUqi1o/rUuwlIdapHpNo+r0C3LNX6JZ77chZ7cnU1TZUu0ZuJcACg86N4lDBTggX3NqOOwwH
 Rbn2+zZVhig9KyOmou/OblF4ZZz38w1sWXxKGkVihU+Zg7YyI6ktrzQRscFKBNrMlr1uIJmTw7z
 FYoOE7i5uMTv4NO/h9nQa3C0vckQyDxQ7c2PPvhLkuz87ZfHlOqvzBODTIL+c3PZzFbu2PqPTlz
 Z38xXlvTHTZvH8k92FxcByie+hkIU1cmz96i8LgqMzj51tKGxkKCSETU06mHaKSZnI58qiN4ulo
 5jiekPxgG+h2gEcYtHev+AR5zU+GuqLjb6JcGD4Q9HPZIBfN54lkotz2bib8D3qBNle3fn92vmS
 lPT8nUlArtVqZEIjwTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NyBTYWx0ZWRfX9GhkOPeKVmPo
 +fQefb7rrgErspJu3ymRtUB0AQATblCXr4j3/MfzolGU/BuujECO/PutSCSvykZxacdkzVpQZmm
 u+pHxibZtg4U21GGjec/z/PROVVrX+I=
X-Authority-Analysis: v=2.4 cv=FsU1OWrq c=1 sm=1 tr=0 ts=6a8446db cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OuZLqq7tAAAA:8 a=HtY2ukNJyi2W4sjfIL4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: XsXbmNWmTt5bggiHDqEFSMFhrTbNyyfp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180087

On 8/2/26 3:32 PM, Danila Tikhonov wrote:
> The Nothing Phone (1) has its own calibration files for the WCN6750 used
> with the ath11k driver. Add the calibration variant name to the DTS so
> that the appropriate calibration files can be loaded from
> linux-firmware.
> 
> Nothing capitalizes its codenames, so the capitalization is intentional.
> 
> Signed-off-by: Danila Tikhonov <danila@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
> index 1e78a42062c7..85811b5de4af 100644
> --- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
> @@ -1546,5 +1546,7 @@ &venus {
>  };
>  
>  &wifi {
> +	qcom,calibration-variant = "Nothing_Spacewar";

Have you submitted that variant to the atheros mailing list?

Konrad
