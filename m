Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB3F3D8108
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 13:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899622; cv=none; b=HzkuUv/VrvCdOAJt3SfNTRywffDpZC/m+/ZXIXppM84rM9TBck43c1pbDPPiGTiEglHNoy6gYe2vs6IcwP3aMInWMNNV/uj+qoO9NGmWPu6djUFXvE0/IdUuqDSBOtArUXjM6Ljpj0SBrBMNvyyj9pLO/RSPSaDq2eXVDss7G3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899622; c=relaxed/simple;
	bh=3ETyxOrqtGoTUmGsxQw9Wv2E14Hi53hSdIXoy1rbroM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tTdjt/yOORCSvawE0EGLoTZcO5Gu5uSCpq4qkztb8AjUw3qsTBZpHgQ5uqQo03FguuOjn9IWwXUXfXiSG5bvtylbWidRwXyeFtCezPa7pEfazYTY/f5veJ5vmX5AhhOK0cRPPf/ONqyEq2mYcuDMlwFAunJ2efV7A27ykyPGkvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FxchUURy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLG+rFD9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FxchUURy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLG+rFD9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B48bi797657
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 13:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N0ab2drka40CxOU2j1vUZeZOnQB5f+4t6MU8W+kStWE=; b=FxchUURyYHt8yiqm
	HK1RTFu8cMHotutbAx55xZzcb8OU/kOQXGLOvyUsJDotwu8OOjCx4U3TP1aLIoBg
	CjVk+63cQ0rGU3+Eot0UrJU5D2018rbkIVfZC3xWJAg3LF3dg0j9ByhnUaxLS34F
	dUQw075JtM9S9zYEy74K6MiN7lPtGg8XamzsBkBSGaoRJZu+7E3syaH8+sPZ1tjY
	nibOHM3oW2NuLUpyp6Px7WsiwdtHg8r14auRwC2MAXZlHalsP8mOrYWdml6TZZSa
	+TK0d25L6Sv9XRoUWfQvMA3UP9KOp0J0xo3NR5322rqrM6fJwquFvKJmWZ5jyLAw
	rs9/rA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw8uxnqhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 13:00:19 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-60feeae5dd3so347119137.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 06:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777899619; x=1778504419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N0ab2drka40CxOU2j1vUZeZOnQB5f+4t6MU8W+kStWE=;
        b=GLG+rFD9om0+/JBf3IPFlb4//8mCOo5pHhrn8OBoF5GWexTpVUAhRxYRIWdfn/RhVL
         1591JFxzRkqix91Rkr1t4mxw1exiQC31LLTn1wU5EUxoguOvzNkAYRm1/4NershqxTk2
         sPUwcqq5W4OH1dpLub9xUYSbnDJwqbzGV7fNnOI2w419GlKTRgIKGGW2TQF8NhfNUSMj
         D7lW6+cHJ/QAeLQSLzyMuNWF38cIvQrdBqKKVEx+85Cz5AogkmhD8EFOFg6nqwk7t2ea
         UqPVPLujjGQavtgABjvFjr2iy5VXEx1uzbC0ie3RYkEehR3uZ/VPFaB6roodDmcZkVkM
         smxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777899619; x=1778504419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0ab2drka40CxOU2j1vUZeZOnQB5f+4t6MU8W+kStWE=;
        b=CevmAEo2UMHaw+kc0tpiGNYgWtpWU6POkomFCJNW5MjSCBQ0jCH2/UU989FKJFmahJ
         Sz5UOHYDXslTSoYynuNLSkIWxleEvb4fhJ35KalDbGq+vkdTbTzT3Wup2xOS4GhN+axN
         4yRlpbibCRjLs/MybRzVnJ608dvea1xVyLcU03/IOrgsH+LKwytZBE/mm8jhE7/KQUuh
         syvzfkQDV3kbcXW/GMnR/Kl9z5al+jTj5okiTGShxKnx2Qsh5BIr1WoEhE9Iij1bjtCa
         OfOf69ZSJvyh63BBx2UGd3nJJqE+45hazrUDGlnIawzhBx0tKjdzVFR/twqSadnzVUR7
         qvaA==
