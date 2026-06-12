Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF753E451B
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250690; cv=none; b=iYN0v4mMwBCa61yLhi7mtcMQi0mdZqh8KDaQK+Y4uURltnZHpHr2ot5QiwX7kUs94iSM3N5S5xkB07kqamGmZZTTI1QKFZPcDm1uWEhjoY72cC6PAuGr7uJ1O3hLul94jL8oIK4PWgOliInxJ5ItRiRjAKXS1lkVYjAr2o9GZ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250690; c=relaxed/simple;
	bh=wT17fasCVY58RXM79zQwGJz6hsTMwiV6P62U5dak2mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A557p7dGTPbL0+/J6727l0yz4cm7a2jAq+zeallfhEUQghLW1ooGSPLGMyiKN4zLrfCjZWD6YneqIckUV2zv/WQS9TuerGAPVThsJFwuDPSNalLQwi/+DaqHKHkmnCvp92dDqPCNKl7H5OcJiq01zTIjQcMnc6++A62qQpE/3bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kGgXHEGZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S3xk8ye0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGgXHEGZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S3xk8ye0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39XwL2516152
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tppbXbWsysNemVYhWaI+rXyFxyZof2TTBVFVw+fck/s=; b=kGgXHEGZ2fkgH7Lm
	+gRviykhGICt8ncxgsw5CAa/oglrJsV1mcR/VrRpZPPLhTjudZPP1QARXP8Jm09a
	bSrEy2fPdkTjNklZeNsQgvJt1btTShLo23fS9u7mMqv9PAaACZU0/kSgyrx+u7Q4
	jknOyyuXz/xuwREkpNX/BdCEYD+5O1crchDdts/JvIaJqVWDjokQ5IZ+aYHqsHop
	aIu6LVb/z/Y3r6tPgPvkWQxgxWMUMBymwkwZMtIfVbMeMP6YjXHoiLF7/A2pEFUP
	8kb1mhvmoSb0QtM65aH6OAbIX6qhCPonccmQXAaEC4Q4ImifuKRsKzxDISU3ROU2
	jqdO/Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r724t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:51:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85dc345ac8so392624a12.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250682; x=1781855482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tppbXbWsysNemVYhWaI+rXyFxyZof2TTBVFVw+fck/s=;
        b=S3xk8ye0qK+GcRIYNzOJkcN24QuciwJ73kvjTNPC0nBYPqrlP+xxVXfo6vIMc05trc
         M897T26AmUbYo83udNkZhQ/bUFgtWw3ZPI2ETJZ4LPu5+6x2E8KnrBvCqoOyNLXdRqNv
         GHDgzUCx4bsX5L4nQ+Wm8Lwr1lNVsHoeEpa5YekoJzRUN8IZB3+F5mZxXesCdxOzr0v7
         1k3vUZPfxfac4awUpo5SBJANYISyv9MXXWNB7GLvtpaaW5JP0qz2JVwzOLzlCk8ZyPu3
         gvEWt95RnJd2RSDPPJsqjeCbOYQxDoAGG1YUYVTjyMXV9eAyBM5qBRkZCgq9dhsh7bQq
         LnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250682; x=1781855482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tppbXbWsysNemVYhWaI+rXyFxyZof2TTBVFVw+fck/s=;
        b=FPsxrwNY8Xsg2+wkS7YcC4QBBtMWInf04ZWX1QGWzz7FZJvR25tyEuTKFrk4QGedHX
         8x+aUOK1pgZWumniIgnlCivfA6SWsQJDXRFCJ+g5xw8esARoMxBkKEK0a3JswH0iqGHn
         kgav51ccvbWrSj5TPmTO2F14slw4a4o2TGjq3bbN9095G6fvNtovEFlsf3Z+Shj5eQew
         AwO9ARSVMgynW8E1lRJfAhrkpqwhvWlLEKDjFqGhUKqBlUU/rh9W4uyYXZhcNWxiThxO
         K5KLCzfJtA3TRR1Y/ZncbuDqrusvkqdqImi2AXNy/ZJjCQE7NJjeA6wRDi64lZzYtKsT
         qVHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tcIxegYZvOs0EEenlFgly2IDefMA0jRdu7xmSCIIHGhFd93I3pKT0EnUxlMUkBM+RC1AN8EEuPdn5@vger.kernel.org
X-Gm-Message-State: AOJu0YxUGv/kqbXERQSUrL3myXlN9gUnbMZF1Hk8uX4coJxT00ECScL+
	VrHN9/ltDLpz23BcwAjoG7FfUSOKbyWb3w1YZd8mz+gBen29D/uWESQJTO9+QLYHEaYPZb5jwEK
	chx8jbTqPA87Zuscw1o/D9wUfINDCxJoYt5OevFNkmaziuPjqk0D/tP6rZPjBK98X
