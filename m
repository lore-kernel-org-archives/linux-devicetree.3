Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C303B19D9
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609490; cv=none; b=shUnJXqSCWZ2DwP1+daUrlKv4nX7fkh61HVQHYJ+N5foSXiDUT4UbxS6d385wR0fwz4oZpnb3Imqk5iZ/jt24UwwfyI0/3+68jDpwV8hpetqfTFyal5nIQjEEvoc3F9YiLTHKzwnR+aHdyyixzb/GXmIptJXFC82/Fzx28WTjqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609490; c=relaxed/simple;
	bh=k7+wjSAGjpR22f7rKksM9nAh3MeACrWaJ5KFpnnayHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JItvipDB/6aKxVRU09SMQZt/WjM9ZBZJM9gd+JJhpEr2+gQm2uvic/sp6S7sIHhoD0erzuXcUeFJ7UJ/vtdvKH7+IGpKePwHuLmpgTiORJyDFc98Uo7iemZyKSzMYW3TvQ8pQ5KP8G981z6J2zgJFVFe/uUqdD3PjDmCYHr1Blo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLiiuD24; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iIN93pad; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLiiuD24";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iIN93pad"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L468GE037701
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=; b=nLiiuD24OAP0YSIR
	nWHNwFB1a+P4NlXRrRNMCVV7m+oLh8JJW2CLeZSe3/zc4nXIqFZqe/QjigIOOona
	ISMzsfAq66kP769hqbFmy6Fkt/qRKRPzaZcijB4lD2A4eOb16nrulsuHV8kjDB62
	p+OlrGGfdGw/BKeY98I12tVVE0VdxITiNDOyWijgeClP+5b6Larh+8Q6nDo4KPfN
	o2l30/0aQWsxAAQWD+W9ZvV6rkWvDycQOmpwwplhA6Nbi5x8N/Mtmwo9tFaP8TZi
	s0EcFPzQ1rLY+dQY0Mtn8Xe91HoX50yHporiZAirhfLFy5tE0h2+85DzpQA+URwc
	ivj0UQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es04gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:51:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e7621655eso3354939a91.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 21:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784609488; x=1785214288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=iIN93padqK4zc8ibHVsXBngTvrBIk1X+uutweH8zMJuLYaRbLdBfdPHj8b3ATLpRiD
         wiG6ayTRNxIxHqXbCCYuvwRdAw4TVjhlp+JNJuox8rlepP7s3ID376P0ym5+uz0erGv+
         e+jKSl3oyKNxvgtrFLqgdBRNcHxfnSPLyUJ1Zgm2/A/3NlrJ66zo9suz22G0nToOflCt
         Zk4HOlxVUvOFNuebzqzTb1v5vFt9rlrYHQtlUS4DozDGC+ee6H3kh5572Jd6w5xHskz5
         3invbTrVgOPZh9I8K8CTrxyV83hFPoJBbKVVh02mFcW13KXiLSDWJ4wOQEbbCNHPMa+e
         yRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609488; x=1785214288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=aciDvzKD/AtSXoDVosfeDRZthiwlXdNs3aKL3f/lGO98WFtAJcyPeyloBgM4ml6y7G
         VXUoFsJfmTONpU6f7UQv9F35QgqUADvUJ+GiK4TuxMqCZGpUBANdZH7sWL1A387xTUi9
         VAg2vs9iehVJt1f4JhJaoT91GXyKh22sRJUVoJiMZnQTqtjh/lEOo07bXqiOgwPOdYlb
         yHTK/TQvR6aOc2b0i+t6/UwRq6cByhbxRQC/ks2xgNd4zQucAqEPQgfwG/tsCx2dnQJJ
         ECU/r5esF2aRLk/pu9Lo0QAlY0WR0TomMzl7ypUYvnlijvF0hWuWAfpbcSZY384xexS9
         VRJA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1DR7ApEI2EZbyJsl9QfYolkx0jd7jxJEw0XG40I34Ur/Fbm4sQNGhNtE/3ycL/mD3yEcoiPVc3nBH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo/UXO0yDLwC9uRn4FM9cqVsSKdrFPILn6bPIgnBNVHcPA7vsv
	BiXV3QbVLC+WlzURDvFoV345//Cz7uJ2SGW00Lp1oQQDrifI+RbN/Gl5R3VCPEvv95o4IwM5YGR
	YkaEUOHSRxt4ofCZ4WIJeXmtG6HYZWrwa+4HiIiYiee1eGeopG/F3CrViqqcipF5a
