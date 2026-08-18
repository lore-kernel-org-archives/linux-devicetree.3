Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C4B471CEE
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056789; cv=none; b=slF+59wcbyBARypS71v01mseuMX3aV9F/oeDncH1xHPCEVjmYCDl9zaEtQ8pnb2B78WADb5Z47qoH9RTe0Fo7mtXvM6rRdebwNHLwQEOnJvNdLm6/Q0qIrxhZMTCE/vpTsScsDl3TjExW4dS1WbQyOGms+S4ou3Ly+aRFeour6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056789; c=relaxed/simple;
	bh=gTPEsPP9hoDdy7fCm2AIUCjf4BTdWuef1OndcSvQcK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ThWPzg9CZ2LD2wnfm5dOXvNRLaSY3EvetXAsHsms8yS3SWbUfVK2aUf+uMFhFcX84frA3TUnzTiEYRkB9gbYYlOZLE8b17M4tzVxVkHAfyvxSpiVABUZXK5FLgEYY5wpY28nBUuje0qyz6fKgVP1GEnTsff//6jMI37mqzvFDp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pKBb45U2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZLrGk428; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pKBb45U2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZLrGk428"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABXLp581260
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Q34BQFriJoqeny7dSzYRpbECgzeFeOr1DQ9vplIGuI=; b=pKBb45U2+vnbALE9
	T9REZMDBdt+HZXDwcf9E7+VxNpU742Dw18fHiDUUwG/3JchFbQ3htS/1AikzeoW5
	dIe/7TPcQUOP0GoZXw2ChP73kt/2ELTfCvLGgf/NBRoNd3kejD1Wyix/hi0j10IW
	P98CwsFJ6EgJYUfT4ouAohgAmQWVCeKXeVwXVx1nXUNGgAStVis0dzBgfdpiKcLe
	LS6nfgtcjqD6PDo1j/H8ZcIVvYtCJZlQvoguDX1HgPmAwtNSuCYI8NUCnIFbuqGV
	CmW0ZcNWGDwQ4zR0WJGBw4Ee2oi2g0oW0/WoAmwn3nBPMMxhm2cf1m/X56PIxFcI
	YhuYYQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fbaa6ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:39:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93495488976so120759585a.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 05:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787056784; x=1787661584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Q34BQFriJoqeny7dSzYRpbECgzeFeOr1DQ9vplIGuI=;
        b=ZLrGk428ZdVh+SObaEqIL3X3mFj4v/87Cj1yOkJgf5FrOJRqcWBr+LC5FjquUxKVBP
         4XHQy/ZXEDCay3n3H+/2d4LG/CBKl0y9yTDrbPogLMHe4YkMmPw2wtKGTgMj1IiF5TEn
         orkvVSQv0Nwwy7zN/UEYVHYcxzFPoV3Oog2ABGCa87gFDIkml50oSslwnk/xAIF2a/wk
         5aFu5kN1PWMtNvFJ7KA9gUBh6qRkg99H8J0mN94m7dhbRYTxtrjr1kyOELZqXhoOKaJl
         rXjrkS7rmlvg+cg1noaWxfRkTleRZQtDhrPTd8+Z4KPQN7gtU2RbB+PoM6Dob/VPwBPj
         f0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056784; x=1787661584;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Q34BQFriJoqeny7dSzYRpbECgzeFeOr1DQ9vplIGuI=;
        b=intKAdB/2SNF0lZ5Q0AZhvGnGJSjeySyX+2rtAQmB2o40SblJwnscja2oxKxlGyTow
         fn0br+GKbzNBaf490V89To6i+BFVoeBwHlzpPp8vOemYVWPCx8zGguqNxP3+cNmcjs/P
         KBhTadSiR2+lYI9ZOGIl3QezLqrjxakem5YojR+8222RDGwmSdiEK/kRHXyFhOpvxd1k
         GFE+tl7FyDPSXM3DeZ5QP1NRGicFkzutXaMaOwnmDnM0uxm953P43kMLOSHaWKsUzUPK
         83OlKQeRn7xphs0NE31s+PAMt8+wfR4WTnX6Uxth9m+T7fIctV/zxt1XKZmlNxPh8t29
         GKIw==
