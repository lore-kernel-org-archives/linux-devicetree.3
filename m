Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576274078E1
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886637; cv=none; b=XzOKgUTp6L1qx0kYJXwBtLFHmYkC9BUYB38CfaHMoAxcYv1HuvVsJuCSXYdoZbcJvGogboq00HpqlqexvyggALZ4r2fDTD100lN+625zrd4Dd2i9rlzrz4pdicaumBsjhLIlGqc2nyeJht9mXPSzf1ryXJxUeLaokLZRLiAWZwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886637; c=relaxed/simple;
	bh=0ADpLYpNVCDZL7nrJXO7P37xOu+fT5ppfN8VnN4oLWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XX9EYZOxsGb+3UdnlwbjdFzH9E5CYeDcka31X3E3PrPx73b9l3SURrLIE9Qrk8+ltW55U6wGsQ86nvAnVOuSQGPv4jYEObj6QT2yQ+rx4cE1Vt7QNQKPEXhp9Z9/TQTWQY+fnykL7CZSZO/wjZrQDGjHnJZK87Sr1BXwzSUsZU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0nzuV3i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TEzCg+XA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0nzuV3i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TEzCg+XA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CSPG949398
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w+gBaUzjZVMrpeVDlkni2Yf8Bw2QnTnJ/9RryeaIQlc=; b=V0nzuV3iCTBiPkJa
	cLYXulDlNNK5UvMrTUrNgFLbOxMvX42XrKZzFX+5QGAvBmpLYS47ysov6HTgQijX
	pPZYT7P3kxEoNPUDqtaxxPkMqXZgQeC6RkQFO25dc++jsPzopKl/7qLYaBJtyePY
	H0Sz5F8/vnaqd9TJ9FnicFvVykCa4ov0Wp5KAucnZhqLmPBq/u54zpdoVtbK8/ni
	PiUKV4eZV00GyrnigNVzArPqWZ8EVusijtMFrw076BxyrwGACWgPmf14zmlNjtXH
	Fj+FDvASKpMN4a1Gq3uypQxXpulO0kHPo4BGBNXTbV5ijLj3jwl2PCz3M1NagljL
	Qic2iQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f6290t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:17:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac450b74b0so631995a91.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 03:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886634; x=1792491434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+gBaUzjZVMrpeVDlkni2Yf8Bw2QnTnJ/9RryeaIQlc=;
        b=TEzCg+XA46Ljw3hw6vlYc9nHmPXg8QclWnPspx1v0aoTXUznNnGf+LhTillhplObC7
         fyJ+/CWpnpGTtmxPR9POBdsfAeAhMydaCLfcLnAt092lgzfwFvo4XPXP5o2+p/qpkG9D
         +540uDRFP2MlqTr+/wS5jSCQAkXYuSzzlwMG0BRz19uPfO8TPqSeoKvIL3TV05Zg8S33
         Usg6iJ5DDQz9hE//rBghDAn5X30uJgrhUyjNu4l6DvrFhX/S8jLOcdJLFyU2I3AvDDAt
         Woe6jWzNHmZn6COjK3MKJiPD5zkzFEO/tGOB05DRRgFHE57gvm5ZvyBxmoE33O0t+HuO
         0odQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886634; x=1792491434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+gBaUzjZVMrpeVDlkni2Yf8Bw2QnTnJ/9RryeaIQlc=;
        b=wBiDyeEMx9q2xR7fTehzK2U6zVzakyq+xGYvqWFpMhpqZ8khZmin5Jqa61Pe42Tnhz
         atMruxzJItnczhj8DCjHf3ZPJfRt4I1BfJg1LLdNa0NssOZyhSQA26KVzwRifdo24GlK
         kzIM2Ra9XsmsQ9hth1GJWN3uXb8ISjIjZqBtk5C8AntSh2iuxTFQ/AnfDy372XR6w2Xi
         dUzdWwMHpZaBBIUxZKeHECd2MgcpTIFza4nOaMyiiQvwaUqw+zVTnb290uNqQZBAW+gn
         9UJje54ooQRm2nsmWwGzwtwNu070B6nJnjKjItoWoqQz2a8yRtJhbeHuN1vn81DJfN1A
         O9LQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/kk9fr86Yn1aiecxCfU336DSh57XEHoLWdmmcgjbyqN5ovJ2t9jpO3wnnod1gz04FVfa2g+odJilt@vger.kernel.org
X-Gm-Message-State: AFq9FYLXLGOGkOzXVrYJ8CWg2Qwnwoi1SVK4vVynlk2nl0kGxLzJuPlq
	52X0cJY1w/wKKsjJsQYeasjshwaUOHZswPT/7j5c0/ptSuYKXBV+dzG0yoSh9ZujGmT1po+V0Yd
	dsKs/Ubl+FoRxD3qlANwia2ETLXTZUIopFvtUITBrq95ftxZ6+RqjoHYU5N/RT2I1
