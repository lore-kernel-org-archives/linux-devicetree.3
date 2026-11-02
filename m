Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618228;
	b=30Jl6f0p9HjI16pirkpwoqJxAVRnnTHkBY6+mDa/Y79wHZLfnWWeqb1VWqdf3CQdTYGM
	 gkgpMS9zNuiOLHqxJtxXB4HBacUiCg13NmY6J7wQ/4kwaZ8e6Hav2UKfJmRpM8BT//S6Z
	 +24BI94CcykL29xyLM2DdddoB7niczCe7ckkpIA7bVAJIt6995G/C+SGvmm9yYVdz8/rk
	 bm/hbEJlkqHtBmbyOafTlcApDlHHcIlq6RvYG2OYKFzVGyyvBisk1SG1HouEmvN6HmR7E
	 Zv0FdDTQmz7yBqFPp/7mzvFrEHomCBPgUp0SgH2v5QVxVrvTemZiMttmdaR/jzdJKvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618228;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s4VNs5xfUCjRE/cLeMEuZSzqF8vaZwaOOAaFa6QON48=;
	b=vEs7DvVVROXNv2oC2cyebh53K7TtmX/2IK2yKprjsQj8JRb2Zc1dtMJbUNN1t0boUvch
	 XevbmbDDnB4eklyDlFp1x5eqODhXgpeEynlGWPBOeq06InTGUMBidkpXn4B5FEvxGGq1A
	 /Q0Zu+UQrcxCapAGbrF876ENTe5IjX4pZnpyJiDPZHONRptjansEhrvzNQkYf2wq+4OCl
	 jPD2WCZiTWGjJlRzyIaLb8xo9uBKpsMKuEL/7uD20k1GqgE6n1TSaktaDMyQ4MHDP99ps
	 z3NV+ny8sz8eRZnWcV+pLdt+lDxA++Hr8s4mryLdxltG6AVmfDdikf4kGgZyOFvQIuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="n/ma8ISD";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YPVia6Hw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE341606A335
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 11:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE341606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n/ma8ISD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YPVia6Hw
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AtnS3431819
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 11:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s4VNs5xfUCjRE/cLeMEuZSzqF8vaZwaOOAaFa6QON48=; b=n/ma8ISDmfVg8B91
	6m2xTRUJ/nM7llmxP8P2zv8rgrvHswLZp8Kg+qnC1SklYm9LPnz4GB41/O7xdgxN
	K5VG+C425rWeahRAf1fPd81x9bZDVhn+F/3w+r38WlOmnoSQSJDhONRgjnaUPbwB
	0ZUvGlc8Upz2N3AQ2JxzwqpRLKK5tly/okuREx1n1aYBi15ig2ghRuo0+u0HGOf2
	E2BTgkFcqt0UFfLIAR+q73VBWOvla+Bg8z5Fa6ak+0VlJloV8kzX8O5b/dpAYfmF
	HISGdt7us2Cf3K03Uak0vd/VZh2qqRQVALtlbBpZTBJ2D+mRcDWC29XV5fjkVmfg
	Q/EvqQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmes0u1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:17:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91ca23ede8fso7049746d6.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 03:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618226; x=1794223026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4VNs5xfUCjRE/cLeMEuZSzqF8vaZwaOOAaFa6QON48=;
        b=YPVia6HwUcUBzzQXlGvA10Nnh6UeVu3+JAuijIpsrpOlAY56kbPmcimcckasss/bqu
         XSCeUHPuVhkE7AJTnJuVkfFhR95tNmisMk1FbYxHe5Cytt0kTXJcPbQHA1TFgz5PL9aL
         j4NKDawMi4rfuQWr5hVFyfNrvYnlmeFnwnErne22Fdche7Ksxpr6rjid0Ro4JNjtXjch
         4JzC1BgfHAiQj6/u/+KPBz+AlUxWTR45YKY7fNeDQHFu1A6xpsN3oPKJibH0lpa2NpAR
         TxR7lnlZHlD6JtbLiKBDUxXi3I9L4Mzivugqfwjr9DcOAoDkvHMH8P8B/O3YToHiqrVS
         bo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618226; x=1794223026;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4VNs5xfUCjRE/cLeMEuZSzqF8vaZwaOOAaFa6QON48=;
        b=Yjmq4qJJoPFB2wBtUgfi9PwOrCYIn0AtwYk87YbXszKdswtyAEyenX9c+ivcKS8nNg
         BLTaKbPrSfMVpxA3X/FIweqH6bb4odtlyea4QD8VM7nnEq6PTDavloO79yUjMWWnq0Bp
         N1D1SO5KfU/9MHMOsYfqYOkzCTR9DNtewQe20kLyMNzxRNUKedHzHHR7BiALa/JBfMob
         WnWonieQE+hyo7K4W+b6kyq/NkjzJ4UfcXzUSNjcRHE+ecFRJdsoBCzPfKV7Lewd99qV
         POM3jdExYVxuSoI/vIwhrTmavcChoLor1zCeBGbLLRirsdCc3jdVu4FsjckegPiNQy31
         7Lrg==
