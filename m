Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548058;
	b=5n7wHlHZNipi5VZNdBwyrL4KXjUEM+Dw/esJPu88xw9NQgLnfHMQ0MTKA0Q9FHIXdbNE
	 ik2LSQAegDGhVCMhrimmd8kfkxGYHkiBhmGsM9TvPmaaKC23TnQBYQxDIOeooObEFo5YO
	 eaYFfHO3n4IoFLKJew8LAro33dzmAXTP9sRfFWcE68AYYupp7jzUmtutLU/5KY+c0eD1Q
	 ifyNOZs2xStu9MW2bFHZIZ5wkhT9JwDzqIyelg4agoq5SphrKOSd+GMj+4Il1YLku/c5b
	 WFkxUkxTddxf0oH56kr52RVqecpyUzHMmyOYx+LKwV3BbaUKMcjNHZTLsR6jF9JpI6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548058;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UfrUK9hOt/DD1qcO1l/6d1YSHtiPjQ/MWdwV6QWZlzc=;
	b=ucmwMKdnelmFd8lAQQ9fT0lU5j2Ag7HNAlIN8EgO1pztKQG9v8p51NgEn/Uq6KBjP4y5
	 Nv6O6FE0gujAaACSNJ08WbGlbQcjCIMKfLSXctisuLRfXiRUUPT7abH4FFRpJfOvxLBTW
	 aWDkgVx+MWqDSBc77nLHDDHYpbh2KxBnfH0d69enyICx1P8ActG+Ov0MObc6NtchhWHwC
	 m1H+BWyQTGmlCjJfE/ANee7xhTQtB5+9GyQV9ve1OkAUqrIShThmTNm0K6R5zVbKJullM
	 ZYHJDotd60Fc3PJJCOJbF3RrUKkK4VRJEMx2RxFTu4IYU/XkWcNje8CATZG0+062QBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fHIbw81i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJ+jc3Tb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD7D606AD5B
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CD7D606AD5B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fHIbw81i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJ+jc3Tb
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57Cr23283518
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UfrUK9hOt/DD1qcO1l/6d1YSHtiPjQ/MWdwV6QWZlzc=; b=fHIbw81iwMhQy2it
	bkd/wHAssj89DQsLXxInoFda+J1uKkHWuAQD3YZEMUhMyP6HTdHH6+KRm9mawS1K
	xXU/K3I6wCg5tEv6Wc1EE/HVVxiHttTnaHS0j7nDEUkKsdxjvuen2fnKimPU14Or
	trhwUnsS0G8FQehA+zUA6CifYZATIGYw7UjhSNkbx7WlFScvKc5/7bIPve9gH+DN
	m5D4dP3TYoLB4g8sUiDfL4aT8cEZlK0yAd/Qdr0MvCVn4Xw0453ImJ8gX6Ok75UK
	2NKYlofY02mL7xSbNsuB8viddD45e7GGsoxTcTk/SbPWgGLRYLfTHKh4r9rVxmWI
	PFTYMg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37g3wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:17 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-47d75bcf3ebso627775fac.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 21:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548056; x=1795152856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UfrUK9hOt/DD1qcO1l/6d1YSHtiPjQ/MWdwV6QWZlzc=;
        b=iJ+jc3TbUwID+IqbZx5yMPcSYQC3XHH7UvFN1irgxNrooTaR20sYEpstUI4FTDL5Vb
         p5Acl7t3G0Dt8kAMirtsRw7IHRahtH+/PgDEFehjgnQGiUx+/4PWrKfUBTTtmmm2lijq
         UfGpvhbLM3JQtBSWxeBGAvZporkFU72ZbxPYlEzgl9MBKG0ExasEI82yyG5Y3fJA7K2B
         lBvLYYThornZTmTUT6TLMG3Lg7c6ahR2h8KYJHEN6hs6uFmrJNRoY1LiB7H2y1qtmOV+
         4c4vLMSkAudL1PzAuFqhO0xZCq99cwPWnuvaLSbVNs78BjeiS2I9+Rkvd461P9BanQho
         0eYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548056; x=1795152856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UfrUK9hOt/DD1qcO1l/6d1YSHtiPjQ/MWdwV6QWZlzc=;
        b=dyynmsKjyENg9zVuks837kepT7jbmBTOCEx8H5w5EO6P4h0Dp5sOYBtvrwYyD3TJFy
         m8wdUm69eYRzGRd5pnvVtbt7QjaBQUFZcCjVzRUEoRf8SnB1BEU6xCp8DamaU+vwtyd9
         E0U6yb+NNMsAE5AGdoSeLofqkfqte44rnFdjBgUJQg3ee3Xnxn/oPeHL47Agj5Jxqcm9
         i1C24kke4oMyPdc2D1esheCvGvlgG7rOOSL3XKWfqEGFYoJLKbXKnB/mN99NzlUnTFoD
         5HkLVW7J9A6RxHYnpEaK+WUR0Aa45ltDVm2kiagA41gIpAbwb8jt2tJGAggMPAcEH7ly
         ihZQ==
