Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678900;
	b=Y5v086dUo9T54u7TmLNhxNhKVqanhoJf8XqqBL+IEhY50ufsGroYwPcKQlk7wY6Fg4VM
	 SFGlQ40yhT6RCqawXQjFJ/iIvX1hkF8wt18p0aYHplYDuoerhY36Ov1P7OwsYMJIS2CJE
	 e/CpJhdmvwTiWEeKPdzrVNBFcDcSqsJDk1nZSSShkoT5tapgXAWHBgXM3L7YVOmbMz9l7
	 47vV4nqrKP/YCm6+RoOxL5suikZ2kla9fSvZ3smuoN3BKzfIU+hbVTz8HIKcG1ngu4nSp
	 F7R+W6smSBRQaSSItdDuJve1Obm8J4LzuKkOs0FAOLPqMQ0jzeN2/oE4i9p/100gfLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SWPuKJ/V2DaQHllZzOMnN6QFel9q0m/5M9pFHMBY898=;
	b=MkBRYmDSPpo2p8dpntd5CECyIxeNbHy/c6SvluP0uCy63B8yrI4nOIKCHWFwRDhZh/bV
	 1iHdzeBcTSg4Rp9f0uBemdycHshIC12277PRI7GhaGpHsIrykYt+dLeXCqHUkuvQXKQz0
	 BbJvf6jiL0k/27AyMpaMDu1Un3MITaMAfcmeEG49WwqfnO9yqQ1NFH07Ch8nEfdqFC+O3
	 LP6jzrMMM7c77FNMq0XArfICmW41bGnE4ldJBJoLPREuGAPx05fdqceG9Y7cMaZzKIboo
	 etThEuFfPW/PIODIoIkinJC0quLS2geirw1K7YOI/4CkkrH4EDaIoOHXUAdKgROqj/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m9BOlHNI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fc4BVc2z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFFA606A8AE
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 17:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AFFA606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m9BOlHNI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fc4BVc2z
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEHqeEN428986
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 17:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SWPuKJ/V2DaQHllZzOMnN6QFel9q0m/5M9pFHMBY898=; b=m9BOlHNIqLAo1BZK
	6OuVEt8QYlY6rUtJOAJ8jJaNRaffF37q004zZkVKHyEKHQKfYkod1Ozvsx6G1Prb
	g1+6ZGHsR4YcpyeotoK2oGK3AtuZKUz9nZR4/AFivYrRkLuk7yL5755gX6J6vMdg
	8zYFDChPoAk5jBKCbHrQxL40nFm6K/MLGZ+BlzeE9+d5xRm9+ybUVTf7p1dmwkGC
	FhxdFxiDtHu6tcrhTTX9sLEAOZHrTSv1WoOiyHFPuPe3M3Pr3EfPCGdggLdiE6vN
	xUp3k0pRZ0oWB/LZegj39KbOgcdteIlVX6JKIor/R025kuByI4McSI+GfhY07gqy
	Cx7ZQw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjsewc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 17:54:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94961ed97d6so173673685a.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 09:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794678898; x=1795283698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWPuKJ/V2DaQHllZzOMnN6QFel9q0m/5M9pFHMBY898=;
        b=fc4BVc2zfg7K6NwPCh166QeHGjaMEU2wpGEuzYW2jXqIUce+aQgs0nAOCF6dId4+Sw
         O8sprQIvmzL40peCFMddc3LVqnvh15iRJgM1paZBHV1kaxjY9gVQfKtWhkohj4mtdv6z
         Zu4alPHfCU8QC1hFyWJ9wtwh6otOV+Ud6IwoNImhBvDr63c2pOlwX54N5y24UzH4uQzR
         jmG6WZZ16sP5RqIglwSlsE7WUawdFXq4QE6TFbE4RlXzs8xo169lEBlLcOfdXVssz8LC
         enEAph1E3z1E9b/lY5ngNQhdWivr53xspe675fmT5VdOPUgG/+Gbqid1yH56+Tj5Vfa/
         W5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678898; x=1795283698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWPuKJ/V2DaQHllZzOMnN6QFel9q0m/5M9pFHMBY898=;
        b=Jc9g4gx7Wnr5Vw0T5Fnui98bIev615HWy0Roen2rgC82+gHd7p+IpLL50agvINIt47
         dh7DnLHEIoP8dUaQYWp2uPT9m+p6azJxiFnfEX640HBQRe5yLXycIIIe27fOS9yUqgUo
         gfD5DpGLHKS+RGfLwjuiD1jO0BC6NuOueOjLR8PtJuSuu6jkVBPCAVBextHnNir7CXWM
         9g2gX2aMgUUYs8omRWrZV9i6oj43H7zNGxJePd5Rdjextq8o0Znu0KUSVsO68OyQQUvn
         ovn4yruVRQg3iDb7NdlMrH7xs277UyPaJsjnzNP3KnuQLjWYSzljRI1ABXeU0D6ESKcI
         U57A==