X-Forwarded-Encrypted: i=1; AKwUvBwCF9LZGg3TgXHNHjOR7Sh/iqriRKTCVJRySl5fY8a6qPLRi5PIEJK/y7Q2xMLuVby/kQea/0WzkyR2@vger.kernel.org
X-Gm-Message-State: AFq9FYKlto7QsaAgj5TnufLIlhs1rxkA9NDD5/Fbgf5piKpkdWzFXtbN
	/A9gbnmeuisynb8GU4/1hSnT6IT4yOf/lm1Jvp8nUyQDZY4wX2DqL18bgzLp/IJv5sgK9UObv61
	j/2C7Nvho5Rx23dXp6U8qhUkUNmBuPGohE1DUEz4XiWNGyCpB82j/pSrNaASxAh6h
X-Gm-Gg: AYBFou3SSCLx46F1dDXW0dUvav1nh2V4hZ35zVj416Y7vLK4Jw7q6ra/hizK7WtWxw9
	/cjujWXbEwCEhlI0OjxQBOc1A7dqHeDOEYY5DE53qRPkPDjDQYjvm6Vt5Dq71BuoBHicIgaUEo8
	1UyQJYff87L9RsN1PhAMLbKJs6TMAwH8XDPgI8FrZMsivL5QIphYlMjhkeO+MlvpRc63T20bVxK
	SWFQG6rLO+o/xbYlPkhhLlXorsHYyqmUGzIuXl91ziCGalJBuxC8Qo1AUdg/I8zmtIBakY955uG
	6CmT2CrFIikh7+U/85x4uHrZKTC/agU7jkzxJXOZk5nAm58zKAYVhvOV5QbC2jM824gbzrNf7HE
	5kFT8sEAWukLs1Nlvukhercmrrz2G3aq1oe0u9MRaHlaGUr3xOBzUB5G+y4wyHJ46kwlsDiE=
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr1532711885a.4.1793618226104;
        Mon, 02 Nov 2026 03:17:06 -0800 (PST)
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr1532708185a.4.1793618225658;
        Mon, 02 Nov 2026 03:17:05 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd249sm375857566b.20.2026.11.02.03.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:17:04 -0800 (PST)
Message-ID: <ec20b3c8-e7ce-45d5-adbf-4d2c917940e2@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:17:03 +0100
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
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: milos-nothing-asteroids: Enable
 IPA
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
 <20261030-asteroids-dts-updates-v2-5-66a56c537749@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-asteroids-dts-updates-v2-5-66a56c537749@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae87132 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=RBzhS24iIX_dIUMOZkEA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX3u/4f7msuXDg
 aWMNEAD6hpDZH4n7ZUjAda2RaCUSs0TwNILYgVaG7dcmIuRJ2fL+4N3+KkA31oRtHxzK9vWXZHo
 n1DvwzDFbLT7/doeGP8YzYIJk63S6SayTvy6dtTMHJa0qJDYUDUnsfSG0dXqNkVmjcA19dYSicp
 yoDg0ReT1CIglKm3YeopsPeo6qxo/H0o+wv2ML+wBKS9AGXsHWtBc9TZ1aSezc5c9tYWxEolHoB
 UJErV7ubyYRJLgXiWskvwqkDMyd/aJ7ywjvyNEBxgjohIE5wC6MKp26ssNSwpU5pNojwdquZE+K
 r9iewMOOH/DFSHKiDQ2Y83GTwRGste+qKaqyVQFjV1CmxeCXNswcAyFMBZ9DGsOFP580xb4IkFa
 aaMaKuBwnRZVwQujZ1NKg8hOVp+7JGyAp2CRn4g2CZoH9InypkGTwy+7ouYJf8AnvZtqmQHp1lc
 mTdJ/9ddx+zysqyfEaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX2ON9B07T6opm
 nxRTSCaMPRvapx5O/OLi9qVyDuJFoGZ+k46oSC4JH8LHN+qZz+FdfIZXv2N82xuwO0Qvyff9iPI
 w5RpYhrwMtrhu0bViDAxtMc3Tesvk10=
X-Proofpoint-ORIG-GUID: bhUMeqz976Q3xxkcw436uRNHupHRvI__
X-Proofpoint-GUID: bhUMeqz976Q3xxkcw436uRNHupHRvI__
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020044

On 10/30/26 11:41 PM, Alexander Koskovich wrote:
> Configure and enable the node for IPA which enables mobile data on this
> device.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
