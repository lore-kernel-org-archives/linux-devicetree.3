Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23CC4477F5
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787545; cv=none; b=JSTd4u5z/WYkgZefNORVeTVFKtL0PuSRrSF19bdfd/eRPJW/rNtCED6dUqDRLS2A6ctAzSs+j0hSb4SoHPQTVWm1bVXaPJMrPVcreRTLJ/7VCOmrHrG1zp1S+5xG9+vA8cLMHV8EngXxMJXlj/n21pgxPvKh7DX9u0oJeSSgvZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787545; c=relaxed/simple;
	bh=hHiwrXqK3bpFfMao5F2C/WNKOSpC7YZNrtW83sDl9Ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q90XHr8xIvR+NElPSUHkLt365HW8sHu57+xGSAZNdXfxPdtIm2h0bwHuTezB0kQvJEMYDdYZrxa1Sx4bYi3XcANWlZfb0PJvqCH5avyHvBF4tdoB6yzBvYQ6pXf0IG6QURe1vjDiYcGJxM4HLLc+fymIiolsY9wcSWQ/Bv+XPAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hwhjpANe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DaRqCFu6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwhjpANe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DaRqCFu6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55hTN750874
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K17dDzH3f4fqpVy6zPlp73eAU7GBBYYJ+Lmp5jaQ+k8=; b=hwhjpANesXXoLbRq
	h0w/Xlz6eN5caqwo52jf8GoNqNDETnn+mzzW9VukhqAYeM/KWM3QfGWCw8bj0mmo
	L9nqfn6C7EmpGYnBqEHqboPV8f4S2/jC3CDBuELNs0ph9YcyIy1PAFCtHtgqQnFi
	a+dJXyeNcLcTkzqLCdkNFXKEU3ZCQlWs7jkE4tfVYRqSzOcCx8D4j0GA/4xZfFKM
	z1WlX7BtFjsEfavrp9Q1F20+7KSkbJ+1NlbvmLSiNWI4GN9LXOEhbptaCKuBTAbE
	E2qOzI6Ib77/aKXSPSrgafBjRvWQaHPk5AUoHItwz1hrjGwfS1xMxsRZUeAz46Q6
	C3JnVQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4ed2m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:45:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-886129276ccso264072b3a.2
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787539; x=1792392339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K17dDzH3f4fqpVy6zPlp73eAU7GBBYYJ+Lmp5jaQ+k8=;
        b=DaRqCFu6q+RM8KwxAGG9vA8Vuzjy7R98EBNHbOSEjBgVpiwBDdRegXBDCXlsMXHjmX
         fhILcPTIx52Rs1+RZQiJljfA2k8ngZUBnZ+tD1dWRyq+HtIhp0j85Lkl1cu+578/br9E
         81uxE2fzC5IioftfqpDOPVtVKViaC6jgXjs7XaSEOuVQoKexX8gDP3EJlTYSJLUnpgME
         1y/I5qhf/iVwFXGOwzyk24vgX1ZfZRqcDrzfG/7bm8CiazslN/Nm/PWjxnVqg+2C0jJI
         Gc5u0vygFidLc2K9seq+SRFmZALQHhwWUDCFTOOqR+Hq4a7Mg0ZtS5XebXNu7YPOiifX
         XT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787539; x=1792392339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K17dDzH3f4fqpVy6zPlp73eAU7GBBYYJ+Lmp5jaQ+k8=;
        b=Xz9frtwXM4bxQ5EHbIqnmJM9nxzBc6xnLeupwIXa511RWiAT5TIL6G/AxcyKNmVfwC
         OZwd9Iol0p2f6f/lak6R8DndU6ZOq9fjlq4IYbtVNcPJ0Aqf9EY5O53cBQU6TmqlUbJV
         BUZ8Xc+gmtLi11hQifIUVaaoTmDSkNuHtj9Okw2WcfRSC8XRMQ0xtfRXEsV8eOHA3C4H
         nRVI8IW6qGu0DcUCf8HXX0J27WUe1QEqRf4F4nHekdjEnXtZMTkvjGe7vMaUDTQekJ7i
         V6lQHCmJQiKWorPENAtfy9Hh7sCfp2Kx+PtM4B3BO8ofXMeBtPK6rlb6hpRDE0UdNMJN
         2N9g==
X-Forwarded-Encrypted: i=1; AKwUvBz99T1tHeMMouDH91dLQzeRV2nDi4qFKc/m70yhpGr/1rs+mIPXdFsoX+cWcw8crYuzNml4L2N6NMf3@vger.kernel.org
X-Gm-Message-State: AFq9FYK+VhPo3/sny11FxaazMhFOitcAaG1XeB96o2UIrSZ+RlDV+obI
	45TabMAhOWeJiesuLnlv2X4N6O9sS+nc0LzjMeHBnfMZpBQKI1Os7fWW7f73NtXrjEC2HDmWyHE
	Byk+dichxHlQGZ+OlFQE7Lqn22R2vRiTW+nO7bG4MmBwNlWVnhj4ah6e+i7+ni1If
