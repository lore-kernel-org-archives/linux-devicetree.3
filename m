Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5294207A
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 00:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121904; cv=none; b=GGMa6oENbDHtjMaEbL9OcIab9xA4Jo8CyaezLcZ5Fv2GqquLApXshta235J0aAiwz+zzgEbKThfeG0pkton7SiENDXUL19CX+rHrm59BxN4fAfuNs3gvxwLNRNnTgLUBqF/x1MtgmXPYCpUvZQ9fSTwEjXYBRv6WsTpiAe00zaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121904; c=relaxed/simple;
	bh=ed4vbtYjyj1FMsT2CGuXKcms1U/AqYCuj5E6b3piyi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uv2miclYI9bBw57yj+JyChOy7eGGjEZQ+yVpUsN10Jphvbb48/mqmSBvS4GfrwejajqOxZe/lNZEJiogezxcOnxpBOqvLw90O7EdWwr67j0hDPGQy7CoiUMxbwfp1xi3mnpkpfukNA0txsDz8IHr3+MPsirjZNd4KkTpi0VyM1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jh4+osgx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XmYrbD9/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jh4+osgx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XmYrbD9/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6rq62033116
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 00:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e/ysu29aKJweaPEu9PZ8v1cCpqjGEqBIBOA3xJ0Rr20=; b=Jh4+osgxK7h37ICi
	LvSU3Qua0di2wwJYAbaUOmRCzDEzPY0S74pR+7tckH57zz3RWuIkiMUy96yAO61X
	T4iLN4fqSk9CHzc3+1t8vQU2WhAQsYm7sGmC/agcESIUWB/Gi6Ca+T+N4UF/HOyB
	8UwybVlwyaduY8Qy/or92e8N0GwEyLJyAIacmNVfk3qxNj/+mBsW6Lm3dMxb4Sdm
	fr74OxCpcHDXOvE5Rwe6L82Uns5kXleiyErF9SNrmenTd65tegZwpM3MgfyDH1Df
	WR5Sq9Z5AqdzddbCAaLKvSKKp4tqQ4TYbWN58f+0iMcaoBie7W4GSZO+a01Zxew2
	1Ps1VQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c1km5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 00:04:54 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1438492fb40so484755c88.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 17:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790121894; x=1790726694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e/ysu29aKJweaPEu9PZ8v1cCpqjGEqBIBOA3xJ0Rr20=;
        b=XmYrbD9/5JjrjffOIDl3FCnvBNLiLW3fQ4Yj6UND4OlbS3gPv7/Y41p41X7n9fokNc
         6p+O8jZP9d2iNpcpj8V83lGqvHovo8YaR9JC/RBBahBYDXM7q6TyBhrmNOw1c3iUdArX
         2lOK7LqBm69U3lgDtPGOPmZ5RTO+ju7iXywVF+1gA3NQGdQMLd6rYQmgO9jIdMrAVX5Q
         63m9Ik6OF1aPud9BofoZtxLEQINoe3qK4UJdj9yRJrT6QkVUxs+h1IgQqqzNHyygX/ib
         pGii4uPLp+clPOLSY1mpBJxZ4TWbVJjUXParsBYZyei3J0dZrhLTSMik3rlM7RNA5Ojv
         3ymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121894; x=1790726694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/ysu29aKJweaPEu9PZ8v1cCpqjGEqBIBOA3xJ0Rr20=;
        b=cgl8MU/nGmWW62UKZFqapF3Q2rTkqBd0xon8nWlZPaczvKBf9j1xkYc6RnvQ9Q2nQk
         PPnro10Mdl2kcSEC1gpAVZL/csySFjI4PRQi+eeP/vsH25HnMSMcl7nKpjJuE6X/zCe8
         k/rqQPQiyrQmaC44QayRiO0eRWlzkyLrJMRO2Q4lT4k0i8Kz2vn9EpWrF1zWiMTvJwqr
         vyZX3JbBPPAsTg+xiwSDC5Sc11pDT/XlWZ5RohVSPp0bnMJ9cY6MKejqXZSjy//Z3ts8
         K7ani8zpduXwxdqgSxzICKdgWMKN4BTssFp9atPLWC2x5lzYzGaiSGaX7S/REIdRJXP0
         MuTg==
