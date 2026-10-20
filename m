Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479470;
	b=RY/nXfH8FcGnz5UFNsUspoI0cArIkA+QUBAGEvajT1HJxehRwztI9D+q+CtcrZCvoT13
	 wQ+LApBh8ids9ywKnE9MTZ0xhPieEOVwOMbrFBIH1V65p/rhExZ6IV/46RFftUKs26Mvl
	 Xh91L9GvvMBHXKgW55vTmcJFyNkcTq7VmIx+q4HTGInOQxS5mynYmXys+Dfpng9AU2I6j
	 9DiCVe7NiAmlA/RLv+CiKjsN39axXHcM8OyhgxcvbIBAZQQGUT2hV4dcVaKg4QtTBOGx/
	 DsSNDEbSS18YYzf/Ethsg1ZhlneBUvmFgQCKNU5PDjwEx1mgZ/3jz01u4N5/iYM0q9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479470;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OtJqhIVzyYbiPCDKFzmgjolR1igdute387IZrN4FPCI=;
	b=cgJ8eA7Dyn2Su/ZORtMCIK+6NPAqTVOHnMZ1xBBglageAe6jmeo151XKMikF/IyMOD9M
	 a+Eo7ufufhVHYolaDZuFHpbmMlIuOG4r9Zgt4AzzshzClFCU7jrm+Hj7aVPTNFbVog5UP
	 hStyIK/1Y/GiOJeKKBnuY5IFeRjR3rYPOldMhsZ3wRAsk7PpL5t+7GFZQdZDk5fsGFTqr
	 n4dVbA7Fezw8OOrpBNZJtstMhY6d1TUaayTdSElv0dpPC9Vcm8I/KnL9qkjuBqkxOxEUr
	 4/bRxW/KXIxl+IMFVgbS/Bu5VC0M/nWvo0Wf1upXliU+IJI8NPAwFgjClInaDu9eZDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TsMk+zH2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z/dBO5I+";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898D260A382C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 898D260A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TsMk+zH2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z/dBO5I+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tQhG3807235
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OtJqhIVzyYbiPCDKFzmgjolR1igdute387IZrN4FPCI=; b=TsMk+zH28Jf1GdAt
	qoT/9lY3gFvz5TLeqhj1zhjWRu8+FqDdFNWulTwLsbYzVQfTU6IDshTW+IeTyGJ+
	kGSkRSxfp9vdnpQfA6lqD7pcxLR68OI70Mt9465AN5Y4h+WHqk31V/iCoHYhjYPe
	eCAqYmFn0QatzSGuVb+N7sL2joz37VzaG9jN73cTO2yhVnPnwDLHfYnAcUWsGj8H
	oHsjd1ZKOlveUSCrwbVhWnGMpzM0gETFBOeSfWHbnwjx/FM9Lt3ep9tXd8VN+iCW
	V+KQjGhQGEdjHvwomdCdKqM16NSmWCMWbPXigbxkYa77AvqIE6TzC90koYj9YjEN
	1Zix4w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p997k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:57:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536708d1a3eso4938311cf.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 23:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792479469; x=1793084269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OtJqhIVzyYbiPCDKFzmgjolR1igdute387IZrN4FPCI=;
        b=Z/dBO5I+dtbYNTgmYzziHAI8BMH1JX0OrFqcV96d/B1CRKjF+cR9VIdJGPYUCBg2Ee
         NUkRp1QCzFpAdSPXPuPZXXpqgszMIXFsy8+QhRD9HQwgPyD3PJmbIRGaThnG0xJLgyY6
         H7uf+gbrFexPSvORE2cJJ2cmCFCaR9PC5xKvkvhDps6zmbNo9PNcdwMXWhK8T6EMq4dm
         y17E6nBcfeh8bFIHwOntr0ueRPXxf/r9Kfl7SygQoBurdiITbjGWWswaVucls0QoV38u
         JlW9AUX5UItVg2AVqeNgtu3XRhNu307ViotZ8EpGh8BRif1TOy6ehgV2DdMmDXkpJFcB
         otfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479469; x=1793084269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtJqhIVzyYbiPCDKFzmgjolR1igdute387IZrN4FPCI=;
        b=pYby4f3lstknwPYepkltsMVDg3D/3PZfZuEOF6KHVakgmmFsKe/dfziiDCtg6JNyUu
         hQQa/WBU/3nMX9r+7nlioP1zoF+LREaBPZIXPkBXVi7Ye73Q0jTquO8DzMVt7EAxAAcy
         O6/pt6O1VZicdS+S1NZwytexHfplC3XSVtiJHnC15b4J11VzOgWYVqRwa4vblSpphcux
         PCLHTP3TM8KjcUdBgiDc0Kv+ooqjUMtrOVH6/pNKJSWG30V2NlVLuqqL/MhvWqA+VLFS
         wVXFBniKrh8QrtizEgQeEKGeuct0CVbrfNRjlfHupNvXlWEgu3hzJKlM9sRmnokmwzut
         UazA==
