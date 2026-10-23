Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742792;
	b=0LKnwWHlVvReP2yjglj8dr66nrqNuCs06q7PiXxWOR1LZeD+1C2NMH7j8AFftSmiNTcI
	 Ih7me0yidCzK5wRQwe8ykjuahm41k+xvXGykLruKKHjT0g0xuyIZR8ATq8YbMJ9P2MSVx
	 hAdY1W90yX7nGIe+TaLGy8doP8HpwCZeScO1cdTEe251ajjBbJlKzultUNpR2F2aM/j2h
	 zHPp2vAJnlpRMT3iwkrcvdJad2nyovk5am6E4TtM3XYincqe/Mn8HDoptVZjMNE5E3UdH
	 frlDtcs+kcFv2Mq6QndN76ndNDBIfA1ABtmQbz6ST2dNoyzVfWivD5+ZAUm/RMBf7Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742792;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WkRK8y3p+giH1Dz66bRMZzeRiuELQ+JWzWO1dmY60cA=;
	b=npKEeoFzPhAiR1z0afbLuioBdm+Iu1z6waHkuynJQVAv1+KQyghgusRLWHnFcgkQK4Yn
	 OvcC3S5dHCkaYwcHUxLTVagn+WGk5FjHfjTSKgfQFPXOzDZwy0jQJ2qKUz5PnAtz2qvqi
	 C06PFYnACjILHhKP8gfvmaesNnpVn51m+dkbm1x+FN98mw0mrcvvFsg2+MGZLz/CaQdll
	 Nch3luEc20azFsAEGUq9GqjnFocnukCT/9uVPF5tAflRdXyagrjtEcP9NeQxVKrMMR7d1
	 8x8+VCKi2BvUIRbuCBBB96/ino4ihmLVpzwO1EQ6Cohw53ULqnoBd9lIQ9XZmUNqwwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U4UQBO7O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwleiE3Z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BF0606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43BF0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U4UQBO7O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwleiE3Z
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FN9T1048304
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WkRK8y3p+giH1Dz66bRMZzeRiuELQ+JWzWO1dmY60cA=; b=U4UQBO7OvfeVT+v0
	++oqPsbyXmrsA7tzlP+uwizroGuKX8cWnNIN1LH0ZJpnDSJ8y88P9EfEQH0Fzxpm
	feBGBzmS4CiQBc1uQCcypry671AEWQ1hKDf+72l3GmdvwMcUC3+CrUV20tfRjkUh
	gWd8QlybeNXQWyHBckO1C7+0hLRQ1djNec1SosahkPj1T4zG0hIlMXvOa3ZEgIGH
	nxlFr8Z0mf/WMpYgyVjRNygIpgBioctlRvXTnY7FpkpnLtV1PcbEkDpfKriXj/N+
	SWa9xsmn9H7fxFsEt0vawjeSWyj7W4D5jbCaCbukP5ddVBOx4rBx4ki7LSBdZFx9
	Pm2hWQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbjpah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:06:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179ef12a03so3154866d6.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 01:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792742789; x=1793347589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WkRK8y3p+giH1Dz66bRMZzeRiuELQ+JWzWO1dmY60cA=;
        b=BwleiE3Z/ViWpr0qh9l43TJ0Ewbos1tKvEK9vgSbuHqwNrhJ7pWxLM4YLIvKE+xPOz
         kfjJK5kWEWeX3n5sAM7mivRTnhzLFvOSwZvJdHbutzk/WlN1uT+FaTN9kL6ID85iWvp3
         NgPfY/Cv76bMzVTG37G+a4/Is9h/xN2Y55p1vXVeIYzsjo5wE6TeFVdxhtiQCPE4xcM5
         yCQYFMVc4RImqjEowDQ5bWbLDRGynv7t/iMM0xoW4FcyxkfD1lL/+W4GITomh3djl5+3
         VaheoIC7IF+AtvSuXvAhGpHxhx+HPD0AD40VVsjau30MWP6uebCsFNaMeM8Hb33w3cVB
         TdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742789; x=1793347589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WkRK8y3p+giH1Dz66bRMZzeRiuELQ+JWzWO1dmY60cA=;
        b=14pj2pCutNsXI/W3eC1JumyoSO7qfm9fTsigAiGrms0M5eWPkdbEPQZruG8eCe7jUW
         4z9JwICevuXgpgN2LY7craX0LJc4fzs1HYDUsqv1C8lLyeaDEUXVOumg9RWHwazyW6bL
         68uoiwjNLG9+vo9kFTkVa6I7ae9PIp7ATIBwRtHVEZpqgRop6wzXpIAQ9+GgPc9cH/xU
         ggtXJXZzsWPbOqeRVcuYbZdEFj2YDwvtl0eRIxqg+Ywx0SKTe25lXyzFAhJuA00MR5+B
         eRWBWEcrTrSmEe3v7OBQ958yjpiDhhC7WwAlf/l30Zkx7F33pCvhkd9bEhED7Xx2KEl+
         c4KA==
