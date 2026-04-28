Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F5333B949
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 03:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777348623; cv=none; b=c8yjqBH4qXSEdnVswnLNotxTVUEdb1Dj6q29nfGxR/CrOo50kM/8bdOHYtYzI/8vWFtdTddgfudoWZ22Watn3MiTLmVJVVz2sRSqjLFiLpBlHf48ir2L4/GAkv2twww7c++l8Ul3xBrMrINl06FQ5yn3fKCXb6b0kq+FTSbiO78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777348623; c=relaxed/simple;
	bh=LCMjOJtIxtHep2v0soQ3sUv2MXiTZMrsIoi3l55k2cY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCsU/C95t9xY586dvHDq4W1nqwtF5Re8blHabxM0gCYnDtoK45TD2I3dob961VE1sNyORKO16GaAYBwwoRJVdh9OXPZxRShq4bw6DneDNComZTnTUcinDjl9xHWf5kgo0IoNOlue0ushCVIahqVU/AzxUuKkS4vklz1/A54p+U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J6S9AURY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VgACB+Bu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6S9AURY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VgACB+Bu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RJ3X3u2112607
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 03:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nayjuY7g5QVFWHFlaeUOOsPyzRCe/yAlG6cR/ITXMU0=; b=J6S9AURYZUukv+Zr
	gyWrCPTdgcBCVMGUW/dKCj3a+BTfRkxT4PB/7JZwydxo5q4lKeJ/9yG+/8bBouqf
	C7c5uBYCs65Ni+BQlyB02uh5PeIVRPuwqK0iL2M1qca+s8qAp7gugAT8aJDzMfaK
	0wa5lZ0x0+BVgTYK2EQuC906ZBwV+ibG43FnZKCjFp+YREHv5Fa6hjNIdr5sCemt
	KHhc181lKEAUUVN47C9HSGcXGyY9grVDLMs+nlNpPfFxPxQKiciWvYyGVk5sJbGh
	hIiL9WiR88B4dU54V+6ZoTJvgM4luA7kOSfDvderK7fLc0egj9js8nYbjXtTb3+j
	egBXiw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbhnh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 03:57:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fbb57764aso12736498a91.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 20:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777348620; x=1777953420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nayjuY7g5QVFWHFlaeUOOsPyzRCe/yAlG6cR/ITXMU0=;
        b=VgACB+Bu2mhs2bBzu0nzWKouo1xe3O/RrRnrTB8zAzotr/FepaTg58EJ8urJnUc8KR
         XNNAU6soOrnQ0wfZ6RW+rJW3P13qHSDWMbStzJNmPeUBT1yzTz/3U7ZEUCXwUCMeKlne
         DbcliM4fNGrazOmAtPSFoXyKRydKwX953Pv9YQ32Bb6P+JSBXIvhzN+Gk4+jcVSrouKP
         BDuB7WSk/pVXM6KzrEQwFexpiAzGvPOxqBsLJNwZHYdzvC216GA3f1fI4XTjrBcEIeqy
         hyUI/ijPGgclPigUtYs+7gkeiqZlc11WMAHDAUJclEfh9eV8b/fhnFKeglIlOFwwdumI
         bc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777348620; x=1777953420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nayjuY7g5QVFWHFlaeUOOsPyzRCe/yAlG6cR/ITXMU0=;
        b=nCNlgMFLiABs1voGt5DaMSTxoXfokUO9zPuxpgk+gbo87RUlAzE+bVDdz+vyupIj5F
         jIB8DPuSUbJB/tGc+pAUKUwlEqoYn1JKo7ShKnpnGq06ix0QaqCBJUGgBNy5vGMSq4Se
         ffZ9N6vFOBpECPo4w7060vrgUqCL2snNYmOq+5Zp0z4L2nVUZG7V7I4VBwmrKVnz0u/y
         tk9/M5ZDm2EywzkOlMmH81DdKKPpEvwpS6IKvyz9mj9sF+s8CmBovhcZcX+xsC+kIRrw
         wNiqTQcZFA9hE0TTcvV12/3EH0XSx578wZcD/Yu9INj/ipSoTEyK40CAxc+KvLpgIjxB
         r7Bw==