X-Forwarded-Encrypted: i=1; AKwUvBxSPXnYNgzXFc7JbCH+yO89ucuW+hWB0xHSVJwybVdyAFR6OdeGGFJACvhKFpmjsw8a5TmF5Nja2s1u@vger.kernel.org
X-Gm-Message-State: AFuF++nvpYrFgvJXdJUkZTv0mLIzp1+7Bdw6xwdhmCV0AoVjXU3Tn2kB
	npnMNb5BtsmzjtLzdXJVN7JdOAqOhh3X5pKed3ThRWz0IzyGrTdazNtTjJPs/COu1jWLJp/HnZ/
	R//rkToClkw7qOzTMaMQu1jyY7oHoQRexj39sBrnrzQpRMAuGIKR4JuwXZ0Z5t8wk
X-Gm-Gg: AYBFou0fEZJLCaWNvLjidg2GUYeZud5opYJd3SX+MCWZOjSCzf+O7QxwUJ9kpqwOeP0
	LfCuIIqI15yAcLHENMEGHXUUa7q1qUrAWBYFf8+Qn2iFvRqAsIlSjUDo9GrbXZnMFW2RHZdynpz
	2gIO87SaMftWqRz1ejL5I9iR3pktXOiWxW37YuIsXUeiamKHELrAwVry8VQDH/aQEuk03zTuyDV
	G+Pp7cAPjy7B6PAO6GxN2eQ/SW90KTK2cCtM4pjoHkamz+Oe5rErXrekc9K2Ytf72euQy8Je1zt
	ErnqsOoAKSd5j0AZWPdHcrGnmvFWwNG8fXfzdYiO0ilTp5Z5IePXQhTjdp9qge8K9aCt3zgf9iA
	tQ60EEzoHodZPXbUAPGtngUCe/Z0pupTaFLDJgzA=
X-Received: by 2002:a05:7022:1402:b0:143:2719:566c with SMTP id a92af1059eb24-144f9198b49mr1187614c88.40.1790121893298;
        Tue, 22 Sep 2026 17:04:53 -0700 (PDT)
X-Received: by 2002:a05:7022:1402:b0:143:2719:566c with SMTP id a92af1059eb24-144f9198b49mr1187555c88.40.1790121892587;
        Tue, 22 Sep 2026 17:04:52 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fd955sm1688347eec.1.2026.09.22.17.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:04:52 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 05:34:19 +0530
Subject: [PATCH 3/3] phy: qcom: sgmii-eth: add Nord USXGMII support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-nord_ethernet_serdes-v1-3-f8ac1c487882@oss.qualcomm.com>
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
In-Reply-To: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790121872; l=17640;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=ed4vbtYjyj1FMsT2CGuXKcms1U/AqYCuj5E6b3piyi8=;
 b=9iw1gS9LvwyAoNdKif9vwnYW2s9eBv5f8J589WCt1NJdKSWSH4zJpcGI+qF0ezsfDaE0sFnS1
 UQOg/NmHgF3DWb36FwfkaIxoj87qJE6eVIZLxH93Qudjtao4cxN4pyu
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwMCBTYWx0ZWRfXzRJgZoOEQmLV
 MZcLgY2aOTgFwIBMch6KYGg4/3+UYckonWRdz1nC52d/IDR++AQh77qyIta3izocKqmnx7WWusE
 WSGz9a9mRt6MEc7xOH14meZ0RcWbfWtxgUOYlkOnXVrGoAe5CbCFZZWQGe+05LtEOlpDodRepMr
 70fm/wcM1iJHl/IoI46rKBCg8I2QKeiyELt0M50cm4x6jMAZH5yZyFciF+PTIYwmDkC3z+O+GX9
 t7PLN3m7DlGH03MbvzYai5PYZ+t9YIDg9bZnQpgPCVIWXnwd8wTOqKspvfneDf0B7OdpPvknLbh
 I9Omv/u7CxkFP53f1VTK+MmOsk7GxBBF5Dcg1UygqsjOuWWp0/LCdypwJ8NRRVOisNz8EswNin4
 8pF8fADZGU89uNyBORLHVLHNEN2gC/q36BNsEQoE32fddSiUTKkZ74iwll1R08y+LohuHZtesBa
 4jPP0eTY8qOG+L8nv+Q==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab317a6 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-j1QTKR700wLKSosX1UA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: zgVKVJXkm2Yo0CeX-m_vGybpoKE-1_hT
X-Proofpoint-GUID: zgVKVJXkm2Yo0CeX-m_vGybpoKE-1_hT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwMCBTYWx0ZWRfX27btC5jJsqzK
 Q+42bmGf0GnFrT6be5RzeZKh8fD27/L7kYrZ4X2htmxa17U6x4fn7IKz6JoTEo58JInNWmjIBcD
 CFJNdms1NJCj3qnU1ROCwGX+JFBn69w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230000