X-Forwarded-Encrypted: i=1; AKwUvBwEIPeW5EYM/wTfOv9IeSgObdWOEjeSYo6ZEsWT0pF3fjAVeq74pQhjCpGt23dvQ31npc2HYrS8seaL@vger.kernel.org
X-Gm-Message-State: AFq9FYLEUQhCzaskb75/x1ExPod4gpBGLQgVmzfpqebPFE0cTGGe6KBI
	chvhBR6ASP1cTUPJu5kr3oulnwctZCBznpzsVJ+HAlfKkV93eBSgtydUB2BTLEhvTXtl+vJ/eSm
	I17/NuBgSRiGFDAeOvFkTuQ4ZmZCBq+X0LcZUeSKQw1bky9cLLxlnDasUgt2/RbWH
X-Gm-Gg: AYBFou0taaL4Pj/onkFjaj54Q9h2Ab+22RDc53PcOWTHkumQlScigaFY7BLy2kyFwYD
	2upSC/w/TDuivYiYmeo8DW/7YJsFVPNSMCOUrYh4Ylkj7eZn5D7Fwfp3aTCvtj8znwEuOCtvzSN
	OUIP0rkngXp/1Oy1fqj0LN88F8DyNETuEydnALyRKNS4nv+ZW6fmC7zN0oUZMJbWDX+NZG+RBSo
	Lq/OkeH0J423VrCqBKrZCdIbMES8eGCbXN/t0Zaivc03k3Ql9Aopg+yhA4Vg4E8qcMVgMeGGxwl
	TOXoox2YsU0PtRxZS4YN1dTrTqGqU6AmGD8v7Mt9n/I4MJWP/DFtSOlqeDurFKU35HS02o+YtHC
	RAAQ2tQiFzLHU/HWd4VlV9g==
X-Received: by 2002:ac8:5701:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-536461cc281mr179117571cf.5.1792479468648;
        Mon, 19 Oct 2026 23:57:48 -0700 (PDT)
X-Received: by 2002:ac8:5701:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-536461cc281mr179117151cf.5.1792479468091;
        Mon, 19 Oct 2026 23:57:48 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd10d4sm453415966b.27.2026.10.19.23.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:57:47 -0700 (PDT)
Message-ID: <45b92e2c-a310-4bb0-ad8e-2fb5b162fbe1@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:57:43 +0200
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
Subject: Re: [PATCH 07/10] clk: qcom: cbf-msm8996: program the MSM8996 Pro
 post-divider
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-7-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-7-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3Tfd7MOoP7_4E1tIHfZ2toutAwm4eNv3
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad710ed cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RnTLsUR5sZSAZyuXL5kA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX1yjGTdhbwnx7
 T5lKEo8cB90pirh31ksXfmGPH6r4jUsm0cfn2DvTywMz9KUHca7xR2AGt+UFLyKP9x1k5o4zXVq
 Iv6aT716LCtCkLzdTsGJnt1CSRQNA8UgK1C3fx+O9rHHpVLu77qKvK66clLjGVrPp1tVR8BqFjN
 abzxwwGrZ1kodsehmrRUhYjC11eNRH8FIaNiVG01FPAXZpO1jbZurEWGr5fACcYDzz+gIWsZoj6
 omKQyJbpfhJz9NnrMv+W9BkH3/kAtUE63xr7Q3FpwnzMcjVdFS4Yr9vQD5PhPuBax/iYdxP5Lmy
 hdXAq1iXCA09f3uI+X9p3uyhHlNWwgTLgPujF03nh1L411/tQbQ0MM1lp6XMbbbjxtdhj14quSk
 3EmlbHlcZ1+/SIvP+GaZE212SFGHx8sWs4oPXAcuDHvbq915dMbpeo/OXbpTv6zaX8rxvOUvuIl
 ZcWnY00ttt0htOoV+nA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX0foq8ZjqBesq
 W6Weid8gUcEB59qxVvJ7VA8lztV0GxUDj1PxtLYB9h1JfD9gMH4fnF4G6Ff2go+h/lpGVsJEEBC
 Q4SoCW5kg3zXHVqIzWxHAMap0c+iMqw=
X-Proofpoint-ORIG-GUID: 3Tfd7MOoP7_4E1tIHfZ2toutAwm4eNv3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200027

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> On MSM8996 Pro the CBF runs at twice the requested rate below 600 MHz,
> at the voltage of the requested rate, and the SoC hangs once the fabric
> is allowed to scale down. The Pro post-divider of 4 is only set in the
> PLL configuration after clk_alpha_pll_configure() has already
> programmed the hardware, so the PLL keeps dividing by 2 while the clock
> tree divides its rate by 4.
> 
> Set up the Pro post-divider before the PLL is configured.
> 
> Fixes: bc48641a68dc ("clk: qcom: cbf-msm8996: Add support for MSM8996 Pro")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
