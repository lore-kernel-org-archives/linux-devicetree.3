Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C55477986
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152439; cv=none; b=fxRMJn0tfy5gvq6e8zKcp9QN6pLyqnVUhQ+eTtkeK3QCy1fCw5LCB7QxZCtdAriZa3SzozIu05POadeIE32eBJ0+YKJ0OhDgNMW9Upru+WKxfrqRCpKBflUUj3O+TuQSLOh2RsvxB107rFjQoGPJHjFBtOx+T6wZTjo61JfjZ5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152439; c=relaxed/simple;
	bh=sPLTwLqYDJxydWPkH4vVCs+TCo1KHFPfAUrU9q2hOjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DBkk8INWUui7H5kPexOSJ7flLLVisxZGJ/1rqS6AnOP0C2PYVT9uKXmtFps6LAnKBbx6Oj0B1v3wR7R/a6QHedeIn/y/6fi+Bt2BxJ8XiA6tJ8bDgFeHLg0Psx5fHTzP49GnfJ9+l9M6EheDhBywR6oRqS4Ds4b6oh5DwMvVdPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQEDaKvq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3x2yNeb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQEDaKvq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G3x2yNeb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1tob537837
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9EwSNOxmS4ilVUk9eIeWz4BZhma8X9RwJEJsPr4ziAQ=; b=gQEDaKvqTZUrNEPp
	eG0HjxzerTNjtZ1Vwie4SId4sgH2gTbdLxIpSDGSIF7YHMIDi1ocfXGIjINsXHod
	oH/NhKMvhkkIQgEmH1VtVe7lAT/7QrA84BsAhPOPwpXZ0RAr/uzfLRvPtvY7wOXw
	cpzUzTA+qLHWWSFgKN6BavaH3lbXsFChH7PA+WMnP+z1EihV9gAABNQPTRby5B3u
	kgjsUuaZi/STb3fj8mIf7u4VDETykRgMtofW4rVILxYWRxFZX2StbYMpdBGU3scj
	rCk23kWFcupseOaBtcv9QfmqDNZwlwcUV6LyI/jRbiuIwVd4H7CdgLrxepJ/jiaB
	bPrjXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es581wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:13:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930bd2bfc45so37862385a.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787152436; x=1787757236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9EwSNOxmS4ilVUk9eIeWz4BZhma8X9RwJEJsPr4ziAQ=;
        b=G3x2yNebsofcJDmbR8fDeUwPCdizjDQdGLy8KDBbTxw+o3t5ZXop5sZr+byhYkezvF
         GcJBy0+i1+orNSvcpwNP7i6BOHIC3Gpyb8gi4SXnGv2bLEAg3gQ8gXsKVfGKcK9jiCSg
         vm4404xwoQuo2VVg5pdBJxdnNiayk2NBwMVXADn9TbYVwHiOAaAv0kpw2SgCnqdGDMBP
         0J+3Sn3k493PAVo2chTluW8z3ARK3M5dixgt6H4xrTTHirYYeb+NAcDMMq3R4xpPnPKc
         ZB9ZL0BQ2fmXKKlUda3QdFE1kcbY1dRMJI0zdiwEH7QszaHPpq2XbjDosUS0unKiljJ6
         nkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152436; x=1787757236;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EwSNOxmS4ilVUk9eIeWz4BZhma8X9RwJEJsPr4ziAQ=;
        b=DyPQ3XkJrbx7gCowpDk0AIt+bQcKLxDBiyTmNezttJ0FdF4YewAcrO9dDFM7GVTfi5
         o07ewuvRR5Z8TmptJq2d0+bpvzlLdj0eHkTeJMHvbKdQvtxs4+Uzs05iW45HjEhm38F/
         1z6UI6ELWnbLlXrovoBWA6HqdH7pDKMzamnhQgrbnLLwf6fAmqWTzW49rfBTHQJnHagZ
         QGuwff9HSRA9cX22wzbSBNV00qH8OY3T7Yk0NLQBn15Z5WKiyXe6vBdrFi6MG+z8yoMm
         sLwVurWAxWX4yWKDH+wUWuGdPU+8MndwuZoEmss3ZxAzNRng0Bu6jk37xWLYShRsWIU5
         dvUw==
X-Forwarded-Encrypted: i=1; AHgh+RqSf9UDBnS3nQoXAdIDk4eLNSOqRzK1OLb7eVQ6RopxvwmPKHobhrJc7GYOpOXSgBhVCKTrM9Nqzgek@vger.kernel.org
X-Gm-Message-State: AOJu0YwwCW7B4X99iS68FQL8a4bRK0ZySOgFAUZaTDO6pcCCyuzjEH2F
	4l05huKLN9uCVjB2WOqiVwPAnEXU2+g4iCzhKFHaHmZgnBX/kdD7jxrHLdtv3BfPbxhfFPMIoau
	9spxETcT3+/wwhZwlZZ3D2vhqfof4XMo0Sy8yJVOtdzEmMsWn7WnSAplpqqFhd2u8
