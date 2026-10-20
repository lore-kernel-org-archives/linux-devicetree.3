Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482064;
	b=zjAB9hCw0n4JjEf9AiR+2zIrq7Mhvb6X7kc40+nVYzjMDPkW8tuQidW8nYhc7JfGyKr2
	 9oyrnuhHuSk95m0dvbAjZ6BqLGHL+XWrMS4NnU4ijkvstwrdsWdVRaSGti1Jp4NW/WWH/
	 rI5TbKs9XiFDnwYu5U8jPLnJGnkK40JKC1a+c2Szb9ByEg8wJOecvHzy4ajLGti/BGwHC
	 xEFo2RBgJ/6aI0LtAtIrUjXubsdDt7VwnwPGhzVQmozVdo745HwlNbntqq2EsrsoyxpQf
	 ru7F1nIBS/XN/2AiDsB6XJPJAVB5ppLXah3kS6ffe1LEELkoCv/FUrICuO0owR14B1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WHyBOCxfyR08rNIzaaeSaXMBvmHX20z2ZAI9yVNfQCo=;
	b=d3J718sZ2IpHSmtNSoL02L9yQp6RN7ijJX4C66p6weGbV5pHhJwzliYkm2oK2SkK7WFJ
	 QlU0YgS4tAqX82nDjHpaa2ftFJwWKBwG96cxb/cnQR3X/JLJnNCYnfKZ4qIhTbL6R7H16
	 FW+1qiueeLPki/NlpBRlKwc02ClWIBj+hhbgpJHgroeQXHvu8p2Jpv6plKuCWIen4zSjq
	 dCpujSIVjqyB70OlSY9fFelmtDTjcsAHrggF/baOrDpHeTMkx6rZp+PhgqS8TQtKMbdyi
	 sjvq6OhGZtklkcZ3ejXfUSwl0Fl5lYUeYszjO+wYE4P6OZC7eUWzhIi+Cvqn8KyZ64Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLNiTKrn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BAJpXqTD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C060606A320
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C060606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLNiTKrn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BAJpXqTD
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t6ix185960
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WHyBOCxfyR08rNIzaaeSaXMBvmHX20z2ZAI9yVNfQCo=; b=fLNiTKrnOBPyf1/E
	V2zDkk9bGOlg4SOcYxissGvnz8OBNDf87jH0opux+vHeArndM1oEDDxAaMeab8hw
	jI0RYFzm4JAqYhfvHASL1C7nkKCRw/0GcmSNBsIsd+qijrhP4cwvXd+xItb+SRU/
	SYxV1ud0ar4BkiOv0OhmQTxTsQO9NYF6DQ1lkeGojNfHf0PAeHX8Xa/lO2nHakDV
	R6aJ5Dt4nehkKO/gmbOc/PmkU5Rdegt7qzZZEczaLCSfhW3kUdtszdda13fiNsMW
	bLXtkNA9UeDGrTc3iFh2x2+5SStB0Kq2ZtH/C6urwn2dd5A7PLZp2PZiNDgiS/6t
	RGfUEg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nsefg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:41:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f33438950so763250585a.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792482063; x=1793086863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHyBOCxfyR08rNIzaaeSaXMBvmHX20z2ZAI9yVNfQCo=;
        b=BAJpXqTDMdaOdil+3GEfoNO+K5s0MMzRZxjtoMmV3+SrQaYnWEKhlAvz1fRQN/yw+Y
         T8HVGtbgvmCJ5b3ZU7QmWo7Pzm5mtJAIyIEPEJN3WFL+fCkyT7Ctmd9XDNDtg1sd3iil
         fcnPQ1WSSIe//5Fmd+HGdp5in3qMgiJYe348XZkN4pFNKL/lmmxjNBLQbqUr9i85BLR7
         ZTpMb7U6Dn/kFbXfmYs7neaMWSh68h+zrHGykpye8Ym2BD3BC2ITDQYtLzzIgew0pWJQ
         Ud8N00wGTphzIcY5Q3r7yXtk/t+knUq2I578uY4JDQ88hGPCDIYPX032ZoC8lZcOQKwY
         LB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482063; x=1793086863;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WHyBOCxfyR08rNIzaaeSaXMBvmHX20z2ZAI9yVNfQCo=;
        b=IsqnLXAuTM97t6ddAXMh33W6104w15lUbSpxylb9ORmKrcx0DiD65s2wHhKexuMN2a
         6VUPLFr85vjLmjeikNraZj3d8MtfkKWkYYmxXDO36YDbU+Oj7XYhyyGdFOAXDojRol5l
         rEzns44tCNtQSzvw2vjz31t6vMEToxcdOYPqGwBg0UymKUigcE4iHLOsu4e1Ir6S9scq
         LJqLjHtIUVOChANGYeiib9hvwkPHSrlEaD+9tzTQepgo3Tk39C9qkR6AlpD2M8d/Ak+P
         w5QvSTs+4BtbeQdZg3AbOnzFc1P0MFAjxYOJUCBbptoDxQnUxoEuYFO5NyWDAqNqsNhl
         TzqA==
