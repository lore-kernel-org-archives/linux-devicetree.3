Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769363BB12C
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784894228; cv=none; b=X0NQktq1rqdF+6CjiYOxW68qafQBdHr9epFQAA/umP6Z6YGkc9pqC0QRULTMilihcGJnB8Iaj79KrNOU7cJrhdHphWWieGYK5fykrNkzkwkHMUrf2usvAonbGYPVr1xlv84acoIfBkcoqdXlQz7hrUf/HwPd64OhLDGQMiqZxUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784894228; c=relaxed/simple;
	bh=kZ4DyWaacZcCwlweWQLa4Y4zB6FfjBFIuFHC9igNK+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tlq5zZG0CqgU7rzyat3pmc4p/x0VBNUXVRxQ2YkPyvLXzaJFYtimg66znMRIeIkhgvTLFDhEMUq85ymSFcVDvhM9p7Wc7ai+9WLBxNOStojUsc0XUVgeSY/ynt5gnfV90WC1nUun+WI3uf/zz8KHVgn54jRCgqFQH8asXmvW4j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJucg/rA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kf33GaH+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJucg/rA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kf33GaH+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADvN73032211
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w5wFJquxy7zq65wK3cwKV75ni0i9dU8zjqPfSGQuu2Y=; b=aJucg/rAa18XWXhH
	2YyJtYvCnEY+XWqHJPwtPegNavMkic4ioIc9gz99wQ7XampUN59kwvJVF93LZzjD
	IDjYJpDtUuoj9qE3jsUKPuQJDoYDCfB8kWZdC9UcWXINcmBCwCwKiG1O0C+r/M+4
	VPiJCgIqh74E9TAa8MZk5VqEZbC70/lSKtoce2YrFxMVVKtcKzHPxCHYV/0OMipm
	ffNAIWpwWwxmwX0rkHcxNIVwBUj5Tg/4wX1CWQQfJ5y7NTWgYqzGoYxTAKCQYvVM
	pYZZbm6qqBvJB0p7M1khL3YesgdAwNy8ZWrxjtkwpe9Q/awurEIliR0wQXZnXwpQ
	3/BndQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0bm2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:57:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c27616421so900591cf.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 04:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784894226; x=1785499026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w5wFJquxy7zq65wK3cwKV75ni0i9dU8zjqPfSGQuu2Y=;
        b=kf33GaH+aPSvuyd5PKKfm1zB1Z869iZAzyBNaIOXYzv8HjajLlTrDl1huUk05GNIVC
         V0El12Sszn9bYaDhieX+9qs+7X2TBOgKinCa7e2qGcbH0ok5EQ3pXiiAIcyDJxDT5Mn1
         TA7q3wAX5l8fxCfmLJKpKb9toGtTLtUod0ykXNyUQ3KbF0noMIDKwYHQRKUoBtUwPsUL
         xbtFyfILlUkbOZJSqCkoVsk4VNJO0UT+pVG2MWu33d6b1WqMygpHvyuVDVBb0aFGzevN
         AJV66a5vFo3RLXLv6HI3WQYloQ0TtYJiFcUQ0FDYB9NdQOcrPOJ4gxDtO1LcIdUFnUzr
         TH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784894226; x=1785499026;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w5wFJquxy7zq65wK3cwKV75ni0i9dU8zjqPfSGQuu2Y=;
        b=KWt8c6iX6udcMij4cVE/VWUcWJoTybh9DIgRXAte++x5ibZft6LoYQfm14j/wNHFTd
         TZ833Fl07M7E2zVk2blbUDWElWbdfkEPLbLwLB1eSt6N7vBbV6fVsKwJQM5RiR5GYDel
         9dqQoYJ7hDUxaoRvUPWSs/JSbXZlXF4ERFeZU+QMuh3UJfQeLy7bc6YJ/U309spylGH+
         bKJrip78Xwjov022C7AZiWKxS/P6LyIkFC0FU/rzSrrStAYfZCy+z6zTVWDo4eHSIEXj
         LnlhYNrSC/x6jsobYdhQlIz9UvcYTE/oxfO7g4TG7688g+cM4glFWPVxxyqULhgJMPS7
         JJCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6mPC5vwkpZ+Sa2HNJW/7QKOgMr/oWoEJRzLqEypVyDsP3N5c9yHfoXxJlmYMbqttof3l/6rSG7z2G@vger.kernel.org
