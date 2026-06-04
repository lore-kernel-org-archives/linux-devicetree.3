Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C323DA7CB
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555886; cv=none; b=N+fwapDb79/6oNdH/6HkbAp9+itj18HWnbpfsM6olK7Rgkz/PU5MH6f74zXvaaneSYmA1Luj8tI00SKw2oJB7nl0ZkcDfjj3JQhrPZEexFdoF5IwizFbsamfsmsK+wz/4dgI0w6haJG3e6v3OyhcITL2SoI2iRQdonkTo5pqLkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555886; c=relaxed/simple;
	bh=QrJa6QmmVo43BgQCLwXV/uHCInZpAJ510TCi/NxzQ2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hgi6FE2RPSJxZnOIjJTJbWM7ZKGb1Xq9yDptfSPM37k0AmgshGQgTLvOY4SzygK8HWdIZ2m18m6LoZ/2bQ5cmZvYxGLeWS3ilO42sdENy9bCuTA8O1iB75G1IyLBNA0b9ylJXYrlSD8E7aOYieata5eS1MzOBkwjGO4ncHkGHZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z6bp/Iyx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ETAeVR39; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z6bp/Iyx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ETAeVR39"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6545PktN994671
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 06:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k6/s/Ll2pjRqqTLT2vU5HLBxfu7d8ihaQntI6L6D3aY=; b=Z6bp/IyxDMGZ1QPL
	JbAyHzWhmWo4VCYjqWtaKFNk0M1B2SPQ1o/2T01EKz6T9CtljeABoUSdG3LYvX1Y
	3v1jPLVz6CfmMsqupXsGNcnMnE2xG+qVBv1Zt8nCS01hw/eI6h5XJ3xWBcWCBfu8
	Ft+1dWNU1xBY2dbv6WCx4GDqbjS+LeH9i4zv6vdtq7BORstVgQUE5JmGrhBGvYBu
	vWeDstYhv4cUgm3lPpNuyRMWi7wZmVhFgqYHrX4iZ2xS1vPSsnE4cYz2P5d612MN
	ibJxuEI0cuks8sFV28FS4BY1et9SO6nJ+0oAMi3k1nPIZ4+3h85JBM0+8V5/uuLN
	qlvuIQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek374r8kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:51:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8421f5d76aaso301420b3a.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780555883; x=1781160683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6/s/Ll2pjRqqTLT2vU5HLBxfu7d8ihaQntI6L6D3aY=;
        b=ETAeVR39bXvd3mJz8zNzAL0lC1Br3tjjjT9LAXNxsMS6OB5KjOVixRaz1kmhlAhCVr
         VuEpxTMxIMBN6wD2/DtSMF3aTDMzxsFk8qtUk/WpzxEtC7c4LahVRf2WKVx/JCrQtLn3
         R/R/edjvTKX7eOqb21u0vgxVuNEySXlt9/5wpSNfniggQKJ4sn0WKtTbicy/Yl/tdS62
         46TtdYnvlbUfgUajcy2vgffy35gfaA0k1KWPbjThtvDLZpIWT0wjy23ZNoLctTmoOUhD
         rDCG7LysmL57O66lEK2vY/ouNmGFileFvIAOLYboMho01IkliMBZynE9mo1OAE1aJf/i
         +m/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555883; x=1781160683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k6/s/Ll2pjRqqTLT2vU5HLBxfu7d8ihaQntI6L6D3aY=;
        b=WJvpO8DCL6g3+1QNRT7vUvKIfaKIDLRIQz65zBHxls6Nyc1zO262/PDJHZaE7NSqcF
         KuiOcnsc+nM3nTF9u3wHxyf7qjPtWc35bJy4klkF/pEo1eIioNgPydPKjtKyG17cv+MP
         zM3kbDmG6kbWYTrhyD5QgmbQM+/vFoo9fl/5IBzT13vQwp4QJ8sXmUeq3ORqGZUG+xrX
         0nIsQQHBD4BTiZGNBEAD2/GfPGD4Z4wFXWy/onpqROu4rorOwxmA9vGAJsxjlWgl6jSs
         3gQkAbZEvZc4ElIUK29bon/n3jVcgjwagFbmuTu8jxtkGyYNXrytwIeD1xNuuMThtHzM
         T0uA==