Nord uses a QMP v7 SerDes block which is an updated version of the
SGMII SerDes PHY IP.

The SGMII SerDes PHY supports multiple operating modes by programming
different SerDes line rates. The driver currently handles SGMII and
2500BASE-X configurations only.

Add support for configuring the SerDes to operate at 10.3125 Gbaud,
enabling both USXGMII and 10GBASE-R PHY interface modes. Finally, add a
driver compatible for Nord.

Select USXGMII as the initial interface mode for Nord. phy_power_on()
can run before the consumer calls set_mode(), so this ensures that the
first calibration selects the 10.3125 Gbaud programming sequence.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h      |   5 +
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h |   2 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    |   9 ++
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 166 ++++++++++++++++++++-
 4 files changed, 177 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h
index 4d8c962f5e0f52974f3edd5d1acdd8da535de200..67ab2fe085de3d90520cfc43cc0ac7abaab1f21d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h
@@ -10,11 +10,16 @@
 #define QPHY_PCS_POWER_DOWN_CONTROL			0x004
 #define QPHY_PCS_SW_RESET				0x008
 #define QPHY_PCS_LINE_RESET_TIME			0x00c
+#define QPHY_PCS_RETIME_BUFFER_EN			0x018
 #define QPHY_PCS_TX_LARGE_AMP_DRV_LVL			0x020
+#define QPHY_PCS_TX_LARGE_AMP_POST_EMP_LVL		0x024
 #define QPHY_PCS_TX_SMALL_AMP_DRV_LVL			0x028
+#define QPHY_PCS_TX_SMALL_AMP_POST_EMP_LVL		0x02c
+#define QPHY_PCS_RX_SIGDET_CTRL2				0x08c
 #define QPHY_PCS_PCS_READY_STATUS			0x094
 #define QPHY_PCS_TX_MID_TERM_CTRL1			0x0d8
 #define QPHY_PCS_TX_MID_TERM_CTRL2			0x0dc
+#define QPHY_PCS_SGMII_MISC_CTRL7			0x114
 #define QPHY_PCS_SGMII_MISC_CTRL8			0x118
 
 #endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h
index 7430f49214779855df1cf40acac96440957f9e6d..e8b4a26b361adab6e2b0bd3c91e719f84d1ffbc1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h
@@ -58,6 +58,7 @@
 #define QSERDES_V7_COM_CLK_ENABLE1				0xe0
 #define QSERDES_V7_COM_SYS_CLK_CTRL				0xe4
 #define QSERDES_V7_COM_SYSCLK_BUF_ENABLE			0xe8
+#define QSERDES_V7_COM_PLL_EN					0xec
 #define QSERDES_V7_COM_PLL_IVCO					0xf4
 #define QSERDES_V7_COM_PLL_IVCO_MODE1				0xf8
 #define QSERDES_V7_COM_SYSCLK_EN_SEL				0x110
@@ -75,6 +76,7 @@
 #define QSERDES_V7_COM_CMN_MISC_1				0x184
 #define QSERDES_V7_COM_CMN_MODE					0x188
 #define QSERDES_V7_COM_PLL_VCO_DC_LEVEL_CTRL			0x198
+#define QSERDES_V7_COM_BIN_VCOCAL_HSCLK_SEL_1			0x19c
 #define QSERDES_V7_COM_AUTO_GAIN_ADJ_CTRL_1			0x1a4
 #define QSERDES_V7_COM_AUTO_GAIN_ADJ_CTRL_2			0x1a8
 #define QSERDES_V7_COM_AUTO_GAIN_ADJ_CTRL_3			0x1ac
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h
index 6ab943ff57ff666e4f23f4ad0b4eff211c6dbfd0..0c38d62284e4d0e64a27fb82c468f47aee3760bb 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h
@@ -7,9 +7,11 @@
 #define QCOM_PHY_QMP_QSERDES_TXRX_V7_H_
 
 #define QSERDES_V7_TX_CLKBUF_ENABLE				0x08
+#define QSERDES_V7_TX_TX_EMP_POST1_LVL				0x0c
 #define QSERDES_V7_TX_RESET_TSYNC_EN				0x1c
 #define QSERDES_V7_TX_PRE_STALL_LDO_BOOST_EN			0x20
 #define QSERDES_V7_TX_TX_BAND					0x24
