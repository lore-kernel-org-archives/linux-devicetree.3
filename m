Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794972666;
	b=ChxWaIiZVVqWk0/zO8z/vL5oneaQE+jzrppm/BdMHb+mzJGpC8wOzFDDzZtTguT9zFEa
	 s6+aDr7MHrbzRMQR7rigIQKwtr5wUnzdj0xsWZ7oZ8rpou21dpBDdAVVd98vEKZ0aombr
	 vccZx1JnVoMv01y4BINKtxYHJKSxLPVh6tDAjSW7Gw11ldTE4yxOZQgxiw4aFz/ERPrCq
	 ZVQ3rEZUwX1P56e2W6AI2ixjZXv7nbiMwfHrWzGfBbinaKDnD8y0dcHleSHX9zpTBORzb
	 cOhQr6JcRfxFszCuwnxHUr7vwz7q53aB6BaY8dJ1imAmhsYFGphgU07brrBu6Q1tzmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DLrT5Mh7fC5h8PM28yHTHw+H7Tw5FCOseBcBKNYwgUk=;
	b=Nb7zFYEz2qYA3cN5B3FNdBxGc/vkTQ0YCV6WEJzD3C0g8YIyROmihYqYL48oV2zO+etK
	 isBqluFVkdj45wqUFasokLKUEeYDI+lb13HAEtnG73570spiVj1qNWgmlAuby+Zq0qNaj
	 J72Bo3stQ6+rfO/ZTmVkuvBQlQv91IKqOgLsxxaKjM3OQ/VveLAjxU5qiAFSR8+K7BmFl
	 OnSy+I64DmE0H4GJhNsResm1wJ22TkxtFO1Bv8GvRUIJCIZ4z4rMX2Kob79hd94KiPBCk
	 nqpWG3UHM9vj+3hbGSKFkmCCGUVpUKx0B1yGl/dIZ7q+y1dW11PywAY4U0qsXilE6lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvsUyW2m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpV9QlD8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7627A606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7627A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvsUyW2m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpV9QlD8
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V6ox2106465
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DLrT5Mh7fC5h8PM28yHTHw+H7Tw5FCOseBcBKNYwgUk=; b=VvsUyW2mxCoem6Qz
	k52PYDF93mU2kFdVyPVt1c46WNx3vkyQPzJXLm6a+sOGs0D/nCe5RghCLYt4FoOP
	+iq29gOgHgSa7zsVGaLbmUEUCOLJfwL63S51QuTpO078sL+0L27+EliRUVhGXG51
	7zJHalL2eUH9FTib/3fEFpZmrM+LHG2cTOjxd5I/iKXIvtX73gy8rfRSougUgbc9
	BgoW8+coGFHqvj6HIw/lPh4eTL+ihAAPd7ervl3trCRFRd/n1H/qb2lhjqX3uRX9
	MjOVbCgoUY/vKZEdvjkyXlGFluNj84eYJ0uJYa5gNeE/NxUcfRQr2umUHfjfi9PS
	s79t7Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8rxry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:31:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2efda2c6605so3202395ad.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794972663; x=1795577463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DLrT5Mh7fC5h8PM28yHTHw+H7Tw5FCOseBcBKNYwgUk=;
        b=KpV9QlD8kNJTkzacr6vCHk7+67iQ0xgsW0dXYWJwpL51reCUcI68/MZVhItl3s3EQo
         CrOSud/Dnxxt2gGgalQUStFZu8YK/5vpNBJ22ohAnJoTyi6X8/mvAzthrmgHqLm/3urm
         TZyhjxoe3dn5piQsUtSESDCezaNmlgvfUdEeowUlmaLSY15FKl4ia4vkt2wh+1gP4O3X
         E+yrVx3w1XMi3yxEkz9Lr1w6f7KI5UZFyYmT00PZDQG6beZqoR2kJzgUVkbxvNAyoZ3y
         r7kCqJ4n6ENkoXE7Lxe1k1isoCRGWO+G0kFkp1PVr7VyYuak22fUzUEo7M7MS0gfDNXj
         A6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794972663; x=1795577463;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLrT5Mh7fC5h8PM28yHTHw+H7Tw5FCOseBcBKNYwgUk=;
        b=bBIs76XBqVIhgYp3dz4USk88cKg/Yqpq9c+u1gjijD69xBKJObTA6ZjXCcDX3vbQB+
         S1FRmSzT2oicLTcnUB7owAJU81a0zGWeR3ebYmZ0aIRFFWHEjziHQgPHIkafuL24nlII
         /JBibXgGGFLbG8tRS3hPSo79YDD0/bMu3XkJPBloAiZ3e2LPT58M0DqFHsLUvWFn3vPb
         bp+1WDN0ZYL7iUlt/hMa+riUgKpc1iZk1uJ841rdX9Bl1tmM3nNwLjgMxicZNm4D2QVZ
         0lPq4SZtfCL3f19YS+Ay3/Qe9sBgCvG8XnKkHomE6qCzJgf52ZqxSwTwVTiP+xGnzXA3
         jv6A==
X-Forwarded-Encrypted: i=1; AL+hErE8cIccuwwqMhCMwNz0YGvRvTrxxrbQyvFXX8gGUeXs64LGqpXvi6heHrvLqRkvAPvSbBCl8xn66rfN@vger.kernel.org
X-Gm-Message-State: APuU4Z9UaNlpD4vscwEIjSTlXUHVNqjAtNXN9ojeJbl06kWUzbAxLsFw
	RhWPyoqOG8a3TcEsJsE5GoP+D9Mo5Rex3jtEXfQW31aWGAwOEsPWnK9GyWK0w4fPgZ3Qwogq8LI
	bqe4Zhg9x2pZ3yQFuJuLrBZvQ5/9RG7g/ICZfyvjMkXrBBqjPiYBI0jPCUj2T72sg