X-Forwarded-Encrypted: i=1; AFNElJ+i0AMtvh4d7fJ1FUKwdNZ83sPG6VGQegZXmuHOrWjcfUn2/jwc0cwM309bLJ7kFLwD7vUJDTK4ccvK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6p8GQNXNrV5WrWCMYf8AsoigLT39MlQBoYaEKkAgawGaqm5Xv
	vm2I3Zym3cPyNfmOWpeqYN7H+Ia5iEXDUYmeQt0U9Le7UHdIlZJTbbMYH2vSjK1c4o6UaoOEV7t
	+Cwu4Skp0c8NgfUhMmYNgVXat749AIAY+OZHCyvXz15los5CtXZDokOOVi9k1ezCAX639Dut5
X-Gm-Gg: Acq92OHAsek1kDH5eqGbURJr0kl7gtBN3JRzc77XytqTDJzzwsiU5lpoQKtIjDtRIVh
	4CtVK9GEUgr602wnCXcaCXorqyK5Qrerx71PBR+QqpW5ADDgmDIOQaUf4jbz5aEuhj4pkZIMx6s
	WUdI/8J8WgbuhbgfL7/G4CXlwHKUIOVx1Oo7gAkyCtnBdv4OkAruzTXXzTs2AFXBIx77xVChiaH
	nW0IP+CYIhwrqvNyWvZNoxXuN+/E/mpyNzZUBq/Gjwi4LpZuDKJM6DQxTGUb4U1u7+uhLT9qOpj
	epSiAfPZ4v9k3A40OknVJe47HDnwfryi34rm2BhJP4kL+BVy56Q5p2hLwP45y/fsKvIqnMCRqBZ
	f4PAT7h4TlCQ9lHuJ0DhB4mD0D3G5Hzinch4ZLJnbPI6wndGBxGjDTp8rhHZyMwywsA==
X-Received: by 2002:a05:6a00:4508:b0:842:6a3b:60c9 with SMTP id d2e1a72fcca58-84284f5fc0amr6035146b3a.24.1780555883202;
        Wed, 03 Jun 2026 23:51:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:4508:b0:842:6a3b:60c9 with SMTP id d2e1a72fcca58-84284f5fc0amr6035112b3a.24.1780555882616;
        Wed, 03 Jun 2026 23:51:22 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842823512b0sm5365894b3a.15.2026.06.03.23.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:51:22 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 12:20:38 +0530
Subject: [PATCH v3 4/4] spi: qcom-geni: Enable SPI on SA8255p Qualcomm
 platforms
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-enable-spi-on-sa8255p-v3-4-43984eac4c67@oss.qualcomm.com>
References: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
In-Reply-To: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780555855; l=4719;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=QrJa6QmmVo43BgQCLwXV/uHCInZpAJ510TCi/NxzQ2c=;
 b=lwPiOOh3IqZUDjL+lepayZg6zcoWUToaF9SOWtOuc4HJ+XQ/C6yzEFNV1n7md+nBIjEASB/Ru
 SPlmNW6H75xAAvQYb+2lacnWRvDYBtE25gAAyI7qaFH1/tNO5rTTFKW
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA2NCBTYWx0ZWRfXw2rvLU2gpFmk
 5x0QCEhF5aiUv/lrc13iG9zdqVdkNFMPtV6VAVkiW9lZlHxsj7LjQ6F+GeXF0ggUlqtSlb7a4BO
 3FpWgYvgDLo7KmBsg40LDpQlAf+Hx+jGH8KNLW9H553sw+62kkadtLaywIn6jXE91LC73Ioru7e
 gUvZTtVf4b+9Qjx1w65XFxNcp23eMRJdiWpgY2ipUt2AS35iHGiP3TUhM55vFRHOdNAPWI/UxOY
 RQOL1KWySDEcktaZfJypYu74BwBrg007YvySbmWCJvoyiGI0NZL6RAeYSdGbu+eEcz1scnHzTWp
 shbEunflEEZsQRPVJ5AEMz2LgeR7XaN6Un0GsSO/KOuLxczb/x8ywO639gw0Kk4BFVHCaJvm+j5
 CfIAKJYbvcYSSgTEmraE9rX37yw+uY9oPzrBQtAYkUKz+HJv8ibLpjm/zLDvAHgEwyozdV3Wjvz
 PsTGFz8a1alK7vKfVTw==
