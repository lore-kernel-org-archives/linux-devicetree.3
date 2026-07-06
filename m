Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA983F4822
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 11:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783336447; cv=none; b=HgkonH9nESTPkEh12UeahWpb3B7ExxW/7LpbZ+/ZraAIsK0Rt8XFlN7C119W3ZCE0VBpZyItscutN5BkSWBy1kjv2howva/vXtW5TtUFKg0affsO5crYqUGcSmSck+fJ5baBNwIqixIwp8sFSRTXIO4OspCMPe18vfJ0mn6vBXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783336447; c=relaxed/simple;
	bh=ZFGYDqdwTn4whiSyb0leAOdYQvwfKavHI9G+GMWcLMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MITiBORPry9EmUyxyBjX1FNaiHqNxkUrAibPpg7Jb8or/gSQJ3ddGrU+UQttC8ujjh9CCz8KDfrgna0Laqsqit1AyWhcwxV4h8fFu0Ag6eXAngzePrp794hYTWNqFfQRG2/qwt0ZKOrUb5M/TiH4gos8tr1yWy+JeGrE4S8w+YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bdeFYYjN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MWHsE/rd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bdeFYYjN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MWHsE/rd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxM1V387498
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 11:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVkGkwi+UP+7Nv5UJsgDmMLy2YeuLuDLIlV+Ect1Ssw=; b=bdeFYYjN9er90lPT
	w8eCkbrDUTuxnhk564VAj9dNeSfVkNo3skvBlZ2oZPs7CSelz905uqVJXT2wSztJ
	qYZNC/C9ZH4PWjKSnLg1K+5Ke6IP3KEXBs1ZDymdjPm8B3Mt29jm6zTpoW/EC2W5
	y7hSC6GquCSmt+/908UdN2Ey3CHvc6O5mfJEYlhFOvti741qFNRYnfS7IbPt0J5s
	QvYJ9mP+tW20eUAd3E1IjLfeNesaGYQACKQ40Ncyn3fo5mdvw/uakP77rhzqyjwI
	bkiJzlM3EeTC/oLnhyRR2UXKy6FFvfjjTncFM8vZaMAjLKt8ZxCdQfR/KAFKi/yh
	WNU8aA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r09sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 11:14:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f21e4e8b66so9151176d6.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 04:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783336445; x=1783941245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QVkGkwi+UP+7Nv5UJsgDmMLy2YeuLuDLIlV+Ect1Ssw=;
        b=MWHsE/rd2Y/lWbngXGHXRyVA9wZOBySf72rTwoBveIVGHSOZQOhorc/QYufwGTHSDc
         Oss20a5MCYUobl1E2QFOiJmOua7vXS2RfHNntaaHmahpFcOIBoLiIGXsDKIsoeljECRP
         b0enTKt/3i4Udc336ZNW9x/13VkFwNbRJIHoi3T4iRQfTOSa6rsCXQSu34Wxz8y1pOE/
         ISqGJ76XN4rQRsa9Eyv2QD59FcYzn4l3o2dyRQESZXwv5tDPukoDRy6VoQmOPQDQNmtw
         vrQBCRmlEl3+TTQ/i7jiqSRwF2Q7gmEFXLUFP+oCK5b3XEAk1kNhJnxXmV0KOHxPkhHU
         Ctlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783336445; x=1783941245;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVkGkwi+UP+7Nv5UJsgDmMLy2YeuLuDLIlV+Ect1Ssw=;
        b=WpaR8Yp8+2MT1sYGIrxk8DpFQpX9UKTFnQNTngWyIl6Y5hnqgatlGskYesjJHTU7Vc
         aTgoQV9ks9FkSov8sefJ7tcz9BHNuUuw+jzYi3oexW5Xl/zMUuNop5dzvNItlGbqxYAx
         FNNJc4eqveq1XFWp5E1fZUp104amjUyABs5a++aNoApgYQD/60s0nvHjiZEgfcxkYS9M
         jtSRhgq+eoUprl0oWCN5kUOi6ArgdfTf8+zEHgAPih88f0NqQLGomg2Vb563dLrUcCXi
         CxQDpAOViaavGWbaKfg4oIEct3V/wBym4IEe64j9rwyaPvFCbrfih51+2oxbpOBsg+q1
         b9EQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9cNgLcE2fOIqE21EWTkXtpHfUCNZxqyh2AZzMclPn029+uE7YZin1jWWJp/Q0p1iaNN1jhLRA0hL+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq9u2g6nZz6wPMwf2kT5T2K9jTYH9yX//TjFKCo9A7LmXT/yqp
	F06ieQ+un9yV4BsA+RS69D5lSZ04eIKU18Q6uEaxUTXW2oSKv1mb0CGXNtOptkDg/02s0IQFset
	bc//jSbKK03hVsUcjUEv6L6InldHgcpoM1SgQ8J4SSmk669tCpi3fFvYa5fDFXOdIhaF07or5