X-Gm-Gg: AZFdTZffWMoWGQGPmxu8Lu5G8FheYo4VmskM1u5p9Lf3/PpqJcDcF2g5e8JUVMajFr3
	XrO44+0r0kVIoBiILZqSPBHIMkIaJ4ldImV+gjL1NJQvWK2aD4OtQWwIl9DsIBlIi126UH6UiQT
	RI3iUsssABb8KFejDFNuNWDacwg8VK6yHl52bSaNaElMAZfV5vOvx/nrK9vR20qTJOXDLUKIAoQ
	lvu4NzaTRwz7PZHvY1RCQ1RCbpUfVNvpC52jaEevtmAaTspJ8AZl0b4nDVs39QJvCqh319S82Us
	NdguuGesSzS4hwJ9/5SGPxvD+kKSLZQbpG0jGRDueTSLPRPNZlUKwwUd9/a7sS+Lx30Btfz4ctk
	r3jmX0zzIHzSTIxpkyOJukAs270Rg4pwYZtJSRTqbi4m8B+kFLNuwdF7jjLZ5SULhdvTr+Ta/Ci
	Oa2fKW8Ek=
X-Received: by 2002:a17:903:1aab:b0:2ed:42d5:e682 with SMTP id d9443c01a7336-2eff751f06amr11721465ad.41.1794972663153;
        Tue, 17 Nov 2026 19:31:03 -0800 (PST)
X-Received: by 2002:a17:903:1aab:b0:2ed:42d5:e682 with SMTP id d9443c01a7336-2eff751f06amr11721145ad.41.1794972662720;
        Tue, 17 Nov 2026 19:31:02 -0800 (PST)
Received: from [10.218.42.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61162d0sm5287935ad.20.2026.11.17.19.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 19:31:02 -0800 (PST)
Message-ID: <1844d833-caa5-4a35-a601-2da1700c0d9e@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 09:00:56 +0530
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
Subject: Re: [PATCH v2 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 qcs8300 16 GT/s PHY
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261019-monaco_ep-v2-0-852cb9f5d012@oss.qualcomm.com>
 <20261019-monaco_ep-v2-1-852cb9f5d012@oss.qualcomm.com>
 <avWZJr2eIE9KrV77@parshuram>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <avWZJr2eIE9KrV77@parshuram>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: P09UA9q2XzU-bv3_WGRP5-yJRGLTBWZU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfX4ZYTvZ+5CDVD
 fHZOg0Mr0EXPrEqoPKISPQipQSkgYwkCwG2ukN4rZnkbNEkn/joHT7bgIFpE/H+tAIyq6RlRtic
 DqAougDQjtIX/NYCSOcvguRmaSpT6HE=
X-Proofpoint-GUID: P09UA9q2XzU-bv3_WGRP5-yJRGLTBWZU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfX6fkuJevylcyK
 iBg6dkP4HblA10MuLXDMf0FStxfOzyznVPPSwKKab/D2x9Hr1mLkHawdmim08IOGCIP3y8yfWQn
 TYpfqrNhX7UJp9s0eZRfsCCrHpUu5SEG3ceKtE4SSpBAr06x3f5Gy8VGQBPklqWQkVMxb8TUZnI
 +xQDHoQ0L0n8VLUsIx7Wxc71UFP8qy5aML1/jboH/z0S9FfvP9VQhroUQpoHSWKFGmnL8hooGqk
 93LFGV75aBa+wHcYXIOLfEZZ48uB0Yfd6gw0Tftc6nDomE4hOaIROPf1zh3Yus0Ut1qOAC1BjI9
 r6z7fmF9GianpwFY8JItkHf04efItMyG8hJRh/PgngpfVB3PZVz09jdScm/Kmj38Lv4FDtS5KIl
 hwDcSFUqM+Y1VGNCCSFFJZsOg3CUUh7qLVP0s2+0hNy5fMJfGdMGT663Myzhoaophm6KfRECZdq
 re940S6Jxy3bVc+rucA==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd1bf8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UoCkNwF0umAWgb14yFsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180013



On 11/12/2026 4:17 PM, Vinod Koul wrote:
> On 19-10-26, 14:55, Krishna Chaitanya Chundru wrote:
>> The QCS8300 16 GT/s x4 QMP PCIe PHY was previously described using only
>> the qcom,sa8775p-qmp-gen4x4-pcie-phy compatible, since no QCS8300-specific
>> compatible existed for this PHY. This was a mistake, as it left the PHY
>> undocumented as QCS8300 hardware and indistinguishable from SA8775P in
>> the binding.
>>
>> Correct this by documenting a dedicated
>> "qcom,qcs8300-qmp-gen4x4-pcie-phy" compatible, with
>> "qcom,sa8775p-qmp-gen4x4-pcie-phy" listed as its fallback compatible.
> This fails to apply for me on phy/next. Please rebase
Sent V3 after rebasing it[1].

[1] [PATCH v3 0/6] PCI: qcom-ep: Add PCIe Endpoint support for Monaco -
Krishna Chaitanya Chundru
<https://lore.kernel.org/all/20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com/>

- Krishna Chaitanya.
>