X-Gm-Gg: AYBFou2HNHC96SMSDH+5CCXoD+Z1bPF//5fE7mci/SExQgpu50Ws09Fi/DfAUdZz3oh
	eBX0VHQZ4KqJ6+j0gycD7ClTWQMDgF3w1I6NLDX1OrcS7x9Mj5U2s8fonNVZ8SGVKAqnTjfZ4Yu
	QVdswYgatTsGYSmssbyQlsCMXgjgvBZCi62FGoQx9cKguTtx7X3kWM3nnkgkFkivyrL+xCLPGGe
	x8/YlrcPJtqAimcgzXVAXTS+dzbLaaGgdIX5At4KzIKHqva77n2u/aSFmpazK+iX7AAhzqn2gtD
	cxY2BRLZkPuPSNRk10SP6jJCabFwtulmWBqSiexTp2greFZjpI1KxtbsTGmn51R0Bt/cJC9RvuI
	3oJ4akTtPnR9kJLCLsD9wGXZ5kB/kmK02Iyg9uxXictxvqmqGTCQ4X9zyAKqYubier9k/Y1yH6K
	EO0Fo3D/8YxQ==
X-Received: by 2002:a05:6a00:4195:b0:874:705d:f643 with SMTP id d2e1a72fcca58-897c77da504mr6260415b3a.37.1791787539063;
        Sun, 11 Oct 2026 23:45:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:4195:b0:874:705d:f643 with SMTP id d2e1a72fcca58-897c77da504mr6260389b3a.37.1791787538533;
        Sun, 11 Oct 2026 23:45:38 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3dc6c93sm3534420b3a.33.2026.10.11.23.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:38 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 23:45:12 -0700
Subject: [PATCH v21 10/14] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-kaanapali-camss-v21-10-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX+QqUbIlsbHEB
 mkmtCJqVN2so4vq41mfcSfL1wqxc2+HorCn34qy0GBil6pAeZM+Wg4U3wd8Zdba3h4Cfi9mcgiD
 /jzin19me5STATaNgArk/nF8Xg5VxFNqmZeCnbkNeg2H2DWRrHua3JVlD8PMvn2/RfjWBfgEDhw
 qMaZ39NrgeznzkTSmhmsJkga3m9AMMbJ1cnYGYsWLFU07HpYI2nv/0impXIsciIzKWeuwaAyIyU
 kyh5Xts1IO2nyOKVXcvj6dv77MMaXMRt+d3smzS6N1ReYVet5PU1C1NZHnJB1QE111Mhwx62vlw
 5a0Yoy/ZAu0couZ0qdQwhDCb41yd1MF65Ht+fBNSTeJRsLotTkPTqTTrslLLYt5paDDCFNesUU8
 rGZCYOPu6ZV/igclgDqwr/HtoD2N590SOMoInpa9ApHxSwp2UhAYYvUddIElZuK+6K8OqrQntU9
 at9WcCdGQe9nTFvsyGA==
X-Proofpoint-ORIG-GUID: SxTIkTW6ZKtTRkJgfafWzHORgI73IqEH
X-Proofpoint-GUID: SxTIkTW6ZKtTRkJgfafWzHORgI73IqEH
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acc8213 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1CCqUJFLb0VynuEnu9gA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX0tmvN8+DZZWx
 UJ2nmaGxl+ZLSsYXe9KxfNqiGKn5NW33Yhg9MJtVcohN4szoQ/iztJ9NnMc/T8k6iyp23JF7A7l
 lsPD9mbNnciGRjMBxR8spQJFU/PdJXg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120026

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
index 46e443e05195..851b3cd712f5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-1080.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
@@ -63,6 +63,8 @@
 #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define		CSI2_RX_CFG0_TPG_MUX_EN			BIT(27)
+#define		CSI2_RX_CFG0_TPG_MUX_SEL		GENMASK(29, 28)
 #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
 #define CSID_CSI2_RX_CFG1			0x884
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
@@ -140,6 +142,7 @@ static void __csid_reg_update(struct csid_device *csid, int port_id)
 static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy)
 {
+	struct camss *camss = csid->camss;
 	u8 lane_cnt = phy->lane_cnt;
 	int val;
 
@@ -148,8 +151,16 @@ static void __csid_configure_rx(struct csid_device *csid,
 
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
index 63030a0659d4..5db7e12a6f86 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5858,11 +5858,13 @@ static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
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

