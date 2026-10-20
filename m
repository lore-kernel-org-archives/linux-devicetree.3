Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504779;
	b=zBHb2vvjclZoqcH1Q9XTFopTt1uAIQcW53qCVrLOYKueMD2wj5YnSBXgt2P5qWkoM7UV
	 C53vzztzwzWYiJcexoNSo8I9H/kHRPuys5z+HjHIaHQty6ARv+BayYpkTzSbexEoTNVbO
	 Rx926HgCaVgOnXAECPPrxcRpKjzkkSm401z190GviIseGyJi+lA5W2ZMeuofG0NNRra+1
	 7iNtCuFx6K9s2n4HzkfpX586dgNYo0tTTYMX5XljbNATh8nARS+NFHtwINmHS19X6lLuq
	 Y8o4Ebtr8vPiGeNxZKu9wADb8olj2uvo9KPbQyatETUozTe7uutuLX1Wsdx5ZVG8IUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504779;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/1SXnPGNUvUddGrYhMLJ2FZJsi82nqvg3oxQOqmRtGw=;
	b=vccKmmbKD0/HO9+FQFZ0e7v1Asq67IXhUV56d92tO8fZIteQKWqIz0l5uwVMoqejOABZ
	 boajeSuK302aFTGy7NnRXHLiKi3zBIPOHnmE80uuCn80RsikMLwPcvkdgTKR6nFFZGQ3g
	 S/O6hYD5pyKM2m1r2252dqF1Ly4odZ7qVfRITqEGhL+UWJ4O0nOd0ylK7Or7kIqAMC625
	 hmO5Q8t7Chb/L7n2M4hur3+t4PKMc7PO1XjVeDpSB8mGfJDCCtT7ci+tC+XnZhH1r663f
	 /NOEJc3i4Vwg/nvbkANCPUpE0eyhXZ6/IBRI6924YULCHeSrBpAuo3/AG3n/yUT2z0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=niUAHtj+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHfHQyy5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43A0606A31A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E43A0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=niUAHtj+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHfHQyy5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDABFr702631
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/1SXnPGNUvUddGrYhMLJ2FZJsi82nqvg3oxQOqmRtGw=; b=niUAHtj+Fdseix79
	i7hZEjPU6kpD5iwYP7SQicrMCrWop8ANv9ccdB+MAu4XMVLdi3vXj0FFqmrjAETa
	Bp4kSfk8l0gjsWkLgiNfMjq5sXejMfKVoJIcKzdGr7eRxo1SpE5JRE509X4keplb
	3SQRX9WV2CBesAyKvhsOhbjhbibNbq4Gh6E+1F6eAVhxTQcsJSR2hJxt5pJu7UUb
	uJ3r7Z1WeqSbHkLarPLEMdjW6lKnzELhtOUugE/MFWLeMjHywHCrr44KuxYffy4Z
	BHs2P6n1Tim7N9q9GCh2x45YB5rlFNABP5VNSX6cO6RSYIqv3G9wTVuxJQBiTWMu
	8SX49w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5stqq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:59:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338bd59032so4532611cf.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792504777; x=1793109577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1SXnPGNUvUddGrYhMLJ2FZJsi82nqvg3oxQOqmRtGw=;
        b=WHfHQyy5l0fOy80MQfga8zMzZXTwWjoo0HObtWPYOSkUu3Z1ckM+01Vefa9dcmgkMh
         NcoUzgauVbp/0L/j8i3RJKg1t1hWdf2d0sScLARMhjK+lhC/x/YFwrvxDdYBhTR1wxSs
         kdVlyMfxgQ+qwNEeqzXcOGSFVBUTACHoLp2F1reF1Uvf4ESmKYHTlMrnCNPBvd6AmmOv
         Oj0iZrHJ0dKJkEQB4QbFL3IbvH34nV9wBVXkP4DEgCoHJQl/PjfwMY7NCZPXKZZIwuGX
         p5SuQ+hqkGto2GYFbu4LrbcvstUV45Q4sDYwitm7ZPtTVeJa6O2/6G0VtE2Ot+MSrZJy
         hqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504777; x=1793109577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1SXnPGNUvUddGrYhMLJ2FZJsi82nqvg3oxQOqmRtGw=;
        b=OKNz//TxLSYMM4FaxmBkA9Y7Wqx2mMudqnkmL8qehLdK61TDc/4IImVVbPhFfU2pkl
         82lFGjlt7jinojWaswaTGQ7vrXhRKYbmXKv66KrDULAB0tngWQ3OAaikhNkcDfWHKk8L
         E3hs1QZPocPE6XlNs/d5MB6q9l4epT/vbixCBr4TE98Vl2nJU8+tP8QwRcNK/xWpElnx
         vLMDXhrbmQt6pyjxb98XEzNKAiD8ZgNQYSTZ+Jjl9911Zx/U33HtcShTLYTOV6B2W1nQ
         OJGlZcxC8aXyt7sN8sSAZJOinvoSPKF9Q8b6fkc5XfG0QZQaHl8pOtCS4rX5fF2MKyIU
         meYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWqKtTEAB5mKASfT25Me2bTAZAaf9NvDbNNkxc6YnDECTp2U0gWkPP4aXSXxkjsbsEukCf19b2iz3e@vger.kernel.org
