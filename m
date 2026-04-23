Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FDC2DCF62
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 13:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951084; cv=none; b=XFwQEdOthzc+xkUdJlhJZ0zLfBr3rqxkWBsczwm7VKqZliA38d90p+PELXHT9YWRGtBc7jtlrlsOy9eJDYlbjfGz82NVI0GssWUrRsEqq/jXwvJb5QrUiMYABOrwSPVZi//+lvgYI8CCkQQ7Y/r4Bd73oeONXLfgbTXxukkioj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951084; c=relaxed/simple;
	bh=LCMjOJtIxtHep2v0soQ3sUv2MXiTZMrsIoi3l55k2cY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VGnEbsQs7mQqbvL47p8E4yB4cFhD+tZc7J0SHtS1tDzUQWmELTOkhVwzXSwxwKPg23uMznYwgtzdyMKiPfXyJChjH1uKyCXJuO8dF0NAJa+a9UjvDMP1a/7XLrVEsSjqhH7wi3zVsPRuluvjZhXaVq3+jg8ZgghphHFK91aHJBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OEV6R9wW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dsrnMlnI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OEV6R9wW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dsrnMlnI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uP2B3769521
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 13:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nayjuY7g5QVFWHFlaeUOOsPyzRCe/yAlG6cR/ITXMU0=; b=OEV6R9wWKHsBjjF4
	W0ZtMmUQMdnWtR/CrwHpgS5TF6gdu71dGYtNDWcS8PnyBCH1PU7ftb8P+0NydsBc
	/Bdd7ZMSg+6VlXFOBIH77Ck5DDsdBQkHz876b3qEy2FJ0L2GrKYU0W1hhWehGcL2
	8uOW5qV4iuA8L02NZMn20k7Vfo55r5VLbhDOSmcobpYtlSKIKojmZ71U4ZfzrG3u
	Dboqlp57bjjRMg6L5xumzMR84Al8yQOFOVVLtYrptHTydkc91VyPOHlnlPCQkIAJ
	pVukQdi4EoY/i4h9bruVn/IK4kZxdMpGEDdn1gVGhN5CQtA3U1VVz0MzbT72/YqS
	+BcogQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hq42g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 13:31:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b458add85aso67750185ad.2
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 06:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776951081; x=1777555881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nayjuY7g5QVFWHFlaeUOOsPyzRCe/yAlG6cR/ITXMU0=;
        b=dsrnMlnII3QZaIEH6EtxkW3AoCHtBP17Vb5cNKciNy4PteA21Z6FmmnoVUl1CoHpe2
         mk+2CR6nE7oB/uClRdesuALNdizBslgaGpIvrpiZALZiKihZgCLkjX53Zi78so/8+L99
         ATvw88iNayGeCG0gwX2kbdTTAHfXkr0T5xOt2867v58uvdC7XOEkJKhNKVnZNNy0qaaj
         XcMPBbscdQ7TqK8lIbS32HoW45AIkIFB0ZfSntFCkaTkVE30+sNs3HxRa+seQbHmoCUM
         3TRPYGl1PshVHkEb/eQlhCiC5X3d/ZClsxu3qUWIYpEuCIHwUcUWsZdPCu17EGiOXyq9
         RN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776951081; x=1777555881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nayjuY7g5QVFWHFlaeUOOsPyzRCe/yAlG6cR/ITXMU0=;
        b=lSZqCRKNspuMSwhXbeWJH0wEVsIP+ONmv4kpzM2cafFJXBdhcy5mGMFix1HX9qMTnb
         jcFkZZUjMQ5cSzM607bjSbAAa1gIIcxHdKWsmgm/AsVnGXRzuGNI7pfYsLhoewmj+c6Z
         zWeklQtBuDNnkpPlz3+5qi64kud80pTu8wA+yJxWsWqrXKgaAvnf0wkSlr4+d0QWLW5F
         YIoYu9f2li08FRjOQdG0QujF0OwX5jajUGc+eTza8LC/9DJZJjPX+YfNKU+zaZaVaMlj
         01V5vkGeOX+xpQGskPAHiX4s4LmeSR6N714phpe671YnILm4wKj8pLYZgqh2frmRmpfP
         zaJA==
