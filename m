Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A493BF662
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 05:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778737458; cv=none; b=rzIEELLGK8biENF+3YPPwBkKFb96tMQFjwd9ManPJ3mQkT+XbsUgyLA24gjBAjmfBfe03ThCQmYh9weE/VPUDPCvjbEETK679HLNZzLDF5ruG5Z2enu6R6yrmLk0+Q+zPOLx/awKrDSjOcbJs3oytEApswzOqpmEWrDXF3y+A3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778737458; c=relaxed/simple;
	bh=3f+KPY37idSfDnhLbcJafSxCfzWSg63rXo2ZFL0tJXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ns1319WP+jaOwkPql+wNX9QqKulxlQooXiMNaT13AlxP4RxlGmLwQ3J47pH1w9i2GVPimYIpqWyZtMGEmLZ34hUELH/xmJynyb/q3EmY6eTwi1Qx+gKbCg1Pv3mlb5p+pryWM3PvXxm57pcICleeVi6yNefl/y7RqU3dSVPisto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hajFHIZx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WJaoluFI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hajFHIZx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WJaoluFI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E2gUCQ2524404
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 05:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1B+Yfa5hp78uken1T4na0rArE8/5QXPftFj5P+2sOo=; b=hajFHIZxlEQOvFnF
	QSKyLU1Vv8qJDYyO72klQB5Mw0yI8sPYJLLJZnrNnVcd6xX8GTNan72ZQxdgo51b
	I5dtfnneji9L+GhGvUtq2wYn2wcPawsnYsNvZP5AP250sew1s5GfwrKU87hKHgo6
	76sRzmV0CV4FfI5BZnTHdVUToKbKJr4KsvHEuyn7OKbwz4MdWgzB86ofh7z5Gu3r
	NL5Dm8eyriIBj74QHEbnbYkVp137kXweQMkOOfSzacNaYmhaMzC5AiDHhae6zoOO
	ZJZBtFG4zCegb9env4zONzv66XBDz/uCJWcTigTOymwfXOFpUL56tIzC+hqvntcx
	OXzAMg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjjg1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 05:44:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ba9baef44cso120380186d6.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 22:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778737455; x=1779342255; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W1B+Yfa5hp78uken1T4na0rArE8/5QXPftFj5P+2sOo=;
        b=WJaoluFIVDA98cp71vzCD3amqtXT/kRo7GvA6r1Xn8HD3Ys+z3U15hS4jercqEiiMO
         r5xofRKaD6j+K4MYEJMfnsyAXapI7/vVUqSvh6O1HyoNQtbqJlasPMwMELR8Az87gvZD
         5FC5BgGpgMMDJCVBft0Y3rtAq/mzueAZF2RfOEWbb9l144Xsxr06TICU4afB2YahIXPW
         UqW/Up3uQ3d3NSwjZ8MnGROHma6Ly3g+tShMECFsjuAqZ98npivNSdrlJLRpujF92cWM
         0Cb4YeGZLxLaIGZtpsKxjuMDRTXccXJae4ygv1sK25jdCk/qm0pCamgozXp9rzeKXcSK
         WlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778737455; x=1779342255;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1B+Yfa5hp78uken1T4na0rArE8/5QXPftFj5P+2sOo=;
        b=CK7IMClLPtnUrV/P0eYEUtmjKXwdrmvOD545NjR6FLQ0sfvEl8Sao3UQEG8Gf6vPd2
         xdr0BK4y2BSSAjSVGyzfKE02TfQ9MCbEMEsdWeWgLi4LHuAq0IdcwfW62U1x9mr3Wm5B
         xdFuphRd19Ett7cfD8obl1XQanvs6G/CgFw4lgc/DwgynHtxd5+mmFP01uqa2gRT9Cmj
         eFRqzGB4kKSbuwlL/s1OOY5HgacwFniqnfQJ0divjKOf2XRJP4VwLT2bq3wQ5l5lD5JV
         /9/HrEKUmeEd6ThVXpA01p2hn2uIZFqvU38Vf1GFYHLRfr4+e6YZLQORNBM6GeoOkJI5
         Rnvg==
