Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A6343991D
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786973127; cv=none; b=OB4nRtGSMtQRwJ1i3TVG0Wk/mgYulLsXGiOgIPTHt7Wq/4dDSIdBG3SmfyCvsDGZ7AeZnwtJxXGBZhYbrlDQ9txrekJNQ3kug1Ps0Vq9Alhv2LmleFlz7KWNfGoR2Gpu8RPPof63v8f9yNKePZREOIR06gktsXwKAm9ZKfCjFew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786973127; c=relaxed/simple;
	bh=GXDnqv4IufDcpMPjGsoOmnbxEx1h09J0mGjA6yUpyEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cjX4Lq88eTx6IPwQqjQ26TEXBoqmzCH4M8DkBEYNrkJBFKvVaVeGilURU/1yWHcPqZfyfy1tAFAx8qXstkeIkTYX3ZCNlpI6KRm97nQCpExzQrWCqjFmr6XsfLv4I4lYcl+hX1CXpi7buZ+1O2hYJprvsmfYJIelAZohLMgJ77E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMmMMqJB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZuCW2WWD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMmMMqJB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZuCW2WWD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD6Buv1193604
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mYGdTzVFMPdsqDTRpn/GM9XVeOL5og0Ffywf3aiaCxY=; b=fMmMMqJBlYjCqfMd
	HyqpcJy5MgaoCPvIDypo2cWJ0Z350/W9xqJhAhDtiyLM7eEhOj6UQlvFA7TElTcj
	gqh9WlRQVL+6HWl4YFkxx8toHwa3JY9EX9+GHkQWeBzdv2jTvfE2EY6BXQGiFoZx
	n5DjkHjikTuOzPpfhRRLTWWov80K290qsqd4POpSctGs8awR0cenQDIu1Zufdp6u
	XfhHKnHXjYT4tC+XJ/tuQSUzDroyAfqusVYB/UNnpt9Gy19vFempvGPPZAFa2LB4
	zYOJ5s8rclBHmRuLEfjO6SAjy4SXZ0I//lH5SgpTBMul2zzHJC7RNRxSwHNXGhem
	gWrpZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke1eye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:25:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d35a38fafso2786631cf.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 06:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786973120; x=1787577920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYGdTzVFMPdsqDTRpn/GM9XVeOL5og0Ffywf3aiaCxY=;
        b=ZuCW2WWDS/ZGBmjzVt1vJ+tZTIJ0KIFwisfY1Jb9ypGK4+38xTvXmjmbvQw16mTorf
         hzFsvD7MWsvwuEjRqkN1ilBBGsyb117pj+SHxRmqk8TOtj85m6/iGJ7ZJ1Zf+Z2klwH3
         AcOjiwwIy9Kzvfl7WC1ptPgJOAlPka9Z4Di7WS1UZkQIGwwbftghFRNNiuYo6YR+nphI
         n1xelyIZRI3GLlxUp+Z0WD+dYfb2JCntlorJ1/U6vSguSxsdt6VwgXx0M3MANzpaV56O
         6RTLvFj38PHW6p6A+C0fhUDrpM06HH8LGkwgPdZ4dono0OFgHp+fPm8Klo7mjK/RdSZG
         NGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786973120; x=1787577920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYGdTzVFMPdsqDTRpn/GM9XVeOL5og0Ffywf3aiaCxY=;
        b=HcHckXMGokDVtUC9PM0klBoSWfXgR6B6TVEGg1gfnYqT5Jo5D1qwVeJOrJCM/wXNHy
         1WbMqBUV7yxvIJT/L4uf7SxxiHzQScxN6K34zGD6N9gOBmr22B1aKlLQ1+/oiDXO06QX
         GNSLXdF5rzLwDhsAhd5KORWcv52PX/ziOM9D4miEKjzzcKc9WuqCrxS/o3hFamHwgNJ6
         9UpkbKl6tzqLMQRLihJQXUL8lzgs1eaw+YcUUNX1pIa7Nzx8jKCv/sPCQJaujCDMNdDh
         +BD+hHfwR/pgFBGCFJfpxoPLpQrkAQB64dwHiTuoP/CRooYMl8YG87+mO2NJgURvLFg8
         liPw==