X-Forwarded-Encrypted: i=1; AFNElJ8+ZB5QWi5dFrpwpxIlPr8A1wp/mynUet3Jf5uvYcNx4mHvwSzBAPgaKIXpOeUByzpMhK3UQqylU10X@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5lZlQfuDCwjaMjeO15kyli74g3ACRPcXpq8Atoz+0iAQUxtBU
	LOZvU0JA+ysuMdCQhUIQK497e2PPo/COM/Tb0EhzGjaI4/DIJnguO7+btduLM3FSPWnSRSLC8Nv
	883nFUwcYfzpgWQvODKM0OA1iKpYGzaawYN2HRWdHVf2WHf3YXNURN9GDx9uAO+/7
X-Gm-Gg: AeBDiev+9hYUrZ4khudeLelezajDTs0gGknLSWNqNkuplAKKi3uKzBl/dFexVbuf6FZ
	sq/qU1zSuZBsLVzRl63qru551T1NF92JV2V4CMc4U/aV4DIix+NvUpwaT34vE3bE9AXb4LRDDYk
	QU5r0Jsgc9ldiQDHqtnb4vNUaZtL5yMAdVn7N29ZbreIeuoPSL0yWmebfbGPSRkPsZQQPa92T9T
	fMZgLgZyBg2oBiurhl2Niq3yt46AJePLYEXesuw21KAKe+BVE8MfesuUQ5XS6rHFhpnJpVeXgHU
	41OVmBNEXVd753IlbhPhNrXa8InWbxkfRkujO6LAzIdoLnTWPl0F3kU+RziPJK0BkS4ProVBU4A
	+Z+HkX67dMuu8Iw77nUWQFj3sHufPl7h+QzSYfugoq61SRwpifpwf5rjT33B6od1k2Q==
X-Received: by 2002:a17:902:76c3:b0:2b4:6281:60c0 with SMTP id d9443c01a7336-2b5f9f527efmr211823025ad.35.1776951080416;
        Thu, 23 Apr 2026 06:31:20 -0700 (PDT)
X-Received: by 2002:a17:902:76c3:b0:2b4:6281:60c0 with SMTP id d9443c01a7336-2b5f9f527efmr211821615ad.35.1776951078971;
        Thu, 23 Apr 2026 06:31:18 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm198795635ad.54.2026.04.23.06.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:31:18 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 18:59:38 +0530
Subject: [PATCH v2 09/13] media: iris: Add power sequence for Glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-glymur-v2-9-0296bccb9f4e@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
In-Reply-To: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776950985; l=8487;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=LCMjOJtIxtHep2v0soQ3sUv2MXiTZMrsIoi3l55k2cY=;
 b=7X/KgTns18PVEGW+JrZHBV69wODcTX7hJ2smtGg1g7f1oG/DnqCmvhadmTbY/a4SUjPS/a2+w
 69rqAkfhfBwCWSwyuhuGWmWYYSCS7QeYMV5zBevR560DXNeInl5+Klh
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEzNCBTYWx0ZWRfXxS+qWcWbCzOV
 vtUsWjOq5tf4B5B0vu6yJnayjQ4lWQiE6iNm36KQEE2vu/GW5JGo1jXGBdf+IleKKelkOb3hzuE
 kjyat8OA/3rpbSyIOL90KXHu5pAg5upQkD//DnpD4xRtfncQVLQrH1GFyfcsYvSIsFwAvYU9b5s
 InJq4QfOkFZlul2ANbK//+22fR2iHn0w9iP7OhfTxNQlU/ASpJm4plWqzb8mg0Ds8oN+gmendzC
 Y328cSqK8Xk0ticmJxUf0t1WjzGxkY9BIwf6CB3wiWSZvcc2NmgFel8AfxslHCytP+dxXEl3mnZ
 avNDX0JWMd37JEMoJLUU95Mk6t8gdkqT1StfHor4TFKXPufH3zqcksKgypKeIn+12vt3qcKxMgv
 ZtRNjJzyDF15Lg9ioT7DA8fN1wCeUiWRDVTngebIPwOOxApeoo41tec8owgmeOgpoY4Sb8pcrQd
 pxpDIqaodpD5zuW9oaA==
