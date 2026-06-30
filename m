Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA2F366836
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846233; cv=none; b=jJ1gBgfNgrS2f3YfKmbUUluj3/80J+zkvLcE/s6My3r4TKkXyZ7KNoWPiMemPrV+quzGHRx5eV4E2hodbuczUn+ha+Eg9sVQXDVsKBCkJF6mZ5QRM6fSrEVGC7mGeiCYkuLHQdR70LY3sA/hyWBmVf4itjFRrN2A9ETCsp+EyiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846233; c=relaxed/simple;
	bh=aTj5KtOb2vKiTmwN7SGIUjWosWnCNz+9xpIGl5k0Q6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=seTzedDjrIc9vmSlIPaOr+A+gs9VRElLAapIpVVg298X9N5Cr4IoDrLk952gYZmxlH9gmz/uQ5WL8FFgX/cB1jZvo8RpVg6MXNuDKzbqB9EVXRaODOZjMuTEEgU4dtjhoRKzW80/Tu8IvwL+CRUcwCrdDJ6Wsv+D4tAk0LWpCiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGTg82i4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fMXC/CMj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGTg82i4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fMXC/CMj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UHkfME2721427
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oHuJUjEsLPE8+q1YHV5zzKgadJG0CI5d9no3OMB8tgI=; b=DGTg82i4kwkz9Z2i
	i0dKZ2W5DizOcMxQq07RwhEMSkzS+eQZ2a2lMQz9leo6Rlb7Bv/3qqdP2pgLwc59
	gV5yArcplxVTnOs89rFgBw77fnnD2UpYk7JmbbRK28SNPEMZ7AS0SKQz65cNUL5D
	4D2aNOxEhGjhtBbpa/BUwWdBi9rU0tXkTDL4GjkTRJViCelTGqUgDjK615AS7O6F
	coIgnuw6rLqtVupywP5lszLueu6u/wxiggsEIrjiWb58iiUIkYadRoXsaH1ciNpa
	+sy6oQqLr2RGl+qUqSKaKbG0rjAN0Loc2mhm03Nisjd6D4enl0K6bCvL8saw2+0M
	69PT2A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4fc09gau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:03:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30ed53abff8so2507556eec.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782846230; x=1783451030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHuJUjEsLPE8+q1YHV5zzKgadJG0CI5d9no3OMB8tgI=;
        b=fMXC/CMjXsy/2STGgGK0O4zUFkiu8ni3H2LqZ+yN7eqhxptIjMxtKHG69rBBn2OxjQ
         ZS9WjP3mU12CooLBcOnGETycXExBWRzCl5427ILQfOzVNtjOeaavPF7q3uXPV/vwOGnZ
         jdQuiSSAVkO7V+XMjS8a7deFsQ7fWbeQXF+aUBDwF1duMaKencWTSo4qF1m5l4WeZH7J
         UQRYURaWBYnXfEXU5ZDHRemoCYWmEZpgp8YES6TwDHamwGvXhMOdW875zC5Znbz8dLkt
         qRGDP1VkRtzWy+30D6z3l567cqaxWPau8nSyMv8cb7vETgZQlt0938s2LDhoA9V3Ifjx
         bwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782846230; x=1783451030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHuJUjEsLPE8+q1YHV5zzKgadJG0CI5d9no3OMB8tgI=;
        b=ekfW4aapTpA9JQsu88/msR/tQITg5CuFdGD5YtfF71extJcfukKGKU0cNXDuOl58NA
         wVEW/qyGMUQWD7cwQhJdrntlKAjfG8Uthuyr4evbM7cUsVdikZDrR1yD7EOpHr18Fcxy
         HAbUKUbWlEcUe19JJtwHNlBUCdYBk1dvdw9qR1zEnfypGmKjKOCO1lzws4eWc6NuYKgR
         VqmXb7nwuDBqkABmUYYoK62n/bltSwqbT/eaecptT0REB9gzbRPHN3m5om+2K49w1sXn
         jUOiLj1Lcx+NRGnhTMxVRqr834bJ3g7zFirXi3099Kda2vACjoVE4HGMoy3GHrFX3vPV
         H0Gg==
