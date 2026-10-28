Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200889;
	b=X1PCV4Bl1QseVF7IZb+P6wSDuvxjUc62ypLbNZca/34b0gUAidCOLgLJfkBVPIxgE/l1
	 RF45QYQ9R+4PftJ2FeCpWCxjpRoouB4eKcg8Bab6lUS7Bje2x55sJud8tc4CBf1VT5vY0
	 8Hb7gSYdpj8rNNAleOi82VwNUREshORs1jWJ22vOvOBUyLkbtIyupxnx0SBpxjSccburH
	 THbINJNSNcxbWQPisaEuG8FwzIFagll+5iz9eojl1lqYqX4ufQBnE9tVR9Z1F3P5oIMDp
	 tMYdZ9sJtsIeu4rvVr92EwzSvTrkH3HBT9MO2QYkK/rdzk6zZzzH6Jw8sLod3OWJ6HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xDQYtF8k8ZaWbb7+5j3FW9elWsMzSAcqwviqB4BRnpg=;
	b=GGiZb1JIj8yPUPT+OYKr3/KHxGYmK0QKNm9qlKyCOAw4nBEKG0qrvbC35VYW+1ia11cW
	 RuiQY4OYZTEfXXdh/aC0sR2korV3Q9MGP7MGiOTq31w2yUvRZxDFrukAiBUKnKcfQiQLx
	 hjmxLxJYma2/JTfPQcSmit7UueMyFGMHf4yxV3E/KQ/1/VS6/JWv5UXNWTqoIbyVLGj2j
	 SFXz1kJ74Axj6COFy20Bbn6kUTpgqRdh1AQGLKwAuI/JKaoxw8iv9mHTfyPS6cPaFHsJp
	 5P1/XkgmAJtaXQTFeL66h4Ci/7WVWhbKZvGvQ2ykto3WFTcxBG1oiZhhKvzUicYzQzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="HuE/je94";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hFHBlnJx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652AD606A337
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 652AD606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HuE/je94;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hFHBlnJx
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFB5cw2070773
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xDQYtF8k8ZaWbb7+5j3FW9elWsMzSAcqwviqB4BRnpg=; b=HuE/je94ZcOYhWRc
	ghkn/2Qmm/8QFtNHdl770cBwJlasdQH27/aw919vM/IrfvXWHt7bbiMi2Cr3l+5F
	nqOgms7g1wpfHGJJpNNehwH+csbph54uH8aEO4nG4Ej1t/lS/Dq3UTfKa7hSl10z
	dfiGUSHwtnfLw+yEC2QvGOnUTpbZjQVLO9dWD5gSSSvkRkCjabxm6E4lYSIHXpXL
	14O3ZcYxOhwPZjVXualqXskPA2FfcfY3EiDrQrpFaWWAu8+Sm2y8bqAr0oIvVdZV
	RnIpqY3U2lZv5EfW/caRhgX5l/Tflc+IfkdFhOpQ2dzD2c8X7U7FouPUMn9iqjUg
	wWtGbg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7jvaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:21:28 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67686ccd1b6so45750d50.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200888; x=1793805688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDQYtF8k8ZaWbb7+5j3FW9elWsMzSAcqwviqB4BRnpg=;
        b=hFHBlnJxLJuofQKH7JwhJyBJS2gbVj9sZ1PfWKb3brbJGdXSRopYMr/oPXpl1WeCNK
         XUYFMWaFwJH48dwzFV1CGxHKnIMJU9sy4bpmE4JZ45LQ7zNz0QEGBN/5QWAnTTBuwtxC
         VWkZ2BDPO8lYSm3MZCpaiWBQgxUvfJm4iuYqexpjH9Day7neqLCfj3VuP5EQ8XeuwTsP
         sBDIv6rRGpleWd122AB4DI5VC+FIrhYRV2LoebyAj9S/IUgG926pNipjD7ibHE40LGDy
         ctde3VHh0xEUFK/g6wYRq/NZW2nxVl4/5SQrsZxI4oaazZj/8miO1BLd9G0HUqWMta+f
         GUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200888; x=1793805688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xDQYtF8k8ZaWbb7+5j3FW9elWsMzSAcqwviqB4BRnpg=;
        b=2UdGiunYyziqdgATU+rYcBZiXYla17iarjAPQDlEswb3mMQ9x5h0ueHrwkmkPkIhdG
         F66yEylhSzqLnxr5k1SEiWyZDXVRxh8pRF450zM+AGT4P/gVtP9dJsZ5Ddg0EXway9YG
         7HHQpbJK0T2NYt07CmDNiZ0gFuoAKZhGqhg37xWNF71oj1BYpeUSB49fnqAj6F3ywiDc
         CaKlXeedZKVduqoe0z9GTcz5W/ry4+zu6X9zGI5XFecc/by09PZ9Le87OGbdopvL+WoS
         AnKQzGe7JfzUz1juS/RndTxUffpnO4esxAi9q+pDq0QgcL7LldHDOc56nKChPwKH4kmJ
         BK1A==
