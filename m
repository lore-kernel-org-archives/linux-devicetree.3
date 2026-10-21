Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572855;
	b=meNdLEY0FpHM8b6Lc2uRBXaLp4+cbxc2lbGjPMDU+LUMNWsKcYRnIV+WnFt/cVCaYrdH
	 bZ5Po8437Xk7e7CveNLtZMUM/438BI19DlLLl3aaFFMQkYLl7+4nF8FBsHJB7xxIRtJic
	 2zVIFTbsJUDVaDySBXRwLpi55Zb6N3YzygBeW4/riQ5i5f3xhatZK3wF+2sfx01RY/Cdh
	 mWgVnaBllXuqdrE4e244n2tF7Qo1GhI3Pb7ROeSprkwJflIRyEKFXzjXMzajOZ7s7iNLp
	 dn4OWT3uLws1qs7bmtEPunf3C/M5RkjJpPmmv9W9NpN6Fl31l7L+Bc8BvBaX1y/VdPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0r+7BMhF2phGSMt7OfziLY4BKvxh2W77vTTsK7xMOJo=;
	b=twA/CqhEVQB9JWidqCDa/hTMw+V7kK/MdWu90mIMEHiJXJ498w63sEw5BA8VQIm7qnL8
	 nXcShcdoYtmsuKwHzD1ilOsYlNJ/yzhWr6uHMog2e6rPXIThJ+L+T4yameVuea868MDeu
	 j1oLsgo04i8ajYjs79IqAUgNj91CQI0kHkqhlJFt23ajdTCVa1MOKaV32O1GCQ+V8Texx
	 yPOwdzYJ0B9IRSByxiuhFA2ygvDWQrP2nRJxzxhLlR6DENxAraECg9bSjx6kaufv1Ybdb
	 v2j5o2NQNhKtmfkKod346ZIAhXbgNE9CP5epi44S157wgRU3DW7IJS5NxQ9PnWt7nyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UuXTUMT9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JdS8auAn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA07606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEA07606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UuXTUMT9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JdS8auAn
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jI1w2848156
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0r+7BMhF2phGSMt7OfziLY4BKvxh2W77vTTsK7xMOJo=; b=UuXTUMT9sHPc0oaJ
	oGz/YooBQ4zlHr80gMeUyAfk0CopnKjtkEuGLk9FEJw4eT4K5MpGd9pgyKk1R4b2
	Xcrj9E2GUNBVBCTIp13UVioEtK1m7vK2F2T6GgXSq8nhCkLk7MW8G6hRa/4C10GE
	Q7CNPWnY1RFgj2hVwZ9IqBNnEWI1r0AMvNE65qGB08XNIfuYIsEaLPAmHHRoo6Pj
	h33l9GTZuokOxj28o7OEKqjx2nTkl0Qh8dUK/qb77C6YX1P1S+TE3eM3Fm0KcMbq
	eWwtfu4LnUHoJDy8NZN5vmPOE4v/HKcZG2Sqm+ddMZHDRgnOlDT5r2BHfrqufpOH
	/h9qyg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9avu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:54:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so14306385a.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572853; x=1793177653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0r+7BMhF2phGSMt7OfziLY4BKvxh2W77vTTsK7xMOJo=;
        b=JdS8auAnw/hUHbTKueIWNoDhcfjNhZrupqcVGSkas7bRcCdo9KdYcQqJg4Eu7ZRjGl
         fNTe+lC8nKULV31Vu3sYoyUCadvG4YmXo/6O/jQ/B+DEN2qexJIKeZ9GK7BqIN9TtCwG
         Ke1Epb4GrcYL7tVyaXzMMPUOUVIt7IbBTM2vIAvuaHAy92U7No4LKtF2mR0Ojm974Lt7
         t8aBi/1g4yjFEe1rlCarlNwKaRlOCDZpJzlEwyxbbp7qBWpfNHd+4ketP4a7AnYams6/
         /4ETcnD+3+/w55IfxVfEWKAfdnfwezwZ7ExcEETq7OvucC3vnsT1nC0COrsFL/qoBdi3
         M1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572853; x=1793177653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0r+7BMhF2phGSMt7OfziLY4BKvxh2W77vTTsK7xMOJo=;
        b=SZa0HIuzKT3bPymGIiexdLrmHjmfWvzxikySg2Ajkq//ZdZ/nfnu3z/bGI73WevU84
         6g9suLVegbIy026e3oZ1Y1FF9vDmbG2eXLqEivQ+L7QwFlTxq071ssgwztacb8tjLZ7Z
         tgoztY0MbLSzDbnZ69o+kYAj00cEMrWjoraJ+s3gDxKK+yeaUWq4xYLL+FHWxGFY+jzS
         VuyyOmJFG2S5Qe3L0/zfQlgEv5tz8zA9S3GjgiN8BIq13cQYzJsyiiNNewW4Npkx0Uoh
         Rcc4XZs/5yLzyJsX/vnvNbrWZXvWS9GsYWGmWSkrJdDzE0HTZisCsLYpUzkxmkPv375r
         7APA==