X-Forwarded-Encrypted: i=1; AHgh+RqM4aY5Kc5SA+4qh/R12h5HOmO30cqpf+uZC4otH9fDbDNNEg0zCdme2fWnRgo7T+nLuaI5k90kJsTh@vger.kernel.org
X-Gm-Message-State: AOJu0YxL6omN36hhJRAwgmHYpcEf6R+qK+OUhVW/u82xXf7lc9J/QmW1
	Ekm0mndE4Mfa+TV8q2Rb5pW2Y21QOjxp4RBn0L+ia7zIKAikRiH3Q1wPBFu60xxrH3BgFT7qMna
	eFtRc4Bukq3WwZwETYoXSuvMakqnAsHfSVz2vZH1xDPS+3DoDbBIjtQUNonFHB2Ne
X-Gm-Gg: AR+sD11f/gfG65HTW6jzGnvf1HXaRjAVe/T41o+N3ooS2bm5NIOy60GEp6TaITPtA7/
	nLrFqV1ZR0veaRXgS5P9Z/ByBIoUuCIaOv9RpsGxaoMrs3hJDBe7qL2S6YgQ8QGvfLgzhb2MGXk
	vzjvnNE6MEgAGiRWu3dTIx5aeDWEc5ZkwpO7iHcJJmS7orc1o9HFBAyAuq/gjK48ZcwF4ffsDLr
	5mzk7GAIvntHslZj3xy7AeJP5rlucl5E6OywQlnp7PDyb2YX86OstMuUlIzTxSx1Wyn3YomySli
	EHZQHlrWZi4RijAP+S7v1TwlHB/JoaN65JFUHMEI2Vefm+CWDxwTcsiHcYZmIseQhHcf8I7YTd6
	r/Il91XRfgxPJi8/LRNLACvzs
X-Received: by 2002:a05:620a:1a04:b0:92e:6485:f640 with SMTP id af79cd13be357-936d261aab1mr2353627385a.4.1787056783619;
        Tue, 18 Aug 2026 05:39:43 -0700 (PDT)
X-Received: by 2002:a05:620a:1a04:b0:92e:6485:f640 with SMTP id af79cd13be357-936d261aab1mr2353623485a.4.1787056783103;
        Tue, 18 Aug 2026 05:39:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2187c83829sm123750166b.41.2026.08.18.05.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:39:42 -0700 (PDT)
Message-ID: <950bb08f-201e-45d5-9695-5c55e1e61c16@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:39:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: qcs6490-rubikpi3: Add 3.3 V
 output supply
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260812-rubikpi-next-20260615-v3-0-06e21232d8e4@thundersoft.com>
 <20260812-rubikpi-next-20260615-v3-1-06e21232d8e4@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-rubikpi-next-20260615-v3-1-06e21232d8e4@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfXyVHWQxgZzVXK
 /v2ArbrUfO/CG7c0FMQOXyHmxlTyrmjhyMPlbtpps4ob61aIj4RdyjP3yvn+19CicfDO3D3ewR2
 qvfGun+CmQTgeg88zPt5JBGkqBKILSg=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a845290 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=Wdb1h0LgAAAA:8 a=EUspDBNiAAAA:8 a=XGAgDj9QmdH_QUsWaD0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-ORIG-GUID: dlFO3st4dzWHSHJTfKNLSp6jP8nzjhK-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfX+E5xSm3lbgm+
 r4NVCpZRvfHJzkquYYDyXOrJrUjUZwfYd7E4lyOwXYqJsvykxKFbjJ4iO9mQAZmMDOYGo8ypTHU
 2C9PUUYHKhVpFr62j//D6EPItqljGUoXXgqwuyowAj8tTlIEQE1AiKqIsbv4GjyJa12dGSHWMJh
 2yKa9a2t2m+dyASv62oS4SUmH4Ndo+0GCGtiYOIyMsVo1lWkH3RzpFgFWaIQppvkZZnVYm912H/
 chzbCm7lD4jmt7aXlRtWphag2Z0/cPH/Vg2nK5t92QIIX52mQsBVd87iJrOwZ7Le3lNAtYsX4+c
 zI9ECwnVwWSA2rShtBqW7R7d36I0x0jpqcWMumywwi6kevX4r3WXFTiCNWuX2k/mpEQpwAeFAmD
 5LF1LZkT5oGcGqocH5Fxua+eKsKvmCyDx2wDt9+JmncasDdjHJ7KOts6111ErqUjj1s6qiQTpEe
 rtxzmrxQ+9RI/f11Z5A==
X-Proofpoint-GUID: dlFO3st4dzWHSHJTfKNLSp6jP8nzjhK-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180093

On 8/12/26 4:22 AM, Hongyang Zhao wrote:
> Describe the GPIO-controlled VCC3V3_OUTPUT rail. This board-level rail
> supplies the two camera connectors and the 40-pin expansion header.
> 
> Keep the rail enabled because expansion-header consumers are not
> represented in the Device Tree.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
