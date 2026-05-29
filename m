Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC26367B9A
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 17:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780074887; cv=none; b=sTsuLwI8BxpyLHUm8kBZxyJ9af7b4nDl7Ic7yeuP3sMzykTvcFsrYk2qC1o3HhjgS6ZeS7nKT39kQs5C5l7oSaAqmBWxZWMQxGXUXQphUGUeKg1g1dIBz7bKzB2tO1P2/OFlyHguR3x73GDluEM5u1G7dbdbrlnafyTQZeJJnZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780074887; c=relaxed/simple;
	bh=LUSbYKf76os8+Vz1iMCld3ZOXFGhpgSvvxaDbU0zMnY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=a8O4LJKjnGbRxmSIFHXUu9yiaTvkRk9ZPVet0fgDNKHLeDGQ/F0RmXTmU+ZTtA6nsuLsm9v7TTRILmtqT2iaVfBouibQhSMigd0mjjBsRxQvk0G/1KAeot8qIWt9plWImMoQG9BBDrOS+ONzcZg5OHAprtTbFas08375W/lzr2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AxVbb1jm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIwytRNy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AxVbb1jm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIwytRNy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TH8aV73271496
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 17:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lJmWWWcIH+ma7IFx18m2vogfRXpnULCsTEE4DquBRew=; b=AxVbb1jmWn6aHqAD
	3m3DsXClFjd7myjwZOnFRTWa4dNFI+MtDEYGk3juTtH/ltD88vc4NnXJWWjpJF6o
	k37lYBJ+Uqh6frAhHx994cLmGJe7MZb0S8j8FM4Fho1eLwEIE7LAtDSoCDk6V5Sn
	/3JoIRcRouFWvm+Adc+2QgEU3TTUVt45Htxs1deRlYLVsmWJDSlB+yBE1d8EMTis
	hsRw2ENtbsQ/aEOcsThOIBlCz3YTIsd60NKhmQLW/LrtqeRsqxxyDHI6DZyiuuFh
	bnFDOA/pZl0u9j+1POMi9IFPkSUJtXFIb2ALMoTSXIR7XePNV9S0FLNs5JGQ9cmf
	XJnjtw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevug50rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 17:14:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf0b7425bbso35122545ad.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780074886; x=1780679686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lJmWWWcIH+ma7IFx18m2vogfRXpnULCsTEE4DquBRew=;
        b=CIwytRNy7sV51zrWWBgPLj4q3LLPFlbG5wXMh2v36jW5qcm3MMskSegCzZyRMH/xm+
         X99JcQ+VCx5EFaspsoLAMTw5IpM+anh5sXK6WB7GnHNQMj2y1KFGSdO49PRnRojPqhHx
         58hXkaDkzR1RfKqFqzZbw1FewmNldlkE2J3f7qnomzDsGiP4y82b7K6KBE3DVrf2eZRF
         lbX8T6yiPk3HbKZ0Z+5jF1MVFuBUdITXwdYh+PYXwdK3OIqLFZwAw4NAfHsOjAZYEBJK
         CR8NkfAR3PHAolI3XNC3Ih3R5E9YilyQ5EZp8HoRusF0V1ldTurjNB5eyaq49Slhwjaq
         ct3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780074886; x=1780679686;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lJmWWWcIH+ma7IFx18m2vogfRXpnULCsTEE4DquBRew=;
        b=efX57FhOu8cpJxr/GQzMUv6t0VnrW4DirXfD1nh+LH/1wu3yO81qPfzHzceCSellZF
         v+JccIUTN2ekHLCkFVWk1yTI2cfGCzjylgrnrhYOPLVZ1lP6Yr9v4lzJtuUrLaH65EOb
         Q73oaAT4+PrwND4ZGmmRhwueLx68mE8UUBD92u+b1uGmj3mRipgHyGS1jmryikbq/2Ku
         K1+bBL1yghx6GgfyoGOMECtJ0zOzz2EVu1xkdqkOoKK9269dGYXqD+eeJOctJSKiuRPe
         dHmcFPPUoUme6uJn/n1t51eENJ7/QzYKmWths1Lzxkk3530kcVkReQEJid5mj/iXbs7g
         Qfrg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZzWH8vf38+luvtfII25sN5rcT6Ll/zHwutYuHokTswf+qc4NRCtSwSs0ZAIb/EoFmjAbXAtmxJ60b@vger.kernel.org
