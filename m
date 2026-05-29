Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B193EBF0C
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066359; cv=none; b=n/7pr3tsN6X3S/SSBnkmrqBB+SBTsQq7FhFhQYiUsyyQtJ9i3hsbFoJ9mxQ4KX6L+YLiTn/lKIFhG5CXzZb5b/OU6KydJv+n9daH0DOzszH/no+WYxlMQ+1w2jLAWwUjtuasf82TDbuKXXXz6xx0DaJocCsRx4RgPIbHycHzzKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066359; c=relaxed/simple;
	bh=MGHfaR8jlzUkkXidIGH4kSnaaY60wAaRTetyKjPVzYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nT/dSzqVh9+Zr040Ox0vhDfxcwqqGbUwH8UW1wrLZhBYG2X6vVjgs+o1D5/cyr4+heBTsxbe+srw8ejkVkfjMhfqJwQhIMnN2g2j/j4e1A4FNtwlycqQ24I7cfkU1zlGOrNUhIm3HsWquxXJdcAaaCd3gMXwqe4VvI4lqyZ8HGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WsnegsD/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YEl7spis; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WsnegsD/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YEl7spis"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDLfQK2748085
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7fDi3qZvLhAdC7/0jy+gsVwkzd9Lct8DJ2M+A7e3DX0=; b=WsnegsD/WRgT7zBp
	KZBLOe3RIyTM21H3gknjzlTo+0dXRAyfiCQQTVtGDsznzUIm6YH5vqc4ByboIQmp
	eMmW18qt9ncuqZ+mPB9WBd0MLqIkVfvWtaQRM8RJciofK8pHhC/ecd6O4NXuEarE
	YCJiL823SF8/MsQIuuzHJGpaERcYn6mDnlZWfQ00wNkyT7IF30sqJemQv2r4j4JA
	WuWWtvHZNOuEh8j5uCSTHmDMMrvF6UxOdtJbYHwPO/eXakd3YZUsU3U4n67m4K8k
	9RCjb6XhNP7JA9zBEKKNBGJ9qQMh+JJGbQVNtkhpnIstTuLfKltjCEsovzMocvtg
	d5yOTA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevug44x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:52:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365fd467cf6so11606467a91.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780066356; x=1780671156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7fDi3qZvLhAdC7/0jy+gsVwkzd9Lct8DJ2M+A7e3DX0=;
        b=YEl7spisPYwesOS0EoGrlgkN8Pgw2LVSTQCayP0rAGZL3YGqMLlhVZV/epqQMPvoJG
         1yF+S44ww570idno5bpcwDQrComiP/4YO+fjo8ip2nIRmvXPU33aMnft24+BXymPC8Dy
         4F8czcCk2CmEWfU5Ku8WeryM4CE4wAg2xZw7ebXJARRLC+J4QHhNO78POFDChGaOtx9B
         HpFkqqg9B2NtBdhe6a3i988Q79aENewlX7EagjcmR2OuVRStM/D0LaIIgCUl7rbTeHPU
         RnP4Zl2Na4w6w31p4pAKhmtbsmJW1N4KxCq8RwxuUfTnEr8no5iziJ8T6NUB1h580x3a
         bNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066356; x=1780671156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fDi3qZvLhAdC7/0jy+gsVwkzd9Lct8DJ2M+A7e3DX0=;
        b=VVIZJ9vHN7lFnOO74p4DoIxwmdnAO5DTCbhHJzCd/oO0VZsxyUFBjsiGVm8cGhlfTL
         pVqh5sSwd4hZYCr64m9dKitHHAfM3TEVSzpWHRloYBe69YCtR3sDiPes/GTiaaQz8JMt
         ekKINq/4AkCTqGwiZ19e1qtzXRa8KGhP6q15pv+kxvdGIrSHQLsP7ITjlgZCPZtdyF9L
         8XBrnb1h1opV1I11E+fZzlOnzPhnvVXkOFmfVqCF2K3ltAlTmVyh5H/5CPyD6+YPY0uv
         v12zIdalNviWe7jyH2qo+SvHyOIKlgVd3fRZ262qJqbSnXWNfXU7Q4UkZNm8t/SkrXLA
         ROLA==
X-Forwarded-Encrypted: i=1; AFNElJ8O/1vDQGq4jG34x2LsKpDziFSDzNO8E3f9VJvhDZafIrMSVB+e6YUSEV23SEZAAEMHccmEzOcJml8b@vger.kernel.org
X-Gm-Message-State: AOJu0YzeEor3E603t+efHtpP4QPo1pfYqRUrN+o9/F/mcNaX2f3igt0E
	8a2qYrf5xGvOhnhKsR1/Bbr/UFwZ2ZHt3T5fJzYTTLnojg+lHZy9+KBa0WqkmADwjRFrC+tVrqc
	5nwp1I2xJ7EmawWzHFuVjlXW4mc7/wlitkSzZ1QZWjZD+ISr7f9mYwuNDOOO6rpO+
