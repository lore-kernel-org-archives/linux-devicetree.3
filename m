Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920EC32FA30
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790125725; cv=none; b=XBtBq5OCPWtWkEVDjlc6ZOcj1A+QsYNlr/6s0hgFH+a28JgHUYYAntgQ2gu8TnMA+O+4fhnWRvHhNXuHmj1gWBAHB0jQsrgoJV8LyBOMmFFMt3FCTLhL1JRPBtY69tDZ5he8k74M3LTMGlIOQ2cxq6c8dZb83gutbAJ8t5NnjBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790125725; c=relaxed/simple;
	bh=bidj1wEWrVmBStyaOXimDHtdRATcaflxdLyVT7qa9s8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ebBKrb+P6fMtb+dPqzM7hJgSLhNF26vlXBzO+ZVfV5dX0N4L1f2UznxXGadkO0KjdPqE2XTRiNVrmM6ETjxyX8IihFKna4dIid0sj2z3jLue11Q2NCtAZYbSdnl0N3skY08dZWNW8r8PWv3Hepp+ErpEvZ9e3DApXT6MVAiN3cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/GeUeyB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hnFtAQZt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/GeUeyB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hnFtAQZt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MN7PZi1530009
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pyDCNIrfUXJjSgCSG5vN3PEsKBpL4V4LY2FZazYMxDE=; b=a/GeUeyBdD3e5zJV
	Kv+piYl2hRSzN+4s3IDdg+UbYKbTNt5OFGYWyrg3MCAM1ZvdIKDTQ+ZYUeyJGs9Y
	2Lhgjfm7ZGml9RxhUNhF87rsEPKLMDOhBx++RjEtT6k8lovpIHenlq2MEi7W4GPK
	YOc1JYM3xRySgIzIIN4mIzK0b2Qrmm/sN61ueiuzazg2wKPN8bd2rM1jp+DIUuAz
	MapD2/2znxh/VptaV89N6/A+fYiM0G+qBNwlMsSdi3NUDGgIrMfjsVaI5t4ZRekq
	dwEe1j5nVQcsZRsZ2kIU+fJ00Vb/R5ZEF9XJvFJafYCDx+6B3N4qExzyoMtCUbOO
	PIw02Q==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv32qrak2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:08:42 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1437272611eso588338c88.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790125722; x=1790730522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pyDCNIrfUXJjSgCSG5vN3PEsKBpL4V4LY2FZazYMxDE=;
        b=hnFtAQZtE0TbOFrn2p1UljuFGTTzmClLw3zNFjVeBDH4+2qswTU5SLP6aaKNi2M81S
         Rp2LINHBVeFCaX8g8zIy+uzfRbPEMQPe3fip48oR4ygDg8eNkDuT0X8CwD+AG+0DcOQR
         qkf297IxwIym06QPYY6/5W3yt2THwO3i4zg4H25o2KeMHDu6G08rzFxDUbaI65p6MTrY
         jBMfLAX6QsgjyOUp4H4WTovVmE5kNuR/pDBtq8TGS7rHu/sBQIiPF/toFa30uaPTllXi
         zKhw45bCAgLjbpb9kzKK+Dx4NXFys1zt37pM25FauiCPq+HZvwD5YC0cMysRbspQK/2z
         YLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790125722; x=1790730522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pyDCNIrfUXJjSgCSG5vN3PEsKBpL4V4LY2FZazYMxDE=;
        b=DoOAdLu79264ppKPpVzTiRHrmq3+5k6iYFz36MRtD57ylCHGY/ctqUKDTydf1RY1J9
         yYVCLiyXUDaeYkKQs/nEx9tqUvG1z8hsi693XPg3VWt9qTty1hdw9Taccbges6Dxl5H2
         +yh8UC5XEcHBQstDkfTd1TWGJwQcOubCrBN55wDWO/5Z10xOvzUuZgeGxbCfLNNwehBp
         ph/k0hb0MUC/2YRQNvHj/z7O+gOFrL3um0AlC50K55D0vJuoErrd986/7usBku7PQt3Z
         HGHHcueunOg/DZw2d/JjlJZMj7hv3ttcHGepFNoY54cJaDO0O2A+1Dozv5+y1hQluik8
         VT4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwNfLaL6InVBvqtB7VONrXg+VhmdK/0gsvEeJeBKIj9PgVPEVlJcUcj52vzL9PrmwG/KfvP46FJyprq@vger.kernel.org