X-Forwarded-Encrypted: i=1; AFNElJ9nNhzwG1rIXsV7AEDO7F9SKAVoTeGv/OaAl9TwmkS1kTDOZItKy6kjdw7qIVtkbo4sfFl7CutEKNAE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Hdt/gG/vcNg3ZS9IWU3Kpxh1Rpzpa3b+EJI476xNs8llTub3
	sxbaF58j7jA0dG/JsFpQ8ZV8y+2ej4kwALkGJdOmywvxv38ZoqvdBEMuyS63JTVxaq2vgOVwwpU
	uKRjVl0dF2nw33IgsWCl6bVk1boi0CZX626AB0ZkqZq5G9kwgIIfkEUIPZnsfoP4n
X-Gm-Gg: AeBDieuLlSeBavV+SKGq0Hc6nQ7aQMzfSs6eolbLwkUmY8gaBN/1vZ1ZrQqBjyto8EF
	IwqUUXHTkuxD3syTgsCVuzPIqzAV4zKA7h8faNYNiRPP1QvaGBXw8Bw6K0le6Ux9nwh0Ua8MRWO
	0sld0WuVyHjwHIZaD/6UMXAE44uFDuGFNsRETzwpROskMAvYd4zJ41292xS57Op/ax8sKZV5797
	RQFY8x2+IJkaK6TOh0HZy2fXU7QrJYERUnmGCLWdlYFqXX3Egpza+AodH17U5eEmAoz8GFW2rhF
	RxD3GHRpsIOaysiNCoLTw5eG2oVWzZO5OQ9BB4MDhUWgrcjVnuYTeDyYArRu+B/nlRPL0+c6N9G
	5CiMMm8yE4hp8WmiS7ATVfQwS5P6Du5Na/P9rteRmQcXvPyddh/l4TidHPvdqSLTfXV4rTRerGs
	1b9TOHuNb+159EIw==
X-Received: by 2002:ac5:c9ac:0:b0:575:2300:9f54 with SMTP id 71dfb90a1353d-5752300a733mr673855e0c.1.1777899619314;
        Mon, 04 May 2026 06:00:19 -0700 (PDT)
X-Received: by 2002:ac5:c9ac:0:b0:575:2300:9f54 with SMTP id 71dfb90a1353d-5752300a733mr673828e0c.1.1777899618781;
        Mon, 04 May 2026 06:00:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d66c90dsm401289466b.43.2026.05.04.06.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:00:17 -0700 (PDT)
Message-ID: <ae6dc340-0432-465b-8527-24cdfea5043e@oss.qualcomm.com>
Date: Mon, 4 May 2026 15:00:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/13] arm64: dts: qcom: milos: Add power-domain and
 iface clk for ice node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
 <20260416-qcom_ice_power_and_clk_vote-v5-12-5ccf5d7e2846@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-12-5ccf5d7e2846@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XB42EZQrm230YloNyRwkgSwzgTsgQe6v
X-Authority-Analysis: v=2.4 cv=QqxuG1yd c=1 sm=1 tr=0 ts=69f89863 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=RcdfdvLsBkETvr5PKcUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: XB42EZQrm230YloNyRwkgSwzgTsgQe6v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEzNyBTYWx0ZWRfX37tw+9JudPoz
 gsGUkI4gw2VxkRO1iefLqL29DbSZAhPC/3UHxnA/Gn8k3CwGKbNITGoJNiiLUSOGIj696To0cQ6
 P1s8qJ0aTETSxdxd7fetBrrQBXNMH4eFGovJMqabj0DjhUhJFh0VO/+qNOP6jhMbs3bsDwQho+O
 oB722HsnTxQFIboGl38ohMD7SATBxh4EmlkaygsFFS5CYzF0fH82/tf89flu4/Z3xX5kmet0Af+
 Xqyrjo0Nnb8CAur8U+K3vi5TvXCI/24HrvMFTu8u0tQGnEaWfvxJ0jmErpUIg/CHAWM770b5lDI
 ykUN6fFrqDY//RtKt4IGec/rKOKSGfM8jdFxRuEuPy1rtatsnfMWfeQC1AFFegKy6SmTvw7kgO6
 u0l95sOAkk9+G1YWNzegw/KitgCM/na4Nxmk6D7jrEGd+jZ8XIqzByg18HbBxf9c3HBgN6e2yx1
 +f+r2w7VUNqpc/JvZ4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040137

On 4/16/26 1:59 PM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the UFS_PHY_GDSC power domain is enabled. Specify both the
> UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for milos.
> 
> Fixes: 04bb37433330e ("arm64: dts: qcom: milos: Add UFS nodes")
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
