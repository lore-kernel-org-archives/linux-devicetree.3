Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722FB46E01D
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091269; cv=none; b=YlQ9ts62M/UayLsFgdojE1XYfK8ZCL9xbrhTXcxmGYI0IJq2l6yOZIF8edJwg0Hj8Pjv4HQGuUgP1YpwNTmrhyRfIzrkxz9DppGaIHkn1bOuZbGR0yQaU3J3lgr0/McXH8Xu+93EahytYY5T7tHhawOnga6/rDZl0vjR37MfHJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091269; c=relaxed/simple;
	bh=K4w95+ap0YDcbtlEGs8UmX4C0CaL3V4R8uv+Ba/Z/ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JT2MtrIhZH+qQqkvTMQIKicevISgK/uN0Px6DqH6NVUEtrAzZ8XbbaibRbW/g+F8Q9pYoKpq/YY3ujwBRUWcyc8vN2RKPn6mnpnVsOn36v/Ju7gvLJg+1ydlokHjxLj5825vfn9GBzfpa/a3zGgGd8J++ShfLNikn1dj0ayKgRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IrnZCl8K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VkshirSU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IrnZCl8K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VkshirSU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777qdot3177110
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 08:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b0vUf69dAUlWpMUeBkskcMEXTe8h35j1hDQ0TWVCPDQ=; b=IrnZCl8KjDYrP+wC
	wD7OuKrKbpjLr+8Q2nBOWLMaaKGEaNpccAUi0ZCXTTvFneBr8hTLxdEOSGgIESgw
	aDObBdgab+F2KzVW/0m7go6IMmAvP8gasqmf2kIs7YP7E7HjaST/Fd+L2ZBDyw9n
	fZT+yf7m28W3f7joXo/lAjeCoxrg7xxaFbXNwwBQnmfyobhLZK74Z4zPr/Dj66p1
	X5DxHivmAFacvAeGYrVyHgxFz2PtnPeJFpEl6T4wS0SLQTStSCV6QnfBFVNLFuz+
	/QIRLPGy1A2YtJQP8pXbG/gDIFlk0mBixBzv24blLqMegZl1+8sYvsJ87FQIE3rV
	p2ts3A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jjxws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 08:27:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbbb9c9bfc3so1930698a12.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091266; x=1786696066; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b0vUf69dAUlWpMUeBkskcMEXTe8h35j1hDQ0TWVCPDQ=;
        b=VkshirSURhZTvNJkuhcWYQoAWvOcC2iySb9kjFKhKgYtaCkjVDweRThx/qDHCIZqaj
         1VOBQ4ipK/DjCMSHJcA9LLFXrB0icG6pycxSem5GJfxI2QxWfaNAMCnFT10GI6BI9gCy
         SIZy0B7OSFow7UAQxOpkO551s0TWP0roYefqzqiwv3qxafpqaJ+Sa5Boj+Yx/Z8WwpyV
         mGGLr1UeUAK864VbaGdmfW/1QdmU9wLx/M5+kmZ2Sub76sIxpnL+oeA5enuWZcPRefWP
         4koWydkvNoxsMFraZauaLlkHF4zy/rWG8N30KNvwvdbnhqL5/mjcel9L1Mi8Vo0YXXrV
         EA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091266; x=1786696066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0vUf69dAUlWpMUeBkskcMEXTe8h35j1hDQ0TWVCPDQ=;
        b=p58gbMzwE75acqpGEZLSu6CT8YxKrHHQoUO1nv6eCr8uwc4MACIS4qA1/kLim3QU6e
         lUVnUWjn0DX86JH9rvFqGmuKfJOHS3qflLfrm7ip1sgdTRmdEn8VJu77bu3NFgnCeSvi
         P8aDGnUvc5eB8N6UC7F4C+dSuqcZt7GC4fLuMMv0/RA6f1U/vPuLrDk5ck1hevU0zWuG
         dGIUP5VaKn09IV03e/5ndUi2i39GRh4Jh5Fl+YtGUfjactdLaLUcBKd13gv+lt/toUb3
         sE16M7xuUgEVmbQgF5y4/c63EPR/U/Xb0SMTOTKHNrKPWD86NZkd+ElxYkJWMaRruSzZ
         THHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrgBcsVqPr4yHf448DF4kGoBrL1lTpSDMSa/9qC5ffiC/o3BPtFlGOiJOzd0EYCnefhTW9Lm/JTGaiX@vger.kernel.org
X-Gm-Message-State: AOJu0YweAhcs8tf+ySR080I4HHTH09kNjni0RCLfgtoelFBGyOhAeaDp
	6RkHm5puu59An6RVou8Vl9bVRHwOcsgnY1CoTsJZXRoLb2eV7stwaCElU3HtN1eiWOy/yuU0fOT
	hPu61c9vb2I9evHZhM/HiUvAx1l8YV4j79lg5k/JMdSxAo1OsqYFgQCDTxG4NDdkG
