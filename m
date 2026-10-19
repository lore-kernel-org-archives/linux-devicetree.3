Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421614;
	b=IOa00GHhWw1r504lu8wtRXIOI9czyZGRH8U8PfTy2FjufpG8s7ZLK00gXT+dVcoqj41E
	 zl/XgDHMXmZqwDeUPPLkUqX8zJmW0uNrHc6Ult6wXQuIYilVrKalFR+EaH6ToE9MebIY8
	 VhA2XeeVYDOdVcBFedRfqg6TThEaUIGf9wd0ABEinBDx3lQdpGG/UQvlovmEzQdBpHUPO
	 uWDKv4tvv3ycvvUcsRijDUaAoEeZs5c9n7MPE4fpzwRLtbfU32qM70U6s/NfmG6xCRnAI
	 0QPSRZWyosuHXxq16kM8kh63nyGi2jBOXGfjVD37ejXWKuh2I8aYwzjo3v/ToVRXY3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421614;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
	b=zw8EOxIS6NRskfM5j44o1HN5tk+8m4s6GCNm+QrQkqzk1q3coDnwVdRPjAYGBVkhfjpg
	 GxcYZi4OcYrEzG9+kNue1wPAQ+75Zqd4nFpxlyWVbxBFpjw+woKRa1lmefePMWM2kPigL
	 t8MOoFAFa2nvgk5qrqDrpLFntvqcVyj0n4kw+L9H51u/ja1gBTn1QTOTFJ4XqXhIImqM9
	 P0hFBK1iB3uuuC8G6i77gjv1wwEDcdusOmUXSlArtCvF/quXHt/f5PCG28ONVV/r76zJP
	 ov7+HD1W2foBXfbM5tw/AVLT94A/mtUv1om9C1pESaNaNBnWyWNVbaYXUAItX9A/2hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="P0yGY/me";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YIoAJzoB;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AE1606C149
	for <devicetree.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0yGY/me;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YIoAJzoB
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AC63FDC18
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421613; cv=none; b=BWkZ2grHPJvS+/31qFadiaxs/EUBctINDCrHxMKUoGBhH13+yuQpygl3ojqvpdGIyXZmuo81PVLl+XVwlEe6mzde4vHAiSXxol65gvUuaE5cxgNyqkvuAJbOnt8MPIf6bjGRNpk4ZJleUiKfoNS0m8Y0ABdzl6WwkdQ7SvJKQW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421613; c=relaxed/simple;
	bh=8QzhEza4cmQmxyVPqaeJPOjfbUX18+JD1Hl1uHqCQBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NcbmPWD0eBU2Ue74j+9Y9J+IORE+cJgBdlQzMAovvP3SyHcBFbz7GWJLjYpAysvBi26NAmBYt3bpma3/kM6jWxPDKzovoSLLSreJZfDuMfmPT5atmCSPbHTl9NzUYnV78bibAfQbUky38RC3/FGbPqNA6ebHLCmyFBQblLJ95LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0yGY/me; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YIoAJzoB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0IVE3401080
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=; b=P0yGY/meToCkfXMD
	ERJxZldNG/3CN4TYtWvURt+Nj3E71DWN67WF+qoqtKV9jmDIwtOuGSTXHsNVIXZC
	R73aUpsQJPaS6FKVK1j75E1T4zr4eG6zOWWl3KpIIcA8+sZrdeHX7w67lreawtvx
	gAtR3+GpkMogP9gnAmYj7LKxD3GIyQ27V5V4etMPOpG3WC5hHsiZQfwcSfFJpm2S
	u8gdHYJ6vToL1QZirfusd6YW7L1Ap3zydnHU2M38mY9DGhFE+wKnOQpgr+5up8Mf
	tbQ2FtusEFlkKqRY4bXw2toI3frV+js12w+cqlk3bZrZ9DFKjeMzbsMNPigx4tRp
	yRsswg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn1hk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:53:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1440e081so32633385a.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421610; x=1793026410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
        b=YIoAJzoBzAZOEr7tRnwcN5WijY4FhiRXcslGi0gyCMKMOoRxOs5jNGj9y/BE1j/6Rm
         DmbLjXtG3UNgA5AyKV8c+liIwgahwZqJjfTXDPKLE3MSA5LmvEujgPuxbngPqNs70W42
         PWQqaW17ILJ02BJ8220hXbVlqQAbreauniOoyEUByafJ8vqGhud041H9qy9ojOrwNZvU
         uVjGGIXABvjf1yUqX31FkFd5UTgdHDYji2pUrVmVZ0WS3gtyz5oDobMmwZJwXMysSYPm
         VMBdTE7ZQPftA6QOCaLSb+CWw2TPWQp2IedDOG3FGRU11ejYwztFWctnrB865eTUwDV7
         xrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421610; x=1793026410;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
        b=vqEdGqze6T5CMwMAN90ofHzwLRYJm243b0vrLVTZT9RtTLmlTefnr1mC6ysZEE77eI
         tXwLTj5xpdrboEUf1GK1vn8ac/tlcyXzgjDEVKgXMLBWH7uWzPX6jl8sCbWrDA14FSXZ
         2vMitRYr/QOBK5FjDE+bivC1AqYUd9vPwEynH042MWkJrqxGiad8a+yrqkZ5cEx/woyp
         OK9QC9E5RH1WYJdao+IkhWP9JHEBbW8R5BBV01ofVkdv9Z1xnT/btF4NslayQCgY4J3K
         YSHvai8UAL+YTzX6kt9L8mrh8rA4pCDttJw+VYGOItL0kKmC2TDkeRV91/rgIiNnTDcX
         1vLA==
