Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587972;
	b=u8c8UkQqsqMA3o9SWpeLT8mu49HmIgU5eiUD/j+kplt8Y1cHCvdeywwwgMlG+w7En3iC
	 C6gY4bKG0dVnZk6TrPiUxQLq20xTgCqrutxZpAiZy0I8zlgEmsxx/AOxbmpeFKG8Q9aJC
	 dq8RxeLAqsOzf8RDG7zFf4Mfm6vU6OTN9XwPZZUhfXD40jFn80w4F4CwLjbnSWtWeo8BM
	 oAJrol5+QidlCVQKyQuIEoO4CMN8vF4HR1fadG016rB5LL/MjgGW6BbzBVQIxQ4sGczvV
	 ogChF9nt/tzLxHzvfD3+C5w+8pZRn6skUfu0jkIJyJqKKGxVApT0f9O+QpLBwlADnOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tpkMZps2nyGXi+MPdFo0uI3Cj869EiAm6WEcBROZVVc=;
	b=YysWlrKc2v25hjBYavLCffCpVy/k4JMIiF09uDMQn/EkUMwk6//0jQrFlssV4+QLNeuF
	 uMamusKgRfQG+NEatxTh36OcvwROjDsbdQiDz2FxGsNXTBxVHMEiYtDE0Li5By7KGMD/D
	 al4/137wq+03IXOyVI4zAA8OqobvkbJTwK4s9aiwGGDoNqCIJOxnm894P8SZAN/MJqBqm
	 e6Hwr5qkQ1N4KXPjCdx3Rf8hlW78MAGJV2GVC3cQfsy1GMwcigw5u5fi/aMrdqf/5zaDn
	 UKN/0N6+9veRMqMbtahzSHBivlLDpJwS4BbpD5mb8VTBoIn0iR3wlSFiGbclmqhQBLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U36xRLEB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GaUMDHiu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E94606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74E94606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U36xRLEB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GaUMDHiu
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP69w211006408
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tpkMZps2nyGXi+MPdFo0uI3Cj869EiAm6WEcBROZVVc=; b=U36xRLEBZH1IKOYE
	Jvt0zEreLrjS6TWwHMcY5ViNCtNeo7JV8jv39xKFCArMH+Er/3fwKIeibGzVK6iE
	ywjSOPbEKnD7/PagHimgKuq5AEf1L+TNGN+neY/hPe1yoBrmvtYrTm3s9Rt3UMmv
	JGdFngJ7Do2DTKTKNbnBnxDV+NIqSTauyoWZFRRDKRGEmZqOENNYU/pdUIp3PgOg
	x57+W/iD2h8zx+L0N0gpvsUpoOcHHm1yS0mgB2eJqvTG8PrYM7D0RtHftwmWCTvl
	umkdP10whpHKsz8OktKaluz8VxdIoPf5Hf2G/lJg289FTiolguzZ+j3Zs+gcnd+T
	/HSVmQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa28nvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:26:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb8e8bccdeso2761030a12.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 22:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795587969; x=1796192769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpkMZps2nyGXi+MPdFo0uI3Cj869EiAm6WEcBROZVVc=;
        b=GaUMDHiu+6ab/RYzVW/Wjh7khqG0BxjUIvtpfv4rjkIw+SjIvzNIY5YVrP4IzVTcqS
         bsN/zP+G7jetGIJqIvK0Vreo/VmpROYb7eWETzLZfM/Ai98q/28l1gQ4nJYAKtif+Weh
         KsbEior8kqUqf4xH7kNQDOmAgdUVLWJJCtnLjdlTmzmHDQ6keN91tsd7PYI50Oez6XZn
         vgcyDjdkzwNF0sGMpvftoMyD91C5gvI2hIJ7J2MaYH7bWKylFlIm0Y/qd7/rnj5ppDgz
         QTDJiTOGMAUkUePq47EYk9rDqY1VBIEXc3RSz0k2pDVC/HPidWb4ThbPen6x0fWArmlj
         iBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587969; x=1796192769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpkMZps2nyGXi+MPdFo0uI3Cj869EiAm6WEcBROZVVc=;
        b=1/hmwekcKSKClRrG+6gCCftY4RyoihNFr7KJiZ3p8sHmNgCgegWryxgcYXivfvr7mT
         OHA9gyN90mE3xriR1aIIugIoLunOI/oYXMGejzBbkyD74SRypCF8RXHhHD4ub8kw1/zI
         Vfgm4BQ2E18UaxTqTrAUqMUrGGxeGrl8dVEM6/0xp/bsUZQ7bq7giSuiNb1EoH5yew1z
         wPVAiiCV3pUcqC6MNYOOe/77INxRZu29PAdHvSL2yoa6gXbQ0i5Kf7CTZibj0+H4SVR+
         YJ1HV3LMxZXCfVLzAAM7+oyNjCzsImQcQKu7o1Lo+vo9CXJoM1ouFeQgvj6McpGTxfO6
         QwRQ==
