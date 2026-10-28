Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198294;
	b=5IjdjvZGqJyXk6Hnikl12E31SswL+fcZ5K1ZPQyFcRQE3cTKqCOAUVnhSR4kn+Vr51+1
	 OFk270dsS+92aMtU0/QoZ9uVzOsHYiQopxQpt62MWAtY02JMi3sh1KaynOB1kx2EJq0BT
	 HEDs5RsjKVcXIWkNU/7bRw02A/4uA8xXSgeNEq1vktz4abjN2AK2MBOOb2el2vHBoOob8
	 n8atuRMuchADnzv+Fxh2FZNk7WTEtJ99vnvD+srkS2pDeapqKyBnnR/eyLDnD3U1Xjb1S
	 APnaqpfo63qrgEty4hrjCzajWK2rPofOAT5kgyqkQqqKnTy/Tr6pNeBeC3ECLwlLlhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198294;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+BJpmnQqZ884dUFJrdWVavAYxVKIGdQfDby5GCSqo8M=;
	b=CNvOo4g8mlN3gX3hEGgSlc+B8IihyVett5hQwxI/xsWUMbIunhU6/qYZXSx9PyhK07q2
	 N+Muh34mWB/531nYG96Rf2gyfHkF5y9xwuKGtWM+uWesQ+WtCZ06p7ScuF0fNQ+EYACEj
	 W0AXh/oqD+LosdDIyLPFiChh8Dcf/Rjd6yl19mlr5R6tXzXJApfcmwEda7zdbWxCxKgnL
	 DMsVyLVnyBtsi5B9GtJ5CIsNwcH9eIBip6q7F5aG44NT9Pnjq+FPU0/xEaHKNOIzXj+L6
	 rbKhI9wjMrIQM5M3u/Ze38zfitEay1BE3rdU1SQ1EnCxJXGZfcbviHWeLQutpVysqoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JxMcRL79;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JvHgIrna;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED34606A31F
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ED34606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JxMcRL79;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JvHgIrna
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDIG5i3916331
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+BJpmnQqZ884dUFJrdWVavAYxVKIGdQfDby5GCSqo8M=; b=JxMcRL79w8Fs+cCO
	CSpN/e6Mkk0iwRwudoSDfaeVSpU3cgyFXVHMGYeltSsk1VSSmIAKEzRz0unFRScL
	H6By4VjNuYCbLZJzbbIt2wyE+IXf06OO1Iwo+ouPgu710e+0jFgLvEqMlWko3a30
	SX31nxLl8M/ayV69LUGRd+daS8vM44VAn0LuufQsW41c0mznqSUMjeLGCFC92VLa
	HCg2uVrrIyM4vCYnqI0hc2dAOpMZqtlN/I02IZcl167abb9ApFN+Y3ipQGL3qlL2
	1+n7Yh1Qr5bP882WiUnVEgvfWoGTYc/SWCs1z+HEGEjS/Nwe8YekGQAPcOGsbdHe
	OE/nlQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtngbc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:38:13 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc450e6e1aso41538137.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198292; x=1793803092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+BJpmnQqZ884dUFJrdWVavAYxVKIGdQfDby5GCSqo8M=;
        b=JvHgIrnaXYv8eL4Wyzc6hc4HKp34m7pU0Qwh11UArAXelRV6dqrRFVWwkoUQg2yTPY
         WWi1j/1iebRa7ngeOZEXDOTNgM7lBuIfqTJoGFwSYr0g5D48uJfCyuuel2rkrgDvbsnl
         0+vZMqPfXJmUWFiP4UAthBqQsPDz28IZ9CvYA8dVR1IMXcOV7tY4fUvzTAnvn5tgVC41
         ZkxIq16NqUx2xF9UU/qtQdW8dUAYlH7pwVpywE5TLPAKJO+bbbPEX0LyWdF0taeFGSDq
         FS8SX24V1790mjTg++CSVyK67O1HHsCFH253ddaiCq6aB42v49t38RmVxaiLLrUMiL6/
         4rVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198292; x=1793803092;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+BJpmnQqZ884dUFJrdWVavAYxVKIGdQfDby5GCSqo8M=;
        b=HjXhq8OiBVYuAw/6Fb4eowaDWRiibbhHRHut48s5kjSuEvno0FyVNrJbLnIz9tRdi5
         hpv5bwLkvfXZoO6Wqe5ts4YbkHiuswQfaQNwdpUTse5vzZsuLasghIqPY+JZyonyYtvj
         7SgKmR5vCTRbPsMY7WeUSeakYRbGBIEV87QbKqp71/orj267ENnKgmYPi6k0wbXSLDqN
         zAVFHgq0rIG2Cba6voJ7R7BhbGjp6oIAQ8DXBrLSLMy+7bPbCuQVzPqzdyGDiRV0nn/J
         ovh+wI9ohdVE0zJiKWB+1iDw+RyEvJSAGgABNl3kjbPdTxLRhx0PAGPibSY+zMKkOKSs
         SRyA==
