Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902AB64
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 13:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782307650; cv=none; b=N0VLQvc05M0crTJdtpXaYci8DYDrk/ysPo0q3sBgSqTG8iSF9e7yuOTOyndII8f9KkvNd7MWl1jBWPs+IxdlUqfr6nCQ3NztFapJl5qOFpwVPs1Hh1ARW1NnQlAPrAvJfPw1BBpzTvTD2I3ZcRkxjAK49MQwMCn0q1ARBA96lAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782307650; c=relaxed/simple;
	bh=duZC2OscGpXHWodWPKD380KuNFM1k4kZJoKhzMl1xZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ln+oB+dpdldg2jQ7dvf6ilp6/r4/ZUM/xgZcaTf672+uRl25iij5/+IO8DWgB9Mso5kWspq31kWz9HRUuXJZ+KpIxOGuofXaiLYlubu30RNIB+NgRBeWg34S63RzdtsbYoF8k/Pv/Pq8zfP6aqR7ZPrujHuxU2nAAeZZWAiGOwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jj9UF+e7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C0qyiNuT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jj9UF+e7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C0qyiNuT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANerq3167468
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 13:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	duZC2OscGpXHWodWPKD380KuNFM1k4kZJoKhzMl1xZA=; b=jj9UF+e7mcyHkFry
	G3OBA+CFbOXZpeODwFJOJ/iYYBEaq1Rkz4ksQ5+BlATv/X2A01uy6WrUku6VTL9j
	LJTNb4l5Mzg3t0WPHqQ251e73x4gPCL8eqSMMCz/WiW5QodeJg9/zSjx9uaIO/Hg
	bv+fr8F2RvYv//SNCYdv5jMCF0jg5TaDfpgSi0uSO4SgLWBsf2dDv8x6I8wi/Q1q
	RDN/rq4Ljpm9XGNjF0twuHdLy/AOQ2HpryCWCKSloa2CFKa/anuJyutmCTuFVJ/U
	lgFIVXIYfgRcC0z3k8McLSkP3oFC+nLczf0+Owp0YJ7NodBgPcyhRZhboZB2cGKE
	yp0k0w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0996hrsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 13:27:28 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-966d1aa6688so25316241.3
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 06:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782307648; x=1782912448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=duZC2OscGpXHWodWPKD380KuNFM1k4kZJoKhzMl1xZA=;
        b=C0qyiNuTx/rLR9nmvkxXx5CCRg/TpD42lRJqFaNIpC5UnqO+z0mQh4pAh3DPhcc0U4
         3p0gEDIJi+PIYz3TLJncAje8NOraLRFhKJ47CeeflOLyNjb95lJHKg/uB7GL2TRYiuKy
         2tHaWJZYqBiAKzILgqI1Fb8OxdqTwwKfg38gVIrIvAnQnowDzCEBEvXKTYvpu1YKk+MD
         fcDwv9m+MyUe2X4vnjHiG6xSs9slgb1e/WooVWdOCXyzrIPHk8Z56tkzpVoKfc4KnGmM
         mWMesVqmQTQUbYWiWojHRusRsZwbTnZsZDTGU19epiA68DFLLEXUfbudpCsFdfolBhrF
         s1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782307648; x=1782912448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=duZC2OscGpXHWodWPKD380KuNFM1k4kZJoKhzMl1xZA=;
        b=kr3ssLJ4Vrkxw6PIIeicDPQoYgQnjfEwVr/GmrxUfluOhyjVlp1XzT7dy8zLwYLZqh
         DREjP4eiwnPDbfnnc9+capgPvYJNxBpJEjRrWRW9DR/+/2VPKiULPDsbsu6Q8j9A1Fao
         5Td6rowTEURKedkXtIHmGBngi5h+jlgppXIf+Iwi8No/1j7XvBKRuQcG2fV+gwUXAwOH
         fRz5yNhwQRwepmHbKk+hnfW3Eaq3Y+ZtlpcsfvJOqgUbBclhihymotDUaR1/ZRrjo5mp
         4RWcSgLrvv8EwUY4TYJuWygck1oO2dKvc8AA1wzpwQ+5XXhxpSj+VrLBBEatHr9Cw/XG
         itJw==
