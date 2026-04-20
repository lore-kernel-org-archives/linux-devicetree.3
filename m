Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5583783AD
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776651981; cv=none; b=luqeU3Cjyn+ng5CWQgl4Z7F547GghF0luezHYgPAAEIF/oj7VFm0nzW/XODN6ky7VHhlGNVyBum+hBXo0xnd4fT39sS6wRUCjsElhH2+V8nnxF712+cnvve5DvIRNAapjhEzcsb0IM4vF5jROz66/9aVzGh8I/YzaVaoWgICnO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776651981; c=relaxed/simple;
	bh=LRzEEtoUQNDOYN6qMiXD5KNuLpI9vlfwp/jvmFxVNqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lBIGhhMPHB5gkckPMO10U0CgpBGDleWP5JLzvrtq4OYlwwPxzyKVAOy9wb98fCpaAoDbLXuvXEGSuRZwOKmvqPDoYnB1VjuWRdM1ZeccvsLskGi0dkOq5LoXMYdc+MYtdy4LJb/EZZLEhZXLtrx5+T9JSzqbnqRfQaEx4nEb+rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oe2AkL9V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=anG72hVu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oe2AkL9V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="anG72hVu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JMqeQX1466042
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7aB//lKjhZemWKOfC0fv9se5rf8oJid4Xh3oSsyjLKM=; b=oe2AkL9VsXlQYFYh
	9El5FpfBbWndg3G9Dx248A+QDVZT7QTR14MLOCg+9esW7lOZto2lnrYsqI3UoPIG
	dAk/jIHHyt8zXyK86HjjyGU5Im2duN5bW6AQVJ2eM4JCK/cO+uiOQQ/CeCdQqY8k
	3gWdn2WGYzgx8in5w76UTXh2gU/B0cJQvTgEtXCk688xLH66RPqjPlRgJQnIyX1R
	NGe4nM59u0J/HZkUywTEFzBdaMxbQHIWyORZKouxixplP3S2kNZ3ShBzuP8prDBe
	IyoGbBOehpz7sJiuue34vg6s3WpoOFTlWAZCU+cJpF3tS2NbXz0nrFJFLnTrdh3Q
	72VhZw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr3u28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:26:19 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so2500574eec.0
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 19:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776651978; x=1777256778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7aB//lKjhZemWKOfC0fv9se5rf8oJid4Xh3oSsyjLKM=;
        b=anG72hVu1zxYS0PP4Jje2tzY/2FuMvlsc46XviB7sv0Gr7xiPx0HyLKwycqelQcctP
         je7gLcis66vIAmn9/ClkG2axV8vRpxupvFXQExPW0k1QetW6/TAIlP/bOgjigP4VeVvO
         W4b06dwmEBoX8vN4U8MRuIhO0H0BxgW4qBtZsF6p/alse0P5DkhQyPC+0L+Od8vuN+mE
         iMPrPJNawEQ5uUj2DNu2nNB13iVJLM4fz0E08keyzRQbu8R21TD1wUglr+p7QN9xF3rO
         jH4tbQ2dvKhXIWh0Jja36pMYS9O7tR628mWz0ylFZYIKQbExmlTDDHwhrfYSjljzHjQa
         gP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776651978; x=1777256778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7aB//lKjhZemWKOfC0fv9se5rf8oJid4Xh3oSsyjLKM=;
        b=mBVReYrih0GpfbqiU9/Comp2AgnjEaJGmt6yoMMb4/87R1n4vMVpurbwUpj0fTABcN
         ISuBXGWG3N4QDb4aEK+MS4aLKw+s08nbCZkP8Ld7XTz2kUJAuZf2/18LWvb/lZ6GSyaT
         nOnTTM1Td1ZdneJKTrRWHNmmeucJnKjrZpqQHpv7fCaypE3Y7WM44w59R/35exBs7B6b
         xlWmtTeTRcnuUNRAE3mjgPMhfwKjF1GCVY4USWt3C+1tIWJd0Jo5pMAz7p1Dx0NgBo0n
         jw8HCpdgQSvi6CkgcQSoixOF94CXdt5/IaeH/S1kAH9EzBOF9HtBxMr+Gmoe8mn5dWTv
         oRdA==
