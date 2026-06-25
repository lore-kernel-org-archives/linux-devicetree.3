Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1063D7D78
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 11:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387410; cv=none; b=GaHN/zx6uoT/ZlRLOQeucjULdR1G8R11U4ehLyBFVm3IU31ivjDlWpZ+XLHf9vSw1dUP2KTK6QPuwAykxIl/jxWHCYyC4XfDzudDZAcvyFuCMAr5tUmPhMq7M/Y8EHaECqrO6E2Bcb1fMUNZ0SQxJHlVEaJ/IjxPx66JHtHkfes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387410; c=relaxed/simple;
	bh=EKoghlk8RH2zNWov+Ldx9Bakuy2XIl3xFyMtc1/ag+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kqDzNwcb6KC/uRbi+17gWtfkvJLFUQQOwXnYRQxD3lI8SLOwRT8ep6Tnl9JO7710Eu6vVLGwQ7fivIxfKHF9luzVVXEDNPWUwvfCLA0S9ewC2vG/DSYXpIh6+qT8yYNyhkTQIZpbkPik6qIiXA0uTvqGoLKuCVDXPEEeyGG/pSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2gd777n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WtpATyup; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2gd777n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WtpATyup"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9k2Pj1398919
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 11:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WVY/1XuYxAJzExKXdHQeGSKvfHtqz93hoztP85UA33I=; b=X2gd777n8egnysoz
	xelcUMjWxePk5DhDwNcAZk/WsoU7MGigh7XE76wS3sA9ohFY5KTFd6MACOV/mrny
	iv7u9KBsa2bl1NI/oLOhoOw0Vqp//8tlizfWLCidjcD14MhY5xG+WZcmKx37CzkO
	yqFt84dhhTY2Wt7JHNOf7VvG+9GU9DjKVGD4GZxDMKQct5Vd7NbGusMzUGY1gqNK
	2XeEXfcDqf17zhnIb6E4Lf3rcGnOy/cLftKGXq80H/iKbMiukCDyW1KJHFyjm+XC
	bSIY+sJW7htd6od9SreojJ8QKtHRj7iGCyEMsNSIWERiv+QyjhyA4Zn7bYt0+pwL
	+UppEw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uudhwee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 11:36:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a07295d67so5955711cf.2
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 04:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782387408; x=1782992208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVY/1XuYxAJzExKXdHQeGSKvfHtqz93hoztP85UA33I=;
        b=WtpATyupeDwKW4nuq5eBTjOvmO5zFM96eME5bohugOJxnHJHYnNf2dign71pS47Lx/
         NiXU2zPcBwY2cRBh92cn3d1jXTxp/hQCwPaf0+9H2+eLRs0nVqt/a5dEDp5rp6J08c8K
         ea+LGb+B8o3bitp2xJbai08dFPsYN5pADQMpJPUPyrnq0cliYcSoYAnu2ymTYohT9+UM
         uaAT4xpyKaojUxLeVAQo5kZOs5jPVoy4Grj2kweVQihcTfdOfhtqz+4YNzGKGVuv0wUN
         D8GTDhZmqZMFtjdLaHIywAazfBVzF0nhkFk/tK/ORJaOg5+MNuXmS4C6m6Kx/VYgh8gG
         Pl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782387408; x=1782992208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVY/1XuYxAJzExKXdHQeGSKvfHtqz93hoztP85UA33I=;
        b=sXcEDpV6liEFr6nrEMNgxyyGPKootXVKC08ENxWJcZr6svy2sEXzL84O9XEs3uJtMr
         HfXtaJZQbCTP1TQ/g/1qjrMqdJCA4oEgUcwiX09MR7vV2NIs1rd2gXvgMP5IyMERyS5e
         pefvmCAGspG5XmKetnTpwkn3oDRtzutkBTpI5SkjF3ZV1ko5Tw47EDSj6wGHcN3rTQ+F
         GyDdC+N/h+sxojS3/kw3tyTyS078ZQZ62NTz8xM0UaizsZvsn4Di6K+9e26wAce2H7mE
         RzoDw+ooDT6hEMLHIo/tUN/v1VarG8vxjWNrs42Si4cBDLOFFBCXe+g2EiZVnDlK3+ya
         9rfg==
X-Forwarded-Encrypted: i=1; AFNElJ/Qr5FeIBIToEqw2hwjCx1CR3y53H8OdGwntl8UvdlW+lMafbDjXPkZnO5KOH6IuWmt51VCJBxzYRc0@vger.kernel.org
X-Gm-Message-State: AOJu0YzlHyMtE7/k18qUF6CA1s48nNaZqJmha5gtq24jjv1AaAagZG3C
	dRE/9/qTXO9jH2FBKT0dAM1lfu2ejHnJfKLn2p5O5H+vQpMWhvGuEEOIzcjU3CSYR1kPPWBECrv
	E9WiWLjrkQ5S9fuJTcfJm0DTsFl4VZdHE+poEm5e4LdTPZ+AU5O36NTcAErBCcrl+