+#define QSERDES_V7_TX_SLEW_CNTL					0x28
 #define QSERDES_V7_TX_INTERFACE_SELECT				0x2c
 #define QSERDES_V7_TX_RES_CODE_LANE_TX				0x34
 #define QSERDES_V7_TX_RES_CODE_LANE_RX				0x38
@@ -35,26 +37,32 @@
 #define QSERDES_V7_RX_UCDR_FASTLOCK_COUNT_LOW			0x3c
 #define QSERDES_V7_RX_UCDR_FASTLOCK_COUNT_HIGH			0x40
 #define QSERDES_V7_RX_UCDR_PI_CONTROLS				0x44
+#define QSERDES_V7_RX_UCDR_PI_CTRL2				0x48
 #define QSERDES_V7_RX_UCDR_SB2_THRESH1				0x4c
 #define QSERDES_V7_RX_UCDR_SB2_THRESH2				0x50
 #define QSERDES_V7_RX_UCDR_SB2_GAIN1				0x54
 #define QSERDES_V7_RX_UCDR_SB2_GAIN2				0x58
 #define QSERDES_V7_RX_AUX_DATA_TCOARSE_TFINE			0x60
+#define QSERDES_V7_RX_RX_TERM_BW					0x80
 #define QSERDES_V7_RX_TX_ADAPT_PRE_THRESH1			0xc4
 #define QSERDES_V7_RX_TX_ADAPT_PRE_THRESH2			0xc8
 #define QSERDES_V7_RX_TX_ADAPT_POST_THRESH			0xcc
 #define QSERDES_V7_RX_VGA_CAL_CNTRL1				0xd4
 #define QSERDES_V7_RX_VGA_CAL_CNTRL2				0xd8
 #define QSERDES_V7_RX_GM_CAL					0xdc
+#define QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL1			0xe8
 #define QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL2			0xec
 #define QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL3			0xf0
 #define QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL4			0xf4
 #define QSERDES_V7_RX_RX_IDAC_TSETTLE_LOW			0xf8
 #define QSERDES_V7_RX_RX_IDAC_TSETTLE_HIGH			0xfc
+#define QSERDES_V7_RX_RX_IDAC_MEASURE_TIME			0x100
 #define QSERDES_V7_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1		0x110
+#define QSERDES_V7_RX_RX_OFFSET_ADAPTOR_CNTRL2			0x114
 #define QSERDES_V7_RX_SIGDET_ENABLES				0x118
 #define QSERDES_V7_RX_SIGDET_CNTRL				0x11c
 #define QSERDES_V7_RX_SIGDET_DEGLITCH_CNTRL			0x124
+#define QSERDES_V7_RX_RX_BAND					0x128
 #define QSERDES_V7_RX_RX_MODE_00_LOW				0x15c
 #define QSERDES_V7_RX_RX_MODE_00_HIGH				0x160
 #define QSERDES_V7_RX_RX_MODE_00_HIGH2				0x164
@@ -75,6 +83,7 @@
 #define QSERDES_V7_RX_DCC_CTRL1					0x1a8
 #define QSERDES_V7_RX_VTH_CODE					0x1b0
 #define QSERDES_V7_RX_SIGDET_CAL_CTRL1				0x1e4
+#define QSERDES_V7_RX_SIGDET_CAL_CTRL2_AND_CDR_LOCK_EDGE	0x1e8
 #define QSERDES_V7_RX_SIGDET_CAL_TRIM				0x1f8
 
 #endif
diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
index 029dafacee7853648ef24afd0d9c4b83a549badf..3c68bfe0ea443ef5cf7f17cead4974862dc04884 100644
--- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -15,7 +15,9 @@
 
 #include "phy-qcom-qmp-pcs-sgmii.h"
 #include "phy-qcom-qmp-qserdes-com-v5.h"
+#include "phy-qcom-qmp-qserdes-com-v7.h"
 #include "phy-qcom-qmp-qserdes-txrx-v5.h"
+#include "phy-qcom-qmp-qserdes-txrx-v7.h"
 
 #define QSERDES_QMP_PLL					0x0
 #define QSERDES_RX					0x600
@@ -221,6 +223,114 @@ static void qcom_dwmac_sgmii_phy_init_2p5g(struct regmap *regmap)
 	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_PHY_START, 0x01);
 }
 