X-Gm-Gg: AR+sD10vlnI3Wy6pCmKB64ldurPGmv4pxNln/O9hVZU6DbB3kqgHYrIRTRWqCqVh2U3
	yYAEE3+JUnm9OVgkfvoyU2MmcfXdllp3yykVA49P5jAxdtVbhV3mMQvpF5lwzBKjVolwO5lvAZx
	USlX4WHm9vOzLjj1JIYZMbm3i5jxHmCeWaxz1+2CuPXXrAAfo0e2iRXK10YgYunY5XiQK74jxuS
	IvjfNeXuosu0gQnb0I8Zu/WYeOK1YfzOXagVCzkDehdXpTmcBfjmgWqmVwsIKPwbCHyVTzLhGIl
	DeM/Oob3w+JePkKj81k16uU1zixnxvYSOAvBWJ3K9BG8wuerQIp8Q1UdWQBbbJCyaUXTf12ntUm
	U7mkcsd+R95kapFz17AVSIA/bkl2rauRtLaI=
X-Received: by 2002:a05:6a20:4314:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3cb85e62cd2mr24423067637.17.1786091265630;
        Fri, 07 Aug 2026 01:27:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:4314:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3cb85e62cd2mr24422976637.17.1786091265199;
        Fri, 07 Aug 2026 01:27:45 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:27:44 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:55 +0530
Subject: [PATCH 11/22] arm64: dts: qcom: sm8750: Reserve low IOVA range for
 Iris
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-11-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1890;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=K4w95+ap0YDcbtlEGs8UmX4C0CaL3V4R8uv+Ba/Z/ao=;
 b=ahzVezlPQazL7ZD5iBaT7//e84EJJqOwlcwZAFteeUQ1644/I1vn5gWEFAhpsHMaBaCqF+Hof
 uQn5Z2Mv5FoCkJQ85pWqpOIrAJvaEj39/p7aXQt0hx2+BPTwYc7pTo6
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX6mwhz9zpwrR9
 TYhAemBt5J4+vqArAbrnwJY8KF5ek2dD/Ssj03eSh5kecLDjeDnNsW+c/a3zL2Bc3mXz8ABXUi9
 e+bKaSA9sSnlNK/DafdnJkrs+msoBrpmZNMiJYGPKEbbPB0NcbX3PmBO25L2L5iDfAvu/MjYGdm
 1C5U2AmTNRIU29uznNW37fktPvvs74HCAT21sS773h1Hu8g++0HuVO+IlMJ/YyIoPaASkpFCYu4
 Gku4TeSki6nZnKGQhzz+gCbZgUJAyrpMpuG6GPq6Wr0xhxOiQSfw/0hHeKhfqEdKTKp6ShpHhMk
 TpL4Rv2UO8cS7UJZXllOu2iXlaL8aRj2daQeChyYabOPT//YieGT2COiHYsrmbtWw2y6E+QKd2A
 RNnftO49C9qeHiDASgefwDHHIA55tM0mCyv2iqAOs9QPpuhC0BOo3JKPnlGHioCccgeUkRDV6QP
 /c07OjZUVH9V1/8cmgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX32JvF/GuLy3p
 heGshRfAUkJwfTwZUFcC8SsWfdr4/m8wkJKzXT1HelG/4yo0OJHjq91JdXSGovvGHOI6JPs2hkU
 9L2EmM/sxxeABSBFWaxXyNbBD+8Vlw4=
X-Proofpoint-ORIG-GUID: MTcXz9ix3r6HMdnehE6vFalaeHvLmGfv
X-Proofpoint-GUID: MTcXz9ix3r6HMdnehE6vFalaeHvLmGfv
X-Authority-Analysis: v=2.4 cv=e5Y2j6p/ c=1 sm=1 tr=0 ts=6a759702 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oZq95A5y7fdjfYKW3kQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070062

Iris VPU reserves IOVA addresses below 0x25800000 (600MB), primarily for
secure non-pixel buffers. DMA into that range, from any other stream id
would triggers unhandled SMMU page faults that cause spontaneous device
reboots. This is readily reproduced with one or more browser tabs
driving multiple concurrent video decode streams.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
and reference it from the Iris node so the IOMMU layer keeps DMA
allocations above that boundary.

Fixes: c0d11ff90475 ("arm64: dts: qcom: sm8750: Add Iris VPU v3.5")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index dd738d13df8e04b0302c4b4d7ab21e318a9560a0..cf17c76a4a390b5f001bc566a2b96e30054f7da0 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -562,6 +562,17 @@ adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			size = <0x0 0xc00000>;
 			reusable;
 		};
+
+		/*
+		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
+		 * primarily for non-pixel buffers using different Stream IDs.
+		 * DMA into that range triggers unhandled SMMU faults and
+		 * spontaneous reboots, so reserve it to keep IOMMU
+		 * allocations above this boundary.
+		 */
+		iris_iova: iris-iova {
+			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -2970,7 +2981,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 
-			memory-region = <&video_mem>;
+			memory-region = <&video_mem>, <&iris_iova>;
 
 			operating-points-v2 = <&iris_opp_table>;
 

-- 
2.34.1