X-Forwarded-Encrypted: i=1; AFNElJ9qDK8si5HtSPetG+sM0ikIDVgw8VvFgHNy8MYtQoJWrQukEmEow7WzeuVFErgz8F4F5xL9L6CBAgsS@vger.kernel.org
X-Gm-Message-State: AOJu0YyBcf/a+ipxxwQCoxhPwrhUrj4TiDwnP/zAfgs1a7DqkIj+ekUO
	423/L2v3X860TtYT+8LaIJqQncxct6PRRTD2+zu5o3exo0dbRsPGUylutUle6l5dKG3la6+b0s+
	wDs+Rtb6FY9ItU5rqRLZb9GApn3And1u/XPIuHPnfGcIQNto7Hy/jz1Qnp24gT4Xi
X-Gm-Gg: Acq92OGK8ecw0GebRknGmfdZKGzsjaXwFoX0f7WVZ+jt2bxj73OqJYDslhNWpbx8nmP
	kQeKqUl6X3V8cF9h+c4v8azuVdBH7uOfA9rjfd8fnJ8DxyOTyoehIqzw8XOYvBJOd61GVX4ia8+
	LMMe/bdRB8rVdTUnxNIedYTppDctLQHpmYNkmbWKJyRpf9Y/xzqqgC/C7U0rZlBrgbuCdpMYIZg
	0XL6iuvtK6tXydL/bBR/9uE88lhZFgjktgzbh6CVwedXqZ6B8sIFXpVVh7if6iDdalLPuKHP5AA
	xoB4PHYMl/9iWfLLXVZN6a8jY6FEFmzH/KNYbKLHlzL74BdGju4Dto87mXbjEx0A1GaPos7sCXJ
	5nphd57R5W95cHN3dmmuVai5Deughe//tIgN1VIhiIRPp8Glq
X-Received: by 2002:a05:622a:a915:b0:50e:635b:5564 with SMTP id d75a77b69052e-5163bdb1880mr44383851cf.48.1778737455516;
        Wed, 13 May 2026 22:44:15 -0700 (PDT)
X-Received: by 2002:a05:622a:a915:b0:50e:635b:5564 with SMTP id d75a77b69052e-5163bdb1880mr44383571cf.48.1778737454965;
        Wed, 13 May 2026 22:44:14 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd64a0e38sm39838065e9.7.2026.05.13.22.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 22:44:14 -0700 (PDT)
Message-ID: <5c615bdc-3a19-4f07-a38d-16d45f318411@oss.qualcomm.com>
Date: Thu, 14 May 2026 07:44:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: qcom,eliza-rpmh: Add SDCC1
 slave
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Georgi Djakov
 <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com>
 <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-1-b1edf81bac3b@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-1-b1edf81bac3b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rebuSVg5ENepy00I46Eii7hDpgAjTQKf
X-Proofpoint-ORIG-GUID: rebuSVg5ENepy00I46Eii7hDpgAjTQKf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA1NCBTYWx0ZWRfX05Gc1K04EWG/
 q/32C7dl9l2bc8RMZp6CJiVCsxEe9AO6bccbQcCRKYrO8AKIBYEQ/Zuanmpg18AWgj5iTJE6IBl
 5wg1sSks5sVzmxku6jVGVUYZgvZFin6Jj+qqJj14LC4l32NG7qmpE94VI+ySjVO4VJzcFdqU3F+
 bKfffQsWdqKX3k9edvBH/AnblXr6gRv7ysHZm3bZ36KJIwWV1poM1aBzPH8S0Qsbd0On8XSbJ0D
 STtdcJkYmlE9hwDSzA5NHa/ooQ3IrqYQFvIiyKjBNEkXheEHv5liw4azgFunIOB0PIZ+pJXzt+a
 hgh3iySHjWDRa4zPwhmhevZ8u8A41AOSp2DuNQvo0gt6hCbwB8V4vUznv22zvv2szGqLz0zStiE
 WC6o6FCv9TdLP3cN33QACcwT3tSYkaQ2cQNNn09KOo88XnmlJgeleXjXtpZmyNbLCbv0o/jykPJ
 UUAw1lmTLB+faub1erQ==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a056130 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7hnulnQiEmFAxUmVZrYA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140054

On 12/05/2026 14:18, Abel Vesa wrote:
> The Eliza RPMh interconnect binding is missing the SDCC1 CNOC CFG
> slave ID. Add it so SDCC1 consumer can describe the corresponding
> interconnect path.
> 
> Append the new ID to preserve the existing ABI values.
> 
> Fixes: 8300438dc424 ("dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Eliza SoC")

No bug here to be fixed. Incomplete first posting is not buggy just
because it is incomplete. Otherwise please provide more details about
the bug in commit msg - why initial posting could not even work
(although it did work...).

Same for second commit.


Best regards,
Krzysztof
