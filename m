Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1FC334C20
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 21:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775339664; cv=none; b=EpOl2h4kfspU7pQoEd4YNahvtkbqdPaZflD8bz1rFFhQFbLPow4PN2yoOk485bd0EBjPyxISOQuU5NzG7pNKxZTES6f/bmN0AHU2NVc29rRSIhE33TQt8VB4HkbnshXi/mkCGAGzwN0FgCkrHdkmEnohwSFe6KtrVcvQtvrmzJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775339664; c=relaxed/simple;
	bh=evln0NhJ1xHd3el+5uDUZSIcpVZ8Dljv3ROO79Qe2ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGv8YggY8oUxkIBLbgpJTlMwrnPfXpV+bRgA9clzaaz2ii3kCNN0aKIifoT1EBDWaoI5iCqP1My8RrhjpwMoVHJz3naTWQqhEVxPEBt1gItkjq8VrJVdJUid8ildDtv974TQioe7SM6PfQR386yR6RkDsjSPVtHz6MtFkwof2mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dcxmEIep; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kadWVUfG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcxmEIep";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kadWVUfG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342s1Fq2202155
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 21:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0rOEvfNc4qdWIsYSVMwrzsHIkn3QsyFtvIWOlb+BY3U=; b=dcxmEIepDGYl22Gf
	9NVDtJPCtzn5YYLFa8113tnFm/1gDSjqC8dvUwE9u7oxwzW/db/JSXv2QvZGtAYA
	NXrZ9qtAyAPLmtUwvYV/QxhWOeTZ/d+acPzfAKDubroFHrLtRnQPqbY7VrXnJ0sh
	lF5ZMgrtpXe7oiSrK9ERE6CfEJlivf0qZVRoEYnaEajXsynXC/hJcDxJI3dlGqjz
	qp526FHXKMGUONupp/IJINPWVn1Ce0ZAlc5YCU7vuysPAdR2LlJqPqQzraXz0bD/
	TkNUVIlBjSmIWUAcCvd9TfD4y/F+XNWqQjpsnFjuInojE2zcf15xCofILvxCXXht
	nw1aQA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dat7u9kku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 21:54:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d831e8083so7845811cf.3
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 14:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775339660; x=1775944460; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0rOEvfNc4qdWIsYSVMwrzsHIkn3QsyFtvIWOlb+BY3U=;
        b=kadWVUfGeY2q1y8pxzrvFLXbMi5yc4WAjjVfPhpaHv7I9JSuw6u0Wv3oeeiCNQ84m7
         f0+5YUI3IH9HCXv9cJH2u2ODYw8eP2tbCcrHRYjdgPQv22h+pSoB80yb0LLYegEB8HPC
         6wCRjJK89+x6cxcDJxuCkX4teSvdFiZXpfbG8xgcFUDykxmTKdrx0rve+tR05rH11Rkz
         YUcRZ17T0JzWei8k8OHev2vfa4Ucx43rveWR/Miz7IbSD0aJvfCo0yCKOFbXwAWdp8x+
         G4euTWn5XXaHNa8VQEL7RVdZTApbo32I1JyyEnO3JhSmo/qgU0jApxcAhd85+gYPlwzV
         vVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775339660; x=1775944460;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0rOEvfNc4qdWIsYSVMwrzsHIkn3QsyFtvIWOlb+BY3U=;
        b=DmG1wH37C+NTJh0LT9xmpDxGPg3Oc20NzXm+Mts6vWUd8ji9jQoZCIw9GLtBu1Figb
         47MQAP2Ps9zlvDvVOEqeygcbwULO2K2+Vm8nMmniN2CzkEhUfC8CC781DaYnRAKyeBX+
         Ig7GW4nLuPRxjfjhOh64Rae5RRi14ppiFQVlTE3HGigaBgdR3JBLC5QnX6a120FPYMw9
         MdTZaV8CHcuTuCoYt2jkSyxHXuEbINkQpVAZhqQhhsqTwaSoqlHbIkf/qeHTMErWJX2g
         4MydRJdz37oqYxmaJriJt6xya5r5KEt2rmBem7XvnIoV6ion2vUt1qU1B2gBcexL2s/A
         s9XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK2lM2oOvRUQtDprm6o+d58XfMG638ZHU4b7kdrP+ISXqweCv5G86uz710Zp5h/DlrQfxZDnvQfEX8@vger.kernel.org