X-Forwarded-Encrypted: i=1; AL+hErGoRtwm8mnHIrTZkc1BG9Ot1E86p/YrjR6ODJZQR0vc6QYlXTZRuwB4jBw/kIGdIS+QER1bjKf9JxyF@vger.kernel.org
X-Gm-Message-State: APuU4Z/dtySmb8GEQaPwZJzd4j2RBf7ozgewtjryHvelrIza+zWg+C/R
	Q+AifdJpCMThB/HLK0Be0/S8eMxdq3d1frLL0ssHcVAGN5Pw1KIDacONQ6SiSSLwix7NRbl1wW5
	uGcIfFPxinNsxvMG8ia5a+CoYcDPSQcWaMlNq86UU7UGm8HQMAXBGwK5kotqbQgKD
X-Gm-Gg: AYBFou3UK5GQ9PUkA8yEeKslWDc0nLI3zcakdi44P0icKAGIIIvhZvb+P8Tm/Euo+L/
	sXA2K6Cj9iD8kd3m1xlf11I+7fqpC3PRWe8bARpvJkoo9umbYWYO1Pv95dqkAthoAbzynV6Hzoo
	25khC/h9am4ULgDTjh4H6kZJG1gQbOrFtYeQAT/Mp/uOwvcQVILYTcJntDsr+UxxFzxz5FxIZ6+
	071ZU0zplbv2CpJgsR4hpoxxNip+xr5g+W/K+dTlWjS/EYHwMl32qCfojq+LW+nwt71k/ZgoLWi
	TTgTNs8Xw7pQg5q7f+J89riXrVtztgdXlPZI8b32HKKCC+jf9vz70s4yjnab6snoRB+AyQUOohN
	8myCW+uKX138i/NXoGNQ8c32IgdLRKoz9lfzmPDos/kM+mp16bDdwHldAnrrzV5jpQNQw+mj/kX
	XgOmveLavA6xwWsg431mbTfZsMUH/n79t1neXXnKK5gLBHm97Uyn6XtdZnMsYI
X-Received: by 2002:a05:6870:21cc:b0:4a8:b12:79f9 with SMTP id 586e51a60fabf-4afdf480625mr1611291fac.46.1794548056334;
        Thu, 12 Nov 2026 21:34:16 -0800 (PST)
X-Received: by 2002:a05:6870:21cc:b0:4a8:b12:79f9 with SMTP id 586e51a60fabf-4afdf480625mr1611273fac.46.1794548055893;
        Thu, 12 Nov 2026 21:34:15 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:15 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:43 -0800
Subject: [PATCH v25 11/15] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
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
Message-Id: <20261112-kaanapali-camss-v25-11-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX9SDqwNCiDoQl
 ataEQW7jJinIWBPNzxOqrmiLOuX08/wKcSyejVxrErWTaLbIATFjeGQt25+wIRj+NAudmvdZoja
 73FpmR4oM1lHvobdpe1iujtb8QliTnQ=
