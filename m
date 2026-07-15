Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336FC30AAD8
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122385; cv=none; b=feWb9c/ZRNGJKvAuooCeNbCIsEoaD4qGyxz8nBWKkGrWWjzHM3zvY3s4e0gKFVDHJDWPlBDZBo1P8ZSwmdgwwLKfyLQYCq15cmC9ktZcQZY3F1Dt7HOtKEovvdf+W1y6h+fqOhumvuEyV0kzkFlBlqgUjL1RU2+/ikeEQ9IAUww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122385; c=relaxed/simple;
	bh=q+7zjm3QauD0cdoSi39Jo9reVzr6JqwU0EcSEWe1mzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZtBEbPP2Bzfw32RJvFHvfTpC3bKU/bL7cPd7upv0AI3HDZl1iXa2p1zxQn7f7ZVKYMT08ZiD/dV2IvLyjRW/JPNGmb7Rik2bdt19PlkRR0t0feJ4BApAti4UAgZ+AYAgIPs2wXf7oo3h8VIoDJPaBmOdBNVS7OEmvQvhO8yG4UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfHtkWwz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c5TqUL4M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfHtkWwz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c5TqUL4M"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcijC3707668
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iw/u9ZrMIQ3ULEddbptuQOr63BuhliJaBiAN0b5L9Q8=; b=TfHtkWwz16hDDkjr
	LpIcICOfPQWP9LtEDyqw+rZmBSc1jT4mXDXPX1+Ag1SfM38oHsn8g+4S1bWCZlt4
	ZHLXtvsRmGBgq24yWDLi8UVz4XNZZcO9y2tjpLErpba93buYWjDICBjwrgBBko1b
	YbK+Hu4ose38nsP02DZVkiyppGC6oK8Gm+NCAuWjiHKCRdAfq+Ik3LVjxjafMvIh
	cxwhwzZwFzL/v3QEqIYyZ1X3o01807rWjjd+lG5Eultn0IJbDqA8KUtdVOLjvrwq
	+shqf0Cc0E6F9RhblwC+9P2qtdAsO8ogL4P1ZwqC2zNWTOmob4pzdvwn4cKKp38I
	JvWZKA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7nmgw4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:33:02 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bf87ca30b3so367293e0c.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784122382; x=1784727182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iw/u9ZrMIQ3ULEddbptuQOr63BuhliJaBiAN0b5L9Q8=;
        b=c5TqUL4MzQFAi3mqESIXPMTlQeM8QK92CAlJ1M8+YVmK7QBZ9Yh3Hb3DFUvrkY5Z1r
         hAXUMaI28BPaX3VWRY0Blao6ffR2aduFps7icJ5Ly0JngeGV2CmT7OiypWstaLCMX8hq
         RJbk87G29TFLOdFE2x1YbZ9TLEphp5ELartGcdjH8JVZObZjL9NJfPb11jaDWvpLcntR
         2qxuDwteaxHAxajpTu65P65owUnEuoKm+T0uh312sYtXtDyDNn4HViMF6X8kapATAmjl
         NSf92Oz2g49sGtiEkI3NGQ8AStojz5UkKlnUcHijKej/VcuSyU0G9R5uBEHdqhXPaXa2
         ctHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122382; x=1784727182;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iw/u9ZrMIQ3ULEddbptuQOr63BuhliJaBiAN0b5L9Q8=;
        b=gKuNMFEAnDuCJeGtrCHq6JRXXSRqAfO096FXK0p9qD1V/KODF7b9rqMR2roTb4u3a/
         QpcQuUA6Bxz+Kao38OmDuRJVsfNYtcQ62Lumz5IPJToV1C7sIOBLnyhDutCzOGkgFcd7
         1e+J8X0ph8twiKabs5HC+5u2I0917t+VotFO+kpJZIZyxmPideDyj58MDecMoSHe+c6d
         LlmXbiRuRU2trGgRhMMNTpR4dulGecGZosCjbVz4d1cBy3FTR011NZQIENO0BkhGNiAv
         SPIBdwghOKeTVV8asezls9dTRZi/fP5Rcx1TIS30fYWBn9lesaxfZWBS9Qi9VPn71KG+
         RFdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rou6AJBY4m07EifMgzA/hh8HeJiOKE3mOap2Cnt8Eme43qGnlOAHdbS/rZLaJHZ4cIzB1dH/W21uoXd@vger.kernel.org