X-Gm-Gg: Acq92OGuiIEZNP/C+UGPlucUYkyxo7M05tmvZlQUM/3aC4Gp80KpBnxIywX42zGn+Nz
	Oue1kx7g/Cihhz/Bb2Mao1eKZqneF4AmcCtNyDpTBOa/Ek3uzkwtzIiHTxrDAKsKx9F4KUGhldR
	V7sxJJqX6e0LVC/qfCjIo7iJHIPx+wVr+jwPAKhFmTJr0b4l6hf7UN0Q16e5p5P1ipKOmGSYCp/
	DjF5gzgnRpjo+w2O0ru4vT3jBZy9WbNvw86pbSn5WW7XFBXMa8IUr+J59X6K4TR76l1xODxP8Sc
	UN4W1DgfOVway9ZRLyr2C4wBGDyYKXEvGaXJ6VcfMdxZZNjb/faqLJNkH+mVkvdXrpnmzNC2vxx
	zgrwE3ze7AFa8akQ9gE7UDFyomEyHzBqja48O98BFt4IEFfghM0rz0VBfSxnr0WX5QdyQ7ocele
	OHYVi7uK1LPxur5U8q9uzV3BOSxBvuEbInbK7k
X-Received: by 2002:a05:6a20:d492:b0:3b2:86a4:b01a with SMTP id adf61e73a8af0-3b783fca1damr2366960637.30.1781250681726;
        Fri, 12 Jun 2026 00:51:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:d492:b0:3b2:86a4:b01a with SMTP id adf61e73a8af0-3b783fca1damr2366920637.30.1781250681103;
        Fri, 12 Jun 2026 00:51:21 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661b5ab99sm1307544a12.6.2026.06.12.00.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:51:20 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Google-Original-From: Kathiravan Thirumoorthy <kathirav@qti.qualcomm.com>
Date: Fri, 12 Jun 2026 13:21:02 +0530
Subject: [PATCH v2 2/2] phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-ipq9650_pcie_phy-v2-2-b938cc2fc267@qti.qualcomm.com>
References: <20260612-ipq9650_pcie_phy-v2-0-b938cc2fc267@qti.qualcomm.com>
In-Reply-To: <20260612-ipq9650_pcie_phy-v2-0-b938cc2fc267@qti.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: pnwmfFP7VqZyG8VpYghzZTzAKrUTzNbi
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2bba7a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=SzMj-Qgm2C8wWq0MGEoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: pnwmfFP7VqZyG8VpYghzZTzAKrUTzNbi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfX8Y3tPYiDE/k0
 c1jgzMWp6ZxGujzFGAKhRdvukD24jnw5tnMbpBnWvmm2E1SzxLA40DPpIzhyYoSCPYkA/Qx1ayN
 lNrzwaHoD6vH8FtvnGxEPWXYz8GDLxwtCSdG8F5w4vrSfES23Uzmo3R21NfQR2UnLgcHjTpUCxW
 7VVjDcE8G2oaD3i28vd4CrildIdOkl5yqvYtoJpo9EQ/nsobDoCyqhkXzIecLj8f4knK8u0rfpD
 dNpIYL+uB60jrnSKy9Ma68UET/Jl9hIJS+5pVqrpdi4QytDd9jrnqJW0+Hoz89Ex454BE3CWyh2
 MeC91n0fG4f4D4GWdHEbvy4ZphMpmuigoQvTePgJ8viQASBEd3bQp23zZ7tECsJiawpBaIhiAwO
 LfZYxPTbwTtjvTSNUnKek6+0615or7uCCaNMQoGnF4HQSIOudWXEVvc4duFHbEvIept2ZSRfFp1
 L9YAfxOrERqobFORuBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfX8JZUNzk3TyCn
 DGIVhNOo/87CUswav30G+sH8emXYBqnf9cIRsz5qE+Vbt5i8//IFxtvZ8Nz2ia8/+dd/RlqsPHA
 l8UU6LJmLMBacxTGuoGGn+LrQSAjM+s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120069

From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Add support for the IPQ9650 platform, which includes three Gen3 x2 PCIe
controllers and two Gen3 x1 PCIe controllers. The PHY instances require
the on-chip refgen supply.

Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations along with
the refgen regulator supply. Note that an on-chip LDO, driven by the SoC
CX, supplies the PHY voltages without requiring software control. Note
that IPQ9650 does not support CX power collapse or rail scaling.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 220 +++++++++++++++++++++++++++++++
 1 file changed, 220 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index d3effad7a074..1b94c411321a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -857,6 +857,152 @@ static const struct qmp_phy_init_tbl ipq9574_gen3x2_pcie_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
 };
 