X-Forwarded-Encrypted: i=1; AL+hErHRD0HoxtdnYQiM+2pNgXVoFLms84vt7WFX9ODI/W7aG6LQdYU+1ZopsaqF/vt5r8PCtnsveh41AY8J@vger.kernel.org
X-Gm-Message-State: APuU4Z8s1pPMbieP4U3TS02jxboMsayejhPYSqrqIzjALnk8BmJgG5AK
	3lwmpUj7O1ZhCeVqoJfucw5EoLlODoFAgAO1N7oUb50rgwO47q8jp/3Kurnr/D5rTnsKX7zJOCq
	pDoivr0Lc3EcNx4MI0JwniJN78Gq+AIpLCtRc7q7bw+O9JJ3hlTvzruZUmrOzcukz
X-Gm-Gg: AZFdTZeUsZF5TSkmERhFMqJWd8ywBDQDUo/mAaTZUMAuBvtHdqBhd92tF8IjRqyWFSm
	ikawm886w+KFRnVg7xzxwmNJ4iBWDWsAJ3CbYlX2qv0X9OlqcdYmyJjpW+ddohiRa+k2vfOQm8l
	R/RYROXF1vi0bXx2My5RfvhphXP4sxaZ8HyZSRtufcuOAZdZpSCmbamuQDhAVzpYuim+h4gHKve
	eQISoz9XoE9Eb+6eDPZMIUX1eXyTtVN5tZlTDD1WWjBEGRZtYRLKG9pemObHZnh0GcWPShYEyh2
	gHzHR0zMCjWVOhbTMwMtpsaHY2FT2RzgzfNNbo2/YDzv1pL6AvOcYwV9aNr/kimdapQ4wmcSFhH
	ZxB1FXAUpud2Np9XDVZUPsSM1OqROdFsmGgIHoEEbNP++NDD/udhEnSRyKjJC2z+HR7KpU6aOU8
	gAdVYH
X-Received: by 2002:a05:6a00:27a2:b0:89e:a4f5:3f1 with SMTP id d2e1a72fcca58-8c87bdb42e2mr15005215b3a.15.1795587969151;
        Tue, 24 Nov 2026 22:26:09 -0800 (PST)
X-Received: by 2002:a05:6a00:27a2:b0:89e:a4f5:3f1 with SMTP id d2e1a72fcca58-8c87bdb42e2mr15005173b3a.15.1795587968579;
        Tue, 24 Nov 2026 22:26:08 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm8385066b3a.2.2026.11.24.22.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:26:08 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:55:43 +0530
Subject: [PATCH v5 3/3] phy: qcom-mipi-csi2: Add Hawi support
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
Message-Id: <20261125-hawi-maili-camss-v5-3-1483b7f68dce@oss.qualcomm.com>
References: <20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com>
In-Reply-To: <20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795587942; l=12271;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=Yo9RNqc9VV7vAQw7rCz10bdDD8C1GzwjSffrA0C27bw=;
 b=jHPUEI+HIKYALVMVNKjn8u3uNn0bLlhxN7Yt0H+WRyrI4ky7AVZwTQMPgPFj9u5UnlgmeD9kh
 YeCahhvxILuCL3EvzKIePrpLbzd/h9kOgpaZSw8vgwyOXfbDMt98Ptv
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: -jwYKx8N4uNckB-EPcYPfBMHlfrguCSv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyNSBTYWx0ZWRfXxby67znpUXPz
 SEM5GbMqiW6iehqTxrdNXs72gZlTAwhcrXyxukShkS4gCXuqUPwQOaV69M+46ffqyed7iJKVsIU
 Kurf2RuC4izDjlAOwn5Mxh2VvfJf4dI=
X-Proofpoint-GUID: -jwYKx8N4uNckB-EPcYPfBMHlfrguCSv
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b067f82 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=vXeXF_wiGkNwswUzYdgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyNSBTYWx0ZWRfX9gFdPH6rXc6x
 wBQTe0kccZges9+vLkt0fxvHQVMdARnWN2OEzKWy4BqQNMQH72sYubCsFohlD6X77LrXY+RszWo
 2eJ57vjo6qCrT8ss7yz9sscbbo001UkEgX4ksqAy5rmluEODz5QcejejdUbkgtMb5calA8icIhL
 zsrvSK1kFc/82HHodRMrt/Fu6FGuuKLRzxO82o6SLFxeYYSOsra+MJng5Nh3krr1yR9SxspXNGU
 5/Q8qfPf6ShjOD3+mUh5JptXvPuE1fscYLryNkmtUg95KfAGtRNBqMvUMCYNn9NGOZTddQ0v2Jm
 WWsTKVnYdklz3fDdNvJlMyDr638f5ixiX9MDBrzOvE9kw06MFHW03IWugUTtJuF6Y2DBdTef95C
 vWmIPqlEfq+hQtkH+lcxeoLZuKKqSQlfje26qfTuHifevCa4ZS6+yvh7rerrSYitTtQAylD8qlL
 2o6RBoNu3fMSLPGkz0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250025

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add support for the Hawi 2nm CSI-2 D-PHY.

