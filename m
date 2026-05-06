Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871953939A4
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 09:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778059084; cv=none; b=DY0C50hKgbjI3ty3Ah1NfnYiiNNc4o2lSjhZxI3dArQMQpxEc42dxvFvRnzQPAAvGs6Qse8g7ar+BHdw8Ebf4NKn5iJ41BO5Qfhqh8ciqFtzTP1CJDd7B47mhEHn3uxwWBYiz1dgX9e9I9TAW8C0KG/6PXG+PXDup6U4/yom3BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778059084; c=relaxed/simple;
	bh=cZu8Dc7IIOqi7NBVTWmApBuPht23kcF2cg8i2RkFqmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YxufZnl22Y1q+/ED1Z+avd+aqztZDrTt/C7TI/0OChbI6Da3BGcn0yvkYxhBkBOuS107i3dAaq7MUsVxakPDIK07FaukviYMqq7ozpDldyHw/MoSJ4fHWEMeCvfmrfPP/NZrNCmm9e3TKVnKluHr/qaGnbg65mQtk+o7xXFU62w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kaEoqPiJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQH62Kgd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kaEoqPiJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQH62Kgd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467CZDl1527756
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 09:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c6kadQVmlDK1YHOLukpnhZWBv8PL4iuDOwYzZZ3aVY0=; b=kaEoqPiJtQeUTcNe
	oqGS1cqVGBe1ZK/Nh5yaK6VULXBAlVd8/49KBcslMfY91pHNVs7BmMeKygMhSxBD
	dgW1YLFhPcpwCzDuFxBl69IL57JUVEylwuIEJE2svzzLpuyysg38R0yN5gRdA+VN
	VTVnF5Dxg+Ei7skYg3G1x8Kx2qhRmCTKnNkEnKkWqhaZW71pg4kxkBRCnSRXisFW
	vbGMLh5BYrIupnfzbUQpqv5J+Y5E6mnoupED2kN1eRDnWukGjB4uheyuxYFT8Pxb
	MnK8QJq6Y2JHgnK7/FRlnEitF6naV2TWWS6OAsI/c+Sx/0NEhiBL5ApOSPU1rYKF
	tn+hww==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e01288j9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 09:18:02 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95687296dbcso418588241.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 02:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778059082; x=1778663882; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c6kadQVmlDK1YHOLukpnhZWBv8PL4iuDOwYzZZ3aVY0=;
        b=ZQH62KgdCXIA9JWP/jlczMw/cMSXXxBX4St9qUJPls/QUUeDpmd81FFleiNQAbnc4y
         IGWAmdDR1PyDgwECoDC7hnV6ShZ8jjS+1+WQWZRIwSFDZjBXkEAeicFnN4IQU+5I6P35
         uNjfebObBpCrdaxnTzkQAnDW2W1SLt5N/GZ+SGuk0J5nFNqdTwfj1rBeCkBl+nhMxnB4
         8Kk+1ldS9wKt1qCJxUAqnKyqmVsvi9h90RdkaMvP2D8x1ylZv/BuywK46f43lJRmm0Kl
         sbrAe+wdvYpbEizU+6cWRqjH9Neez9YKdVRcYQ6sDreMSGj6dTzPJzGNWgMfTu4Udcvu
         5TrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778059082; x=1778663882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6kadQVmlDK1YHOLukpnhZWBv8PL4iuDOwYzZZ3aVY0=;
        b=TJacHJdVGH7J9F1oC5j07bD4FvJ3tbparyxZErLql/5towJGD/9Rsa13wUDZ36a1V4
         zFhO7pjx4gdJlmNv/aq0jWCvrDXWjxCt40BVg8vW+S6GHdDOS+X+EAYT0r+GPO/0syms
         T5+Uwzwxye2txG5hadm3EGP1eyGYTerVxX2mAAVra7A70p+OxmcFWI8wrx6F9paAAojd
         SD1ZvDmZToyP1y7RmXD9546VpHwTMWShmloN0vY9vDsdgsAeEV/z514nqKBFQfkbrqcD
         VBvA+0HS4WSz+4bfzkLK0avgYha9pLVRJYoZbMzNf9Ya4bMDRApmNvOn4+7z7ksXG0k1
         KuwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9T/liLR/N9UbpKSbvngXmUyoeZG+hfbzLPQyi/bKeVSyf528PyeUWVwK0cfoLXNFiT9IvbxOX1+w1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4keCWcRN5U+e9AEV7gwQHVsw6nEs1kmybK5W7eRg781IEdSZ/
	FOKflISHJj0RYR+oDxXmTxB/V7aJIEgiupGGeWJ8v0Cx5cNUO2boquEBdtniEJMIVYDCNRJt4Bo
	YiDXDnTGdbcs9xSGwNg+iQWVszKbcFD7rrL4+in1E3tUlP1Z0Mzy6Xwjgvps2t4Gs