X-Gm-Gg: Acq92OEI2I+2FGyqnsUZ04cPAcX8P6eafrnjSZ26gclfGnpBlR+mmJhHGTQ3TGNQfAp
	Q3Ps9rDWdR+mhqV/FPxWzJSupiopW3FQbsdDvzdhxj0c9X9yiEr7UjsB4Jxbi3QavW/LZhnEfGa
	TfUptv/7A8gsdogt5wG5xMKPF0HLz5HXhs4x48TJJl/Ul58jnx44y+0MqhQJFuoAxKpFuQDYFC5
	Mh36xNdJunJOXAn7h8l0OxdajiJI2WwerP9f4EWsf6/SpFIZGE6OLhnMEERemRvRj18Chm21AXK
	0xPx4+9CKusNF8sy5vli5hzvALpyGkfZ7qQgyN1v53EIatiRnZK1Z2UklBpLNJmCL7qUlzEqifH
	hEdrnUfbwT+mtHpSS0h76d4qdcdl+NxqYtA7zQbZWR/0peCRKjOUR/HxS20PtxhI=
X-Received: by 2002:a17:90a:d40d:b0:35f:b572:ece9 with SMTP id 98e67ed59e1d1-36bbcad48acmr3569161a91.5.1780066355724;
        Fri, 29 May 2026 07:52:35 -0700 (PDT)
X-Received: by 2002:a17:90a:d40d:b0:35f:b572:ece9 with SMTP id 98e67ed59e1d1-36bbcad48acmr3569081a91.5.1780066354875;
        Fri, 29 May 2026 07:52:34 -0700 (PDT)
Received: from [10.204.67.150] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc9bff159sm845633a91.0.2026.05.29.07.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 07:52:34 -0700 (PDT)
Message-ID: <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
Date: Fri, 29 May 2026 20:22:25 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: bod@kernel.org, Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
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
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <178000689150.4557.11759359941436928903.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0OSBTYWx0ZWRfX5KDJv8a7MO6w
 y1AJX71+UOqnODsEOxk+AAtXX2bx/Ou23eiLiLJpQ/8gSJmQ/EMeqBt3/mOv1iEwvoBs3BOaC4A
 JygYkIgLcCPCP1HSRSbiZGvu8sdI5GWV0BOKCXq9WArvmWHsQBclf9xq+FXmUG9RZge3XwnKADk
 3fPvd3BelLwXefqVNxnalL+kVHwri/aecO+weejzfrkQDfkPKwm8w/ME9e61hSKvK6A1rkhpEkD
 slwgWFLe+2SSrEPAKbLdHg0Wr6/B36TU4RxJUqcrTqdcq6Ir2UaTpuZ6jZsy2DxETUmuO5NsYcE
 6e9YyDXjSffcvHse/nZ5AIPxkSPOaS/+8oURf8HIKXkk8qHLTGYJBEg8Fvi7qXeRMatm5fJpOn5
 aHd+cdGq4w9rg7E6if3ziQysh7hJpPrkd88QmS5x8MXpZmbF62xB9+7TskAIOVMr0sUrulds7kN
 7evJZZ+EHp6U1U7M1cA==
X-Authority-Analysis: v=2.4 cv=SNBykuvH c=1 sm=1 tr=0 ts=6a19a834 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i0fgkIc6DCDsPB5MfecA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 47LS1IEdvgIDYtC9dDol163vaAGQluVG
X-Proofpoint-GUID: 47LS1IEdvgIDYtC9dDol163vaAGQluVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290149


On 5/29/2026 3:51 AM, bod@kernel.org wrote:
>> +			iommus = <&apps_smmu 0x400 0x0>;
> So I'm suspicious of this IOMMU.
>
> We should list the full range of IFE SIDs here not a subset. Since we are
> register compatible with Agatti that implies to me we should also be IOMMU
> compatible.

Shikra and Agatti are not iommu compatible in terms of Stream ID. Only VFE SID is same
for both. Agatti is documenting iommu for VFE, CDM and OPE. OPE is not yet enabled for
Shikra and in my opinion it should be added as a separate yaml similar to Agatti.
"https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9-bb1055274603@oss.qualcomm.com/"

Regarding cdm iommu we have excluded it as we do not use it to program registers as of now.

Loic/Bryan, Please share your thoughts on this?

> Please list in your next submission commit log the IOMMU SIDs - comment in
> the DTS is fine too.

Sure.

> Ideally list the IOMMus for Agatti/2290 and then explain why the singleton
> you have enumerated here is the only required one.
>
> Right now my suspicion radar is high that either the Agatti binding is
> wrong or the Shikra binding is.
>
> Possibly both.

Regards,

Vikram