X-Forwarded-Encrypted: i=1; AHgh+RqwNkL2WbI9iE382tRv2UsxK8Vjm96jz0ERur8dKPCAfsrGyxVpebYVKnP8v14v2IxBgWWLFkmBV/9+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0qwREIxPfoc5gteG67tE4ij75s6YkxgI/ORBJ0BAyoB1HtZgQ
	Nfw/NrtiNYCbNfoEnUbnTdZ2OWgQo+1JsKXDs9COHb9ntjvmq698cmQjy7rQzNOVFQBJbi6H2ho
	lcITGKB/EryEMLJgD1zVOFbX9AsSHbnvf+WEagirZfcKT0xfZVilinKR6uBudr2qq
X-Gm-Gg: AfdE7cmbyHDJNqcNsHKPSXLk4UV/suLAOngy1raUU+eWGb5OyuACI7QCNEbWsT2KYyb
	r6bmp+LEo0FCK5/Z6IToq7J7DfWlpWeGLdFqkFpuS1gYiAw6nT/is35IX+c0PGGU8V2GhUm+y5m
	6lFMiiu79hRKQUiKNxF23Z22f/otKSs0k5EmzngyvEu3tmB53Xm/ihyj4GAVAzAqR/V4FCKEIc3
	U6pgxytnyBR1Q44/qgz3v0sw19oOCbiBHni3+WV3nLzGxxg6Pjqnz1+dY6dNeS9QkBkt1EgmPNp
	o517DTuFWC5EW4AdzHIjBPsAeu7hV5SyzBNXg0DqOO3QF/ZPfb5Kw77IwJ9K9gjcpab+kvNdGx8
	sezBho7yokZNZ8+rnr1nKxjQ8XBR53xzrvOA5qPczxiMp5Nw=
X-Received: by 2002:a05:693c:3b09:b0:30a:e531:3153 with SMTP id 5a478bee46e88-30ee1364aa7mr3098958eec.14.1782846229954;
        Tue, 30 Jun 2026 12:03:49 -0700 (PDT)
X-Received: by 2002:a05:693c:3b09:b0:30a:e531:3153 with SMTP id 5a478bee46e88-30ee1364aa7mr3098927eec.14.1782846229412;
        Tue, 30 Jun 2026 12:03:49 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm14963815eec.15.2026.06.30.12.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 12:03:49 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 00:32:47 +0530
Subject: [PATCH 5/9] phy: qcom: qmp-pcie: Add QMP PCIe PHY support for
 Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-shikra-upstream-v1-5-e1a721eb8943@oss.qualcomm.com>
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
In-Reply-To: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782846191; l=4605;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=aTj5KtOb2vKiTmwN7SGIUjWosWnCNz+9xpIGl5k0Q6c=;
 b=ER7t5GpY8BCdpCJ5MWHClaDuV0E+hdJ/MSN/uvgkbK96tWDinblCHwJUS1wdTjtMfsTTnJaf6
 UydD3evw4f7DPopz5l5nKvZyaMOWwnzLerA4xCDfFwGdp2jHWv5xZVS
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfXzEs0txvf4bnj
 Wnp+0fcttGLI1BgBuqiROhujTfXrgArCZKGNqm7NfTL4YITj0nkk2pum9nCU6JaMw2F/P9B9/aH
 6YRrJoJFQVcESlh2+Gy9/jpP0OIUMo1DVXduizri75u3TzNTW8rUzVefVw4XCju1p3/BSE827uE
 amNCwWNT5rzWvJggNgDpI9H7YmBRypox20YcH0WL2y1trtTvRyjAZNyDvt+SLkuNnbOutMMJw/I
 p1stuxkuKy/gbxCu9ERVsgzA+77KPYaaRxfOc00Y2v4VmvfGL0vnSzPRgM+QwYv9Ws+QoWLYEyK
 uG0/WVGPoZ0WqIRe9oxDvecyonGyJSpG4UfVOSv83l865Li/hzBKW+4nUhlIoc/UVXzQFOi4d/N
 ydgAnxU0jkdktKo/pvIthO84cGz5mt8Z/sY5Hon1PZlmGFCYUJ6BM2V83G24xnUG3mIJQh1SWyx
 hQwsRXRIi4SFxrWNh+Q==