X-Forwarded-Encrypted: i=1; AKwUvBzEH/+qiOMdaH42yXAU8vffWgMO74fsSEHDCcWxezIuwDXcg86uf0NhPxYRRFXLk7huIo4d9PX3VSeC@vger.kernel.org
X-Gm-Message-State: AFq9FYIn8JwrgUh1ActjTj+gL7a/lHcNs4dnZLgCFZAG9MLDb0hikYzo
	zT3viwzJnjDAoO27tbt94mfKEmoZ6AFxZVu/EuDh/qKSQ3YurcmuLdIC9k7dWxHBOLRQvk8x3ZN
	tmPvPJqM//IC5o4L+3u0ru547TtB5GxePZ5b5qdR1BSR/jBfQK26I6f6p9aNzZaeu
X-Gm-Gg: AYBFou2WjjYUCdTdguA6SrOScGeSHzAQO3P7q+ScCiTfnBNXbEioV5wjDqG1UgOHFwq
	vUA0zFF7mMo833nlFV4Tq4UZR1M+2zVI5NBesCz+8grc5CRFqH4+hlkMj9IerfWe7I9LnkqyVKr
	rVra0WBeN7UeIzqycUEGr6XA+bZIMOaRtq1XJWrwWxo1tpd0wsn6ULKjstAljoNRql7AzK/o8Wi
	1uEy4959ByuCigy56jVQqB2j+01pSF6IsyyYhdx77AXCXYG2rUbwtTilD35dHYOUcC3f/TVQlhE
	V+gORmCz/E2Gq7xvuo17UkXX9IVIKSg8cx7OkYfSitJeQXhytm3cgSEUFQYJguAF3XEVa+2zoFZ
	7HFhFJKMJbdZIDWIpvZwwkCUl1QWwlpw0D78ChZRn
X-Received: by 2002:a05:620a:6410:b0:93c:c538:2b23 with SMTP id af79cd13be357-93f29b7e6f0mr1606490185a.1.1792482062636;
        Tue, 20 Oct 2026 00:41:02 -0700 (PDT)
X-Received: by 2002:a05:620a:6410:b0:93c:c538:2b23 with SMTP id af79cd13be357-93f29b7e6f0mr1606487885a.1.1792482062245;
        Tue, 20 Oct 2026 00:41:02 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f6631abfsm34100475e9.1.2026.10.20.00.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:41:01 -0700 (PDT)
Message-ID: <1eb062d9-6662-4b10-856c-6f5a3daa3962@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:40:59 +0300
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
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom,camcc-sm8250: add
 interconnect provider
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-2-atanas.filipov@oss.qualcomm.com>
 <20261020-bloodhound-of-remarkable-debate-11afe3@quoll>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261020-bloodhound-of-remarkable-debate-11afe3@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: px_1uU5IfSlEP21zlxcRyXlM42O9UcpF
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad71b0f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=YZ1k_EG-GQ4t5jaSdRAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: px_1uU5IfSlEP21zlxcRyXlM42O9UcpF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX70n4ih7gLHux
 wuxUYVsaDnX/pVqS6x9EbQO053wu1CsVAHqh0ZCjhdXpp1cIXljy2e1KAbaHwfAx0e3W1e8wvJ9
 kxvVvFw43H04wMfT00QGy91xLXZ+1QbWMaxE8TbJ4OZCDDwE9TZtvkuWwrmVHDaqUemMbqegXEL
 sYGfPPWQQGJautoOGoNxMQXleEykTcTMYs/y06zCAdF6cBnEBxV/FB0ikq+2Sr6pUjP7zb7sYqX
 872uq9ZGTy0kFXMJqv3LtD8Idj9ZSwinNE1Vh3Os8CjdVL/8wUKkj0uP7F5hJIz2nPZiLSAIJR0
 JKtZEpOlsviUxJwa55mYTEvLLPeVylB1eWN6W+Cg99sh05Y0kMfgSHQjBQGq2l4t70IjHKygzqp
 G/RH50bnL4j89+/XLb7FPz2JAWeVWuSKN1ymL/U688WROB7RvQO3WPZwhL8eXs3x1jn+8v4UxVX
 5/B3MPM8naKFElX9ZFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfXzIlfUuSS3eWU
 yAhNJDbZ+Mv+vtKPqNmy6AJM0eG2iWye5FXnIHV+MWBfjR9C/OfLXL9BKeJGzUk8cSgOcoUAZ37
 9xEc7zBWWsYVRawKEa9/eDq/ca51QmU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

Hi Krzysztof,

On 10/20/2026 10:12 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 08:06:59PM +0300, Atanas Filipov wrote:
>> CAM_CC_CAMNOC_AXI_CLK is shared by several camera blocks. Setting its
> 
> Clock is not an interconnect, although AXI suggests this could be
> something with bus, but it seems you solve driver problem with
> interconnect description.
> 
> If you only need to solve "last writer" problem, why not fixing the
> clock framework to accept the votes? Otherwise this should have
> description why it is an interconnect.

There are two approaches which we have looked in to resolving the sharing of the AXI clock.

1. The drivers newer touch this clock but vote on new icc camera which controls this clock (The v1 and v2) patches.

2. Use icc-clk in the extension in clock framework same approach as: 
https://lore.kernel.org/all/20240430064214.2030013-6-quic_varada@quicinc.com/
This is already merged and i believe resolved similar issue. 

3. Which you are proposing to have clock framework to accept the votes.

Before we jump and implement the v4 it will be really good to have common agreement on which direction to go.

Regards,
~Gjorgji