X-Forwarded-Encrypted: i=1; AFNElJ8Bvzo3VKPVl5igZjdpYDxEvEgPqed0Dy3OQ/tNmatLX8yoDLYkuDsHYAy/uq6W1qRUziUhGXVSWJtE@vger.kernel.org
X-Gm-Message-State: AOJu0Yys3/QvPrw7R29+tpAjpFEDZYNDueicn/wss2IrfCoGB60tQnJJ
	iB4Z3QPTyMToO1G+Sg2jVbtmga/6dzHcmDo5Axk93IUT0qFu6xHYr1Np9Z5M7iXhzjztlmOoo8d
	bxlaAsjUUfKz5EJedjSBwyhP2mEUhR0z4aCqMiHAUTHi7pXvaj6dNBRLbCgFyPnod
X-Gm-Gg: AeBDiet4kmLemUNcomb6I+CsqwwVABDiUaLoq8aTptrhB/l8dJZXjEe792tRITAHv+c
	QfnMAY/SUViLeQDiaDtVcGdyb/rmYtPdrcOYa4h7Z83Fp8kcvMbkLC20tcJ/Gt+0pxY1aarxKZs
	+uLe8pCVHuhdgUGrmqQjhPdfmyOw5NoNmwO4KCEJJXHfZjrER6Qt2niRFvMiWifdVOSidOAgayc
	bV8JLBGm/jvpAuaAEcXjOkKwblU6/105vXVuPNerbndFxkvf+GwFk7B8Qa7mR7hwgYfgzUrvZdS
	jXTUMdRhjSoKOmAPohONyes7MqB/9dVe48rN3kjcGISgZiBL1eEFZurpj+rWYYqmx9QAjc89UnA
	2uyqmUEh+qYris/tPke4/fau2RkX1BCC8A24uPMSMeEkRIDKbvRtFVbpaYAQDlCZySA==
X-Received: by 2002:a17:90b:498d:b0:35f:b4c1:91ea with SMTP id 98e67ed59e1d1-36491f5c2cdmr1037687a91.13.1777348620135;
        Mon, 27 Apr 2026 20:57:00 -0700 (PDT)
X-Received: by 2002:a17:90b:498d:b0:35f:b4c1:91ea with SMTP id 98e67ed59e1d1-36491f5c2cdmr1037657a91.13.1777348619642;
        Mon, 27 Apr 2026 20:56:59 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490905648sm393888a91.4.2026.04.27.20.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 20:56:59 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 09:24:15 +0530
Subject: [PATCH v3 09/12] media: iris: Add power sequence for Glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-glymur-v3-9-8f28930f47d3@oss.qualcomm.com>
References: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
In-Reply-To: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777348550; l=8487;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=LCMjOJtIxtHep2v0soQ3sUv2MXiTZMrsIoi3l55k2cY=;
 b=nfjm7b0evT/f9tkaR+ncTOk65SzCNldv27EHYSiOAFWi+CcZGjjlr0a/dEe7O6QIg4NO/KD2z
 CZlA/RgPIBiCh+Q/HGDIo2y7yORAcKaK9Qq59D6/UwaXwMfzHGSASt3
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: X1Jow0aDPWxvqyWnThmZeZuLnDRMwCjB
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f0300c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Js87xDwMZ--NYW6i2EgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: X1Jow0aDPWxvqyWnThmZeZuLnDRMwCjB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAzMyBTYWx0ZWRfXyWdQllv2/4iB
 wMFNL3wBpKogOgUeJLkSqyK6q3eno0NzmshDypaMCvrlPPfwYacQEESYHw6H4Cdvr70nEibDpRv
 TI80o2OtlmxBSbOFC0iJrZeAqccp965EGRnL+Q5wRe6y3KmUr6q/9QcvtHbbG3jnLPQNiVycvjP
 593otRpcGrd/ocJFZmoB8bxvahrJqPJgv4P7gw/U2wawoVB0lJAvP4R2Sgu64woRWJvQO3OwKsC
 f2E+Bn6Td/KrNjyPnufdDIbb5OQ3Y4Hh7cTRClKhdKh7i7DFh2CejTYiDkANGO9rS/X3+60vb2z
 m5M3Gj7d/GrrSCGzsaKaqeouoAFo7tFvHpVV/zCqUjf35CT/T2PgFDKwYTAtYXerBSwNduppTqo
 gtwJJYgPh8JK8Dfe+sQLKrjQJBmKCrsHat0nLVV0PbM/WX6JalXy9U1Bt6ad07bg/jlFxE0LlgT
 Euc97LASLk/PNaiwOeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280033

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