X-Forwarded-Encrypted: i=1; AL+hErEM3yNgR3XF26lLvknSWwldJvLNnE+vBI0xlRC2iJ1MUU+h3ncu6yl9Wx0aGP1Utzya0LKgAW1GAJoG@vger.kernel.org
X-Gm-Message-State: APuU4Z+WPof7ZjpvLFUte5nxihoKKvWseYZpmZ/opBg1TrTNHSrPlisU
	PBPVayqnIFfWPv8zth6nlae17tW5Szo8pbfVG4/lPNRR27SfYwIsR6fnOgeHVg2RIY4AVfT6gSs
	RhAK7l3HaiuEKTc+cfjxn80D4dZxQUhMh/3n+KMzG8FPPG3lY9SvN9b3BcNCcnPKq
X-Gm-Gg: AYBFou1Zt5CEHbyz/XRO0d1jcntMjUvv/J5mJHBb+NH23Pvm5tfWIY5/LljfAsOKvbb
	oVEVWR5CgjeLbmy6NtgETcKyN1EqcXLTNxHuydln/ae9dB/nxRTBmPvEyRzV6+UaEX0+qeMY8Jf
	gJxG4dQ9ZPSICPogBUcvx5OgP9ENDbkNRNQa6IgDsbDODTqsrMbC9UUrQ23Ki4RdtpS0OZNcAk3
	EHko8I8CHH2XwxIkg+yJB3qHZfwHlwRzQNNHN+T1a6nSHHrhilnqtI7Sn9j7nQM60vxcUT42UFg
	SaqqdCuv7D3CSE2dOVBmxW0Ms1qoa3JNuo+akvGBY7BUA13QdhXO3zZZivyP3JyHcrHXsBWDF8R
	7et9TOGVk7IadDZXZunghhRRTYSUAdF/p2k41kL9g4Vj51iPOgSWR5xMDGJ9DxOW2+FJI2A==
X-Received: by 2002:a05:620a:1727:b0:949:6e10:b8dc with SMTP id af79cd13be357-9496e10bae6mr196349185a.13.1794678898530;
        Sat, 14 Nov 2026 09:54:58 -0800 (PST)
X-Received: by 2002:a05:620a:1727:b0:949:6e10:b8dc with SMTP id af79cd13be357-9496e10bae6mr196347485a.13.1794678898148;
        Sat, 14 Nov 2026 09:54:58 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm11060292f8f.9.2026.11.14.09.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:54:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 18:54:38 +0100