X-Gm-Message-State: AOJu0YznXI6+KvY+X+sH6Plis9oIsVrv9vzNQt69j/vppY4SF1WZJRTA
	axIiRz0IM3R0x4wMZXTtejEZZ1Oe+jdc3X6oJN0V/+ce3+32q30luNZnLHLDI98EKc/SV7w0hnB
	YPnj1JuRyDY7l2x6+TYJAELmSjKzJaoMUv+cpUkbPLSvI2yXq2mwNX/rJQe28Q68H
X-Gm-Gg: AR+sD12y5XT4TwANup0cxp6s1ew64yVHMVSC0rXdfpISH2ue8gPK4A6kugy58KtOyHM
	Lp9aZ6dwF4iPzyAe96zPkL42R1J965fez6yTsx7CmwIP6MZKRkUVddFcQ28b1U7zWyFRsR8s256
	oKV9z/QzNUPfE+KBeThSS087F6toN2ufFapYU0/n7bVBMi2lQnGRa647bXUeuPwSpD3xPAZTHzJ
	iUhJvZuxdXW1+MElLxoRyehaUgktMgZCr91zoHmZNAJQqRhfsZE1cXPx7brVowx8iLbMkb1QTTM
	KG5NarlL/mjiun1uZKr/C7khYMbd4bfYFhGd8f+R7joGaxW7REoUvtuNBeYttGhd+yepuTAQQjr
	hmzTNyLdTYweIJysW3CanvKk2
X-Received: by 2002:ac8:58c6:0:b0:50e:6311:7380 with SMTP id d75a77b69052e-52849848177mr27015131cf.6.1784894225878;
        Fri, 24 Jul 2026 04:57:05 -0700 (PDT)
X-Received: by 2002:ac8:58c6:0:b0:50e:6311:7380 with SMTP id d75a77b69052e-52849848177mr27014991cf.6.1784894225496;
        Fri, 24 Jul 2026 04:57:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32af243fsm344516366b.26.2026.07.24.04.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 04:57:04 -0700 (PDT)
Message-ID: <b9499b67-ce3b-4493-a1aa-454d97de002f@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 13:57:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: qcom-rpmh: Add support for PM8350B
To: esteuwu@proton.me, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260723-pm8350b-ldo-v1-0-42b5428a0d3f@proton.me>
 <20260723-pm8350b-ldo-v1-2-42b5428a0d3f@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-pm8350b-ldo-v1-2-42b5428a0d3f@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JJozvw1G6Wu0YXqxs5QCNAFe1TMyf8Bz
X-Proofpoint-GUID: JJozvw1G6Wu0YXqxs5QCNAFe1TMyf8Bz
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a635312 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=C7i4eJ8IrRWg0_eoz1IA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwOCBTYWx0ZWRfXwvcguUYeiTOa
 9GxbzpsDTtdiI3zn9/U36VRimOrF9kk5oNSHKNtg4sqZO4auSmoUVwhDxAM1KbOSjo+YJ6aHllw
 JDgvB8iE0DN36Z79lmDT9ETXJEsvAi1F1QwLiktNFRf1ROhXOM3GCQJzgutEplpvOetBuSZemiv
 QQD9mA5wKWved2RaBCPcByxM5buJONptcIlS7X9zMzfArVOHjEaMFQBA/b1qxjPuqOfmMDC4Dum
 pELhbHvGaWDuI1q44xjSp6dwwRISP/H4iJ8pIPCzcnhYRINMZaCdf+kTjqSB1VmYovXpFXi5Vd3
 FwaCK8Cb45Mp7y9knLDI4MKEnPHyqnudKLHdyId7RLOmyWb8b5ucYJttrcP8WOmc/Y5o21yUkzf
 QXC/4VoSmlvQKeaXykFiU7d6rngna/BmGqgyYgh6iem1h75nav9USnWRQLesZhZJGbOgtmzqgU7
 38WCCjefGBdHXRnR6Lg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwOCBTYWx0ZWRfX2THin+WaENHo
 3V0uc9oQN1/ZR3uyNh9/KW8zHF2pY8lBdq6QP8NwpM+rCLihk9olWv/pQ3nGFEe/PexA5ZI6/bi
 eun9iDk2og6TRY8ZDlOjBN1R+RLUfCw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240108

On 7/23/26 4:53 PM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> The PM8350B has only one LDO, which gets its power from a dedicated input.
> Add support for it.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