X-Gm-Gg: AfdE7cmOXxcLHqCjpjLSxLE3dapFygyXRjiy/C+9Hk/G2/X3csT3SY/Sf9+Kgeio5XY
	nYB0gJ5gsg/eiu+Mx9TFmyPuTVZ2baaJRQbrmhLdFFvxLKDGScVCQxjqUZl/LGseF6gq4x55xNQ
	f4TgI4z6nIHuNKdDcFDVwAnob9GuVpx1fJyTY1kB/VdpVKvw1uuIPN3kVYSd/ZYJlxjLveeJH+y
	LCPDuNIs5EIw/4b6Yz3PhnFeq6PwjUykiHCZrRqfQ/HsXmXdypRlxX1MV8VaxS1OHKAlPGJcq12
	uRo6UbFqecnGm+MhrJKACYE/ZmmPeQZuVhSlCnOHeiKV+VYbIPY9U+ZKQq7200xmILdLtvVRNrG
	1W/31P2JcKnLhuSj5eU71RonjOTYo9owKW4c=
X-Received: by 2002:ad4:5f86:0:b0:8db:edd0:98d4 with SMTP id 6a1803df08f44-8f748eb326cmr98558396d6.1.1783336445092;
        Mon, 06 Jul 2026 04:14:05 -0700 (PDT)
X-Received: by 2002:ad4:5f86:0:b0:8db:edd0:98d4 with SMTP id 6a1803df08f44-8f748eb326cmr98557926d6.1.1783336444581;
        Mon, 06 Jul 2026 04:14:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cf68f5sm4014154a12.13.2026.07.06.04.14.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:14:03 -0700 (PDT)
Message-ID: <6c9aa456-edf3-4b85-b210-9bc9f0c48fcf@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:13:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: milos: Add Iris VPU v2.0
To: Alexander Koskovich <akoskovich@pm.me>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
 <20260705-milos-iris-v3-3-8c1353530f24@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-milos-iris-v3-3-8c1353530f24@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfX7TdpkSARieEw
 ih7myw+YA7lHgfTQ81WCL+zAGqjULwX2hmOD3Im7yVYg/eshvkb15MAolBWBxr/Flkrz3TIQspE
 aTnovhh3H7uarftLk/PRmyfQMRfmGpvHY2hxHDeiYejDe8Lr+fJquLDT5xL/mRGAapvL0Muq5pG
 QFJvbvcED6VT8KSKEBnXV52bJAdxfBPbL8zwIq+r+Pim0O9Vq8lNPKNweN750GiShPkSIAQhHXA
 tZsYACkOd9w4xHprptzjgBOa/gSgVeeFu0YFw9cI0zquuy3x+kAXtSz1X1z2LvKmR2co+CGByhz
 dhfx6HuRxts+J5ASIWuKwTR1rBxZNoLG7M+A2FcOI7R3JjMRQMKfSR0uOh+EREboY9FGAt5Cx9+
 ij47I3ORAZ1PM20nT0SO5JCq2TxGJm4mVhcEc8qMvP0V+r5lgCkGAP4yjf02qIXYMWit41qnQR8
 +oMqJQNxNOMFp83+AKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfX91wiIu6XAXYS
 FR+F+4w/CLVv1mo7WvJyS03TE0DIeN/Vjym1s1pa1DNDbks/YSN69SGioiUOUxrDpEXbj3Hbrlu
 pvz41MwwyU5HXBbz8DG549sjc46l1Ok=
X-Proofpoint-GUID: IDe7J7FyS_RGI_HCHghRFrWyFyK4ek1-
X-Proofpoint-ORIG-GUID: IDe7J7FyS_RGI_HCHghRFrWyFyK4ek1-
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4b8dfd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=NAQr9XkY1tkMq4hUmZwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060113

On 7/5/26 12:10 PM, Alexander Koskovich wrote:
> Add devicetree nodes for the Iris codec (VPU 2.0) found on the Milos
> platform.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

[...]

> +			iommus = <&apps_smmu 0x1960 0>,
> +				 <&apps_smmu 0x1967 0>;

in case you resend, 0 -> 0x0

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad
