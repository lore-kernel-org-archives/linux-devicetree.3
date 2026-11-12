Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495756;
	b=Xnb3sBD0Bm7V7X1AMF/g+11g2wJ4V3F0ELEyswpSB4UZHUQrp+IscOQ4Yw39+93O4+m5
	 UTaOlOlJ1eeRm1KKWpapTqA+YrXopucHocIGx9nBMD7x/Vn61r1H9te75iUI5ynoFLqVh
	 3NH7XDc10kiGOJZ4UIio6Ye2PSWdh7ppVJy1date8HfEuvnKBFkxg+mEnjTrzRpsiUzSG
	 8yvYWo9u+w5eNzD+otZs8Q6iQaEJNt0wOnDpQWtnnuEQtJ0eh8xx9NhMB2/CSC7qSq2Ib
	 LePa62W3YPwpmBlU9U7ZfYigaVKRjZZkTN/sjuwCH7jo5vfa2TBZXbu/5r33Xg7tl1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495756;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=;
	b=briZ+s/yYOX7KeJLeqzBftcT3MFzyt+bukLkHqO72HLFBOft2YogzTYOasQ7J+VrgL1/
	 s5v38y+T7PuJfo5ZHeLjRhYhiLeAlP3ufYnZkbkc0wFDUntlx4hJnkI4URWZHAjXfBPKj
	 n5hUYVpM+ueBPYqZo1RfKmpqhHOAQ2jtiS3Dj61yr+JFMqn4S+3TJqYj7ilT5lYBa4VyC
	 Bgf8nGLQpHQ7NYQ1wQGIikF22FI21+uHavzXb/mKD2BcYyXr4itIv1a4OfXHGzbsbulk7
	 u+F/oTUeTWFcs1r8dyewGC/kv4W7svbz5ZCY7qydY0PCICf+gppPigNpvGrjApuFi1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfflmosK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ja92lCdl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03A0606A32A
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D03A0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfflmosK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ja92lCdl
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC8s1004149474
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=; b=ZfflmosKG2Xs7tFf
	pJMyx5GvhcxNkwfpWvgSZP4Bd2uL9DJRO6NfdatdYCiSxL3NaguJN617x1ymuD3H
	4fXWZQi6HLKnI8teXiYWQpQ+IxwrA2mWfiBFgt72wRQ6BjsvSP6m8Hn72FKrfq0F
	zFTjLTuJrnTEhKRhIEGHJB8ducqa3QdUDkKoUfFET85fkdVqcvyHHDeVyZLc+O3c
	QNa/JHDhDN9c53ZHPLJTMJEKL118pnsWhRaDMjB3xlUTdgwz67ljCKfjFo+ReLCI
	HWl2MxDBvntgJtA+mzOxNuYZf4PnrHdN82teZNfPK2lokWaIp+UjAhyzjnhwXXSr
	TaIF9g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc63xkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:02:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f568dee56so695406885a.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794495754; x=1795100554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=;
        b=ja92lCdlHPop7oAN0N0riR/IFX5uypzzUI9fmNfx8/3PVf08e+hFQlQoAS2eHtLiuA
         WeFljNKNVtmEGD9CG0Qto2Ii7W/8gTeohP01L5ISmB9ZeP2vcR0RLnJCDrQtHxzKN0/I
         mZxoWPuTgzzaxJUcRFzBklAdsVXCceppF1cKc6StZCWQmECilmFBuAbbe71GXBB2NyRk
         JXGKsmZqIsgZzpy6AgBRl6qeUnsph4zf9/GR5hoN3LhsTwqXG2NnFkFHm5wtDWnkofSV
         p5iaqUf1ipog3cda6tQBOGf3kJWKJGzPOTWI03eSYV0qhX5c9p8eihnVrysV/rh0qsAJ
         dagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495754; x=1795100554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=;
        b=Ke48BvPOwxOYOGXgFMaK1a+HLlF0OocZDGD1289tH82EC8PaDb0f+2/IDpOBY/0thF
         JHcGIWK5EKBkCJNbN89o112jdRLHSwIQJ/WH3w71B6wg/r9f+EILD1AXb8yVBEuINK9K
         dghb56e6nH3BD+bMLEy++wSsEOPFhRHY3OcmEGMBTs31gqvp1XeCTNImIwdTv3QphEr6
         adA/aeNHII+fEusfcoEue04haU21A7ABJx0OEfE+ZWxHWuzpTHdbXGWfWpYFm7QiCFmJ
         ga8S26Y7uirUBgi2n+BY0klyAT7djxcLwJGHqR4B6H/DJA4gZT30V81fUHDGx1WLo9dS
         VnGQ==
X-Forwarded-Encrypted: i=1; AL+hErHEShUot8IM5Bnas3NsSUG4cRLbknG5f5KQBoHHL31n6G5yud7GYwCXhbGC7Ihm8L+ihCbkmx8GZzGo@vger.kernel.org
X-Gm-Message-State: APuU4Z+S8T8/39kpZBJBjLIt2j9So82CV1GX8zYV9pdy8RhE4FaqGUa2
	QHEg/ZkkET4MGYAFJmfNpj2Zg+IkpYC/ooYmTHeLJVxlpc/6CrjEjkR9Kh9g24th021q5cQMhGb
	uwO0SEG6UsetfSs6Qe+hfUClnPjsKEoBfkZN4Y9FOauaR7zN+5ylshIgZj3f4I3jETaGIuNpu
X-Gm-Gg: AYBFou3Td+G0FRBMaD7TrSr7vg8sdhfD9DEcCpM1n1ByexcpnRTerAH1aTxKG6GteQs
	xMGcREuvPnEPwEEVWtovl/bDC+urjGWKqDO4RuKpePDaznR0TiTzjnJdzfel5htGBNfUA65bLO1
	79sday84RicPY6+AdWFT1a2BjJjynhV5kNTGZdvA2I2I23BYxDcXQyBXpn/l6oD3PO0RvmqtSg4
	JI1YG/6Mcyfn/Zgwd52s1xAYkU6uPHnwTaJuPrcrf4ndnwAR23kNnNq5nRcKFVK2BwyQF49SH2r
	jz6htWe0MnlJWU0N70EiQm/P1aJabx5eBvXoEipFfBaG2GROPIHGHYzfbKxSDNvJn+ZDWiytHcC
	52ifC4FhTm7jE5yg7OV413Zufw3iAtbNmPUl8CscJyvzYbXU0+/I11R1KUGLQHpaBFf/c7Q==
X-Received: by 2002:a05:620a:4103:b0:945:d148:657a with SMTP id af79cd13be357-947aff969cemr1033329785a.24.1794495753673;
        Thu, 12 Nov 2026 07:02:33 -0800 (PST)
X-Received: by 2002:a05:6122:4d86:b0:5ec:d5e1:ee2b with SMTP id 71dfb90a1353d-5ee1c4bb798mr2491992e0c.23.1794495741371;
        Thu, 12 Nov 2026 07:02:21 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e354b0sm106758475e9.1.2026.11.12.07.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:02:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 16:02:03 +0100
Subject: [PATCH v3 2/3] arm64: dts: qcom: msm8996-oneplus: Disable
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
Message-Id: <20261112-display-msm-of-graph-v3-2-7fd0c06ec6df@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GCFRCKJTBF0tDduwhG+AEpuoFlapsyUUwKoJTS/2B/I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9dTw/N/EMo0/73D9HuBKXPhSALwVSdxATrsmZ
 oewOiIsNX2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavXU8AAKCRDBN2bmhouD
 18UKD/4woiD/Ev4qypVFuqNMNuCXZI3SbvQm8sS+F7CsHrUisNE6AZhRIMiocqt/yfQk/Nn/dR1
 tCdQWwuZujVtx3NiSUczQKSVReKIAz/t1UomCrIvzO5o80YD5OYawjUF5d08u/ofOHOyEYaKavd
 5M7af9hvn/PnVzs1wQjrAw2ZmjQmZu7HFW069FaRPwm7bc5+GMMHRP/tIqdhMnSRunCywgkILLI
 BZ+sfDa/6ViK0ERYBB3+UqLrlFu6bQT2fHMmwmGcg/e347wUOefYaH4NGNgPvvD6MqrsM3UHeiE
 czB/RIqnkqPRTEKTB8lV2Kl4UaepC3biqwLLr+Yvl31sv70NNUzWzqR8+Vrg94vDAqa6Jyz+tR1
 AZSWWEI2WW0h/9VJKRTDhTa18+Fobtx2Ge26+eAH0eBO16H/Krh37iquAq05kl0Bt34XSVBRxq+
 cj3wsb4brSj/+95kezwUR6wGW94e5s36oX9k7eGDSOBePFTXDGwLgRGBBInRUuSXre96KZxs+HT
 vLDuzJ8hJSsSqjgKwKXbbSw0bbO/oza4PGLS1UpNYVpyVGWeYfh+lEKBhDl4xndtjKhtQpBW+zy
 5FEBS+UsVh2s84doqXzZZjrrCdVA3AK/mNHmyr7jcK5X48KVjOjG4bT6LtNSIZtSBHSM8RXNYsG
 lKvDey+8vtsG+RA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: OMoX4pQgt38Q8ZGcWTplyTrD3-I1dE0I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1OSBTYWx0ZWRfX9cxFx/PyAPPB
 5SEtvS6TxNrlltM5Hxv1OmX+W0WR0GG3NALU1wTdUMFUS/DeY5Kmt5YmPBHN/ldcCmKriiSISbx
 qQbHmS3oNeEReFXuSCIKmgfJFaTRTr/xCfelBm4poOWn2QQE2S72Gh7yPM5J9moSV4q6RXh+9jl
 MBPbKULRgulE16haf0z94D1Y1XGEMSzQMBFkx8TaRN3bw8wRkuJCywT7QDhjl8VbY9rOj1VA1vy
 OSYzLIoOdPP2nnbe7DchFOV+JWv4Hyf0h3zHDoKdPX4EfDDNIFzNHe8JGXXwJOP/F7AFyXoTzZw
 3bQ6bM00X1zs0aQhbm6HvOzK0H2f15T4pbuCeh/xu0sLqIufiZayiYQHvknCZo5VJ5fWkcRf7YF
 SeI9tMrPYJxOplmzL9DpC8jKFAFjZRhhcXH1o+iydOtS8huJv3e0eVztmDq8d1C9pudoclRhhgN
 THfgADCFxSNLgLO2pXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1OSBTYWx0ZWRfX0PxczV71pTyX
 Ow2weYmoRdYI55Z3j/sSJrm/h0S8toKDJanXEvbD4SYEaVcQWKoo9W4K4qRbGjiOw4iT7NMw5Nb
 Iz8z5pfQQM44RsoTG0z2vPY+TbBV2Qc=
X-Proofpoint-GUID: OMoX4pQgt38Q8ZGcWTplyTrD3-I1dE0I
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af5d50a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=eMlgcxtRJz0w_Lr9rQYA:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120059

MDSS DSI and DSI PHY are useless, when nothing is attached (no panel
description in DTS), thus should be disabled in DTS: no bridge will be
registered and no component device will be bound.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
index 7a3f8afae22d..9c2cef11e7a9 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
@@ -189,7 +189,6 @@ &mdss {
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l2a_1p25>;
 	vcca-supply = <&vreg_l22a_3p0>;
-	status = "okay";
 };
 
 &mdss_dsi0_out {
@@ -198,7 +197,6 @@ &mdss_dsi0_out {
 
 &mdss_dsi0_phy {
 	vcca-supply = <&vreg_l28a_0p925>;
-	status = "okay";
 };
 
 &mmcc {

-- 
2.53.0

