Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C649E3AB460
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785432673; cv=none; b=LZByLXk05+S8FrEoy+38priBb794NkykxoCifU8+3Md7sIB6pG03hoJDiv84m1XuQBoA3FJX0HZhFxcH8Q6EUAn8kISgQTn8+zaTSdzLYgM/hvzGmo/KQqHJvj5ekzvLy29Ppo1fb5Y7MO2KrPCHWqULvt8SBVS2BuSjBUIMLOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785432673; c=relaxed/simple;
	bh=YEhRspKmk2fUy+RPvDEPOr64bflmhy9F2cGGufot2CQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gouwccfT9kfSkgh/VmmdOXkcQ+dabOPg6S1u7QcD4CGB4ImjDyTI0U4i4+lD5nSQhWXm4/1ugHqCHNmq+L4X3mwhC8Yle2YhXVCyXDa5baBe0jHHzkv5cpYGfl62af12q7Pge8ZXFcvmlgnJ0ez/kakPQxDwuYCHVsN+KZPiQ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=baIZU6Kj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXPxZnwT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="baIZU6Kj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXPxZnwT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWo5J1379730
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SFnMA05sdfilboCMIyalFubA+m0lk4001W5XVxuLqXE=; b=baIZU6Kj6/SFq2nD
	jsMEj/AB41Uit1RWfpt9a1GtmV01UC4vMUTf85yQ6AqdI4tZsyb7pWzkmkLt+oUO
	t4yqAyDauNYscsT9WvXzDyQgv30eIHlcGXsoABA0z4fgHq2QTlIJwrj/orT7V09Y
	wMwPMpT4FEKNiuI0w/MN30QUBO6pEwDZ+iSMntqtfa8A6B7Iy6nYkC7MRSx/XvB3
	niVT7tdf0z26fsBChB9qbtO1cFHD1JlwOTJUlljs1JL/P9kzeqeMXtPzgKpg0xrN
	x6wLiLa+FG/37spqYUnThSKse2uEtIIo7l4Hm97sp8WE9dmYDSnPskj8QhMn2smt
	P99gPw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8kn0x20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:31:10 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-737ddaf8c57so2527137.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785432670; x=1786037470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SFnMA05sdfilboCMIyalFubA+m0lk4001W5XVxuLqXE=;
        b=SXPxZnwTqYDnUTf4l9bO2df2p9rQwgkktLPdixtd2OzLqTlCstFO0nP+/oJX0p64Lh
         gYS46fqNI1DeHPKBV1s9sdyyqWK90Qf4Xtb6l1eymc/ZemkPymQDAfwB3zEGwKg8LT/w
         VldFFMqsKoJDWDcUzlpeEZLvTinYYGrJG6ZxYeR4ylfCCuMHNZP3NHgfiUfYf75b/fIw
         Y5PJ3iLM6jB+xUPdLKhgGMXLgM/dl/RUL/0tLvvreI14fIZcFd6MUTnrgBe/hKI0p70l
         TzC3tfaSjUnYPZs/wRUPPeMYkKzoO/nRzdauzYBYf7pYp04PeqyOrZ0C7BmkTuh4gT+E
         nfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785432670; x=1786037470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SFnMA05sdfilboCMIyalFubA+m0lk4001W5XVxuLqXE=;
        b=WGGqwltN0JqNLdYVN2SGEWoNU3RtOb9BS/UX2dKCSimRsuyTon7hxiq77j5ErNf7Cx
         PHhjXPa1etGKsRdiEFWeNOoG32AtS7TqYLZJhM4wWGQllRXx2A6zbBN3kQ74RjuBDYYc
         IXx7TZDAiuKdHPiM8lO4x66v9dVchvgs4+QRSYuN4b2n58I7NA+Ptvmc7MdKHorGNJLS
         WLMIqr6eLdmEPHZT+4x1AvUfmYBAFHKkUMoqCliIzmWliIhynZcwuTERAKq5NemYAnc6
         /xqlUxlpO7yp/u7ZCrhWA+6XMXaFEOz8UIUVI+jF3ac5EhhGHDxXdr6TpfVbU/zCM5Ah
         B+GA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0I5qeH2NM1YknN3ZYC/5nWSYV3RaVxXfUhLYhSdl0WTtMugZGdpHZpMxQpK5K1cT2seQr/Xh+EMbo@vger.kernel.org
X-Gm-Message-State: AOJu0YyC2j/0vm3QMYCODnfPu6yl3DFq2WH93XX8mczpsacrsxgmZHwz
	GHIrp8jZbKvnRbgYWii9+qrSWuOw+5B7sh7F4ES6OBc+QeEzBc+gL+FzvufBlByL8GZKxJ/P23M
	drO+w4CA8BV57tmpczfWcs1ydP4Qxm/XSA1POQ9QT/jm3NchBYMdxB+SWX+C+HI1m
