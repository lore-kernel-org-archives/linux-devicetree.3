Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90983D412E
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 12:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899442; cv=none; b=hjfKruPLij0VJNjGWpjDG+o4fZjb+Tq6dyOAoOE4gN1OKFdJu98VFaOXmiZPlPD/ey3AtSK94vCM9ZzIgINHWPo4c35E72CozLYrwRZe3BtSqkavkNF8f927GUD2KzbvCTwUkl7GeVdX/V1lGndftE7UTKVY1q5XSZm8wyV7hKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899442; c=relaxed/simple;
	bh=IVXV2NGZICqRWLnpBbbMz95a8GTb/rC7ICyv9OYABXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F7epOz8zEwAI9QiEClE4LtWKBrV5E4kEhrBQBsNiwyu9GE+D11Us4OhkKYpkhcDnudryH5vTfQPOZyNEmRGWiM4NQuiq5PrXVGtHJcZlx4AlpwUCjxGqGp2G7j1W5ee/EwsLIzA9i08srH8vus9UHOCmXZZxLKI1zSBGKt2zuzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYnjn0DY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jeW2kY2g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYnjn0DY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jeW2kY2g"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B3wP61150998
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 12:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m9+f+YzR85SwkNwBR9ZTqhmO1z4yfVyW74LQRH+yJOg=; b=QYnjn0DY0rGTUeiX
	HAp5SuT+sw3SKsPTWXlMtWVQ6dku7alNGAXMZ6CH11VjZ46yWxB30jZdOdsZE9I3
	1sA3Ali+47pmgeKHIFrA2VtreuLGZoZREMM0HdhRYg5iGKlO+HNh4EuH3byl4NOa
	NcWm0yUvf8OO4fefN4ALl2+HjGiYdIIHmAg6Rsv10Zlv4J+4Zu2QxvLKdfZxSsbg
	8ZPc8ngNdiyCFy25WITKswyhfxP0yZjcEVW7afYCvqIvbk/GThtwrYgd48k+CcnV
	3gkJ/KI9KEkBKgN1SiMUIIo3QXU8q1yzJ2FoGBUsoJ6n11Y0CRT3KrDo2RsysnDc
	SrA+dA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscy8eve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 12:57:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e62562b6aso14109281cf.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 05:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777899439; x=1778504239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m9+f+YzR85SwkNwBR9ZTqhmO1z4yfVyW74LQRH+yJOg=;
        b=jeW2kY2gYB0J/XyG3TrXA3DETxic61YDxVarOVLujmGk9qxsyy4HVMpQpHy0PkkmJy
         9VIjZOpvzGzYYMjuZAW+jPIV9F4KjBGofPVZmpPcabNTBIuU+r375UDFowL7cz9ZP6mf
         A5ce06wl8rfm0gbcYrtixqxEQQsvxEsn63+M9s2z5ugSa/VzF65VmhTO6n+wqncyAUX8
         T6lkxNHwR8NhlAZJXbA4WsIEB+K+xVetwVxjfkuBMabMZnjWbH+22u8xNpiK0GQo7/gP
         u9BZWHI9MIqDljwEyf1t16VLw66+ulwkfYxZAUOjr/EVxODVfc/S4X1n8B5Nk9q/tjXV
         t7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777899439; x=1778504239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9+f+YzR85SwkNwBR9ZTqhmO1z4yfVyW74LQRH+yJOg=;
        b=Ftf3vm7yLRLlB7MEaRWU919bJywyuNIBmeQqJIEzKvAl5XquUUl+jqn3we5zo+1uLF
         NwN90Dt+AYhTkM5+3rmGT7msJu5D36Y3XwLhhz/lav0vK312Y8WkMpnvhKlHnKgDy82i
         HPnZ6m2Uw8MhfmVOM7OeLEjWF2NnJA0V3GeB9S179+TImNis6yq6x8S3Q5XEWBoEMEu/
         Qo260gk+aub9R17bNUJ/Ze2NfVhognLbp5LbuY6up7Q2OVefMirnzzB2NiU5LOLT1ljc
         6Z2iJgHWv9s6VmTjYPTLgEBIP4m4jgdcpxNJhJ+yfHno+I/Lw21BF5FJ7yAJ+uZLJSYl
         lahg==
X-Forwarded-Encrypted: i=1; AFNElJ+IJk8nj+phM3xiVHUpLNydib1O0XGuksTQA+3Ab5AaE9JkoEWb5G5qaC9Vp2dBpMiDUsun8vbvAhVL@vger.kernel.org
X-Gm-Message-State: AOJu0YwS91aas0ZTlfAAij8VhHvZFCjHd7F7eN/JcOY+Bxu169GLuQHV
	mxkRnIZjOzmHyL44C6D2tIcnTD2yie2WPQMnfnQdhYhFmZ2EGi160Q0IHlaFT9jS6Yyxv1hoPG3
	kXXN0zbf91/fs0P1fO5UMwIisELiPBGVWwJ1MGCAbxVNVPGIN99kHpPH4QczF0Iij