+static void qcom_dwmac_sgmii_phy_init_10g(struct regmap *regmap)
+{
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SW_RESET, 0x01);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_POWER_DOWN_CONTROL, 0x01);
+
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_BG_TIMER, 0x0A);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_PLL_IVCO, 0x0F);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_PLL_BIAS_EN_CLK_BUFLR_EN, 0x07);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_CLK_ENABLE1, 0x0F);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_CP_CTRL_MODE0, 0x08);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_PLL_RCTRL_MODE0, 0x16);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_PLL_CCTRL_MODE0, 0x36);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_INTEGLOOP_GAIN0_MODE0, 0x1F);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_INTEGLOOP_GAIN1_MODE0, 0x00);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_PLL_EN, 0x03);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_SYSCLK_EN_SEL, 0x1A);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_LOCK_CMP1_MODE0, 0x23);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_LOCK_CMP2_MODE0, 0x43);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_DEC_START_MODE0, 0x43);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_DIV_FRAC_START1_MODE0, 0x00);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_DIV_FRAC_START2_MODE0, 0x38);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_DIV_FRAC_START3_MODE0, 0x02);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_VCO_TUNE1_MODE0, 0xE6);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_VCO_TUNE2_MODE0, 0x01);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_VCO_TUNE_INITVAL2, 0x00);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_HSCLK_SEL_1, 0x00);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_HSCLK_HS_SWITCH_SEL_1, 0x00);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_PLL_CORE_CLK_DIV_MODE0, 0x04);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_CORE_CLK_EN, 0x30);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_CMN_CONFIG_1, 0x16);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xD7);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0F);
+	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_BIN_VCOCAL_HSCLK_SEL_1, 0x11);
+
+	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_CLKBUF_ENABLE, 0x0D);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_TX_BAND, 0x04);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_SLEW_CNTL, 0x08);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_RES_CODE_LANE_OFFSET_TX, 0x09);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_RES_CODE_LANE_OFFSET_RX, 0x09);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_LANE_MODE_1, 0xF5);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_LANE_MODE_2, 0x06);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_LANE_MODE_3, 0x3F);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_LANE_MODE_4, 0x3F);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_LANE_MODE_5, 0x5F);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_RCV_DETECT_LVL_2, 0x12);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_TRAN_DRVR_EMP_EN, 0x0F);
+	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_TX_EMP_POST1_LVL, 0x2B);
+
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_FO_GAIN, 0x0D);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_SO_GAIN, 0x03);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_FASTLOCK_FO_GAIN, 0x0A);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7F);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_FASTLOCK_COUNT_LOW, 0x00);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x01);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_PI_CONTROLS, 0x81);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_PI_CTRL2, 0x81);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_SB2_THRESH1, 0x11);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_SB2_THRESH2, 0x22);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_TERM_BW, 0x03);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_VGA_CAL_CNTRL2, 0x08);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_GM_CAL, 0x0F);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL1, 0x04);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL2, 0x00);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4A);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL4, 0x5A);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_IDAC_TSETTLE_LOW, 0x80);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_IDAC_TSETTLE_HIGH, 0x01);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_IDAC_MEASURE_TIME, 0x20);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_SIGDET_CNTRL, 0x0F);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_SIGDET_DEGLITCH_CNTRL, 0x1E);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_BAND, 0x18);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_00_LOW, 0x1F);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_00_HIGH, 0xBF);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_00_HIGH2, 0xFF);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_00_HIGH3, 0xDF);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_00_HIGH4, 0xEF);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_01_LOW, 0xE5);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_01_HIGH, 0xC8);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_01_HIGH2, 0xC8);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_01_HIGH3, 0x14);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_01_HIGH4, 0xB6);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_10_LOW, 0xE0);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_10_HIGH, 0xC8);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_10_HIGH2, 0xC8);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_10_HIGH3, 0x3B);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_10_HIGH4, 0xB7);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_DCC_CTRL1, 0x0C);
+
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_LINE_RESET_TIME, 0x00);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_SMALL_AMP_DRV_LVL, 0x03);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_LARGE_AMP_DRV_LVL, 0x1A);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_SMALL_AMP_POST_EMP_LVL, 0x00);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_LARGE_AMP_POST_EMP_LVL, 0x0B);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_MID_TERM_CTRL1, 0x83);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_MID_TERM_CTRL2, 0x08);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_SIGDET_CAL_CTRL1, 0x00);
+	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_SIGDET_CAL_CTRL2_AND_CDR_LOCK_EDGE, 0x00);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_RX_SIGDET_CTRL2, 0xCC);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SGMII_MISC_CTRL7, 0x00);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SGMII_MISC_CTRL8, 0x14);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_RETIME_BUFFER_EN, 0x01);
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SW_RESET, 0x00);
+
+	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_PHY_START, 0x01);
+}
+
 static inline int
 qcom_dwmac_sgmii_phy_poll_status(struct regmap *regmap, unsigned int reg,
 				 unsigned int bit)