X-Proofpoint-GUID: bEUWqlXWlNfrZx_032LgwN1NTrkEuD1Q
X-Proofpoint-ORIG-GUID: bEUWqlXWlNfrZx_032LgwN1NTrkEuD1Q
X-Authority-Analysis: v=2.4 cv=eJsjSnp1 c=1 sm=1 tr=0 ts=6a21206c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=L4oeRUVQnX-q_C5JrjwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040064

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power states(on/off).

The SCMI performance protocol manages SPI frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate.

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 47 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 420534937695..1b92fb1bd8bf 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -78,6 +78,13 @@
 #define GSI_CPHA		BIT(4)
 #define GSI_CPOL		BIT(5)
 
+struct geni_spi_desc {
+	int (*resources_init)(struct geni_se *se);
+	int (*set_rate)(struct geni_se *se, unsigned long clk_freq);
+	int (*power_on)(struct geni_se *se);
+	int (*power_off)(struct geni_se *se);
+};
+
 struct spi_geni_master {
 	struct geni_se se;
 	struct device *dev;
@@ -105,6 +112,7 @@ struct spi_geni_master {
 	struct dma_chan *tx;
 	struct dma_chan *rx;
 	int cur_xfer_mode;
+	const struct geni_spi_desc *dev_data;
 };
 
 static void spi_slv_setup(struct spi_geni_master *mas)
@@ -305,11 +313,12 @@ static void spi_setup_word_len(struct spi_geni_master *mas, u16 mode,
 	writel(word_len, se->base + SE_SPI_WORD_LEN);
 }
 
-static int geni_spi_set_clock_and_bw(struct spi_geni_master *mas,
-					unsigned long clk_hz)
+static int geni_spi_set_clock_and_bw(struct geni_se *se,
+				     unsigned long clk_hz)
 {
+	struct spi_controller *spi = dev_get_drvdata(se->dev);
+	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 	u32 clk_sel, m_clk_cfg, idx, div;
-	struct geni_se *se = &mas->se;
 	int ret;
 
 	if (clk_hz == mas->cur_speed_hz)
@@ -820,7 +829,7 @@ static int setup_se_xfer(struct spi_transfer *xfer,
 	}
 
 	/* Speed and bits per word can be overridden per transfer */
-	ret = geni_spi_set_clock_and_bw(mas, xfer->speed_hz);
+	ret = mas->dev_data->set_rate(&mas->se, xfer->speed_hz);
 	if (ret)
 		return ret;
 
@@ -1064,7 +1073,9 @@ static int spi_geni_probe(struct platform_device *pdev)
 	mas->se.wrapper = dev_get_drvdata(dev->parent);
 	mas->se.base = base;
 
-	ret = geni_se_resources_init(&mas->se);
+	mas->dev_data = device_get_match_data(&pdev->dev);
+
+	ret = mas->dev_data->resources_init(&mas->se);
 	if (ret)
 		return ret;
 
@@ -1120,7 +1131,8 @@ static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
 	struct spi_controller *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 
-	return geni_se_resources_deactivate(&mas->se);
+	return mas->dev_data->power_off ?
+	       mas->dev_data->power_off(&mas->se) : 0;
 }
 
 static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
@@ -1129,9 +1141,11 @@ static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 	int ret;
 
-	ret = geni_se_resources_activate(&mas->se);
-	if (ret)
-		return ret;
+	if (mas->dev_data->power_on) {
+		ret = mas->dev_data->power_on(&mas->se);
+		if (ret)
+			return ret;
+	}
 
 	if (mas->se.has_opp)
 		return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
@@ -1177,8 +1191,21 @@ static const struct dev_pm_ops spi_geni_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(spi_geni_suspend, spi_geni_resume)
 };
 
+static const struct geni_spi_desc geni_spi = {
+	.resources_init = geni_se_resources_init,
+	.set_rate = geni_spi_set_clock_and_bw,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
+};
+
+static const struct geni_spi_desc sa8255p_geni_spi = {
+	.resources_init = geni_se_domain_attach,
+	.set_rate = geni_se_set_perf_opp,
+};
+
 static const struct of_device_id spi_geni_dt_match[] = {
-	{ .compatible = "qcom,geni-spi" },
+	{ .compatible = "qcom,geni-spi", .data = &geni_spi },
+	{ .compatible = "qcom,sa8255p-geni-spi", .data = &sa8255p_geni_spi },
 	{}
 };
 MODULE_DEVICE_TABLE(of, spi_geni_dt_match);

-- 
2.34.1