X-Gm-Message-State: AFuF++kdsyD2v3sP7wk8ZE1dyog1d4Hw8L/h4vXNLon7IT/53BEYA86N
	XorAEcM39LNQy7R19W9RZlsgeSI58nHNnv+6WIFSDrYCaAc7nFND9h9w6c0yzvMZb2AJveISBO+
	ckP7BFkEmECT5zJ59A/w1l6srQ1Bx/kyvWT6XpBl+hS7dzRRwshi//njKX5W2ZmmV
X-Gm-Gg: AYBFou1xuIfo85oYv48r05S8Y39gGOFu0Le+aadlaUUFBVRMd4swYZELZJZibkzilKp
	7hMg3+0fHb1OXGP4Ozd5fnu8LmPxdgr/FwN6RT79WdYj/K6AMiVe1vG/q1yk/a+esv2ivVC5tyo
	KuV5A/xf3XM1LkoA0VTBWgWqnJjhOsGCGhv4HDBaez6kRLElqCdZESohFynaOohWsBGLiQf36QQ
	gOjyc0guJuRXzV9g2YqXw3nXu8oi06HvQji1h1ddgnTFtIY0rpg81YAIM7vkuGPo/Qzcl52GPiJ
	atCqgzJBrlNWksaNautC/GfoUOzFSYSFvoGEcC3hFykpX954bA7nDBV2gzTvHrbkq7sDhKABkTO
	ejJWhwQGJu80KTzgBxX7CVcgaDLyQ
X-Received: by 2002:a05:701b:42d2:10b0:13e:5b2a:e65c with SMTP id a92af1059eb24-144f9086c19mr1413324c88.3.1790125721313;
        Tue, 22 Sep 2026 18:08:41 -0700 (PDT)
X-Received: by 2002:a05:701b:42d2:10b0:13e:5b2a:e65c with SMTP id a92af1059eb24-144f9086c19mr1413272c88.3.1790125720637;
        Tue, 22 Sep 2026 18:08:40 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98ca0edsm1651831c88.15.2026.09.22.18.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:08:40 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 06:37:30 +0530
Subject: [PATCH RFC net-next 4/9] net: pcs: xpcs: add Qualcomm Nord
 platform support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom_xpcs_nord_emac-v1-4-4b1c682af70f@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790125674; l=8502;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=bidj1wEWrVmBStyaOXimDHtdRATcaflxdLyVT7qa9s8=;
 b=HIlS61yiTcVzlagvrR4dFCwAt0ai+gqaGFcBQGHWyQNJE1j52SBn5B6VWfB6HlGFPxuM7Vw7C
 Hyd3e/BMapyBGkim70naOS2LnHlynnsDIbZ4opMQ9+r/njyx+waxpHR
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=SJnXx+vH c=1 sm=1 tr=0 ts=6ab3269a cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Te_cRQLLyxeFYv33BH8A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: rB6Y2HbSQ0iAt6X7YqJB36MIsxMJPE25
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX6xrnBOYQFljc
 /W+YyczSnLLAdXzCn1drqjlEHQ4wEdUIbdaqnlnN9ZMC9CdbcWglgS5MBsoxY2D52pquyvmZsex
 dwbxZgSvSIsfqiuJPGDGCjVGZDljYTc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX+F98XyB+iLwZ
 mXf9tavSyxPWlsWELxZnKRPFqVUtsJaygg6OR1GTyxGjLBz2iLaZPNIW8IAM9/NXCcZ98k777GR
 7VHhlgDXQ6SNiNVBxuZuAwS7WEfr0znKNACV8cat3KCbngQIEyV4otkuJbbOfcaAhRsDbht/jmh
 DDdIV8UVit72skMSON441sGwseLGA+cYJfeKu/I+lSRc92FXn4nhc6RTJu5K4N0KwkbQPZmuFab
 aToL0y8jU/oaHLEu9WGMZVbd5TfHmqsOTjxqfQx/Sc5jw5vkE689f8UfHzxutNBMAq9vbFCUA3A
 sqdZFSb/xr1EbOQxQMGfPagasWdlP9QIooyRFUkn33nw+5OiKCV9Z0pTlWp45ho4FmK3cqm39xw
 81uIHlY8OFo+gwWfwmmB6AahHbIZ9Z5Vf/Al9wXer7Li3khmNrzegtHXr9D6uycZrCU/9V00zzO
 f/LQSE8vrrH2SDb9w8A==