X-Forwarded-Encrypted: i=1; AFNElJ+sf6sNmxO0HxNfVuiHlT4OuCIwUcPdj7FwsnKKG2BlNiN0Yx7u3W9EpYaYNjdDWzpIThdnJ4rgnG5q@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn3f7DtgzUMvm4GyGcEMPamh2bwyIhRs3c1DTvPL6XK5q5BO+S
	A7xXnkbk0KEkD5+xZrFSROmvQbucOC4pQYEfQICgn0cZhWGAykC+zjIHVLgjpNe7Nlu3xNdWEw1
	X5h6KLY443HkNsmJ7tiylmGPydgga1HPFU9Byn29KutEqv83WB/M+mygTO2o2E7ogOKNluBma01
	g=
X-Gm-Gg: AeBDietm5UQ3EVFwmyPs0yXXOzINq2lKwbh8Z7ofFg+LvJFwpHL8sIwGD2Bp13M9JhR
	ORThZk52GQlvLvSNpDy42mM2Q5td/yJcI3If7q0Se5/7J+mkXyX9HbIazNMBDE2/4k5YCfyYdT9
	RY8DW2p3OxShzuB6XqGA4enTX0r0dJB0zgXJtH8KM0QA4JRQQhmFuRN/FjkF+295o8AHXurmoRw
	oHYI6fz2f9WqTG6nMlLriprThWaGrtQa+mpYFgPvua+E+LSgZ5IewEhTeDbxqQCqHEAccJlllIh
	KaFTujP7aJy75mlEljcm+QW2AQJT8BBpTIV97DfSJvmjmB+SKLcUOT1S+y/AeQDWxJHWZqMXlow
	GQNVf3RG4UDZ8yBIYHzmzlDt4oJ4KlO4rv/Efyx+M3RHzPMiCaWSIwOIYlrXWn1vLX0rNFyn9zo
	35uuKQ970q
X-Received: by 2002:a05:7301:6793:b0:2ca:7eb4:3e0f with SMTP id 5a478bee46e88-2e464dafc32mr5863477eec.5.1776651978022;
        Sun, 19 Apr 2026 19:26:18 -0700 (PDT)
X-Received: by 2002:a05:7301:6793:b0:2ca:7eb4:3e0f with SMTP id 5a478bee46e88-2e464dafc32mr5863451eec.5.1776651977435;
        Sun, 19 Apr 2026 19:26:17 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm15299023eec.8.2026.04.19.19.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 19:26:17 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Sun, 19 Apr 2026 19:25:53 -0700