X-Gm-Gg: AR+sD11Q20weaOVQMIS7y4XdwRza78kEAhEVVgybkFZA7H2wCXU8DohpWO7PtWPMAXf
	OAccZmw/KawZGezn24m53ONT1ZxH2C9hYTmJRGuZ8X/3eLTz5YRMnqJ1H2PXvxjcMrv5uOS7MdL
	LCo7vhEoy4/CLXJabTpI54dd/CwGdgHDj9KLVcnuY/qw2UnaSJsyC+arHbXLPjutES31wwZGOKg
	9QW5A+2r5KmHL3qsD9nz1H6ny8TndFnkkPbqeaKCfQBDyRXt0OjAyeNCmGp3AwucRhVUj0KnGKg
	sg7O7FpQ1hkthsnBzMoBf9/na/fCLUZ70/QZwgXMs/jtK6zd0E87PpSlooZrA4Isq6++cSQbKfv
	GKIiYWxytOHhVwsOhqf8LzAyV
X-Received: by 2002:a05:6102:809f:b0:745:17b0:10cc with SMTP id ada2fe7eead31-75841ab4475mr697936137.4.1785432669732;
        Thu, 30 Jul 2026 10:31:09 -0700 (PDT)
X-Received: by 2002:a05:6102:809f:b0:745:17b0:10cc with SMTP id ada2fe7eead31-75841ab4475mr697891137.4.1785432669235;
        Thu, 30 Jul 2026 10:31:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07ca71d8bsm859640a12.12.2026.07.30.10.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 10:31:07 -0700 (PDT)
Message-ID: <00e088fb-aa2f-4535-bdaa-7227eee1f96e@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 19:31:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
References: <20260727-adc5_gen3_dt-v3-0-bc00223648f3@oss.qualcomm.com>
 <20260727-adc5_gen3_dt-v3-4-bc00223648f3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-adc5_gen3_dt-v3-4-bc00223648f3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEzMCBTYWx0ZWRfX0uES4Jsb2xYd
 kgnX3dqKGxGNnXT/l0U8pBBEwFX2uBeaRyHfOkbadWmVyLd0GOMLMIBPW/QdyqNkrGnCJwKUtON
 LMterjr0FSUaHV6ApteRpqIgVLtvlOA=
X-Proofpoint-GUID: VUWuauk7dygbQHPwiyrHxFgFiJUdHSO6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEzMCBTYWx0ZWRfXxTvNjySJIQH2
 dzp3gk3HV5BalHMBbd/CqphqBHEUwKt06RGxDc2q9p0F5OzUZOdChX8Vez5FcwyiFqYKCrwE1Sm
 jdzl6A2Ti7OPdTrMZLuw1AGbGYhZaSWSeN1pY8c69KdXUejogiLU7swCdmIzqMOO5uYPeRAqR6j
 989EiKbpnSxtmvfwiQGejS8F9pRaSKpoeJGYS0IVxiDvHk2NAZEJUT4igHx2p0q3pz+acpyUjqR
 PYQz0ASrviyTlQuBKCXobkUuhQd3MMbWi+GsVYAbLfxZZXv0J8u17G/ISHwoeiFnc3/yz0dOfzc
 CEBoP8JMt282a8d30hXMyyL5rWSIewaqox2nJiWkpt5Sz0SKjUWmRiVxKTNVKUUP6hkhl63utnr
 l/h7xVJTcz89UA5ds1pqXFf0LVc0bYStKEXMdoWQed/frl3rppdDN1d2R4rFS4hi4QPIGu2+Ghq
 74j/3XByqRpRU5a+QKA==
X-Authority-Analysis: v=2.4 cv=V7NNF+ni c=1 sm=1 tr=0 ts=6a6b8a5e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=szv6kLBDWGZgRSy8YQcA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: VUWuauk7dygbQHPwiyrHxFgFiJUdHSO6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300130

On 7/27/26 7:19 PM, Jishnu Prakash wrote:
> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> 
> Add ADC node and define channels for:
> - Die temperature for PMK8550, PM8550VE* and PMC8380* PMICs.
> - PM8550: Die temperature, VPH power, and system thermistors.
> 
> Add io-channels and io-channel-names properties to the
> temp_alarm nodes so that they can get temperature reading
> from the ADC die_temp channels.
> 
> Remove die_temp channel of PMC8380_6 for Purwa devices as
> Purwa does not have this PMIC.

You removed it from the Purwa IoT SoM DTSI, but there's more:

$ rg purwa.dtsi arch -l
arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
arch/arm64/boot/dts/qcom/x1p42100-crd.dts
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi
arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dts
arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts

with the deletions added there too:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