Reuse the Kaanapali lane table and adjust the data-lane CTRL0 value
from 0x8e to 0x8c for Hawi-specific tuning. This prevents potential
stream stalls and SMMU faults.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 136 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   1 +
 3 files changed, 138 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index ed40934d67eaeba0c6ac7ac75324ac6292fe7d9e..5d91303e0df2e8c5bca3ea8fa2bb831429a8f1ff 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -162,6 +162,126 @@ mipi_csi2phy_lane_regs lane_regs_x1e80100[] = {
 	{.reg_addr = 0x0c64, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
 };
 
+/* 2nm 2PH 2p5Gbps 4 lane DPHY mode, Kaanapali table with data-lane CTRL0 0x8c */
+static const struct mipi_csi2phy_lane_regs lane_regs_hawi[] = {
+	/* Power up lanes in 2ph mode. */
+	{ .reg_addr = 0x101c, .reg_data = 0x7a, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x1018, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS },
+
+	{ .reg_addr = 0x0094, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x00a0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0090, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0098, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0094, .reg_data = 0x07, .delay_us = 1,
+	  .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0030, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0000, .reg_data = 0x8c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0038, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x002c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0034, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x001c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0014, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x003c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0004, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0020, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0008, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE },
+	{ .reg_addr = 0x0010, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0094, .reg_data = 0xd7, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x005c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0060, .reg_data = 0xbd, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0064, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL },
+
+	{ .reg_addr = 0x0e94, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0ea0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e90, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e98, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e94, .reg_data = 0x07, .delay_us = 1,
+	  .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e30, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e28, .reg_data = 0x04, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e00, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e0c, .reg_data = 0xff, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e38, .reg_data = 0x1f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e2c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e34, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e1c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e14, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e3c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e04, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e20, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0e08, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE },
+	{ .reg_addr = 0x0e10, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS },
+
+	{ .reg_addr = 0x0494, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x04a0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0490, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0498, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0494, .reg_data = 0x07, .delay_us = 1,
+	  .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0430, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0400, .reg_data = 0x8c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0438, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x042c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0434, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x041c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0414, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x043c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0404, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0420, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0408, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE },
+	{ .reg_addr = 0x0410, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0494, .reg_data = 0xd7, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x045c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0460, .reg_data = 0xbd, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0464, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL },
+
+	{ .reg_addr = 0x0894, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x08a0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0890, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0898, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0894, .reg_data = 0x07, .delay_us = 1,
+	  .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0830, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0800, .reg_data = 0x8c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0838, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x082c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0834, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x081c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0814, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x083c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0804, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0820, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0808, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE },
+	{ .reg_addr = 0x0810, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0894, .reg_data = 0xd7, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x085c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0860, .reg_data = 0xbd, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0864, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL },
+
+	{ .reg_addr = 0x0c94, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0ca0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c90, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c98, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c94, .reg_data = 0x07, .delay_us = 1,
+	  .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c30, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c00, .reg_data = 0x8c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c38, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c2c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c34, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c1c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c14, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c3c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c04, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c20, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c08, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE },
+	{ .reg_addr = 0x0c10, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS },
+	{ .reg_addr = 0x0c94, .reg_data = 0xd7, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0c5c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0c60, .reg_data = 0xbd, .param_type = CSIPHY_SKEW_CAL },
+	{ .reg_addr = 0x0c64, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL },
+};
+
 static inline const struct mipi_csi2phy_device_regs *
 csi2phy_dev_to_regs(struct mipi_csi2phy_device *csi2phy)
 {
@@ -374,6 +494,22 @@ static struct mipi_csi2_genpd x1e_genpds[] = {
 	{ .name = "mx", .scaled = true },
 };
 
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_2nm_hawi = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_hawi,
+		.lane_array_size = ARRAY_SIZE(lane_regs_hawi),
+		.common_regs_offset = 0x1000,
+		.common_status_offset = 0x138,
+	},
+	.supply_names = (const char **)x1e_supplies,
+	.num_supplies = ARRAY_SIZE(x1e_supplies),
+	.clk_names = (const char **)x1e_clks,
+	.num_clk = ARRAY_SIZE(x1e_clks),
+	.genpds = x1e_genpds,
+	.num_genpds = ARRAY_SIZE(x1e_genpds),
+};
+
 const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
 	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
 	.reg_info = {
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index 165e3d026872db85e54a99c5dd25ca68a1a4e450..991c9e8a29226ef150582238eff4bdbe4836ecf4 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -443,6 +443,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
+	{ .compatible	= "qcom,hawi-csi2-phy", .data = &mipi_csi2_dphy_2nm_hawi },
 	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
 	{ }
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 832c8d048b77f6c821180244220904815be756d5..01636df3c07dda9ca9c7e37c0bfd892bbb6a1304 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -93,6 +93,7 @@ struct mipi_csi2phy_device {
 	u32 hw_version;
 };
 
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_2nm_hawi;
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
 

-- 
2.34.1

