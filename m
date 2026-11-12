Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495740;
	b=g9WOoIJZy4nJuIxPZT5WRGbs8892j7/vV5gr2AvGK7Y7tOtCS1gFvkohdky9p8G1gesc
	 1r3+WIR7Y8SKHnu7ORywIlvq/WbDmg761lH4RUY2RxOSBP9ArP211sC/KR0QM5O9FA+lD
	 pgbSD3q5k6+XCafJ31N0PkAO8h/aalFdiUU+MdYwpcwKmYnKK0FDYieVc0ld3ea4qEVVY
	 GIigUQs8hyqsVJwDNJxFM9L7ZMpHY3fcu55Q5Qp/igWHHRxHfi0p7HvtmIPcdMwElkJ4s
	 K0pSDPWv1Hp4Cg4Dw3ZMTmQRQmWKKDWV6oZUeK344zUhENepaEs/m7vJYaNDiSDmLFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MTTc3ZHWXywW0LYFxdTO0Y5ALKzAGNfd7iGemICb6xI=;
	b=vWNRrinYb1rq7UHBIaQawvoeX8VuFJsZxz1VhG3UkQ0Zv+hJag5CfoIPknfN4Y1oR9lK
	 QnyjBFyfNe6ok4D8uaIrkGB+9mRveTK8tLqRkRJuicz/LffHd6Ep0llrY+XhPStV7GFIO
	 AlkcyRI/gLy1xWoApa6CF/yqcQ2+LNKWum5T70XpVfxFB6K6tku+wsSoCXJQb8u8ogp/g
	 G2qkbkplOALyyWOL/9QQ3JIH5hyvR1xouTRUqB5r2xrEpGk/SGTvmirdYO7YTiSeZ3BFU
	 gOCPAwcyt4iEifwEtKIRkkd42tj5Wc/YSiwbHIf+N+PAHOG9B6bMWt/9eTub1ZSinRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G46ypR9+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JnPI6N09;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F87606A882
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F87606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G46ypR9+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JnPI6N09
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9Ds6U4092512
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MTTc3ZHWXywW0LYFxdTO0Y5ALKzAGNfd7iGemICb6xI=; b=G46ypR9+397JZ/tB
	QkaPHyxz7xpQVJlHgF0JvmoTk1eVKyfmP8PR9KQj822Wj7L6WTwlk+1xKwJN6rOg
	/SVpPjX26ueOXfg/U4IC3yCuOjuHx/E7Rlbq7fBFITQOYF2e7hOH2OCCTyCcuByQ
	I4GD0Rbj5MBa7eeQ0TfYL9817L+CONXFa3v4vN/FpPSmaswfUa4s0mknPzw39Dwu
	gQDQtlf7x1XDMYh2hOjxIN/5FYjdQvPo1SpoOgthoM3E7Epg+GYwNgCAxZahTyqG
	fO3z/qQ4PKTgvq1ExR8cMHvh/He3mkpXwlWI1e3KeQYv0B63oH2esFyStrnMD/B3
	lDhCsQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8kbs4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:02:19 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ece3cd5a00so3317450e0c.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794495738; x=1795100538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTTc3ZHWXywW0LYFxdTO0Y5ALKzAGNfd7iGemICb6xI=;
        b=JnPI6N091PruwRJNFsyFMxXOVAcrrP2XTJzPxPBPYl39iIAcDBfFgaprIU7XuicpUc
         zyxE1AK3Ty1bZD6Jf2h7/KpEdVXOxJtQlGRPnr+dE4TWDlnFPU4E0eRZ0gm9nnSwkoQo
         MrDSIpWkA5lTichAi2spP6PYt9AqRcWsrjOrz8K6cR88zh5GU1oNV4yzdiEkZstd8zAD
         1I2vmoOtjlj5/wwI1keEX3GhMekan6SoY8hVAV3NGKXV6P2DcSA276vD37nS1o2AIksB
         ZujDzKzfbfPUiKu4/XTTUrwCLKFO1h9653LUPI10NQRgs9NKgCDlWsWEVGZwEbE+oeGo
         CBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495738; x=1795100538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MTTc3ZHWXywW0LYFxdTO0Y5ALKzAGNfd7iGemICb6xI=;
        b=pZvFnl3O0kXDkFKZrKDB4FMHwU+i3XtszA6cNXyNSe3aBQpTVpAGJz9QcI64tU5Mpw
         NdzfeOYOF1fsMpjwLvzUvwE1kF7Zu725fz8ahBfTpITSfpTBByuLR+XC2f2YRuMEQ/+P
         jy6oK0GYqb4rYE/yUbCg3nG0qymq9I8C30J8YOtBJGqZ9W25u2Zi1sYDlTNu9YplirW5
         eiynZrQ0QIOOg7lMsJ0+Fej6dJ1NDJ4Rk2Oe/vsZp5JsmyXjkKkkzD9ksOs9KKOFQ47v
         jPP0ZYTIRUYSl6u7cswVJybjPG+ZP3e4kMhD3JFcGB9a+EYbttncOW4tKGHXl2hVcyQz
         DYVw==