X-Gm-Gg: AfdE7ckYFMbMSvSvV5ckIZAQ08NfHb2KEBV0MctGnjuAoCFa6MFSCE05fuxZmh0IPfN
	BWuugdsNqDOIYIgxPTIb5qxOXaX9f707i+8moFhXh9Hj2fXjNN0lDTmZEduoEa+y9zm05xdJESj
	4bbkf+kQJR4P9ACuN+UVEleLJZ7GWYZ4ATVIyUoXjk+LHJC202i1OPfHmiyliG35hso29RrSUv0
	aE/KVjkMAbVfKXzAopjZoE9PgdQ9082JTSQg6JZ1ZMeMtSnLzZSgpyG6Zr177F/kt0z2eavFubY
	FY82biwnps0jnCGdDASvsw8JptnslqT6eZIs3sSsnvvGrBVhiVRPdPGrQ8vKObSdlU4vZ45KH+Z
	Cz/rwIdR7qVUMMrjWxruv1uYtGrQssieaGJM=
X-Received: by 2002:ac8:57c5:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-51a72a47ba5mr15818731cf.3.1782387407660;
        Thu, 25 Jun 2026 04:36:47 -0700 (PDT)
X-Received: by 2002:ac8:57c5:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-51a72a47ba5mr15818501cf.3.1782387407280;
        Thu, 25 Jun 2026 04:36:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbed6c78sm161489066b.60.2026.06.25.04.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 04:36:46 -0700 (PDT)
Message-ID: <ea233160-505d-496d-a321-dc23e7f69d80@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 13:36:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones
 for keyboard skin and charging sensors
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, sre@kernel.org,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-4-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260624210825.264454-4-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5OSBTYWx0ZWRfX2fSG2GfsSUCc
 GMuIB5VW+YBeQXeZcbJG48At93cYecmlyKmo1Gzs3DGTLdpQN42n0NXZ9kbLBOMCMU+wj2u7UxX
 3RdtW3lSN6pObUlKo2V5zy8l8BK675E=
X-Proofpoint-ORIG-GUID: HsXY9jyBev43kSxH_c-Q727ePSr0iCC-
X-Proofpoint-GUID: HsXY9jyBev43kSxH_c-Q727ePSr0iCC-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5OSBTYWx0ZWRfXx1mXmP/CbY+0
 Cic/jlDxAri7CaXYY2UTa8UHr/6B13dXK4xzUzP0OuXaPeCLsbZwJxHvtCRb7lrX2Pt/2l1vWTl
 /dvimKBhrnRN1h0vFRLO1ll8R5ckx8JfAFJDWM13OsHke4lrtlUvLabSzDY/epZQS2OSfMB3Fm5
 /Nj5oyqjTWIcMDCkys0XzKvhyJjRDS1viVquiD6QWCXyACyQlJttkgSmC7RqkIS4eJRUc3y3NXo
 u6MefpHI6fucndJ9zTNYzGnpB1WxFpoefyKrdhpVVTDnA021qee+fc34iy4qT6pIuKrKBVJiSTD
 xxEyU4z1/JNcjgr1K29OBo6Ro2CPjpEEYPqC9UwxqcEAPsr3krtONIsWI1tf8oUhIDDO/wiJj1I
 RqPKBDzf9+LNfQHXdhlhvsgnOfI0rj4+1sFK4Qc3+eOriO2SPx0nC+igFeVD6D3jWUMO2oIJw/s
 vbsrQW7yNSSHNSZIYQw==
X-Authority-Analysis: v=2.4 cv=HdckiCE8 c=1 sm=1 tr=0 ts=6a3d12d0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=68P_60IqByrghkTM5uUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250099

On 6/24/26 11:08 PM, Daniel Lezcano wrote:
> Add thermal zone descriptions for the keyboard skin temperature and
> battery charging circuitry sensors exposed by the embedded controller.
> 
> Expose the EC as a thermal sensor provider and define two thermal zones
> using the temperatures reported by the EC:
> 
>   - a keyboard skin temperature zone with passive and hot trip points,
>   - a charging circuitry temperature zone with multiple passive trip
>     points and CPU frequency mitigation levels.
> 
> The charging thermal zone progressively throttles the different CPU
> clusters as the charging circuitry temperature rises and triggers a hot
> condition at the highest trip point.
> 
> This provides thermal framework integration for the EC temperature
> sensors and enables platform thermal management through standard thermal
> zone definitions.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---

[...]

> +	ec-charging-thermal {
> +		polling-delay = <5000>;
> +		polling-delay-passive = <2000>;
> +
> +		thermal-sensors = <&ec 3>;
> +
> +		trips {
> +			psv0: trip-point0 {

"ec_charging_tripN", please - these labels are file-wide, so it's
better if they're not overly short

> +				temperature = <55000>;
> +				hysteresis = <0>;
> +				type = "passive";
> +			};
> +
> +			alert0: trip-point1 {
> +				temperature = <63000>;
> +				hysteresis = <0>;
> +				type = "hot";
> +			};
> +		};
> +
> +		cooling-maps {
> +			map0 {
> +				trip = <&psv0>;
> +				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +
> +			};

Stray \n above, might also possibly want to throttle the GPU.
I don't know.

Konrad