X-Proofpoint-ORIG-GUID: q4-iThTe0kXMfxYDNB1GICxTbx5iFOBw
X-Proofpoint-GUID: q4-iThTe0kXMfxYDNB1GICxTbx5iFOBw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX3qd18Jhmf4aC
 80NooYbRR50l5i1CqwgwfbgFDM0m7380cNhHZUv2mpaHo4ro6XUbvXU8oAC32G8lQ/H6P4Gtsf0
 jus5oERK7juYnio8HLEHVj1Bfec5s1MfOJffIsExoOVl+GEeJ/CjARg9MRDAEDPvUu4WzC5Oatx
 eJed48CkhUAjdaMn/Q1c0JfJ1AyWwCXZ2NX1t4BiWkN/aecb5K71caEGeNbM7wDqW0NOjEOpv4Y
 5J1d1Vzvq8IuNOaDv35kLF2MueRlIoAKQdXgXv58xv2SLbR58EN5rXAABH4b2Mdipfngso1uQkr
 s8PQYkrHsBqPS2bIRvcCnz8tYwNcoC4wHt1+WEiUSo9//HcqGQXmSbNuEVnz8fJ22uU7+bH7YGG
 9XRJOYBJZXqjH2uiaQJOysw6shq+LUTXQ6fOCs031SXjlnMoI7Pxdh0lc1Jm8TYsO7XLZgBra0p
 1iQvoLX6vIUnG58deAg==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af6a159 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=E31TOhX9jficEpHhqf0A:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130021

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through the
TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
the data source when a test pattern is selected. Read the hardware
version before resetting, because the reset sequence depends on it.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-1080.c    | 15 ++++++++++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 23 ++++++++++++++++------
 drivers/media/platform/qcom/camss/camss-tpg.c      |  4 ++--
 3 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/drivers/media/platform/qcom/camss/camss-csid-1080.c
index 3d90d31201fa..ec56ba85a0fa 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-1080.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
@@ -64,6 +64,8 @@
 #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define		CSI2_RX_CFG0_TPG_MUX_EN			BIT(27)
+#define		CSI2_RX_CFG0_TPG_MUX_SEL		GENMASK(29, 28)
 #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
 #define CSID_CSI2_RX_CFG1			0x884
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
@@ -148,6 +150,7 @@ static void __csid_reg_update_clear(struct csid_device *csid, int port_id)
 static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy)
 {
+	struct camss *camss = csid->camss;
 	u8 lane_cnt = phy->lane_cnt;
 	int val;
 
@@ -156,8 +159,16 @@ static void __csid_configure_rx(struct csid_device *csid,
 
 	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
-	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
-	       << CSI2_RX_CFG0_PHY_NUM_SEL;
+
+	if (camss->tpg && csid->tpg_linked &&
+	    camss->tpg[phy->csiphy_id].testgen.mode != TPG_PAYLOAD_MODE_DISABLED) {
+		val |= FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
+		val |= CSI2_RX_CFG0_TPG_MUX_EN;
+	} else {
+		val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
+			<< CSI2_RX_CFG0_PHY_NUM_SEL;
+	}
+
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18..cabbb2638cf3 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -22,6 +22,7 @@
 
 #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
 #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+#define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
 
 #define TPG_HW_STATUS		0x4
 
@@ -33,7 +34,9 @@
 # define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
 # define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
 
-#define TPG_CLEAR		0x1F4
+#define TPG_CTRL_CMD		0x1F4
+# define TPG_CTRL_CMD_TEST_EN		BIT(4)
+# define TPG_CTRL_CMD_HW_RESET		BIT(0)
 
 /* TPG VC-based registers */
 #define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
@@ -164,18 +167,26 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	}
 
 	/* Global TPG control */
-	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
-	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
-	writel(val, tpg->base + TPG_CTRL);
+
+	if (tpg->hw_version < TPG_HW_VER_2_4_0) {
+		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
+		writel(val, tpg->base + TPG_CTRL);
+	} else {
+		writel(val, tpg->base + TPG_CTRL);
+		writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
+	}
 
 	return 0;
 }
 
 static int tpg_reset(struct tpg_device *tpg)
 {
-	writel(0, tpg->base + TPG_CTRL);
-	writel(1, tpg->base + TPG_CLEAR);
+	if (tpg->hw_version < TPG_HW_VER_2_4_0)
+		writel(0, tpg->base + TPG_CTRL);
+
+	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/camss/camss-tpg.c b/drivers/media/platform/qcom/camss/camss-tpg.c
index 3caa95819b39..e7216f7f9d81 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg.c
@@ -176,9 +176,9 @@ static int tpg_set_power(struct v4l2_subdev *sd, int on)
 			return ret;
 		}
 
-		tpg->res->hw_ops->reset(tpg);
-
 		tpg->res->hw_ops->hw_version(tpg);
+
+		tpg->res->hw_ops->reset(tpg);
 	} else {
 		camss_disable_clocks(tpg->nclocks, tpg->clock);
 

-- 
2.34.1