X-Forwarded-Encrypted: i=1; AL+hErGsYvmcaT3S+sV2bUOFFjj5zWpiJNpJfh3t0dXTaDm1+Lfk+ukqplI1bN6Mkkps8I3CfMJ45AuJiUS0@vger.kernel.org
X-Gm-Message-State: APuU4Z8CMRTWUrJD2VLf812QzO4prYydjCbsRn+jyLdVzACVOiv1gJKI
	2mKDSW2fwS8AFlyahyjn1J6vAHAkEb2k8lfHcEZblhpFYwE1A+f9c7io/LXkDHnjQdLzGqfgYXy
	T0E9NXd4h2DasVboCpzBf/1+jFYZzaG4txEIyNkIwtqHmY6m5HNdF4qs/AlhiDxvH
X-Gm-Gg: AYBFou1418oJ7z1oNsi3Cp64d2jkc2moW6DrSledJ3+lbUP2WXuUfzYGMPbt2Bvf+8y
	UJ6bf+CU8zcwo3UpFIP0p2eqZgAgyTBppeOxl2XkcmvbTHCgGt4p45v0youxyOU5r0qCOS85ahx
	+Q8rm+cZBCNxDABqfqCxd2FjWN+z3xDc3o7kRLEs1ESqlZyzchxrgYTVVC3Sz6qG/hHtgzEjDqy
	NY9aUVetMgD0dLLl0jClSJbaKhxBv21Lo4s+BhCkAthtxSfoe96whTf5q+2x8JLzAp5fWXkcimZ
	4VvLz4wkYRJpvY0+rlBHQvTS+2AEB4qIQ8fYpx7hV+a99kd9KUdL0o62aiQ+vWfDLIG2NGLBr1H
	Jd0tu0qEulaIrRcfjPec9TkwaeZBVTTx+2AI26JzmLHn4P/B0Y+aKuix2T//KWjuS0jAnMw==
X-Received: by 2002:a05:6122:420e:b0:5cd:575f:9396 with SMTP id 71dfb90a1353d-5ee1c410b75mr2624803e0c.12.1794495738222;
        Thu, 12 Nov 2026 07:02:18 -0800 (PST)
X-Received: by 2002:a05:6122:420e:b0:5cd:575f:9396 with SMTP id 71dfb90a1353d-5ee1c410b75mr2624725e0c.12.1794495737312;
        Thu, 12 Nov 2026 07:02:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e354b0sm106758475e9.1.2026.11.12.07.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:02:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 16:02:02 +0100
Subject: [PATCH v3 1/3] arm64: dts: qcom: msm8916: Disable disconnected DSI
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-display-msm-of-graph-v3-1-7fd0c06ec6df@oss.qualcomm.com>
References: <20261112-display-msm-of-graph-v3-0-7fd0c06ec6df@oss.qualcomm.com>
In-Reply-To: <20261112-display-msm-of-graph-v3-0-7fd0c06ec6df@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5343;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=djTBa4Cy0m7HkGgyxoN4PACYXv7Ysx2A5Lx7uxzmuOc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9dTvCk7cwJUrn/2g/CtsxuZcz130FNIV0U3EB
 3iZ0q2KzueJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavXU7wAKCRDBN2bmhouD
 1748EACOQzt3/Oebew7ZYI+TTsb2I6dA09V/GcaIzOPdYAEJYmA/eCohJbmBE8eTaCNXemkGGIU
 cZ5IhZRs472JvcL78t0uYlbMureeMB2D0NG6le7KWiOc9llvCNAaHqgC6qDusl+ocU6/YcS1p+b
 akCuWXsYK7Fb9KmTMkbWR6bFD0ELEg8+neARbHlFMtRNklDGxNHVeuQyU0l+xZCAsWGK7ulpFdC
 PBd6e5p6HiEriqvLsdr/GDM4BAfW6avMtK5c96GrjUMIzrQVu+pfKG8KRuskmUYeiQpR3UiiXlB
 Ie35h7kZ7dcMHJLkgKDb2vpHvt6iBJCPGo2HBZ17doOWavVg96aIDBYhi1LWXHNyVqYLW4GHm1P
 ejCFMIAvrFdYAYqvhhlp/7BKJKx/8pGHzu3ITsyCCtXAwYBmEGnUA73Ez/Ysk4+SyRXh66udvs3
 6+C9Hqpdxk+G1dowqYHAhFR+KDXUEdIhGMTymTvYBaBbJCpQWn8WZbJRxd4Ism3UL3hbQSElDZ3
 YcUh6f/FTTDLczZzhRJ6dgXnDgxocFV07lAnZLc+FeOjXAP6fOPes7g9PWMt2lttqxpIlUloCaQ
 lyLaRAgQod/4E1a+LbY5Zs3qpbFKRCt/7qChEQkEH14QSZSR5hp0+2jk5vVji0y1eXCVGzQ1uBF
 4SDrCj8TXDQ+vMg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1OSBTYWx0ZWRfXyvcy2JzLxj9r
 OdXekLobA3sn54YTbdw6la8/utKaGAsGSCBPZdlKLmN1qXXxrJstiJM7Q1pX1Wha+7P+1XRbxB2
 clF/A5yzWQEAEn9qsBUdkFqP8mbN2RI=