@@ -265,6 +375,40 @@ static int qcom_dwmac_sgmii_phy_poll_sgmii_ready(struct device *dev,
 	return 0;
 }
 
+static int qcom_dwmac_sgmii_phy_poll_usxgmii_ready(struct device *dev,
+						     struct regmap *regmap)
+{
+	if (qcom_dwmac_sgmii_phy_poll_status(regmap,
+					     QSERDES_QMP_PLL + QSERDES_V7_COM_C_READY_STATUS,
+					     QSERDES_COM_C_READY)) {
+		dev_err(dev, "QSERDES_COM_C_READY_STATUS timed-out");
+		return -ETIMEDOUT;
+	}
+
+	if (qcom_dwmac_sgmii_phy_poll_status(regmap,
+					     QSERDES_PCS + QPHY_PCS_PCS_READY_STATUS,
+					     QSERDES_PCS_READY)) {
+		dev_err(dev, "PCS_READY timed-out");
+		return -ETIMEDOUT;
+	}
+
+	if (qcom_dwmac_sgmii_phy_poll_status(regmap,
+					     QSERDES_PCS + QPHY_PCS_PCS_READY_STATUS,
+					     QSERDES_PCS_SGMIIPHY_READY)) {
+		dev_err(dev, "SGMIIPHY_READY timed-out");
+		return -ETIMEDOUT;
+	}
+
+	if (qcom_dwmac_sgmii_phy_poll_status(regmap,
+					     QSERDES_QMP_PLL + QSERDES_V7_COM_CMN_STATUS,
+					     QSERDES_COM_C_PLL_LOCKED)) {
+		dev_err(dev, "PLL Lock Status timed-out");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
 static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
 {
 	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
@@ -275,16 +419,19 @@ static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
 	case PHY_INTERFACE_MODE_1000BASEX:
 		/* 1.25Gbps mode */
 		qcom_dwmac_sgmii_phy_init_1g(data->regmap);
-		break;
+		return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
 	case PHY_INTERFACE_MODE_2500BASEX:
 		/* 3.125Gbps mode */
 		qcom_dwmac_sgmii_phy_init_2p5g(data->regmap);
-		break;
+		return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
+	case PHY_INTERFACE_MODE_USXGMII:
+	case PHY_INTERFACE_MODE_10GBASER:
+		/* 10.3125Gbps mode */
+		qcom_dwmac_sgmii_phy_init_10g(data->regmap);
+		return qcom_dwmac_sgmii_phy_poll_usxgmii_ready(dev, data->regmap);
 	default:
 		return -EINVAL;
 	}
-
-	return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
 }
 
 static int qcom_dwmac_sgmii_phy_power_on(struct phy *phy)
@@ -340,7 +487,9 @@ static int qcom_dwmac_sgmii_phy_validate(struct phy *phy, enum phy_mode mode,
 
 	if (submode == PHY_INTERFACE_MODE_SGMII ||
 	    submode == PHY_INTERFACE_MODE_1000BASEX ||
-	    submode == PHY_INTERFACE_MODE_2500BASEX)
+	    submode == PHY_INTERFACE_MODE_2500BASEX ||
+	    submode == PHY_INTERFACE_MODE_USXGMII ||
+	    submode == PHY_INTERFACE_MODE_10GBASER)
 		return 0;
 
 	return -EINVAL;
@@ -434,12 +583,19 @@ static int qcom_dwmac_sgmii_phy_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct qcom_dwmac_sgmii_phy_match_data nord_match_data = {
+	.default_interface = PHY_INTERFACE_MODE_USXGMII,
+};
+
 static const struct qcom_dwmac_sgmii_phy_match_data sa8775p_match_data = {
 	.default_interface = PHY_INTERFACE_MODE_SGMII,
 };
 
 static const struct of_device_id qcom_dwmac_sgmii_phy_of_match[] = {
 	{
+		.compatible = "qcom,nord-dwmac-sgmii-phy",
+		.data = &nord_match_data,
+	}, {
 		.compatible = "qcom,sa8775p-dwmac-sgmii-phy",
 		.data = &sa8775p_match_data,
 	},

-- 
2.34.1