X-Gm-Gg: AeBDievdF/Z4KsHNtAscTDbbyETT7d63jnU4K1cl3RxgZ2EfqJOnyniSz6q5BCV8PPA
	gcL5QPPdNLzgfZEII6+39G0kq98OJLE/xvpm3HMY3pBaV1CIGuKzL+Jdx3Ob1dvH6t4vcd3jQ1R
	rU8dhU2rPkrDUTttvX1nOMtkfWAmnnNWtoghdeW02i2m0ET1qOubeACj2zfISoKJD6n3pszFRIy
	QeusU/sM2e1JErm9Rh5oLvbLbBB0SaholUn6ke10sv7BPm1RRNYmV3idh9lpbHGccXapR3y8VdP
	e+ciOjJXauhYHEOxHlTBGV72KaRUYgJedDWrEyfeALI/BeAQg8iAgp9WY/84c78w6a5bKO4HZVP
	YEE6P9jmkFTwq6bkKqpz55TtrG3j3y9iII3L/RfBx1R2S+4nAAJly6JvFjS/9EY02C9dqgemmWl
	8Jnxkv4LOJfBb2iQ==
X-Received: by 2002:ac8:5f47:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-5104bfad6a0mr101813711cf.8.1777899439235;
        Mon, 04 May 2026 05:57:19 -0700 (PDT)
X-Received: by 2002:ac8:5f47:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-5104bfad6a0mr101813471cf.8.1777899438805;
        Mon, 04 May 2026 05:57:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b877d57dasm3441014a12.19.2026.05.04.05.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 05:57:17 -0700 (PDT)
Message-ID: <9ece279f-2f57-466a-9af1-9fc8670c8ef9@oss.qualcomm.com>
Date: Mon, 4 May 2026 14:57:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
To: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEzNyBTYWx0ZWRfX010Zq1Xxiwuo
 DGHmv0+Ovk53gTyW6HnT9CslxYZgm8sKfem3jmWHOjE7JZTYiCAMtJIZ61wHdAD8yAGCZAS76eT
 EEPm0Nm3Wge28e5znWYBVhSme2nK1M6U6aVZLNZ10LSPzR+4FtCZdpP7Ry3IybYvq6BxNGxn+u4
 QD+EwF5XMSZ/zQ+UhfBNGz6MY2hFEMcs1poNoNBkI6g0hemJnPFHplLmyIZEevFaTTaDgqYNdr7
 P7kNYX7QoSou//HhlVa6oGPzEwAAxNbYx25L21hctZMpcXFo+r//Jt/Pq3JdUM9Umk49NXwUwBp
 zLzm1uS5vrdkNMs7plfrx3nX158+8tivadVDmhf1lkVN+P7SfBPQLtHWzORqymduHfLLUFvZk/H
 Xu0DzJ8RCpxVq9vYK79F77GU8nivm5VqGX1CBLqfr2V0fKjraXIWqeck7sn1ac70bAsjVpqEpb0
 mI5Z8XMO1t2dVjgycog==
X-Proofpoint-ORIG-GUID: ObpHXMzbeWtEA0VU_Vc9H4gw86-OwX4k
X-Proofpoint-GUID: ObpHXMzbeWtEA0VU_Vc9H4gw86-OwX4k
X-Authority-Analysis: v=2.4 cv=C47ZDwP+ c=1 sm=1 tr=0 ts=69f897b0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GlVSUVHHWGa5OW-2IAcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040137

On 4/27/26 7:05 PM, Umang Chheda wrote:
> The monaco-ac EVK is a new board variant which shares the majority of
> its hardware description with the existing monaco-evk board.
> 
> In preparation for adding this variant, extract the common hardware
> nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
> include file, and update monaco-evk.dts to include it and keep only
> board-specific overrides.
> 
> No functional change intended.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---

The patch is a bit difficult to view as-is, but the gist of it is that
the resulting monaco-evk.dts is:

// SPDX-License-Identifier: BSD-3-Clause
/*
 * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
 */

/dts-v1/;

#include "monaco-evk-common.dtsi"

/ {
	model = "Qualcomm Technologies, Inc. Monaco EVK";
	compatible = "qcom,monaco-evk", "qcom,qcs8300";

	/* This comes from a PMIC handled within the SAIL domain */
	vreg_s2s: vreg-s2s {
		compatible = "regulator-fixed";
		regulator-name = "vreg_s2s";

		regulator-min-microvolt = <1800000>;
		regulator-max-microvolt = <1800000>;
	};
};

&sdhc_1 {
	vmmc-supply = <&vreg_l8a>;
	vqmmc-supply = <&vreg_s2s>;

	no-sd;
	no-sdio;
	non-removable;

	status = "okay";
};


which begs the question - is the eMMC only there on the non-AC SKU?

Konrad