X-Proofpoint-GUID: qmciFTLut6uCvTEQInq88c-swcjuZZPx
X-Proofpoint-ORIG-GUID: qmciFTLut6uCvTEQInq88c-swcjuZZPx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1OSBTYWx0ZWRfX0+RF6Yf1R+Gy
 TXec1F+M/izzo5hFlzmeUL2UCw5y9sPc6EQ0yK/u2d3FeZNzOQDUXRuvl8vJMbVCfWBHDMhSO7+
 g/7ERfL9Q3CAhejREQnj/o6MswKXyUKXxYQ4IwgQhbOiaYBlwBwJD2DGjSWmRQoZvT3Tmxflemi
 JuUArt0xv0uLGXx4KTIIH6165+jR1uUun7iElOaa1Zz8CkgHLvJ+CBJ/cxJRvIETxt4hkVCaSGk
 4R99YBS2cO/baOfGFHx8/8j3vVLDsFlk45giZwIVRD8f7zsaCzKW/tjB9/lpyk53hHo72ucqfi/
 uIILjYS20kbvhHzNXPh0tChUWUjxpIMjOaLUkX11YO0JdFqxETz7zD0+u0+eHhjKieKhD6S82ib
 iXBqA4EgfQkBlBVxQ66RqyosfkFut6WqB+c8Gz3uMyZokgmjr4qbqEZwM/314qrl9qxeOU4nPP0
 PZePwrRbJJjtjaUGG6A==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5d4fb cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=31hGAD3R46fbwAJXn2oA:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120059

MDSS DSI and DSI PHY is useless, when nothing is attached (no panel
description in DTS), thus should be disabled in DTS.  Linux MSM DRM
drivers will also fail the probe.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts               | 8 ++++++++
 arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts  | 8 ++++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts   | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts     | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts      | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi                  | 4 ++++
 7 files changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index ba6ccf0db16a..1e990c8853e3 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -257,11 +257,19 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dsi0 {
+	status = "okay";
+};
+
 &mdss_dsi0_out {
 	data-lanes = <0 1 2 3>;
 	remote-endpoint = <&adv7533_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &mpss {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts b/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
index ce75046ffdac..78602e9b0ffd 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
@@ -213,11 +213,19 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dsi0 {
+	status = "okay";
+};
+
 &mdss_dsi0_out {
 	data-lanes = <0 1 2 3>;
 	remote-endpoint = <&adv7533_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &pm8916_codec {
 	qcom,mbhc-vthreshold-low = <75 150 237 450 500>;
 	qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
index 906d31f1ea21..d3adbc7406b7 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
@@ -87,6 +87,8 @@ &clk_pwm {
 };
 
 &mdss_dsi0 {
+	status = "okay";
+
 	panel@0 {
 		reg = <0>;
 
@@ -109,6 +111,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &touchkey {
 	vcc-supply = <&reg_touch_key>;
 	vdd-supply = <&reg_key_led>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
index 5b34529b816c..fe333ed489b5 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
@@ -133,6 +133,8 @@ &mdss_dsi0 {
 	pinctrl-1 = <&mdss_sleep>;
 	pinctrl-names = "default", "sleep";
 
+	status = "okay";
+
 	panel@0 {
 		compatible = "samsung,ltl101at01", "samsung,s6d7aa0";
 		reg = <0>;
@@ -154,6 +156,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &sound {
 	model = "samsung-gt510";
 	pinctrl-0 = <&cdc_pdm_default &sec_mi2s_default>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
index 3d6d9dd3b8a8..85d1cae19a66 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
@@ -98,6 +98,8 @@ &mdss_dsi0 {
 	pinctrl-1 = <&mdss_sleep>;
 	pinctrl-names = "default", "sleep";
 
+	status = "okay";
+
 	panel@0 {
 		compatible = "samsung,lsl080al03", "samsung,s6d7aa0";
 		reg = <0>;
@@ -119,6 +121,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &sound {
 	model = "samsung-a2015";
 	pinctrl-0 = <&cdc_pdm_default &sec_mi2s_default &secondary_mic_default>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index 71b5c98458ff..65de798201eb 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
@@ -337,6 +337,8 @@ &mdss_dsi0 {
 	pinctrl-0 = <&mdss_default>;
 	pinctrl-1 = <&mdss_sleep>;
 
+	status = "okay";
+
 	panel@0 {
 		compatible = "samsung,s6e88a0-ams427ap24";
 		reg = <0>;
@@ -359,6 +361,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &mpss_mem {
 	reg = <0x0 0x86800000 0x0 0x5a00000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index e39743e22043..7d351cd15f90 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1634,6 +1634,8 @@ mdss_dsi0: dsi@1a98000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				status = "disabled";
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -1668,6 +1670,8 @@ mdss_dsi0_phy: phy@1a98300 {
 				clocks = <&gcc GCC_MDSS_AHB_CLK>,
 					 <&xo_board>;
 				clock-names = "iface", "ref";
+
+				status = "disabled";
 			};
 		};
 

-- 
2.53.0