X-Gm-Message-State: AOJu0YwBCj2vFAgfDGuayTFOVY/jgLFErpt//EnNG28+FmGRbz45wIF7
	LxvuQQLL3SfrckuC4DzGG4qkPWlp8hWeW8VzkWQFGzOgWyBdfq835PJgwb5KhZvqMCjb46zCIiT
	weEUQoGcXjIq8in8g69c1b02/NU1xzZbwcuRoHmknnuIBZ9DsUMY3+H00wMC5bblg
X-Gm-Gg: AfdE7cng18D/VxzHjM8WkDQnFWCrVLTDSGe9lJqrnOMrgwZgnOoZgkldy5ihAYarGxj
	8vslt/0d5DCVmByVCrc0hVRmOU+G6QvK5ih1vcykMSXF6hWut+yzUZ1tiXR+oVK2DYnBjoYcGsm
	zXWi661t5wrenOsa1kJhARhd0aRb0arMLcwDYarD08PYRR17UlJFODtj4p9heoD/FVavQEklwLd
	TYIVWlG//o8MqJbkhFJo1gRM373U6T9oslz5PxXeWMTJM0I/adFl5q5sOM4VE6yxLzQlZZvIptx
	7FFFw4HTLyiALQqwOkUY1UfPu8wOVESIDNrcHQQmcJ+KM70EurpiLHYqqOob94/BJX9QB9DSPB6
	6AE5kOvNIuO7NUZJwd4sVsNZ71fRWeZqxFLM=
X-Received: by 2002:a05:6102:4499:b0:740:2974:57bc with SMTP id ada2fe7eead31-74533b1e81amr4012870137.2.1784122382234;
        Wed, 15 Jul 2026 06:33:02 -0700 (PDT)
X-Received: by 2002:a05:6102:4499:b0:740:2974:57bc with SMTP id ada2fe7eead31-74533b1e81amr4012773137.2.1784122378668;
        Wed, 15 Jul 2026 06:32:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168731831esm26739166b.31.2026.07.15.06.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 06:32:57 -0700 (PDT)
Message-ID: <f8be6eb8-00b2-4f34-ba7d-f66f1982cab9@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 15:32:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: glymur: Add CX power domain to
 GCC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <20260715-glymur-fix-gcc-cx-scaling-v3-3-72eb5adad156@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-fix-gcc-cx-scaling-v3-3-72eb5adad156@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNSBTYWx0ZWRfX+93FaUGJ9ivE
 jDKLC7M6qyUiLgef1tcynXtmSxp6Dh8b3fSBR8NS5NSzs/UarUp+xY7vSO6IVtYEZNO868rSM8F
 /w+O52J3opUpOlllvO+IOSgpwX9T/ek=
X-Authority-Analysis: v=2.4 cv=cuGrVV4i c=1 sm=1 tr=0 ts=6a578c0e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: 62wGwsagtRUDGMkK3nLHc7DZE5fhUv8q
X-Proofpoint-GUID: 62wGwsagtRUDGMkK3nLHc7DZE5fhUv8q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNSBTYWx0ZWRfX43IdYUQ8wtJb
 ZZqG+HmstirfCCbVOoQpn40onjboMPGtcQ4BHHUzsX4Fs92+XgBho7gxoymZkEcNdxvGsavqNbP
 GylLquMmG+ToNUUPmhAyJSyOLUQrNXtB5DTB3a+7n+mT4fzs6ctKReKdFnsiY1y1qSP0whd0BYQ
 ADlhXLsR8O5dVk8TF9IyhMnJ3AAg0C2o2pQ1PCZ99KeXOnHNdp+JEnaFOcXGOp49Vv7cf9ZIlOC
 Xlm2P9jG0vPaEEqB/2sWWxARcgtQf+6nq18PnQQA+mCpTdJvNJINa/cuB1xkxGvw7Gh5k3/mhbG
 omuwopWC4x7XzUQDep85irMrW1eLnm+9eG9zSUYgQaJA+xXgsQqKkXQJ/uCpxlUjuyisBVbpI4/
 yvMz/3P1xqW1bAiTKsmnXvdaMJRn5caGrtZr0lI9TW5T28mvQ3bcFJv6ONqQKikopFcvWuNM1xx
 l2NwaAgmkaMiRK0A9Cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150135

On 7/15/26 3:29 PM, Abel Vesa wrote:
> The GCC GDSCs on Glymur are backed by the RPMh CX power domain. Without
> describing that parent domain, consumers of GCC-provided GDSCs can enable
> their local domain without causing the required CX vote to be held.
> 
> Add the CX power-domain reference to the GCC node so votes from GCC GDSC
> consumers can propagate to RPMh CX.
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