X-Gm-Message-State: AOJu0YxMn1toyRZ4Ntid2kUQn0pL+nIGgV7s/NbuOiC/1xX3oQvr0ZLk
	vCBbUDGShHnqnzlxnaRUVF16oKndt2vR3af/Kkbj/9+T9UNF98UVJ3MRt4OIIHwLKlB/0v0y0wq
	4OTKPfolEreiNEzryFdgsZt9/gc0e4zdcKPpUetOhNDy8sqZQ5O972N6SAqpzigg4
X-Gm-Gg: Acq92OEvXdFJhZU4VqcG0It1cIjHcOtBAgH8egiFFW8ccGe3tMR4jlgSN+KnO0uwYpA
	AzlD/Cn1xXtU1TxWoX1hxHQSn8vvCokfqezuQF9HNlwc0kG+OSHB9xJieGrQ39mhZUvKt+QZryj
	qgRFyXg4lVeO2AYSUHxKRf6bNJnE4TMwsK+NSdCtZULNBe9sRzaVt0n62DI+zQ1QYGdmCJazCvU
	LBMMorjBDqTzOzefLrAxxY+0vu0d2vQYPFzh6rwQIhMf8+WPM77qjAvIvMdvoE/PWjO+tHk7zK1
	LQxlVK7ohn6gBp5D+fDytkw1Oa6uxxyTEXYk27VFIBmWlr00u2ubLHFaj7x6TbOMFUPuXlXSGYX
	7Ng1FVmlNq+EjCPGY/TOFBciCJO9tKgHCb6e5Ys1d4r125ajwhgBy6ODR7iTH+xM=
X-Received: by 2002:a17:903:2450:b0:2bc:a577:70c2 with SMTP id d9443c01a7336-2bf368383aamr8593405ad.31.1780074885591;
        Fri, 29 May 2026 10:14:45 -0700 (PDT)
X-Received: by 2002:a17:903:2450:b0:2bc:a577:70c2 with SMTP id d9443c01a7336-2bf368383aamr8592825ad.31.1780074885113;
        Fri, 29 May 2026 10:14:45 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.224.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a00a53sm35627145ad.27.2026.05.29.10.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 10:14:44 -0700 (PDT)
Message-ID: <051b9597-873c-44ca-b7a5-29efa795406f@oss.qualcomm.com>
Date: Fri, 29 May 2026 22:44:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 8/8] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay
To: bod@kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-8-645d2c8c75a7@qti.qualcomm.com>
 <178000744162.4557.14613962845288279527.b4-reply@b4>
Content-Language: en-US
In-Reply-To: <178000744162.4557.14613962845288279527.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE3MSBTYWx0ZWRfXyPjsc+OkC12a
 4+fPx7MBV1C1xHYR0rIVHsSWflUe+0J+cWU6sDD4gGGVOSuZk3X+d8LuMaivFhWc7G7sS7KAmzy
 1DOKfSjPvRDrbxGru8uMiHn1jnWd7jjlMCQiGydq/vGtuYyA4v5ZlgG84FB3cwWIG22lkqEUFtb
 zt85scZujMwjsYBfw+dDLXfDPfqWIxBzfc1KtNgG2LlUaJEUvGYvcgA7Y6KKXS3CyuRihaIXIXs
 vj2vQADhdj7Tjgz15zwfUijfhbZlTLYFyepxNxOb7IuLvXyhG0Q23OL/KfaAtirhmkcaHy1wMWL
 Gq+pVgTaJGNKtNkPjyQnGiHy/CcjGSJSGl5OvjQmyO8H5SvRVPFkMLPGPC2FhXA5F75sDKjecDK
 lWa/AFFWnsqDcVgsBAQLgVabIPfGMH3jCCNi+1JRlHFzwvxsjdQ/V/N/uHBiujV9tcqmrWXHWeX
 VwJZn95d8IbN52wBlIw==
X-Authority-Analysis: v=2.4 cv=SNBykuvH c=1 sm=1 tr=0 ts=6a19c986 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=tDSAgCU/rryVExTQDfsVjg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=nnX9c2Y5NtHo51HYM2EA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: eZMOy8_onSY6J4JR9k3oYb6_UmznrNDl
X-Proofpoint-GUID: eZMOy8_onSY6J4JR9k3oYb6_UmznrNDl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290171



On 29-05-2026 04:00, bod@kernel.org wrote:
>> +		dovdd-supply = <&pm8150_l15>;
> I don't have your schematic BUT where are the rest of the regulators.
> 
> If they are absent or powered by the daughter board, a comment in the patch
> would be warranted.
> 
> Same comment for previous patch.

/*
 * avdd and dvdd are supplied by on-board regulators on the IMX577
 * module from the connector's 3.3 V rail; they are not SoC-controlled.
 * dovdd is the only supply sourced from the SoC PMIC.
 */

Sure, I'll add this comment in v2.