X-Gm-Gg: AR+sD10j7uUas1s5afj8i8eGCjufLA8yKhY87eGb2roJgPQ4ghIVFk0+GwJSn8pDQpk
	bSG766MnAsvdftYqrtxRjrbpdmS7WC22CKoDT3rc+q0NHVIjSuVaONwOIz0V4z3do46Y0JYj5Fq
	7LjgXvgv4kv4OBLez7PV9j/IqgHYUV4MRZUTn3NbWlkq8apydbknvMiErAtNMIygJkDSDIQywjb
	Q1yZGx6hEf6nn6qha8Jmj3XgLdAqCx5rrFpu9VVQBkOiZqXy1/2h69NJ/r7agJHgmTcrhCnUoR4
	57Z6FNipq+8D8oXFUbGwSkv7RNTqmcVzxW5BtqnxOZgHmqBB4dJFC75Ko02HUpcqgifJX5TwjjV
	XHSGTs8SpmH3jPdfuZYbgVyZn
X-Received: by 2002:a05:620a:d95:b0:92e:5272:4e3e with SMTP id af79cd13be357-9371e14b32emr424571085a.0.1787152435910;
        Wed, 19 Aug 2026 08:13:55 -0700 (PDT)
X-Received: by 2002:a05:620a:d95:b0:92e:5272:4e3e with SMTP id af79cd13be357-9371e14b32emr424564985a.0.1787152435444;
        Wed, 19 Aug 2026 08:13:55 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff16c546sm1000897a12.21.2026.08.19.08.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:13:54 -0700 (PDT)
Message-ID: <6d525419-2298-478f-b602-49405b658d76@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 17:13:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket DS gaming console
To: azkali.limited@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260723-pocketds-v5-0-74508388c716@gmail.com>
 <20260723-pocketds-v5-3-74508388c716@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-pocketds-v5-3-74508388c716@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hhkkm6eiurU4DSlXqH7PNSqs7QWugp5R
X-Proofpoint-GUID: hhkkm6eiurU4DSlXqH7PNSqs7QWugp5R
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfXzcUFZCGGGrPw
 ez+kmkTD9Wr0OLATzcHzoyNvcszXGHp0H72aqEZznA4GC1iZD/S0EEUQK6bZQxGAaho7SCsoxTr
 o28RM17V88a1vb4TVoQOvw0+sgaFZF8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX+y61eC15A3bO
 Z1RN4gl2aSTRw2bnmFDw/g4DHt+9AYVt8iHzEzAF8E9a7/7hfdNaOUOMBtXq1VLT/mX5vOQrc3V
 6MIw7ySEy3tVv2uE4NIz4WO/i4ix+wLsdBokT8L+t3sIVtFrMK4mnHLh/aKF2aPapE3RLVsBQ5m
 IL4S4/BjUEOTnMlM3qJ1B2Sx1xQdNvZfdy4Z7hryJnaIiCzgCzKA74sG/6XpfK9LZcR9FuDg4qO
 G0oJlanjmX59xBOo8P/r/kveN1qaAcvoSeOm6pu7jpwg8MbL8LJL7VnR/ZCRSaJUiDN+Tf88KsD
 Np4y7Lcg6p1whhdl3ZNP8MXfkyu6BeeDpSrAog6yrxPAmlF7dzvnCO13snihdcmRrXOK7OF5GEu
 7tZrlIuGuRWsrOnYm/S9K2M+AH/aXrtYYWMPXBrFVneQ5P7uFVjZ2nNslR/mmQ52T23bNijUWLS
 Vohi359ndb+3H9grPcg==
X-Authority-Analysis: v=2.4 cv=Oc+oyBTY c=1 sm=1 tr=0 ts=6a85c834 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=at5hwtf0mp6GI8x7C1wA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190118

On 7/23/26 3:24 PM, Alexandre Hamamdjian via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> Add initial Device Tree for the Ayaneo Pocket DS gaming console based
> on the Qualcomm QCS8550 platform.

[...]

> +	sound {
> +		compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
> +		model = "SM8550-APS";
> +
> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA_SPK2 OUT";
> +
> +		wsa-dai-link {
> +			link-name = "WSA Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {

nit: 'co'dec < 'cp'u 

Konrad