X-Forwarded-Encrypted: i=1; AHgh+RpU3W1MHkGvxyIVPxCYcTK5WUryj3e9QucKxe8LmeGwR+3+6nl37JZO8PL8dLqYMtocvpt5NnofVell@vger.kernel.org
X-Gm-Message-State: AOJu0YwMW3WfPi9knb4DkRa9Kw2Q7NnrBOjW35lUdGconqVSI/ae7eYO
	Chm6c++HAYP/n4G9mcOjpa7gBH80cgObZ2DXKjJc0V1+hVQ35mrhS9h0A2LTM1+wWR5KW4NqfOE
	yd5p0bx6H/uMrQVv5NLm4ucyRMj2PvZDcVQYbyi2dO3wqRcFpD5egHtzGqFrOheYz
X-Gm-Gg: AfdE7cnG0aSTQMGuXI3OywCoBsl2kk1QM1ehEinK/WcCf/8BO3En9qfTgTek5ApPkbQ
	rymhVS6xZnT40LwNesPDggitrcXVyn4vUb25YPlmznZd/8jO8KbFa9tytRTjQxCFq3pHZKk2AQX
	3ETUA32MRJEuyd1fd65kZ9cjy6HYrWIPRwJtBxOfBBD7HzhmdCTG+Sp3Mw+hqtRHtYGB6yc1971
	0akgFNYEateAivZdN+onhjXdC9fnyGHa03t7wP2JUL5ma4EVqYcqlwLW8MPP8EfbsXebBofpIg/
	g10xGUXoeVOnUVU4+UaNF8Rh7mHT1OSJF91OgjTXmiSg2gjFJUczNLxp0S90r/P1njrmiBUYPl7
	LaqTIPOppH4tuE6QJ5wfEQOsBYLVDhz20PQ0=
X-Received: by 2002:a05:6102:4187:b0:633:7c8:37aa with SMTP id ada2fe7eead31-72f3834069amr2096143137.2.1782307647808;
        Wed, 24 Jun 2026 06:27:27 -0700 (PDT)
X-Received: by 2002:a05:6102:4187:b0:633:7c8:37aa with SMTP id ada2fe7eead31-72f3834069amr2096129137.2.1782307647443;
        Wed, 24 Jun 2026 06:27:27 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c6161595csm666209666b.62.2026.06.24.06.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 06:27:26 -0700 (PDT)
Message-ID: <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 15:27:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kf7keAogIOxHjrhsyem7_03I_ViX-eCV
X-Proofpoint-ORIG-GUID: kf7keAogIOxHjrhsyem7_03I_ViX-eCV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDExMSBTYWx0ZWRfX8X5GMzE3wi/w
 NIDjskF46TXUNsWUqlVPsPjnGS+UjnlbIDB6Ow5R5B5M6q0WiEAuh1+J1FFWqFg6EFAvG6UGFKz
 quWEfjxYb/F7TUYSPy4Nl2x392eSoQQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDExMSBTYWx0ZWRfXx7dxypgxNYsr
 XWJeOVkVIIZ/M7+6SYP+Z9EymPSOAF8N3r7aURsfQeRVSKjmemD6NzqeM6YMZWaiJThEXAy23Cn
 oikZ4zWqXINLebsvZ1FAzRIZAkOnVBPfr8vASA8QhjcSQ52WnHP86jNxcf7st8C5MUWr4oW23c7
 cblXdS5EvGfkxlqiEfHChPhHew2NnS1uyGAMI5psM+8SoDdMg4S5l3dnwRr2X961bb6hISpag6S
 WzUrXoXk5d/I4QMUlHcIOaWxsso/7ALddUHlWrcEcO/8Tca2fXfE6FxkopcmA4VI21MuknlI6Do
 Efx9z08s/1O/erlOse0iA4arDlEJu8uY+yduNDlXBi5l85Fit0O2m8wBy6nWn3XjNnerP3yjhMk
 Kqtyue0Cuhub/VIMlBwA8FqTyMTBHxCEsQaVDFwlG5VFkLmpv5U/wZe37/ViOjdoMRed3fd4Tja
 +VX6dj2R+ptGAoiq+Rw==
X-Authority-Analysis: v=2.4 cv=Tv/WQjXh c=1 sm=1 tr=0 ts=6a3bdb40 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=0WHfKmQBZMWu5BVM930A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240111

On 6/24/26 11:49 AM, Jie Gan wrote:
> The AMBA bus attempts to read the CID/PID of a device before invoking
> its probe function if the arm,primecell-periphid property is absent.
> This causes a deferred probe issue for the TraceNoC device, as the
> CID/PID cannot be read from the periphid register.

Why does it probe defer?

And is this required for all TNOC devices?

Konrad
