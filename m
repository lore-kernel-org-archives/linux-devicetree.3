Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4032C381B0D
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259160; cv=none; b=QiOaa0GkOAvrfiu6O7utX9xD+jGM/sc7oYYxlSnmJcO9RjEB3m4zjoowUDCTtRcuqCDTQL6mULqZr6vXzdRbeDehOZCp6aEU7b0Fqd3od+Jkv7FTKpvu0Gi1lZ9uEIdGXsVEGY+ufWk3PUNcp9O8DqJce9zwur6cgQfTQSdaP60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259160; c=relaxed/simple;
	bh=hnr/zGfBlDQ+t/Q1Jtnn6xBMVq4ALtH3NXuCQu/kv48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lFuXyoJzuqI7nN9Mbv2iUxwInbC5zM7XBjGN0GNhUnFl4FO3AgGVe6KSqJanM/Zlaw7OHmhqm4Cf5Mkyv1zajyymEMONYAYyFifj4p01gWMiEw/VG1AZbfBjPgPK0Qnrn/Q9952QgvXoZTqCm6AyRw7reiIz5/1MRLD77V+iOeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XhdreK3h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J9slu9IL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XhdreK3h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J9slu9IL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N83wWk1364358
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	46HxWfNCSbL8n26uvRBfBjsiOvI5fKCbdjwVVOuS2Y8=; b=XhdreK3hY7hRs6wP
	G+KloGnxyy5ZmDtKb/sBUd1OjwVY83F0tsSQSniydcE5SZlcOZ34G3gZ9Lm5Yfep
	akMjg8OVgVUODnwCFIUry0SMa9IsYHrwwm2bHlkXSbuPWRegg2v6IDA2gKTaLGdd
	SIH0iKThKop4ly6OQcrpEpJtzVueecKMuYg8tPNsoZp4IFm9gOaAERLzL3bUUBkx
	ZIA3XtyAIdB2L23ukz4gufasd9nv4xPYerQJTStGmk68VMORx6fS08et2RUgFqws
	wjmnsiQ9PJuGQiQeBkuIwG5YvcBR4nbSPiHTA1QKCNVn4kBq+O7sqkhBf64acgHa
	U8fWTQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p78cfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:45:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2a1f123fso27973051cf.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259156; x=1774863956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=46HxWfNCSbL8n26uvRBfBjsiOvI5fKCbdjwVVOuS2Y8=;
        b=J9slu9ILvx8qGrTKD6yut15nbqo5zS+tkMRCRLaXagBwpDQp8LJJO2hDHxUW2oZ/Z6
         AX8T1qV2WRjKeCGoKvPA+LB3TRt0Uh7bQVg9YUrjvOZf5VupoAT33qAKCet07Gm9OlrC
         Jb514cg0MKnnWaP6oPUfPToeBtSKF4SdZopoHCZsQ5DUNcbXTnOPhW5bqhw8N7gISTTz
         Lh2yb6FHHwPka94jPw9pwkronGVEOn/c8tLyv3mb6niodDLFD0ZwbVoeHtjKFlZdaVrI
         pWhQGCxpsZfoQYsCLiNoCzIIKbNTydWLM4cZ0cNqt/QINkgudvkPRsw+F+kh9Pd3P/5C
         WsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259156; x=1774863956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46HxWfNCSbL8n26uvRBfBjsiOvI5fKCbdjwVVOuS2Y8=;
        b=nxiGpIu7t1PmlKwlSECQEwFt9FYfGxXMxN/WwVfC6Ji6ZL/ky9UzYNZHTtcKNOaj2g
         A8E9uCTjB+alUVPRoF9AfHHIl0WGap/vPz0kC8KagTUTYYjJzBGNraulcavIGjU53eRM
         Dkx8eElaIPF8w13RyZvYnIUoX9HF4wr1clG2HAJvfy7SKtdsYnxJIi4OseekzbdnNSSi
         ncGVmY/+LYZZZbY3oXgCKUcQiiTuvBLDSe77XGb/PMKiuc2rNBuzqXbnCzyQPDFMZzu3
         Da+5IpCA2908TNsYn57ynfb35BW3Lr4jUhc/d7O0D+7tMYNf/eQrFXtS7/09joA7pO9y
         X4kQ==
X-Forwarded-Encrypted: i=1; AJvYcCU63BnsKlb5BhUQIRZdSNp01OuVvRtT0SSLfUvRt4VwVjshkb0xOhkjtC95RG/J8zuwBDjSrkIi7R4G@vger.kernel.org
X-Gm-Message-State: AOJu0Yywht+ZSLOE98Uqpe0O7RStJ5q79oBRGMfBnXgpTy4lZuKHg/1D
	UMOjqw6e7HR2bHY3LaHdytbaSZNLhKtapaf7FlsfILiUd2XkJzcpV9rbnRD94nW1PdCEtpO5v2d
	iu9zwi2QQz66esFpuHNhxw+u0lU0hWg058am75gbrtsCvWflN9c6xBf78WeElZ6bO