Subject: [PATCH v3 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8.5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-hawi-spmi-v3-2-b04ee909cb87@oss.qualcomm.com>
References: <20260419-hawi-spmi-v3-0-b04ee909cb87@oss.qualcomm.com>
In-Reply-To: <20260419-hawi-spmi-v3-0-b04ee909cb87@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776651974; l=8278;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=LRzEEtoUQNDOYN6qMiXD5KNuLpI9vlfwp/jvmFxVNqM=;
 b=4i6lIvAh7fWgZW16nLIcem7nJpjntXYzG2Rm/HHJOBTXKimt0IbQDhdXiV4KWcQi8miPGh0Ta
 Z0VkivcsoVqB+ASx4Gaq4JNR1wlVVJWb56vwodKwifO1kUPYEMQgAq1
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAyMSBTYWx0ZWRfX9pqz4zOroZNQ
 61slKLHm80EGBHcTkv3Mp2szLvMwyq1zD9pgaJtBXW2m25XDzbQPtwy1p6vSqbBePEzKJIYZuGb
 qTlP+CMg5+FODKV926HP2jyWOFO0hJVAlrLWiMR1+pq74OOrssSKil8g4xEmp3a0MhT+2p9ISbL
 8jRdol6znyehq75UVq7mt9cbetZuUBVEyqDmj2eKPAOTFkh/+YZE8ug/fRn7MoSK0WgaV4Jibq4
 HMS0zBn6AkBwGW/m8IRYC5GZHfUbqg4ISgNCOEthdbRbiz6XyMbsLnJOCdNBer+HBeI44qTlWsi
 HMc1qce0Mj/61jc20WL/dpKVj+nD+9HfmvVzG0gMqkNrNsGVNJdPSi37twxpcTxZaRmRihPVncU
 7dNZy+htc7i2LNsM4sGWNxIhnAMiqc2+611bBYkoLadiKnaGSnHYhvVTJoSu4jwYpaw6ZiIUoKJ
 1b0PHo1+2d5t8cTzIaA==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e58ecb cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OV-Ktwupj4Rdi1Ve7EMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: a71Md7ROUaIoiBoygO3q5L6wfCQk7OPR
X-Proofpoint-GUID: a71Md7ROUaIoiBoygO3q5L6wfCQk7OPR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200021

PMIC arbiter v8.5 is an extension of PMIC arbiter v8 that updated
the definition of the channel status register bit fields. Add support
to handle this difference.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/spmi/spmi-pmic-arb.c | 142 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 112 insertions(+), 30 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 69f8d456324a..2e2cb4774103 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -28,6 +28,7 @@
 #define PMIC_ARB_VERSION_V5_MIN		0x50000000
 #define PMIC_ARB_VERSION_V7_MIN		0x70000000
 #define PMIC_ARB_VERSION_V8_MIN		0x80000000
+#define PMIC_ARB_VERSION_V8P5_MIN	0x80050000
 #define PMIC_ARB_INT_EN			0x0004
 
 #define PMIC_ARB_FEATURES		0x0004
@@ -62,14 +63,6 @@
 /* Ownership Table */
 #define SPMI_OWNERSHIP_PERIPH2OWNER(X)	((X) & 0x7)
 
-/* Channel Status fields */
-enum pmic_arb_chnl_status {
-	PMIC_ARB_STATUS_DONE	= BIT(0),
-	PMIC_ARB_STATUS_FAILURE	= BIT(1),
-	PMIC_ARB_STATUS_DENIED	= BIT(2),
-	PMIC_ARB_STATUS_DROPPED	= BIT(3),
-};
-
 /* Command register fields */
 #define PMIC_ARB_CMD_MAX_BYTE_COUNT	8
 
@@ -239,6 +232,7 @@ struct spmi_pmic_arb {
  *			on v2 address of SPMI_PIC_IRQ_CLEARn.
  * @apid_map_offset:	offset of PMIC_ARB_REG_CHNLn
  * @apid_owner:		on v2 and later address of SPMI_PERIPHn_2OWNER_TABLE_REG
+ * @check_chnl_status:	checks channel status and returns error code if any
  */
 struct pmic_arb_ver_ops {
 	const char *ver_str;
@@ -261,6 +255,8 @@ struct pmic_arb_ver_ops {
 	void __iomem *(*irq_clear)(struct spmi_pmic_arb_bus *bus, u16 n);
 	u32 (*apid_map_offset)(u16 n);
 	void __iomem *(*apid_owner)(struct spmi_pmic_arb_bus *bus, u16 n);
+	int (*check_chnl_status)(struct spmi_controller *ctrl, u32 status,
+				 u8 sid, u16 addr, u32 offset);
 };
 
 static inline void pmic_arb_base_write(struct spmi_pmic_arb *pmic_arb,
@@ -306,6 +302,84 @@ static void pmic_arb_write_data(struct spmi_pmic_arb *pmic_arb, const u8 *buf,
 	__raw_writel(data, pmic_arb->wr_base + reg);
 }
 
+static int pmic_arb_check_chnl_status_v1(struct spmi_controller *ctrl,
+					 u32 status, u8 sid, u16 addr,
+					 u32 offset)
+{
+	/* Check if DONE bit is set */
+	if (!(status & BIT(0)))
+		return -EAGAIN;
+
+	if (status & BIT(1)) {
+		dev_err(&ctrl->dev, "%s: %#x %#x: transaction failed (%#x) reg: 0x%x\n",
+			__func__, sid, addr, status, offset);
+		WARN_ON(1);
+		return -EIO;
+	}
+
+	if (status & BIT(2)) {
+		dev_err(&ctrl->dev, "%s: %#x %#x: transaction denied (%#x)\n",
+			__func__, sid, addr, status);
+		return -EPERM;
+	}
+
+	if (status & BIT(3)) {
+		dev_err(&ctrl->dev, "%s: %#x %#x: transaction dropped (%#x)\n",
+			__func__, sid, addr, status);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int pmic_arb_check_chnl_status_v8p5(struct spmi_controller *ctrl,
+					   u32 status, u8 sid, u16 addr,
+					   u32 offset)
+{
+	/* Check if DONE bit is set */
+	if (!(status & BIT(0)))
+		return -EAGAIN;
+
+	if (status & BIT(1)) {
+		dev_err(&ctrl->dev, "%s: %#x %#x: transaction failed (%#x) reg: 0x%x\n",
+			__func__, sid, addr, status, offset);
+		WARN_ON(1);
+		return -EIO;
+	}
+
+	if (status & BIT(2)) {
+		dev_err(&ctrl->dev, "%s: %#x %#x: CRC error (%#x)\n",
+			__func__, sid, addr, status);
+		return -EIO;
+	}
+
+	if (status & BIT(3)) {
+		dev_err(&ctrl->dev, "%s: %#x %#x: parity error (%#x)\n",
+			__func__, sid, addr, status);
+		return -EIO;
+	}
+
+	if (status & BIT(4)) {
+		dev_err(&ctrl->dev, "%s: %#x %#x: NACK error (%#x)\n",
+			__func__, sid, addr, status);
+		return -EIO;
+	}
+
+	if (status & BIT(5)) {
+		dev_err(&ctrl->dev, "%s: %#x %#x: transaction denied (%#x)\n",
+			__func__, sid, addr, status);
+		return -EPERM;
+	}
+
+	if (status & BIT(6)) {
+		dev_err(&ctrl->dev, "%s: %#x %#x: transaction dropped (%#x)\n",
+			__func__, sid, addr, status);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int pmic_arb_wait_for_done(struct spmi_controller *ctrl,
 				  void __iomem *base, u8 sid, u16 addr,
 				  enum pmic_arb_channel ch_type)
@@ -327,28 +401,10 @@ static int pmic_arb_wait_for_done(struct spmi_controller *ctrl,
 	while (timeout--) {
 		status = readl_relaxed(base + offset);
 
-		if (status & PMIC_ARB_STATUS_DONE) {
-			if (status & PMIC_ARB_STATUS_DENIED) {
-				dev_err(&ctrl->dev, "%s: %#x %#x: transaction denied (%#x)\n",
-					__func__, sid, addr, status);
-				return -EPERM;
-			}
+		rc = pmic_arb->ver_ops->check_chnl_status(ctrl, status, sid, addr, offset);
+		if (rc != -EAGAIN)
+			return rc;
 
-			if (status & PMIC_ARB_STATUS_FAILURE) {
-				dev_err(&ctrl->dev, "%s: %#x %#x: transaction failed (%#x) reg: 0x%x\n",
-					__func__, sid, addr, status, offset);
-				WARN_ON(1);
-				return -EIO;
-			}
-
-			if (status & PMIC_ARB_STATUS_DROPPED) {
-				dev_err(&ctrl->dev, "%s: %#x %#x: transaction dropped (%#x)\n",
-					__func__, sid, addr, status);
-				return -EIO;
-			}
-
-			return 0;
-		}
 		udelay(1);
 	}
 
@@ -1768,6 +1824,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v1 = {
 	.irq_clear		= pmic_arb_irq_clear_v1,
 	.apid_map_offset	= pmic_arb_apid_map_offset_v2,
 	.apid_owner		= pmic_arb_apid_owner_v2,
+	.check_chnl_status	= pmic_arb_check_chnl_status_v1,
 };
 
 static const struct pmic_arb_ver_ops pmic_arb_v2 = {
@@ -1784,6 +1841,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v2 = {
 	.irq_clear		= pmic_arb_irq_clear_v2,
 	.apid_map_offset	= pmic_arb_apid_map_offset_v2,
 	.apid_owner		= pmic_arb_apid_owner_v2,
+	.check_chnl_status	= pmic_arb_check_chnl_status_v1,
 };
 
 static const struct pmic_arb_ver_ops pmic_arb_v3 = {
@@ -1800,6 +1858,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v3 = {
 	.irq_clear		= pmic_arb_irq_clear_v2,
 	.apid_map_offset	= pmic_arb_apid_map_offset_v2,
 	.apid_owner		= pmic_arb_apid_owner_v2,
+	.check_chnl_status	= pmic_arb_check_chnl_status_v1,
 };
 
 static const struct pmic_arb_ver_ops pmic_arb_v5 = {
@@ -1816,6 +1875,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v5 = {
 	.irq_clear		= pmic_arb_irq_clear_v5,
 	.apid_map_offset	= pmic_arb_apid_map_offset_v5,
 	.apid_owner		= pmic_arb_apid_owner_v2,
+	.check_chnl_status	= pmic_arb_check_chnl_status_v1,
 };
 
 static const struct pmic_arb_ver_ops pmic_arb_v7 = {
@@ -1832,6 +1892,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v7 = {
 	.irq_clear		= pmic_arb_irq_clear_v7,
 	.apid_map_offset	= pmic_arb_apid_map_offset_v7,
 	.apid_owner		= pmic_arb_apid_owner_v7,
+	.check_chnl_status	= pmic_arb_check_chnl_status_v1,
 };
 
 static const struct pmic_arb_ver_ops pmic_arb_v8 = {
@@ -1849,6 +1910,25 @@ static const struct pmic_arb_ver_ops pmic_arb_v8 = {
 	.irq_clear		= pmic_arb_irq_clear_v8,
 	.apid_map_offset	= pmic_arb_apid_map_offset_v8,
 	.apid_owner		= pmic_arb_apid_owner_v8,
+	.check_chnl_status	= pmic_arb_check_chnl_status_v1,
+};
+
+static const struct pmic_arb_ver_ops pmic_arb_v8p5 = {
+	.ver_str		= "v8.5",
+	.get_core_resources	= pmic_arb_get_core_resources_v8,
+	.get_bus_resources	= pmic_arb_get_bus_resources_v8,
+	.init_apid		= pmic_arb_init_apid_v8,
+	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
+	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
+	.offset			= pmic_arb_offset_v8,
+	.fmt_cmd		= pmic_arb_fmt_cmd_v2,
+	.owner_acc_status	= pmic_arb_owner_acc_status_v7,
+	.acc_enable		= pmic_arb_acc_enable_v8,
+	.irq_status		= pmic_arb_irq_status_v8,
+	.irq_clear		= pmic_arb_irq_clear_v8,
+	.apid_map_offset	= pmic_arb_apid_map_offset_v8,
+	.apid_owner		= pmic_arb_apid_owner_v8,
+	.check_chnl_status	= pmic_arb_check_chnl_status_v8p5,
 };
 
 static const struct irq_domain_ops pmic_arb_irq_domain_ops = {
@@ -2030,8 +2110,10 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 		pmic_arb->ver_ops = &pmic_arb_v5;
 	else if (hw_ver < PMIC_ARB_VERSION_V8_MIN)
 		pmic_arb->ver_ops = &pmic_arb_v7;
-	else
+	else if (hw_ver < PMIC_ARB_VERSION_V8P5_MIN)
 		pmic_arb->ver_ops = &pmic_arb_v8;
+	else
+		pmic_arb->ver_ops = &pmic_arb_v8p5;
 
 	err = pmic_arb->ver_ops->get_core_resources(pdev, core);
 	if (err)

-- 
2.43.0