X-Gm-Gg: AeBDies8Jbp8ihtHvakHDapxvtiSXEyOBHelKzDs8EFMNH3ipsIJkN5poop3JkSZYqC
	KoHveScolK7yR298YVdBjPny33Y3TX5uWovFt73BkANjfY/P5jrrqUEtXpZlL8B44EYe11p5CNC
	ac9C0PUuPE7iCTBnetLWg4YWtQt6GN1iNwh56wSE3z73mHf4EsOqDi1u4PGkDmxd8mf9+bIuTbU
	q9urlTvdyDI4/WlVI+SdT7+esybkdkq+4MalTrEFbKSsHRnxLj6kvTMnaEVbXaXw4h2WIi5G62g
	RhcBJ1rETRUWc/+2QLjp4yGpl1jKLIsbhi4U20UilcupqMuOp0L2axwT8LqCPO0eAgDXqEvg6C7
	GpD7monXclue64w8dxZhE0o+osBdPpzfUWVlgHpfI7SHgz7CNKWXcwyZjVUmADrxUiA0wU5lFcv
	S9sOBVsjVU7tkpig==
X-Received: by 2002:a05:6122:2319:b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-5755d027d20mr164389e0c.3.1778059081901;
        Wed, 06 May 2026 02:18:01 -0700 (PDT)
X-Received: by 2002:a05:6122:2319:b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-5755d027d20mr164380e0c.3.1778059081444;
        Wed, 06 May 2026 02:18:01 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55f00d170sm59259366b.49.2026.05.06.02.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:18:00 -0700 (PDT)
Message-ID: <a5b99e81-04b1-4d9c-be31-7de513d784b2@oss.qualcomm.com>
Date: Wed, 6 May 2026 11:17:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: monaco: Add monaco-ac EVK board
To: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-4-umang.chheda@oss.qualcomm.com>
 <0edacb23-a132-4f9c-be4f-ea3326c8d8a2@oss.qualcomm.com>
 <b734a099-b5db-4ff9-8b75-265e7f8194a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b734a099-b5db-4ff9-8b75-265e7f8194a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zwy1phAz9ITuiHz1TkCQ9Xz08-Rro_7R
X-Proofpoint-ORIG-GUID: zwy1phAz9ITuiHz1TkCQ9Xz08-Rro_7R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA5MCBTYWx0ZWRfX01YGBXTSC8+4
 6Oglry/f719iomotOmtwIi8eXVXCiIICf9SsiukwE1LNDs84z4ynuP/3NQQDB/OIuv9Eq87qdSm
 gIGUhZ0PT3kqYZI/Giu2eP8c7PPKO2KPeALV90co5X06PLaz9PjEwOp35vKH2KiQyQElhFtvPfp
 7c8YhnGoX0YARSyIkFQl/jOFmdMnpYWH1XcxLrd8xcGxEy2D+pnPLoh9qIWeV9saHFArh1nU4PR
 YBwt5ydkdTek78FGwjfFgOTgbZPspa9Qf+LeA8CspkpSd1ds4C3njoCdiQ70SbllgN+mi3Ai1W8
 dXnjMR1rHp6laC3cZOSLrUqL5TrqM4MDyfjIbX+dHXA+XPOrOIzvJxpO2T7hD8yrmsZibyeus10
 /hxgt7byiFLlxZ9udwB0OotAU/LoPDJ9zkr9Jq2ZGJ/Vcxi5B1XdirRqx7PgxjJJKIEuCeht02+
 EZfK2DCdb0qvuIPGI0Q==
X-Authority-Analysis: v=2.4 cv=A8xc+aWG c=1 sm=1 tr=0 ts=69fb074a cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=jCi_6XWtlY8gP52ikycA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060090

On 5/4/26 9:16 PM, Umang Chheda wrote:
> 
> 
> On 5/4/2026 6:23 PM, Konrad Dybcio wrote:
>> On 4/27/26 7:05 PM, Umang Chheda wrote:
>>> Add initial device tree support for monaco-ac EVK board, based
>>> on Qualcomm's monaco-ac (QCS8300-AC) variant SoC.
>>
>> [...]
>>
>>
>>> +&apps_rsc {
>>> +	regulators-0 {
>>> +		vreg_s4a: smps4 {
>>> +			regulator-name = "vreg_s4a";
>>> +			regulator-min-microvolt = <1800000>;
>>> +			regulator-max-microvolt = <1800000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>> +		};
>>> +
>>> +		vreg_s9a: smps9 {
>>> +			regulator-name = "vreg_s9a";
>>> +			regulator-min-microvolt = <1352000>;
>>> +			regulator-max-microvolt = <1352000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>> +		};
>>
>> Since these are on a PMIC that is present on both full and lite SKUs,
>> are these rails also connected on the other one (perhaps with a
>> different voltage setting)? Currently they're completely absent
> 
> on the other variant the power-grid is little different and these rails
> are not used by any of the consumers on HLOS/APPS side - hence not added.

Alright, thanks for confirming

Konrad