X-Gm-Gg: AYBFou05oha8OMedxh2JHNyLCqxgRcr+BQd61r+eSBxcVfqtOa2evBvNQx2wYD1lISw
	gvk2UxFf90qncpwva8GQjd7hlezUFFS/MaKpmW2TFrbzLajcqXAAuvKztqzUYqZXCxcDlSqO1On
	OZplBXtSswPwlPhgZhb+Aeo/nRZhFskEUjSn/rjGw3JsZmDIFBEIrTcMpfKzWiVT8xBon55IVR0
	jl175f/obtM1JQk1jrfI394LFZvuXWuEKHZgMkEXiNi2aDJURk0foe6NFvsEKz0TyWqLmS+VH4f
	2IxNMWIQdIrvGhDEp3oZTsrQnAH4Sb/FYQy00NRjAMGpFxlamVc0AYD6H2gFXUKawjk6vQwYf77
	DMTmtzWQm6U3nUMA9WJcXu2EkOadhXrdglu3sQ5dfegfxldY=
X-Received: by 2002:a17:90b:28ce:b0:3a0:809b:1972 with SMTP id 98e67ed59e1d1-3ab3a745e5bmr9610707a91.26.1791886633768;
        Tue, 13 Oct 2026 03:17:13 -0700 (PDT)
X-Received: by 2002:a17:90b:28ce:b0:3a0:809b:1972 with SMTP id 98e67ed59e1d1-3ab3a745e5bmr9610688a91.26.1791886633045;
        Tue, 13 Oct 2026 03:17:13 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd5dadd0986sm4186777a12.18.2026.10.13.03.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:17:12 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 03:16:46 -0700
Subject: [PATCH v3 2/3] phy: qcom: qmp-pcie: Add vdda-refgen supplies for
 Glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-phy_refgen_1012-v3-2-f28305289499@oss.qualcomm.com>
References: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
In-Reply-To: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886628; l=1908;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=0ADpLYpNVCDZL7nrJXO7P37xOu+fT5ppfN8VnN4oLWc=;
 b=BykP0ddZeN6ZlZ/7OdUSfD1JB8/NhxkH8PR7HzfTJWa5XKzn5bSJ1ef+5KWk8mAqALIhTWzJH
 kNDQmhPpYGRDWvH1w41Cqil9qfNYYGdcCM0aG0UlT7djZkcHqQiDEUR
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace052b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=m2jQVEIWa0EwQwJFt7gA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX2b9mH9F5mNbx
 N0Y/eXA3a6vN/E6/3QxgHAEd4zEzfYAlRmf7/Bk2UZS0v9+qctAyWDGGTi9ee5E5RF9QCSvAjlZ
 S/k9D/25v/Np4OUX41GZGFKaoxkRwD8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX9mt+RMks9lzK
 kvJg3TX29KDHrJeDJDFPQME5qcKIpvX1Olen0Gc3nNMDaMe59xkDBUcs4jsK4nsPhKLdvTh2mVv
 CUpu8sDYjlRBRq31Ji3Ju9rLytD+Ov7orbyhte/egEaZM1h/Col5hW92fPWkm3NQAIQp5/hD1FH
 nnvu+CM1crajem3CVgpgEbpX87buaHs37snhhYQpaSfuDHswcMxHEZCHZjzMuYkovUA/YPHYVAy
 okw9W1VDw+KA6+9iHXRKvcdpf6As8kqQdwb5ClzIFfsEw9wYCWBnyHj2eBpesRaNSFbxlLlaaBR
 oV+MZvoLz0nIII/TFzy0XART/NH4Z4htRVY2X3ROdFoxjljOAW/aeKznysQxIYsg5jm9a+4F+Gd
 qa23n/M2fNv2JftYPSb3AbDOUYMsPYzeAU1KCzJf73nI9kfF7hBaKwkbwUxOMZdsev2mOxnHyHA
 cS/wLPPio6WjCoWGkxg==
X-Proofpoint-GUID: CjT8Sz-DWAmKwhwW3Oaqe7pewgbp3mSp
X-Proofpoint-ORIG-GUID: CjT8Sz-DWAmKwhwW3Oaqe7pewgbp3mSp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130040

The refgen providing reference voltage for PCIe QMP PHY on Glymur requires
two power supplies independent from the PHY's core and qref rails. Add
support for vdda-refgen0p9 and vdda-refgen1p2 supplies with a dedicated
glymur_qmp_phy_vreg_l list.

Update both Gen5x4 and Gen4x2 configurations to use the new supply list.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 9cfabf474fd6..e226b65ec7c6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -4106,6 +4106,10 @@ static const char * const sm8550_qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll", "vdda-qref",
 };
 
+static const char * const glymur_qmp_phy_vreg_l[] = {
+	"vdda-phy", "vdda-pll", "vdda-refgen0p9", "vdda-refgen1p2",
+};
+
 /* list of resets */
 static const char * const ipq8074_pciephy_reset_l[] = {
 	"phy", "common",
@@ -5555,8 +5559,8 @@ static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= glymur_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(glymur_qmp_phy_vreg_l),
 
 	.regs			= pciephy_v8_50_regs_layout,
 
@@ -5571,8 +5575,8 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= glymur_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(glymur_qmp_phy_vreg_l),
 
 	.regs			= pciephy_v8_regs_layout,
 

-- 
2.34.1