X-Forwarded-Encrypted: i=1; AKwUvByOmLsibX9BKWsrgE6YQdQRt2TM2auvvhzpupJRM49Dw4lwQQrz6F0qcEIm4GynZqRqws5i7R8kK822@vger.kernel.org
X-Gm-Message-State: AFq9FYI3mW8rFGhiISvqPIxe3Up7zO3sGBtiBRBST9yan97+CjvaIohr
	tI5BoBPXqBo7ZcF+tSM4wvzZf6fYaZ9CLgs8c98smYfevWYb9gB+2gx877qgBwoMLhd/bGnpozz
	SNH2lV0lF/fWxV0MfUz0HzLGcxGqfT0R8yEltjFn3iGh3HWLNyryawKQgmhfYLN4E
X-Gm-Gg: AYBFou2GisKvNVx5evJz3H2Fmq0coGxn7e4x92oKXietfEG8NqEqb3a4WdNSuAOVNTN
	XC4j7WYWUgywgGorZSHOCkyQ6VmOJdavlWoAaA0t8oPdOUnmFD1Omhy+ldvKoJXmaDjW9ffwtKj
	qnNCIcEMFiN2cHQeyADoCvL56gHUFVivEJm7EQ8zKVbKP500fUNQdU3JvwbA49FikK3YJbdN8gc
	cWrRGeIJsR0X4wbjFwckT6c2ErBBirkRqTd21DrSmsQ9hkEwE4PfNi5fkTIrLviwBOsFAB6n+V9
	SwaeVneMDW0l3+76kQYahaJcghk/bvgQf6Lf68ph3qH1eYAqV47tZrBUCg1Po2vG5yGiMB1wcnj
	HRSJ1xwiWMMVH9n3XkRbb30sC80JOySRMd+ByS10GK54ch4KtTGGvrrctixhfBbjJYV9KMEw=
X-Received: by 2002:a05:6102:3c04:b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7d03a4d89damr1130792137.2.1793198292152;
        Wed, 28 Oct 2026 07:38:12 -0700 (PDT)
X-Received: by 2002:a05:6102:3c04:b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7d03a4d89damr1130751137.2.1793198291691;
        Wed, 28 Oct 2026 07:38:11 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b497ff5fddsm1482885a12.2.2026.10.28.07.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:38:08 -0700 (PDT)
Message-ID: <35c0fe02-88f9-4845-b37a-daa9bbc6a5fb@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:38:05 +0100
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
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: sc8280xp-qmp-pcie: Add
 vdda-refgen supply for Glymur
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
 <20261013-phy_refgen_1012-v3-1-f28305289499@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013-phy_refgen_1012-v3-1-f28305289499@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: r9lXKrMA-CIN0l0qLbNa4oKh4brGUsz9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfXyemvKmH75mmh
 DMpqJQJmKYgckcMK2JqbEqcmN7erpml+rrbCdBuoYHqWDcOU+tk1qO8ANhtVM3Wl/Skr/DvkNmr
 hZWXmt09z9xXfYe12U7tVFelsNCPUWxh+Veu7qnPsuNcXRrE5N2l6q661vLFzkmybnQGzatBs8k
 VmRJK7acDa2NXCgvCFv+ZeF3MypyomRuqsgy/+LGM0t21yj5dveOTXbZQqPksQ/uRePOiEFINFp
 kQcxhnawhaq0JNZEgUMx+5h4J3wrRugGQciTwA34cYJMNNs+Oyk0JqcZWZ1diAcVSmk887QYusC
 6+m+euk1M/L6UXnK1y/OWyRc/Bbeu1aS4oxV5YPJKFDTU1BrEFkp9O1hb2xGOlznPXHXImcHUu+
 W9y9lzzWfx3gEzmniE9aZBBqXk8FxQzFcfirt1+NLjSPJ2eEiv363wWWj/5bgODShnMgK+BHy22
 bCfA5X+IW18TK3caSlQ==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae208d5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uZIZgAQFpoYdS5itBGQA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: r9lXKrMA-CIN0l0qLbNa4oKh4brGUsz9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX3JhNi7gB4jv8
 6hO59R6yLPWMzE9z2zmUaB8eQhwnvqDSwl7KgaVF9EyvjE7fih/iTpsAk9YedrU0vF0mtOP2ULY
 FeJK4wOjW+2wXQ+QNRvJ9V0ys/a1Uuw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

On 10/13/26 12:16 PM, Qiang Yu wrote:
> The PCIe QMP PHYs require a stable reference voltage provided by REFGEN,
> which in turn requires two separate LDOs to operate. Without these
> supplies, the PCIe PHY cannot work properly.
> 
> Add vdda-refgen0p9-supply and vdda-refgen1p2-supply properties. Mark them
> as required for the Glymur PCIe QMP PHYs for now, even though it breaks
> ABI; other platforms having the same requirement can be added later.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