+static const struct qmp_phy_init_tbl ipq9650_pcie_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIAS_EN_CTRL_BY_PSM, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CLK_SELECT, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CMN_MODE, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CMN_CONFIG, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_RESETSM_CNTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_TIMER1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_TIMER2, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x68),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0xd4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYS_CLK_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_BUF_ENABLE, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BG_TIMER, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CLK_ENABLE1, 0x90),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE1, 0x53),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE1, 0x29),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE1, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_INTEGLOOP_GAIN1_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_INTEGLOOP_GAIN0_MODE1, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE2_MODE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE1, 0xb4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CORE_CLK_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER1, 0x7d),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CORECLK_DIV_MODE1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xa2),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x13),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xb5),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_pcie_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_HIGHZ_DRVR_EN, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0xb5),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PI_QEC_CTRL, 0x00),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_pcie_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_AUX_DATA_TCOARSE_TFINE, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_ENABLES, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_VGA_GAIN2_LSB, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_VGA_GAIN2_MSB, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL2, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DCC_CTRL1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_TX_ADAPT_PRE_THRESH1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_TX_ADAPT_PRE_THRESH2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_TX_ADAPT_POST_THRESH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_TX_ADAPT_MAIN_THRESH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x70),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_LOW, 0xd4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH2, 0xdb),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH3, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH4, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xe4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0xec),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0x67),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x35),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_pcie_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x25),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_G12S1_TXDEEMPH_M3P5DB, 0x10),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RATE_SLEW_CNTRL1, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG2, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_P2U3_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_DCC_CAL_CONFIG, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0x77),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_pcie_pcs_misc_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG2, 0x0d),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG4, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_INT_AUX_CLK_CONFIG1, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_EQ_CONFIG1, 0x1c),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_EQ_CONFIG2, 0x0b),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P2_P3_POST, 0x34),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P6_P7_PRE, 0x33),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P6_P7_POST, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P10_PRE, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P10_POST, 0x58),
+};
+
 static const struct qmp_phy_init_tbl qcs615_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_BIAS_EN_CLKBUFLR_EN, 0x18),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CLK_ENABLE1, 0x10),
@@ -3484,6 +3630,10 @@ static const char * const qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll",
 };
 
+static const char * const ipq9650_qmp_phy_vreg_l[] = {
+	"refgen",
+};
+
 static const char * const sm8550_qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll", "vdda-qref",
 };
@@ -3527,6 +3677,14 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v4x1 = {
 	.rx		= 0x0400,
 };
 
+static const struct qmp_pcie_offsets qmp_pcie_offsets_9650_v4x1 = {
+	.serdes		= 0,
+	.pcs		= 0x0600,
+	.pcs_misc	= 0x0a00,
+	.tx		= 0x0200,
+	.rx		= 0x0400,
+};
+
 static const struct qmp_pcie_offsets qmp_pcie_offsets_v4x2 = {
 	.serdes		= 0,
 	.pcs		= 0x0a00,
@@ -3802,6 +3960,62 @@ static const struct qmp_phy_cfg ipq9574_gen3x2_pciephy_cfg = {
 	.pipe_clock_rate	= 250000000,
 };
 
+static const struct qmp_phy_cfg ipq9650_gen3x1_pciephy_cfg = {
+	.lanes			= 1,
+
+	.offsets		= &qmp_pcie_offsets_9650_v4x1,
+
+	.tbls = {
+		.serdes		= ipq9650_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(ipq9650_pcie_serdes_tbl),
+		.tx		= ipq9650_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(ipq9650_pcie_tx_tbl),
+		.rx		= ipq9650_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(ipq9650_pcie_rx_tbl),
+		.pcs		= ipq9650_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(ipq9650_pcie_pcs_tbl),
+		.pcs_misc	= ipq9650_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(ipq9650_pcie_pcs_misc_tbl),
+	},
+	.reset_list		= ipq8074_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
+	.vreg_list		= ipq9650_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(ipq9650_qmp_phy_vreg_l),
+	.regs			= pciephy_v4_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+	.pipe_clock_rate	= 250000000,
+};
+
+static const struct qmp_phy_cfg ipq9650_gen3x2_pciephy_cfg = {
+	.lanes			= 2,
+
+	.offsets		= &qmp_pcie_offsets_v4x2,
+
+	.tbls = {
+		.serdes		= ipq9650_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(ipq9650_pcie_serdes_tbl),
+		.tx		= ipq9650_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(ipq9650_pcie_tx_tbl),
+		.rx		= ipq9650_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(ipq9650_pcie_rx_tbl),
+		.pcs		= ipq9650_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(ipq9650_pcie_pcs_tbl),
+		.pcs_misc	= ipq9650_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(ipq9650_pcie_pcs_misc_tbl),
+	},
+	.reset_list		= ipq8074_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
+	.vreg_list		= ipq9650_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(ipq9650_qmp_phy_vreg_l),
+	.regs			= pciephy_v4_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+	.pipe_clock_rate	= 250000000,
+};
+
 static const struct qmp_phy_cfg qcs615_pciephy_cfg = {
 	.lanes			= 1,
 
@@ -5558,6 +5772,12 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy",
 		.data = &ipq9574_gen3x2_pciephy_cfg,
+	}, {
+		.compatible = "qcom,ipq9650-qmp-gen3x1-pcie-phy",
+		.data = &ipq9650_gen3x1_pciephy_cfg,
+	}, {
+		.compatible = "qcom,ipq9650-qmp-gen3x2-pcie-phy",
+		.data = &ipq9650_gen3x2_pciephy_cfg,
 	}, {
 		.compatible = "qcom,kaanapali-qmp-gen3x2-pcie-phy",
 		.data = &qmp_v8_gen3x2_pciephy_cfg,

-- 
2.34.1