X-Forwarded-Encrypted: i=1; AKwUvBzPmEyYwZfRN1KmTvrXfTG1kEHOpyE1SBgLKqpKAJJJ9TGztCTQYAALG/nbdRbB0sTHNJP755v87/iQ@vger.kernel.org
X-Gm-Message-State: AFq9FYK//+0FOebjzNkYrATNzYQFBHItp20tPk13SXt6xCfmFzIy7NjM
	+tsMM10DkiDFJOFbmn5IfppFmYebLRACmTXg+PkDBJkiAWO2HBlRUCrmT9fC0jauGB/YyBCG/5b
	zNfZgmVHMPwUuzzsQrR5SNSKh5PBRriQ9mp2GnAxC0Jt6R+jUC5UC1xJP+KRBUGesFnF3AcvJ
X-Gm-Gg: AYBFou37Dph+iyrNlDMn0wzVQycU6T8E4/4wgP6AtAzOIPd0eBef72OJH1O/2yXtDP0
	s+gZQ+UP3uiQ9u5dVP6cdo41k21sWha9TpaWyBuMQPuJrDX4DXNr/YAMqtccwAztbJSqUzKjwlH
	ELbzTworRxywEYiQ+CUjDq47mefaQVwjeDhSe27gN7TCIZnMaVlqC0oX12Tw8ATwMAyYxA7H/eG
	0FYZFxUWCjTekRpH6IGa0v6aTdDqUdRHqutb1KFhr0N18VpKpuht9u54vw3qGqtIcw/GgRpZ8w8
	pLkIL+6WSj/Ww8LhxoRWR/mb8OQICp0rCCctMjYY/U5JaEb4I5oyanOBzlhjuIU0QLNxare6zXZ
	q0aTLeI1a91Y/QL3we+YZKw==
X-Received: by 2002:a05:620a:7313:10b0:939:8148:1e3d with SMTP id af79cd13be357-93f6f7f3e78mr296824685a.2.1792742789596;
        Fri, 23 Oct 2026 01:06:29 -0700 (PDT)
X-Received: by 2002:a05:620a:7313:10b0:939:8148:1e3d with SMTP id af79cd13be357-93f6f7f3e78mr296819785a.2.1792742788961;
        Fri, 23 Oct 2026 01:06:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c4d54dsm73770766b.24.2026.10.23.01.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:06:27 -0700 (PDT)
Message-ID: <f3c13144-660d-49f6-9933-9d9cead006ee@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:06:25 +0200
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
Subject: Re: [PATCH v2 2/2] iommu/arm-smmu-qcom: Skip PRR setup on SM7250 GPU
 SMMU
To: patches@brar.si, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261023-smmu-sm7250-v2-0-8bb881ce19f5@brar.si>
 <20261023-smmu-sm7250-v2-2-8bb881ce19f5@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023-smmu-sm7250-v2-2-8bb881ce19f5@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX5xMuDAQ5s0im
 TIZ6T1+ZtB3nFpb7oMgKoKMZVl/yWvvguYz9VdtSBszxBMoWpLS3fUXlh8ekwJ9Lba9VRQCfkgB
 MNXTRz9Hyd8GVuJJXizmM4UsXjeyUuY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX5VRj0EmRFm1o
 yCyn1CqGOhHL/E6jJpqcwS/pi+Jx6Sqv+q97YITtH1HAzvIrW9U3iKmHGB8voNPsgc8Ej1YcCC+
 6vajsF8NHbly3doV1XbKZwkC/aLdT3ZEHW1xZJcMFMsWRRcGNcxzNTQrD7Wx8dHAPNAYtnBjDGv
 KVejs4KrW0Uq0fiLKYM/M0D55Wc4Hjs/82Y2Y01vrLeT8NECT+CBPUu0QxA+QHosVfkhjFd0QO6
 bOyKezxMhJomrZxjEdQ9FrBAoZKuxKTM1ykRo1SjPkREhmmW6yVFuYxzcQgreapjnerQdASobW8
 h1Y0RwJv6c57bWwne2aG/fV/fSIAJxAcfhPVTxoz0g2zi0trwHiN1dK0X9LH+/v0wcSVq7l7lPJ
 4CoVrKfR0Bho0bsuxGlkFFXSBIi4qFGNyj4oACQvywadh6xGlukxMxUzl61fDJfv1QLwWvdT7sf
 Xb386xYdp/znsw5tO5g==
X-Proofpoint-ORIG-GUID: Df3gMPs2zYe0KcN6hIZ40K3bXRfxZUyw
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb1586 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=U7Z_fe4AFx8LFHQn5dUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: Df3gMPs2zYe0KcN6hIZ40K3bXRfxZUyw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032

On 10/23/26 9:54 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> As on SM8250, the firmware on SM7250 resets the device when the Adreno
> SMMU PRR registers are written. This happened as soon as the first
> per-process GPU pagetable was created. Do not install the PRR
> callbacks for the SM7250 GPU SMMU either.
> 
> Tested on a OnePlus Nord (SM7250) with Vulkan.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
