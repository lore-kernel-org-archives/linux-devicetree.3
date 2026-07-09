Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1B724886E
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602496; cv=none; b=SHEbunDHMFiX5VEs9+7IpJ2+J8DdZypXtoouM/WdQSGW7p98rnLaaiT52ZsTBgrSDokuAQYa8e/jeKeWNq1ne/Kg7AzkM7lhDV6qtR+Ul5Ct0Sa9c9+/3MSTUGlwNwAuJ2OOgzUX4rHAVU7m9vCi/0wekmtppNPyw383O//nnys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602496; c=relaxed/simple;
	bh=Pa/DDBU7Z5wSIOAjTxz6DemcPLHkUwB5dqkRtijLgCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LTCr8ya1vMGtvkWS8q6sMxg4lixXVp/dyC59xKcI5VzPGzAl/KfSmCMef/Un+vVh6rSitZF+U0uC/aB0GJJhQiImk04cD0TXI8XhjGfC84ATzzyAOuGOk24S61jCZzJniGDBxoRL+odPPqvzgp1cxUWz7IVE5AonDgzDG9MP4sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tr092m8a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=agS4LsqM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tr092m8a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="agS4LsqM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNDew1488700
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nXlEHdg8wsFTbuwGS9Rpx/V6DlPBUWw2oHGKOT3TA1A=; b=Tr092m8aQNFa3LhT
	nBE2BeXJkTMyr0ny9vXBEDGYLtVhi4vgrmn1qlHqx2bt91OdaUWLuHm6r3k8PdAr
	KfV5IXYHnMOuf/FtZZVWbBOR6zAhbqFMq28J3LaLdlQj2i19oeC3ubUcQKy090yf
	kQWzD1DZOZZg4E5vQZucgUohHFWmc9xkpA+i3M+4xW7KQHUf8MZDzBuPJ96vcDsA
	8SayVSWIWa6CCgHMVcW/1ckHeSFe6Vp97KKImOb/fhKIRayQ1q3S4DVgWnWxueeA
	Mq2HLr8ND6fFWCvmh+lxRpHIQefUegwC2qc2GBR+GHj65Cz3YLlDTUtmuEfv3qDo
	syA5Iw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwfuaun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:08:13 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bf8c573ca5so13259e0c.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783602492; x=1784207292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nXlEHdg8wsFTbuwGS9Rpx/V6DlPBUWw2oHGKOT3TA1A=;
        b=agS4LsqM6lyCYKqKG1o5d7cOK3+YZcbjahxJN5bWT5crVuv2EjA6kaPh9BroPe4kss
         cUvA3qs88xjPuHXdiF2I8d9DHgEiijXaNB4nuV1Sq9GQp5QNjQjA8VAoSA3bhc7qwy3b
         FCqs2OdlJHl8AvNrIg/2SvIq0dOxZLKb5+JkCznpf+fAjHShY+1v2zX/IotmeQK1vPWG
         TnkYw+ROTlF+qjTZX5hh2L5sDUI+980nQSz4xQlaERNVUoPQ6Gz3klOU35cknwmP37uf
         fc2/UgvTNTGGBija3OSm3QMq0gacai8PonRS+dh4G9m+FigwFMfnFLwAQlwOY/S2QxBW
         V6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602492; x=1784207292;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nXlEHdg8wsFTbuwGS9Rpx/V6DlPBUWw2oHGKOT3TA1A=;
        b=DpJqw4XJGTZkFXTaY8Y/NPzTaq2xDrUsjCcqCZ0uJX/w7NfYPRn1SIZuyToju3AIu4
         b9snLiDykqZR6tggZjClWmbdVyFJvQkrszxw0FlpAMm6QrD0Ar7PxdDkBA3eUeP8z3dt
         23csWmkrtrubpZ4dg0FPkDtXV6nxa0xRviXrOolkY0s/EI3UnJB30apsWBJ5GvCHGhFv
         mCcFfXbSbiUrUzEre42VcuRsg+LWFETP8DpYC5kLUhS6OGtqXYbKJVoYnT1HAuldQOlC
         93LBiys8adMBRcy30BsK5V+5n4Q5IqyzZlk/fuGn2ePR4qTFpu5AC/58zA7NwdpLdlzJ
         XMBQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro2sTYr4k4p3/Rdu3QroqRLfR9MGjbmKPa92KIzPkc8YESZZSZKQZTdsGYH9hffwH1oMSRP1sCk5EQ8@vger.kernel.org