X-Gm-Gg: ATEYQzwwUTA5GWbs5fZlmT6RCntmwYt7spDUmgHAb3hhi+RC9/AE8EFK6umYqi0X9Pr
	zJWIR2A5Cf5USvEdWDwC97oupZB5fkjTTF5JAi5GUUZvCdvk1RtWh5HgxOjBRsO5fxwbrYyQDIg
	XU3fiyOPnETfbLUF1927ayF5JHNmejgOI3Ar6aKQAKcO0WjtoupFfWAalIRb7LrKuSu8pHVSM/M
	LEhRQ5izbEwLDOMzq2cFbwi3N5Cm08MU+W4UnK63RVrrbu/IXvyACbVhZHvLnKhNNf3pgQsndsB
	NOG0keURcZxM99vzWtPRy+m+EvxxGv8btsg+gp1U6f9DfuA1lpHNTPJ9YjOfFdmixzEU/UFeXb8
	XQh8IvbHXSW3VumXnLNaEQgTVtaEXoOACCtSD4n0QhHjvkV+zuDeWbP/H9ssMdYLNz29LTfi7rT
	0LCIY=
X-Received: by 2002:a05:622a:4cd:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50b37425671mr125428631cf.1.1774259156549;
        Mon, 23 Mar 2026 02:45:56 -0700 (PDT)
X-Received: by 2002:a05:622a:4cd:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50b37425671mr125428501cf.1.1774259156171;
        Mon, 23 Mar 2026 02:45:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335f1747sm471452666b.33.2026.03.23.02.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:45:55 -0700 (PDT)
Message-ID: <922abf55-7d19-4acb-9b8b-498bfc6e8336@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:45:52 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa: Fix OPP tables for all
 DisplayPort controllers
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260318-hamoa-fix-dp3-opp-table-v2-1-3663767e22b0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-hamoa-fix-dp3-opp-table-v2-1-3663767e22b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c10bd5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JCVw8PmOVHFGJkcgEd8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: bQa6u2i802SKfuryj7iPFsqyRWBBnDLC
X-Proofpoint-GUID: bQa6u2i802SKfuryj7iPFsqyRWBBnDLC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NSBTYWx0ZWRfXw13ouYM7nVzB
 LUxzYfXJvooPiEn4xsnbf720gjR/t37SGwbidns8Dzm6LB2RS7qYB0C1K/djK9m67q2XXWDfIVt
 EYsQ5CBRCi3zlVX8nXTjXSevpUiPzXpGavlCqRqTIt7r3O2FI9RMaRr32bvjswvWcOqTSFrb8VU
 pwltIuZfJ3bnx7lZs9z5as1/8n/I98LqLlVgZc24PJdKj+6G9LQBWloHW4CSnMG57bdzOMtT6Cp
 AgOBOc7dJ2iWz1SrRfthfasMld3WzGNkSUBGi4vph245EUBdgIVn9Ud3/qllugS6AbboNkzdQuw
 DMHYn/8F8H24j6Fhmlvl3OPAkhLTOXygicjc4HUhbAxpaI7hhFJ+CIfGwXSImO5tyZWGVb8dWDB
 ZHjsqxDaB2T9OsynhmyzJagMeKU4d+nzuDyhOQSG+xKLihFICEhKYJKhKgHbG9L/IkdOYeLveJR
 9qMbg8vIqa5IXiXe6pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230075

On 3/18/26 3:42 PM, Abel Vesa wrote:
> According to internal documentation, the corners specific for each rate
> from the DP link clock are:
>  - LOWSVS_D1 -> 19.2 MHz
>  - LOWSVS    -> 270 MHz
>  - SVS       -> 540 MHz (594 MHz in case of DP3)
>  - SVS_L1    -> 594 MHz
>  - NOM       -> 810 MHz
>  - NOM_L1    -> 810 MHz
>  - TURBO     -> 810 MHz
> 
> So fix all tables for each of the four controllers according to the
> documentation, but since DP0 through DP2 have the same entries in their
> tables, lets drop the DP1 and DP2 and have all of them share the DP0
> table instead. However keep a separate table for the DP3 as it is
> different for the SVS, compared to the rest of the controllers.
> 
> The 19.2 @ LOWSVS_D1 isn't needed as the controller will select 162 MHz
> for RBR, which falls under the 270 MHz and it will vote for that LOWSVS
> in that case.
> 
> Cc: stable@vger.kernel.org # v6.9+
> Fixes: 1940c25eaa63 ("arm64: dts: qcom: x1e80100: Add display nodes")
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