X-Gm-Message-State: AFq9FYI1O4Oh9spogKb9obCseVrMVM/bvnrdOcy1MyhtLrCWGRuTVZHL
	0Gk3T5pUWvOQaZV6bis08bw6xXJpIPpl8ptqbc3zjdyAEAec+ynqDLL2Xw+nkb/hFeXePXlfCFY
	QqdvTDZauBtchJDuD9c7EzfUr/BR8qvLJMl4MRjz6L75+vglG5xJUX6L9XeA8Wosk
X-Gm-Gg: AYBFou1JHt6UyNJcZ0i0LwZT2IZHzydlJ5tr+GbJdfPDkIcD5PW78dKLFpT+uV2Ybfh
	9gBJlR8GoFo6n81iumsHmdZputJoe149L5cgmCG5pshG2t/zmanI8rVTBMbuK8tLi1xF0PrTGVu
	ULFJCKE6oA7ono/4RiqRLRtNA40rtPgpZbRkHtRsj/+97yte51XF4c8+QVm0tU2/tdvYpk7UFcs
	FFVm+N0cdtW/eOpamqvOiuk8ANXuJaHFh7C8u/AqMedBvC0jQ/bMVIE4VFqq4Ik5dp/Sj7Kz8i1
	qe+XSkGpIHywGeBOSmT/YyATYFrS96kwsgYpfbCjlm865GWN7U9bOnIbjiMbn65H2AvGrRsaN7T
	YSohhAKi5CStChNp/ucrx0Q==
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr2188996285a.3.1792504777258;
        Tue, 20 Oct 2026 06:59:37 -0700 (PDT)
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr2188991685a.3.1792504776850;
        Tue, 20 Oct 2026 06:59:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e328775sm485955766b.7.2026.10.20.06.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:59:36 -0700 (PDT)
Message-ID: <883e7b91-d2a4-4c3e-b6e9-32d0a87361e4@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:59:33 +0200
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
Subject: Re: [PATCH v2 9/9] arm64: dts: qcom: shikra: Do not mark MPM as power
 domain provider
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-9-ac7f1a0d5638@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-9-ac7f1a0d5638@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX4SQN2DP04524
 agXi6BIfH4wxYfEtI/oLNowK6DVdTguUR18pQ44WGPFWtitCAj7jCZRqmaoif8AYDh26mn7j/A7
 rImsF8yJ3GE5pWQAz/LW2dfl5dZA2UE+oP7OKxp3e0D+pQ9ooL8Wt4tyt/HNkk+YVP04bUggoy2
 oOas/hJzxnqspUm3pgcYocpbbbX+7fEgJvSSuK93qELWKz5g254BlrWUbFewBTEPo74npomyKWI
 wHrFABSOmcRg8js71fKdp4R2qQg8xMi7l3HoNQzDrFGXJNeqTdo09UqS8miUUXzV+aRPaVop9/t
 fmhjhg2XnqCGqeH4W37aeczG56Iuff9R2w1BC0S5XW+pQ3KXtOz1I4MMi5JdipSY4/wbRa4TSc5
 iQUPxH7Nz9XhGqBmPs1G3hk86EX6aJc7sk9rimXaKL0inVzZbwAIoOjveEb52G5PI5Jvm6dAtpj
 cuCFSOlxq34/ApCYngg==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad773c9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=F9CCb8yx842l5dURUPAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 1v2yc6nHPZ7JEI38MvzUO04de9cy3_CD
X-Proofpoint-ORIG-GUID: 1v2yc6nHPZ7JEI38MvzUO04de9cy3_CD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX6PlM94ys2jfr
 iHyh/z+pkf1ySrY21tFLNVJWEoTGM95eYT0BjM1YDFPeINSsXp3pD1BEOHciybJaxW0e6jbYX5O
 9NJMva/vkBuYNX/8LpX+Tzf43GlfiE0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200055

On 10/15/26 11:55 AM, Sneh Mankad wrote:
> To make the MPM design more logical and avoid probe dependencies, the RPM
> notification is managed by registering for CPU_PM notifications.
> 
> Remove #power-domain-cells property from MPM device.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

Patch 1 introduced it!

Konrad