X-Proofpoint-ORIG-GUID: rB6Y2HbSQ0iAt6X7YqJB36MIsxMJPE25
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230004

Qualcomm Nord exposes the DesignWare XPCS register blocks through
separate direct-MMIO windows instead of the standard contiguous
MMD/register layout. Add accessors that translate MMD accesses to the
Nord windows:

  MMD 3 (PCS), standard registers: SR_XS at 0x0000
  MMD 3 (PCS), vendor registers:   VR_XS at 0x2000
  MMD 1 (PMA/PMD):                  SR_PMA at 0x3000
  MMD 31 (VEND2), standard regs:    SR_MII at 0x4000
  MMD 31 (VEND2), vendor registers: VR_MII at 0x5000

Each register uses a 32-bit MMIO stride. The vendor bit is removed from
the register index before calculating a vendor-window offset.

Select these accessors using the Nord synthetic XPCS ID, allow its
smaller direct-MMIO resource, and add the Nord USXGMII Clause 37
compatibility.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/pcs/Makefile        |  3 +-
 drivers/net/pcs/pcs-xpcs-plat.c | 17 +++++++-
 drivers/net/pcs/pcs-xpcs-qcom.c | 86 +++++++++++++++++++++++++++++++++++++++++
 drivers/net/pcs/pcs-xpcs-qcom.h | 16 ++++++++
 drivers/net/pcs/pcs-xpcs.c      | 13 +++++++
 include/linux/pcs/pcs-xpcs.h    |  1 +
 6 files changed, 134 insertions(+), 2 deletions(-)

diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
index 4f7920618b90051e839a74a7101aaaf055a77f74..3d7cf1a5cd0783078edcefc6dfec626af469495d 100644
--- a/drivers/net/pcs/Makefile
+++ b/drivers/net/pcs/Makefile
@@ -2,7 +2,8 @@
 # Makefile for Linux PCS drivers
 
 pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-plat.o \
-				   pcs-xpcs-nxp.o pcs-xpcs-wx.o
+				   pcs-xpcs-nxp.o pcs-xpcs-qcom.o \
+				   pcs-xpcs-wx.o
 
 obj-$(CONFIG_PCS_XPCS)		+= pcs_xpcs.o
 obj-$(CONFIG_PCS_LYNX)		+= pcs-lynx.o
diff --git a/drivers/net/pcs/pcs-xpcs-plat.c b/drivers/net/pcs/pcs-xpcs-plat.c
index e78a233fb198d940951064a71e8597c6c666bc9d..e013a5253a22651220e62352d03faabc3a3c3658 100644
--- a/drivers/net/pcs/pcs-xpcs-plat.c
+++ b/drivers/net/pcs/pcs-xpcs-plat.c
@@ -20,6 +20,7 @@
 #include <linux/sizes.h>
 
 #include "pcs-xpcs.h"
+#include "pcs-xpcs-qcom.h"
 
 /* Page select register for the indirect MMIO CSRs access */
 #define DW_VR_CSR_VIEWPORT		0xff
@@ -239,8 +240,14 @@ static int xpcs_mmio_write_c45(struct mii_bus *bus, int addr, int dev,
 		return xpcs_mmio_write_reg_direct(pxpcs, dev, reg, val);
 }
 