X-Proofpoint-GUID: GU37i9x5WStyxBCyZ89Hu9MqLz-dpJ4Y
X-Proofpoint-ORIG-GUID: GU37i9x5WStyxBCyZ89Hu9MqLz-dpJ4Y
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=6a441317 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=iLgwJ6eFgLmkID89yw0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX5qyT9cWbCoE7
 aRYCr+k98AnLMVMlKUgQ+MVk7jyt+LDSBLBIGMUkjrZYbYYLFF7GsLeT/movbQFsyO8k1CFfJ/9
 Qw8MNSSee1PVYfaCV1HbVQtX2c1oKIM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300182

Add QMP PCIe PHY Gen2x1 support.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 73 ++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index d3effad7a074..e0995e4d5f2d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -2172,6 +2172,50 @@ static const struct qmp_phy_init_tbl sdx65_qmp_pcie_pcs_lane1_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_LANE1_INSIG_MX_CTRL2, 0x00),
 };
 
+static const struct qmp_phy_init_tbl shikra_pcie_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_BIAS_EN_CLKBUFLR_EN, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CLK_ENABLE1, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_BG_TRIM, 0xf),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_LOCK_CMP_EN, 0x1),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_VCO_TUNE_MAP, 0x0),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_VCO_TUNE_TIMER1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_VCO_TUNE_TIMER2, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CMN_CONFIG, 0x6),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_PLL_IVCO, 0xf),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_HSCLK_SEL, 0x0),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SVS_MODE_CLK_SEL, 0x1),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CORE_CLK_EN, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CORECLK_DIV, 0xa),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_RESETSM_CNTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_BG_TIMER, 0x9),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SYSCLK_EN_SEL, 0xa),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_DIV_FRAC_START3_MODE0, 0x3),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_DIV_FRAC_START2_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_DIV_FRAC_START1_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_LOCK_CMP3_MODE0, 0x0),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_LOCK_CMP2_MODE0, 0xd),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_LOCK_CMP1_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CLK_SELECT, 0x35),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SYS_CLK_CTRL, 0x2),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SYSCLK_BUF_ENABLE, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CP_CTRL_MODE0, 0x4),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_PLL_CCTRL_MODE0, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_INTEGLOOP_GAIN1_MODE0, 0x0),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_INTEGLOOP_GAIN0_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_BIAS_EN_CTRL_BY_PSM, 0x1),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_BG_TIMER, 0xa),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SSC_EN_CENTER, 0x1),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SSC_PER1, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SSC_PER2, 0x1),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SSC_ADJ_PER1, 0x2),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SSC_ADJ_PER2, 0x0),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SSC_STEP_SIZE1, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SSC_STEP_SIZE2, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CLK_EP_DIV, 0x19),
+};
+
 static const struct qmp_phy_init_tbl sm8450_qmp_gen3_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SYSCLK_EN_SEL, 0x08),
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CLK_SELECT, 0x34),
@@ -3911,6 +3955,32 @@ static const struct qmp_phy_cfg sdm845_qhp_pciephy_cfg = {
 	.phy_status		= PHYSTATUS,
 };
 
+static const struct qmp_phy_cfg shikra_pciephy_cfg = {
+	.lanes			= 1,
+
+	.offsets		= &qmp_pcie_offsets_v2,
+
+	.tbls = {
+		.serdes		= shikra_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(shikra_pcie_serdes_tbl),
+		.tx		= qcs615_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(qcs615_pcie_tx_tbl),
+		.rx		= qcs615_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(qcs615_pcie_rx_tbl),
+		.pcs		= qcs615_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(qcs615_pcie_pcs_tbl),
+	},
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= pciephy_v2_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+};
+
+
 static const struct qmp_phy_cfg sm8250_qmp_gen3x1_pciephy_cfg = {
 	.lanes			= 1,
 
@@ -5603,6 +5673,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sdx65-qmp-gen4x2-pcie-phy",
 		.data = &sdx65_qmp_pciephy_cfg,
+	}, {
+		.compatible = "qcom,shikra-qmp-gen2x1-pcie-phy",
+		.data = &shikra_pciephy_cfg,
 	}, {
 		.compatible = "qcom,sm8150-qmp-gen3x1-pcie-phy",
 		.data = &sm8250_qmp_gen3x1_pciephy_cfg,

-- 
2.43.0