X-Forwarded-Encrypted: i=1; AKwUvBypXoGHA9eig5oSZ4o7CVJxF424zyx+MdJquPAyFtxLWVKldMmyNXf5TzwyG9fXvbQ7UHb7jXU6mvA1@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8zT9pNqQyFKNBCENBhSPMxJ5hEcD5G5kBtl/FJds911BlMkKI
	BekE1oAU3aqovbBjo8g04niSiIFa35SnlYktGkfVUmfstBZqGG+87/wEIQG70nYe7+rmh+CsZjX
	ccgkfubEZmYRfzAec/26NghR2o5aZNTx0t1uyKMAAS/7svuHNtWBa18mmuewrZM7F
X-Gm-Gg: AYBFou1hNuLVSSfmTzx6iT/KsCcS0kdjEiLICefLgf4tOPvpLHEGCzOxT+XbA4taFtk
	KsBwSZ5K0Gkxg3pAWa2vqu1+gf8on8mt5KPcolpSDC5qbVuzjf4m5Q+ARyh5owuR2ir9/b5/SUi
	u5qyLUlSF0gaBYSgrsYpmWa3sTcxmghWeCMFUpJIUbyS+uf8TWFA7TBKoUznpC9m5MSl91DAcq/
	aJRzXfrOVnCVnn1QypqGqfhpgoSOXu1lZjbUPhTd1JfqhfTFQrWLG0fY4IXAyqSIg+zwVqyoM/8
	8YbB35/xboCa5TOkGzj9n9KgdmYZ9YrZKmgktQDvcvcvU7x9b6LwK1e6EnWOBu8ChI1kM9PoaZM
	oPUvRl9OkhVoCdt8hjwqPig==
X-Received: by 2002:a05:620a:4589:b0:93e:508b:7800 with SMTP id af79cd13be357-93f57d7628emr374396185a.0.1792572852963;
        Wed, 21 Oct 2026 01:54:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4589:b0:93e:508b:7800 with SMTP id af79cd13be357-93f57d7628emr374394785a.0.1792572852579;
        Wed, 21 Oct 2026 01:54:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030dafe2sm610154a12.12.2026.10.21.01.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:54:11 -0700 (PDT)
Message-ID: <b5734dac-1285-452b-8107-9164e6a3e5fa@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:54:09 +0200
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
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: glymur: Add CAMSS and CSIPHY
 nodes for Glymur
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
 <20261015-glymur_camss_dts-v2-1-e7b1f403146f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-glymur_camss_dts-v2-1-e7b1f403146f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX5KXT/GTpqgZG
 aGI+O6aWXqd/7YpmTRGiJPzxzzFDtI5nwgnOdj0LR3WyIPEuKOlbQMEliOLhy0HHEu4q4fDD57+
 eBe55Dq/AFk6nyposuSe4e1xTOZpblw=
X-Proofpoint-GUID: W6BypANi5qff--vAgiM2D7LRZpN5-zS5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX6ylNVh7RFnRE
 nnWPgO9R41c8l+fzC3x/30pgAA8jH7BDLmkkS1Hdo2s5d4c+UXIE7Asc+1QSMuSiCbPufXiIJ/S
 o2bX8rsF9pzLVGuBHvhffzvMC6A3/TtuAJbPrB1LZBuoQyThNabwFroeaeCUNYK7hDkdfhLX1sU
 UHN4xpFj7wsVgtlCnKUvUxXGjWwwlZNqYAZwYqUZyuezLfcsFeSlP5Ym/gRscTK+ZRzCAArT/1B
 sQ/kiLV4gkqUO9LYTrN1YyqQAgYHSUX9U6KNBlbhZq6hWjPZJAH5dSfD/fD7JlP+Fb/6454FD29
 p4nYj6oVw1eKv7BdZcaqpQ8CI5WRPcLQmrnZ+Y2xloy68H969NCn+yHSgweGpQIn1nSm7q7y0wD
 0HJ15vN5bdonq3ahpXpuNrsBwfEek8Y0j7qPgnNDFqxjYIUFodrsFW8e3s9ZSYa6oEWz4CaGdzX
 +W9Je9WjZNYCSsGxvBg==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad87db5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Yiy9HrlOpii1y77HuFoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: W6BypANi5qff--vAgiM2D7LRZpN5-zS5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210035

On 10/15/26 12:52 PM, Nihal Kumar Gupta wrote:
> Glymur shares the same IP as X1E80100, with three CSIPHYs that use
> the new standalone PHY API. Compared to X1E80100, csiphy2 is absent
> on Glymur.
> 
> Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # Zenbook A16
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