X-Forwarded-Encrypted: i=1; AKwUvBzqp2MpZMsch0UNryCHw3zMSUqGh+LurMBM2mmYZNELvFQY36JCj4KZabJwUyBjlyqJSYmpl2a0mBz3@vger.kernel.org
X-Gm-Message-State: AFq9FYLtRNJMiTICo8xgnlu1KFg8NAuqYkPeUGV0+y4xeLmmYzwODD4L
	gSC9ZED/g08MkL38b0m2MIukK8cvDWQu8Wj0aCJz2T7J2Tr1yItMQI0mRiqR+W983oyBHM5GWB/
	umjXHE86GZRjbaZoo1CKmCf5lTjNW3JGN9WOX7KvTLnsD2+XxDqyyix0SG/AZgxK/
X-Gm-Gg: AYBFou0n/MvRwrkqUHrviTN/kqlTvpkfVoPbjVT7NCOFTHVht9Hut8LY61SpP6KOTKg
	mmCX53E0aOHFq1kO2kecetnwi42KoEIIFGHGuhZMhDl5NiMh/X3MILlfLAmQgaTYvpMMmBkBYvo
	tIztBgkVtfRQEPb2fS8YDROP9eJN5woNCo6Hc5FtT4Nh/N6EmreO70xK+rM+i2EmmqHUgsriHlr
	Xm+JYUBVQ+qYlnSmvbAVwvJzYbwHxLdrtNTGbY1NUPzezwcSKHFGOfLLLA+YYHSuwubTQZapDtk
	e5kx/6BfcZpgxGi5rGnsbbWLlTBscqNx8qjpmQYQsno5Y4Gvt0jP3GCaY4yJT7/wCTjAcLiroOT
	fS6XTCsYm1F8L9M2VBSa05g==
X-Received: by 2002:a05:620a:6192:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f29e50356mr1470499885a.6.1792421610257;
        Mon, 19 Oct 2026 07:53:30 -0700 (PDT)
X-Received: by 2002:a05:620a:6192:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f29e50356mr1470495285a.6.1792421609756;
        Mon, 19 Oct 2026 07:53:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb2f64sm365653366b.77.2026.10.19.07.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:28 -0700 (PDT)
Message-ID: <2d491ab1-b7b3-42db-8302-5adf4d1a48fa@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:26 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-10-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-10-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXxeYwkl5O7etC
 c0wTFk15hHZYTKs7BtcY3FHyZTeGnuT/FQPoguzrQI1BS/RbgQfqXsOXXgaiAHDm84TagGcMnar
 plrJt4gTU3nxlr7/uh4DuvxsHlCbjuI=
X-Proofpoint-GUID: tWZvzqtyUgPrfOfWgD0414jM1QJQb6bO
X-Proofpoint-ORIG-GUID: tWZvzqtyUgPrfOfWgD0414jM1QJQb6bO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX05iKQKYWYLst
 8GPFMw6ZBay3W3p1paJZnfGwh5Tcdzo+qqXNqL1ZD9kiikZUgEWiGkUhB2TtMqwf08t1FPeTlD8
 oDYQuEr74krBcQJYpgHRZ4rXRnnzXMYfDjZ6D04vvOWs0uKS/GVaLaE3j+d0GduRafp6p650HB5
 XYBV/RJnIAbRmyL+VYTqvNTfGdDXbWSi9vaD43dYlU/V1ks9LL5cCYFIoew4O1nWpvQlJK8G2V0
 d8gT21umNgvoCQomSph43XP3HaISuSUpTWzJAxpcvv91+UnMnaNsZH5JtEGsQEiHNWqeAqigttv
 rBTIL5rAlwbflBVXsUFI+59+I6FXex6cAS0ZymU/32X+QuSQy1SfnTYINBGdOhmGfqx5EJC/o5Z
 fUQbLuZkpr79QCOGc+RQ5aBKRV/jXQ1Dv74UIs8fDgMxPW8YZMFUq7aV2JnglPl7KlSuGj3q1j8
 q68iLmvugnTU87ovWrQ==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad62eea cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_ybYkvnUm3iZRZ9voNMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