X-Proofpoint-ORIG-GUID: 1eIALZsjEHCG9OGYGWtRgBH4FqASZyjc
X-Proofpoint-GUID: 1eIALZsjEHCG9OGYGWtRgBH4FqASZyjc
X-Authority-Analysis: v=2.4 cv=TJt1jVla c=1 sm=1 tr=0 ts=69ea1f29 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Js87xDwMZ--NYW6i2EgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230134

Glymur has a secondary video codec core (vcodec1), equivalent to the
primary core (vcodec0), but with independent power domains, clocks,
and reset lines. Reuse the existing code wherever possible and add
power sequence for vcodec1.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 122 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |   7 ++
 4 files changed, 134 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 7d59e6364e9d..8995136ad29e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -61,6 +61,9 @@ enum platform_clk_type {
 	IRIS_VPP0_HW_CLK,
 	IRIS_VPP1_HW_CLK,
 	IRIS_APV_HW_CLK,
+	IRIS_AXI_VCODEC1_CLK,
+	IRIS_VCODEC1_CLK,
+	IRIS_VCODEC1_FREERUN_CLK,
 };
 
 struct platform_clk_data {
@@ -210,6 +213,7 @@ enum platform_pm_domain_type {
 	IRIS_VPP0_HW_POWER_DOMAIN,
 	IRIS_VPP1_HW_POWER_DOMAIN,
 	IRIS_APV_HW_POWER_DOMAIN,
+	IRIS_VCODEC1_POWER_DOMAIN,
 };
 
 struct platform_pd_data {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index a9f43dbfc695..bd70d1c0ea76 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -27,6 +27,16 @@ static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
 	return pwr_status ? false : true;
 }
 
+static bool iris_vpu36_hw1_power_collapsed(struct iris_core *core)
+{
+	u32 value, pwr_status;
+
+	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
+	pwr_status = value & BIT(4);
+
+	return !pwr_status;
+}
+
 static void iris_vpu3_power_off_hardware(struct iris_core *core)
 {
 	u32 reg_val = 0, value, i;
@@ -260,6 +270,110 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
 	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 }
 
+static int iris_vpu36_power_on_hw1(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, IRIS_VCODEC1_POWER_DOMAIN);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_VCODEC1_CLK);
+	if (ret)
+		goto err_disable_hw1_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_VCODEC1_FREERUN_CLK);
+	if (ret)
+		goto err_disable_axi1_clk;
+
+	ret = iris_prepare_enable_clock(core, IRIS_VCODEC1_CLK);
+	if (ret)
+		goto err_disable_hw1_free_clk;
+
+	ret = iris_genpd_set_hwmode(core, IRIS_VCODEC1_POWER_DOMAIN, true);
+	if (ret)
+		goto err_disable_hw1_clk;
+
+	return 0;
+
+err_disable_hw1_clk:
+	iris_disable_unprepare_clock(core, IRIS_VCODEC1_CLK);
+err_disable_hw1_free_clk:
+	iris_disable_unprepare_clock(core, IRIS_VCODEC1_FREERUN_CLK);
+err_disable_axi1_clk:
+	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC1_CLK);
+err_disable_hw1_power:
+	iris_disable_power_domains(core, IRIS_VCODEC1_POWER_DOMAIN);
+
+	return ret;
+}
+
+static int iris_vpu36_power_on_hw(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_vpu35_power_on_hw(core);
+	if (ret)
+		return ret;
+
+	ret = iris_vpu36_power_on_hw1(core);
+	if (ret)
+		goto err_power_off_hw;
+
+	return 0;
+
+err_power_off_hw:
+	iris_vpu35_power_off_hw(core);
+
+	return ret;
+}
+
+static void iris_vpu36_power_off_hw1(struct iris_core *core)
+{
+	u32 value, i;
+	int ret;
+
+	if (iris_vpu36_hw1_power_collapsed(core))
+		goto disable_power;
+
+	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+	if (value)
+		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
+		ret = readl_poll_timeout(core->reg_base + VCODEC1_SS_IDLE_STATUSN + 4 * i,
+					 value, value & DMA_NOC_IDLE, 2000, 20000);
+		if (ret)
+			goto disable_power;
+	}
+
+	writel(REQ_VCODEC1_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
+				 value, value & NOC_LPI_VCODEC1_STATUS_DONE, 2000, 20000);
+	if (ret)
+		goto disable_power;
+
+	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+
+	writel(VCODEC1_BRIDGE_SW_RESET | VCODEC1_BRIDGE_HW_RESET_DISABLE, core->reg_base +
+	       CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(VCODEC1_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+
+disable_power:
+	iris_genpd_set_hwmode(core, IRIS_VCODEC1_POWER_DOMAIN, false);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC1_CLK);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC1_FREERUN_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC1_CLK);
+	iris_disable_power_domains(core, IRIS_VCODEC1_POWER_DOMAIN);
+}
+
+static void iris_vpu36_power_off_hw(struct iris_core *core)
+{
+	iris_vpu35_power_off_hw(core);
+	iris_vpu36_power_off_hw1(core);
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
@@ -284,3 +398,11 @@ const struct vpu_ops iris_vpu35_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 };
+
+const struct vpu_ops iris_vpu36_ops = {
+	.power_off_hw = iris_vpu36_power_off_hw,
+	.power_on_hw = iris_vpu36_power_on_hw,
+	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
+	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
+	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index f6dffc613b82..99e75fb4b10d 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -12,6 +12,7 @@ extern const struct vpu_ops iris_vpu2_ops;
 extern const struct vpu_ops iris_vpu3_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;
+extern const struct vpu_ops iris_vpu36_ops;
 extern const struct vpu_ops iris_vpu4x_ops;
 
 struct vpu_ops {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 72168b9ffa73..37f234484f1b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -7,6 +7,7 @@
 #define __IRIS_VPU_REGISTER_DEFINES_H__
 
 #define VCODEC_BASE_OFFS			0x00000000
+#define VCODEC1_BASE_OFFS			0x00040000
 #define AON_MVP_NOC_RESET			0x0001F000
 #define CPU_BASE_OFFS				0x000A0000
 #define WRAPPER_BASE_OFFS			0x000B0000
@@ -14,6 +15,8 @@
 #define AON_BASE_OFFS				0x000E0000
 
 #define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
+#define VCODEC1_SS_IDLE_STATUSN			(VCODEC1_BASE_OFFS + 0x70)
+#define DMA_NOC_IDLE				BIT(22)
 
 #define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
 #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
@@ -35,6 +38,8 @@
 #define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
 #define CORE_BRIDGE_SW_RESET			BIT(0)
 #define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
+#define VCODEC1_BRIDGE_SW_RESET			BIT(2)
+#define VCODEC1_BRIDGE_HW_RESET_DISABLE		BIT(3)
 
 #define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
 #define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
@@ -52,11 +57,13 @@
 #define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
 #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
 #define REQ_POWER_DOWN_PREP			BIT(0)
+#define REQ_VCODEC1_POWER_DOWN_PREP		BIT(1)
 
 #define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
 #define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
 #define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
 #define NOC_LPI_STATUS_ACTIVE			BIT(2) /* Indicates the NOC is active */
+#define NOC_LPI_VCODEC1_STATUS_DONE		BIT(8)
 
 #define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
 #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)

-- 
2.34.1

