Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0783F23A3
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997029; cv=none; b=rVYX2Q3gyWpyKIMbWftUua4XYVruq6c1C3Gu3piWL8aLWZutr5o/v1Dmnico4E/GcZ9LkUJFRXR0ZrFUJ2NxBBwCxxaGaOPnyjKgL3mp0jjDnwv8e3MX1SLY5TT+E8v6RR66/SS2NW7OnIFbRyPrTa/yCRPDtomjkyiqnviPzZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997029; c=relaxed/simple;
	bh=ZpIODeaWyvNsPh+tyzLmM8QxMULdEDnuoxTNS42vm4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MnZSKpKTJ4Q+UPDnXknr0ZgQwjpGcUOxtE/IQ/fSeVb4KrdXBVMhC9QgpJwffVa+0hhr0kLzfPAqIOQHsc7pdLD5BPwrZiaebxWGZv5/eGLf8+O58Pn+Z2Xy6M1mvOobuhyMICcasnmZ9dbRobIx3v45TdGAXXTd2o5i59eZs0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J8l8TYYK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPHR47aW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J8l8TYYK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPHR47aW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65985Vnt006923
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 09:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dbvit+7ci1GtusBQ8KSQzozSOrDSwLmGC8Gr2o3/pSo=; b=J8l8TYYKtxQALvIA
	BwkDOA4vcH46Cczg66R/mr9syI3OGuTAel3bg4ZaSoPLnLMLkB2LZBHmNcga/ES2
	ksy0q+9GfHVUtRQFwqQFpUetg60d2YKz/n4qwJzMaD5a519lQpCt59sfkPdYGXBE
	7CNJ57SDItYpC4Btj5Vor52YJtvVTTY2obYzSjgTOs2hNc4CmY7H/RKrPy/d7ur+
	3bNPc815RMdUC66lw3hB4nNVSUb7eD5UgtHLTdTP59zR1myoegVnMvktD5kThDgb
	mezfY8HZUK+PDw5lMKob7X4W9qGQdq+mx9FUwKdt5d2Xv1GjBm/Lk9oVTg/DERx5
	PjBwKQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0srakm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:23:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51780e3ca44so10544251cf.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780997026; x=1781601826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dbvit+7ci1GtusBQ8KSQzozSOrDSwLmGC8Gr2o3/pSo=;
        b=kPHR47aWIfR7FL9pYnlCUIhvoFNfruROqJwvSbLII7gNLvMU8dVFZCfEf9sLvutZV1
         IJW7ngsafchjWLv49cApVB6VnsPYG1kJsEaC+sQAtkZnA/PvKO0IBWK+KdhegA0LdKpo
         itWMgVMY85eoj/RE5GmjEfivSTQd2RXviu4vPQlaLozPC66Ymc1O8yXyzR6adRXB/ad2
         EvA11T1SaNVXMIcZeGvh0UwzNYX6Dopr01QqQMZnfdEIikbMwkL0uG0GlK2mnvcB39/c
         kr4jewz9br1mP+IykPs2c+vPzIra4O7zkX8md+rkDwX1a7YPd4DvR66aCKl9u0lMxMt3
         yyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997026; x=1781601826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dbvit+7ci1GtusBQ8KSQzozSOrDSwLmGC8Gr2o3/pSo=;
        b=knc6LXjsWWyJohXUwQbfULAVjNAe37MTNiFQBQDbTsbaPPwjF0OxvA3VUvRSNI9Z2g
         BBTcqbzjsufQ6Q4KmL5RKW9NpTFnvN95N2vjEmjnhedxhSv92+OJ6vY0aD4SPtQJ5g86
         vZ2Ul0s2jqYmCNAfvhebf44+c3Zf7PiNxn+xVL0gzd+45WbspUUBUZ/+5q2LRVwFLC4r
         yRUA2nk2Ye5oaw4lW0I2abd8Lwl/jpaSEq0ZzBKeWvvxGuvVqZKrx3Ug0Nfl7npiQ22Q
         a18ioGYFJW9aXWWDCEcZWKEfSpz34HedL0oIeQo5bUpHoQ+PiOav2gG1atBFaqenRhfz
         nFew==