X-Gm-Gg: AR+sD10BCd2ACvPbhyCutimsUV9stoQvFzcsYjC+Ycv2ZIp2V1HnXqaLTQ+erHGbXhI
	2dCuBc2ZW+yzK1ibrB0NiyLGOwoISrPXXxeQFcBbkNawNIhFgAqG46z4mD+kJ5J3vjpMXGfcYzm
	PMqQHwZbQaVx67HGJQjBuNFlb9PH80bnnDqssOnmNXxQ9BYPWIn3KnFXQobGM7X9dd/icP/OlMP
	z1O7vBs8xJkqNgNqTgxEQZ8grMEcXL4u/clvqRyFEUBa3XOVZ2XAYupGFrw9VnevhWGK5YTZw+6
	3gadWZIH5KLANyuHdAPrsFn9op5X4jMsW0fKhS/RZ+3QWrO3/VveVtUpRZK6cy2FeMuaHrfqhz2
	2ky0o+mtY9lXUf10GdJV6IFAAUzPRTnO8YIsRMniv4Z69UftRAtA2hj0=
X-Received: by 2002:a17:90b:54c4:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-38e4b3e133fmr16105506a91.7.1784609487506;
        Mon, 20 Jul 2026 21:51:27 -0700 (PDT)
X-Received: by 2002:a17:90b:54c4:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-38e4b3e133fmr16105480a91.7.1784609487041;
        Mon, 20 Jul 2026 21:51:27 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2ddfb35sm37963183c88.14.2026.07.20.21.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:51:25 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:50:37 -0700
Subject: [PATCH v15 4/8] phy: qcom-mipi-csi2: Parametrise the common status
 register offset
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kaanapali-camss-v15-4-c0b1c1167c5d@oss.qualcomm.com>
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
In-Reply-To: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5efad0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Hg2RDDSKyQQ54yw62F3SIeUH3gDe2UeB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfX8B8uanZEn2S8
 Wg/4ZleOW0XXoAmI1Oid8H186dvXCZS03N3vUu9zVh7vQu4B+VIVYeeCKNqMPoYMHaH/nZAnU14
 Jts9HasEcgHczH3j4ClVavDtm5dKdiGDkCTPhoUa22YEBypKzcLmhpUz9rQDIVcW8tSdnmKgdFP
 vVlRieVfvru5NXCO5Ssd0pfOgQT3w96E9DLHawvBW7RE2q/Q3XomH+UClu+3QiiHQJlxdAy/gi5
 JHcd39XndlhrpjLXgeQv69OPjyXG4DPCzBmRGYQkF+xQFuJamcDcKh3gtvPduUbDbTy8ZZO5rXq
 xz8QBUNTqcYcAn/KoEVEOK2FLQfjVsckmnqA0qocfGQCl17ru5/kS4GaJKLgl23MqWdc95vuYfh
 QkVQZ4Dvg1fYFDo4As33JoqLW8QNdz7BbSSKjmqgVvCMOGPnQB82D5kvcXyZB67lhh5rle4b/H0
 wk441SBpWS0ZsaLH6kA==
X-Proofpoint-ORIG-GUID: Hg2RDDSKyQQ54yw62F3SIeUH3gDe2UeB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfXygE2CDMHCoqo
 WjmfH/Di36HRezAH4JOctTbHd/cQnEVbeNMmHw9eKZldbB3qQKPs5rcvBPfHfLDzH/bpRRqilXV
 fYG+EpHNtcY0P746LyftCI3Qp0A4Z08=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210046

The CSI2 PHY common status registers are not at a fixed offset from the
common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
v2.4.0 parts differ.

Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
no-functional-change preparation for describing other SoC offsets.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 +++++++++++-----
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 966d79c98f9b..8cd331cfb4b3 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -19,7 +19,8 @@
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD	BIT(0)
-#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
+#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
+	((offset) + (common_status_offset) + 0x4 * (n))
 
 #define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)		((0x200 * (n)) + 0x24)
 
@@ -176,19 +177,23 @@ static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2p
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 12));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 12));
 	csi2phy->hw_version = tmp;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 13));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 13));
 	csi2phy->hw_version |= (tmp << 8) & 0xFF00;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 14));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 14));
 	csi2phy->hw_version |= (tmp << 16) & 0xFF0000;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 15));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 15));
 	csi2phy->hw_version |= (tmp << 24) & 0xFF000000;
 
 	dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version = 0x%08x\n", csi2phy->hw_version);
@@ -375,6 +380,7 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 		.init_seq = lane_regs_x1e80100,
 		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
 		.common_regs_offset = 0x1000,
+		.common_status_offset = 0xb0,
 	},
 	.supply_names = (const char **)x1e_supplies,
 	.num_supplies = ARRAY_SIZE(x1e_supplies),
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae007370..d6366f809e51 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -51,6 +51,7 @@ struct mipi_csi2phy_device_regs {
 	const struct mipi_csi2phy_lane_regs *init_seq;
 	const int lane_array_size;
 	const u32 common_regs_offset;
+	const u32 common_status_offset;
 };
 
 struct mipi_csi2_genpd {

-- 
2.34.1