X-Forwarded-Encrypted: i=1; AHgh+Rqs81wEmOa4Zd1r5lrkIEa55kj/FJO/KQBhjBhm3pIV3i4oWWIXJpTvSYx96ppwZt5Z74Kkpw7j4Qv5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9UHOvZMSyiy9wdl0CzYeMgv8BEAnrdnVn5t1qjCT89x86Ktr4
	dMqfekymIXTO4ms9XDIc33zz5Du48Da6K8hi2K6hAWGDtQL7SJyNdAYWF+wTkrFpofp4Dh914OA
	0mEjYV3mGYAlTkxeEZ0ER/I4htmgfyq1WcwKifnhm9OLighSrCgFn3OPr2Ijd1O2A
X-Gm-Gg: AR+sD125/FCkK3Mcolh8P++ktsCgor7rq3AHHCKEW5dSZoSq4pl2KGfXBVaKA++q3dT
	Zo1eQ795L3FxBbXJf2a4ezja9dahKNtFUfygf7niGR5ylyAVJs7n4OMsK5nFuldhSh0gXZ3DjV0
	GKMtdSwrRhoK0MHnOUKMYQ5v0gil1PEm14SOKSURTFg0XLkK5wGbgXHgCnUudqx6tKvCorYwMxp
	4FF2E38VJHUYBei3S5pfrL/rV+ab+39CQ0o02PUuAELHOgUX+YwTVQrs0LpyESCUhi0i3Qx5tuj
	J8ScGUo+207v3UkvtK/jlLM/byquePlhgCIamWu/XadPrXMN3vWvKZVQRDXZ65WG5IANLPiqP5J
	G2V8QZV6r7bQbaPBkY8OYMGFR
X-Received: by 2002:ac8:5a8b:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52d8547a9e4mr190072481cf.3.1786973120245;
        Mon, 17 Aug 2026 06:25:20 -0700 (PDT)
X-Received: by 2002:ac8:5a8b:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52d8547a9e4mr190072121cf.3.1786973119817;
        Mon, 17 Aug 2026 06:25:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b97936sm29266066b.43.2026.08.17.06.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:25:19 -0700 (PDT)
Message-ID: <57af0ad2-2afb-4951-b17c-918e9ed08ef2@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:25:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/15] clk: qcom: Add Global Clock Controller driver
 for Kuno
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-11-3079794f0f73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-11-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX+kpax2oLP+b5
 U92NQGkpxwobN/bv8zXWc3kGx9+d/ZswgHuzZOY6wVJ8nl2hvgNkfVJErWyi8ZfOUS9iXxt7iLB
 AidIXRsxPcM3iJrOksjycQZZwuGMh8oSB3LCIldWqRjAAZrqnwPPyJN6W3fTVtQcqmDYLmNxx//
 xtQ30YDZWxiDI38Vjl4fVOPLxzp0DChagpBxMZiiDu2CG1BRUy+MufgzCMaZbI/rDCZX11txXX7
 zaWKN3mh19T//Fm+W2A61lEo4GyNfgCc/FNZE8Qvzh7pLDxBqfelVqwBzmZRZu8pTLv4Qptgt8d
 mlbcMWnoYxtbXNlIVD3X99lco/DxubYvFAKKMQJFbQZbVcqr7EgNQX5Sln2mrixIxQeWIBpbLUW
 eS72Or3kpZ65HxZC9Tgn+6i3GTjj66/hjnt7ZYpELqLyvt9f8UsqbEdh0XN7abERAQCz1UJNG1G
 SfL8nPqB8M+hjGM6DeQ==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a830bc0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TGsF1qQkE8-pbLwaU88A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: doS8xSMfN5kBM70V2VwAWiJwmKpcTai9
X-Proofpoint-GUID: doS8xSMfN5kBM70V2VwAWiJwmKpcTai9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX6y+MQZcstcuK
 X/tZXluH3467tfR/G2+6+hHYy/wHEJuIn74W5crfWNb6VjOEmSeeAdPvAALswD/5flOCJ2zin+a
 Y2zTg0PYgM82HN0RhpYph+Wi9xNPiVA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170102

On 8/14/26 9:31 AM, Hardeep Sharma wrote:
> Add the global clock controller (GCC) driver for the Qualcomm Kuno SoC,
> providing the PLLs, root clock generators, gate/branch clocks and resets
> used by the peripheral devices such as UART, SPI, I2C, USB, SD, PCIe and
> Ethernet.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