+static const struct dw_xpcs_plat_ops xpcs_qcom_ops = {
+	.reg_read = xpcs_qcom_reg_read,
+	.reg_write = xpcs_qcom_reg_write,
+};
+
 static struct dw_xpcs_plat *xpcs_plat_create_data(struct platform_device *pdev)
 {
+	const struct dw_xpcs_info *info;
 	struct dw_xpcs_plat *pxpcs;
 
 	pxpcs = devm_kzalloc(&pdev->dev, sizeof(*pxpcs), GFP_KERNEL);
@@ -248,6 +255,12 @@ static struct dw_xpcs_plat *xpcs_plat_create_data(struct platform_device *pdev)
 		return ERR_PTR(-ENOMEM);
 
 	pxpcs->pdev = pdev;
+	info = device_get_match_data(&pdev->dev);
+	if (!info)
+		return ERR_PTR(-EINVAL);
+
+	if (info->pcs == QCOM_NORD_XPCS_ID)
+		pxpcs->ops = &xpcs_qcom_ops;
 
 	dev_set_drvdata(&pdev->dev, pxpcs);
 
@@ -285,7 +298,7 @@ static int xpcs_plat_init_res(struct dw_xpcs_plat *pxpcs)
 	else
 		spc_size = pxpcs->reg_width * SZ_2M;
 
-	if (resource_size(res) < spc_size) {
+	if (!pxpcs->ops && resource_size(res) < spc_size) {
 		dev_err(dev, "Invalid reg-space size\n");
 		return -EINVAL;
 	}
@@ -452,8 +465,10 @@ DW_XPCS_INFO_DECLARE(xpcs_pma_gen4_3g, DW_XPCS_ID_NATIVE, DW_XPCS_PMA_GEN4_3G_ID
 DW_XPCS_INFO_DECLARE(xpcs_pma_gen4_6g, DW_XPCS_ID_NATIVE, DW_XPCS_PMA_GEN4_6G_ID);
 DW_XPCS_INFO_DECLARE(xpcs_pma_gen5_10g, DW_XPCS_ID_NATIVE, DW_XPCS_PMA_GEN5_10G_ID);
 DW_XPCS_INFO_DECLARE(xpcs_pma_gen5_12g, DW_XPCS_ID_NATIVE, DW_XPCS_PMA_GEN5_12G_ID);
+DW_XPCS_INFO_DECLARE(xpcs_qcom_nord, QCOM_NORD_XPCS_ID, DW_XPCS_PMA_ID_NATIVE);
 
 static const struct of_device_id xpcs_of_ids[] = {
+	{ .compatible = "qcom,nord-dw-xpcs", .data = &xpcs_qcom_nord },
 	{ .compatible = "snps,dw-xpcs", .data = &xpcs_generic },
 	{ .compatible = "snps,dw-xpcs-gen1-3g", .data = &xpcs_pma_gen1_3g },
 	{ .compatible = "snps,dw-xpcs-gen2-3g", .data = &xpcs_pma_gen2_3g },
diff --git a/drivers/net/pcs/pcs-xpcs-qcom.c b/drivers/net/pcs/pcs-xpcs-qcom.c
new file mode 100644
index 0000000000000000000000000000000000000000..63c95c951454819b62eb3fd00abcc6b529e2004b
--- /dev/null
+++ b/drivers/net/pcs/pcs-xpcs-qcom.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Qualcomm DesignWare XPCS platform helpers
+ *
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/io.h>
+#include <linux/mdio.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "pcs-xpcs.h"
+#include "pcs-xpcs-qcom.h"
+
+/* Qualcomm Nord direct MMIO XPCS windows. */
+#define QCOM_XPCS_SR_XS_BASE		0x0000
+#define QCOM_XPCS_VR_XS_BASE		0x2000
+#define QCOM_XPCS_SR_PMA_BASE		0x3000
+#define QCOM_XPCS_SR_MII_BASE		0x4000
+#define QCOM_XPCS_VR_MII_BASE		0x5000
+
+static int xpcs_qcom_reg_offset(int dev, int reg)
+{
+	switch (dev) {
+	case MDIO_MMD_PCS:
+		if (reg & DW_VENDOR)
+			return QCOM_XPCS_VR_XS_BASE +
+			       ((reg & ~DW_VENDOR) << 2);
+
+		return QCOM_XPCS_SR_XS_BASE + (reg << 2);
+
+	case MDIO_MMD_PMAPMD:
+		return QCOM_XPCS_SR_PMA_BASE + (reg << 2);
+
+	case MDIO_MMD_VEND2:
+		if (reg >= DW_VENDOR)
+			return QCOM_XPCS_VR_MII_BASE +
+			       ((reg - DW_VENDOR) << 2);
+
+		return QCOM_XPCS_SR_MII_BASE + (reg << 2);
+
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+int xpcs_qcom_reg_read(struct platform_device *pdev, void __iomem *reg_base,
+		       int dev, int reg)
+{
+	int offset, ret;
+
+	offset = xpcs_qcom_reg_offset(dev, reg);
+	if (offset < 0)
+		return offset;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = readl(reg_base + offset) & 0xffff;
+
+	pm_runtime_put(&pdev->dev);
+
+	return ret;
+}
+
+int xpcs_qcom_reg_write(struct platform_device *pdev, void __iomem *reg_base,
+			int dev, int reg, u16 val)
+{
+	int offset, ret;
+
+	offset = xpcs_qcom_reg_offset(dev, reg);
+	if (offset < 0)
+		return offset;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0)
+		return ret;
+
+	writel(val, reg_base + offset);
+
+	pm_runtime_put(&pdev->dev);
+
+	return 0;
+}
diff --git a/drivers/net/pcs/pcs-xpcs-qcom.h b/drivers/net/pcs/pcs-xpcs-qcom.h
new file mode 100644
index 0000000000000000000000000000000000000000..a1084f6a10a96baa8ba0d192ee64cdaed90da125
--- /dev/null
+++ b/drivers/net/pcs/pcs-xpcs-qcom.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __PCS_XPCS_QCOM_H
+#define __PCS_XPCS_QCOM_H
+
+#include <linux/io.h>
+#include <linux/types.h>
+
+struct platform_device;
+
+int xpcs_qcom_reg_read(struct platform_device *pdev, void __iomem *reg_base,
+		       int dev, int reg);
+int xpcs_qcom_reg_write(struct platform_device *pdev, void __iomem *reg_base,
+			int dev, int reg, u16 val);
+
+#endif /* __PCS_XPCS_QCOM_H */
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 7f5c7a275630f2b064e4b9abdd6c3619e9346cec..1f556b4f7c44f06f24a2f724734d3a7d71424de3 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1571,6 +1571,15 @@ static const struct dw_xpcs_compat nxp_sja1110_xpcs_compat[] = {
 	}
 };
 
+static const struct dw_xpcs_compat qcom_nord_xpcs_compat[] = {
+	{
+		.interface = PHY_INTERFACE_MODE_USXGMII,
+		.supported = xpcs_usxgmii_features,
+		.an_mode = DW_AN_C37_USXGMII,
+	}, {
+	}
+};
+
 static const struct dw_xpcs_desc xpcs_desc_list[] = {
 	{
 		.id = DW_XPCS_ID,
@@ -1584,6 +1593,10 @@ static const struct dw_xpcs_desc xpcs_desc_list[] = {
 		.id = NXP_SJA1110_XPCS_ID,
 		.mask = DW_XPCS_ID_MASK,
 		.compat = nxp_sja1110_xpcs_compat,
+	}, {
+		.id = QCOM_NORD_XPCS_ID,
+		.mask = DW_XPCS_ID_MASK,
+		.compat = qcom_nord_xpcs_compat,
 	},
 };
 
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index 4ea995b70150e33e1e1a47cc7aa324c53742fbdc..0f69e14b2a4c8d17b59a570debd14a77ab040182 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -26,6 +26,7 @@ enum dw_xpcs_pcs_id {
 	DW_XPCS_ID_NATIVE = 0,
 	NXP_SJA1105_XPCS_ID = 0x00000010,
 	NXP_SJA1110_XPCS_ID = 0x00000020,
+	QCOM_NORD_XPCS_ID = 0x00000030,
 	DW_XPCS_ID = 0x7996ced0,
 	DW_XPCS_ID_MASK = 0xffffffff,
 };

-- 
2.34.1