X-Gm-Message-State: AOJu0YwjIvZTLWychhDkfviL9ZxRj2n/keMsJuG/BkNfQNHD0+uYwx/+
	aMonTzQeLN5QSF9GHOkZ4DDxkl9yQkZItcTPzQ5BKTe8GMuuRpx7q9djZN59sxa7BbNwjjptZqG
	xL5Sc2knUaomoNKhFTDgKgrmRGjlh7dNBhEqGHlVwRzBIM37IlgQP6JNy5l3A9ccM
X-Gm-Gg: AeBDietfOXbbR95cfV5pUEUY1CcBPKG8g0DgNSqLnGGfZnuI8a245woi3cOyzIxdfa9
	Jek0uDvnWwjkn9+izsKwRW4OlZhaPmecquZX6lbbvRq4m1njdx68S+4ZHJbxjXn0FriN4ajGC4I
	A7tYuszAQxQ5ELv7yGp3hZqnxJ3mCK0yi9hJDMb/j9DbSYYTP4qXXPHt4IV1NtSquGAIEt8kB9p
	/Upw30NSyEJnNqeHAlUaxHmOLRHNd6Z3s4JG7vqsJwjr7VS3hk2ll4BGAcVTL95e0iUhqra0+bn
	gMLcw5Ha0RL75At7r1WulrZ0HRCQL07tC43/2V3rW/I7/2gE4yYkP3FDldByv1wOc3yV/MLnuVJ
	tLDo0geHCCOFoUuMl/2wLq8rGNt1len/5rgGc5u7Z5+Fdi1FcJ9ciYl+PRotfJ8YXlj87ASv41m
	SnsJrNzkFk1PDOikTLVw3aXVct5LPTez9unEg=
X-Received: by 2002:a05:622a:59ce:b0:50d:3eac:8466 with SMTP id d75a77b69052e-50d62bcc4d1mr104529071cf.30.1775339659964;
        Sat, 04 Apr 2026 14:54:19 -0700 (PDT)
X-Received: by 2002:a05:622a:59ce:b0:50d:3eac:8466 with SMTP id d75a77b69052e-50d62bcc4d1mr104528911cf.30.1775339659560;
        Sat, 04 Apr 2026 14:54:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217ba60sm20398151fa.38.2026.04.04.14.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:54:18 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:54:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus
 controller
Message-ID: <56nhno4hnpw4vhuv66nctcwslfn3abxoqe2wrwr2ui4jkfqmf7@3rwdat2re2r3>
References: <20260403-can-spi-kodiak-dtsi-v1-1-4055e67dd3fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260403-can-spi-kodiak-dtsi-v1-1-4055e67dd3fc@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwOSBTYWx0ZWRfXxs3QZva7Rc1C
 moRM8CJIPCwrGtnNUXgDdUXEA5U6fRYvWxCT8dIQbLvgS9WHB4FUMn9TdZUbwwQgmdS0EWxSzxS
 2RuVa23cbOgvsbPdjdh76Je3tIf4FQqdcXKyUGGgcE6zPw8O+n+iDphPefd9B9M2kuxC5kJ6n29
 Y0AIawZPgKLyHHyu4b4piKsravwu1EuudYuyTv8I0w+kMpVnWP5SEL1pSQiVzpwJrwLIEbaDrHk
 1V2KEl5/YKYV8fkCvLV1wG1hbVr2PwqZA7VfN5HsZXp/F0a9TcfPXH07HKe9wtyJFiDsIpE8JKA
 Lo6vzfv394LllaR8Bk0jKYnyAnZ4Kz3Sy7Kz63KM8pKxKEegaAowfWlPEBY1PjhbTM5nbUlNn2D
 MpPARsninskzFzce3DeXnYDIxvbSw43cOlvGuXhW8ZtmKxe/feNjXfeg899N1JGXEuV3C69m9wa
 flyXBLLcCGiLYVFXzlw==
X-Proofpoint-GUID: MQa7nIeTpChyVmYMwRWPiPQUo-lS6A7u
X-Authority-Analysis: v=2.4 cv=RJ2+3oi+ c=1 sm=1 tr=0 ts=69d1888c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=FBG4kKiRHSUkxbZCjDMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: MQa7nIeTpChyVmYMwRWPiPQUo-lS6A7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040209

On Fri, Apr 03, 2026 at 12:10:34PM +0530, Viken Dadhaniya wrote:
> Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
> The controller is connected via SPI3 and uses a 40 MHz oscillator.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