X-Forwarded-Encrypted: i=1; AFNElJ+C9TqGIaWAUVSciCHMHy/8PtgJKVF6iY0vgH7UqlBzd1j333/xu3VO+htRzqsEbgB1NAMDsjPo+SsK@vger.kernel.org
X-Gm-Message-State: AOJu0YwZlf0nraR90N0EoWay/g3VRwdF6oTzUE6bBLLKhLW6rzVkkqQw
	tYpw9nA1fPMNYkh2sN6i5YvwpQNLTZpKQLFNgDWNckKlXOqOdgJ7Y27LMkIs+Lw4HOBpIZZd2D3
	KlVvGy6s8zEiVqfz2snonLtLFGEa96Zu/eU23tXR1y8XvWd0FMsLFeDjku7vnwDi/
X-Gm-Gg: Acq92OEdcnoQMU75ZCaGybuQd2LSIouWHhZQ656V872eCZzA+xT/PhKgUU5utLCK2Q/
	E5RpCBN/ESbdnIHY1n2AGTf7e4j+UDez998i0R525/nMk6GbFj4ZyTY8wyKUU+GWsbvZ27P0BS4
	7TNRQjh0Yd8aeMWlB5LAhqHx3SD/9q1Rfbs7GF71o3UVJgeXSMoiq/84MiIezFNXiRb8tqSX0nt
	Tf4UFELSlJBHtFt2TxcKGuiz4lfIa4iwSvPbLjqtqc/ZPDxEhXxElyUlIFb4nSvMziPUWOb0Q6e
	4LgVwrBVtPRFQ1TgkkHHeLPVdDSxnLQ5U5PPiWcxEN2fnbQULCC4DgPbSP2XdbM+ShoQaMb5Lj/
	72DzkRnGqx4s8vktaUxd/qFS4kZayC/z2GcJpPPkR3EQAIiOi16jWEeRx
X-Received: by 2002:a05:622a:904:b0:50e:6311:7380 with SMTP id d75a77b69052e-51795c0d8bemr146707951cf.6.1780997026361;
        Tue, 09 Jun 2026 02:23:46 -0700 (PDT)
X-Received: by 2002:a05:622a:904:b0:50e:6311:7380 with SMTP id d75a77b69052e-51795c0d8bemr146707711cf.6.1780997025796;
        Tue, 09 Jun 2026 02:23:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c83c93sm1029181866b.16.2026.06.09.02.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:23:45 -0700 (PDT)
Message-ID: <947bd383-a4d7-413b-831e-b7077ce22ebe@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:23:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] arm64: dts: qcom: sc8280xp-arcata: Enable the
 eDP display
To: jerome.debretagne@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com>
 <20260604-surface-sp9-5g-for-next-v3-2-6aa6f6612c10@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-surface-sp9-5g-for-next-v3-2-6aa6f6612c10@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NyBTYWx0ZWRfX2sKukmo3RLLj
 9U/z/gyuJRTtkizgWSqtIugXPNaoeTdM39jhGOh8bU70UFepGP850+uaeMtOolfWoMKShvrjm3o
 tqT9Vp7RlpdRbmLyKyN1FPiGG1DgAHptGAFLQl7HAImQT7z7bLN/o0zvvwJ10wfzqPJPKND148U
 A0vZ/bOT+T2tIITLYipYGFFMuW/74slQxV15eoWldqak8u1HYF43KOuqNaQmW1Rt4YeOq6aCdqJ
 ZPbq37B5rKbaXNwXRKDtJWKjLkPaIQlC/s0hDExAqAdLiBMI2zlId8mAMyLyeq/t8mxwGzeCiVi
 pX75Q1OAYr2w1cxuHi4qJHYyg0jzGTd+fkd7FPwQclduX6Kx0uE4b49nxDPYqtTK7AN4STVkl7o
 kQEHPesNcrLF4qOGhjBZBVrOrWHA+7IpQ7Ni/Q8FVg+5uQiteV9bstk47g74B638OnAY5FuAoKi
 sK9MsgPejhnVcPrOdIA==
X-Proofpoint-ORIG-GUID: doXem8gn3FyxxIBtW1DMdmV3w_q4y8gU
X-Proofpoint-GUID: doXem8gn3FyxxIBtW1DMdmV3w_q4y8gU
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a27dba3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=0lrYLeEPhB1H7zg4qqwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090087

On 6/4/26 6:18 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Add the vreg_edp_3p3, edp_reg_en and mdss0_dp3 nodes to enable the
> Surface Pro 9 5G eDP-based LCD display (LG LP129WT232166).
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