Subject: [PATCH v4 3/4] arm64: dts: qcom: msm8996pro-scorpio: Disable
 disconnected DSI
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
Message-Id: <20261114-display-msm-of-graph-v4-3-b8de044c6c1b@oss.qualcomm.com>
References: <20261114-display-msm-of-graph-v4-0-b8de044c6c1b@oss.qualcomm.com>
In-Reply-To: <20261114-display-msm-of-graph-v4-0-b8de044c6c1b@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VAmAuSw5Qrz1Gz52ayox0A7+zqwBb2WXC/d4EpaIHcI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq+KBj/U1se/9pEQcrSLEYidME6fGqzdtTKxEP5
 iEtUNZ/oN2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavigYwAKCRDBN2bmhouD
 1zcaEACaJZx/cwNuCU2I2yLeRQN/WGPPfc4u8o0xMi6NoozUyadyvLWur+AT63rJg7Xw8u8cuui
 AoYR0BBQFOdWpcr1x2hX0ac8pV7dUwYmXY47jM8jAOsLSoSvN5UGfgVOqOteZYasSVljSl08Ybj
 0yIsNi8N8ymmL7UcLsTMhtXl6huA6FilsIK4R3BLnmjLRl/0ZmfIHoMvvuITVpNDYeMXoQt/3BM
 oOmF2X6JpFlvl1uKgwcDTgFoXWvsjheno1mUfGfA6qsaNpjvE1DffppmOOrTvq3eqhmI9Kzs0G8
 eQ74Jx/iF71PNPFclYYe+HZIZgOTHOYV0ChKNMrxITNKIYFXX7kJt2QzZsSD9AqhTPd3wOF7YRE
 THGN4sIQd+2FuY2dmljTugwUit2WwLrkNhkjfpXdh3I81TZ8FNCbWGbBhv/I3+cXoE4/iA076ie
 1snmX0yGZhbs0w5zSR80fUMPHpXJE6kkNoV+31jzps/06/7os/JDVbDMKrLn8+WaUeweqRtF8uV
 Dz2CALqkARo4wW0tbU49Tgw4AfxNstsO3kE/o/8bkI/sqK6VmPcPs+KLF9siaI0z2cAGtBInhJ7
 vWmSEOp4jngAmQUo6IFVKcZqwt2zJhwu3kHTlz2MdoP13I+fpv4JbGcUKDCqCfmvIpwDI5bgt2i
 69WvE6DuXNryRow==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA3MSBTYWx0ZWRfX10nMQvYzBO8z
 kLTTa4wi1pGYGJlHsa9KyJ8KPLfZ1SvAR3qyTfzCfsx6OZDhm6NcOv1MYZpE5CSiDFBn2BdBdMr
 vTTELUpRjrOTPwagOKG+YFm9sZUiRY9coYLolZIrxrd5hZ5RWo2uh9/b/Ip1j4GqryXXj9u9oYy
 TZ5KefiWDNAMJ7EmP8tOMLdHcX5BdvvIfJu5N24ijrKF67hIVQ0++Yvsz1GTfaGMxTXtySWEshI
 afNr9aq7WQEdotL3P5EqvRgjW/bTCa9KEmTTLLLdcdBmlV9OLqgs3wi8CyNf/IQUK/kgurRfKLp
 5eKArgnSxZdOA4tt/xKs5kUPFRt3cfwMtEwLCRu3G+v/h+4hc0Fh6bxWGkSh8HGzlkfAJqq3CKE
 hK3pIis5c8OZ6oJLRWuhgkA4g/ECySJecp/HERiKpjm3GCC4NNHt4lhymcNMZcp1q2LWCX5u3ij
 /XaKRy5QSXLATtAMNqg==
X-Proofpoint-ORIG-GUID: oUKpAxnJMd-RIsoWKYPbko1DGqdMYzlW
X-Proofpoint-GUID: oUKpAxnJMd-RIsoWKYPbko1DGqdMYzlW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA3MSBTYWx0ZWRfXwSTlXyTROMG2
 OhC/mbfyBkr/Perc1zkgLRQDyB51EcTlllilI+5XHlahQFqp4wnubiJiZjFuw4X1DJTdlJSTmD6
 ofKt0jJZ9WkZueGaMyA7k1ujSV8/gC0=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6af8a073 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=F6vqezskldl5T9wOwfQA:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140071

MDSS DSI and DSI PHY are useless, when nothing is attached (no panel
description in DTS) and MDSS being disabled as well, thus should be
disabled in DTS: no bridge will be registered and no component device
will be bound.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v4:
1. New patch
---
 arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts
index 1cc33c3123a4..85c542328d96 100644
--- a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts
@@ -111,6 +111,14 @@ &mdss {
 	status = "disabled";
 };
 
+&mdss_dsi0 {
+	status = "disabled";
+};
+
+&mdss_dsi0_phy {
+	status = "disabled";
+};
+
 &mss_pil {
 	firmware-name = "qcom/msm8996/scorpio/mba.mbn",
 			"qcom/msm8996/scorpio/modem.mbn";

-- 
2.53.0