X-Gm-Message-State: AOJu0YzIvcxtgrRHK7SUni5COGJbJZtxR+JVok3w3gssjimmpXgIHu1c
	5L6/Ub5hduu3GgNyB78BIm+NcalHV9Z8bAH+EYrP/hj3TqSVsfFLdY3fq/DNkyFmHlpLlgloq5D
	lyV53sWEp7MERZ2m7Pgz/6n7p/W0GJyEs6rJvB4ZJcetzCHU17BQa59zUSHiYBmvi
X-Gm-Gg: AfdE7cmKSMZwB+lq+i8LXU0NPc3yk5EVa8Dh53kpZtsvO+3pOCbM+V37ZCSaV7X6MSZ
	bdst8B37gYjyNmkJKDutOc+J4aw0q7B+vucE4Fkij/kghEaS4/U78c6T/V2oKJku5AdYbfYbmFO
	pV9uz1I8YlE+aaGqZ3+cLIe3OoYDTnjtrynzCaERp/pjCX/LegecpdqaPRV5P9kxa/gm76LxdS6
	KWWJpGwDRp53EJS+TtokYWGrTY33UPMkVU/Wq0WWn8OP0IMzc6KbfVKbm76C7hMzes3jTcfkXag
	gvoP67gR3IexY6ybUNpqC1449+BDPAdG7UcRc2d84b+Fk2BeZXHblJkLzvCB1NcHnAn3wEN8s77
	odkc5e+rr45sB5mrxV4ITWfFoDqhw17gSSp8=
X-Received: by 2002:a05:6102:292c:b0:6c1:6ef9:db9d with SMTP id ada2fe7eead31-744f0b2e6ecmr1020050137.3.1783602492565;
        Thu, 09 Jul 2026 06:08:12 -0700 (PDT)
X-Received: by 2002:a05:6102:292c:b0:6c1:6ef9:db9d with SMTP id ada2fe7eead31-744f0b2e6ecmr1020024137.3.1783602492182;
        Thu, 09 Jul 2026 06:08:12 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69acd1d32c6sm2007426a12.31.2026.07.09.06.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:08:11 -0700 (PDT)
Message-ID: <6f2b72ca-8560-4e69-b971-afdd9e2a7a28@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 15:08:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Enable first QUPv3 wrapper by
 default
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260709-dts-qcom-eliza-enable-qupv3-1st-v1-1-e9a6904d0dea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-dts-qcom-eliza-enable-qupv3-1st-v1-1-e9a6904d0dea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX1MO69sbM6Cg5
 VBzWpVnBK+kx9xZvPqfnlUJ5j7RQCkvqiIy3h2bdk6JwiziH/EmIsWczd3DIgI3rrYNb7pXkXOK
 Nf7PhO1UG+Et81W7Dal5RBbQ6N3H7vF956hfsPr5rxJ4WDOcF4RItcgR3HX4PEH7AizvMUckVGN
 qLrzR4z1rQIkJUemvyY/FMK8DIVV/sF4oXNRP71rww0MmBlRC/3dxXpixiYHSaGm85QynNuysup
 UkVsqg0QdyxhdG0D4WtgzLKuekAz/vzC+wYrHv7QIKGQB+wytKnaI+J72UfridMeNFnd0/Sg6UE
 ItA0ilDNs8VSMhrqOZZFzzhaxnh7bGcKbJ56YP47IO0EL6K1wFD+B86YVjcxOflJlHITOL4PPWJ
 ze9Jd4LhTKsRhFuLeHRozSKL59fMBvdAOXxfQqQQTCygqNis8Il/yq2JT9mPJ+qk0bAYuDRIXBY
 hPSkx5GUZ5dtbo/HoRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX4UeBaCgPYfA9
 qdV/GYERyPKb2ReqmClb3B7Ri6gWky8CGDdyqU+SwdHYiAw8GgAZPwDQPo3S4jmiWg9/JNVxXDh
 V9zy1cm3oH0lQo/ZeQCUefMVRJIRRms=
X-Proofpoint-ORIG-GUID: yOe635ZXYjAEHO9x8mxMCqTaB9mYJ5ap
X-Proofpoint-GUID: yOe635ZXYjAEHO9x8mxMCqTaB9mYJ5ap
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f9d3d cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VeGrD0z-dcJTj65ads4A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090128

On 7/9/26 11:12 AM, Abel Vesa wrote:
> Since each serial engine will be enabled as needed in each board dts,
> there is no point of disabling the first QUPv3 wrapper in SoC dtsi.
> 
> So enable it by default. This is also now in line with the other SoCs, and
> also with the second QUPv3 wrapper.
> 
> Fixes: 844807e1f89d ("arm64: dts: qcom: eliza: Add QUPv3, GPI DMA, SDHCI and LLCC nodes")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Go ahead and enable both QUP wrappers and both DMA controllers,
a subset of both is assigned to HLOS by default by the tz config

Konrad