X-Forwarded-Encrypted: i=1; AKwUvBxrcb17Q55g49Nq+6rE6wuRgYNxyDFsDCsLqmVSUJtM+NgzjEIcvS09JHark/5APVpixrMqtlv5wZIu@vger.kernel.org
X-Gm-Message-State: AFq9FYJtoyu1Ae67bZN6cLFamohWnR0Sk3oqsfCz7QsbLTgODbn/xKLH
	D70rm0NmOt+NnqUD/ZEqvWrZKos4dZMZ9nOfR+UyZ3nT/BxnRA0a6u5LWefoIFXqZqVfc7FqzP1
	Vu2tFO+yD8K4p/oWRHTEZR+HsIIVBdq9L1fCFboR5j3Q+4v54M5rGOAeE72ksCEf8
X-Gm-Gg: AYBFou2jyfHjysebJBdn1+z+XNoWAtFFAiAUczHbKoJut4FpUNGA+EsQtjhC5nla4XA
	dV3BYPWoyDP/v3psq6LpiaqJ5QrFxg3YEvr7Iq0Mnx5DjjtIEJMl0cbksBqdlEOKGuCwD6+eMNK
	w/s+RH1I2EZnBQwk4wPRWYITPHNItaorwAssyRIdGopmoHeW/RonxFiNuXmK/uiDccELCM+z8A6
	r2U/61v4+fj3gCdsmJF8eJgXUXlCE3VixsiZGHVTBJk9aBzGqao2zW8YAeeb7zhsLv1DaHazmlA
	BG2ceVa4VoTiWRpOjSQZlXdUcq0VYT/4pkO7FVCsUWb67H3FuEW1Bavr6aVkMixkXzhJEGyRzy3
	MPdOS4IawoyasCrk7+nG4Jr0eW2Srhq2OtwuW3n8mvFr/fcP7LWEEFFoFqwhx6e0Byz397E/RZK
	MOq7hTlHWApqjPQgaxuc1ny3blguzRBwAeOUOC4FbZGWj53SU0Lr3MRm//qsVh
X-Received: by 2002:a53:d54b:0:b0:67a:551f:920c with SMTP id 956f58d0204a3-67a7bce22d5mr1623169d50.86.1793200887768;
        Wed, 28 Oct 2026 08:21:27 -0700 (PDT)
X-Received: by 2002:a53:d54b:0:b0:67a:551f:920c with SMTP id 956f58d0204a3-67a7bce22d5mr1623121d50.86.1793200887107;
        Wed, 28 Oct 2026 08:21:27 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:26 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:45 -0700
Subject: [PATCH v23 11/15] media: qcom: camss: tpg: Add support for v2.4.0
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
Message-Id: <20261028-kaanapali-camss-v23-11-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX/gmCblMjm+zj
 vF55z2eh3ZKt+ZONb7vGAHJMM58CG4gVXffE3ZgmViNKhALdvOHDZwKTIYOq5Y35o5uudLgBs+d
 QIz7Ii5K6KiCuGHzIcdCiGyY8J9q3Ms=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae212f8 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1CCqUJFLb0VynuEnu9gA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: nW0DcY2vRGXOu46DAFSaNPuKOAWRITaY
X-Proofpoint-ORIG-GUID: nW0DcY2vRGXOu46DAFSaNPuKOAWRITaY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXzUWzkmAk14p+
 uLjHsvPap0AASfoZ6DzbggBu19pzgopACwfM+YW05N6bMQvAGUh+ChMsKe0L9bogz+nmd8TjBOB
 7oNx2kHojPqsNYG9GAgZrp+XjwV68m7qup4Bm7bM1WJJGrDn5doMg6ek2O6bJx6x0TiemsTtTbh
 pMigEvenNpw3NeweMeNpMaMM2Oof5ZDS++r6WWSJatsws7MNxuaB7oI42DHvZSOiJWnbnE4HrSh
 /37iXTTY+SI4PCJJzUNObeB4fGdv+MiPzynzqHQDDJW2VbtaMd08uu2LwjYKjVElZPc8LYUkJDc
 H6SONTXlhejx7VLwx7Yswy1pBWfynhnfnosCLUWNavC6Yuz7ejNgBsiGObc5sc/IGT5s+83GCkq
 DIjeOiOah/Q18Zs4Zz9XOAdOB1zhTxUcUVCjC0xiMyZLU6+mkAsWqjDtrXfJkM+35qIJqqogUKT
 PgDqkFEMfVshWDKbEHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through the
TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
the data source when a test pattern is selected.

Add the TPG resources to the Kaanapali camss resources so that the TPG
subdevices are created on this SoC.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-1080.c    | 15 ++++++++++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 23 ++++++++++++++++------
 drivers/media/platform/qcom/camss/camss.c          |  2 ++
 3 files changed, 32 insertions(+), 8 deletions(-)

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
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 6ff82dd2aeaf..df4b4cf30711 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5850,11 +5850,13 @@ static const struct camss_resources kaanapali_resources = {
 	.pd_name = "top",
 	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
 	.csiphy_res = csiphy_res_kaanapali,
+	.tpg_res = tpg_res_x1e80100,
 	.csid_res = csid_res_kaanapali,
 	.vfe_res = vfe_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
 	.csid_num = ARRAY_SIZE(csid_res_kaanapali),
 	.vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
 };

-- 
2.34.1

